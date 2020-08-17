package org.gaoh.modules.client.log;

import org.gaoh.common.constants.ServiceNameConstants;
import org.gaoh.modules.entity.manage.log.LogLike;
import org.gaoh.modules.entity.manage.log.LogView;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;


/**
 * @Author: GH
 * @Date: 2020/5/5 19:49
 * @Version 1.0
 */
@Component
@FeignClient(contextId = "logServiceClient", value = ServiceNameConstants.SYSTEM_MANAGE)
@RequestMapping("/log")
public interface LogFeignClient {

    @PutMapping("/updateArticleLikeNum")
    void updateArticleLikeNum(@RequestParam("parseInt") Integer parseInt);

    @PutMapping("/updateBookLikeNum")
    void updateBookLikeNum(@RequestParam("parseInt") Integer parseInt);

    @PutMapping("/updateBookNoteLikeNum")
    void updateBookNoteLikeNum(@RequestParam("parseInt") Integer parseInt);

    @PostMapping(value = "/insertLogLike", consumes = MediaType.APPLICATION_JSON_VALUE)
    void insertLogLike(@RequestBody LogLike logLike);

    @PostMapping(value = "/insertLogView", consumes = MediaType.APPLICATION_JSON_VALUE)
    void insertLogView(@RequestBody LogView logView);

    @PutMapping("/updateArticleReadNum")
    void updateArticleReadNum(@RequestParam("parseInt") Integer parseInt);

    @PutMapping("/updateBookReadNum")
    void updateBookReadNum(@RequestParam("parseInt") Integer parseInt);

    @PutMapping("/updateBookNoteReadNum")
    void updateBookNoteReadNum(@RequestParam("parseInt") Integer parseInt);

}
