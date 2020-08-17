package org.gaoh.modules.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.gaoh.modules.entity.manage.log.LogView;

/**
 * <p>
 * 阅读日志 Mapper 接口
 * </p>
 *
 * @author gaoh
 * @since 2019-02-15
 */
@Mapper
public interface LogViewMapper extends BaseMapper<LogView> {

}
