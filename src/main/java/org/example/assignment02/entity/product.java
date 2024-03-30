package org.example.assignment02.entity;

import java.lang.reflect.Array;
import java.util.ArrayList;

public class product {
    private Integer productId;
    private String productName;
    private Double price;
    private String image;
    private int quantity;
    private Double totalPrice;


    public product() {
        this.productId = 0;
        this.productName = "productName";
        this.price = 0.0d;
        this.image = "image";
        this.totalPrice = 0.0d;
    }
    public product(Integer productId, String productName, Double price, String image) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.image = image;
        this.quantity = 1;
        this.totalPrice = price;
    }
    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public Double getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(Double totalPrice){
        this.totalPrice = totalPrice;
    }
    @Override
    public String toString() {
        return "product{" +
                "productId=" + productId +
                ", productName='" + productName + '\'' +
                ", price=" + price +
                ", image='" + image + '\'' +
                ", quantity=" + quantity +
                ", totalPrice=" + totalPrice +
                '}';
    }
}

