package com.oyyb.common.config.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BCryptPasswordEncoderUtils {
    private static BCryptPasswordEncoder bCryptPasswordEncoder=new BCryptPasswordEncoder(5);
    public static String endcodePassword(String password){
        return bCryptPasswordEncoder.encode(password);
    }

    public static boolean match(String password,String encryptPassword){
        return bCryptPasswordEncoder.matches(password,encryptPassword);
    }

    public static void main(String[] args) {
//        System.out.println(endcodePassword("124546"));
//        System.out.println(bCryptPasswordEncoder.matches("123456","$2a$10$2lBDcTIFiF1l6GUU57RDUO8VuXHKTBVjEVB/PDS0aHmqCKaNyoZEG"));
        System.out.println(bCryptPasswordEncoder.encode("admin"));
    }
}
