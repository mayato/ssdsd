package com.cn.hnust.pojo;

import java.util.Date;

public class Cart {
    private Integer id;

    private String userName;

    private Double price;

    private Date cartTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Date getCartTime() {
        return cartTime;
    }

    public void setCartTime(Date cartTime) {
        this.cartTime = cartTime;
    }
}