package com.gaoh.feign.feignimpl.book;

import com.gaoh.common.Result;
import com.gaoh.common.util.PageUtils;
import com.gaoh.entity.manage.book.BookNote;
import com.gaoh.feign.portal.book.BookNoteFeign;
import com.gaoh.modules.book.service.BookNoteService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @Author: GH
 * @Date: 2020/5/5 16:13
 * @Version 1.0
 */
@RestController
@Slf4j
public class BookNoteFeignImpl implements BookNoteFeign {

    @Resource
    private BookNoteService bookNoteService;

    @Override
    public Result getBookNote(Integer bookNoteId) {
        BookNote bookNote = bookNoteService.getById(bookNoteId);
        return Result.ok().put("bookNote",bookNote);
    }

    @Override
    public Result list(Map<String, Object> params) {
        params = params == null ? new LinkedHashMap<>() : params;
        PageUtils page = bookNoteService.queryPageCondition(params);
        return Result.ok().put("page",page);
    }

    @Override
    public Result likeBookNote(Integer id) {
        return Result.ok();
    }
}
