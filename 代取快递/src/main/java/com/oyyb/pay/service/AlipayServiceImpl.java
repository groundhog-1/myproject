package com.oyyb.pay.service;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.oyyb.order.mapper.OrderMapper;
import com.oyyb.order.model.Order;
import com.oyyb.pay.util.AlipayConfig;
import com.oyyb.pay.util.ApipayConfig;
import com.sun.tools.internal.jxc.gen.config.Config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;

/**
 * @author: oyyb
 * @data: 2020-04-29
 * @version: 1.0.0
 * @descript:
 */
@Service
public class AlipayServiceImpl {


    @Autowired
    private OrderMapper orderMapper;


    public void pay(Long orderID, HttpServletRequest request, HttpServletResponse response) {
        Order order = orderMapper.selectByPrimaryKey(orderID);
        if (order == null) return;

        Random r=new Random();
        //实例化客户端,填入所需参数
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl,
                AlipayConfig.app_id,
                AlipayConfig.merchant_private_key,
                AlipayConfig.format,
                AlipayConfig.charset,
                AlipayConfig.alipay_public_key,
                AlipayConfig.sign_type);
        AlipayTradePagePayRequest alirequest = new AlipayTradePagePayRequest();
        //在公共参数中设置回跳和通知地址
        alirequest.setReturnUrl(AlipayConfig.return_url);
        alirequest.setNotifyUrl(AlipayConfig.notify_url);

        //商户订单号，商户网站订单系统中唯一订单号，必填
        //生成随机Id
        String orderId = order.getOrderId() + "";
        //付款金额，必填
        String price = order.getPrice() + "";
        //订单名称，必填
        String subject ="代取单号："+ order.getReleaseId();
        //商品描述，可空
        String body = " 服务费 ";
        alirequest.setBizContent("{\"out_trade_no\":\""+ orderId+"\","
                + "\"total_amount\":\""+ price +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"body\":\""+ body +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        String form = "";
        try {
            form = alipayClient.pageExecute(alirequest).getBody(); // 调用SDK生成表单
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=" + AlipayConfig.charset);
        try {
            response.getWriter().write(form);// 直接将完整的表单html输出到页面
            response.getWriter().flush();
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }


    public String returnUrl(HttpServletRequest request, HttpServletResponse response) {
        try {
            System.out.println("=================================同步回调=====================================");

            // 获取支付宝GET过来反馈信息
            Map<String, String> params = new HashMap<String, String>();
            Map<String, String[]> requestParams = request.getParameterMap();
            for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
                String name = (String) iter.next();
                String[] values = (String[]) requestParams.get(name);
                String valueStr = "";
                for (int i = 0; i < values.length; i++) {
                    valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
                }
                // 乱码解决，这段代码在出现乱码时使用
                valueStr = new String(valueStr.getBytes("utf-8"), "utf-8");
                params.put(name, valueStr);
            }

            System.out.println(params);//查看参数都有哪些
            boolean signVerified = false; // 调用SDK验证签名

                signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type);

            //验证签名通过
            if(signVerified){
                // 商户订单号
                String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

                // 支付宝交易号
                String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

                // 付款金额
                String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");

                System.out.println("商户订单号="+out_trade_no);
                System.out.println("支付宝交易号="+trade_no);
                System.out.println("付款金额="+total_amount);

                //支付成功，跟新订单状态
                Order order = new Order();
                order.setOrderId(Long.parseLong(out_trade_no));

                order.setIsPay((byte)1);
                order.setOrderStatus((byte)1);
                orderMapper.updateByPrimaryKeySelective(order);


                return "pay_ok";//跳转付款成功页面
            }else{
                return "pay_fail";//跳转付款失败页面
            }
        } catch (AlipayApiException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "page_fail";
    }
}
