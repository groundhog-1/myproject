package com.oyyb.pay.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.oyyb.order.model.Order;
import com.oyyb.pay.service.AlipayServiceImpl;
import com.oyyb.pay.util.AlipayConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * @author: oyyb
 * @data: 2020-04-29
 * @version: 1.0.0
 * @descript:
 */
@Configuration
@RequestMapping("alipay")
public class AlipayController {

    @Autowired
    private AlipayServiceImpl alipayService;

    //支付
    @GetMapping("pay")
    public void pay(@RequestParam("oid") Long orderId, HttpServletRequest request, HttpServletResponse response){

        alipayService.pay(orderId,request,response);
    }

    //支付成功后 处理数据
    @GetMapping("/return_url")
    public String returnUrl(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, AlipayApiException {

        return alipayService.returnUrl(request,response);


    }

    @GetMapping("/notify_url")
    public String notifyUrl(){
        return "ok";
    }
}
