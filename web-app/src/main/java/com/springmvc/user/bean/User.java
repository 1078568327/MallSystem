package com.springmvc.user.bean;

import com.springmvc.base.BaseEntity;

import java.util.Date;

public class User extends BaseEntity {

    private String username;
    private String mobileNo;
    private String password;
    private String gender;
    private Date birthday;
    private String profilePicture;
    private String email;
    private Long memberExp;
    private Integer memberPoint;

    public String getUsername() {
        return username;
    }

    public User setUsername(String username) {
        this.username = username;
        return this;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public User setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
        return this;
    }

    public String getPassword() {
        return password;
    }

    public User setPassword(String password) {
        this.password = password;
        return this;
    }

    public String getGender() {
        return gender;
    }

    public User setGender(String gender) {
        this.gender = gender;
        return this;
    }

    public Date getBirthday() {
        return birthday;
    }

    public User setBirthday(Date birthday) {
        this.birthday = birthday;
        return this;
    }

    public String getProfilePicture() {
        return profilePicture;
    }

    public User setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
        return this;
    }

    public String getEmail() {
        return email;
    }

    public User setEmail(String email) {
        this.email = email;
        return this;
    }

    public Long getMemberExp() {
        return memberExp;
    }

    public User setMemberExp(Long memberExp) {
        this.memberExp = memberExp;
        return this;
    }

    public Integer getMemberPoint() {
        return memberPoint;
    }

    public User setMemberPoint(Integer memberPoint) {
        this.memberPoint = memberPoint;
        return this;
    }

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", mobileNo='" + mobileNo + '\'' +
                ", password='" + password + '\'' +
                ", gender='" + gender + '\'' +
                ", birthday=" + birthday +
                ", profilePicture='" + profilePicture + '\'' +
                ", email='" + email + '\'' +
                ", memberExp=" + memberExp +
                ", memberPoint=" + memberPoint +
                '}';
    }
}
