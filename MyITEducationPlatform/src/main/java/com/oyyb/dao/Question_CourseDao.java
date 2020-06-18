package com.oyyb.dao;

import com.oyyb.domain.Question_Course;
import com.oyyb.domain.Question_Reply;
import com.oyyb.domain.UserDetail;
import com.oyyb.domain.UserInfo;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.StatementType;

import java.util.List;
import java.util.Map;

public interface Question_CourseDao  {

    @Insert("insert into question_course(id,title,content,course_context_id,users_id,pubdate,discuss)  " +
            "values(#{id},#{title},#{content},#{course_context_id},#{users_id},#{pubdate},#{discuss})")
    void save(Question_Course question_course) throws Exception;

    @Select("select * from question_course where course_context_id in (select id from course_context where course_id=#{course_id}) " +
            "or course_context_id =#{id} order by pubdate")
    @Results(id="questionMap",value = {
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "title",column = "title"),
            @Result(property = "content",column = "content"),
            @Result(property = "course_context_id",column = "course_context_id"),
            @Result(property = "users_id",column = "users_id"),
            @Result(property = "pubdate",column = "pubdate"),
            @Result(property = "discuss",column = "discuss"),
            @Result(property = "course_context_name",column = "course_context_id",javaType = String.class,one = @One(select = "com.oyyb.dao.Course_ContextDao.findTitleById")),
            @Result(property = "userInfo",column = "users_id",javaType = UserInfo.class,one=@One(select = "com.oyyb.dao.UserInfoDao.findBuUserId"))

    })
    List<Question_Course> findAllByCouse_id(String course_id) throws Exception;

    @Select("select * from question_course where id =#{id}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "title",column = "title"),
            @Result(property = "content",column = "content"),
            @Result(property = "course_context_id",column = "course_context_id"),
            @Result(property = "users_id",column = "users_id"),
            @Result(property = "pubdate",column = "pubdate"),
            @Result(property = "discuss",column = "discuss"),
            @Result(property = "course_context_name",column = "course_context_id",javaType = String.class,one = @One(select = "com.oyyb.dao.Course_ContextDao.findTitleById")),
            @Result(property = "userInfo",column = "users_id",javaType = UserInfo.class,one=@One(select = "com.oyyb.dao.UserInfoDao.findBuUserId")),
            @Result(property = "question_replies",column = "id",javaType = List.class,many = @Many(select = "com.oyyb.dao.Question_ReplyDao.findAllByQuestionId"))
    })
    Question_Course findByQuestionCourseById(String id) throws Exception;

    @SelectProvider(type = SqlProvider.class,method = "selectQuestionByDiscuss")
    @ResultMap("questionMap")
    List<Question_Course> findAll(@Param("discuss") Integer discuss,@Param("orderWay") String orderWay);


    @Select({"call pl(#{respondent_id,mode=IN,jdbcType=INTEGER}," +
            "#{brespondent_id,mode=IN,jdbcType=INTEGER}," +
            "#{content,mode=IN,jdbcType=VARCHAR}," +
            "#{pubdate,mode=IN,jdbcType=TIMESTAMP}," +
            "#{question_course_id,mode=IN,jdbcType=VARCHAR}," +
            "#{question_id,mode=OUT,jdbcType=INTEGER})"})
    @Options(statementType= StatementType.CALLABLE)
    void saveAndGet(Map<Object, Object> map);


}
