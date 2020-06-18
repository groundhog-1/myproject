package com.oyyb.dao;

import com.oyyb.domain.Traveller;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface TravellerDao {
    @Select("select * from traveller where id in (select travellerid from order_traveller where  orderid=#{orderid})")
    List<Traveller> findByOrderId(String orderid);
}
