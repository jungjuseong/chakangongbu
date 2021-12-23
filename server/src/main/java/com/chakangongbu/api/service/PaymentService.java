package com.chakangongbu.api.service;

import com.chakangongbu.api.entity.AuthorizationEntity;
import com.chakangongbu.api.model.PaymentReq;
import java.util.Optional;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakangongbu - 착한공부
 **/
public interface PaymentService {

  public Optional<AuthorizationEntity> authorize(@Valid PaymentReq paymentReq);
  public Optional<AuthorizationEntity> getOrdersPaymentAuthorization(@NotNull String orderId);
}
