package com.gaoh.modules.book.controller;

import com.gaoh.common.Result;
import com.gaoh.base.AbstractController;
import com.gaoh.common.constants.RedisCacheNames;
import com.gaoh.common.util.PageUtils;
import com.gaoh.common.validator.ValidatorUtils;
import com.gaoh.entity.manage.book.Book;
import com.gaoh.entity.manage.book.dto.BookDTO;
import com.gaoh.modules.book.service.BookService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 图书表 前端控制器
 * </p>
 *
 * @author gaoh
 * @since 2019-01-27
 */
@RestController
@RequestMapping("/admin/book")
@Api(tags = "书籍管理")
@CacheConfig(cacheNames ={RedisCacheNames.RECOMMEND,RedisCacheNames.TAG,RedisCacheNames.BOOK,RedisCacheNames.TIMELINE})
public class BookController extends AbstractController {
    @Resource
    private BookService bookService;

    /**
     * 列表
     */
    @GetMapping("/list")
    @ApiOperation("获取信息")
    @RequiresPermissions("book:list")
    public Result list(@RequestParam Map<String, Object> params) {
        PageUtils page = bookService.queryPage(params);

        return Result.ok().put("page", page);
    }

    /**
     * 列表
     */
    @GetMapping("/select")
    @ApiOperation("获取书籍列表")
    @RequiresPermissions("book:list")
    public Result select() {
        List<Book> bookList = bookService.list(null);
        return Result.ok().put("bookList", bookList);
    }


    /**
     * 信息
     */
    @GetMapping("/info/{id}")
    @ApiOperation("查询单条信息")
    @RequiresPermissions("book:info")
    public Result info(@PathVariable("id") String id) {
        BookDTO book = bookService.getBook(id);
        return Result.ok().put("book", book);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    @ApiOperation("保存书籍信息")
    @CacheEvict(allEntries = true)
    @RequiresPermissions("book:save")
    public Result save(@RequestBody BookDTO book) {
        ValidatorUtils.validateEntity(book);
        bookService.saveBook(book);

        return Result.ok();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    @ApiOperation("修改书籍信息")
    @CacheEvict(allEntries = true)
    @RequiresPermissions("book:update")
    public Result update(@RequestBody BookDTO book) {
        ValidatorUtils.validateEntity(book);
        bookService.updateBook(book);
        return Result.ok();
    }

    /**
     * 更新状态
     *
     * @param readBook
     * @return
     */
    @PutMapping("/update/status")
    @ApiOperation("更新书籍状态")
    @CacheEvict(allEntries = true)
    @RequiresPermissions("book:update")
    public Result updateStatus(@RequestBody Book readBook) {
        bookService.updateById(readBook);
        return Result.ok();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete")
    @ApiOperation("批量删除书籍信息")
    @CacheEvict(allEntries = true)
    @RequiresPermissions("book:delete")
    public Result delete(@RequestBody Integer[] ids) {
        bookService.deleteBatch(ids);

        return Result.ok();
    }


}
