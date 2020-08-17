package org.gaoh.common.base.aspect;

import org.springframework.core.annotation.AliasFor;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import java.io.Serializable;
import java.lang.annotation.*;

/**
 * @Description: elasticsearch增删改操作切面 TODO 直接获取到对应的参数  如果参数操作过后存储在数据库中，会导致elasticSearch和数据库数据不一致
 * @Author: gaoh
 * @Date: 2020/7/8 16:11
 * @Version: 1.0
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@Documented
public @interface ChangeESData {
    /**
     * 操作类型
     *
     * @return
     */
    @AliasFor("operationType")
    OperationTypeEnum value() default OperationTypeEnum.DEFAULT;

    /**
     * operationType 和  value  二选一 operationType优先级会高于value
     *
     * @return
     */
    @AliasFor("value")
    OperationTypeEnum operationType() default OperationTypeEnum.DEFAULT;


    /**
     * repository 接口 操作对象
     *
     * @return
     */
    Class<? extends ElasticsearchRepository> repository() default ElasticsearchRepository.class;

    /**
     * elasticSearch实体对象
     *
     * @return
     */
    Class<? extends Serializable> objType();

}
