package com.oyyb.sms.service;

import com.aliyuncs.exceptions.ClientException;
import com.oyyb.sms.utils.JsonUtils;
import com.oyyb.sms.utils.NumberUtils;
import com.oyyb.sms.utils.SmsUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @author: oyyb
 * @data: 2020-04-24
 * @version: 1.0.0
 * @descript:
 */
@Service
@Slf4j
public class SmsService {

    @Autowired
    private SmsUtils smsUtils;

    private static final String KEY_PREFIX = "sms:phone:";

    @Autowired
    private StringRedisTemplate redisTemplate;

    public void sendCode(String phone) {
        try{
            String code = NumberUtils.generateCode(6);

            Map<String,String> map = new HashMap<>();
            map.put("code",code);
            smsUtils.sendSms(phone, JsonUtils.serialize(map));
            log.info("[短信发送] " + phone + " 发送成功");

            String key = KEY_PREFIX + phone;
            //存入redis 有效时间三分钟
            redisTemplate.opsForValue().set(key,code,3, TimeUnit.MINUTES);
        } catch (ClientException e) {

            log.error("[短信发送]" + phone + " 发送失败",e);
        }

    }
}
