package com.gaoh.modules.timeline.controller;

import com.gaoh.common.Result;
import com.gaoh.entity.manage.timeline.Timeline;
import com.gaoh.modules.timeline.service.TimelineService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * TimeLineController
 *
 * @author gaoh
 * @date 2020/02/24 20:46
 * @email 2199382542@qq.com
 * @description
 */
@RestController
@RequestMapping("/timeline")
@Api(tags = "时间轴")
public class TimelineController {

    @Resource
    private TimelineService timelineService;

    @ApiOperation("获取时间轴")
    @GetMapping("")
    public Result listTimeline() {
        List<Timeline> timelineList = timelineService.listTimeLine();

        return Result.ok().put("timelineList",timelineList);
    }
}
