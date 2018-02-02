package com.springmvc.goods.bean;

import com.springmvc.base.BaseEntity;
import com.springmvc.user.bean.User;

import java.math.BigDecimal;
import java.util.Date;

public class Comment extends BaseEntity {

    private User user;
    private Goods goods;
    private Order order;
    private BigDecimal fitScore;
    private BigDecimal sellerScore;
    private BigDecimal logisticsScore;
    private String goodsComment;
    private String serviceComment;
    private String commentPicture;
    private Date createTime;

    public User getUser() {
        return user;
    }

    public Comment setUser(User user) {
        this.user = user;
        return this;
    }

    public Goods getGoods() {
        return goods;
    }

    public Comment setGoods(Goods goods) {
        this.goods = goods;
        return this;
    }

    public Order getOrder() {
        return order;
    }

    public Comment setOrder(Order order) {
        this.order = order;
        return this;
    }

    public BigDecimal getFitScore() {
        return fitScore;
    }

    public Comment setFitScore(BigDecimal fitScore) {
        this.fitScore = fitScore;
        return this;
    }

    public BigDecimal getSellerScore() {
        return sellerScore;
    }

    public Comment setSellerScore(BigDecimal sellerScore) {
        this.sellerScore = sellerScore;
        return this;
    }

    public BigDecimal getLogisticsScore() {
        return logisticsScore;
    }

    public Comment setLogisticsScore(BigDecimal logisticsScore) {
        this.logisticsScore = logisticsScore;
        return this;
    }

    public String getGoodsComment() {
        return goodsComment;
    }

    public Comment setGoodsComment(String goodsComment) {
        this.goodsComment = goodsComment;
        return this;
    }

    public String getServiceComment() {
        return serviceComment;
    }

    public Comment setServiceComment(String serviceComment) {
        this.serviceComment = serviceComment;
        return this;
    }

    public String getCommentPicture() {
        return commentPicture;
    }

    public Comment setCommentPicture(String commentPicture) {
        this.commentPicture = commentPicture;
        return this;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public Comment setCreateTime(Date createTime) {
        this.createTime = createTime;
        return this;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "user=" + user +
                ", goods=" + goods +
                ", order=" + order +
                ", fitScore=" + fitScore +
                ", sellerScore=" + sellerScore +
                ", logisticsScore=" + logisticsScore +
                ", goodsComment='" + goodsComment + '\'' +
                ", serviceComment='" + serviceComment + '\'' +
                ", commentPicture='" + commentPicture + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
