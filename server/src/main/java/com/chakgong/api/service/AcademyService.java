package com.chakgong.api.service;

import com.chakgong.api.entity.AcademyEntity;
import org.springframework.validation.annotation.Validated;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.util.Optional;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
 **/
@Validated
public interface AcademyService {
  @NotNull Iterable<AcademyEntity> getAllAcademy();
  Optional<AcademyEntity> getAcademy(@Min(value = 1L, message = "Invalid Academy ID.") String id);
}