package com.oyyb.test;

import com.oyyb.common.config.enums.ExceptionEnums;
import com.oyyb.common.config.exception.MyException;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
public class TestSpring_Mybatis {
    @Test
    public void test1(){
        log.info("ssss");
        //throw new MyException(ExceptionEnums.USERINFO_ERROR);
        List<String> sss = Arrays.asList("1","2","3");

//        Arrays.stream(sss).map(s -> s + "5").collect(Collectors.toList());
        /*Arrays.stream(sss).forEach(s -> {
            s="5";
        });*/
        sss.forEach(s -> s=s+"5");


        System.out.println(sss);

    }
}
