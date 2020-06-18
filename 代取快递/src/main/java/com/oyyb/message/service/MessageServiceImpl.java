package com.oyyb.message.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oyyb.common.config.enums.ExceptionEnums;
import com.oyyb.common.config.utils.SpringSecurityUtil;
import com.oyyb.message.mapper.MessageMapper;
import com.oyyb.message.model.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import tk.mybatis.mapper.entity.Example;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * @author: oyyb
 * @data: 2020-04-29
 * @version: 1.0.0
 * @descript:
 */

@Service
public class MessageServiceImpl {
    @Autowired
    private MessageMapper messageMapper;

    @Autowired
    private HttpServletRequest request;

    private static final int MESSAGE_DEFAULT_SZIE = 10;

    public ModelAndView query(Byte isRead, Integer page,Integer flag) {
        //flag:0 未读 ：2已发布的 ：1 已读
        ModelAndView mv = new ModelAndView();
        if (isRead == null)isRead = 0;
        if (page == null || page == 0)page = 1;
        if (flag == null)flag = 0 ;

        //获取用户
        String username = SpringSecurityUtil.username(request);

        PageHelper.startPage(page,MESSAGE_DEFAULT_SZIE);
        Example example = new Example(Message.class);
        //未读
        if (flag == 0){

            example.and().andEqualTo("recipient",username);
            example.and().andEqualTo("isRead",isRead);
            example.orderBy("releaseTime").desc();
            List<Message> messages = messageMapper.selectByExample(example);
            PageInfo<Message> pageInfo = new PageInfo<>(messages);
            mv.addObject("pageinfo",pageInfo);
        }else if (flag == 2){
            //已发布
            example.and().andEqualTo("sponsor",username);
            example.orderBy("releaseTime").desc();
            List<Message> messages = messageMapper.selectByExample(example);
            PageInfo<Message> pageInfo = new PageInfo<>(messages);
            mv.addObject("pageinfo",pageInfo);
        }else if (flag == 1){
            //已读
            example.and().andEqualTo("recipient",username);
            example.and().andEqualTo("isRead",isRead);
            example.orderBy("readTime").desc();
            List<Message> messages = messageMapper.selectByExample(example);
            PageInfo<Message> pageInfo = new PageInfo<>(messages);
            mv.addObject("pageinfo",pageInfo);

        }
        mv.addObject("username",SpringSecurityUtil.username(request));


        return mv;



    }

    public ExceptionEnums read(Long mid) {
        if (mid == null || mid ==0)return ExceptionEnums.MESSAGE_READ_FIAL;
        Message message = new Message();

        message.setMid(mid);

        message.setIsRead((byte)1);
        message.setReadTime(new Date());

        int count = messageMapper.updateByPrimaryKeySelective(message);

        return count == 1 ? ExceptionEnums.CREATE_SUCCESS : ExceptionEnums.MESSAGE_READ_FIAL;

    }

    public int unread(HttpServletRequest request) {
        String username = SpringSecurityUtil.username(request);

        Message message = new Message();
        message.setRecipient(username);
        message.setIsRead((byte)0);

        return messageMapper.selectCount(message);

    }
}
