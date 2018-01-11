package com.springmvc.user.bean;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class Login {

    @NotEmpty(message = "手机号码不能为空")
    private String mobileNo;
    @NotEmpty(message = "密码不能为空")
    private String password;
    @Range(min = 0,max = 1,message = "记住我30天传值错误")
    private Integer isRemember;
    @NotEmpty(message = "参数丢失，请刷新页面")
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

    public Integer getIsRemember() {
        return isRemember;
    }

    public void setIsRemember(Integer isRemember) {
        this.isRemember = isRemember;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    @Override
    public String toString() {
        return "Login{" +
                "mobileNo='" + mobileNo + '\'' +
                ", password='" + password + '\'' +
                ", isRemember=" + isRemember +
                ", token='" + token + '\'' +
                '}';
    }
}
