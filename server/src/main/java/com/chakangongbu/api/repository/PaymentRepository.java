package com.chakangongbu.api.repository;

import com.chakangongbu.api.entity.PaymentEntity;

import java.util.UUID;
import org.springframework.data.repository.CrudRepository;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakangongbu - 착한공부
 **/
public interface PaymentRepository extends CrudRepository<PaymentEntity, UUID> {
}

