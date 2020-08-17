package org.gaoh.modules.client.article;

import org.gaoh.common.Result;
import org.gaoh.common.constants.ServiceNameConstants;
import org.gaoh.modules.entity.manage.article.Article;
import org.gaoh.modules.entity.manage.article.vo.ArticleVO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @Author: GH
 * @Date: 2020/5/5 15:36
 * @Version 1.0
 */
@Component
@FeignClient(contextId = "articleServiceClient", value = ServiceNameConstants.SYSTEM_MANAGE)
//@RequestMapping("/admin/article")
public interface ArticleFeignClient {

    @GetMapping(value = "/article/{articleId}")
    Result getArticle(@PathVariable("articleId") Integer articleId);

    @PutMapping(value = "/article/like/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
    Result likeArticle(@PathVariable("id") Integer id);

    @GetMapping(value = "/article/articles", consumes = MediaType.APPLICATION_JSON_VALUE)
    Result articlesList(@RequestParam(value = "params", required = false) Map<String, Object> params);


    @RequestMapping(value = "/article/getList", method = RequestMethod.GET, consumes = MediaType.APPLICATION_JSON_VALUE)
    org.gaoh.common.vo.Result<List<Article>> getList();


    @GetMapping("/test/test1/{val}")
    Result test1(@PathVariable("val") Integer val);

    //TODO   Caused by: org.springframework.web.client.RestClientException:
    // Could not extract response: no suitable HttpMessageConverter found for response type
    // [class org.gaoh.common.Result] and content type [application/octet-stream]
    @GetMapping(value = "/admin/article/info/{articleId}")
    Result getArticleInfo(@PathVariable("articleId") Integer articleId);

}
