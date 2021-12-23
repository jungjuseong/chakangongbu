package com.chakgong.api.security.UNUSED;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chakgong.api.security.Constants;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
 **/
public class JwtAuthenticationFilter extends BasicAuthenticationFilter {

  public JwtAuthenticationFilter(AuthenticationManager authenticationManager) {
    super(authenticationManager);
  }

  @Override
  protected void doFilterInternal(HttpServletRequest req, HttpServletResponse res,
      FilterChain chain) throws IOException, ServletException {
    String header = req.getHeader(Constants.AUTHORIZATION);
    if (Objects.isNull(header) || !header.startsWith(Constants.TOKEN_PREFIX)) {
      chain.doFilter(req, res);
      return;
    }

    Optional<UsernamePasswordAuthenticationToken> authentication = getAuthentication(req);
    authentication.ifPresentOrElse(e -> SecurityContextHolder.getContext().setAuthentication(e),
        SecurityContextHolder::clearContext);
    chain.doFilter(req, res);
  }

  private Optional<UsernamePasswordAuthenticationToken> getAuthentication(
      HttpServletRequest request) {
    String token = request.getHeader(Constants.AUTHORIZATION);
    if (Objects.nonNull(token)) {
      DecodedJWT jwt = JWT.require(Algorithm.HMAC512(Constants.SECRET_KEY.getBytes(StandardCharsets.UTF_8)))
          .build()
          .verify(token.replace(Constants.TOKEN_PREFIX, ""));
      String user = jwt.getSubject();
      @SuppressWarnings("unchecked")
      List<String> authorities = (List) jwt.getClaim(Constants.ROLE_CLAIM);
      if (Objects.nonNull(user)) {
        return Optional.of(new UsernamePasswordAuthenticationToken(
            user, null, Objects.nonNull(authorities) ? authorities.stream().map(
            SimpleGrantedAuthority::new).collect(Collectors.toList()) : Collections.emptyList()));
      }
    }
    return Optional.empty();
  }
}