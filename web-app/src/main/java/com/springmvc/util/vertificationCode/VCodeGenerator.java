package com.springmvc.util.vertificationCode;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class VCodeGenerator {

    public static String getVCode(int codeCount){
        String[] beforeShuffle = new String[] { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
        List list = Arrays.asList(beforeShuffle);
        Collections.shuffle(list);  //随机打乱顺序
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < list.size(); i++) {
            sb.append(list.get(i));
        }
        String afterShuffle = sb.toString();
        int beginIndex = 4;
        int endIndex = beforeShuffle.length;
        if(codeCount <= endIndex){
            beginIndex = endIndex - codeCount;
        }
        String result = afterShuffle.substring(beginIndex, endIndex);
        return result;
    }

}
