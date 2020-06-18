package com.oyyb.domain;

import java.util.Date;

public class Course_Reply {
    private String id;
    private int respondent_id;
    private int brespondent_id;
    private String content;
    private int commentcourse_id;
    private Date pubdate;

    private UserDetail respondent;
    private UserDetail brespondent;
    public String getId() {
        return id;
    }

    public void setId(String id) {
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

    public int getCommentcourse_id() {
        return commentcourse_id;
    }

    public void setCommentcourse_id(int commentcourse_id) {
        this.commentcourse_id = commentcourse_id;
    }

    public Date getPubdate() {
        return pubdate;
    }

    public void setPubdate(Date pubdate) {
        this.pubdate = pubdate;
    }

    public UserDetail getRespondent() {
        return respondent;
    }

    public void setRespondent(UserDetail respondent) {
        this.respondent = respondent;
    }

    public UserDetail getBrespondent() {
        return brespondent;
    }

    public void setBrespondent(UserDetail brespondent) {
        this.brespondent = brespondent;
    }
}
