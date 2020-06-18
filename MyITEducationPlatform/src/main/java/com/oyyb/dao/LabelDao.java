package com.oyyb.dao;

import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface LabelDao {
    @Select("select name from label")
    List<String> findLabel() throws Exception;

    @Select("select id from label where name=#{labelName}")
    String findByName(String labelName) throws Exception;
}
