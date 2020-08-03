package com.gaoh.feign.feignimpl.book;

import com.gaoh.common.Result;
import com.gaoh.common.util.PageUtils;
import com.gaoh.entity.manage.book.vo.BookVO;
import com.gaoh.feign.portal.book.BookFeign;
import com.gaoh.modules.book.service.BookService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @Author: GH
 * @Date: 2020/5/5 16:00
 * @Version 1.0
 */
@RestController
@Slf4j
public class BookFeignImpl implements BookFeign {
    @Resource
    private BookService bookService;

    @Override
    public Result getBook(Integer bookId) {
        BookVO book = bookService.getBookVo(bookId);
        return Result.ok().put("book",book);
    }

    @Override
    public Result list(Map<String, Object> params) {
        params = params == null ? new LinkedHashMap<>() : params;
        PageUtils page = bookService.queryPageCondition(params);
        return Result.ok().put("page",page);
    }

    @Override
    public Result likeBook(Integer id) {
        return Result.ok();
    }
}
