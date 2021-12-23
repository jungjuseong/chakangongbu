package com.chakangongbu.api.security.UNUSED;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

import com.chakangongbu.api.security.Constants;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.chakangongbu.api.exception.Error;
import com.chakangongbu.api.exception.ErrorCode;
import com.chakangongbu.api.exception.ErrorUtils;
import java.io.IOException;
import java.io.OutputStream;
import java.time.Instant;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakangongbu - 착한공부
 **/
@Component
public class ApiAuthenticationEntryPoint implements AuthenticationEntryPoint {

  private final Logger LOG = LoggerFactory.getLogger(getClass());
  private ObjectMapper mapper;

  public ApiAuthenticationEntryPoint(ObjectMapper mapper) {
    this.mapper = mapper;
  }

  @Override
  public void commence(HttpServletRequest req,
      HttpServletResponse res, AuthenticationException e)
      throws IOException, ServletException {
    LOG.info("exception = " + e);
    LOG.info("exception.getCause() = " + e.getCause());
    String errorMsg = "";
    if (e instanceof InsufficientAuthenticationException) {
      errorMsg = e.getMessage();
    } else {
      errorMsg = ErrorCode.UNAUTHORIZED.getErrMsgKey();
    }
    Error error = ErrorUtils
        .createError(errorMsg, ErrorCode.UNAUTHORIZED.getErrCode(),
            HttpStatus.UNAUTHORIZED.value()).setUrl(Constants.TOKEN_URL)
        .setReqMethod(req.getMethod())
        .setTimestamp(Instant.now());
    res.setContentType(APPLICATION_JSON_VALUE);
    res.setCharacterEncoding("UTF-8");
    OutputStream out = res.getOutputStream();
    mapper.writeValue(out, error);
    out.flush();
  }
}
