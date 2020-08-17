package org.gaoh.modules.client.base;

import io.swagger.annotations.ApiOperation;
import org.gaoh.common.Result;
import org.gaoh.common.constants.ServiceNameConstants;
import org.gaoh.modules.common.annotation.LogLike;
import org.gaoh.modules.common.annotation.LogView;
import org.gaoh.modules.common.annotation.ReadType;
import org.gaoh.modules.entity.manage.operation.vo.RecommendVO;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @Description:
 * @Author: gaoh
 * @Date: 2020/8/10 20:08
 * @Version: 1.0
 */
@Component
@FeignClient(contextId = "baseServiceClient", value = ServiceNameConstants.SYSTEM_MANAGE)
@RequestMapping("/base")
public interface BaseFeignClient {

    //++++++++++++++++++++++++++++++book++++++++++++++++++++++++++++++
    @GetMapping("/book/{bookId}")
    Result getBook(@PathVariable Integer bookId);

    @GetMapping("/books")
    Result bookList(@RequestParam Map<String, Object> params);

    @PutMapping("/book/like/{id}")
    Result likeBook(@PathVariable Integer id);


    //++++++++++++++++++++++++++++++bookNote++++++++++++++++++++++++++++++
    @GetMapping("/bookNote/{bookNoteId}")
    Result getBookNote(@PathVariable Integer bookNoteId);

    @GetMapping("bookNotes")
    Result bookNoteslist(@RequestParam Map<String, Object> params);

    @PutMapping("/bookNote/like/{id}")
    Result likeBookNote(@PathVariable Integer id);


    //+++++++++++++++++++++++++++categories+++++++++++++++++++++++++++
    @GetMapping("/categories")
    Result categoriesList(@RequestParam Map<String, Object> params);

    //+++++++++++++++++++++++++++link+++++++++++++++++++++++++++

    @GetMapping("/linkList")
    Result linkList();


    //+++++++++++++++++++++++++++recommend+++++++++++++++++++++++++++

    @GetMapping("/recommends")
    Result listRecommend();

    @GetMapping("/hotReads")
    Result listHotRead();


    //+++++++++++++++++++++++++++tags+++++++++++++++++++++++++++

    @GetMapping("/tags")
      Result listTag();
}
