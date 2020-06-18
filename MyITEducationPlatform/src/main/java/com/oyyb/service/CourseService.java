package com.oyyb.service;

import com.oyyb.domain.Course;
import com.oyyb.domain.Teacher;
import com.oyyb.domain.UserDetail;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface CourseService {
    List<Course> findAll( Integer category,String label_name,String courseOrder,Integer page) throws Exception;

    List<String> findLabel() throws Exception;

    Course findByCourseId(String courseId) throws Exception;

    void saveCourse(Course course, String labelName,MultipartFile courseimg, String[] titles, MultipartFile[] uploads) throws Exception;


    List<Course> findStudyByUserId(String users_id, String catagory, Integer page);


    boolean findAttentionByCourseid(String courseId, int id) throws Exception;

    void removeAttention(String course_id, Integer users_id) throws Exception;

    void addAttention(String course_id, Integer users_id) throws Exception;

    void addByCourseid(String course_id) throws Exception;

    void lessByCourseid(String course_id) throws Exception;

    void addStudies(String courseId) throws Exception;

    Teacher findTeacher(String courseId) throws Exception;

    UserDetail findByUserId(int users_id) throws Exception;
}
