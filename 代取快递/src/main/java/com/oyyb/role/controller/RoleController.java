package com.oyyb.role.controller;

import com.oyyb.role.service.RoleServiceImpl;
import oracle.jdbc.proxy.annotation.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author: oyyb
 * @data: 2020-04-25
 * @version: 1.0.0
 * @descript:
 */

@Controller
@RequestMapping("role")
public class RoleController {

    @Autowired
    private RoleServiceImpl roleService;

    //新增权限
    @PostMapping("add")
    public ResponseEntity<Void> addRole(String roleName){
        roleService.addRole(roleName);
        return ResponseEntity.status(HttpStatus.CREATED).build();

    }

    @DeleteMapping("delete")
    public ResponseEntity<Void> deleteRole(String roleName){
        roleService.deleteRole(roleName);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }
}
