package com.oyyb.release.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.Value;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author: oyyb
 * @data: 2020-04-25
 * @version: 1.0.0
 * @descript:
 */

@Data
@Table(name = "tb_release")
@NoArgsConstructor
public class Release {

    //发布单号
    @Id
    @Column(name = "releaseId")
    private Long releaseId;
    //发布时间

    @JsonFormat(pattern = "yyyy-MM-dd hh:mm")
    private Date createTime;

    //快递地点
    private String delivery_address;
    //快递编号 以，分开
    @Column(name = "deliveryNos")
    private String deliveryNos;

    //备注
    private String represent;

    //发布人
    private String username;

    //是否已被接单 0 未接单 1已接单 2已完成
    @Column(name = "isOrders")
    private byte isOrders;

    private String phone;

    //收件人姓名
    private String recipient;

    //收件地址
    private String address;

    //价格
    private Double price;

    //数量
    private Integer amount;

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

   /* public String getCreateTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        return this.createTime == null ? null : sdf.format(this.createTime);
    }*/
}
