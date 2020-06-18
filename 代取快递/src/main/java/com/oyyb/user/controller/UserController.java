package com.oyyb.user.controller;

import com.oyyb.address.service.AddressServiceImpl;
import com.oyyb.common.config.enums.ExceptionEnums;
import com.oyyb.common.config.utils.SpringSecurityUtil;
import com.oyyb.employee.service.EmployeeServiceImpl;
import com.oyyb.user.model.UserInfo;
import com.oyyb.user.model.vo.UserInfoVo;
import com.oyyb.user.service.IUserService;
import com.oyyb.user.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import com.oyyb.address.model.Address;

/**
 * @author: oyyb
 * @data: 2020-04-24
 * @version: 1.0.0
 * @descript:
 */

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private IUserService userService;

    @Autowired
    private AddressServiceImpl addressService;

    @Autowired
    private EmployeeServiceImpl employeeService;

    //发送验证码
    @GetMapping("code")
    public ResponseEntity<String> code(HttpServletRequest request,HttpServletResponse response){

        userService.code(request,response);
        return ResponseEntity.ok("ok");
    }

    //查询用户信息 返回一个jsp
    @GetMapping("queryByusername")
    public ResponseEntity<UserInfo> queryUserInfo(String username){

        UserInfo info = userService.queryUserByUsername(username);

        return ResponseEntity.ok(info);
    }

    //获取用户信息以及发布单号、快递地址
    @GetMapping("queryUserRlease")
    public ModelAndView queryUserRlease(Integer page){
        ModelAndView mv = userService.queryUserRlease(page);
        mv.setViewName("user/user_release_content");
        return mv;
    }



    //获取用户的详情并返回jsp
    @GetMapping("query")
    public ModelAndView query(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();

        UserInfo info = userService.queryUserByUsername(SpringSecurityUtil.username(request));
        modelAndView.addObject("userinfo",info);
        modelAndView.setViewName("user/user_center_content");
        return modelAndView;
    }

    //修改用户信息
    @PutMapping("update")
    @ResponseBody
    public String updateUserInfo(UserInfo userInfo){
        userService.updateUserInfo(userInfo);
        return "ok";
    }


    //注册
    @PostMapping("/register")
    public String register(UserInfo userInfo,@RequestParam("code")String code) throws Exception {

        boolean register = userService.register(userInfo,code);

        return register?"redirect:login.jsp":"redirect:register.jsp";
    }

    //查询 正在派送 已完成 未付款
    @GetMapping("findAll")
    public ModelAndView findAll(@RequestParam(name = "status",required = false) Byte orderStatus,
                                @RequestParam(name = "pay",required = false) Byte isPay,
                                @RequestParam(name = "page",required = false) Integer page,
                                @RequestParam(name = "flag",required = false)Integer flag){
        ModelAndView mv = employeeService.findByStatusOrPayAndPage(orderStatus,isPay,page);
        if (flag == null){
            mv.setViewName("user/user_orders_content");
        }else if (flag == 1){
            mv.setViewName("user/user_orders");
        }

        return mv;

    }

    //提醒派送 flag:1 投诉信息
    @PostMapping("reminder")
    public ResponseEntity<String> reminder(@RequestParam(name = "name") String name,
                                           @RequestParam(name = "msg",required = false) String msg,
                                           @RequestParam(name = "flag",required = false) Integer flag,
                                           @RequestParam(name = "oid",required = false)Long oid){

        ExceptionEnums enums = userService.reminder(name,msg,flag,oid);

        return ResponseEntity.status(enums.getCode()).body(enums.getMsg());
    }

    //查询所有用户
    @GetMapping("queryAll")
    public ModelAndView queryAll(UserInfoVo userInfoVo){

        ModelAndView mv = userService.queryAll(userInfoVo,userInfoVo.getPage());

        mv.setViewName(userInfoVo.getFlag() == 0 ? "admin/admin_user_content" : "admin/admin_user" );
        return mv;
    }

}
