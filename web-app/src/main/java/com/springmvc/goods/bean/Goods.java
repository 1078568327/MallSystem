package com.springmvc.goods.bean;

import com.springmvc.base.BaseEntity;

import java.math.BigDecimal;
import java.util.Date;

public class Goods extends BaseEntity{

    private String goodsName;
    private BigDecimal goodsPrice;
    private BigDecimal originPrice;
    private String goodsImages;
    private String detailImages;
    private String goodsType;
    private Integer commentAmount;
    private Integer collectAmount;
    private Integer dealAmount;
    private Date addTime;
    private Integer isSale;

    public String getGoodsName() {
        return goodsName;
    }

    public Goods setGoodsName(String goodsName) {
        this.goodsName = goodsName;
        return this;
    }

    public BigDecimal getGoodsPrice() {
        return goodsPrice;
    }

    public Goods setGoodsPrice(BigDecimal goodsPrice) {
        this.goodsPrice = goodsPrice;
        return this;
    }

    public BigDecimal getOriginPrice() {
        return originPrice;
    }

    public Goods setOriginPrice(BigDecimal originPrice) {
        this.originPrice = originPrice;
        return this;
    }

    public String getGoodsImages() {
        return goodsImages;
    }

    public Goods setGoodsImages(String goodsImages) {
        this.goodsImages = goodsImages;
        return this;
    }

    public String getDetailImages() {
        return detailImages;
    }

    public Goods setDetailImages(String detailImages) {
        this.detailImages = detailImages;
        return this;
    }

    public String getGoodsType() {
        return goodsType;
    }

    public Goods setGoodsType(String goodsType) {
        this.goodsType = goodsType;
        return this;
    }

    public Integer getCommentAmount() {
        return commentAmount;
    }

    public Goods setCommentAmount(Integer commentAmount) {
        this.commentAmount = commentAmount;
        return this;
    }

    public Integer getCollectAmount() {
        return collectAmount;
    }

    public Goods setCollectAmount(Integer collectAmount) {
        this.collectAmount = collectAmount;
        return this;
    }

    public Integer getDealAmount() {
        return dealAmount;
    }

    public Goods setDealAmount(Integer dealAmount) {
        this.dealAmount = dealAmount;
        return this;
    }

    public Date getAddTime() {
        return addTime;
    }

    public Goods setAddTime(Date addTime) {
        this.addTime = addTime;
        return this;
    }

    public Integer getIsSale() {
        return isSale;
    }

    public Goods setIsSale(Integer isSale) {
        this.isSale = isSale;
        return this;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "goodsName='" + goodsName + '\'' +
                ", goodsPrice=" + goodsPrice +
                ", originPrice=" + originPrice +
                ", goodsImages='" + goodsImages + '\'' +
                ", detailImages='" + detailImages + '\'' +
                ", goodsType='" + goodsType + '\'' +
                ", commentAmount=" + commentAmount +
                ", collectAmount=" + collectAmount +
                ", dealAmount=" + dealAmount +
                ", addTime=" + addTime +
                ", isSale=" + isSale +
                '}';
    }
}
