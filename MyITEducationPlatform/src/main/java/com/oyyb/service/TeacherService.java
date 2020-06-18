package com.oyyb.service;

import com.oyyb.domain.CourseModule;

import java.util.List;

public interface TeacherService {

    List<CourseModule> findCourseModule() throws Exception;

    List<String> findLabels() throws Exception;
}
