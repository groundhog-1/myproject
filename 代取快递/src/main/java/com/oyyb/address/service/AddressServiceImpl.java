package com.oyyb.address.service;

import com.oyyb.address.mapper.AddressMapper;
import com.oyyb.address.model.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: oyyb
 * @data: 2020-04-27
 * @version: 1.0.0
 * @descript:
 */

@Service
public class AddressServiceImpl {

    @Autowired
    private AddressMapper addressMapper;


    public List<Address> findAll() {
        return addressMapper.selectAll();
    }
}
