package com.spring.detail.repository;

import com.spring.detail.entity.OrderDetailsEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderDetailRepository extends CrudRepository<OrderDetailsEntity, Integer> {
}
