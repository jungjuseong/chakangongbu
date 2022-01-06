package com.chakgong.api.controller;

import com.chakgong.api.ProductApi;
import com.chakgong.api.hateoas.AcademyRepresentationModelAssembler;
import com.chakgong.api.model.Product;
import com.chakgong.api.service.AcademyService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

import static org.springframework.http.ResponseEntity.ok;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
 **/
@RestController
public class AcademyController implements AcademyApi {

  private AcademyService service;
  private final AcademyRepresentationModelAssembler assembler;

  public AcademyController(AcademyService service, AcademyRepresentationModelAssembler assembler) {
    this.service = service;
    this.assembler = assembler;
  }

  @Override
  public ResponseEntity<Product> getProduct(String id) {
    return service.getAcademy(id).map(assembler::toModel).map(ResponseEntity::ok).orElse(ResponseEntity.notFound().build());
  }

  @Override
  public ResponseEntity<List<Academy>> queryProducts(@Valid String tag, @Valid String name,
      @Valid Integer page, @Valid Integer size) {
    return ok(assembler.toListModel(service.getAllAcademy()));
  }
}
