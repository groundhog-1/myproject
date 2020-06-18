package com.oyyb.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface Attention_CourseDao {
    @Select("select id from attention_course where course_id=#{courseId} and users_id=#{id}")
    String findByCourseid(@Param("courseId") String courseId, @Param("id") int id) throws Exception;

    @Delete("delete from attention_course where users_id=#{users_id} and course_id=#{course_id} ")
    void removeAttention(@Param("course_id") String course_id,@Param("users_id") Integer users_id) throws Exception;

    @Insert("insert into attention_course(course_id,users_id) values(#{course_id},#{users_id})")
    void addAttention(@Param("course_id") String course_id,@Param("users_id") Integer users_id) throws Exception;
}
