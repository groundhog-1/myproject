package com.oyyb.service.impl;

import com.github.pagehelper.PageHelper;
import com.oyyb.dao.*;
import com.oyyb.domain.Course;
import com.oyyb.domain.Course_Context;
import com.oyyb.domain.Teacher;
import com.oyyb.domain.UserDetail;
import com.oyyb.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Service("courseService")
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseDao courseDao;
    @Autowired
    private LabelDao labelDao;
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private UserDetailDao userDetailDao;

    @Autowired
    private Course_ContextDao course_contextDao;

    @Autowired
    private TeacherDao teacherDao;

    @Autowired
    private Attention_CourseDao attention_courseDao;

    @Override
    public List<Course> findAll(Integer category,String label_name,String courseOrder,Integer page) throws Exception {
        PageHelper.startPage(page,12);
        return courseDao.findCourseByLabelIdAndCategory(category,label_name,courseOrder);
    }

    @Override
    public List<String> findLabel() throws Exception {
        return labelDao.findLabel();
    }

    @Override
    public Course findByCourseId(String courseId) throws Exception {
        return courseDao.findByCourseId(courseId);
    }

    @Override
    public void saveCourse(Course course, String labelName,MultipartFile courseimg, String[] titles, MultipartFile[] uploads) throws Exception {

        String label_id= labelDao.findByName(labelName);
        if(course.getTeacher_id()==null){
            course.setTeacher_id(0);
        }
//        写入图片
        if(!courseimg.isEmpty()){
            String fname=courseimg.getOriginalFilename();
            String fileName=fname.substring(fname.lastIndexOf("."));
            course.setLabel_id(label_id);
            String uuid= UUID.randomUUID().toString().replace("-","");
            course.setId(uuid);
            fileName=uuid+fileName;


            String path=request.getServletContext().getRealPath("/pages/img/");
            saveFile(courseimg,path,fileName);
            course.setCourseimg(fileName);

            courseDao.saveCourse(course);
        }
        System.out.println(course.getId());
//上传视屏
        if(course.getId()!=null){
            String path=request.getServletContext().getRealPath("/video/");
            int snum=1;

            for(MultipartFile upload:uploads){
                Course_Context course_context=new Course_Context();
                course_context.setCourse_id(course.getId());
                String fname="";
                String fileName="";
                String uuid="";
                if(!upload.isEmpty()){
                    fname=upload.getOriginalFilename();
                    fileName=fname.substring(fname.lastIndexOf("."));
                    uuid= UUID.randomUUID().toString().replace("-","");
                    fileName=uuid+fileName;

                    saveFile(upload,path,fileName);
                    course_context.setSectionnumber(snum);
                    course_context.setTitle(titles[snum-1]);
                    course_context.setVideo(fileName);
                }
                snum+=1;
                System.out.println(course_context.getCourse_id());
                course_contextDao.saveCourseContent(course_context);
            }
        }




    }

    @Override
    public List<Course> findStudyByUserId(String users_id, String catagory, Integer page) {
        PageHelper.startPage(page,15);
        return courseDao.findStudyByUserid(users_id,catagory);
    }

    @Override
    public boolean findAttentionByCourseid(String courseId, int id) throws Exception {
        try{
            String attention_id= attention_courseDao.findByCourseid(courseId,id);
            if (attention_id==null){
                return false;
            }
            return true;
        }catch (Exception e){
            System.out.println("CourseServiceImpl findAttentionByCourseid异常");
            return false;
        }


    }

    @Override
    public void removeAttention(String course_id, Integer users_id) throws Exception {
        attention_courseDao.removeAttention(course_id,users_id);
    }

    @Override
    public void addAttention(String course_id, Integer users_id) throws Exception {
        attention_courseDao.addAttention(course_id,users_id);
    }

    @Override
    public void addByCourseid(String course_id) throws Exception {
        courseDao.addAttention(course_id);
    }

    @Override
    public void lessByCourseid(String course_id) throws Exception {
        courseDao.lessAttention(course_id);
    }

    @Override
    public void addStudies(String courseId) throws Exception {
        courseDao.addStudies(courseId);
    }

    @Override
    public Teacher findTeacher(String courseId) throws Exception {
        return teacherDao.findTeacher(courseId);
    }

    @Override
    public UserDetail findByUserId(int users_id) throws Exception {
        return userDetailDao.findByUserId(users_id);
    }


    private void saveFile(MultipartFile upload, String path,String fileName) throws Exception{
        File file=new File(path);
        if(!file.exists()){
            file.mkdirs();
        }
        upload.transferTo(new File(path,fileName));
    }


}
