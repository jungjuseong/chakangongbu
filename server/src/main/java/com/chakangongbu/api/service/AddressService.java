package com.chakangongbu.api.service;

import com.chakangongbu.api.entity.AddressEntity;
import com.chakangongbu.api.model.AddAddressReq;
import java.util.Optional;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakangongbu - 착한공부
 **/
public interface AddressService {
  public Optional<AddressEntity> createAddress(AddAddressReq addAddressReq);
  public void deleteAddressesById(String id);
  public Optional<AddressEntity> getAddressesById(String id);
  public Iterable<AddressEntity> getAllAddresses();
}
