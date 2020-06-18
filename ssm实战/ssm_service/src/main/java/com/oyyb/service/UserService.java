package com.oyyb.service;

import com.oyyb.domain.Role;
import com.oyyb.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {
    List<UserInfo> findAll() throws Exception;

    void save(UserInfo userInfo);

    UserInfo findById(String id);

    List<Role> findOthersRole(String userId) throws Exception;

    void addRole2User(String userId, String[] roleId) throws Exception;
}
