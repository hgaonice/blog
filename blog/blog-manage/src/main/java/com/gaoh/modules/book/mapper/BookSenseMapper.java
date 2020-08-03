package com.gaoh.modules.book.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gaoh.entity.manage.book.BookSense;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 读后感 Mapper 接口
 * </p>
 *
 * @author gaoh
 * @since 2019-02-13
 */
@Mapper
public interface BookSenseMapper extends BaseMapper<BookSense> {

}
