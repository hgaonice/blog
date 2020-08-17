package org.gaoh.modules.operation.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.gaoh.modules.entity.manage.operation.TagLink;

/**
 * <p>
 * 文章标签多对多维护表 Mapper 接口
 * </p>
 *
 * @author gaoh
 * @since 2019-01-07
 */
@Mapper
public interface TagLinkMapper extends BaseMapper<TagLink> {

}
