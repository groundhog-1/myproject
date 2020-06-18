package com.oyyb.controller;

import com.oyyb.domain.Comment_Course;
import com.oyyb.domain.Course_Reply;
import com.oyyb.domain.Question_Course;
import com.oyyb.service.Comment_CourseService;
import com.oyyb.service.Question_CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {



    @Autowired
   private Comment_CourseService comment_courseService;

    @RequestMapping("/releaseComment")
   public void releaseComment(Comment_Course comment_course, HttpServletResponse response) throws Exception{


       comment_courseService.releaseComment(comment_course);
       response.setContentType("text/html;charset=utf-8");
       response.getWriter().write("ok");
   }

   @RequestMapping("/getCommentsByCourseId")
   public   @ResponseBody List<Comment_Course> getCommentsByCourseId(String course_id) throws Exception{
       List<Comment_Course> lists=comment_courseService.getCommentsByCourseId(course_id);
       return lists;
   }

   @RequestMapping("/publish")
   public @ResponseBody Course_Reply publish(Course_Reply course_reply) throws Exception{
        course_reply.setContent( course_reply.getContent().replace(course_reply.getContent().split(" :")[0]+" :",""));
        return comment_courseService.reply(course_reply);

   }

   @RequestMapping("/reply")
    public @ResponseBody List<Course_Reply>  reply(String coursecomment_id) throws Exception{
       List<Course_Reply> course_replies= comment_courseService.replyAll(coursecomment_id);

        return course_replies;
   }


}
