package com.oyyb.controller;

import com.oyyb.domain.Permission;
import com.oyyb.domain.Role;
import com.oyyb.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv=new ModelAndView();
        List<Role> roles= roleService.findAll();
        mv.addObject("roleList",roles);
        mv.setViewName("role-list");
        return mv;
    }

    @RequestMapping("/save.do")
    public String save(Role role) throws Exception {
        roleService.save(role);
        return "redirect:findAll.do";
    }

    @RequestMapping("/findRoleByIdAndAllPermission.do")
    public ModelAndView findRoleByIdAndAllPermission(@RequestParam(name = "id",required = true) String roleId) throws Exception {
        ModelAndView mv=new ModelAndView();
        Role role=roleService.findById(roleId);
        List<Permission> permissions=roleService.findOtherPermission(roleId);
        mv.addObject("role",role);
        mv.addObject("permissionList",permissions);
        mv.setViewName("role-permssion-add");
        return mv;
    }

    @RequestMapping("/addPermission2Rolle.do")
    public String addPermission2Role(@RequestParam(name = "roleId",required = true) String roleId,@RequestParam(name = "ids",required = true) String[] ids) throws Exception {
        roleService.addPermission2Rolle(roleId,ids);
        return "redirect:findAll.do";
    }
}
