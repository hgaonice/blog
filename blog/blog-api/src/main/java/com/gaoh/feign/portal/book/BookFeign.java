package com.gaoh.feign.portal.book;


import com.gaoh.common.Result;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * <p>
 * 文章 前端控制器
 * </p>
 *
 * @author gaoh
 * @since 2018-11-07
 */
@RequestMapping("/feign/book")
public interface BookFeign {

    @GetMapping("/book/{bookId}")
    Result getBook(@PathVariable("bookId") Integer bookId);

    @GetMapping("/books")
    Result list(@RequestParam(value = "params",required = false) Map<String, Object> params);

    @PutMapping("/book/like/{id}")
    Result likeBook(@PathVariable("id") Integer id);

}
