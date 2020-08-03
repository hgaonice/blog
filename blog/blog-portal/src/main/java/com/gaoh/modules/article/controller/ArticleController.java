package com.gaoh.modules.article.controller;


import com.gaoh.common.Result;
import com.gaoh.common.constants.RedisCacheNames;
import com.gaoh.feign.feignclient.article.ArticleFeignClient;
import com.gaoh.modules.common.annotation.LogLike;
import com.gaoh.modules.common.annotation.LogView;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;

/**
 * <p>
 * 文章 前端控制器
 * </p>
 *
 * @author gaoh
 * @since 2018-11-07
 */
@RestController("articlePortalController")
@Api(tags = "文章-前端控制器")
@CacheConfig(cacheNames = {RedisCacheNames.ARTICLE})
public class ArticleController {

    @Resource
    private ArticleFeignClient articleFeignClient;


    @ApiOperation("获取文章")
    @GetMapping("/article/{articleId}")
    @LogView
    @CacheEvict(allEntries = true)
    public Result getArticle(@PathVariable Integer articleId){
        return articleFeignClient.getArticle(articleId);
    }

    @ApiOperation("新增点赞量")
    @PutMapping("/article/like/{id}")
    @CacheEvict(allEntries = true)
    @LogLike
    public Result likeArticle(@PathVariable Integer id) {
        return articleFeignClient.likeArticle(id);
    }

    @GetMapping("/articles")
    @Cacheable
    public Result list(@RequestParam Map<String, Object> params){
        return articleFeignClient.list(params);
    }


}
