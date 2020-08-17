package org.gaoh.modules.timeline.service;



import org.gaoh.modules.entity.manage.timeline.Timeline;

import java.util.List;

/**
 * TimeLineService
 *
 * @author gaoh
 * @date 2020/02/24 20:47
 * @email 2199382542@qq.com
 * @description
 */
public interface TimelineService {

    /**
     * 获取timeLine数据
     * @return
     */
    List<Timeline> listTimeLine();
}
