package com.oyyb.service.impl;

import com.oyyb.dao.RoleDao;
import com.oyyb.domain.Permission;
import com.oyyb.domain.Role;
import com.oyyb.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("roleService")
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    @Override
    public List<Role> findAll() throws Exception {
        return roleDao.findAll();
    }

    @Override
    public void save(Role role) throws Exception {
        roleDao.save(role);
    }

    @Override
    public Role findById(String roleId) throws Exception {
        return roleDao.findById(roleId);
    }

    @Override
    public List<Permission> findOtherPermission(String roleId) {
        return roleDao.findOtherPermission(roleId);
    }

    @Override
    public void addPermission2Rolle(String roleId, String[] ids) throws Exception {
        for(String permissionid:ids){
            roleDao.addPermission2Rolle(roleId,permissionid);
        }
    }
}
