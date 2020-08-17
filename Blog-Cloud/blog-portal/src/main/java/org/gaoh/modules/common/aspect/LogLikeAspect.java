package org.gaoh.modules.common.aspect;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.gaoh.common.util.HttpContextUtils;
import org.gaoh.common.util.IPUtils;
import org.gaoh.common.util.JsonUtils;
import org.gaoh.modules.client.log.LogFeignClient;
import org.gaoh.modules.common.annotation.ReadType;
import org.gaoh.modules.entity.manage.log.LogLike;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.time.LocalDateTime;
import java.util.Objects;

/**
 * ViewLogAspect
 *
 * @author gaoh
 * @description 用户点赞量
 */
@Aspect
@Component
@Slf4j
public class LogLikeAspect {
    @Resource
    private LogFeignClient logFeignClient;

    @Pointcut("@annotation(org.gaoh.modules.common.annotation.LogLike)")
    public void logPointCut() {

    }

    @Around("logPointCut()")
    @Transactional(rollbackFor = Exception.class)
    public Object around(ProceedingJoinPoint point) throws Throwable {
        long beginTime = System.currentTimeMillis();
        //执行方法
        Object result = point.proceed();
        //执行时长(毫秒)
        long time = System.currentTimeMillis() - beginTime;

        //保存日志
        saveLogLike(point, time);

        return result;
    }

    private void saveLogLike(ProceedingJoinPoint joinPoint, long time) {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();
        LogLike logLikeEntity = new LogLike();
        org.gaoh.modules.common.annotation.LogLike viewLog = method.getAnnotation(org.gaoh.modules.common.annotation.LogLike.class);
        //注解上的类型
        String type = viewLog.type().getDescription();

        logLikeEntity.setType(type);
        //请求的参数
        Object[] args = joinPoint.getArgs();
        String id = JsonUtils.toJson(args[0]);
        // 根据注解类型增加数量
        switch (Objects.requireNonNull(ReadType.getReadType(type))) {
            case ARTICLE:
                logFeignClient.updateArticleLikeNum(Integer.parseInt(id));
                break;
            case BOOK:
                logFeignClient.updateBookLikeNum(Integer.parseInt(id));
                break;
            case BOOK_NOTE:
                logFeignClient.updateBookNoteLikeNum(Integer.parseInt(id));
                break;
            default:
                break;
        }
        logLikeEntity.setParams(id);
        //获取request
        HttpServletRequest request = HttpContextUtils.getHttpServletRequest();
        //设置IP地址
        logLikeEntity.setIp(IPUtils.getIpAddr(request));
        logLikeEntity.setTime(time);
        logLikeEntity.setCreateDate(LocalDateTime.now());
        logFeignClient.insertLogLike(logLikeEntity);
    }
}
