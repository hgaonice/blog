package org.gaoh.common.exception;

import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.AuthorizationException;
import org.gaoh.common.exception.enums.ErrorEnum;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.NoHandlerFoundException;

/**
 * MyExceptionHandler
 *
 * @author gaoh
 * @date 2018/10/07 14:33
 * @email 2199382542@qq.com
 * @description 统一异常处理器
 */
@RestControllerAdvice
@Slf4j
public class MyExceptionHandler {

    /**
     * 处理自定义异常
     * @param e
     * @return
     */
    @ExceptionHandler(MyException.class)
    public org.gaoh.common.Result handleMyException(MyException e){
        org.gaoh.common.Result result=new org.gaoh.common.Result();
        result.put("code",e.getCode());
        result.put("msg",e.getMsg());
        return result;
    }

    @ExceptionHandler(NoHandlerFoundException.class)
    public org.gaoh.common.Result handlerNoFoundException(Exception e){
        log.error(e.getMessage(),e);
        return org.gaoh.common.Result.exception(ErrorEnum.PATH_NOT_FOUND);
    }

    @ExceptionHandler(DuplicateKeyException.class)
    public org.gaoh.common.Result handleDuplicateKeyException(DuplicateKeyException e){
        log.error(e.getMessage(),e);
        return org.gaoh.common.Result.exception(ErrorEnum.DUPLICATE_KEY);
    }

    @ExceptionHandler(AuthorizationException.class)
    public org.gaoh.common.Result handleAuthorizationException(AuthorizationException e){
        log.error(e.getMessage(),e);
        return org.gaoh.common.Result.exception(ErrorEnum.NO_AUTH);
    }

    @ExceptionHandler(Exception.class)
    public org.gaoh.common.Result handleException(Exception e){
        log.error(e.getMessage(),e);
        return org.gaoh.common.Result.exception();
    }
}
