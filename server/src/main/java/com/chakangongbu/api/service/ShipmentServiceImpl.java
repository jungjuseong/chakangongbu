package com.chakangongbu.api.service;

import com.chakangongbu.api.entity.ShipmentEntity;
import com.chakangongbu.api.repository.ShipmentRepository;
import java.util.List;
import java.util.UUID;
import javax.validation.constraints.Min;
import org.springframework.stereotype.Service;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakangongbu - 착한공부
 **/
@Service
public class ShipmentServiceImpl implements ShipmentService {

  private ShipmentRepository repository;

  public ShipmentServiceImpl(ShipmentRepository repository) {
    this.repository = repository;
  }

  @Override
  public Iterable<ShipmentEntity> getShipmentByOrderId(
      @Min(value = 1L, message = "Invalid shipment ID.") String id) {
    return repository.findAllById(List.of(UUID.fromString(id)));
  }
}
