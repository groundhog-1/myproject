package com.oyyb.service.impl;

import com.oyyb.dao.CourseModuleDao;
import com.oyyb.dao.LabelDao;
import com.oyyb.domain.CourseModule;
import com.oyyb.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("teacherService")
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private CourseModuleDao courseModuleDao;
    @Autowired
    private LabelDao labelDao;
    @Override
    public List<CourseModule> findCourseModule() throws Exception {
        return courseModuleDao.findAllCourseModule();
    }

    @Override
    public List<String> findLabels() throws Exception {
        return labelDao.findLabel();
    }
}
