package com.oyyb.dao;

import com.oyyb.domain.Permission;
import org.apache.ibatis.annotations.Select;

public interface PermissionDao {

    @Select("select * from permission where id=(select permission_id from users_vip where users_id=#{userid})")
    Permission findByUserId(int userid) throws Exception;
}
