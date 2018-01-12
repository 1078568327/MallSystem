package com.springmvc.user.bean;

import org.hibernate.validator.constraints.NotEmpty;

public class ChangePassword {

    private String username;
    private String mobileNo;
    @NotEmpty(message = "旧密码不能为空")
    private String oldPassword;
    @NotEmpty(message = "新密码不能为空")
    private String newPassword;
    @NotEmpty(message = "确认密码不能为空")
    private String passwordAgain;
    @NotEmpty(message = "token不能为空")
    private String token;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getPasswordAgain() {
        return passwordAgain;
    }

    public void setPasswordAgain(String passwordAgain) {
        this.passwordAgain = passwordAgain;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
}
