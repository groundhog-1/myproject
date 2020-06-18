package com.oyyb.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

//    Date转字符串
    public static String date2String(Date date,String patt){
        SimpleDateFormat sdf=new SimpleDateFormat(patt);
        return sdf.format(date);
    }
//    字符串转日期
    public static Date string2Date(String str,String patt) throws ParseException {
        SimpleDateFormat sdf=new SimpleDateFormat(patt);
        return sdf.parse(str);
    }
}
