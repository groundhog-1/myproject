package com.oyyb.controller;

import com.oyyb.domain.UserDetail;
import com.oyyb.domain.UserInfo;
import com.oyyb.service.UserInfoService;
import com.oyyb.utils.BCryptPasswordEncoderUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserInfoController {
    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private BCryptPasswordEncoderUtils passwordEncoderUtils;

    @RequestMapping("/login")
    public void login(UserInfo userInfo,String cli_checkCode, HttpServletRequest request, HttpServletResponse response) throws Exception{
//        校验验证码
        HttpSession hs=request.getSession();
        String serv_checkCode= (String) hs.getAttribute("CHECKCODE_SERVER");
        response.setContentType("text/html;charset=utf-8");
        if(serv_checkCode==null || !serv_checkCode.equalsIgnoreCase(cli_checkCode)){
            response.getWriter().write("验证码错误。");
            return;
        }
        hs.removeAttribute("CHECKCODE_SERVER");


        UserInfo user= userInfoService.login(userInfo);
        response.setContentType("text/html;charset=utf-8");
        if(user==null){
            response.getWriter().write("用户名名不存在。");
            return;
        }
        if(!passwordEncoderUtils.matches(userInfo.getPassword(),user.getPassword())){
            response.getWriter().write("密码错误。");
            return;
        }
        hs.setAttribute("user",user);
        response.getWriter().write("ok");
    }

    @RequestMapping("/loginout")
    public void loginout(HttpServletRequest request,HttpServletResponse response) throws Exception{
        request.getSession().removeAttribute("user");
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write("ok");
    }

    @RequestMapping("/vip")
    public void vip(@RequestParam("userid") Integer userid,
                    @RequestParam(value = "permissionid",required = false)Integer permissionid,
                    HttpServletResponse response) throws Exception{
        userInfoService.addVip(userid,permissionid);
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write("ok");

    }

    @RequestMapping("/addCourse")
    public void addCourse(@RequestParam("userid") Integer userid,
                          @RequestParam("courseid") String courseid,
                          HttpServletResponse response) throws Exception{
        userInfoService.addCourse(userid,courseid);
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write("ok");
    }

    @RequestMapping("/sendEmailCode")
    public void sendEmailCode(String email, HttpServletResponse response) throws Exception {
        userInfoService.sendEmailCode(email);
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write("ok");
    }

    @RequestMapping("/register")
    public @ResponseBody boolean register(UserInfo userInfo,
                                         @RequestParam("cli_checkCode") String cli_checkCode,
                                         @RequestParam(value = "username",required = false) String username) throws Exception{

        return userInfoService.register(userInfo,cli_checkCode,username);
    }

    @RequestMapping("/updateUser")
    public void updateUser(UserDetail userDetail,
                           @RequestParam(value = "avator_img",required = false)MultipartFile avator,
                           HttpServletResponse response) throws Exception{
       userInfoService.updateDtail(userDetail,avator);
       response.setContentType("text/html;charset=utf-8");
       response.getWriter().write("ok");

    }

}
