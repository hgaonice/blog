package org.gaoh.common.base.aspect;

import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.gaoh.common.exception.MyException;
import org.gaoh.common.util.BaseUtils;
import org.gaoh.common.util.SpringContextUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Map;
import java.util.function.Consumer;

/**
 * @Description: elasticSearch增删改同步切面
 * @Author: gaoh
 * @Date: 2020/7/8 16:39
 * @Version: 1.0
 */
@Component
//@ConditionalOnBean(ElasticsearchClient.class)
@Aspect
@Slf4j
public class ChangeESAspect {

    /**
     * 切面
     */
    @Pointcut("@annotation(org.gaoh.common.base.aspect.ChangeESData)")
    public void pointCut() {
    }

    /**
     * 对ElasticSearch数据进行修改
     *
     * @param point
     * @return
     */
    @Around("pointCut()")
    public Object doAround(ProceedingJoinPoint point) {
        //获取到方法执行的参数
        Map<String, Object> nameAndValue = BaseUtils.getNameAndValue(point);

        //首先执行方法
        Object proceed;
        try {
            proceed = point.proceed();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
            throw new MyException(throwable.getMessage());
        }

        //如果不止一个参数的时候 结束
        if (nameAndValue.size() != 1) {
            return proceed;
        }

        //参入的参数
        Object params = null;
        for (Map.Entry<String, Object> stringObjectEntry : nameAndValue.entrySet()) {
            params = stringObjectEntry.getValue();
        }

        //切入的方法
        Method method = ((MethodSignature) point.getSignature()).getMethod();

        //获取注解信息
        ChangeESData annotation = method.getAnnotation(ChangeESData.class);

        //从spring容器中获取到对应的repository对象
        ElasticsearchRepository repository = SpringContextUtils.getApplicationContext().getBean(annotation.repository());

        //获取操作类型
        OperationTypeEnum operationTypeEnum = annotation.operationType() == OperationTypeEnum.DEFAULT ? annotation.value() : annotation.operationType();
        //目标对象（也就是ElasticSearch实体对象）
        Object tagObj = null;
        //当不是删除操作的时候
        if (operationTypeEnum != OperationTypeEnum.DELETE) {
            Class<?> aClass = annotation.objType();
            try {
                //如果是JSON对象，就将JSON对象转化为elasticSearch对象
                if (params instanceof JSONObject) {
                    tagObj = JSONObject.parseObject(JSONObject.toJSONString(params), aClass);
                } else {
                    tagObj = aClass.newInstance();
                    //将参数copy到elasticSearch对象中
                    BeanUtils.copyProperties(params, tagObj);
                }
            } catch (Exception e) {
                e.printStackTrace();
                throw new MyException(e.getMessage());
            }
        }
        try {
            switch (operationTypeEnum) {
                case INSERT:
                case UPDATE:
                    repository.save(tagObj);
                    break;
                case DELETE:
                    if (params instanceof String) {
                        String ids = (String) params;
                        Arrays.asList(ids.split(",")).forEach(new Consumer<String>() {
                            @Override
                            public void accept(String id) {
                                repository.deleteById(id);
                            }
                        });
                    }
                    break;
                case DEFAULT:
                    log.debug("待完善！");
                    break;
                default:
                    log.error("暂不存在该类型！");
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new MyException(e.getMessage());
        }
        return proceed;
    }
}
