package com.oyyb.dao;

import com.oyyb.domain.Question_Reply;
import com.oyyb.domain.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface Question_ReplyDao {



    @Select(("select * from question_reply where id=#{id}"))
    @Results(id="questionReply",value = {
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "content",column = "content"),
            @Result(property = "pubdate",column = "pubdate"),
            @Result(property = "respondent_id",column = "respondent_id"),
            @Result(property = "brespondent_id",column = "brespondent_id"),
            @Result(property = "question_course_id",column = "question_course_id"),
            @Result(property = "userInfo",column = "respondent_id",javaType = UserInfo.class,one=@One(select = "com.oyyb.dao.UserInfoDao.findBuUserId")),
            @Result(property = "buserInfo",column = "brespondent_id",javaType = UserInfo.class,one=@One(select = "com.oyyb.dao.UserInfoDao.findBuUserId"))

    })
    Question_Reply findQuestionReplyById(int id) throws Exception;

    @Select("select * from question_reply where question_course_id=#{id} order by pubdate")
    @ResultMap("questionReply")
    List<Question_Reply> findAllByQuestionId(String id) throws Exception;
}
