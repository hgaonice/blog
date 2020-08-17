package org.gaoh.modules.book.controller;

import org.gaoh.common.Result;
import org.gaoh.common.constants.RedisCacheNames;
import org.gaoh.common.validator.ValidatorUtils;
import org.gaoh.modules.base.AbstractController;
import org.gaoh.modules.book.service.BookSenseService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.gaoh.modules.entity.manage.book.BookSense;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * <p>
 * 读后感 前端控制器
 * </p>
 *
 * @author gaoh
 * @since 2019-02-13
 */
@RestController
@CacheConfig(cacheNames ={RedisCacheNames.RECOMMEND,RedisCacheNames.TAG,RedisCacheNames.BOOK})
@RequestMapping("/admin/book/sense")
@Api(tags = "读后感管理")
public class BookSenseController extends AbstractController {

    @Resource
    private BookSenseService bookSenseService;

    @GetMapping("/{bookId}")
    @ApiOperation("根据书籍Id,获取读后感")
    @RequiresPermissions("book:info")
    public Result getReadSense(@PathVariable Integer bookId) {
        BookSense bookSense = bookSenseService.getBookSense(bookId);
        return Result.ok().put("bookSense",bookSense);
    }
    /**
     * 保存
     */
    @ApiOperation("保存读后感")
    @PostMapping("/save")
    @RequiresPermissions("book:save")
    @CacheEvict(allEntries = true)
    public Result save(@RequestBody BookSense bookSense) {
        ValidatorUtils.validateEntity(bookSense);
        bookSenseService.save(bookSense);

        return Result.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    @ApiOperation("修改读后感")
    @RequiresPermissions("book:update")
    @CacheEvict(allEntries = true)
    public Result update(@RequestBody BookSense bookSense) {
        ValidatorUtils.validateEntity(bookSense);
        bookSenseService.updateById(bookSense);
        return Result.ok();
    }
}
