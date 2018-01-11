package com.springmvc.user.bean;

import com.springmvc.base.BaseEntity;

import java.util.Date;

public class CookieBean extends BaseEntity {

    private User user;
    private String sessionId;
    private Date createTime;
    private Date deadTime;

    public User getUser() {
        return user;
    }

    public CookieBean setUser(User user) {
        this.user = user;
        return this;
    }

    public String getSessionId() {
        return sessionId;
    }

    public CookieBean setSessionId(String sessionId) {
        this.sessionId = sessionId;
        return this;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public CookieBean setCreateTime(Date createTime) {
        this.createTime = createTime;
        return this;
    }

    public Date getDeadTime() {
        return deadTime;
    }

    public CookieBean setDeadTime(Date deadTime) {
        this.deadTime = deadTime;
        return this;
    }

    @Override
    public String toString() {
        return "CookieBean{" +
                "user=" + user +
                ", sessionId='" + sessionId + '\'' +
                ", createTime=" + createTime +
                ", deadTime=" + deadTime +
                '}';
    }
}
