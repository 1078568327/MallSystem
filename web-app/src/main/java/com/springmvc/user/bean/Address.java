package com.springmvc.user.bean;

import com.springmvc.base.BaseEntity;

public class Address extends BaseEntity {

    private String province;
    private String city;
    private String district;
    private String detail;

    public String getProvince() {
        return province;
    }

    public Address setProvince(String province) {
        this.province = province;
        return this;
    }

    public String getCity() {
        return city;
    }

    public Address setCity(String city) {
        this.city = city;
        return this;
    }

    public String getDistrict() {
        return district;
    }

    public Address setDistrict(String district) {
        this.district = district;
        return this;
    }

    public String getDetail() {
        return detail;
    }

    public Address setDetail(String detail) {
        this.detail = detail;
        return this;
    }

    @Override
    public String toString() {
        return "Address{" +
                "province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", district='" + district + '\'' +
                ", detail='" + detail + '\'' +
                '}';
    }
}
