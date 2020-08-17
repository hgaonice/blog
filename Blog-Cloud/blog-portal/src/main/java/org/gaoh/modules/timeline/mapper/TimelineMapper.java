package org.gaoh.modules.timeline.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.gaoh.modules.entity.manage.timeline.Timeline;
import org.gaoh.modules.entity.manage.timeline.TimelinePost;

import java.util.List;

/**
 * TimeLineMapper
 *
 * @author gaoh
 * @date 2020/02/24 20:53
 * @email 2199382542@qq.com
 * @description
 */
@Mapper
public interface TimelineMapper {

    List<TimelinePost> listTimelinePost(@Param("year") Integer year, @Param("month") Integer month);

    List<Timeline> listTimeline();
}
