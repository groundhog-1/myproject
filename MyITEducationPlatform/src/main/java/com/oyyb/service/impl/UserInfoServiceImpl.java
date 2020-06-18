package com.oyyb.service.impl;

import com.oyyb.dao.*;
import com.oyyb.domain.UserDetail;
import com.oyyb.domain.UserInfo;
import com.oyyb.service.UserInfoService;
import com.oyyb.utils.BCryptPasswordEncoderUtils;
import com.oyyb.utils.MailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;
import java.util.UUID;

@Service("/userinfoService")
public class UserInfoServiceImpl implements UserInfoService {
    @Autowired
    private UserInfoDao userInfoDao;
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private PermissionDao permissionDao;
    @Autowired
    private MyCoursesDao myCoursesDao;
    @Autowired
    private EmailCodeDao emailCodeDao;
    @Autowired
    private UserDetailDao userDetailDao;

    private static BCryptPasswordEncoderUtils passwordEncoderUtils=new BCryptPasswordEncoderUtils();

    private Timer timer;
    private TimerTask task;

    @Override
    public UserInfo login(UserInfo userInfo) {
        return userInfoDao.findUserInfo(userInfo);
    }

    @Override
    public void addVip(Integer userid, Integer permissionid) throws Exception {
        if(permissionid==null){
            permissionid=1;
        }
        userInfoDao.saveVip(userid,permissionid);
        HttpSession hs=request.getSession();
        UserInfo userInfo= (UserInfo) hs.getAttribute("user");
        userInfo.setPermission(permissionDao.findByUserId(userid));
        hs.setAttribute("user",userInfo);
    }

    @Override
    public void addCourse(Integer userid, String courseid) throws Exception {
        myCoursesDao.addMycourse(userid,courseid);
        HttpSession hs=request.getSession();
        UserInfo userInfo= (UserInfo) hs.getAttribute("user");
        userInfo.setCourses(myCoursesDao.findCoursesByUserId(userid));
        hs.setAttribute("user",userInfo);
    }

    @Override
    public void sendEmailCode(String email) throws Exception {
        if(email==null||"".equals(email)){
            return;
        }
        try{
            String checkCode=getCheckCode();
            MailUtils.sendMail(email,checkCode,"飞升IT教育网");
            String code=emailCodeDao.findByEmail(email);
            if (code!=null){
                emailCodeDao.updateCodeByEmail(email,checkCode);
            }else{
                emailCodeDao.save(email,checkCode);
            }
            if(timer==null){
                timer=new Timer();
            }
            if(task!=null){
                task.cancel();
                task=null;
            }
            task=new TimerTask() {
                @Override
                public void run() {
                    try {
                        emailCodeDao.removeEmailCode(email);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    timer.cancel();
                    timer=null;
                }
            };
            timer.schedule(task,1000*60*5);
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("UserInfoServiceImpl 邮件发送异常");
        }

    }

    @Override
    public boolean register(UserInfo userInfo, String cli_checkCode, String username) throws Exception {
        String serv_checkCode= emailCodeDao.findByEmail(userInfo.getEmail());
        if(cli_checkCode==null || !cli_checkCode.equalsIgnoreCase(serv_checkCode)){
            return false;
        }
        try{
            userInfo.setPassword(passwordEncoderUtils.endcodePassword(userInfo.getPassword()));
            userInfoDao.saveUser(userInfo);
            if(username!=null){
                userDetailDao.updateUserByEmail(userInfo.getEmail(),username);
            }
            UserInfo user=userInfoDao.findUserInfo(userInfo);
            request.getSession().setAttribute("user",user);
            return true;

        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public void updateDtail(UserDetail userDetail, MultipartFile avator) throws Exception {
        if (avator!=null){
            String path=request.getServletContext().getRealPath("/pages/img/");
            String fname=avator.getOriginalFilename();
            String fileName=fname.substring(fname.lastIndexOf("."));
            String uuid= UUID.randomUUID().toString().replace("-","");
            fileName=uuid+fileName;

            File file=new File(path);
            if(!file.exists()){
                file.mkdirs();
            }
            avator.transferTo(new File(path,fileName));

            userDetail.setAvatar(fileName);
            userDetailDao.update(userDetail);
        }else{
            userDetailDao.updateWithOutAvatar(userDetail);
        }
        UserDetail udetail=userDetailDao.findByUserId(userDetail.getUsers_id());
        UserInfo userInfo= (UserInfo) request.getSession().getAttribute("user");
        userInfo.setUserDetail(udetail);
        request.getSession().setAttribute("user",userInfo);

    }

    private String getCheckCode(){
        String base = "0123456789ABCDEFGHIJKLMNOPQRSTUYWXYZabcdefghijklmnopqrstuywxyz";
        int size = base.length();
        Random r = new Random();
        StringBuffer sb = new StringBuffer();
        for(int i=1;i<=6;i++){
            //产生0到size-1的随机值
            int index = r.nextInt(size);
            //在base字符串中获取下标为index的字符
            char c = base.charAt(index);
            //将c放入到StringBuffer中去
            sb.append(c);
        }
        return sb.toString();
    }
}
