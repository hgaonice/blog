package com.gaoh.feign.portal.operation;

import com.gaoh.common.Result;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * LinkController
 *
 * @author gaoh
 * @date 2020/02/21 17:09
 * @email 2199382542@qq.com
 * @description
 */
@RequestMapping("/feign/operation")
public interface LinkFeign {

    @RequestMapping("/links")
    Result listLink();
}
