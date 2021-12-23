package com.chakangongbu.api.repository;

import com.chakangongbu.api.entity.OrderEntity;
import com.chakangongbu.api.model.NewOrder;

import java.util.Optional;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakangongbu - 착한공부
 **/
public interface OrderRepositoryExt {
  Optional<OrderEntity> insert(NewOrder m);
}

