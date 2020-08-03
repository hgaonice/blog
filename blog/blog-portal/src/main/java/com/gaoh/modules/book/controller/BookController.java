package com.gaoh.modules.book.controller;


import com.gaoh.common.Result;
import com.gaoh.common.constants.RedisCacheNames;
import com.gaoh.common.util.PageUtils;
import com.gaoh.entity.manage.book.vo.BookVO;
import com.gaoh.feign.feignclient.book.BookFeignClient;
import com.gaoh.modules.common.annotation.LogLike;
import com.gaoh.modules.common.annotation.LogView;
import com.gaoh.modules.common.annotation.ReadType;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;

/**
 * <p>
 * 文章 前端控制器
 * </p>
 *
 * @author gaoh
 * @since 2018-11-07
 */
@RestController("bookPortalController")
@Api(tags = "书籍")
@CacheConfig(cacheNames = {RedisCacheNames.BOOK})
public class BookController {

    @Resource
    private BookFeignClient bookFeignClient;

    @ApiOperation("获取书籍")
    @GetMapping("/book/{bookId}")
    @LogView(type = ReadType.BOOK)
    @CacheEvict(allEntries = true)
    public Result getBook(@PathVariable Integer bookId){
        return bookFeignClient.getBook(bookId);
    }

    @GetMapping("/books")
    @Cacheable
    public Result list(@RequestParam Map<String, Object> params){
        return bookFeignClient.list(params);
    }

    @PutMapping("/book/like/{id}")
    @LogLike(type = ReadType.BOOK)
    @CacheEvict(allEntries = true)
    public Result likeBook(@PathVariable Integer id) {
        return bookFeignClient.likeBook(id);
    }


}
