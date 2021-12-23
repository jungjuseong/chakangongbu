package com.chakgong.api.controller;

import com.chakgong.api.ShipmentApi;
import com.chakgong.api.hateoas.ShipmentRepresentationModelAssembler;
import com.chakgong.api.model.Shipment;
import com.chakgong.api.service.ShipmentService;

import java.util.List;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
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
