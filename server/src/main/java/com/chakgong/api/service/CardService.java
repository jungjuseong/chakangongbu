package com.chakgong.api.service;

import com.chakgong.api.entity.CardEntity;
import com.chakgong.api.model.AddCardReq;
import java.util.Optional;
import javax.validation.Valid;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
 **/
public interface CardService {
  public void deleteCardById(String id);
  public Iterable<CardEntity> getAllCards();
  public Optional<CardEntity> getCardById(String id);
  public Optional<CardEntity> registerCard(@Valid AddCardReq addCardReq);
}
