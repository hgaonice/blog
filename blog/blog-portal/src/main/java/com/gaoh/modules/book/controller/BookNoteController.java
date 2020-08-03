package com.gaoh.modules.book.controller;

import com.gaoh.common.Result;
import com.gaoh.common.constants.RedisCacheNames;
import com.gaoh.common.util.PageUtils;
import com.gaoh.entity.manage.book.BookNote;
import com.gaoh.feign.feignclient.book.BookNoteFeignClient;
import com.gaoh.modules.common.annotation.LogLike;
import com.gaoh.modules.common.annotation.LogView;
import com.gaoh.modules.common.annotation.ReadType;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;


/**
 * BookNoteNoteAdminController
 *
 * @author gaoh
 * @date 2018/11/20 20:25
 * @email 2199382542@qq.com
 * @description
 */
@RestController("bookNotePortalController")
@CacheConfig(cacheNames = {RedisCacheNames.BOOKNOTE})
@Api(tags = "笔记")
public class BookNoteController {

    @Resource
    private BookNoteFeignClient bookNoteFeignClient;


    @GetMapping("/bookNote/{bookNoteId}")
    @ApiOperation("获取笔记信息,根据Id")
    @LogView(type = ReadType.BOOK_NOTE)
    public Result getBookNote(@PathVariable Integer bookNoteId){
        return bookNoteFeignClient.getBookNote(bookNoteId);
    }

    @GetMapping("bookNotes")
    @Cacheable
    public Result list(@RequestParam Map<String, Object> params){
        return bookNoteFeignClient.list(params);
    }

    @ApiOperation("根据Id")
    @PutMapping("/bookNote/like/{id}")
    @LogLike(type = ReadType.BOOK_NOTE)
    public Result likeBookNote(@PathVariable Integer id) {
        return bookNoteFeignClient.likeBookNote(id);
    }



}
