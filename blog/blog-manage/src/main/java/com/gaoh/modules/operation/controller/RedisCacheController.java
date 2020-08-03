package com.gaoh.modules.operation.controller;

import io.swagger.annotations.Api;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * BookNoteAdminController
 *
 * @author gaoh
 * @date 2020/11/12 20:25
 * @email 2199382542@qq.com
 * @description
 */
@RestController
@RequestMapping("/admin/operation/redis")
@Api(tags = "redis")
public class RedisCacheController {

    @Resource
    private RedisTemplate<String,Object> redisTemplate;


}
