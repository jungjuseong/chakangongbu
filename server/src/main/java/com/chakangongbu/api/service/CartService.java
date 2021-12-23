package com.chakangongbu.api.service;

import com.chakangongbu.api.entity.CartEntity;
import com.chakangongbu.api.model.Item;
import java.util.List;
import javax.validation.Valid;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakangongbu - 착한공부
 **/
public interface CartService {

  public List<Item> addCartItemsByCustomerId(String customerId, @Valid Item item);

  public List<Item> addOrReplaceItemsByCustomerId(String customerId, @Valid Item item);

  public void deleteCart(String customerId);

  public void deleteItemFromCart(String customerId, String itemId);

  public CartEntity getCartByCustomerId(String customerId);

  public List<Item> getCartItemsByCustomerId(String customerId);

  public Item getCartItemsByItemId(String customerId, String itemId);
}
