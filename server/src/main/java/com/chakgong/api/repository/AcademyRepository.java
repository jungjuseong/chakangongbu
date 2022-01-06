package com.chakgong.api.repository;

import com.chakgong.api.entity.AcademyEntity;
import com.chakgong.api.entity.ProductEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.UUID;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
 **/
public interface AcademyRepository extends CrudRepository<AcademyEntity, UUID> {
}

