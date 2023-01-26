package com.spring.detail.controller;

import com.spring.detail.entity.ProductEntity;
import com.spring.detail.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequestMapping(value = "/")
public class ProductController {
    @Autowired
    ProductRepository productRepository;

    @RequestMapping(method = GET)
    public String showProducts(Model model) {
        List<ProductEntity> productList = (List<ProductEntity>) productRepository.findAll();
        model.addAttribute("productList", productList);
        return "productList";
    }

    @RequestMapping(value = "/index", method = GET)
    public String index(){
        return "productList";
    }

    @RequestMapping(value = "/search", method = GET)
    public String search(@RequestParam("searchInput") String searchInput, Model model) {
        List<ProductEntity> searchList;
        if (searchInput.isEmpty()) {
            searchList = (List<ProductEntity>) productRepository.findAll();
        } else {
            searchList = productRepository.findByNameContaining(searchInput);
        }
        model.addAttribute("productList",searchList);
        return "productList";
    }

//    @RequestMapping(value = "/newProduct", method = GET)
//    public String showNewBook(Model model) {
//        model.addAttribute("product", new ProductEntity());
//        model.addAttribute("msg", "Add a new product");
//        model.addAttribute("action", "newProduct");
//        model.addAttribute("type", "newProducts");
//        return "product";
//    }
//
//    @RequestMapping(value = "/newProduct", method = POST, produces = "text/plain;charset=UTF-8")
//    public String saveProduct(ProductEntity product) {
//        productRepository.save(product);
//        System.out.println("Success");
//        return "redirect:/";
//    }

    @RequestMapping(value = "/newProducts", method = POST, produces = "text/plain;charset=UTF-8")
    public String saveProducts(ProductEntity product) {
        productRepository.save(product);
        System.out.println("Add Product Success");
        return "redirect:/";
    }

    @RequestMapping(value = "/delete/{id}", method = GET)
    public String deleteProduct(@PathVariable int id) {
        productRepository.deleteById(id);
        return "redirect:/";
    }
    //
    @RequestMapping(value = "/edit/updateProduct/{id}", method = RequestMethod.POST)
    public String updateProduct(Model model,@PathVariable int id,
                                 @RequestParam("newName") String name,
                                 @RequestParam("newPrice") double price){
        ProductEntity product = productRepository.findById(id).get();
        product.setName(name);
        product.setPrice(price);
        productRepository.save(product);
        return "redirect:/";
    }
}

