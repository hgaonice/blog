package org.gaoh.modules.base;


import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.gaoh.common.Result;
import org.gaoh.common.constants.RedisCacheNames;
import org.gaoh.modules.api.SysUserRemoteApi;
import org.gaoh.modules.client.article.ArticleFeignClient;
import org.gaoh.modules.common.annotation.LogLike;
import org.gaoh.modules.common.annotation.LogView;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.MediaType;
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
@RestController
@Api(tags = "文章-前端控制器")
@CacheConfig(cacheNames = {RedisCacheNames.ARTICLE})
public class ArticleController {

    @Resource
    private ArticleFeignClient articleFeignClient;

    @Resource
    private SysUserRemoteApi sysUserRemoteApi;


    @ApiOperation("获取文章")
    @GetMapping(value = "/article/{articleId}")
    @LogView
    @CacheEvict(allEntries = true)
    public Result getArticle(@PathVariable("articleId") Integer articleId) {
        return articleFeignClient.getArticle(articleId);
    }

    @ApiOperation("获取文章-getArticleInfo-error")
    @GetMapping(value = "/getArticleInfo/{articleId}")
    @LogView
    @CacheEvict(allEntries = true)
    public Result getArticleInfo(@PathVariable("articleId") Integer articleId) {
        return articleFeignClient.getArticleInfo(articleId);
    }

    @ApiOperation("新增点赞量")
    @PutMapping("/article/like/{id}")
    @CacheEvict(allEntries = true)
    @LogLike
    public Result likeArticle(@PathVariable("id") Integer id) {
        return articleFeignClient.likeArticle(id);
    }

    @GetMapping("/articles")
    @Cacheable
    public Result list(@RequestParam Map<String, Object> params) {
        return articleFeignClient.articlesList(params);
    }


}
