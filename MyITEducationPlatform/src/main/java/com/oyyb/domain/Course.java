package com.oyyb.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public class Course {
    private String id;
    private int category; //0 免费 1会员
    private String categoryStr;
    private String title; //标题
    private int attentions;  // 关注数
    @DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
    private Date classStart; //开课时间
    private Date classEnd;  //结课时间
    private String courseimg;
    private String introduction; //简介
    private int studys; //课程图片
    private int cm_id; //所属模块
    private int stage; //所属阶段 1初级阶段 2中级阶段 3高级阶段
    private Integer teacher_id; // 发布老师
    private String label_id;

    private List<Course_Context> course_contexts;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public String getCategoryStr() {
        return categoryStr;
    }

    public void setCategoryStr(String categoryStr) {
        this.categoryStr = categoryStr;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getAttentions() {
        return attentions;
    }

    public void setAttentions(int attentions) {
        this.attentions = attentions;
    }

    public Date getClassStart() {
        return classStart;
    }

    public String getCourseimg() {
        return courseimg;
    }

    public void setCourseimg(String courseimg) {
        this.courseimg = courseimg;
    }

    public void setClassStart(Date classStart) {
        this.classStart = classStart;
    }

    public Date getClassEnd() {
        return classEnd;
    }

    public void setClassEnd(Date classEnd) {
        this.classEnd = classEnd;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public int getStudys() {
        return studys;
    }

    public void setStudys(int studys) {
        this.studys = studys;
    }

    public int getCm_id() {
        return cm_id;
    }

    public void setCm_id(int cm_id) {
        this.cm_id = cm_id;
    }

    public int getStage() {
        return stage;
    }

    public void setStage(int stage) {
        this.stage = stage;
    }

    public Integer getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(Integer teacher_id) {
        this.teacher_id = teacher_id;
    }

    public List<Course_Context> getCourse_contexts() {
        return course_contexts;
    }

    public void setCourse_contexts(List<Course_Context> course_contexts) {
        this.course_contexts = course_contexts;
    }

    public String getLabel_id() {
        return label_id;
    }

    public void setLabel_id(String label_id) {
        this.label_id = label_id;
    }

    @Override
    public String toString() {
        return "Course{" +
                "id='" + id + '\'' +
                ", category=" + category +
                ", categoryStr='" + categoryStr + '\'' +
                ", title='" + title + '\'' +
                ", attentions=" + attentions +
                ", classStart=" + classStart +
                ", classEnd=" + classEnd +
                ", courseimg='" + courseimg + '\'' +
                ", introduction='" + introduction + '\'' +
                ", studys=" + studys +
                ", cm_id=" + cm_id +
                ", stage=" + stage +
                ", teacher_id=" + teacher_id +
                ", label_id='" + label_id + '\'' +
                ", course_contexts=" + course_contexts +
                '}';
    }
}
