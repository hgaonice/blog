package com.gaoh.entity.manage.article.dto;

import com.gaoh.entity.manage.article.Article;
import com.gaoh.entity.manage.operation.Tag;
import lombok.Data;

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
