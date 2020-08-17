package org.gaoh.modules.article.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.gaoh.common.Result;
import org.gaoh.common.util.PageUtils;
import org.gaoh.modules.article.service.ArticleService;
import org.gaoh.modules.entity.manage.article.Article;
import org.gaoh.modules.entity.manage.article.vo.ArticleVO;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description:
 * @Author: gaoh
 * @Date: 2020/8/6 17:18
 * @Version: 1.0
 */
@RestController
public class ArticleFeignController {
    @Resource
    private ArticleService articleService;


    @GetMapping(value = "/article/{articleId}" )
    public Result getArticle(@PathVariable("articleId") Integer articleId) {
        ArticleVO article = articleService.getArticleVo(articleId);
        return Result.ok().put("article", article);
    }

    @PutMapping("/article/like/{id}")
    public Result likeArticle(@PathVariable("id") Integer id) {
        return Result.ok();
    }

    @GetMapping("/article/articles")
    Result list(@RequestParam(value = "params", required = false) Map<String, Object> params) {
        params = params == null ? new LinkedHashMap<>() : params;
        PageUtils page = articleService.queryPageCondition(params);
        return Result.ok().put("page", page);
    }

    @RequestMapping(value = "/article/getList", method = RequestMethod.GET, consumes = MediaType.APPLICATION_JSON_VALUE)
    public org.gaoh.common.vo.Result<List<Article>> getList() {
        List<Article> list = articleService.list(new QueryWrapper<Article>().lambda().eq(Article::getPublish, true));
        org.gaoh.common.vo.Result<List<Article>> result = new org.gaoh.common.vo.Result<>();
        result.setResult(list);
        return result;
    }
}
