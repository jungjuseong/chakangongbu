package com.chakangongbu.api.service;

import com.chakangongbu.api.entity.AddressEntity;
import com.chakangongbu.api.entity.CardEntity;
import com.chakangongbu.api.entity.UserEntity;
import com.chakangongbu.api.model.RefreshToken;
import com.chakangongbu.api.model.SignedInUser;
import com.chakangongbu.api.model.User;
import java.util.Optional;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakangongbu - 착한공부
 **/
public interface UserService {

  void deleteCustomerById(String id);

  Optional<Iterable<AddressEntity>> getAddressesByCustomerId(String id);

  Iterable<UserEntity> getAllCustomers();

  Optional<CardEntity> getCardByCustomerId(String id);

  Optional<UserEntity> getCustomerById(String id);

  Optional<SignedInUser> createUser(User user);

  UserEntity findUserByUsername(String username);

  SignedInUser getSignedInUser(UserEntity userEntity);

  Optional<SignedInUser> getAccessToken(RefreshToken refreshToken);

  void removeRefreshToken(RefreshToken refreshToken);
}
