package com.oyyb.common.config.utils;

import com.oyyb.order.model.vo.OrderVo;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

import java.util.Map;

import static org.junit.Assert.*;

/**
 * @author: oyyb
 * @data: 2020-04-30
 * @version: 1.0.0
 * @descript:
 */
@Slf4j
public class ObjToMapTest {

    @Test
    public void test1(){
        OrderVo orderVo = new OrderVo();
        orderVo.setDeliveryNos("asfaf");
        orderVo.setOrderId(54654987676L);

        Map<String, Object> map = ObjToMap.parseObj(orderVo);
        System.out.println(1);

    }
}