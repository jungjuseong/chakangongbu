package com.chakgong.api.repository;

import com.chakgong.api.entity.ItemEntity;

import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
 **/
public interface ItemRepository extends CrudRepository<ItemEntity, UUID> {
  @Query(value = "select i.* from chakgong.cart c, chakgong.item i, chakgong.user u, chakgong.cart_item ci where u.id = :customerId and c.user_id=u.id and c.id=ci.cart_id and i.id=ci.item_id", nativeQuery=true)
  Iterable<ItemEntity> findByCustomerId(String customerId);

  @Modifying
  @Query(value = "delete from chakgong.cart_item where item_id in (:ids) and cart_id = :cartId", nativeQuery = true)
  void deleteCartItemJoinById(List<UUID> ids, UUID cartId);
}

