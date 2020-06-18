package com.oyyb.domain;

public class UserDetail {
    private String avatar;//头像
    private int users_id;
    private String username;
    private String phone;

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getUsers_id() {
        return users_id;
    }

    public void setUsers_id(int users_id) {
        this.users_id = users_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "UserDetail{" +
                "avatar='" + avatar + '\'' +
                ", users_id=" + users_id +
                ", username='" + username + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
