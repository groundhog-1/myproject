package com.oyyb.dao;

import com.oyyb.domain.Permission;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface PermissionDao {
    @Select("select * from permission where id in(select permissionid from role_permission where roleid=#{roleId})")
    List<Permission> findByRoleId(String roleId) throws Exception;

    @Select("select * from permission")
    List<Permission> findAll();

    @Insert("insert into permission(permissionName,url) values(#{permissionName},#{url})")
    void save(Permission permission) throws Exception;
}
