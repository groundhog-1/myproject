package com.oyyb.dao;

import org.apache.ibatis.annotations.*;

public interface EmailCodeDao {

    @Insert("insert into emailcode(email,code) values(#{email},#{code})")
    void save(@Param("email") String email, @Param("code") String code) throws Exception;


    @Delete("delete from emailcode where email=#{email}")
    void removeEmailCode(String email);

    @Select("select code from emailcode where email=#{email}")
    String findByEmail(String email) throws Exception;

    @Update("update emailcode set code=#{code} where email=#{email}")
    void updateCodeByEmail(@Param("email") String email,@Param("code") String checkCode) throws Exception;
}
