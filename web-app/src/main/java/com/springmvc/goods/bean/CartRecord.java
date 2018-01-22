package com.springmvc.goods.bean;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Min;

public class CartRecord {

    @NotEmpty(message = "用户手机号码不能为空")
    private String mobileNo;
    @NotEmpty(message = "商品id不能为空")
    private String goodsId;
    @Min(value = 1,message = "商品数量必须大于等于1")
    private Integer amount;

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

}
