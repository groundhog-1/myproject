package com.oyyb.user.model;

import com.oyyb.role.model.Role;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.List;

@Data
@NoArgsConstructor
@Table(name = "tb_user")
public class UserInfo {

    @Id
    private Integer id;
    private String username;
    private String password;
    private String phone;
    private String address;
    private String email;
    @Column(name = "realname")
    private String realName;
    //是否有效
    private byte isvalid;


    @Transient
    private List<Role> roles;


}
