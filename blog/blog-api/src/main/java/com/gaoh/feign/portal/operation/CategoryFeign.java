package com.gaoh.feign.portal.operation;

import com.gaoh.common.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

/**
 * @Author: GH
 * @Date: 2020/5/5 17:55
 * @Version 1.0
 */
@RequestMapping("/feign/category")
public interface CategoryFeign {

    @GetMapping("/categories")
    Result listCategory(@RequestParam(value = "params",required = false) Map<String, Object> params);
}
