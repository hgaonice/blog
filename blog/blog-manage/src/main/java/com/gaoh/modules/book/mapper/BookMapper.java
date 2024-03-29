package com.gaoh.modules.book.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gaoh.entity.manage.book.Book;
import com.gaoh.entity.manage.book.vo.BookVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 图书表 Mapper 接口
 * </p>
 *
 * @author gaoh
 * @since 2019-01-27
 */
@Mapper
public interface BookMapper extends BaseMapper<Book> {

    /**
     * 获取bookVo
     * @param page
     * @param params
     * @return
     */
    List<BookVO> listBookVo(Page<BookVO> page, @Param("params") Map<String, Object> params);

    /**
     * 根据条件查询分页
     * @param page
     * @param params
     * @return
     */
    List<BookVO> queryPageCondition(Page<BookVO> page, @Param("params") Map<String, Object> params);

    /**
     * 更新阅读记录
     * @param id
     */
    void updateReadNum(int id);

    /**
     * 更新点赞记录
     * @param parseInt
     */
    void updateLikeNum(int parseInt);

    /**
     * 判断类别下是否有图书
     * @param categoryId
     * @return
     */
    int checkByCategory(Integer categoryId);

    /**
     * 根据ID查询包含tag，bookNode子列表的Book实体
     * @param id
     * @return
     */
    BookVO selectByIdWithSubList(Integer id);

}
