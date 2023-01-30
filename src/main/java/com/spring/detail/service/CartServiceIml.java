package com.spring.detail.service;

import com.spring.detail.entity.CartItem;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import java.util.*;

@Service
@SessionScope
public class CartServiceIml implements CartService{
    Map<Integer, CartItem> map = new HashMap<>();

    @Override
    public void addCart(CartItem item) {
        CartItem cartItem = map.get(item.getProductEntity().getId());
        if (cartItem == null) {
            map.put(item.getProductEntity().getId(), item);
        }else {
            cartItem.setQuantity(cartItem.getQuantity() + 1);
        }
    }

    @Override
    public void removeCart(int id) {
        map.remove(id);
    }

    @Override
    public CartItem updateCart(int pid, int quantity) {
        CartItem item = map.get(pid);
        item.setQuantity(quantity);
        return item;
    }

    @Override
    public Collection<CartItem> getAllCartItem() {
        return map.values();
    }

    @Override
    public int getCount() {
        return map.values().size();
    }

    @Override
    public double getAmount() {
        return map.values().stream().mapToDouble(item -> item.getQuantity() * item.getProductEntity().getPrice()).sum();
    }
    @Override
    public void clear() {
        map.clear();
    }
}
