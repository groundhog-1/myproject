package com.oyyb.controller;

import com.github.pagehelper.PageInfo;
import com.oyyb.domain.Orders;
import com.oyyb.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(name="id",required = true)String ordersId){
        ModelAndView mv=new ModelAndView();
        Orders orders=orderService.findByid(ordersId);
        System.out.println(orders.getProduct());
        mv.addObject("orders",orders);
        mv.setViewName("orders-show");
        return mv;
    }
//    查询全部订单为分页
//    @RequestMapping("/findAll")
//    public ModelAndView findAll(){
//        ModelAndView mv=new ModelAndView();
//        List<Orders> ordersList= orderService.findAll();
//        mv.addObject("ordersList",ordersList);
//        mv.setViewName("orders-list");
//        return mv;
//    }
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,
                                @RequestParam(name = "pageSize",required = true,defaultValue = "3")Integer size){
        ModelAndView mv=new ModelAndView();
        List<Orders> orders = orderService.findAll(page, size);
//        相当于曾经的javabean
        PageInfo pageInfo=new PageInfo(orders);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("orders-page-list");
        return mv;
    }
}
