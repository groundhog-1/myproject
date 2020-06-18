package com.oyyb.order.mapper;

import com.oyyb.common.config.utils.BaseMapper;
import com.oyyb.order.model.Order;
import com.oyyb.release.model.Release;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.jdbc.SQL;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author: oyyb
 * @data: 2020-04-25
 * @version: 1.0.0
 * @descript:
 */
@Mapper
public interface OrderMapper extends BaseMapper<Order> {

    @SelectProvider(type = OrderDynaSqlProvider.class,method = "selectOrderByOrderStatusOrIspay")
    @Results(id = "baseMap",value = {
            @Result(id = true,property = "orderId",column = "orderId"),
            @Result(property = "releaseId",column = "releaseId"),
            @Result(property = "employeeName",column = "employee_name"),
            @Result(property = "amount",column = "amount"),
            @Result(property = "price",column = "price"),
            @Result(property = "orderTime",column = "order_Time"),
            @Result(property = "finishTime",column = "finish_time"),
            @Result(property = "orderStatus",column = "order_status"),
            @Result(property = "isPay",column = "isPay"),
            @Result(property = "phone",column = "employee_name",javaType = String.class,
                    one = @One(select = "com.oyyb.user.mapper.UserMapper.findPhoneByUsername")),
            @Result(property = "release",column = "releaseId",javaType = Release.class,
                    one = @One(select = "com.oyyb.release.mapper.ReleaseMapper.selectByPrimaryKey"))
    })
    List<Order> selectOrder(Map<String,Object> param);


    @Select("select * from tb_order where orderId = #{orderId} and isValid = 0")
    @ResultMap("baseMap")
    Order selectByOrderId(Long orderId);


    @Select("select * from tb_order order by order_time desc")
    @ResultMap("baseMap")
    List<Order> findAll();


    @SelectProvider(type = OrderDynaSqlProvider.class,method = "selectByOrderVo")
    @ResultMap("baseMap")
    List<Order> selectByOrderVo(Map<String, Object> map);




    class OrderDynaSqlProvider{

        public String selectOrderByOrderStatusOrIspay(Map<String,Object> param){
            return new SQL(){
                {
                    SELECT("*");
                    FROM("tb_order");
                    if (param.get("orderStatus") != null){
                        WHERE("order_status in "+getIntList(param.get("orderStatus")));
                    }
                    if (param.get("isPay") != null){
                        WHERE("isPay = #{isPay}");
                    }
                    if (param.get("role").toString().equalsIgnoreCase("ROLE_USER")){
                        WHERE("releaseId in (select releaseId from tb_release where username = #{username})");
                    }else if (param.get("role").toString().equalsIgnoreCase("ROLE_EMPLOYEE")){
                        WHERE("EMPLOYEE_NAME = #{username}");
                    }

                    WHERE("isValid = 0");
                    ORDER_BY("order_time desc");

                }
            }.toString();
        }

        public String selectByOrderVo(Map<String,Object> param){
            return new SQL(){
                {
                    SELECT("*");
                    FROM("tb_order");
                    if (objIsBlank(param.get("orderId"))){
                        WHERE("orderId = #{orderId}");
                    }

                    if (objIsBlank(param.get("employeeName"))){
                        WHERE("employee_name = #{employeeName}");
                    }

                    if (objIsBlank(param.get("orderTime"))){
                        WHERE("order_time >= to_date(#{orderTime},'yyyy-mm-dd hh24:mi:ss')");
                    }
                    if (objIsBlank(param.get("recipient"))){
                        WHERE("releaseId in  (select releaseId from tb_release where recipient = #{recipient})");
                    }
                    if (objIsBlank(param.get("deliveryNos") )){
                        WHERE("releaseId in  (select releaseId from tb_release where deliveryNos like %#{deliveryNos}%)");
                    }
                    if (objIsBlank(param.get("username"))){
                        WHERE("releaseId in  (select releaseId from tb_release where username = #{username})");
                    }

                    ORDER_BY("order_time desc");

                }
            }.toString();

        }

    }

    //获取int数组
    static String getIntList(Object obj){
        StringBuilder con =new StringBuilder("( ");
        if (obj instanceof List){
            List<Integer> list = (List<Integer>) obj;
            list.forEach(n -> {
                con.append(n+",");
            });
        }
        String s = con.toString();
        s=s.substring(0,s.length()-1)+")";
        return s;
    }

    //判断对象是否为空
    static boolean objIsBlank(Object obj){
        if (obj == null)return false;
        if (obj.toString().length() < 1 )return false;
        return true;
    }
}
