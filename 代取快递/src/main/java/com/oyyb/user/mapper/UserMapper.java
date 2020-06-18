package com.oyyb.user.mapper;

import com.oyyb.common.config.utils.BaseMapper;
import com.oyyb.user.model.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;


/**
 * @author: oyyb
 * @data: 2020-04-23
 * @version: 1.0.0
 * @descript:
 */

@Mapper
public interface UserMapper extends BaseMapper<UserInfo> {

    @Select("select phone from tb_user where username = #{username}")
    String findPhoneByUsername(String username);



}
