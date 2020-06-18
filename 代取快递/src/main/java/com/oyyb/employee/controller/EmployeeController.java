package com.oyyb.employee.controller;

import com.oyyb.common.config.enums.ExceptionEnums;
import com.oyyb.employee.service.EmployeeServiceImpl;
import com.oyyb.release.model.Release;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author: oyyb
 * @data: 2020-04-25
 * @version: 1.0.0
 * @descript:
 */

@Controller
@RequestMapping("emp")
public class EmployeeController {

    @Autowired
    private EmployeeServiceImpl employeeService;

    //接单
    @PostMapping("order")
    public ResponseEntity<String> order(Long releaseId){


        ExceptionEnums order = employeeService.order(releaseId);

        return ResponseEntity.status(order.getCode()).body(order.getMsg());
    }

    //查询 正在派送 已完成 未付款
    @GetMapping("findAll")
    public ModelAndView findAll(@RequestParam(name = "status",required = false) Byte orderStatus,
                                @RequestParam(name = "pay",required = false) Byte isPay,
                                @RequestParam(name = "page",required = false) Integer page,
                                @RequestParam(name = "flag",required = false)Integer flag){
        ModelAndView mv = employeeService.findByStatusOrPayAndPage(orderStatus,isPay,page);
        if (flag == null){
            mv.setViewName("emp/emp_order_content");
        }else if (flag == 1){
            mv.setViewName("emp/emp_orders");
        }

        return mv;

    }

    //todo 取消订单
    @PutMapping("cacel")
    public ResponseEntity<String> cacel(@RequestParam("oid")Long oid){
        ExceptionEnums enums = employeeService.cacel(oid);
        return ResponseEntity.status(enums.getCode()).body(enums.getMsg());
    }

    //todo  提醒付款


    // 完成订单
    @PutMapping("finish")
    public ResponseEntity<String> finish(@RequestParam("oid")Long oid){
        ExceptionEnums enums = employeeService.finish(oid);

        return ResponseEntity.status(enums.getCode()).body(enums.getMsg());
    }



}
