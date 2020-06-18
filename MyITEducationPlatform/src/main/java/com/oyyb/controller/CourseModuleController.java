package com.oyyb.controller;

import com.oyyb.domain.Course;
import com.oyyb.domain.CourseModule;
import com.oyyb.service.CourseModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/paths")
public class CourseModuleController {
    @Autowired
    private CourseModuleService courseModuleService;

    @RequestMapping("/findAll")
    public ModelAndView findAllCourseModule() throws Exception{
        ModelAndView mv=new ModelAndView();
        List<CourseModule> courseModules= courseModuleService.findAllCourseModule();
        mv.addObject("coursemodules",courseModules);
        mv.setViewName("/paths/index");
        return mv;
    }

    @RequestMapping("/findAllByCourseModuleId")
    public ModelAndView findAllByCourseModuleId(String id) throws Exception{
        ModelAndView mv=new ModelAndView();
        CourseModule courses=courseModuleService.findAllByCourseModuleId(id);
        mv.addObject("courses",courses);
        mv.setViewName("/paths/show");
        return mv;
    }
}
