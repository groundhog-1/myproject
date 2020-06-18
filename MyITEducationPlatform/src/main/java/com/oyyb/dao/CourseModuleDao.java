package com.oyyb.dao;

import com.oyyb.domain.Course;
import com.oyyb.domain.CourseModule;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface CourseModuleDao {

    @Select("select * from coursemodule")
    @Results(id = "courseMap",value = {
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "name",column = "name"),
            @Result(property = "introduction",column = "introduction"),
            @Result(property = "img",column = "img"),
            @Result(property = "courses",column = "id",javaType = List.class,many = @Many(select = "com.oyyb.dao.CourseDao.findCourseByModule"))

    })
    List<CourseModule> findAllCourseModule() throws Exception;

    @Select("select * from coursemodule where id=#{id}")
    @ResultMap("courseMap")
    CourseModule findAllByCourseModuleId(String id) throws Exception;
}
