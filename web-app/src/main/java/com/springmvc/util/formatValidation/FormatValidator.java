package com.springmvc.util.formatValidation;

import java.util.regex.Pattern;

public class FormatValidator {

    /**
     * 正则表达式：验证用户名
     */
    public static final String REGEX_USERNAME = "^[a-zA-Z]\\w{5,20}$";

    /**
     * 正则表达式：验证密码
     * 包含数字、字母和特殊字符的密码验证6-16位
     */
    public static final String REGEX_PASSWORD = "^[a-zA-Z0-9-`=\\\\\\[\\];',./~!@#$%^&*()_+|{}:\"<>?]{6,16}$";

    /**
     * 正则表达式：验证大陆手机号
     *
     移动号段：
     134 135 136 137 138 139 147 148 150 151 152 157 158 159 172 178 182 183 184 187 188 198
     联通号段：
     130 131 132 145 146 155 156 166 171 175 176 185 186
     电信号段：
     133 149 153 173 174 177 180 181 189 199
     虚拟运营商:
     170

     */
    public static final String REGEX_MAINLAND_MOBILE = "^((17[0-8])|(14[5-9])|(13[0-9])|(15[^4,\\D])|(18[0-9])|(19[8-9]))\\d{8}$";

    /**
     * 正则表达式：香港手机号码
     * 香港手机号码8位数，5|6|8|9开头+7位任意数
     */
    public static final String REGEX_HK_MOBILE = "^(5|6|8|9)\\d{7}$";

    /**
     * 正则表达式：移动手机号码
     *
     * 移动号段：
     134 135 136 137 138 139 147 148 150 151 152 157 158 159 172 178 182 183 184 187 188 198
     */
    public static final String REGEX_CMCC_MOBILE = "^((17[28])|(14[7-8])|(13[4-9])|(15[0-27-9])|(18[2-478])|(198))\\d{8}$";

    /**
     * 正则表达式：联通手机号码
     *
     * 联通号段：
     130 131 132 145 146 155 156 166 171 175 176 185 186
     */
    public static final String REGEX_CUTC_MOBILE = "^((17[156])|(14[56])|(13[0-2])|(15[56])|(18[56])|(166))\\d{8}$";

    /**
     * 正则表达式：电信手机号码
     *
     * 电信号段：
     133 149 153 173 174 177 180 181 189 199
     */
    public static final String REGEX_CTCC_MOBILE = "^((17[347])|(149)|(133)|(153)|(18[019])|(19[9]))\\d{8}$";

    /**
     * 正则表达式：验证虚拟营运商手机号码
     *
     *虚拟运营商:
     170
     */
    public static final String REGEX_VNO_MOBILE = "^170\\d{8}$";

    /**
     * 正则表达式：验证邮箱
     */
    public static final String REGEX_EMAIL = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";

    /**
     * 正则表达式：验证汉字
     */
    public static final String REGEX_CHINESE = "[\u4e00-\u9fa5],{0,}";

    /**
     * 正则表达式：验证身份证
     */
    public static final String REGEX_ID_CARD = "(^\\d{18}$)|(^\\d{15}$)";

    /**
     * 正则表达式：验证URL
     */
    public static final String REGEX_URL = "http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?";

    /**
     * 正则表达式：验证IP地址
     */
    public static final String REGEX_IP_ADDR = "(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)";

    /**
     * 校验用户名
     *
     * @param username
     * @return 校验通过返回true，否则返回false
     */
    public static boolean isUsername(String username) {
        return Pattern.matches(REGEX_USERNAME, username);
    }

    /**
     * 校验密码
     *
     * @param password
     * @return 校验通过返回true，否则返回false
     */
    public static boolean isPassword(String password) {
        return Pattern.matches(REGEX_PASSWORD, password);
    }

    /**
     * 校验中国手机号（大陆和香港）
     *
     * @param mobileNo
     * @return 校验通过返回true，否则返回false
     */
    public static boolean isChinaMobileNo(String mobileNo) {
        return Pattern.matches(REGEX_MAINLAND_MOBILE, mobileNo) || Pattern.matches(REGEX_HK_MOBILE, mobileNo);
    }

    /**
     * 校验大陆手机号码
     * @param mobileNo
     * @return
     */
    public static boolean isMainlandMobileNo(String mobileNo){
        return Pattern.matches(REGEX_MAINLAND_MOBILE,mobileNo);
    }

    /**
     * 校验香港手机号码
     * @param mobileNo
     * @return
     */
    public static boolean isHKMobileNo(String mobileNo){
        return Pattern.matches(REGEX_HK_MOBILE,mobileNo);
    }

    /**
     * 校验中国移动手机号码
     * @param mobileNo
     * @return
     */
    public static boolean isCMCCMobileNo(String mobileNo){
        return Pattern.matches(REGEX_CMCC_MOBILE,mobileNo);
    }

    /**
     * 校验中国联通手机号
     * @param mobileNo
     * @return
     */
    public static boolean isCUTCMobileNo(String mobileNo){
        return Pattern.matches(REGEX_CUTC_MOBILE,mobileNo);
    }

    /**
     * 校验中国电信手机号码
     * @param mobileNo
     * @return
     */
    public static boolean isCTCCMobileNo(String mobileNo){
        return Pattern.matches(REGEX_CTCC_MOBILE,mobileNo);
    }

    /**
     * 校验虚拟运营商手机号码
     * @param mobileNo
     * @return
     */
    public static boolean isVNOMobileNo(String mobileNo){
        return Pattern.matches(REGEX_VNO_MOBILE,mobileNo);
    }

    /**
     * 校验邮箱
     *
     * @param email
     * @return 校验通过返回true，否则返回false
     */
    public static boolean isEmail(String email) {
        return Pattern.matches(REGEX_EMAIL, email);
    }

    /**
     * 校验汉字
     *
     * @param chinese
     * @return 校验通过返回true，否则返回false
     */
    public static boolean isChinese(String chinese) {
        return Pattern.matches(REGEX_CHINESE, chinese);
    }

    /**
     * 校验身份证
     *
     * @param idCard
     * @return 校验通过返回true，否则返回false
     */
    public static boolean isIDCard(String idCard) {
        return Pattern.matches(REGEX_ID_CARD, idCard);
    }

    /**
     * 校验URL
     *
     * @param url
     * @return 校验通过返回true，否则返回false
     */
    public static boolean isUrl(String url) {
        return Pattern.matches(REGEX_URL, url);
    }

    /**
     * 校验IP地址
     *
     * @param ipAddr
     * @return
     */
    public static boolean isIPAddr(String ipAddr) {
        return Pattern.matches(REGEX_IP_ADDR, ipAddr);
    }

}
