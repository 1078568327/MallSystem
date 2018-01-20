package com.springmvc.goods.bean;

import com.springmvc.base.BaseEntity;
import com.springmvc.user.bean.User;

import java.util.Date;

public class ShoppingCart extends BaseEntity {

    private User user;
    private Goods goods;
    private Integer amount;
    private Date createTime;
    private Integer isBuy;

    public User getUser() {
        return user;
    }

    public ShoppingCart setUser(User user) {
        this.user = user;
        return this;
    }

    public Goods getGoods() {
        return goods;
    }

    public ShoppingCart setGoods(Goods goods) {
        this.goods = goods;
        return this;
    }

    public Integer getAmount() {
        return amount;
    }

    public ShoppingCart setAmount(Integer amount) {
        this.amount = amount;
        return this;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public ShoppingCart setCreateTime(Date createTime) {
        this.createTime = createTime;
        return this;
    }

    public Integer getIsBuy() {
        return isBuy;
    }

    public ShoppingCart setIsBuy(Integer isBuy) {
        this.isBuy = isBuy;
        return this;
    }

    @Override
    public String toString() {
        return "ShoppingCart{" +
                "user=" + user +
                ", goods=" + goods +
                ", amount=" + amount +
                ", createTime=" + createTime +
                ", isBuy=" + isBuy +
                '}';
    }
}
