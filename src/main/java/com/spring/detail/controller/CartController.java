package com.spring.detail.controller;

import com.spring.detail.entity.CartItem;
import com.spring.detail.entity.ProductEntity;
import com.spring.detail.repository.ProductRepository;
import com.spring.detail.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequestMapping(value="/cart")
public class CartController {

    @Autowired
    private CartService cartService;


    @Autowired
    private ProductRepository productRepository;



    @GetMapping()
    public String viewCarts(Model model) {
        double total = cartService.getAmount();
        model.addAttribute("total", total);
        model.addAttribute("type", "cart");
        model.addAttribute("cartItem", cartService.getAllCartItem());
        return "cart";
    }

    @GetMapping(value="/add/{id}")
    public String saveCarts(@PathVariable Integer id) {
        ProductEntity product = productRepository.findById(id).get();
        CartItem item = new CartItem();
        item.setProductId(product.getId());
        item.setName(product.getName());
        item.setPrice(product.getPrice());
        item.setQuantity(1);

        cartService.addCart(item);
        System.out.println("Add Cart Success");
        return "redirect:/cart";
    }
    @GetMapping(value="/clear")
    public String clearCart() {
        cartService.clear();
        return "redirect:/cart";
    }
    @GetMapping(value = "/remove/{id}")
    public String delCart(@PathVariable Integer id) {
        cartService.removeCart(id);
        return "redirect:/cart";
    }
}