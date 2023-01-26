package com.spring.detail.controller;

import com.spring.detail.entity.OrderEntity;
import com.spring.detail.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequestMapping(value = "/orderlist")
public class OrderController {
        @Autowired
        OrderRepository orderRepository;

        @RequestMapping( method = GET)
        public String showOrders(Model model) {
            model.addAttribute("type", "orders");
            List<OrderEntity> orderList = (List<OrderEntity>) orderRepository.findAll();
            model.addAttribute("orderList", orderList);
            return "orderlist";
        }

    @RequestMapping(value = "/newOrder", method = GET)
    public String showNewOrder(Model model) {
        model.addAttribute("order", new OrderEntity());
        model.addAttribute("msg", "Add a new order");
        model.addAttribute("action", "newOrder");
        model.addAttribute("type", "newOrder");
        return "orderlist";
    }

    @RequestMapping(value = "/newOrder", method = POST, produces = "text/plain;charset=UTF-8")
    public String saveOrder(OrderEntity order) {
        orderRepository.save(order);
        System.out.println("NewOrder Success");
        return "redirect:/orderlist";
    }

    @RequestMapping(value = "/delete/{id}", method = GET)
    public String deleteProduct(@PathVariable int id) {
        orderRepository.deleteById(id);
        return "redirect:/orderlist";
    }

}
