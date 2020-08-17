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
    private BaseFeignClient baseFeignClient;


    @GetMapping("/bookNote/{bookNoteId}")
    @ApiOperation("获取笔记信息,根据Id")
    @LogView(type = ReadType.BOOK_NOTE)
    public Result getBookNote(@PathVariable Integer bookNoteId) {
        return baseFeignClient.getBookNote(bookNoteId);
    }

    @GetMapping("bookNotes")
    @Cacheable
    public Result list(@RequestParam Map<String, Object> params) {
        return baseFeignClient.bookNoteslist(params);
    }

    @ApiOperation("根据Id")
    @PutMapping("/bookNote/like/{id}")
    @LogLike(type = ReadType.BOOK_NOTE)
    public Result likeBookNote(@PathVariable Integer id) {
        return baseFeignClient.likeBookNote(id);
    }


}
