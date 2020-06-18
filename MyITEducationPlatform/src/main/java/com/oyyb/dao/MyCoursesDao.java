package com.oyyb.dao;

import com.oyyb.domain.Course;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MyCoursesDao {

    @Select("select * from course where id in(select course_id from mycourses where users_id=#{id})")
    List<Course> findCoursesByUserId(Integer id) throws Exception;

    @Insert("insert into mycourses(users_id,course_id) values(#{userid},#{courseid})")
    void addMycourse(@Param("userid") Integer userid, @Param("courseid")String courseid)throws Exception;
}
