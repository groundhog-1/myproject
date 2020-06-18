package com.oyyb.controller;

import com.oyyb.dao.CourseDao;
import com.oyyb.domain.Course;
import com.oyyb.domain.CourseModule;
import com.oyyb.service.CourseService;
import com.oyyb.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import java.util.List;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private CourseService courseService;

    @RequestMapping("/startcourse")
    public ModelAndView startcourse() throws Exception{
        ModelAndView mv=new ModelAndView();
        List<CourseModule> courseModules=teacherService.findCourseModule();
        mv.addObject("courseModules",courseModules);
        List<String> labels=teacherService.findLabels();
        mv.addObject("labels",labels);
        mv.setViewName("/teachers/course");
        return mv;
    }

    @RequestMapping("/saveCourse")
    public void saveCourse(Course course,
                           @RequestParam(value = "labelName")String labelName,
                           @RequestParam("course_img")MultipartFile courseimg,
                           @RequestParam("cc_title")String[] titles,
                           @RequestParam("upload")MultipartFile[] uploads) throws Exception{
        courseService.saveCourse(course,labelName,courseimg,titles,uploads);

    }
}
