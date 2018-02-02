package com.springmvc.goods.bean;

public class AddComment {

    private String orderId;
    private double fitScore;
    private double sellerScore;
    private double logisticsScore;
    private String goodsComment;
    private String serviceComment;
    private String images;
    private String token;

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public double getFitScore() {
        return fitScore;
    }

    public void setFitScore(double fitScore) {
        this.fitScore = fitScore;
    }

    public double getSellerScore() {
        return sellerScore;
    }

    public void setSellerScore(double sellerScore) {
        this.sellerScore = sellerScore;
    }

    public double getLogisticsScore() {
        return logisticsScore;
    }

    public void setLogisticsScore(double logisticsScore) {
        this.logisticsScore = logisticsScore;
    }

    public String getGoodsComment() {
        return goodsComment;
    }

    public void setGoodsComment(String goodsComment) {
        this.goodsComment = goodsComment;
    }

    public String getServiceComment() {
        return serviceComment;
    }

    public void setServiceComment(String serviceComment) {
        this.serviceComment = serviceComment;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }
}
