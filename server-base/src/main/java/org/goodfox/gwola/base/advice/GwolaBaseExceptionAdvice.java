package org.goodfox.gwola.base.advice;

import org.goodfox.gwola.util.exception.LoginInvalidException;
import org.goodfox.gwola.util.exception.GwolaBaseException;
import org.goodfox.gwola.util.http.ResponseMessage;
import org.goodfox.gwola.util.http.ResponseMessageCodeEnum;
import org.goodfox.gwola.util.http.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

@ControllerAdvice
public class GwolaBaseExceptionAdvice {

    private static final Logger logger = LoggerFactory.getLogger(GwolaBaseExceptionAdvice.class);

    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(LoginInvalidException.class)
    @ResponseBody
    public ResponseMessage handlerLoginInvalidException(LoginInvalidException exception) {
        logger.warn(exception.getMessage(), exception);
        return Result.error(ResponseMessageCodeEnum.RE_LOGIN.getCode(), "登录失效");
    }

    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(GwolaBaseException.class)
    @ResponseBody
    public ResponseMessage handlerGwolaBaseException(GwolaBaseException exception) {
        logger.warn(exception.getMessage(), exception);
        return Result.error(exception.getErrorCode(), exception.getMessage());
    }

    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(Exception.class)
    @ResponseBody
    public ResponseMessage handlerException(Exception exception) {
        logger.error(exception.getMessage(), exception);
        // TODO 在数据库中记录程序异常，这个地方的异常是未处理的异常，需要管理员查看并进行处理以防重复出现
        return Result.error(ResponseMessageCodeEnum.ERROR.getCode(), "程序异常，请重试。如果重复出现请联系管理员处理！");
    }

}
