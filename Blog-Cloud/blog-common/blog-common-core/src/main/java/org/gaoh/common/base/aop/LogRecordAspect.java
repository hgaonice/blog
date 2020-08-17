package org.gaoh.common.base.aop;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.gaoh.common.exception.MyException;
import org.gaoh.common.util.SpringContextUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

;

/**
 * @Description: 控制台日志显示
 * @Author: gaoh
 * @Date: 2020/7/14 15:52
 * @Version: 1.0
 */
@Aspect
@Component
@Slf4j
public class LogRecordAspect {

    // 定义切点Pointcut
    @Pointcut("execution(public * org.gaoh.*.*.*.*Controller.*(..))")
    public void executionService() {
    }

    @Around("executionService()")
    public Object doAround(ProceedingJoinPoint point) throws Throwable {
        HttpServletRequest request = SpringContextUtils.getHttpServletRequest();
        if (request != null) {
            MethodSignature methodSignature = ((MethodSignature) point.getSignature());
            String url = request.getRequestURL().toString();
            String method = request.getMethod();
            String uri = request.getRequestURI();
            String queryString = request.getQueryString();

            String methodName = methodSignature.getMethod().getName();

            log.info("请求开始, 各个参数: \n\t url: {}\n\t method: {}\n\t methodName：{} \n\t uri: {} \n\t params: {}", url, method, methodName, uri, queryString);
        }
        // result的值就是被拦截方法的返回值
        Object result;
        try {
            result = point.proceed();
        } catch (Exception e) {
            e.printStackTrace();
            throw new MyException(e.getMessage());
        }
        log.info("请求结束的返回值是: " + result);
        return result;
    }
}