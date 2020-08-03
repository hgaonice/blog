package com.gaoh.modules.book.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.gaoh.common.enums.ModuleEnum;
import com.gaoh.common.util.PageUtils;
import com.gaoh.common.util.Query;
import com.gaoh.entity.manage.book.Book;
import com.gaoh.entity.manage.book.dto.BookDTO;
import com.gaoh.entity.manage.book.vo.BookVO;
import com.gaoh.entity.manage.operation.Category;
import com.gaoh.modules.book.mapper.BookMapper;
import com.gaoh.modules.book.service.BookService;
import com.gaoh.modules.operation.service.CategoryService;
import com.gaoh.modules.operation.service.TagService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 图书表 服务实现类
 * </p>
 *
 * @author gaoh
 * @since 2019-01-27
 */
@Service
@Slf4j
public class BookServiceImpl extends ServiceImpl<BookMapper, Book> implements BookService {

    @Autowired
    private TagService tagService;

    @Autowired
    private CategoryService categoryService;
    /**
     * 分页查询
     * @param params
     * @return
     */
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<BookVO> page=new Query<BookVO>(params).getPage();
        List<BookVO> bookList = this.baseMapper.listBookVo(page,params);
        // 查询所有分类
        List<Category> categoryList = categoryService.list(new QueryWrapper<Category>().lambda().eq(Category::getType, ModuleEnum.BOOK.getValue()));
        // 封装BookVo
        bookList.forEach(bookVo -> {
            // 设置类别
            bookVo.setCategoryListStr(categoryService.renderCategoryArr(bookVo.getCategoryId(),categoryList));
            // 设置标签列表
            bookVo.setTagList(tagService.listByLinkId(bookVo.getId(),ModuleEnum.BOOK.getValue()));
        });
        page.setRecords(bookList);
        return new PageUtils(page);
    }

    /**
     * 保存图书
     *
     * @param book
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveBook(BookDTO book) {
       this.baseMapper.insert(book);
       tagService.saveTagAndNew(book.getTagList(),book.getId(), ModuleEnum.BOOK.getValue());
    }

    /**
     * 获取图书对象
     *
     * @param id
     * @return
     */
    @Override
    public BookDTO getBook(String id) {
        Book readBook = this.baseMapper.selectById(id);
        BookDTO readBookDto = new BookDTO();
        BeanUtils.copyProperties(readBook,readBookDto);
        readBookDto.setTagList(tagService.listByLinkId(readBook.getId(),ModuleEnum.BOOK.getValue()));
        return readBookDto;
    }

    /**
     * 更新图书
     *
     * @param book
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateBook(BookDTO book) {
        // 删除多对多所属标签
        tagService.deleteTagLink(book.getId(),ModuleEnum.BOOK.getValue());
        // 更新所属标签
        tagService.saveTagAndNew(book.getTagList(),book.getId(), ModuleEnum.BOOK.getValue());
        // 更新图书
        baseMapper.updateById(book);
    }

    /**
     * 批量删除
     *
     * @param bookIds
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteBatch(Integer[] bookIds) {
        //先删除标签多对多关联
        Arrays.stream(bookIds).forEach(bookId -> {
            tagService.deleteTagLink(bookId,ModuleEnum.BOOK.getValue());
        });
        this.baseMapper.deleteBatchIds(Arrays.asList(bookIds));
    }

    /**
     * @param categoryId
     * @return
     */
    @Override
    public boolean checkByCategory(Integer categoryId) {
        return baseMapper.checkByCategory(categoryId) > 0;
    }



    //====================

    /**
     * 分页分类获取列表
     *
     * @param params
     * @return
     */
    @Override
    public PageUtils queryPageCondition(Map<String, Object> params) {
        Page<BookVO> page = new Query<BookVO>(params).getPage();
        List<BookVO> bookList = baseMapper.queryPageCondition(page, params);
        page.setRecords(bookList);
        return new PageUtils(page);
    }

    /**
     * 获取Book对象
     *
     * @param id
     * @return
     */
    @Override
    public BookVO getBookVo(Integer id) {
        return this.baseMapper.selectByIdWithSubList(id);
    }
}
