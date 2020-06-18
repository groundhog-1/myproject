package com.oyyb.dao;

import com.oyyb.domain.Permission;
import com.oyyb.domain.Teacher;
import com.oyyb.domain.UserDetail;
import com.oyyb.domain.UserInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.security.core.parameters.P;

import java.util.List;

public interface UserInfoDao {

    @Select("select * from users where email=#{email}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "email",column = "email"),
            @Result(property = "password",column = "password"),
            @Result(property = "userDetail",column = "id",javaType = UserDetail.class,one=@One(select = "com.oyyb.dao.UserDetailDao.findByUserId")),
            @Result(property = "permission",column = "id",javaType = Permission.class,one=@One(select = "com.oyyb.dao.PermissionDao.findByUserId")),
            @Result(property = "courses",column = "id",javaType = List.class,many=@Many(select = "com.oyyb.dao.MyCoursesDao.findCoursesByUserId")),
            @Result(property = "teacher",column = "id",javaType = Teacher.class,one=@One(select = "com.oyyb.dao.TeacherDao.findByUserId"))
    })
    UserInfo findUserInfo(UserInfo userInfo);


    @Select("select * from users where id=#{userid}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "email",column = "email"),
            @Result(property = "password",column = "password"),
            @Result(property = "userDetail",column = "id",javaType = UserDetail.class,one=@One(select = "com.oyyb.dao.UserDetailDao.findByUserId")),
            @Result(property = "permission",column = "id",javaType = Permission.class,one=@One(select = "com.oyyb.dao.PermissionDao.findByUserId"))
    })
    UserInfo findBuUserId(int userid);

    @Insert("insert into users_vip(users_id,permission_id) values(#{usersid},#{permissionid})")
    void saveVip(@Param("usersid") Integer userid, @Param("permissionid") Integer permissionid) throws  Exception;

    @Insert("insert into users(email,password) values(#{email},#{password})")
    void saveUser(UserInfo userInfo);
}
