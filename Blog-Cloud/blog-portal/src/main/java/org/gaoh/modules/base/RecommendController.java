package org.gaoh.modules.base;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.gaoh.common.Result;
import org.gaoh.common.constants.RedisCacheNames;
import org.gaoh.modules.client.base.BaseFeignClient;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * Recommend
 *
 * @author gaoh
 * @date 2020/02/22 13:40
 * @email 2199382542@qq.com
 * @description
 */
@RestController("recommendPortalController")
@CacheConfig(cacheNames = RedisCacheNames.RECOMMEND)
@RequestMapping("/operation")
@Api(tags = "推荐")
public class RecommendController {

    @Resource
    private BaseFeignClient baseFeignClient;


    @RequestMapping("/recommends")
    @ApiOperation("获取推荐数据")
    @Cacheable(key = "'RECOMMEND'")
    public Result listRecommend() {
       /* List<RecommendVO> recommendList = recommendService.listRecommendVo();
        return Result.ok().put("recommendList",recommendList);*/
//        return recommendFeignClient.listRecommend();
        return baseFeignClient.listRecommend();
    }

    @ApiOperation("热度")
    @RequestMapping("/hotReads")
    @Cacheable(key = "'HOTREAD'")
    public Result listHotRead () {
       /* List<RecommendVO> hotReadList = recommendService.listHotRead();
        return Result.ok().put("hotReadList",hotReadList);*/
//        return recommendFeignClient.listHotRead();
        return baseFeignClient.listHotRead();
    }
}
