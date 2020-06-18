package com.oyyb.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

public class BCryptPasswordEncoderUtils {
    private static BCryptPasswordEncoder bCryptPasswordEncoder=new BCryptPasswordEncoder();
    public  String endcodePassword(String password){
        return bCryptPasswordEncoder.encode(password);
    }

    public  boolean matches(String password,String endcodePassword){
        return bCryptPasswordEncoder.matches(password,endcodePassword);
    }

    public static void main(String[] args) {
//        System.out.println(endcodePassword("124546"));
//        System.out.println(bCryptPasswordEncoder.matches("123456","$2a$10$2lBDcTIFiF1l6GUU57RDUO8VuXHKTBVjEVB/PDS0aHmqCKaNyoZEG"));
        System.out.println(bCryptPasswordEncoder.encode("123456"));
    }
}
