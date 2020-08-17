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
    @Resource
    private BaseFeignClient baseFeignClient;

    @ApiOperation("获取分享链接")
    @RequestMapping("/links")
    @Cacheable
    public Result listLink() {
        return baseFeignClient.linkList();
    }
}
