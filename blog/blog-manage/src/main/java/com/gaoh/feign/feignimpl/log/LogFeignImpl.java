package com.gaoh.feign.feignimpl.log;

import com.gaoh.entity.manage.log.LogLike;
import com.gaoh.entity.manage.log.LogView;
import com.gaoh.feign.portal.log.LogFeign;
import com.gaoh.modules.article.mapper.ArticleMapper;
import com.gaoh.modules.book.mapper.BookMapper;
import com.gaoh.modules.book.mapper.BookNoteMapper;
import com.gaoh.modules.log.mapper.LogLikeMapper;
import com.gaoh.modules.log.mapper.LogViewMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: GH
 * @Date: 2020/5/5 19:55
 * @Version 1.0
 */
@RestController
@Slf4j
public class LogFeignImpl implements LogFeign {
    /** like */
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

    @Override
    public void updateArticleLikeNum(int parseInt) {
        articleMapper.updateLikeNum(parseInt);
    }

    @Override
    public void updateBookLikeNum(int parseInt) {
        bookMapper.updateLikeNum(parseInt);
    }

    @Override
    public void updateBookNoteLikeNum(int parseInt) {
        bookNoteMapper.updateLikeNum(parseInt);
    }

    @Override
    public void insertLogLike(LogLike logLikeEntity) {
        logLikeMapper.insert(logLikeEntity);
    }

    /**  View  */

    @Override
    public void insertLogView(LogView logView) {
        logViewMapper.insert(logView);
    }

    @Override
    public void updateArticleReadNum(int parseInt) {
        articleMapper.updateReadNum(parseInt);
    }

    @Override
    public void updateBookReadNum(int parseInt) {
        bookMapper.updateReadNum(parseInt);
    }

    @Override
    public void updateBookNoteReadNum(int parseInt) {
        bookNoteMapper.updateReadNum(parseInt);
    }
}
