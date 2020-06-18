package com.oyyb.user.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author: oyyb
 * @data: 2020-05-01
 * @version: 1.0.0
 * @descript:
 */
@Data
@NoArgsConstructor
public class UserInfoVo {


    private String username;

    private String phone;
    private String email;

    private String realName;


    private Integer page;

    // 0：返回admin_user_content 1: amdin_user
    private Integer flag;
}
