package com.chakangongbu.api.controller;

import com.chakangongbu.api.ShipmentApi;
import com.chakangongbu.api.hateoas.ShipmentRepresentationModelAssembler;
import com.chakangongbu.api.model.Shipment;
import com.chakangongbu.api.service.ShipmentService;

import java.util.List;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakangongbu - 착한공부
 **/
@RestController
public class ShipmentController implements ShipmentApi {

  private ShipmentService service;
  private final ShipmentRepresentationModelAssembler assembler;

  public ShipmentController(ShipmentService service, ShipmentRepresentationModelAssembler assembler) {
    this.service = service;
    this.assembler = assembler;
  }

  @Override
  public ResponseEntity<List<Shipment>> getShipmentByOrderId(@NotNull @Valid String id) {
    return ResponseEntity.ok(assembler.toListModel(service.getShipmentByOrderId(id)));
  }
}
