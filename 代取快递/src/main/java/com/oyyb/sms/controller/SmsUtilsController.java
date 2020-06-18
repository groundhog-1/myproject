package com.oyyb.sms.controller;

import com.oyyb.sms.service.SmsService;
import com.oyyb.sms.utils.SmsUtils;
import oracle.jdbc.proxy.annotation.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * @author: oyyb
 * @data: 2020-04-24
 * @version: 1.0.0
 * @descript:
 */

@RestController
@RequestMapping("sms")
public class SmsUtilsController {

    @Autowired
    private SmsService smsService;

    @PostMapping("phone")
    @ResponseBody
    public ResponseEntity<Void> phone(String phone){

        smsService.sendCode(phone);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }
}
