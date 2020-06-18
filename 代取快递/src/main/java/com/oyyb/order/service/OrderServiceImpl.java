package com.oyyb.order.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oyyb.address.mapper.AddressMapper;
import com.oyyb.address.model.Address;
import com.oyyb.order.mapper.OrderMapper;
import com.oyyb.order.model.Order;
import com.oyyb.release.mapper.ReleaseMapper;
import com.oyyb.release.model.Release;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import tk.mybatis.mapper.entity.Example;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

/**
 * @author: oyyb
 * @data: 2020-04-25
 * @version: 1.0.0
 * @descript:
 */
@Service
public class OrderServiceImpl {
    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private AddressMapper addressMapper;

    @Autowired
    private ReleaseMapper releaseMapper;

    private static final int RELEASE_DEFAULT_SIZE = 10;

    private static final int ORDER_DEFAULT_SIZE = 10;

    public Integer addOrder(Order order) {
        //判断数据
        if (StringUtils.isAnyBlank(order.getEmployeeName(),
                order.getOrderId()+"",
                order.getAmount()+"",
                order.getOrderTime()+"",
                order.getReleaseId()+"",
                order.getPrice()+"")){
            return 0;
        }
        return orderMapper.insertSelective(order);

    }

    public ModelAndView findAll() {
        ModelAndView mv =new ModelAndView();

        //添加address 快递点
        List<Address> addresses = addressMapper.selectAll();
        mv.addObject("addresses",addresses);
        //查询第一个地址的第一页数据


        String firstAddress = addresses.get(0).getAddress();
        Release release = new Release();
        release.setDelivery_address(firstAddress);
        release.setIsOrders((byte)0);


        PageHelper.startPage(1,RELEASE_DEFAULT_SIZE);
        List<Release> releases = releaseMapper.select(release);

        PageInfo<Release> pageInfo = new PageInfo<>(releases);
        mv.addObject("pageinfo",pageInfo);

        return mv;
    }

    public ModelAndView findHallByAddr(String delivery_address, Integer page) {
        if (page == null || page == 0)page = 1;
        ModelAndView mv = new ModelAndView();

        try {
            delivery_address = new String(delivery_address.getBytes("ISO8859_1"), "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }


        Release release = new Release();
        release.setDelivery_address(delivery_address);
        release.setIsOrders((byte)0);


        PageHelper.startPage(page,RELEASE_DEFAULT_SIZE);
        List<Release> releases = releaseMapper.select(release);

        PageInfo<Release> pageInfo = new PageInfo<>(releases);
        mv.addObject("pageinfo",pageInfo);

        return mv;

    }

    public ModelAndView findDetailByOrderId(Long orderId) {
        ModelAndView mv = new ModelAndView();

        Order order = orderMapper.selectByOrderId(orderId);
        mv.addObject("order",order);

        return mv;
    }

    public ModelAndView findAllByAdmin() {
        ModelAndView mv = new ModelAndView();

        PageHelper.startPage(1,ORDER_DEFAULT_SIZE);
        List<Order> orders = orderMapper.findAll();
        PageInfo<Order> pageInfo = new PageInfo<>(orders);
        mv.addObject("pageinfo",pageInfo);

        return mv;

    }
}
