package com.spring.detail.repository;

import com.spring.detail.entity.OrderDetailsEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDetailRepository extends CrudRepository<OrderDetailsEntity, Integer> {

    List<OrderDetailsEntity> getOrderDetailByOrderId(int id);
    OrderDetailsEntity getOrderDetailByProductId(int id);
}
