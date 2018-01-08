package com.springmvc.util.token;

import java.util.UUID;

public class TokenUtil {

    /**
     * 生成token
     * @return
     */
    public static String createToken(){
        String token = UUID.randomUUID().toString().replaceAll("-","");
        return token;
    }


}
