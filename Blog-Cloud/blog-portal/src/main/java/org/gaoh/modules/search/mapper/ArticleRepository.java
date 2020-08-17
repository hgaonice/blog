package org.gaoh.modules.search.mapper;

import org.gaoh.modules.entity.manage.article.Article;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Component;

/**
 * ArticleRepository
 *
 * @author gaoh
 * @date 2020/03/13 15:00
 * @email 2199382542@qq.com
 * @description
 */
@Component
public interface ArticleRepository extends ElasticsearchRepository<Article,Integer> {
}
