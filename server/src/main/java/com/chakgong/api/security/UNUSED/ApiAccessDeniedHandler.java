package com.chakgong.api.security.UNUSED;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.chakgong.api.exception.Error;
import com.chakgong.api.exception.ErrorCode;
import com.chakgong.api.exception.ErrorUtils;
import java.io.IOException;
import java.io.OutputStream;
import java.time.Instant;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

/**
 * @author : jungjuseong@gmail.com
 * @project : chakgong - 착한공부
 **/
@Component
public class ApiAccessDeniedHandler implements AccessDeniedHandler {

  private ObjectMapper mapper;

  public ApiAccessDeniedHandler(ObjectMapper mapper) {
    this.mapper = mapper;
  }

  @Override
  public void handle(HttpServletRequest req, HttpServletResponse res,
      AccessDeniedException e) throws IOException, ServletException {
    Error error = ErrorUtils
        .createError(ErrorCode.ACCESS_DENIED.getErrMsgKey(),
            ErrorCode.ACCESS_DENIED.getErrCode(),
            HttpStatus.FORBIDDEN.value())
        .setReqMethod(req.getMethod())
        .setTimestamp(Instant.now());
    res.setContentType(APPLICATION_JSON_VALUE);
    res.setCharacterEncoding("UTF-8");
    OutputStream out = res.getOutputStream();
    mapper.writeValue(out, error);
    out.flush();
  }
}
