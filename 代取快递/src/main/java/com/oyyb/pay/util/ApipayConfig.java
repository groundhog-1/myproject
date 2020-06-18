package com.oyyb.pay.util;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

/**
 * @author: oyyb
 * @data: 2020-04-29
 * @version: 1.0.0
 * @descript:
 */

@Data
@NoArgsConstructor
@Configuration
@PropertySource({"classpath:alipay.properties"})
public class ApipayConfig {

    private static String readFile(String path) {
        File file = new File(path);
        if(!file.exists()) {
            return null;
        }
        try {
            byte[] bytes = Files.readAllBytes(file.toPath());
            return new String(bytes);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
    }

    @Value("${alipay.private_key_path}")
    public  String private_key_path;
    @Value(("${alipay.public_key_path}"))
    public  String public_key_path;
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    @Value(("${alipay.app_id}"))
    public  String app_id;

    // 商户私钥，您的PKCS8格式RSA2私钥

    public  String merchant_private_key ;

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。

    public  String alipay_public_key ;
    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    @Value(("${alipay.notify_url}"))
    public  String notify_url ;

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    @Value(("${alipay.return_url}"))
    public  String return_url;

    // 签名方式
    @Value(("${alipay.sign_type}"))
    public  String sign_type ;

    // 字符编码格式
    @Value(("${alipay.charset}"))
    public  String charset;

    // 支付宝网关
    @Value(("${alipay.gatewayUrl}"))
    public  String gatewayUrl ;

    // 支付宝网关
    @Value(("${alipay.log_path}"))
    public String log_path ;


}
