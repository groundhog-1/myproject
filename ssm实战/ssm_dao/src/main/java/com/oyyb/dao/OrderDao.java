package com.oyyb.dao;

import com.oyyb.domain.Member;
import com.oyyb.domain.Orders;
import com.oyyb.domain.Product;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface OrderDao {
    @Select("select * from orders where id=#{ordersId}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "orderNum",column = "orderNum"),
            @Result(property = "orderTime",column = "orderTime"),
            @Result(property = "orderStatus",column = "orderStatus"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "payType",column = "payType"),
            @Result(property = "orderDesc",column = "orderDesc"),
            @Result(property = "product",column = "productId",javaType = Product.class,one = @One(select = "com.oyyb.dao.ProductDao.findById")),
            @Result(property = "member",column = "memberid",javaType = Member.class,one=@One(select = "com.oyyb.dao.MemberDao.findById")),
            @Result(property = "travellers", column="id",javaType = List.class,many = @Many(select = "com.oyyb.dao.TravellerDao.findByOrderId"))
    })
    Orders findById(String ordersId);

    @Select("select * from orders")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "orderNum",column = "orderNum"),
            @Result(property = "orderTime",column = "orderTime"),
            @Result(property = "orderStatus",column = "orderStatus"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "payType",column = "payType"),
            @Result(property = "orderDesc",column = "orderDesc"),
            @Result(property = "product",column = "productId",javaType = Product.class,one = @One(select = "com.oyyb.dao.ProductDao.findById"))
    })
    List<Orders> findAll();
}
