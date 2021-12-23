package com.chakangongbu.api.service;

import com.chakangongbu.api.entity.CardEntity;
import com.chakangongbu.api.model.AddCardReq;
import java.util.Optional;
import javax.validation.Valid;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakangongbu - 착한공부
 **/
public interface CardService {
  public void deleteCardById(String id);
  public Iterable<CardEntity> getAllCards();
  public Optional<CardEntity> getCardById(String id);
  public Optional<CardEntity> registerCard(@Valid AddCardReq addCardReq);
}
