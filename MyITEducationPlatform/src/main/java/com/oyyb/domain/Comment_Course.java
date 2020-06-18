package com.oyyb.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Comment_Course {
    private int id;
    private int users_id;
    private String course_context_id;
    private Date pubdate;
    private String pubdateStr;
    private String content;
    private String course_context_name;

    private UserDetail userDetail;

    public void setId(int id) {
        this.id = id;
    }

    public int getUsers_id() {
        return users_id;
    }

    public void setUsers_id(int users_id) {
        this.users_id = users_id;
    }

    public String getCourse_context_id() {
        return course_context_id;
    }

    public void setCourse_context_id(String course_context_id) {
        this.course_context_id = course_context_id;
    }

    public Date getPubdate() {
        return pubdate;
    }

    public void setPubdate(Date pubdate) {
        this.pubdate = pubdate;
    }

    public int getId() {
        return id;
    }

    public String getCourse_context_name() {
        return course_context_name;
    }

    public void setCourse_context_name(String course_context_name) {
        this.course_context_name = course_context_name;
    }

    public String getPubdateStr() {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        return sdf.format(pubdate);
    }

    public void setPubdateStr(String pubdateStr) {

        this.pubdateStr = pubdateStr;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public UserDetail getUserDetail() {
        return userDetail;
    }

    public void setUserDetail(UserDetail userDetail) {
        this.userDetail = userDetail;
    }
}
