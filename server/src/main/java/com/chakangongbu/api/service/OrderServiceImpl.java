package com.chakangongbu.api.service;

import com.chakangongbu.api.entity.OrderEntity;
import com.chakangongbu.api.exception.ResourceNotFoundException;
import com.chakangongbu.api.model.NewOrder;
import com.chakangongbu.api.repository.OrderRepository;
import java.util.Objects;
import java.util.Optional;
import java.util.UUID;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import org.apache.logging.log4j.util.Strings;
import org.springframework.stereotype.Service;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakangongbu - 착한공부
 **/
@Service
public class OrderServiceImpl implements OrderService {

  private OrderRepository repository;
  private OrderRepository userRepo;

  public OrderServiceImpl(OrderRepository repository) {
    this.repository = repository;
  }

  @Override
  public Optional<OrderEntity> addOrder(@Valid NewOrder newOrder) {
    if (Strings.isEmpty(newOrder.getCustomerId())) {
      throw new ResourceNotFoundException("Invalid customer id.");
    }
    if (Objects.isNull(newOrder.getAddress()) || Strings.isEmpty(newOrder.getAddress().getId())) {
      throw new ResourceNotFoundException("Invalid address id.");
    }
    if (Objects.isNull(newOrder.getCard()) || Strings.isEmpty(newOrder.getCard().getId())) {
      throw new ResourceNotFoundException("Invalid card id.");
    }
    // 1. Save Order
    return repository.insert(newOrder);
    // Ideally, here it will trigger the rest of the process
    // 2. Initiate the payment
    // 3. Once the payment is authorized, change the status to paid
    // 4. Initiate the Shipment and changed the status to Shipment Initiated or Shipped
  }

  @Override
  public Iterable<OrderEntity> getOrdersByCustomerId(@NotNull @Valid String customerId) {
    return repository.findByCustomerId(UUID.fromString(customerId));
  }

  @Override
  public Optional<OrderEntity> getByOrderId(String id) {
    return repository.findById(UUID.fromString(id));
  }
}
