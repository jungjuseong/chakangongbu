package com.chakgong.api.service;

import com.chakgong.api.entity.AddressEntity;
import com.chakgong.api.model.AddAddressReq;
import java.util.Optional;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
 **/
public interface AddressService {
  public Optional<AddressEntity> createAddress(AddAddressReq addAddressReq);
  public void deleteAddressesById(String id);
  public Optional<AddressEntity> getAddressesById(String id);
  public Iterable<AddressEntity> getAllAddresses();
}
