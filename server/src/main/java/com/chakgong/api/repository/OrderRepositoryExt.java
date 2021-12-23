package com.chakgong.api.repository;

import com.chakgong.api.entity.OrderEntity;
import com.chakgong.api.model.NewOrder;

import java.util.Optional;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
 **/
public interface OrderRepositoryExt {
  Optional<OrderEntity> insert(NewOrder m);
}

