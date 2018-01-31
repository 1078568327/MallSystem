package com.springmvc.goods.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import static com.alipay.api.AlipayConstants.*;

@Controller
@RequestMapping(value = "pri/goods/pay")
public class AlipayController {

    @RequestMapping(value = "/index")
    public String index(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {

        String APP_PRIVATE_KEY = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCZV0/4YadIbo6fN8K9HSXyabPLVIXbyc+16P/QFZOOFLom0st5nEdm/f5UOQ+Tmn/tTBizLFIopG+mnjmQCURyNpvcbWUYFiKn3/4AUV6sE17AJ6GdqPsrgjVqotUoVhWM2nnCJF8BmXFUUdY4FGXbK8UvbCmu5lEtJQQ/OGtJxXO6JPk7MotsT/bbtP9bLWrtdP4CGP/cQpiJKUS/WDSJ4otqDnkGFCarwRjMIlCtczAqTk4jqB1GxurP0Kd3c58WslZax60FKtGJdoMFvWDQ6AUHnbeFSdthFnUoPQKyRIq2n3kjT/F291OUdRrnldCweNsPEwv1gZTyRvzNzkFJAgMBAAECggEBAIbS/U5/1kzaYG5f4crT0SSmid5Sr+uDMy1X82zrO7TmRpKSLzP7E9DbrH4zOZ3nb2meyezoIEj54+2VGzmo3FSr7TjPut6Fv+zpBnUTFnGoClxbvD9ab5VexEbBazgvEH2rLvljb2GBn+KqnfbrAG/HuXWr3a6ZdXCDJovLuJHAOLc9yviIN4sJ927Q+w2yb3bDHNTDbxQt3l14Xwe+SusMkGf9llK+VYNikEwX9Gyhg8LCwHIOfBFy/KWkz+EMOh/+UxhBtIaLBkjiMAv1Wgv5MbUlicpfRfaR455Yz5jIZlXYSueEWdDolBRssz5jJGK/vSveoBK6084XPzPmI4ECgYEA6O93T2b+Esk2SbMdWKXXAR00zmCwSHLnsRsro+ijenMYy1V3s5ez7cUjUFaNy6/wDOP75yXMrTom++RphEDfybOD3wgHYnvYFWdE36F6ha0gzr5BO04Jol1uJsSknCYJ4hQaVgX5zuKCw2WN878SJ5xzRGa1Q8NQPBfu63vh+RkCgYEAqIZCTQZIK3HPoNlQxyHkXEINNnERMlC3Xe1wVNQbBnz0O8nfRQ8Igm2kX3i83rY7/JdU6ntxYbexp5gXhcdmMFPyEnIFAKGpgWW+G16oPNv6ppUab7Jf7/yChTy5d7YsIpbpu9GkH+rnS5RZDRoC/051zUTLLbfooIgEQ6Z/H7ECgYEA2Nhkx6RnjnGGemGmRipM15qq2B0mvqtJiZRzsekWlx2izVfJUYU+WXEWiOmqox4saLOsg+iqe/EQ7ZobqKUEMC9P6kb9KO+Fn5c9hLo850jeq9htvZnOWjqEGs8hNsQqmy5/velePvybIu/dkDYl3n5EyD6dLHIctXTKVKpFGbECgYAfCtwbpBSXLBe64Uzn4W5XMDOO27T3N7cPLjWK6qcvwsSaXs0pw2Ml41xr2amwvJDALoAN0T9JaLTo0jNDCT/hlxT4INibDSxUEZG7KOyEiWDaXozIFmtloXXJZS4kxwHKPVJArpU06+g/G8xrhWcX8DPy48EpYr8PEv72Fy1DgQKBgEA1pn+ILY9dMfU88vYN6ENYjHAzZL1lXME5Zbc77F+n3R6pq8qqpVC8fGa77wQyiFgeI7spRV6zD9mUV7EnjB9KtLSzOM5hgCDBONbt13QE0ISfRIHX57BefpDcP76e8jqbn79P9AtgfuCq9GkcFdXf4ju+qkLEDDdHF2WjSU4y";
        String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmVdP+GGnSG6OnzfCvR0l8mmzy1SF28nPtej/0BWTjhS6JtLLeZxHZv3+VDkPk5p/7UwYsyxSKKRvpp45kAlEcjab3G1lGBYip9/+AFFerBNewCehnaj7K4I1aqLVKFYVjNp5wiRfAZlxVFHWOBRl2yvFL2wpruZRLSUEPzhrScVzuiT5OzKLbE/227T/Wy1q7XT+Ahj/3EKYiSlEv1g0ieKLag55BhQmq8EYzCJQrXMwKk5OI6gdRsbqz9Cnd3OfFrJWWsetBSrRiXaDBb1g0OgFB523hUnbYRZ1KD0CskSKtp95I0/xdvdTlHUa55XQsHjbDxML9YGU8kb8zc5BSQIDAQAB";
        String APP_ID = "2016091100483406";

        AlipayClient alipayClient = new DefaultAlipayClient("https://openapi.alipaydev.com/gateway.do", APP_ID, APP_PRIVATE_KEY, "json", "utf-8", ALIPAY_PUBLIC_KEY, "RSA2"); //获得初始化的AlipayClient
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();//创建API对应的request
        alipayRequest.setReturnUrl("http://domain.com/CallBack/return_url.jsp");
        alipayRequest.setNotifyUrl("http://domain.com/CallBack/notify_url.jsp");//在公共参数中设置回跳和通知地址
        alipayRequest.setBizContent("{" +
                "    \"out_trade_no\":\"20150320010101002\"," +
                "    \"product_code\":\"FAST_INSTANT_TRADE_PAY\"," +
                "    \"total_amount\":88.88," +
                "    \"subject\":\"Iphone6 16G\"," +
                "    \"body\":\"Iphone6 16G\"," +
                "    \"passback_params\":\"merchantBizType%3d3C%26merchantBizNo%3d2016010101111\"," +
                "    \"extend_params\":{" +
                "    \"sys_service_provider_id\":\"2088511833207846\"" +
                "    }"+
                "  }");//填充业务参数
        String form="";
        try {
            form = alipayClient.pageExecute(alipayRequest).getBody(); //调用SDK生成表单
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=" + "utf-8");
        response.getWriter().write(form);//直接将完整的表单html输出到页面
        response.getWriter().flush();
        response.getWriter().close();

        return null;
    }

}
