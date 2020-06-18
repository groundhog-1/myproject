package com.oyyb.address.mapper;

import com.oyyb.address.model.Address;
import com.oyyb.common.config.utils.BaseMapper;
import com.sun.jndi.cosnaming.IiopUrl;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author: oyyb
 * @data: 2020-04-27
 * @version: 1.0.0
 * @descript:
 */

@Mapper
public interface AddressMapper extends BaseMapper<Address> {
}
