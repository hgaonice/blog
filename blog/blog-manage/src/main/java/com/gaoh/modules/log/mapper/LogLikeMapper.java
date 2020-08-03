package com.gaoh.modules.log.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gaoh.entity.manage.log.LogLike;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 阅读日志 Mapper 接口
 * </p>
 *
 * @author gaoh
 * @since 2019-02-15
 */
@Mapper
public interface LogLikeMapper extends BaseMapper<LogLike> {

    /**
     * 更新点赞记录
     * @param parseInt
     */
    void updateLikeNum(int parseInt);

}
