package com.oyyb.employee.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oyyb.common.config.enums.ExceptionEnums;
import com.oyyb.common.config.exception.MyException;
import com.oyyb.common.config.utils.SpringSecurityUtil;
import com.oyyb.order.mapper.OrderMapper;
import com.oyyb.order.model.Order;
import com.oyyb.order.service.OrderServiceImpl;
import com.oyyb.order.utils.IdWorker;
import com.oyyb.release.mapper.ReleaseMapper;
import com.oyyb.release.model.Release;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * @author: oyyb
 * @data: 2020-04-25
 * @version: 1.0.0
 * @descript:
 */
@Service
public class EmployeeServiceImpl {

    @Autowired
    private IdWorker idWorker;

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private ReleaseMapper releaseMapper;

    @Autowired
    private OrderServiceImpl orderService;

    @Autowired
    private OrderMapper orderMapper;

    private static final int ORDER_DEFAULT_SIZE = 10;

    private static final String ROLE_USER = "ROLE_USER";
    private static final String ROLE_EMPLOYEE = "ROLE_EMPLOYEE";
    private static final String ROLE_ADMIN = "ROLE_ADMIN";


    //防止脏读等问题
    @Transactional
    public synchronized ExceptionEnums order(Long releaseId) {
        try{
            //判断发布的单号是否存在
            Release release = null;
            release = releaseMapper.selectByPrimaryKey(releaseId);
            if (release == null){
                return ExceptionEnums.RELEASE_INFO_ERROR;
            }

            //获取用户信息

            String employee_name = SpringSecurityUtil.username(request);
            //生成订单id
            Order order = new Order();

            Long orderId = idWorker.nextId();
            order.setOrderId(orderId);
            order.setReleaseId(releaseId);
            order.setEmployeeName(employee_name);
            //获取数量
            int amount = release.getAmount();
            order.setAmount(amount);
            //计算价格
            order.setPrice(release.getPrice());
            //接单时间
            order.setOrderTime(new Date());

            //插入订单表
            int count = orderService.addOrder(order);
            if (count != 1) throw new MyException(ExceptionEnums.ORDER_ADD_ERROR);

            //修改用户发布单状态
            release.setIsOrders((byte) 1);
            releaseMapper.updateByPrimaryKeySelective(release);

            return ExceptionEnums.CREATE_SUCCESS;
        }catch (MyException e){
            e.printStackTrace();
            return ExceptionEnums.RELEASE_INFO_ERROR;
        }





    }

    public ModelAndView findByStatusOrPayAndPage(Byte orderStatus, Byte isPay, Integer page) {
        ModelAndView mv = new ModelAndView();


        //todo 用户与派送员查询
        String username = SpringSecurityUtil.username(request);

        List<String> roles = SpringSecurityUtil.getRole(request);



        Map<String,Object> param = new HashMap<>();

        if (orderStatus != null) {
            if (orderStatus == 0 || orderStatus == 1){
                param.put("orderStatus", Arrays.asList(0,1));
            }else if (orderStatus == 2 || orderStatus == 3){
                param.put("orderStatus", Arrays.asList(2,3));
            }
        }
        param.put("username",username);
        if (roles.contains(ROLE_USER)){
            param.put("role",ROLE_USER);
        }else if(roles.contains(ROLE_EMPLOYEE)){
            param.put("role",ROLE_EMPLOYEE);
        }else if (roles.contains(ROLE_ADMIN)){
            param.put("role",ROLE_ADMIN);
        }

        if (isPay != null)param.put("isPay",isPay);
        if (page == null || page ==0)page = 1;

        PageHelper.startPage(page,ORDER_DEFAULT_SIZE);
        List<Order> select = orderMapper.selectOrder(param);
        PageInfo<Order> pageInfo = new PageInfo<>(select);
        mv.addObject("pageinfo",pageInfo);
        return mv;

    }

    public ExceptionEnums finish(Long oid) {
        Order order = orderMapper.selectByPrimaryKey(oid);
        if (order == null) return ExceptionEnums.ORDER_INFO_ERROR;

        order.setFinishTime(new Date());
        order.setOrderStatus((byte)(order.getOrderStatus() + 2));

        int count = orderMapper.updateByPrimaryKeySelective(order);

        return count == 1 ? ExceptionEnums.CREATE_SUCCESS : ExceptionEnums.ORDER_INFO_ERROR;

    }

    @Transactional
    public ExceptionEnums cacel(Long oid) {
        Order order = orderMapper.selectByPrimaryKey(oid);
        if (order == null) return ExceptionEnums.ORDER_INFO_ERROR;
        //将订单作废
        order.setIsValid((byte)1);

        int count = orderMapper.updateByPrimaryKeySelective(order);
        if (count != 1)return ExceptionEnums.ORDER_INFO_ERROR;

        //还原发布单号的状态
        Long releaseId = order.getReleaseId();
        Release release = new Release();
        release.setReleaseId(releaseId);
        release.setIsOrders((byte)0);
        int i = releaseMapper.updateByPrimaryKeySelective(release);


        return ExceptionEnums.CREATE_SUCCESS;
    }
}
