package com.chakgong.api.repository;

import com.chakgong.api.entity.UserEntity;

import java.util.Optional;
import java.util.UUID;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
 **/
public interface UserRepository extends CrudRepository<UserEntity, UUID> {

  Optional<UserEntity> findByUsername(String username);

  @Query(value = "select count(u.*) from chakgong.user u where u.username = :username or u.email = :email", nativeQuery = true)
  Integer findByUsernameOrEmail(String username, String email);
}

