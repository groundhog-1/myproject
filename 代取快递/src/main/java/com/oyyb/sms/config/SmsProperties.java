package com.oyyb.sms.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * @author: oyyb
 * @data: 2020-04-08
 * @version: 1.0.0
 * @descript:
 */

@Configuration
@Data
@PropertySource(value="classpath:sms.properties",encoding = "utf-8")
public class SmsProperties {
    @Value("${sms.accessKeyId}")
    String accessKeyId;

    @Value("${sms.accessKeySecret}")
    String accessKeySecret;

    @Value("${sms.signName}")
    String signName;

    @Value("${sms.verifyCodeTemplate}")
    String verifyCodeTemplate;
}
