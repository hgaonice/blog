package com.gaoh.modules.operation.controller;

import com.gaoh.common.Result;
import com.gaoh.common.constants.RedisCacheNames;
import com.gaoh.entity.manage.operation.Category;
import com.gaoh.feign.feignclient.operation.CategoryFeignClient;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * CategoryController
 *
 * @author gaoh
 * @date 2020/02/19 15:28
 * @email 2199382542@qq.com
 * @description
 */
@RestController("categoryPortalController")
@CacheConfig(cacheNames = RedisCacheNames.CATEGORY)
@Api(tags = "类别")
@RequestMapping("/operation")
public class CategoryController {

    @Resource
    private CategoryFeignClient categoryFeignClient;

    /*@Resource
    private CategoryService categoryService;*/

    @GetMapping("/categories")
    @ApiOperation("分类")
    @Cacheable
    public Result listCategory(@RequestParam Map<String,Object> params) {
       /* List<Category> categoryList = categoryService.listCategory(params);
        return Result.ok().put("categoryList",categoryList);*/
        return categoryFeignClient.listCategory(params);
    }

}
