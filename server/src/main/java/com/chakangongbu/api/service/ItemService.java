package com.chakangongbu.api.service;

import com.chakangongbu.api.entity.ItemEntity;
import com.chakangongbu.api.model.Item;
import java.util.List;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakangongbu - 착한공부
 **/
public interface ItemService {

  ItemEntity toEntity(Item m);

  List<ItemEntity> toEntityList(List<Item> items);

  Item toModel(ItemEntity e);

  List<Item> toModelList(List<ItemEntity> items);
}
