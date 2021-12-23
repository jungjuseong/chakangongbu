package com.chakangongbu.api.controller;

import com.chakangongbu.api.PaymentApi;
import com.chakangongbu.api.hateoas.PaymentRepresentationModelAssembler;
import com.chakangongbu.api.model.PaymentReq;
import com.chakangongbu.api.service.PaymentService;
import com.chakangongbu.api.model.Authorization;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakangongbu - 착한공부
 **/
@RestController
public class PaymentController implements PaymentApi {

  private PaymentService service;
  private final PaymentRepresentationModelAssembler assembler;

  public PaymentController(PaymentService service, PaymentRepresentationModelAssembler assembler) {
    this.service = service;
    this.assembler = assembler;
  }

  @Override
  public ResponseEntity<Authorization> authorize(@Valid PaymentReq paymentReq) {
    return null;
  }

  @Override
  public ResponseEntity<Authorization> getOrdersPaymentAuthorization(
      @NotNull @Valid String id) {
    return null;
  }
}
