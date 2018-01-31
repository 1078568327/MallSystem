package com.springmvc.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016091100483406";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCZV0/4YadIbo6fN8K9HSXyabPLVIXbyc+16P/QFZOOFLom0st5nEdm/f5UOQ+Tmn/tTBizLFIopG+mnjmQCURyNpvcbWUYFiKn3/4AUV6sE17AJ6GdqPsrgjVqotUoVhWM2nnCJF8BmXFUUdY4FGXbK8UvbCmu5lEtJQQ/OGtJxXO6JPk7MotsT/bbtP9bLWrtdP4CGP/cQpiJKUS/WDSJ4otqDnkGFCarwRjMIlCtczAqTk4jqB1GxurP0Kd3c58WslZax60FKtGJdoMFvWDQ6AUHnbeFSdthFnUoPQKyRIq2n3kjT/F291OUdRrnldCweNsPEwv1gZTyRvzNzkFJAgMBAAECggEBAIbS/U5/1kzaYG5f4crT0SSmid5Sr+uDMy1X82zrO7TmRpKSLzP7E9DbrH4zOZ3nb2meyezoIEj54+2VGzmo3FSr7TjPut6Fv+zpBnUTFnGoClxbvD9ab5VexEbBazgvEH2rLvljb2GBn+KqnfbrAG/HuXWr3a6ZdXCDJovLuJHAOLc9yviIN4sJ927Q+w2yb3bDHNTDbxQt3l14Xwe+SusMkGf9llK+VYNikEwX9Gyhg8LCwHIOfBFy/KWkz+EMOh/+UxhBtIaLBkjiMAv1Wgv5MbUlicpfRfaR455Yz5jIZlXYSueEWdDolBRssz5jJGK/vSveoBK6084XPzPmI4ECgYEA6O93T2b+Esk2SbMdWKXXAR00zmCwSHLnsRsro+ijenMYy1V3s5ez7cUjUFaNy6/wDOP75yXMrTom++RphEDfybOD3wgHYnvYFWdE36F6ha0gzr5BO04Jol1uJsSknCYJ4hQaVgX5zuKCw2WN878SJ5xzRGa1Q8NQPBfu63vh+RkCgYEAqIZCTQZIK3HPoNlQxyHkXEINNnERMlC3Xe1wVNQbBnz0O8nfRQ8Igm2kX3i83rY7/JdU6ntxYbexp5gXhcdmMFPyEnIFAKGpgWW+G16oPNv6ppUab7Jf7/yChTy5d7YsIpbpu9GkH+rnS5RZDRoC/051zUTLLbfooIgEQ6Z/H7ECgYEA2Nhkx6RnjnGGemGmRipM15qq2B0mvqtJiZRzsekWlx2izVfJUYU+WXEWiOmqox4saLOsg+iqe/EQ7ZobqKUEMC9P6kb9KO+Fn5c9hLo850jeq9htvZnOWjqEGs8hNsQqmy5/velePvybIu/dkDYl3n5EyD6dLHIctXTKVKpFGbECgYAfCtwbpBSXLBe64Uzn4W5XMDOO27T3N7cPLjWK6qcvwsSaXs0pw2Ml41xr2amwvJDALoAN0T9JaLTo0jNDCT/hlxT4INibDSxUEZG7KOyEiWDaXozIFmtloXXJZS4kxwHKPVJArpU06+g/G8xrhWcX8DPy48EpYr8PEv72Fy1DgQKBgEA1pn+ILY9dMfU88vYN6ENYjHAzZL1lXME5Zbc77F+n3R6pq8qqpVC8fGa77wQyiFgeI7spRV6zD9mUV7EnjB9KtLSzOM5hgCDBONbt13QE0ISfRIHX57BefpDcP76e8jqbn79P9AtgfuCq9GkcFdXf4ju+qkLEDDdHF2WjSU4y";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmVdP+GGnSG6OnzfCvR0l8mmzy1SF28nPtej/0BWTjhS6JtLLeZxHZv3+VDkPk5p/7UwYsyxSKKRvpp45kAlEcjab3G1lGBYip9/+AFFerBNewCehnaj7K4I1aqLVKFYVjNp5wiRfAZlxVFHWOBRl2yvFL2wpruZRLSUEPzhrScVzuiT5OzKLbE/227T/Wy1q7XT+Ahj/3EKYiSlEv1g0ieKLag55BhQmq8EYzCJQrXMwKk5OI6gdRsbqz9Cnd3OfFrJWWsetBSrRiXaDBb1g0OgFB523hUnbYRZ1KD0CskSKtp95I0/xdvdTlHUa55XQsHjbDxML9YGU8kb8zc5BSQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipay.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

