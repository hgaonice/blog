package org.gaoh.modules.book.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.gaoh.modules.entity.manage.book.BookSense;

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
