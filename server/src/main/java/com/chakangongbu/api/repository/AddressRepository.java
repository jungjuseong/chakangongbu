package com.chakangongbu.api.repository;

import com.chakangongbu.api.entity.AddressEntity;

import java.util.UUID;
import org.springframework.data.repository.CrudRepository;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakangongbu - 착한공부
 **/
public interface AddressRepository extends CrudRepository<AddressEntity, UUID> {
}

