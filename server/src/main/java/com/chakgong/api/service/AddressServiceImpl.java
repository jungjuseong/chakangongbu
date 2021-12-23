package com.chakgong.api.service;

import com.chakgong.api.entity.AddressEntity;
import com.chakgong.api.exception.ResourceNotFoundException;
import com.chakgong.api.model.AddAddressReq;
import com.chakgong.api.repository.AddressRepository;
import java.util.Optional;
import java.util.UUID;

import org.springframework.stereotype.Service;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
 **/
@Service
public class AddressServiceImpl implements AddressService {

  private AddressRepository repository;

  public AddressServiceImpl(AddressRepository repository) {
    this.repository = repository;
  }

  @Override
  public Optional<AddressEntity> createAddress(AddAddressReq addAddressReq) {
    return Optional.of(repository.save(toEntity(addAddressReq)));
  }

  @Override
  public void deleteAddressesById(String id) {
    repository.findById(UUID.fromString(id)).orElseThrow(() -> new ResourceNotFoundException(
        String.format("No Address found with id %s.", id)));
    repository.deleteById(UUID.fromString(id));
  }

  @Override
  public Optional<AddressEntity> getAddressesById(String id) {
    return repository.findById(UUID.fromString(id));
  }

  @Override
  public Iterable<AddressEntity> getAllAddresses() {
    return repository.findAll();
  }

  private AddressEntity toEntity(AddAddressReq model) {
    AddressEntity entity = new AddressEntity();
    return entity.setNumber(model.getNumber()).setResidency(model.getResidency())
        .setStreet(model.getStreet()).setCity(model.getCity()).setState(model.getState())
        .setCountry(model.getCountry()).setPincode(model.getPincode());
  }
}
