package com.oyyb.service;

import com.oyyb.domain.Permission;
import com.oyyb.domain.Role;

import java.util.List;

public interface RoleService {
    List<Role> findAll() throws Exception;

    void save(Role role) throws Exception;

    Role findById(String roleId) throws Exception;

    List<Permission> findOtherPermission(String roleId);

    void addPermission2Rolle(String roleId, String[] ids) throws Exception;
}
