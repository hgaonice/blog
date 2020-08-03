package com.gaoh.modules.operation.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gaoh.entity.manage.operation.Category;
import com.gaoh.modules.operation.mapper.CategoryMapper;
import com.gaoh.modules.operation.service.CategoryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author gaoh
 * @since 2018-12-17
 */
@Service
@Slf4j
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {

    /**
     * 查询所有菜单
     *
     * @param params
     * @return
     */
    @Override
    public List<Category> queryWithParentName(Map<String, Object> params) {
        return baseMapper.queryAll(params);
    }

    /**
     * 根据父级别查询子级别
     *
     * @param id
     * @return
     */
    @Override
    public List<Category> queryListParentId(Integer id) {
        return baseMapper.selectList(new QueryWrapper<Category>().lambda()
                .eq(Category::getParentId,id));
    }

    /**
     * 根据类别Id数组查询类别数组
     * @param categoryIds
     * @param categoryList
     * @return
     */
    @Override
    public String renderCategoryArr(String categoryIds, List<Category> categoryList) {
        if (StringUtils.isEmpty(categoryIds)) {
            return "";
        }
        List<String> categoryStrList = new ArrayList<>();
        String[] categoryIdArr = categoryIds.split(",");
        for (int i = 0; i < categoryIdArr.length; i++) {
            Integer categoryId = Integer.parseInt(categoryIdArr[i]);
            // 根据Id查找类别名称
            String categoryStr = categoryList
                    .stream()
                    .filter(category -> category.getId().equals(categoryId))
                    .map(Category::getName)
                    .findAny().orElse("类别已被删除");
            categoryStrList.add(categoryStr);
        }
        return String.join(",",categoryStrList);

    }


    /**
     * 获取categoryList
     *
     * @param params
     * @return
     */
    @Override
    public List<Category> listCategory(Map<String, Object> params) {
        String type = (String) params.get("type");
        String rank = (String) params.get("rank");
        return baseMapper.selectList(new QueryWrapper<Category>().lambda()
                .eq(org.apache.commons.lang.StringUtils.isNotEmpty(type),Category::getType,type)
                .eq(org.apache.commons.lang.StringUtils.isNotEmpty(rank),Category::getRank,rank));
    }
}
