package com.oyyb.common.config.exception;

import com.oyyb.common.config.enums.ExceptionEnums;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author: oyyb
 * @data: 2020-04-24
 * @version: 1.0.0
 * @descript:
 */


public class MyException extends RuntimeException {


    public MyException(ExceptionEnums exceptionEnums) {
        super(exceptionEnums.getMsg());


    }





}
