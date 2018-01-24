package com.springmvc.user.bean;

import com.springmvc.base.BaseEntity;

public class Address extends BaseEntity {

    private String province;
    private String city;
    private String district;
    private String detail;
    private String postcode;
    private String consignee;
    private String mobileNo;

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

    public String getPostcode() {
        return postcode;
    }

    public Address setPostcode(String postcode) {
        this.postcode = postcode;
        return this;
    }

    public String getConsignee() {
        return consignee;
    }

    public Address setConsignee(String consignee) {
        this.consignee = consignee;
        return this;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public Address setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
        return this;
    }

    @Override
    public String toString() {
        return "Address{" +
                "province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", district='" + district + '\'' +
                ", detail='" + detail + '\'' +
                ", postcode='" + postcode + '\'' +
                ", consignee='" + consignee + '\'' +
                ", mobileNo='" + mobileNo + '\'' +
                '}';
    }
}
