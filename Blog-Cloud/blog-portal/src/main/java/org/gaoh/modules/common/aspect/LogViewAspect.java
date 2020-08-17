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
import org.gaoh.modules.entity.manage.log.LogView;
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
 * @date 2020/02/15 14:56
 * @email 2199382542@qq.com
 * @description 点击文章等添加对应的阅读量
 */
@Aspect
@Component
@Slf4j
public class LogViewAspect {

    @Resource
    private LogFeignClient logFeignClient;

    @Pointcut("@annotation(org.gaoh.modules.common.annotation.LogView)")
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
        saveViewLog(point, time);

        return result;
    }

    private void saveViewLog(ProceedingJoinPoint joinPoint, long time) {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();
        LogView  viewLogEntity = new LogView();
        org.gaoh.modules.common.annotation. LogView viewLog = method.getAnnotation(org.gaoh.modules.common.annotation.LogView.class);
        //注解上的类型
        String type = viewLog.type().getDescription();
        viewLogEntity.setType(type);
        //请求的参数
        Object[] args = joinPoint.getArgs();
        String id = JsonUtils.toJson(args[0]);
        // 根据注解类型增加数量
        switch (Objects.requireNonNull(ReadType.getReadType(type))) {
            case ARTICLE:
                logFeignClient.updateArticleReadNum(Integer.parseInt(id));
                break;
            case BOOK:
                logFeignClient.updateBookReadNum(Integer.parseInt(id));
                break;
            case BOOK_NOTE:
                logFeignClient.updateBookNoteReadNum(Integer.parseInt(id));
                break;
            default:
                break;
        }
        viewLogEntity.setParams(id);
        // 请求的方法名
        String className = joinPoint.getTarget().getClass().getName();
        String methodName = signature.getName();
        viewLogEntity.setMethod(className + "." + methodName + "()");
        //获取request
        HttpServletRequest request = HttpContextUtils.getHttpServletRequest();
        //设置IP地址
        viewLogEntity.setIp(IPUtils.getIpAddr(request));
        viewLogEntity.setTime(time);
        viewLogEntity.setCreateDate(LocalDateTime.now());
        logFeignClient.insertLogView(viewLogEntity);

    }
}
