package org.gaoh.modules.base;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.gaoh.common.Result;
import org.gaoh.common.constants.RedisCacheNames;
import org.gaoh.modules.client.base.BaseFeignClient;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
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
    private BaseFeignClient baseFeignClient;

    @GetMapping("/categories")
    @ApiOperation("分类")
    @Cacheable
    public Result listCategory(@RequestParam Map<String, Object> params) {
        return baseFeignClient.categoriesList(params);
    }

}
