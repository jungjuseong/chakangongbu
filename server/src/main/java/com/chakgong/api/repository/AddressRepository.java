package com.chakgong.api.repository;

import com.chakgong.api.entity.AddressEntity;

import java.util.UUID;
import org.springframework.data.repository.CrudRepository;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
 **/
public interface AddressRepository extends CrudRepository<AddressEntity, UUID> {
}

