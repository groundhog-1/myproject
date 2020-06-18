package com.oyyb.service;

import com.oyyb.domain.UserDetail;
import com.oyyb.domain.UserInfo;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface UserInfoService {
    UserInfo login(UserInfo userInfo);

    void addVip(Integer userid, Integer permissionid) throws Exception;

    void addCourse(Integer userid, String courseid) throws Exception;

    void sendEmailCode(String email) throws Exception;

    boolean register(UserInfo userInfo, String cli_checkCode, String username) throws Exception;

    void updateDtail(UserDetail userDetail, MultipartFile avator) throws Exception;
}
