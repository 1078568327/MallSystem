package com.springmvc.goods.bean;

import com.springmvc.base.BaseEntity;

import java.util.Date;

public class Stock extends BaseEntity {

    private Goods goods;
    private Integer goodsStock;
    private Date updateTime;

    public Goods getGoods() {
        return goods;
    }

    public Stock setGoods(Goods goods) {
        this.goods = goods;
        return this;
    }

    public Integer getGoodsStock() {
        return goodsStock;
    }

    public Stock setGoodsStock(Integer goodsStock) {
        this.goodsStock = goodsStock;
        return this;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public Stock setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
        return this;
    }

    @Override
    public String toString() {
        return "Stock{" +
                "goods=" + goods +
                ", goodsStock=" + goodsStock +
                ", updateTime=" + updateTime +
                '}';
    }
}
