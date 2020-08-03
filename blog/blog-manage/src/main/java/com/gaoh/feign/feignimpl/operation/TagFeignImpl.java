package com.gaoh.feign.feignimpl.operation;

import com.gaoh.common.Result;
import com.gaoh.entity.manage.operation.vo.TagVO;
import com.gaoh.feign.portal.operation.TagFeign;
import com.gaoh.modules.operation.service.TagService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: GH
 * @Date: 2020/5/5 18:10
 * @Version 1.0
 */
@RestController
@Slf4j
public class TagFeignImpl implements TagFeign {

    @Resource
    private TagService tagService;

    @Override
    public Result listTag() {
        List<TagVO> tagList = tagService.listTagVo();
        return Result.ok().put("tagList",tagList);
    }
}
