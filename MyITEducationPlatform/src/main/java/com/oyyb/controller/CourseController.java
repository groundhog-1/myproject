package com.oyyb.controller;

import com.github.pagehelper.PageInfo;
import com.oyyb.domain.*;
import com.oyyb.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLDecoder;
import java.util.List;

@Controller
@RequestMapping("/course")
public class CourseController {
    @Autowired
    private CourseService courseService;


    @RequestMapping("/findAll")
    public ModelAndView findAll() throws Exception{
        ModelAndView mv=new ModelAndView();

        List<Course> courses= courseService.findAll(null,"","最新",1);
        List<String> labels=courseService.findLabel();
        PageInfo pageInfo=new PageInfo(courses);
        pageInfo.setPageNum(1);
        mv.addObject("labels",labels);
        mv.addObject("courses",pageInfo);
        System.out.println(pageInfo.getList().size());
        mv.setViewName("/courses/index");
        return mv;
    }

    @RequestMapping("/findByCourseId")
    public ModelAndView findByCourseId(String courseId,HttpServletRequest request) throws Exception{
        ModelAndView mv=new ModelAndView();


        Course course= courseService.findByCourseId(courseId);
        HttpSession hs=request.getSession();
        UserInfo userInfo= (UserInfo) hs.getAttribute("user");

//        添加学习人数
        courseService.addStudies(courseId);
        Teacher teacher=courseService.findTeacher(courseId);
        UserDetail userDetail=courseService.findByUserId(teacher.getUsers_id());

        boolean flag=false;
        boolean attention_flag=false;

        if(userInfo!=null){
            attention_flag=courseService.findAttentionByCourseid(courseId,userInfo.getId());
            for(Course c : userInfo.getCourses()){
                if(courseId.equals(c.getId())){
                    flag=true;
                }
            }
        }


        mv.addObject("userDetail",userDetail);
        mv.addObject("teacher",teacher);
        mv.addObject("attention_flag",attention_flag);
        mv.addObject("flag",flag);
        mv.addObject("course",course);
        mv.setViewName("/courses/show");
        return mv;
    }

    @RequestMapping("/ajaxFindAll")
    public @ResponseBody PageInfo ajaxFindAll(@RequestParam(name = "category",required = false)Integer category,
                            @RequestParam(name = "label_name",required = false)String label_name,
                                              @RequestParam(name = "courseOrder")String courseOrder,
                                              @RequestParam(name = "page")Integer page) throws Exception{
        String courseorder=null;
        String labelName=null;
        if(label_name!=null){
            labelName= URLDecoder.decode(label_name,"utf-8");
        }
        if(courseOrder!=null){
            courseorder= URLDecoder.decode(courseOrder,"utf-8");
        }


        List<Course> courses= courseService.findAll(category,labelName,courseorder,page);
        PageInfo pageInfo=new PageInfo(courses);
        pageInfo.setPageNum(page);
        return pageInfo;

    }

    @RequestMapping("/studied")
    public ModelAndView studied(@RequestParam("users_id") String users_id,
                                @RequestParam("catagory") String catagory,
                                @RequestParam("page") Integer page) throws Exception{
        ModelAndView mv=new ModelAndView();
        List<Course> courses=courseService.findStudyByUserId(users_id,catagory,page);
        PageInfo pageInfo=new PageInfo(courses);
        mv.addObject("courses",pageInfo);
        mv.setViewName("/user/study");

        return mv;
    }
    @RequestMapping("/ajaxStudy")
    public @ResponseBody PageInfo ajaxStudy(@RequestParam("users_id") String users_id,
                                @RequestParam("catagory") String catagory,
                                @RequestParam("page") Integer page) throws Exception{

        List<Course> courses=courseService.findStudyByUserId(users_id,catagory,page);
        PageInfo pageInfo=new PageInfo(courses);
        return pageInfo;
    }

    @RequestMapping("/removeAttention")
    public @ResponseBody String removeAttention(@RequestParam("course_id")String course_id,
                                                @RequestParam("users_id")Integer users_id)throws  Exception{
        courseService.removeAttention(course_id,users_id);
        courseService.lessByCourseid(course_id);
        return "ok";
    }

    @RequestMapping("/addAttention")
    public @ResponseBody String addAttention(@RequestParam("course_id")String course_id,
                                                @RequestParam("users_id")Integer users_id)throws  Exception{
        courseService.addAttention(course_id,users_id);
        courseService.addByCourseid(course_id);
        return "ok";
    }




}
