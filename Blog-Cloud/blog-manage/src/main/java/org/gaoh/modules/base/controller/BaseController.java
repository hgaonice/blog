package org.gaoh.modules.base.controller;

import io.swagger.annotations.ApiOperation;
import org.gaoh.common.Result;
import org.gaoh.common.util.PageUtils;
import org.gaoh.modules.book.service.BookNoteService;
import org.gaoh.modules.book.service.BookService;
import org.gaoh.modules.entity.manage.book.dto.BookDTO;
import org.gaoh.modules.entity.manage.book.dto.BookNoteDTO;
import org.gaoh.modules.entity.manage.operation.Category;
import org.gaoh.modules.entity.manage.operation.Link;
import org.gaoh.modules.entity.manage.operation.vo.RecommendVO;
import org.gaoh.modules.entity.manage.operation.vo.TagVO;
import org.gaoh.modules.operation.service.CategoryService;
import org.gaoh.modules.operation.service.LinkService;
import org.gaoh.modules.operation.service.RecommendService;
import org.gaoh.modules.operation.service.TagService;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description:
 * @Author: gaoh
 * @Date: 2020/8/10 20:04
 * @Version: 1.0
 */
@RestController
@RequestMapping("/base")
public class BaseController {
    @Resource
    private BookService bookService;


    @ApiOperation("获取书籍")
    @GetMapping("/book/{bookId}")
    public Result getBook(@PathVariable Integer bookId) {
        BookDTO book = bookService.getBook(bookId + "");
        return Result.ok().put("book", book);
    }

    @GetMapping("/books")
    public Result booksList(@RequestParam Map<String, Object> params) {
        PageUtils page = bookService.queryPage(params);
        return Result.ok().put("page", page);
    }

    @PutMapping("/book/like/{id}")
    public Result likeBook(@PathVariable Integer id) {
        BookDTO book = bookService.getBook(id + "");
        return Result.ok().put("book", book);
    }

    //++++++++++++++++++++++++++++++bookNote++++++++++++++++++++++++++++++
    @Resource
    private BookNoteService bookNoteService;

    @GetMapping("/bookNote/{bookNoteId}")
    public Result getBookNote(@PathVariable Integer bookNoteId) {
        BookNoteDTO bookNote = bookNoteService.getBookNote(bookNoteId);
        return Result.ok().put("bookNote", bookNote);
    }

    @GetMapping("bookNotes")
    public Result bookNotesList(@RequestParam Map<String, Object> params) {
        params = params == null ? new LinkedHashMap<>() : params;
        PageUtils page = bookNoteService.queryPageCondition(params);
        return Result.ok().put("page", page);
    }

    @PutMapping("/bookNote/like/{id}")
    public Result likeBookNote(@PathVariable Integer id) {
        return Result.ok();
    }

    //=================================categories=================================
    @Resource
    private CategoryService categoryService;

    @GetMapping("/categories")
    public Result categoriesList(@RequestParam Map<String, Object> params) {
        params = params == null ? new LinkedHashMap<>() : params;
        List<Category> categoryList = categoryService.listCategory(params);
        return Result.ok().put("categoryList", categoryList);
    }

    //=================================link=================================
    @Resource
    private LinkService linkService;

    @GetMapping("/linkList")
    public Result linkList() {
        List<Link> linkList = linkService.listLink();
        return Result.ok().put("linkList", linkList);
    }

    //=================================recommend=================================
    @Resource
    private RecommendService recommendService;

    @GetMapping("/recommends")
    public Result listRecommend() {
        List<RecommendVO> recommendList = recommendService.listRecommendVo();
        return Result.ok().put("recommendList", recommendList);
    }

    @GetMapping("/hotReads")
    public Result listHotRead() {
        List<RecommendVO> hotReadList = recommendService.listHotRead();
        return Result.ok().put("hotReadList", hotReadList);
    }

    //=================================tags=================================
    @Resource
    private TagService tagService;

    @GetMapping("/tags")
    public Result listTag() {
        List<TagVO> tagList = tagService.listTagVo();
        return Result.ok().put("tagList", tagList);
    }
}
