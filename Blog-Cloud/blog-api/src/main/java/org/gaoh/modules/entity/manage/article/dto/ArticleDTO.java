package org.gaoh.modules.entity.manage.article.dto;

import lombok.Data;
import org.gaoh.modules.entity.manage.article.Article;
import org.gaoh.modules.entity.manage.operation.Tag;

import java.util.List;

/**
 * ArticleDto
 *
 * @author gaoh
 * @date 2020/01/08 19:04
 * @email 2199382542@qq.com
 * @description
 */
@Data
public class ArticleDTO extends Article {

    private List<Tag> tagList;

}
