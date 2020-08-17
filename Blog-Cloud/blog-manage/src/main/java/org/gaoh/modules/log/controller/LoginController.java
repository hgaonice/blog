package org.gaoh.modules.log.controller;

import org.gaoh.modules.article.mapper.ArticleMapper;
import org.gaoh.modules.book.mapper.BookMapper;
import org.gaoh.modules.book.mapper.BookNoteMapper;
import org.gaoh.modules.entity.manage.log.LogLike;
import org.gaoh.modules.entity.manage.log.LogView;
import org.gaoh.modules.mapper.LogLikeMapper;
import org.gaoh.modules.mapper.LogViewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

/**
 * @Description:
 * @Author: gaoh
 * @Date: 2020/8/6 11:24
 * @Version: 1.0
 */
@RestController
@RequestMapping("/log")
public class LoginController {
    /**
     * like
     */
    @Autowired
    private LogViewMapper logViewMapper;

    @Autowired
    private LogLikeMapper logLikeMapper;

    @Autowired
    private ArticleMapper articleMapper;

    @Autowired
    private BookMapper bookMapper;

    @Autowired
    private BookNoteMapper bookNoteMapper;

    @PutMapping("/updateArticleLikeNum")
    public void updateArticleLikeNum(@RequestParam("parseInt") Integer parseInt) {
        articleMapper.updateLikeNum(parseInt);
    }

    @PutMapping("/updateBookLikeNum")
    public void updateBookLikeNum(@RequestParam("parseInt") Integer parseInt) {
        bookMapper.updateLikeNum(parseInt);
    }

    @PutMapping("/updateBookNoteLikeNum")
    public void updateBookNoteLikeNum(@RequestParam("parseInt") Integer parseInt) {
        bookNoteMapper.updateLikeNum(parseInt);
    }

    @PostMapping(value = "/insertLogLike", consumes = MediaType.APPLICATION_JSON_VALUE)
    public void insertLogLike(@RequestBody LogLike logLikeEntity) {
        logLikeMapper.insert(logLikeEntity);
    }

    /**
     * View
     */

    @PostMapping(value = "/insertLogView", consumes = MediaType.APPLICATION_JSON_VALUE)
    public void insertLogView(@RequestBody LogView logView) {
        logViewMapper.insert(logView);
    }

    @PutMapping("/updateArticleReadNum")
    public void updateArticleReadNum(@RequestParam("parseInt") Integer parseInt) {
        articleMapper.updateReadNum(parseInt);
    }

    @PutMapping("/updateBookReadNum")
    public void updateBookReadNum(@RequestParam("parseInt") Integer parseInt) {
        bookMapper.updateReadNum(parseInt);
    }

    @PutMapping("/updateBookNoteReadNum")
    public void updateBookNoteReadNum(@RequestParam("parseInt") Integer parseInt) {
        bookNoteMapper.updateReadNum(parseInt);
    }
}
