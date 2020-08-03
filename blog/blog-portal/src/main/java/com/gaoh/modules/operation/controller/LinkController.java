package com.gaoh.modules.operation.controller;

import com.gaoh.common.Result;
import com.gaoh.common.constants.RedisCacheNames;
import com.gaoh.entity.manage.operation.Link;
import com.gaoh.feign.feignclient.operation.LinkFeignClient;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * LinkController
 *
 * @author gaoh
 * @date 2020/02/21 17:09
 * @email 2199382542@qq.com
 * @description
 */
@RequestMapping("/operation")
@CacheConfig(cacheNames = RedisCacheNames.LINK)
@RestController("LinkPortalController")
@Api(tags = "链接")
public class LinkController {

    /* @Resource
     private LinkService linkService;*/
    @Resource
    private LinkFeignClient linkFeignClient;

    @ApiOperation("获取分享链接")
    @RequestMapping("/links")
    @Cacheable
    public Result listLink() {
      /*  List<Link> linkList = linkService.listLink();
        return Result.ok().put("linkList",linkList);*/
        return linkFeignClient.listLink();
    }
}
