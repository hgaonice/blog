package com.gaoh.feign.portal.log;

import com.gaoh.entity.manage.log.LogLike;
import com.gaoh.entity.manage.log.LogView;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;


/**
 * @Author: GH
 * @Date: 2020/5/5 19:49
 * @Version 1.0
 */
@RequestMapping("/feign/log")
public interface LogFeign {

    @PutMapping("/updateArticleLikeNum")
    void updateArticleLikeNum(@RequestParam("parseInt") int parseInt);

    @PutMapping("/updateBookLikeNum")
    void updateBookLikeNum(@RequestParam("parseInt")int parseInt);

    @PutMapping("/updateBookNoteLikeNum")
    void updateBookNoteLikeNum(@RequestParam("parseInt") int parseInt);

    @PostMapping(value = "/insertLogLike",consumes = MediaType.APPLICATION_JSON_VALUE)
    void insertLogLike(@RequestBody LogLike logLike);

    @PostMapping(value = "/insertLogView",consumes = MediaType.APPLICATION_JSON_VALUE)
    void insertLogView(@RequestBody LogView logView);

    @PutMapping("/updateArticleReadNum")
    void updateArticleReadNum(@RequestParam("parseInt")int parseInt);

    @PutMapping("/updateBookReadNum")
    void updateBookReadNum(@RequestParam("parseInt")int parseInt);

    @PutMapping("/updateBookNoteReadNum")
    void updateBookNoteReadNum(@RequestParam("parseInt")int parseInt);
}
