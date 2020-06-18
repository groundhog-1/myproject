package com.oyyb.common.config.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * @author: oyyb
 * @data: 2020-04-24
 * @version: 1.0.0
 * @descript:
 */
@Getter
@NoArgsConstructor
@AllArgsConstructor
public enum ExceptionEnums {
    USERINFO_ERROR(404,"用户信息错误" ),
    CODE_ERROR(404,"验证码错误" ),
    ROLE_NAME_EXISTED(404,"权限名称已存在" ),
    RELEASE_INFO_ERROR(404,"发布订单信息有误" ),
    RELEASE_ORDER_STATUS_ERROR(404,"该订单已被接单，无法取消" ),
    ORDER_ADD_ERROR(500,"订单创建失败"),
    CREATE_SUCCESS(200,"ok"),
    ORDER_INFO_ERROR(404,"订单信息错误"),
    MESSAGE_SEND_FAILED(404,"消息发送失败"),
    MESSAGE_READ_FIAL(500,"标识已读失败"),
    RELEASE_CACEL_FAIL(404,"发布单号取消失败"),
    RELEASE_MODIFY_FAIL(404,"发布单号修改失败");

    private int code;
    private String msg;


}
