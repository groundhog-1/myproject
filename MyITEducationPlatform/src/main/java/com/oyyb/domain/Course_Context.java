package com.oyyb.domain;

public class Course_Context {
    private String id;
    private String course_id;
    private int sectionnumber;
    private String  title;
    private String video;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCourse_id() {
        return course_id;
    }

    public void setCourse_id(String course_id) {
        this.course_id = course_id;
    }

    public int getSectionnumber() {
        return sectionnumber;
    }

    public void setSectionnumber(int sectionnumber) {
        this.sectionnumber = sectionnumber;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }
}
