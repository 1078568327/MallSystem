package com.springmvc.user.bean;

import org.hibernate.validator.constraints.NotEmpty;

public class Register {

    @NotEmpty(message = "手机号码不能为空")
    private String mobileNo;
    @NotEmpty(message = "密码不能为空")
    private String password;
    @NotEmpty(message = "确认密码不能为空")
    private String passwordAgain;
    @NotEmpty(message = "图形验证码不能为空")
    private String imageCaptcha;
    @NotEmpty(message = "验证码不能为空")
    private String captcha;
    @NotEmpty(message = "token参数丢失，请刷新页面")
    private String token;

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordAgain() {
        return passwordAgain;
    }

    public void setPasswordAgain(String passwordAgain) {
        this.passwordAgain = passwordAgain;
    }

    public String getImageCaptcha() {
        return imageCaptcha;
    }

    public void setImageCaptcha(String imageCaptcha) {
        this.imageCaptcha = imageCaptcha;
    }

    public String getCaptcha() {
        return captcha;
    }

    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    @Override
    public String toString() {
        return "Register{" +
                "mobileNo='" + mobileNo + '\'' +
                ", password='" + password + '\'' +
                ", passwordAgain='" + passwordAgain + '\'' +
                ", imageCaptcha='" + imageCaptcha + '\'' +
                ", captcha='" + captcha + '\'' +
                ", token='" + token + '\'' +
                '}';
    }
}
