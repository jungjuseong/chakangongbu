package com.chakgong.api.repository;

import com.chakgong.api.entity.ShipmentEntity;

import java.util.UUID;
import org.springframework.data.repository.CrudRepository;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
 **/
public interface ShipmentRepository extends CrudRepository<ShipmentEntity, UUID> {
}

