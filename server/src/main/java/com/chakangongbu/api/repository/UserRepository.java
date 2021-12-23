package com.chakangongbu.api.repository;

import com.chakangongbu.api.entity.UserEntity;

import java.util.Optional;
import java.util.UUID;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakangongbu - 착한공부
 **/
public interface UserRepository extends CrudRepository<UserEntity, UUID> {

  Optional<UserEntity> findByUsername(String username);

  @Query(value = "select count(u.*) from ecomm.user u where u.username = :username or u.email = :email", nativeQuery = true)
  Integer findByUsernameOrEmail(String username, String email);
}

