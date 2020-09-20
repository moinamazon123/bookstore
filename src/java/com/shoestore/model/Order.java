/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shoestore.model;

/**
 *
 * @author moin
 */
public class Order {
    
    public int order_id;
    
    public int order_value;
    
    public String order_status;
    
    public String order_date;
    
    public int user_id;
    
    public int  cart_item_id;
    
    public String delivery_date;
    
    public boolean  isCanceled;
    
    public boolean isRefundProcessed;
    
    public String cardNo;
    
    public String CVV;
    
    public String expDate;
    
    public String accountHolderName;
    
    public String shiiping_address;

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getOrder_value() {
        return order_value;
    }

    public void setOrder_value(int order_value) {
        this.order_value = order_value;
    }

    public String getOrder_status() {
        return order_status;
    }

    public void setOrder_status(String order_status) {
        this.order_status = order_status;
    }

    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getCart_item_id() {
        return cart_item_id;
    }

    public void setCart_item_id(int cart_item_id) {
        this.cart_item_id = cart_item_id;
    }

    public String getDelivery_date() {
        return delivery_date;
    }

    public void setDelivery_date(String delivery_date) {
        this.delivery_date = delivery_date;
    }

    public boolean isIsCanceled() {
        return isCanceled;
    }

    public void setIsCanceled(boolean isCanceled) {
        this.isCanceled = isCanceled;
    }

    public boolean isIsRefundProcessed() {
        return isRefundProcessed;
    }

    public void setIsRefundProcessed(boolean isRefundProcessed) {
        this.isRefundProcessed = isRefundProcessed;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getCVV() {
        return CVV;
    }

    public void setCVV(String CVV) {
        this.CVV = CVV;
    }

    public String getExpDate() {
        return expDate;
    }

    public void setExpDate(String expDate) {
        this.expDate = expDate;
    }

    public String getAccountHolderName() {
        return accountHolderName;
    }

    public void setAccountHolderName(String accountHolderName) {
        this.accountHolderName = accountHolderName;
    }

    public String getShiiping_address() {
        return shiiping_address;
    }

    public void setShiiping_address(String shiiping_address) {
        this.shiiping_address = shiiping_address;
    }
    
    
    
    
    
}
