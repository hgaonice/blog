package org.gaoh.modules.book.controller;

import org.gaoh.common.Result;
import org.gaoh.common.constants.RedisCacheNames;
import org.gaoh.common.enums.ModuleEnum;
import org.gaoh.common.util.PageUtils;
import org.gaoh.common.validator.ValidatorUtils;
import org.gaoh.modules.book.service.BookNoteService;
import org.gaoh.modules.entity.manage.book.BookNote;
import org.gaoh.modules.entity.manage.book.dto.BookNoteDTO;
import org.gaoh.modules.operation.service.RecommendService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;


/**
 * BookNoteAdminController
 *
 * @author gaoh
 * @date 2018/11/20 20:25
 * @email 2199382542@qq.com
 * @description
 */
@RestController
@RequestMapping("/admin/book/note")
@Api(tags = "笔记管理")
@CacheConfig(cacheNames ={RedisCacheNames.RECOMMEND,RedisCacheNames.TAG,RedisCacheNames.BOOK,RedisCacheNames.BOOKNOTE,RedisCacheNames.TIMELINE})
public class BookNoteController {

    @Resource
    private BookNoteService bookNoteService;

    @Resource
    private RecommendService recommendService;

    @ApiOperation("获取笔记列表")
    @GetMapping("/list")
    @RequiresPermissions("book:note:list")
    public Result listBookNote(@RequestParam Map<String, Object> params) {
        PageUtils page = bookNoteService.queryPage(params);
        return Result.ok().put("page",page);
    }

    @ApiOperation("获取笔记明细")
    @GetMapping("/info/{bookNoteId}")
    @RequiresPermissions("book:note:list")
    public Result info(@PathVariable Integer bookNoteId) {
        BookNoteDTO bookNote = bookNoteService.getBookNote(bookNoteId);
        return Result.ok().put("bookNote",bookNote);
    }

    @ApiOperation("保存笔记")
    @PostMapping("/save")
    @RequiresPermissions("book:note:save")
    @CacheEvict(allEntries = true)
    public Result saveBookNote(@RequestBody BookNoteDTO bookNote){
        ValidatorUtils.validateEntity(bookNote);
        bookNoteService.saveBookNote(bookNote);
        return Result.ok();
    }

    @PutMapping("/update")
    @ApiOperation("修改笔记")
    @RequiresPermissions("book:note:update")
    @CacheEvict(allEntries = true)
    public Result updateBookNote(@RequestBody BookNoteDTO bookNote){
        ValidatorUtils.validateEntity(bookNote);
        bookNoteService.updateBookNote(bookNote);
        return Result.ok();
    }

    @PutMapping("/update/status")
    @ApiOperation("修改笔记状态")
    @RequiresPermissions("book:note:update")
    @CacheEvict(allEntries = true)
    public Result updateStatus(@RequestBody BookNote bookNote) {
        bookNoteService.updateById(bookNote);
        return Result.ok();
    }


    @DeleteMapping("/delete")
    @ApiOperation("批量删除笔记")
    @RequiresPermissions("book:note:delete")
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(allEntries = true)
    public Result deleteBatch(@RequestBody Integer[] bookNoteIds){
        recommendService.deleteBatchByLinkId(bookNoteIds, ModuleEnum.BOOK_NOTE.getValue());
        bookNoteService.deleteBatch(bookNoteIds);
        return Result.ok();
    }

}
