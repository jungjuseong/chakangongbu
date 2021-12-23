package com.chakgong.api.controller;

import static org.springframework.http.ResponseEntity.accepted;
import static org.springframework.http.ResponseEntity.ok;
import static org.springframework.http.ResponseEntity.status;

import com.chakgong.api.UserApi;
import com.chakgong.api.entity.UserEntity;
import com.chakgong.api.model.RefreshToken;
import com.chakgong.api.model.SignInReq;
import com.chakgong.api.model.SignedInUser;
import com.chakgong.api.service.UserService;
import com.chakgong.api.exception.InvalidRefreshTokenException;
import com.chakgong.api.model.User;

import javax.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
 **/
@RestController
public class AuthController implements UserApi {

  private final UserService service;
  private final PasswordEncoder passwordEncoder;

  public AuthController(UserService service, PasswordEncoder passwordEncoder) {
    this.service = service;
    this.passwordEncoder = passwordEncoder;
  }

  @Override
  public ResponseEntity<SignedInUser> getAccessToken(@Valid RefreshToken refreshToken) {
    return ok(service.getAccessToken(refreshToken).orElseThrow(InvalidRefreshTokenException::new));
  }

  @Override
  public ResponseEntity<SignedInUser> signIn(@Valid SignInReq signInReq) {
    UserEntity userEntity = service.findUserByUsername(signInReq.getUsername());
    if (passwordEncoder.matches(signInReq.getPassword(), userEntity.getPassword())) {
      return ok(service.getSignedInUser(userEntity));
    }
    throw new InsufficientAuthenticationException("Unauthorized.");
  }

  @Override
  public ResponseEntity<Void> signOut(@Valid RefreshToken refreshToken) {
    // We are using removeToken API for signout.
    // Ideally you would like to get tgit she user ID from Logged in user's request
    // and remove the refresh token based on retrieved user id from request.
    service.removeRefreshToken(refreshToken);
    return accepted().build();
  }

  @Override
  public ResponseEntity<SignedInUser> signUp(@Valid User user) {
    // Have a validation for all required fields.
    return status(HttpStatus.CREATED).body(service.createUser(user).get());
  }
}
