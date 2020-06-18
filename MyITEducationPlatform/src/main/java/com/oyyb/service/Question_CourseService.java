package com.oyyb.service;

import com.oyyb.domain.Question_Course;
import com.oyyb.domain.Question_Reply;

import java.util.List;

public interface Question_CourseService {
    Question_Course submitQuestion(Question_Course question_course) throws Exception;

    List<Question_Course> findAllByCouse_id(String course_id) throws Exception;

    List<Question_Course> findAll(Integer page,Integer discuss,String orderWay);

    Question_Course findQuestionById(String id) throws Exception;

    Question_Reply saveAndGet(Question_Reply question_reply) throws Exception;
}
