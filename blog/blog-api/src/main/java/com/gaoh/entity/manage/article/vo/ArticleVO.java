package com.gaoh.entity.manage.article.vo;

import com.gaoh.entity.manage.article.Article;
import com.gaoh.entity.manage.operation.Tag;
import lombok.Data;

import java.util.List;

/**
 * ArticleVo
 *
 * @author gaoh
 * @date 2020/01/09 16:51
 * @email 2199382542@qq.com
 * @description 文章列表VO
 */
@Data
public class ArticleVO extends Article {

    /**
     * 所属分类，以逗号分隔
     */
    private String categoryListStr;

    /**
     * 所属标签
     */
    private List<Tag> tagList;

}
