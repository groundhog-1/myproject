package com.oyyb.service;

import com.oyyb.domain.Orders;

import java.util.List;

public interface OrderService {
    Orders findByid(String ordersId);

    List<Orders> findAll(int page,int size);
}
