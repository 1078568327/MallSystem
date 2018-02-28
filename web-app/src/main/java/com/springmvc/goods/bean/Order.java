package com.springmvc.goods.bean;

import com.springmvc.base.BaseEntity;
import com.springmvc.user.bean.Address;
import com.springmvc.user.bean.User;

import java.math.BigDecimal;
import java.util.Date;

public class Order extends BaseEntity {

    private User user;
    private Goods goods;
    private Integer amount;
    private BigDecimal totalPrice;
    private Address address;
    private Date createTime;
    //0：生成订单且未支付，1：订单支付且未完成，2：订单完成且未评论，3：已评论，4：取消订单，5：已退款
    private Integer orderStatus;
    private Integer orderNum;

    public User getUser() {
        return user;
    }

    public Order setUser(User user) {
        this.user = user;
        return this;
    }

    public Goods getGoods() {
        return goods;
    }

    public Order setGoods(Goods goods) {
        this.goods = goods;
        return this;
    }

    public Integer getAmount() {
        return amount;
    }

    public Order setAmount(Integer amount) {
        this.amount = amount;
        return this;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public Order setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
        return this;
    }

    public Address getAddress() {
        return address;
    }

    public Order setAddress(Address address) {
        this.address = address;
        return this;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public Order setCreateTime(Date createTime) {
        this.createTime = createTime;
        return this;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public Order setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
        return this;
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    @Override
    public String toString() {
        return "Order{" +
                "user=" + user +
                ", goods=" + goods +
                ", amount=" + amount +
                ", totalPrice=" + totalPrice +
                ", address=" + address +
                ", createTime=" + createTime +
                ", orderStatus=" + orderStatus +
                ", orderNum=" + orderNum +
                '}';
    }
}
