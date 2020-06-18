package com.oyyb.service;

import com.oyyb.domain.Comment_Course;
import com.oyyb.domain.Course_Reply;

import java.util.List;

public interface Comment_CourseService {
    void releaseComment(Comment_Course comment_course) throws Exception;

    List<Comment_Course> getCommentsByCourseId(String course_id) throws Exception;

    Course_Reply reply(Course_Reply course_reply) throws Exception;

    List<Course_Reply> replyAll(String coursecomment_id);
}
