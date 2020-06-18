package com.oyyb.order.controller;

import com.oyyb.order.service.OrderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.net.URLDecoder;

/**
 * @author: oyyb
 * @data: 2020-04-26
 * @version: 1.0.0
 * @descript:
 */

@Controller
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderServiceImpl orderService;

    //todo 订单大厅
    @GetMapping("hall")
    public ModelAndView hall(){
        ModelAndView mv = orderService.findAll();
        mv.setViewName("emp/emp_order_hall_content");
        return mv;
    }

    //根据地质查询发布单号
    @GetMapping("hall_addr")
    public ModelAndView hallByAddr(@RequestParam("addr") String delivery_address, @RequestParam("page") Integer page){

        ModelAndView mv = orderService.findHallByAddr(delivery_address,page);
        mv.setViewName("emp/release_hall");
        return mv;
    }

    @GetMapping("detail")
    public ModelAndView detail(@RequestParam("oid") Long orderId){
        ModelAndView mv = orderService.findDetailByOrderId(orderId);

        mv.setViewName("order_detail");
        return mv;
    }

    //查询所有订单
    @GetMapping("findAll")
    public ModelAndView findAll(){
        ModelAndView mv = orderService.findAllByAdmin();

        mv.setViewName("admin/admin_order_content");
        return mv;
    }




}
