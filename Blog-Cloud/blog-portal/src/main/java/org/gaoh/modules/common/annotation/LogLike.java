package org.gaoh.modules.common.annotation;

import java.lang.annotation.*;

/**
 * ViewLog
 *
 * @author gaoh
 * @date 2020/02/15 14:51
 * @email 2199382542@qq.com
 * @description
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface LogLike {

     ReadType type() default ReadType.ARTICLE;
}
