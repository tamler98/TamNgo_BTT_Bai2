package com.spring.detail.repository;


import com.spring.detail.entity.OrderEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends CrudRepository<OrderEntity, Integer> {
    OrderEntity findByCustomerNameAndCustomerAddress(String name, String Address);
}
