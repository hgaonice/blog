package com.gaoh.feign.portal.operation;

import com.gaoh.common.Result;
import com.gaoh.entity.manage.operation.vo.RecommendVO;
import io.swagger.annotations.ApiOperation;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @Author: GH
 * @Date: 2020/5/5 18:02
 * @Version 1.0
 */
@RequestMapping("/feign/recommend")
public interface RecommendFeign {

    @RequestMapping("/recommends")
      Result listRecommend() ;

    @RequestMapping("/hotReads")
    Result listHotRead();
}
