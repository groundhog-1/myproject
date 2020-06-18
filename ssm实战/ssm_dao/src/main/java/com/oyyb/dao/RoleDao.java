package com.oyyb.dao;

import com.oyyb.domain.Permission;
import com.oyyb.domain.Role;
import org.apache.ibatis.annotations.*;
import org.springframework.security.core.parameters.P;

import java.util.List;

public interface RoleDao {
    @Select("select * from role where id in (select roleid from users_role where userid=#{userId})")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "roleName",column ="roleName" ),
            @Result(property = "roleDesc",column ="roleDesc" ),
            @Result(property = "permissions",column ="id",javaType =List.class,many = @Many(select="com.oyyb.dao.PermissionDao.findByRoleId"))
    })
    List<Role> findByUserId(String userId) throws Exception;

    @Select("select * from role")
    List<Role> findAll() throws Exception;

    @Insert("insert into role(roleName,roleDesc) values(#{roleName},#{roleDesc})")
    void save(Role role) throws Exception;

    @Select("select * from role where id=#{roleId}")
    Role findById(String roleId) throws Exception;

    @Select("select * from permission where id not in(select permissionid from role_permission where roleid=#{roleId})")
    List<Permission> findOtherPermission(String roleId);

    @Insert("insert into role_permission(roleid,permissionid) values(#{roleId},#{permissionId})")
    void addPermission2Rolle(@Param("roleId") String roleId, @Param("permissionId") String permissionid) throws Exception;
}
