package com.oyyb.service;

import com.oyyb.domain.Permission;

import java.util.List;

public interface PermissionService {
    List<Permission> findAll();

    void save(Permission permission) throws Exception;
}
