package com.gaoh.feign.portal.book;


import com.gaoh.common.Result;
import com.gaoh.common.util.PageUtils;
import com.gaoh.entity.manage.book.BookNote;
import io.swagger.annotations.ApiOperation;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * @Author: GH
 * @Date: 2020/5/5 16:09
 * @Version 1.0
 */
@RequestMapping("/feign/bookNote")
public interface BookNoteFeign {

    @GetMapping("/bookNote/{bookNoteId}")
    Result getBookNote(@PathVariable("bookNoteId") Integer bookNoteId);

    @GetMapping("bookNote/list")
    Result list(@RequestParam(value = "params" ,required = false)Map<String, Object> params);

    @PutMapping("/bookNote/like/{id}")
    Result likeBookNote(@PathVariable("id") Integer id);

}
