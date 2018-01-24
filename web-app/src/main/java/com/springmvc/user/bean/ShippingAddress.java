package com.springmvc.user.bean;

import com.springmvc.base.BaseEntity;
import com.springmvc.goods.bean.Goods;

public class ShippingAddress extends BaseEntity {

    private User user;
    private Address address;
    private String remarkName;
    private Integer isDefault;

    public User getUser() {
        return user;
    }

    public ShippingAddress setUser(User user) {
        this.user = user;
        return this;
    }

    public Address getAddress() {
        return address;
    }

    public ShippingAddress setAddress(Address address) {
        this.address = address;
        return this;
    }

    public String getRemarkName() {
        return remarkName;
    }

    public ShippingAddress setRemarkName(String remarkName) {
        this.remarkName = remarkName;
        return this;
    }

    public Integer getIsDefault() {
        return isDefault;
    }

    public ShippingAddress setIsDefault(Integer isDefault) {
        this.isDefault = isDefault;
        return this;
    }

    @Override
    public String toString() {
        return "ShippingAddress{" +
                "user=" + user +
                ", address=" + address +
                ", remarkName='" + remarkName + '\'' +
                ", isDefault=" + isDefault +
                '}';
    }
}
