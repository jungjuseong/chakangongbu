package com.chakangongbu.api.repository;

import com.chakangongbu.api.entity.OrderItemEntity;

import java.util.UUID;
import org.springframework.data.repository.CrudRepository;


/**
 * @author : jungjuseong@gmail.com
 * @project : chakangongbu - 착한공부
 **/
public interface OrderItemRepository extends CrudRepository<OrderItemEntity, UUID> {
}
