package com.oyyb.address.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author: oyyb
 * @data: 2020-04-27
 * @version: 1.0.0
 * @descript:
 */

@Data
@NoArgsConstructor
@Table(name = "tb_address")
public class Address {

    @Id
    private Integer aid;

    private String address;

    private String description;
}
