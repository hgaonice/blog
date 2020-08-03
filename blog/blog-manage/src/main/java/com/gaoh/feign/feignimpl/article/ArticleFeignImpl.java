package com.gaoh.feign.feignimpl.article;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.gaoh.common.Result;
import com.gaoh.common.util.PageUtils;
import com.gaoh.entity.manage.article.Article;
import com.gaoh.entity.manage.article.vo.ArticleVO;
import com.gaoh.feign.portal.article.ArticleFeign;
import com.gaoh.modules.article.service.ArticleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: GH
 * @Date: 2020/5/5 15:22
 * @Version 1.0
 */
@RestController
@Slf4j
public class ArticleFeignImpl implements ArticleFeign {

    @Resource
    private ArticleService articleService;

    @Override
    public Result getArticle(Integer articleId) {
        ArticleVO article = articleService.getArticleVo(articleId);
        return Result.ok().put("article",article);
    }

    @Override
    public Result likeArticle(Integer id) {
        return Result.ok();
    }

    @Override
    public Result list(Map<String, Object> params) {
        params = params == null ? new LinkedHashMap<>() : params;
        PageUtils page = articleService.queryPageCondition(params);
        return Result.ok().put("page",page);
    }

    @Override
    public com.gaoh.common.vo.Result<List<Article>> getList() {
        List<Article> list = articleService.list(new QueryWrapper<Article>().lambda().eq(Article::getPublish, true));
        com.gaoh.common.vo.Result<List<Article>> result = new com.gaoh.common.vo.Result<>();
        result.setResult(list);
        return result;
    }
}
