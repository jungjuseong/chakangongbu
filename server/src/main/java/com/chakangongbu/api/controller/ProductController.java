package com.chakangongbu.api.controller;

import static org.springframework.http.ResponseEntity.ok;

import com.chakangongbu.api.ProductApi;
import com.chakangongbu.api.hateoas.ProductRepresentationModelAssembler;
import com.chakangongbu.api.model.Product;
import com.chakangongbu.api.service.ProductService;

import java.util.List;
import javax.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakangongbu - 착한공부
 **/
@RestController
public class ProductController implements ProductApi {

  private ProductService service;
  private final ProductRepresentationModelAssembler assembler;

  public ProductController(ProductService service, ProductRepresentationModelAssembler assembler) {
    this.service = service;
    this.assembler = assembler;
  }

  @Override
  public ResponseEntity<Product> getProduct(String id) {
    return service.getProduct(id).map(assembler::toModel).map(ResponseEntity::ok).orElse(ResponseEntity.notFound().build());
  }

  @Override
  public ResponseEntity<List<Product>> queryProducts(@Valid String tag, @Valid String name,
      @Valid Integer page, @Valid Integer size) {
    return ok(assembler.toListModel(service.getAllProducts()));
  }
}
