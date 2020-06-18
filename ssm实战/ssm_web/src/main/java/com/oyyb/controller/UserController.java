package com.oyyb.controller;

import com.oyyb.domain.Role;
import com.oyyb.domain.UserInfo;
import com.oyyb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/findAll.do")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv=new ModelAndView();
        List<UserInfo> userInfos= userService.findAll();
        mv.addObject("userList",userInfos);
        mv.setViewName("user-list");
        return mv;
    }
    @RequestMapping("/save.do")
    public String save(UserInfo userInfo){
        userService.save(userInfo);
        return "redirect:findAll.do";
    }
    @RequestMapping("/findById.do")
    public ModelAndView findById(String id){
        ModelAndView mv=new ModelAndView();
        UserInfo userInfo= userService.findById(id);
        mv.addObject("user",userInfo);
        mv.setViewName("user-show1");
        return mv;
    }

    @RequestMapping("/findUserByIdAndAllRole.do")
    public ModelAndView findUserByIdAndRole(@RequestParam(name = "id",required = true) String userId) throws Exception {
        ModelAndView mv=new ModelAndView();
        UserInfo userInfo=userService.findById(userId);

        List<Role> othersRoles= userService.findOthersRole(userId);
        mv.addObject("user",userInfo);
        mv.addObject("roleList",othersRoles);
        mv.setViewName("user-role-add");
        return mv;
    }

    @RequestMapping("/addRoleToUser.do")
    public String addRole2User(@RequestParam(name = "userId",required = true)String userId,@RequestParam(name = "ids",required = true)String[] roleId) throws Exception {
        userService.addRole2User(userId,roleId);
        return "redirect:findAll.do";
    }
}
