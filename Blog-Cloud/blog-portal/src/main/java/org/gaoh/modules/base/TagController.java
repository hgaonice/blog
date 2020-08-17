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
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * TagController
 *
 * @author gaoh
 * @date 2020/02/22 16:34
 * @email 2199382542@qq.com
 * @description
 */
@RestController("tagPortalController")
@CacheConfig(cacheNames = RedisCacheNames.TAG)
@RequestMapping("/operation")
@Api(tags = "标签")
public class TagController {

    /* @Resource
     private TagService tagService;*/
    @Resource
    private BaseFeignClient baseFeignClient;

    @ApiOperation("获取标签信息")
    @GetMapping("/tags")
    @Cacheable
    public Result listTag() {
       /* List<TagVO> tagList = tagService.listTagVo();
        return Result.ok().put("tagList",tagList);*/
//        return tagFeignClient.listTag();
        return baseFeignClient.listTag();
    }

}
