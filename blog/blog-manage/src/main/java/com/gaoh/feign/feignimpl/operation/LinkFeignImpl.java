package com.gaoh.feign.feignimpl.operation;

import com.gaoh.common.Result;
import com.gaoh.entity.manage.operation.Link;
import com.gaoh.feign.portal.operation.LinkFeign;
import com.gaoh.modules.operation.service.LinkService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: GH
 * @Date: 2020/5/5 18:00
 * @Version 1.0
 */
@RestController
@Slf4j
public class LinkFeignImpl implements LinkFeign {

    @Resource
    private LinkService linkService;

    @Override
    public Result listLink() {
        List<Link> linkList = linkService.listLink();
        return Result.ok().put("linkList",linkList);
    }
}
