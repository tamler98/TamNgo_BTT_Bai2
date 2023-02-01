package com.spring.detail.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface PagingAndSortingRepository<OrderDetailsEntity, Integer> extends CrudRepository<OrderDetailsEntity, Integer> {
}
