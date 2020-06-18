package com.oyyb.order.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import java.util.Date;

/**
 * @author: oyyb
 * @data: 2020-04-30
 * @version: 1.0.0
 * @descript:
 */
@Data
@NoArgsConstructor
public class OrderVo {
    private Long orderId;

    //收件人姓名
    private String recipient;

    //接单人姓名
    private String employeeName;

    //接单时间
    private String orderTime;

    //发布人
    private String username;

    @Column(name = "deliveryNos")
    private String deliveryNos;

    private Integer page;
}
