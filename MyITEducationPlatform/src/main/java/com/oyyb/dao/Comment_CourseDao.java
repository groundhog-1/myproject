package com.oyyb.dao;

import com.oyyb.domain.Comment_Course;
import com.oyyb.domain.Course_Reply;
import com.oyyb.domain.UserDetail;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface Comment_CourseDao {

    @Insert("insert into comment_course(users_id,course_context_id,pubdate,content) values(#{users_id},#{course_context_id},#{pubdate},#{content})")
    void save(Comment_Course comment_course) throws Exception;

    @Select("select * from comment_course where course_context_id in (select id from course_context where course_id=#{course_id}) or \n" +
            "course_context_id =#{course_id} order by pubdate")
    @Results({
            @Result(id = true,property ="id",column = "id"),
            @Result(property = "users_id",column = "users_id"),
            @Result(property = "course_context_id",column = "course_context_id"),
            @Result(property = "pubdate",column = "pubdate"),
            @Result(property = "content",column = "content"),
            @Result(property = "course_context_name",column = "course_context_id",javaType = String.class,one = @One(select = "com.oyyb.dao.Course_ContextDao.findTitleById")),
            @Result(property = "userDetail",column = "users_id",javaType = UserDetail.class,one = @One(select = "com.oyyb.dao.UserDetailDao.findByUserId"))

    })
    List<Comment_Course> findCommentsByCourseId(String course_id)throws Exception;


    @Insert("insert into course_reply " +
            "values(#{id},#{respondent_id},#{brespondent_id},#{content},#{commentcourse_id},#{pubdate})")
    int reply_save(Course_Reply course_reply) throws Exception;

    @Select(("select * from course_reply where id=#{uuid}"))
    @Results(id="course_reply",value = {
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "respondent_id",column = "respondent_id"),
            @Result(property = "brespondent_id",column = "brespondent_id"),
            @Result(property = "content",column = "content"),
            @Result(property = "commentcourse_id",column = "commentcourse_id"),
            @Result(property = "pubdate",column = "pubdate"),
            @Result(property = "respondent",column = "respondent_id",javaType = UserDetail.class,one=@One(select="com.oyyb.dao.UserDetailDao.findByUserId")),
            @Result(property = "brespondent",column = "brespondent_id",javaType = UserDetail.class,one=@One(select="com.oyyb.dao.UserDetailDao.findByUserId"))
    })
    Course_Reply findCourseReplyById(String uuid);

    @Select("select * from course_reply where COMMENTCOURSE_ID=#{coursecomment_id}")
    @ResultMap("course_reply")
    List<Course_Reply> findAllByCoursecomment_id(String coursecomment_id);
}
