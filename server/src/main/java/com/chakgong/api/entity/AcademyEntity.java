package com.chakgong.api.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "academy")
public class AcademyEntity {
  @Id
  @GeneratedValue
  @Column(name = "ID", updatable = false, nullable = false)
  private UUID id;

  @NotNull(message = "학원 이름은 필수입니다")
  @Basic(optional = false)
  @Column(name = "NAME")
  private String name;

  @Column(name = "ADDRESS")
  private String address;

  @Column(name = "DESCRIPTION")
  private String description;

  @Column(name = "KEYWORD")
  private String keyword;

  @Column(name = "IMAGE_URL")
  private String imageUrl;

  @Column(name = "VIDEO_URL")
  private String videoUrl;

  @Column(name = "REG_DATE")
  private Timestamp regDate;

  @OneToOne
  @JoinColumn(name = "OWNER_ID", referencedColumnName = "ID")
  private OwnerEntity owner;
}