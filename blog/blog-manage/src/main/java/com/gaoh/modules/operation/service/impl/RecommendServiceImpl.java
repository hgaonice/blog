package com.gaoh.modules.operation.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gaoh.common.enums.ModuleEnum;
import com.gaoh.common.util.PageUtils;
import com.gaoh.common.util.Query;
import com.gaoh.entity.manage.article.vo.ArticleVO;
import com.gaoh.entity.manage.book.vo.BookNoteVO;
import com.gaoh.entity.manage.operation.Recommend;
import com.gaoh.entity.manage.operation.vo.RecommendVO;
import com.gaoh.modules.article.service.ArticleService;
import com.gaoh.modules.book.service.BookNoteService;
import com.gaoh.modules.operation.mapper.RecommendMapper;
import com.gaoh.modules.operation.service.RecommendService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 推荐 服务实现类
 * </p>
 *
 * @author gaoh
 * @since 2019-02-22
 */
@Service
@Slf4j
public class RecommendServiceImpl extends ServiceImpl<RecommendMapper, Recommend> implements RecommendService {
    @Resource
    private ArticleService articleService;

    @Resource
    private BookNoteService bookNoteService;

    /**
     * 分页查询
     *
     * @param params
     * @return
     */
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String title = (String) params.get("title");
        IPage<Recommend> page = baseMapper.selectPage(new Query<Recommend>(params).getPage(),
                new QueryWrapper<Recommend>().lambda()
                        .like(StringUtils.isNotEmpty(title), Recommend::getTitle, title));
        return new PageUtils(page);
    }

    /**
     * 获取推荐列表
     *
     * @return
     */
    @Override
    public List<RecommendVO> listSelect() {
        return baseMapper.listSelect();
    }

    /**
     * 更新置顶状态
     *
     * @param id
     */
    @Override
    public void updateTop(Integer id) {
        // 更新本条
        Recommend recommend = new Recommend();
        recommend.setTop(true);
        recommend.setId(id);
        this.baseMapper.updateById(recommend);
        //批量更新其他
        recommend.setTop(false);
        recommend.setId(null);
        this.baseMapper.update(recommend, new QueryWrapper<Recommend>().lambda()
                .ne(Recommend::getId, id));
    }

    /**
     * 批量删除
     *
     * @param linkIds
     * @param type
     */
    @Override
    public void deleteBatchByLinkId(Integer[] linkIds, int type) {
        for (int i = 0; i < linkIds.length; i++) {
            int linkId = linkIds[i];
            baseMapper.delete(new QueryWrapper<Recommend>().lambda()
                    .eq(Recommend::getLinkId, linkId)
                    .eq(Recommend::getType, type));
        }
    }

    //=====================

    @Override
    public List<RecommendVO> listRecommendVo() {
        List<RecommendVO> recommendList = this.baseMapper.listRecommendVo();
        return genRecommendList(recommendList);
    }

    @Override
    public List<RecommendVO> listHotRead() {
        List<RecommendVO> hotReadList = this.baseMapper.listHotRead();
        genRecommendList(hotReadList);
        hotReadList.get(0).setTop(true);
        return hotReadList;
    }

    private List<RecommendVO> genRecommendList(List<RecommendVO> recommendList) {
        recommendList.forEach(recommendVo -> {
            if (ModuleEnum.ARTICLE.getValue() == recommendVo.getType()) {
                ArticleVO simpleArticleVo = articleService.getSimpleArticleVo(recommendVo.getLinkId());
                BeanUtils.copyProperties(simpleArticleVo, recommendVo);
                recommendVo.setUrlType("article");
            } else if (ModuleEnum.BOOK_NOTE.getValue() == recommendVo.getType()) {
                BookNoteVO simpleBookNoteVo = bookNoteService.getSimpleBookNoteVo(recommendVo.getLinkId());
                recommendVo.setUrlType("bookNote");
                BeanUtils.copyProperties(simpleBookNoteVo, recommendVo);
            }
        });
        return recommendList;
    }

}
