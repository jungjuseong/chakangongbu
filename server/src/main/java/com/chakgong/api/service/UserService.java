package com.chakgong.api.service;

import com.chakgong.api.entity.AddressEntity;
import com.chakgong.api.entity.CardEntity;
import com.chakgong.api.entity.UserEntity;
import com.chakgong.api.model.RefreshToken;
import com.chakgong.api.model.SignedInUser;
import com.chakgong.api.model.User;
import java.util.Optional;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
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
