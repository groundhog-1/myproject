package com.oyyb.service.impl;

import com.oyyb.dao.Comment_CourseDao;
import com.oyyb.domain.Comment_Course;
import com.oyyb.domain.Course_Reply;
import com.oyyb.service.Comment_CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service("/comment_courseService")
public class Comment_CourseServiceImpl implements Comment_CourseService {

    @Autowired
    private Comment_CourseDao comment_courseDao;

    @Override
    public void releaseComment(Comment_Course comment_course) throws Exception {
        comment_course.setPubdate(new Date());
        comment_courseDao.save(comment_course);
    }

    @Override
    public List<Comment_Course> getCommentsByCourseId(String course_id) throws Exception {
        return comment_courseDao.findCommentsByCourseId(course_id);
    }

    @Override
    public Course_Reply reply(Course_Reply course_reply) throws Exception {
        String uuid = UUID.randomUUID().toString();
        uuid = uuid.replace("-", "");
        course_reply.setId(uuid);
        course_reply.setPubdate(new Date());
        int n= comment_courseDao.reply_save(course_reply);
        if(n==1){
            return comment_courseDao.findCourseReplyById(uuid);
        }
        return  null;
    }

    @Override
    public List<Course_Reply> replyAll(String coursecomment_id) {
        return comment_courseDao.findAllByCoursecomment_id(coursecomment_id);
    }

}
