package com.oyyb.user.security;

import com.oyyb.common.config.enums.ExceptionEnums;
import com.oyyb.common.config.exception.MyException;
import com.oyyb.common.config.utils.IpAddressUtil;
import com.oyyb.role.mapper.RoleMapper;
import com.oyyb.user.mapper.UserMapper;
import com.oyyb.role.model.Role;
import com.oyyb.user.model.UserInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author: oyyb
 * @data: 2020-04-24
 * @version: 1.0.0
 * @descript:
 */

@Service("userDetailService")
public class UserDetailServiceImpl implements UserDetailsService {


    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private StringRedisTemplate redisTemplate;

    private static final String CODE_PREFIX = "CODE_";

    private static final String ROLE_PREFIX = "ROLE_";

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {


        String code = request.getParameter("code");

        String ip = CODE_PREFIX+ IpAddressUtil.getIPAddress(request);
        String scode = redisTemplate.opsForValue().get(ip);
        if (!StringUtils.equalsIgnoreCase(code,scode)){
            throw new MyException(ExceptionEnums.CODE_ERROR);
        }


        UserInfo userInfo = new UserInfo();
        userInfo.setUsername(request.getParameter("username"));

        userInfo = userMapper.selectOne(userInfo);
        if (userInfo == null) {
            throw new MyException(ExceptionEnums.USERINFO_ERROR);
        }

        //查找所有权限
        //判断密码是否相等

       List<Role> roles = roleMapper.findRolesByUid(userInfo.getId());
       User securityUser =  new User(userInfo.getUsername(),userInfo.getPassword(),roles.stream().map(role ->
               new SimpleGrantedAuthority(ROLE_PREFIX+role.getName())).collect(Collectors.toList()));

       return securityUser;

    }
}
