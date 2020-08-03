package com.gaoh.feign.feignimpl.operation;

import com.gaoh.common.Result;
import com.gaoh.entity.manage.operation.vo.RecommendVO;
import com.gaoh.feign.portal.operation.RecommendFeign;
import com.gaoh.modules.operation.service.RecommendService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: GH
 * @Date: 2020/5/5 18:04
 * @Version 1.0
 */
@RestController
@Slf4j
public class RecommendFeignImpl implements RecommendFeign {

    @Resource
    private RecommendService recommendService;

    @Override
    public Result listRecommend() {
        List<RecommendVO> recommendList = recommendService.listRecommendVo();
        return Result.ok().put("recommendList",recommendList);
    }

    @Override
    public Result listHotRead() {
        List<RecommendVO> hotReadList = recommendService.listHotRead();
        return Result.ok().put("hotReadList",hotReadList);
    }
}
