package com.oyyb.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Question_Reply {
    private int id;
    private int respondent_id;
    private int brespondent_id;
    private String content;
    private Date pubdate;
    private String pubdateStr;
    private String question_course_id;

    private UserInfo userInfo;
    private UserInfo buserInfo;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRespondent_id() {
        return respondent_id;
    }

    public void setRespondent_id(int respondent_id) {
        this.respondent_id = respondent_id;
    }

    public int getBrespondent_id() {
        return brespondent_id;
    }

    public void setBrespondent_id(int brespondent_id) {
        this.brespondent_id = brespondent_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getPubdate() {
        return pubdate;
    }

    public void setPubdate(Date pubdate) {
        this.pubdate = pubdate;
    }

    public String getPubdateStr() {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        return sdf.format(pubdate);
    }

    public void setPubdateStr(String pubdateStr) {
        this.pubdateStr = pubdateStr;
    }

    public String getQuestion_course_id() {
        return question_course_id;
    }

    public void setQuestion_course_id(String question_course_id) {
        this.question_course_id = question_course_id;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public UserInfo getBuserInfo() {
        return buserInfo;
    }

    public void setBuserInfo(UserInfo buserInfo) {
        this.buserInfo = buserInfo;
    }
}
