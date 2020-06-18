package com.oyyb.pay.util;

/**
 * @author: oyyb
 * @data: 2020-04-29
 * @version: 1.0.0
 * @descript:
 */
public class AlipayConfig {

    private static String prikeyPath = "E:\\study_java\\shaxiang_demo\\应用私钥2048.txt";
    private static String pubkeyPath = "E:\\study_java\\shaxiang_demo\\应用公钥2048.txt";


//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016102200736984";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCNcZ+AGPIZJKS1k3RPql6hHzPLlQlK0RqWXYDwEc1FBeVNMaMza/cs5r8Z8l3frdL/G4tF1kgWFOGTmLUPYqjKJHomlVlW8dpkm7sCGd9842yiYpxH9HU+v2N4ApMFb0CeN2NglcBuijlxtkP5X8IYOIOfR0ZT7bYy2QtY/5SebaCYrTCfPns4PVKsyDEDo2IteyM6fYxJgXPeQIvtXpvAaJ/qq7gFZnwAUjIE49QfwTJB7h7VBkSqHWCITcsSizzOwWQ0oJ3K1qLgtFSaGqALWnGBV88gzOu2MJpxTx2EAi6M3RijetgyDTqUjQPtQuVQ0KSkj8QmK+W5qlzOU6FBAgMBAAECggEAVEkJ/95dnef9Eop8u+BNJXwfdEgqUmAKlOHBLM2e4Wui+X4Dv2et0h7qb77Ce8DsQ8KZGpOXPzlQNpDADBwBcvuLoqRKqYnTVzKJnLXoPFaVbKqQcDxXBX4s+t2l2I40FlPxLyPtmLFbi8xN8zNByQccP/TMDsVPVjuKDI24dTL/vIWYRkRekdVqiaxdWLEVSLzXutRm/kZgCFA85nT7gwV8J+cDjwnDPi/UlQ7XvKyoc4wadG/jF4IzJF0UC9acu6ZS0oD/hv4N9Ni1Oo5FKcrXOtSdkoCPfXpCOPSGgQHuI35yTgpRWozwK59azhrRa3N1l+Z3xoHWXvgHWYRj9QKBgQDZYy8n1ouAebzJftb0XMEktN0QJNKff6TWmga54iaCs7K0cCJIahF+Qjjfk78envknK9Z6PWumo7W77OppomNGJEyU2q/BM+qbGVMaRD2+fEd6vqBePBdzOg4f9knrwHBUU/0kwcgLw3HqoH5h7e9/sjnGBOkALigTXrnUIG+IFwKBgQCmkTXemHzu1q2Ahqk1VFF5seVb9fxNY1Kw5r88qNU+5+c6EqmB6/BpugO5ZFukkvuL8L5oNXG6pHSKEw1E1p20Res9VDZ6RlkpXkhWWb8svx34TaDyjerPcHYmobRCzdAKZL0DybPMhlJLvBQzsKp5A7lCBIdmqY7v1CLNuLcgZwKBgQCcHLZIjbIw2TvSF9yWL+YkTh5S8Z6wHCJsWsBpzRaK1jGHkt+L0WAuo6/kH14ox1F15+1ma6VbTkW8Zy8QHSXdwUOdwk5lGLtqFo2vV0JgAS/z3eGcytqsTQzHtz7upowEgyxPsTnP+NNeA1O/T/emZH9IzU3maz8saeJZi9GMkQKBgH3sxfcU/U5rShwisgW5SydfkHBnlWjEMB3BNM6dLSozlCHZPgEU6Fpl4K7l6kqPPFDdnnWWAfcCoYBJSvzB69QAEAn7gnwKdxnJR5LQorEng3bW6Vi2ZdCRyyEFmwvuINvasPMOKDn1Sn4rIHK7mwWGBSad2eeJRKCXlgBFJ1z9AoGBAJL4Lx2PVruQlkXaKzkpOZAVzndo9FWVTSWdlP+CkWACDBi3gUmVNYuVjdQcVQ4N1ajiap+c4/XYXxWKT931Y5Kx5Qm6E/xHPe6Ut285ZoDNXcwSCbXDNZ95sCcQYnfS2GGvPE0D/T7JLXmzu+dtZuMQmJsv0MjxlbTsc3Kso2TQ";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvu8sd90JlhCh/5XT0bfss0jVdWw8k7Q8SqXWHSP7+0cZ3kQUJSTPNbHdDMlJRkHbKJAvXq+Qi7RJhh88vqIW8HPHw/N6tFUB8NYpGJbxqSHcIiZX1rsvYIr/tc5wRWX2SMutRA21isjD0uI/j7D+UYNxujlMYQeYejBpuWKq0n0J7hI2nwnD0nlR4GSLPJe3iFEvwqN11OnsPMruB8cmkN+JUwpjAtot0KqSUGW0RUyFNiKKMci8tYhnIi98it49MT+WTJlngNRi8OkcnwVhwl1uM8LccKX9GV0IUA5lrM1Cz8+wV4Kd8lsx4awGmTlG93DY8vTzpUpr1wx1RTo58wIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/alipay/notify_url";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8080/alipay/return_url";

    public static String format = "json";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "https://openapi.alipaydev.com/gateway.do";

}
