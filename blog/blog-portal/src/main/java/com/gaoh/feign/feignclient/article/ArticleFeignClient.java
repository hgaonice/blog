package com.gaoh.feign.feignclient.article;

import com.gaoh.feign.portal.article.ArticleFeign;
import org.springframework.cloud.openfeign.FeignClient;

/**
 * @Author: GH
 * @Date: 2020/5/5 15:36
 * @Version 1.0
 */
@FeignClient(name = "${feign-client.name}", path = "${feign-client.path}")
public interface ArticleFeignClient extends ArticleFeign {



}
