package com.chakgong.api.repository;

import com.chakgong.api.entity.PaymentEntity;

import java.util.UUID;
import org.springframework.data.repository.CrudRepository;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
 **/
public interface PaymentRepository extends CrudRepository<PaymentEntity, UUID> {
}

