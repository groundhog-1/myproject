package com.oyyb.dao;

import com.oyyb.domain.UserDetail;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UserDetailDao {
    @Select("select * from userdetail where users_id=#{userid}")
    UserDetail findByUserId(int userid) throws Exception;

    @Update("update userdetail set username=#{username} where users_id=(select id from users where email=#{email})")
    void updateUserByEmail(@Param(("email")) String email, @Param("username") String username);

    @Update("update userdetail set avatar=#{avatar},username=#{username},phone=#{phone} where users_id=#{users_id}")
    void update(UserDetail userDetail) throws Exception;

    @Update("update userdetail set username=#{username},phone=#{phone} where users_id=#{users_id}")
    void updateWithOutAvatar(UserDetail userDetail) throws Exception;
}
