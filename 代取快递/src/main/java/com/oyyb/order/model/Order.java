package com.oyyb.order.model;

import com.oyyb.release.model.Release;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * @author: oyyb
 * @data: 2020-04-25
 * @version: 1.0.0
 * @descript:
 */
@Data
@NoArgsConstructor
@Table(name = "tb_order")
public class Order {
    //订单编号
    @Id
    @Column(name = "orderId")
    private Long orderId;

    //用户发布单号
    @Column(name = "releaseId")
    private Long releaseId;

    //接单人姓名
    private String employeeName;

    //数量
    private Integer amount;

    //快递数量
    private Double price;

    //接单时间
    private Date orderTime;

    //完成时间
    private Date finishTime;

    //是否作废 0：未作废 1：已做废 默认0
    @Column(name = "isValid")
    private Byte isValid;

    //订单状态 0: 正在派送 未付款 1：正在派送 已付款 2：派送完成 未付款 3：派送完成 已付款 默认0
    private Byte orderStatus;

    //是否付款 0：为付款 1：已付款 默认0
    @Column(name = "isPay")
    private Byte isPay;

    //取件单
    @Transient
    private Release release;

    @Transient
    private String phone;



}
