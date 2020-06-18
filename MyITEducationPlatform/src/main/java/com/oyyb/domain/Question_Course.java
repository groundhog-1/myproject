package com.oyyb.domain;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Question_Course {
    private String id;
    private String title;
    private String content;
    private String course_context_id;
    private String course_context_name;
    private int users_id;
    private Date pubdate;
    private int visited;
    private String pubdateStr;
    private int discuss;/*1 代表课程分区
                          2. 讨论分区
                          3.技术分区

    */

    private UserInfo userInfo;
    private List<Question_Reply> question_replies;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCourse_context_id() {
        return course_context_id;
    }

    public void setCourse_context_id(String course_context_id) {
        this.course_context_id = course_context_id;
    }

    public int getUsers_id() {
        return users_id;
    }

    public void setUsers_id(int users_id) {
        this.users_id = users_id;
    }


    public Date getPubdate() {
        return pubdate;
    }

    public void setPubdate(Date pubdate) {
        this.pubdate = pubdate;
    }

    public String getCourse_context_name() {
        return course_context_name;
    }

    public void setCourse_context_name(String course_context_name) {
        this.course_context_name = course_context_name;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public int getDiscuss() {
        return discuss;
    }

    public void setDiscuss(int discuss) {
        this.discuss = discuss;
    }

    public String getPubdateStr() {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        return sdf.format(pubdate);
    }

    public void setPubdateStr(String pubdateStr) {
        this.pubdateStr = pubdateStr;
    }

    public int getVisited() {
        return visited;
    }

    public void setVisited(int visited) {
        this.visited = visited;
    }

    public List<Question_Reply> getQuestion_replies() {
        return question_replies;
    }

    public void setQuestion_replies(List<Question_Reply> question_replies) {
        this.question_replies = question_replies;
    }
}
