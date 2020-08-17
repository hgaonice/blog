package org.gaoh.modules.timeline.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.gaoh.common.Result;
import org.gaoh.modules.entity.manage.timeline.Timeline;
import org.gaoh.modules.timeline.service.TimelineService;
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
