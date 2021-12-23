package com.chakangongbu.api.service;

import com.chakangongbu.api.entity.CardEntity;
import com.chakangongbu.api.entity.UserEntity;
import com.chakangongbu.api.model.AddCardReq;
import com.chakangongbu.api.repository.CardRepository;
import com.chakangongbu.api.repository.UserRepository;
import java.util.Optional;
import java.util.UUID;
import javax.validation.Valid;
import org.springframework.stereotype.Service;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakangongbu - 착한공부
 **/
@Service
public class CardServiceImpl implements CardService {
  private CardRepository repository;
  private UserRepository userRepo;

  public CardServiceImpl(CardRepository repository, UserRepository userRepo) {
    this.repository = repository;
    this.userRepo = userRepo;
  }

  @Override
  public void deleteCardById(String id) {
    repository.deleteById(UUID.fromString(id));
  }

  @Override
  public Iterable<CardEntity> getAllCards() {
    return repository.findAll();
  }

  @Override
  public Optional<CardEntity> getCardById(String id) {
    return repository.findById(UUID.fromString(id));
  }

  @Override
  public Optional<CardEntity> registerCard(@Valid AddCardReq addCardReq) {
    // add validation to make sure that only single card exists from one user
    // else it throw DataIntegrityViolationException for user_id (unique)
    return Optional.of(repository.save(toEntity(addCardReq)));
  }

  private CardEntity toEntity(AddCardReq m) {
    CardEntity e = new CardEntity();
    Optional<UserEntity> user = userRepo.findById(UUID.fromString(m.getUserId()));
    user.ifPresent(u -> e.setUser(u));
    return e.setNumber(m.getCardNumber()).setCvv(m.getCvv())
        .setExpires(m.getExpires());
  }
}
