package org.gaoh.common.mq.annotation;

import java.lang.annotation.*;

/**
 * RefreshEsMqSender
 *
 * @author gaoh
 * @date 2020/03/16 22:52
 * @email 2199382542@qq.com
 * @description
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface RefreshEsMqSender {
    String sender();

    String msg() default "send refresh msg to ElasticSearch";

}
