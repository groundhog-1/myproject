package com.oyyb.admin.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oyyb.common.config.utils.ObjToMap;
import com.oyyb.order.mapper.OrderMapper;
import com.oyyb.order.model.Order;
import com.oyyb.order.model.vo.OrderVo;
import com.oyyb.role.mapper.RoleMapper;
import com.oyyb.user.mapper.UserMapper;
import com.oyyb.user.model.UserInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * @author: oyyb
 * @data: 2020-04-25
 * @version: 1.0.0
 * @descript:
 */

@Service
public class AdminServiceImpl {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private OrderMapper orderMapper;

    private static final int ORDER_DEFAULT_SIZE = 10;

    private static final String USER = "USER";
    private static final String EMPLOYEE = "EMPLOYEE";


    @Transactional
    public int addRoleForUser(String username) {

        int n = roleMapper.deleteByUsernameAndUSER(username,USER);
        return roleMapper.insertUserRole(username,EMPLOYEE);

    }

    @Transactional
    public int removeRole(String username) {
        if (StringUtils.isBlank(username))return 0;

        roleMapper.insertUserRole(username,USER);
        return roleMapper.deleteByUsernameAndUSER(username,EMPLOYEE);


    }

    public ModelAndView queryWithOrderVo(OrderVo orderVo, Integer page) {
        //日期转换
        if (!StringUtils.isBlank(orderVo.getOrderTime())){
            orderVo.setOrderTime(orderVo.getOrderTime().replace("T"," "));
        }

        ModelAndView mv = new ModelAndView();
        if (page == null || page == 0)page = 1;
        PageHelper.startPage(page,ORDER_DEFAULT_SIZE);

        Map<String, Object> map = ObjToMap.parseObj(orderVo);

        List<Order> orders = orderMapper.selectByOrderVo(map);

        PageInfo<Order> pageInfo = new PageInfo<>(orders);

        mv.addObject("pageinfo",pageInfo);
        return mv;


    }

    public int deleteOrderByOrderId(Long orderId) {

        return orderMapper.deleteByPrimaryKey(orderId);
    }
}
