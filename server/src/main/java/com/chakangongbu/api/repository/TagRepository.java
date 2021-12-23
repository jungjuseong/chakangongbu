package com.chakangongbu.api.repository;

import com.chakangongbu.api.entity.TagEntity;

import java.util.UUID;
import org.springframework.data.repository.CrudRepository;


/**
 * @author : jungjuseong@gmail.com
 * @project : chakangongbu - 착한공부
 **/
public interface TagRepository extends CrudRepository<TagEntity, UUID> {
}
