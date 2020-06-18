package com.oyyb.service;

import com.oyyb.domain.Course;
import com.oyyb.domain.CourseModule;

import java.util.List;

public interface CourseModuleService {
    List<CourseModule> findAllCourseModule() throws Exception;

    CourseModule findAllByCourseModuleId(String id) throws Exception;
}
