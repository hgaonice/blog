package com.gaoh.feign.portal.article;


import com.gaoh.common.Result;
import com.gaoh.entity.manage.article.Article;
import io.swagger.annotations.ApiOperation;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 文章 前端控制器
 * </p>
 *
 * @author gaoh
 * @since 2018-11-07
 */
@RequestMapping("/feign/article")
public interface ArticleFeign {
    @GetMapping("/article/{articleId}")
    Result getArticle(@PathVariable("articleId") Integer articleId);

    @PutMapping("/article/like/{id}")
    Result likeArticle(@PathVariable("id") Integer id);

    @GetMapping("/articles")
    Result list(@RequestParam(value = "params", required = false) Map<String, Object> params);


    @RequestMapping(value = "/getList", method = RequestMethod.GET, consumes = MediaType.APPLICATION_JSON_VALUE)
    com.gaoh.common.vo.Result<List<Article>> getList();

    /*
    *
    * @RequestMapping(value = "/uploadImage", method = RequestMethod.POST, produces = {
	*MediaType.APPLICATION_JSON_UTF8_VALUE }, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	*public String uploadImageAndCrtThumbImage(@RequestPart MultipartFile multipartFile);
    *
    *
    * */
}
