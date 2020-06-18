package com.oyyb.service.impl;

import com.github.pagehelper.PageHelper;
import com.oyyb.dao.OrderDao;
import com.oyyb.domain.Orders;
import com.oyyb.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;

    @Override
    public Orders findByid(String ordersId) {
        return orderDao.findById(ordersId);
    }

    @Override
    public List<Orders> findAll(int page,int size) {
//        开始页，每页条数，必须写在分页findAll之前
        PageHelper.startPage(page,size);
        return orderDao.findAll();
    }
}
