package com.chakgong.api.service;

import com.chakgong.api.entity.ProductEntity;
import java.util.Optional;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import org.springframework.validation.annotation.Validated;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
 **/
@Validated
public interface ProductService {
  @NotNull Iterable<ProductEntity> getAllProducts();
  Optional<ProductEntity> getProduct(@Min(value = 1L, message = "Invalid product ID.") String id);
}