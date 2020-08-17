package org.gaoh.modules.oss.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.gaoh.modules.entity.manage.oss.OssResource;

/**
 * <p>
 * 云存储资源表 Mapper 接口
 * </p>
 *
 * @author gaoh
 * @since 2018-11-30
 */
@Mapper
public interface OssResourceMapper extends BaseMapper<OssResource> {

}
