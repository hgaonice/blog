package org.gaoh.modules.article.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.gaoh.common.Result;
import org.gaoh.common.constants.RedisCacheNames;
import org.gaoh.common.enums.ModuleEnum;
import org.gaoh.common.mq.annotation.RefreshEsMqSender;
import org.gaoh.common.util.PageUtils;
import org.gaoh.common.validator.ValidatorUtils;
import org.gaoh.modules.article.service.ArticleService;
import org.gaoh.modules.entity.manage.article.Article;
import org.gaoh.modules.entity.manage.article.dto.ArticleDTO;
import org.gaoh.modules.entity.manage.article.vo.ArticleVO;
import org.gaoh.modules.operation.service.RecommendService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.MediaType;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;


/**
 * ArticleAdminController
 *
 * @author gaoh
 * @date 2018/11/20 20:25
 * @email 2199382542@qq.com
 * @description
 */
@RestController
@Api(tags = "文章管理")
@RequestMapping("/admin/article")
@CacheConfig(cacheNames = {RedisCacheNames.RECOMMEND, RedisCacheNames.TAG, RedisCacheNames.ARTICLE, RedisCacheNames.TIMELINE})
public class ArticleController {

    @Resource
    private ArticleService articleService;

    @Resource
    private RecommendService recommendService;

    @Resource
    private RedisTemplate<String, Object> redisTemplate;

    @ApiOperation("获取文章信息")
    @GetMapping("/list")
    @RequiresPermissions("article:list")
    public Result listArticle(@RequestParam Map<String, Object> params) {
        PageUtils page = articleService.queryPage(params);
        return Result.ok().put("page", page);
    }

    @ApiOperation("获取文章信息-根据Id")
    @GetMapping("/info/{articleId}")
    @RequiresPermissions("article:list")
    public Result info(@PathVariable Integer articleId) {
        ArticleDTO article = articleService.getArticle(articleId);
        return Result.ok().put("article", article);
    }

    @ApiOperation("保存文章")
    @PostMapping("/save")
    @RequiresPermissions("article:save")
    @CacheEvict(allEntries = true)
    @RefreshEsMqSender(sender = "blog-manage-saveArticle")
    public Result saveArticle(@RequestBody ArticleDTO article) {
        ValidatorUtils.validateEntity(article);
        articleService.saveArticle(article);
        return Result.ok();
    }

    @ApiOperation("修改文章信息")
    @PutMapping("/update")
    @RequiresPermissions("article:update")
    @CacheEvict(allEntries = true)
    @RefreshEsMqSender(sender = "blog-manage-updateArticle")
    public Result updateArticle(@RequestBody ArticleDTO article) {
        ValidatorUtils.validateEntity(article);
        articleService.updateArticle(article);
        return Result.ok();
    }

    @ApiOperation("修改文章状态")
    @PutMapping("/update/status")
    @RequiresPermissions("article:update")
    @CacheEvict(allEntries = true)
    @RefreshEsMqSender(sender = "blog-manage-updateStatus")
    public Result updateStatus(@RequestBody Article article) {
        articleService.updateById(article);
        return Result.ok();
    }


    @DeleteMapping("/delete")
    @ApiOperation("批量删除文章信息")
    @RequiresPermissions("article:delete")
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(allEntries = true)
    @RefreshEsMqSender(sender = "blog-manage-deleteArticle")
    public Result deleteBatch(@RequestBody Integer[] articleIds) {
        recommendService.deleteBatchByLinkId(articleIds, ModuleEnum.ARTICLE.getValue());
        articleService.deleteBatch(articleIds);
        return Result.ok();
    }

    @DeleteMapping("/cache/refresh")
    @ApiOperation("删除文章,并刷新")
    @RequiresPermissions("article:cache:refresh")
    public Result flush() {
        Set<String> keys = redisTemplate.keys(RedisCacheNames.PROFIX + "*");
        redisTemplate.delete(keys);
        return Result.ok();
    }

}
