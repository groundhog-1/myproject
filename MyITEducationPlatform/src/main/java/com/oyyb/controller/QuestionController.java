package com.oyyb.controller;

import com.github.pagehelper.PageInfo;
import com.oyyb.domain.Question_Course;
import com.oyyb.domain.Question_Reply;
import com.oyyb.service.Question_CourseService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/question")
public class QuestionController {

    @Autowired
    private Question_CourseService question_courseService;
    @RequestMapping("/submitQuestion")
    public @ResponseBody Question_Course submitQuestion(Question_Course question_course, HttpServletResponse response) throws Exception{
        Question_Course question_course1= question_courseService.submitQuestion(question_course);
        return question_course1;
    }

    @RequestMapping("/findAll")
    public @ResponseBody List<Question_Course> findAllByCouse_id(String course_id) throws Exception{
        return question_courseService.findAllByCouse_id(course_id);
    }

    @RequestMapping("/findAllDiscuss")
    public ModelAndView findAllDiscuss() throws Exception{
        ModelAndView mv=new ModelAndView();
        List<Question_Course> question_courses=question_courseService.findAll(1,0,"最新");
        PageInfo pageInfos=new PageInfo(question_courses);
        mv.addObject("courses",pageInfos);
        mv.setViewName("/questions/index");
        return mv;
    }

    @RequestMapping("/findByCategory")
    public @ResponseBody PageInfo findByCategory(@RequestParam("page") Integer page,
                                                 @RequestParam("discuss") Integer discuss,
                                                 @RequestParam(value = "orderWay",required = false) String orderWay)throws Exception{
        List<Question_Course> question_courses=question_courseService.findAll(page,discuss,orderWay);
        PageInfo pageInfos=new PageInfo(question_courses);
        return pageInfos;
    }

    @RequestMapping("/{id}")
    public ModelAndView findQuestionById(@PathVariable("id")String id) throws Exception{
        ModelAndView mv=new ModelAndView();
        Question_Course question_course=question_courseService.findQuestionById(id);
        mv.addObject("question",question_course);
        mv.setViewName("/questions/show");
        return mv;
    }

    @RequestMapping("/reply")
    public @ResponseBody Question_Reply saveAndGet(Question_Reply question_reply) throws Exception{
        Question_Reply reply= question_courseService.saveAndGet(question_reply);
        return reply;
    }
}
