package com.chakgong.api.service;

import com.chakgong.api.entity.ItemEntity;
import com.chakgong.api.model.Item;
import java.util.List;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
 **/
public interface ItemService {

  ItemEntity toEntity(Item m);

  List<ItemEntity> toEntityList(List<Item> items);

  Item toModel(ItemEntity e);

  List<Item> toModelList(List<ItemEntity> items);
}
