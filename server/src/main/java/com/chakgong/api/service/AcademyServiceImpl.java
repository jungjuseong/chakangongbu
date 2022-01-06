package com.chakgong.api.service;

import com.chakgong.api.entity.AcademyEntity;
import com.chakgong.api.repository.AcademyRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;
import java.util.UUID;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
 **/
@Service
@Transactional
public class AcademyServiceImpl implements AcademyService {

  private AcademyRepository repository;

  public AcademyServiceImpl(AcademyRepository repository) {
    this.repository = repository;
  }

  @Override
  public Iterable<AcademyEntity> getAllAcademy() {
    return repository.findAll();
  }

  @Override
  public Optional<AcademyEntity> getAcademy(String id) {
    return repository.findById(UUID.fromString(id));
  }
}
