package com.spring.detail.controller;

import com.spring.detail.entity.CartItem;
import com.spring.detail.entity.OrderDetailsEntity;
import com.spring.detail.entity.OrderEntity;
import com.spring.detail.entity.ProductEntity;
import com.spring.detail.repository.OrderDetailRepository;
import com.spring.detail.repository.OrderRepository;
import com.spring.detail.repository.ProductRepository;
import com.spring.detail.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;
import java.time.LocalDate;
import java.util.*;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequestMapping(value="/cart")
public class CartController {

    @Autowired
    private CartService cartService;


    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderDetailRepository orderDetailRepository;



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
        item.setProductEntity(product);
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

    @PostMapping(value = "/update/{id}")
    public String delCart(@PathVariable Integer id,
                          @RequestParam int quantity) {
        cartService.updateCart(id, quantity);
        return "redirect:/cart";
    }
    @GetMapping(value = "/checkout")
    public String checkout(Model model) {
        model.addAttribute("order", new OrderEntity());
        return "checkoutorder";
    }

    @RequestMapping(value = "/checkout", method = POST, produces = "text/plain;charset=UTF-8")
    public String checkOut(@Valid @ModelAttribute("order") OrderEntity order, BindingResult result) {
        OrderEntity order1 = orderRepository.findByCustomerNameAndCustomerAddress(order.getCustomerName(), order.getCustomerAddress());
        if (result.hasErrors()) {
            return "checkoutorder";
        } else {
            if (order1 != null) {
                orderRepository.save(order1);
                Collection<CartItem> cartItems = cartService.getAllCartItem();
                for (CartItem item : cartItems) {
                    OrderDetailsEntity orderDetail = new OrderDetailsEntity();
                    ProductEntity product = productRepository.findById(item.getProductEntity().getId()).get();
                    orderDetail.setQuantity(item.getQuantity());
                    orderDetail.setOrder(order1);
                    orderDetail.setProduct(product);
                    orderDetailRepository.save(orderDetail);
                }
            }else {
                orderRepository.save(order);
                Collection<CartItem> cartItems = cartService.getAllCartItem();
                for (CartItem item : cartItems) {
                    OrderDetailsEntity orderDetail = new OrderDetailsEntity();
                    ProductEntity product = productRepository.findById(item.getProductEntity().getId()).get();
                    orderDetail.setQuantity(item.getQuantity());
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(product);
                    orderDetailRepository.save(orderDetail);
                }
            }
            cartService.clear();
            System.out.println("ok");
            return "redirect:/orderlist";
        }
        }
    @GetMapping("/view_orderId={id}")
    public String viewCartOfCustomer(@PathVariable int id, Model model) {
        OrderEntity order = orderRepository.findById(id).get();
        model.addAttribute("customer", order);
        List<OrderDetailsEntity> orderDetails = orderDetailRepository.getOrderDetailByOrderId(id);
        model.addAttribute("orderDetails", orderDetails);
        return "usercart";
    }

    @GetMapping("/page")
    public String userList(Model model, @RequestParam(defaultValue = "0") int page) {
        Pageable pageable = PageRequest.of(page, 5);
        Page<OrderDetailsEntity> userPage = orderDetailRepository.findAll(pageable);
        System.out.println(userPage.getContent().get(1).getQuantity());
        System.out.println(userPage.getContent().get(1).getProduct().getName());
        model.addAttribute("userPage", userPage);
        return "page";
    }

    @GetMapping("/removeOrderDetail{id}")
    public String deleteCart(@PathVariable int id) {
        orderDetailRepository.deleteById(id);
        return "redirect:/orderlist";
    }
}
