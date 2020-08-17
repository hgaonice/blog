package org.gaoh.modules.operation.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.gaoh.modules.entity.manage.operation.Category;

import java.util.List;
import java.util.Map;


/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author gaoh
 * @since 2018-12-17
 */
@Mapper
public interface CategoryMapper extends BaseMapper<Category> {

    /**
     * 查询所有类别
     * @param params
     * @return
     */
    List<Category> queryAll(Map<String, Object> params);
}
