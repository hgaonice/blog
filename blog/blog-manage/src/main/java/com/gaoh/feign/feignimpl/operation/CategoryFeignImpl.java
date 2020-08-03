package com.gaoh.feign.feignimpl.operation;

import com.gaoh.common.Result;
import com.gaoh.entity.manage.operation.Category;
import com.gaoh.feign.portal.operation.CategoryFeign;
import com.gaoh.modules.operation.service.CategoryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: GH
 * @Date: 2020/5/5 17:57
 * @Version 1.0
 */
@RestController
@Slf4j
public class CategoryFeignImpl implements CategoryFeign {
    @Resource
    private CategoryService categoryService;

    @Override
    public Result listCategory(Map<String, Object> params) {
        params = params == null ? new LinkedHashMap<>() : params;
        List<Category> categoryList = categoryService.listCategory(params);
        return Result.ok().put("categoryList",categoryList);
    }
}
