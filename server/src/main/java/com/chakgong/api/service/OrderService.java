package com.chakgong.api.service;

import com.chakgong.api.entity.OrderEntity;
import com.chakgong.api.model.NewOrder;
import java.util.Optional;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
 **/
public interface OrderService {

  public Optional<OrderEntity> addOrder(@Valid NewOrder newOrder);
  public Iterable<OrderEntity> getOrdersByCustomerId(@NotNull @Valid String customerId);
  public Optional<OrderEntity> getByOrderId(String id);
}
