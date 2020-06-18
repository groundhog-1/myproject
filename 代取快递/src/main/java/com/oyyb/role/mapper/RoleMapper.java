package com.oyyb.role.mapper;

import com.oyyb.common.config.utils.BaseMapper;
import com.oyyb.role.model.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author: oyyb
 * @data: 2020-04-25
 * @version: 1.0.0
 * @descript:
 */
@Mapper
public interface RoleMapper extends BaseMapper<Role> {

    @Select("select max(id) from tb_role")
    Integer getMaxId();

    @Insert("insert into tb_user_role(u_id,r_id) values((select id from tb_user where username=#{name}),\n" +
            "(select id from tb_role where name=#{roleName}))")
    int insertUserRole(@Param("name")String name,@Param("roleName")String roleName);

    //查询用户对应的权限
    @Select("select * from tb_role where exists (select 1 from tb_user_role tur where tur.u_id = #{id} and tur.r_id = id )")
    List<Role> findRolesByUid(int id);

    //根据用户名移除权限
    @Delete("delete from tb_user_role where u_id = (select id from tb_user where username = #{username})")
    int removeByUsername(String username);

    @Delete("delete from tb_user_role where u_id = (select id from tb_user where username = #{username}) and " +
            "r_id = (select id from tb_role where name = #{role_name})")
    int deleteByUsernameAndUSER(@Param("username")String username,@Param("role_name")String name);
}
