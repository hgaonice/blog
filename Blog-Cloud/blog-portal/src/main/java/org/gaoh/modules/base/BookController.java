package org.gaoh.modules.base;


import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.gaoh.common.Result;
import org.gaoh.common.constants.RedisCacheNames;
import org.gaoh.modules.client.base.BaseFeignClient;
import org.gaoh.modules.common.annotation.LogLike;
import org.gaoh.modules.common.annotation.LogView;
import org.gaoh.modules.common.annotation.ReadType;
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
    private BaseFeignClient baseFeignClient;

    @ApiOperation("获取书籍")
    @GetMapping("/book/{bookId}")
    @LogView(type = ReadType.BOOK)
    @CacheEvict(allEntries = true)
    public Result getBook(@PathVariable Integer bookId) {
        return baseFeignClient.getBook(bookId);
    }

    @GetMapping("/books")
    @Cacheable
    public Result list(@RequestParam Map<String, Object> params) {
        return baseFeignClient.bookList(params);
    }

    @PutMapping("/book/like/{id}")
    @LogLike(type = ReadType.BOOK)
    @CacheEvict(allEntries = true)
    public Result likeBook(@PathVariable Integer id) {
        return Result.ok();
    }


}
