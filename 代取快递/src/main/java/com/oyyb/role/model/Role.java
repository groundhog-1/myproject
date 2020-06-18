package com.oyyb.role.model;


import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Data
@NoArgsConstructor
@Table(name = "tb_role")
public class Role {

    @Id
    private Integer id;
    private String name;

    @Transient
    private String description;


}
