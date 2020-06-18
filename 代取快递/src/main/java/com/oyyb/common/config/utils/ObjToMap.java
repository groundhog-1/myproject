package com.oyyb.common.config.utils;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * @author: oyyb
 * @data: 2020-04-30
 * @version: 1.0.0
 * @descript:
 */
public class ObjToMap {

    public static  Map<String,Object> parseObj(Object obj){
        Map<String,Object> map = new HashMap<>();

        //获取反射对象
        Class<?> aClass = obj.getClass();
        Field[] fields = aClass.getDeclaredFields();



        Arrays.stream(fields).forEach(f->{
            try {

                String name = f.getName();
                Method method = aClass.getDeclaredMethod("get" + name.substring(0, 1).toUpperCase() + name.substring(1), new Class<?>[0]);
                String value =  method.invoke(obj) == null ? null : (method.invoke(obj) + "");
                map.put(name,value);

            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }

        });



        return map;

    }
}
