package com.oyyb.service.impl;

import com.oyyb.dao.CourseModuleDao;
import com.oyyb.domain.Course;
import com.oyyb.domain.CourseModule;
import com.oyyb.service.CourseModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("coursemoduleService")
public class CourseModuleServiceImpl implements CourseModuleService {
    @Autowired
    private CourseModuleDao courseModuleDao;
    @Override
    public List<CourseModule> findAllCourseModule() throws Exception {
        return courseModuleDao.findAllCourseModule();
    }

    @Override
    public CourseModule findAllByCourseModuleId(String id) throws Exception {
        return courseModuleDao.findAllByCourseModuleId(id);
    }
}
