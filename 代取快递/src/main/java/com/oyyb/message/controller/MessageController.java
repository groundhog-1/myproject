package com.oyyb.message.controller;

import com.oyyb.common.config.enums.ExceptionEnums;
import com.oyyb.message.service.MessageServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * @author: oyyb
 * @data: 2020-04-29
 * @version: 1.0.0
 * @descript:
 */

@Controller
@RequestMapping("msg")
public class MessageController {

    @Autowired
    private MessageServiceImpl messageService;

    //flag:null 未读 ：1已发布的 ：2 已读
    @GetMapping("query")
    public ModelAndView query(@RequestParam(name = "read",required = false) Byte isRead,
                              @RequestParam(name = "page",required = false) Integer page,
                              @RequestParam(name = "flag",required = false)Integer flag){
        ModelAndView mv = messageService.query(isRead,page,flag);


        mv.setViewName(flag == null ? "msg/msg_user" : "msg/msg");

        return mv;
    }

    //已读
    @PutMapping("read")
    public ResponseEntity<String> read(@RequestParam("mid") Long mid){

        ExceptionEnums enums = messageService.read(mid);
        return ResponseEntity.status(enums.getCode()).body(enums.getMsg());
    }

    @GetMapping("queryUnread")
    public ResponseEntity<Integer> unread(HttpServletRequest request){
        int num = messageService.unread(request);

        return ResponseEntity.status(HttpStatus.OK).body(num);
    }
}
