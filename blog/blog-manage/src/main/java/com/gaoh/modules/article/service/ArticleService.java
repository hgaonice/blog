package com.gaoh.modules.article.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.gaoh.common.util.PageUtils;
import com.gaoh.entity.manage.article.Article;
import com.gaoh.entity.manage.article.dto.ArticleDTO;
import com.gaoh.entity.manage.article.vo.ArticleVO;

import java.util.Map;

/**
 * ArticleService
 *
 * @author gaoh
 * @date 2018/11/21 12:47
 * @email 2199382542@qq.com
 * @description
 */
public interface ArticleService extends IService<Article> {

    /**
     * 分页查询博文列表
     * @param params
     * @return
     */
    PageUtils queryPage(Map<String, Object> params);

    /**
     * 保存博文文章
     * @param blogArticle
     */
    void saveArticle(ArticleDTO blogArticle);

    /**
     * 批量删除
     * @param articleIds
     */
    void deleteBatch(Integer[] articleIds);

    /**
     * 更新博文
     * @param blogArticle
     */
    void updateArticle(ArticleDTO blogArticle);

    /**
     * 获取文章对象
     * @param articleId
     * @return
     */
    ArticleDTO getArticle(Integer articleId);


    boolean checkByCategory(Integer id);


    /**
     * 分页分类获取列表
     * @param params
     * @return
     */
    PageUtils queryPageCondition(Map<String, Object> params);

    /**
     * 获取ArticleVo对象
     * @param articleId
     * @return
     */
    ArticleVO getArticleVo(Integer articleId);

    /**
     * 获取简单的Article对象
     * @param articleId
     * @return
     */
    ArticleVO getSimpleArticleVo(Integer articleId);
}
