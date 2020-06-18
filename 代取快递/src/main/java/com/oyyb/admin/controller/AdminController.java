package com.oyyb.admin.controller;

import com.oyyb.admin.service.AdminServiceImpl;
import com.oyyb.order.model.Order;
import com.oyyb.order.model.vo.OrderVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * @author: oyyb
 * @data: 2020-04-25
 * @version: 1.0.0
 * @descript:
 */
@Controller
@RequestMapping("admin")
public class AdminController {

    @Autowired
    private AdminServiceImpl adminService;

    //添加权限 for user
    @PostMapping("addRole")
    public ResponseEntity<String> addRoleForUser(String username){

        int num = adminService.addRoleForUser(username);
        if (num == 1) return ResponseEntity.status(HttpStatus.OK).body("ok");
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("授权失败！");

    }

    // 删除权限
    @DeleteMapping("removeRole")
    public ResponseEntity<String> removeRole(String username){
        int num = adminService.removeRole(username);
        if (num == 1) return ResponseEntity.status(HttpStatus.OK).body("ok");
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("撤权失败！");

    }

    //todo 查询订单 分页查询 及条件查询
    @GetMapping("query")
    public ModelAndView query( OrderVo orderVo){
        ModelAndView mv = adminService.queryWithOrderVo(orderVo,orderVo.getPage());
        mv.setViewName("admin/admin_order");
        return mv;
    }

    //todo 修改订单
    @PutMapping("modifyOrder")
    public ResponseEntity<Void> modifyOrder(@RequestBody Order order){

        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }

    //todo 删除用户
    @DeleteMapping("delete/{id}")
    public ResponseEntity<String> deleteByOrderId(@PathVariable("id")Long orderId){
        int num = adminService.deleteOrderByOrderId(orderId);
        if (num == 1) return ResponseEntity.status(HttpStatus.OK).body("ok");

        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("删除失败！");

    }



}
