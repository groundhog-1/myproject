package com.oyyb.service.impl;

import com.github.pagehelper.PageHelper;
import com.oyyb.dao.Question_CourseDao;
import com.oyyb.dao.Question_ReplyDao;
import com.oyyb.domain.Question_Course;
import com.oyyb.domain.Question_Reply;
import com.oyyb.service.Question_CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service("question_courseService")
public class Question_CourseServiceImpl implements Question_CourseService {


    @Autowired
    private Question_CourseDao question_courseDao;

    @Autowired
    private Question_ReplyDao question_replyDao;

    @Override
    public Question_Course submitQuestion(Question_Course question_course) throws Exception {
        String uuid = UUID.randomUUID().toString();
        uuid = uuid.replace("-", "");
        question_course.setId(uuid);
        question_course.setPubdate(new Date());
        question_courseDao.save(question_course);
        return question_courseDao.findByQuestionCourseById(uuid);
    }

    @Override
    public List<Question_Course> findAllByCouse_id(String course_id) throws Exception {
        return question_courseDao.findAllByCouse_id(course_id);
    }

    @Override
    public List<Question_Course> findAll(Integer page,Integer discuss,String orderWay) {
        PageHelper.startPage(page,15);
        return question_courseDao.findAll(discuss,orderWay);
    }
    @Override
    public Question_Course findQuestionById(String id) throws Exception {
        return question_courseDao.findByQuestionCourseById(id);
    }

    @Override
    public Question_Reply saveAndGet(Question_Reply question_reply) throws Exception {
        question_reply.setPubdate(new Date());
        question_reply.setContent( question_reply.getContent().replace(question_reply.getContent().split(" :")[0]+" :",""));

        Map<Object,Object> map=new HashMap<>();
        map.put("respondent_id",question_reply.getRespondent_id());
        map.put("brespondent_id",question_reply.getBrespondent_id());
        map.put("content",question_reply.getContent());
        map.put("pubdate",question_reply.getPubdate());
        map.put("question_course_id",question_reply.getQuestion_course_id());
        map.put("question_id",null);
        question_courseDao.saveAndGet(map);
        System.out.println(map.get("question_id"));
        int id= (int) map.get("question_id");
        return question_replyDao.findQuestionReplyById(id);
    }


}
