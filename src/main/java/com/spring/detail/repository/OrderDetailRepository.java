package com.spring.detail.repository;

import com.spring.detail.entity.OrderDetailsEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDetailRepository extends PagingAndSortingRepository<OrderDetailsEntity, Integer> {

    List<OrderDetailsEntity> getOrderDetailByOrderId(int id);
    OrderDetailsEntity getOrderDetailByProductId(int id);
    Page<OrderDetailsEntity> findAll(Pageable pageable);
    }

