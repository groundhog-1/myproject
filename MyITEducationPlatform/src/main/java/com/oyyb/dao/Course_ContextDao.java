package com.oyyb.dao;

import com.oyyb.domain.Course_Context;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface Course_ContextDao {

    @Select("select * from course_context where course_id=#{courseId}")
    List<Course_Context> findByCourseId(String courseId) throws Exception;

    @Select("select title from  course_context where id=#{id}")
    String findTitleById(String id) throws Exception;

    @Insert("insert into course_context(COURSE_ID,SECTIONNUMBER,TITLE,VIDEO) values(#{course_id},#{sectionnumber},#{title},#{video})")
    void saveCourseContent(Course_Context course_context);
}
