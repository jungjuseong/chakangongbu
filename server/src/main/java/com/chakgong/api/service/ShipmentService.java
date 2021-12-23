package com.chakgong.api.service;

import com.chakgong.api.entity.ShipmentEntity;
import javax.validation.constraints.Min;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
 **/
public interface ShipmentService {
  public Iterable<ShipmentEntity> getShipmentByOrderId(@Min(value = 1L, message = "Invalid product ID.")  String id);
}
