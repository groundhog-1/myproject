package com.oyyb.user.service;


import com.oyyb.common.config.enums.ExceptionEnums;
import com.oyyb.user.model.UserInfo;
import com.oyyb.user.model.vo.UserInfoVo;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author: oyyb
 * @data: 2020-04-23
 * @version: 1.0.0
 * @descript:
 */
public interface IUserService {

    void code(HttpServletRequest request,HttpServletResponse response);

    boolean register(UserInfo userInfo,String code);

    UserInfo queryUserByUsername(String username);

    void updateUserInfo(UserInfo userInfo);

    ModelAndView queryUserRlease(Integer page);


    ExceptionEnums reminder(String name, String msg, Integer flag,Long oid);

    ModelAndView queryAll(UserInfoVo userInfoVo, Integer page);
}
