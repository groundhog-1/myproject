package com.oyyb.message.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * @author: oyyb
 * @data: 2020-04-29
 * @version: 1.0.0
 * @descript:
 */

@Data
@NoArgsConstructor
@Table(name = "tb_message")
public class Message {
    @Id
    private Long mid;

    //内容
    private String content;

    //发起人
    private String sponsor;

    //接受人
    private String recipient;

    //是否投诉  0:不是投诉信息 1:是投诉信息
    @Column(name = "isComplaint")
    private Byte isComplaint;

    //投诉对象
    private String respondent;

    //发布时间
    private Date releaseTime;

    //是否已读 0：未读 1：已读
    @Column(name = "isRead")
    private Byte isRead;

    //读取时间
    private Date readTime;

    //投诉单号
    @Column(name = "orderId")
    private Long orderId;

}
