package com.oyyb.sms.utils;

import com.aliyuncs.exceptions.ClientException;
import com.oyyb.common.config.web.MyWebAppInitializer;
import com.oyyb.common.config.web.SpringConfig;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


/**
 * @author: oyyb
 * @data: 2020-04-24
 * @version: 1.0.0
 * @descript:
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {MyWebAppInitializer.class})
public class SmsUtilsTest {

    @Autowired
    private SmsUtils smsUtils;

    @Test
    public void testSms(){
        try {
            smsUtils.sendSms("13017264220","{'code':'666666'}");
        } catch (ClientException e) {
            e.printStackTrace();
        }

    }

}