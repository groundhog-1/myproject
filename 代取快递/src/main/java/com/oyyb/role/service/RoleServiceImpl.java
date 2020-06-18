package com.oyyb.role.service;

import com.oyyb.common.config.enums.ExceptionEnums;
import com.oyyb.common.config.exception.MyException;
import com.oyyb.role.mapper.RoleMapper;
import com.oyyb.role.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: oyyb
 * @data: 2020-04-25
 * @version: 1.0.0
 * @descript:
 */
@Service
public class RoleServiceImpl {
    @Autowired
    private RoleMapper roleMapper;

    public void addRole(String roleName) {
        try{
            Role role = new Role();
            role.setName(roleName);
            //判断权限表中是否存在
            Role crole = roleMapper.selectOne(role);
            if (crole == null){
                //查询当前权限的最大id
                Integer maxId = roleMapper.getMaxId();
                if (maxId == null) maxId = 0;
                //插入role表中

                role.setId(++maxId);

                roleMapper.insert(role);
            }else{
                throw new MyException(ExceptionEnums.ROLE_NAME_EXISTED);
            }
        }catch (MyException e){
            e.getMessage();
        }


    }

    public void deleteRole(String roleName) {

        Role role = new Role();
        role.setName(roleName);
        roleMapper.deleteByExample(role);

    }
}
