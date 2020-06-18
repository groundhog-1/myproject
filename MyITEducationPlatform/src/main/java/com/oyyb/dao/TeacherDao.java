package com.oyyb.dao;

import com.oyyb.domain.Teacher;
import org.apache.ibatis.annotations.Select;

public interface TeacherDao {
    @Select("select * from teacher where users_id=#{userid}")
    Teacher findByUserId(int userid) throws Exception;

    @Select("select * from teacher where id=(select teacher_id from course where id=#{courseId})")
    Teacher findTeacher(String courseId) throws Exception;
}
