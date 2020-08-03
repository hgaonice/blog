package com.gaoh.feign.portal.operation;

import com.gaoh.common.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * TagController
 *
 * @author gaoh
 * @date 2020/02/22 16:34
 * @email 2199382542@qq.com
 * @description
 */
@RequestMapping("/feign/operation")
public interface TagFeign {


    @GetMapping("/tags")
    Result listTag();

}
