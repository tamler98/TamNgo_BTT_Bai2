package com.spring.detail.service;

import com.spring.detail.entity.CartItem;

import java.util.Collection;

public interface CartService {
    void addCart(CartItem item);

    void removeCart(int id);

    CartItem updateCart(int id, int quantity);

    Collection<CartItem> getAllCartItem();

    int getCount();

    double getAmount();


    void clear();
}
