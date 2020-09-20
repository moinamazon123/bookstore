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
public class Cart {
    
    int cart_id;

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }
      int  product_id ;
 
 int priceint ;
 int quantity ;
 int totalValue;

    public int getTotalValue() {
        return totalValue;
    }

    public void setTotalValue(int totalValue) {
        this.totalValue = totalValue;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getPriceint() {
        return priceint;
    }

    public void setPriceint(int priceint) {
        this.priceint = priceint;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getUsert_id() {
        return usert_id;
    }

    public void setUsert_id(int usert_id) {
        this.usert_id = usert_id;
    }
int usert_id;
}
