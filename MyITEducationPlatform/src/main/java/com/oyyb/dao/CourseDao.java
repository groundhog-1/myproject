package com.oyyb.dao;

import com.oyyb.domain.Course;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface CourseDao {





    @Select("select * from course where id=#{courseId}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "category",column = "category"),
            @Result(property = "title",column = "title"),
            @Result(property = "attentions",column = "attentions"),
            @Result(property = "classStart",column = "classStart"),
            @Result(property = "classEnd",column = "classEnd"),
            @Result(property = "courseimg",column = "courseimg"),
            @Result(property = "introduction",column = "introduction"),
            @Result(property = "studys",column = "studys"),
            @Result(property = "cm_id",column = "cm_id"),
            @Result(property = "stage",column = "stage"),
            @Result(property = "teacher_id",column = "teacher_id"),
            @Result(property = "course_contexts",column = "id",javaType = List.class,many = @Many(select = "com.oyyb.dao.Course_ContextDao.findByCourseId"))
    })
    Course findByCourseId(String courseId);

    @SelectProvider(type = SqlProvider.class,method = "selectCourseByLabelIdAndCategory")
     List<Course> findCourseByLabelIdAndCategory(@Param("category") Integer category,
                                                 @Param("label_name") String label_name,
                                                 @Param("courseOrder")String courseOrder) throws Exception;

    @Select("select * from course where cm_id=#{cm_id}")
    List<Course> findCourseByModule(String cm_id) throws Exception;

    @Insert("insert into course(id,category,title,attentions,classStart,courseimg,introduction,studys,cm_id,stage,teacher_id,label_id)" +
            " values(#{id},#{category},#{title},#{attentions},#{classStart},#{courseimg},#{introduction},#{studys},#{cm_id},#{stage},#{teacher_id},#{label_id})")
    void saveCourse(Course course) throws Exception;


    @SelectProvider(type = SqlProvider.class,method = "findStudyByUserid")
    List<Course> findStudyByUserid(@Param("users_id") String users_id, @Param("catagory") String catagory);

    @Update("update course set ATTENTIONS=ATTENTIONS+1 where id=#{course_id}")
    void addAttention(String course_id) throws Exception;

    @Update("update course set ATTENTIONS=ATTENTIONS-1 where id=#{course_id}")
    void lessAttention(String course_id) throws Exception;

    @Update("update course set STUDYS=STUDYS+1 where id=#{course_id}")
    void addStudies(String courseId) throws Exception;
}
