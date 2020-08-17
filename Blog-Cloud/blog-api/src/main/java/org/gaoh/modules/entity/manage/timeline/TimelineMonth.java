package org.gaoh.modules.entity.manage.timeline;

import lombok.Data;

import java.util.List;

/**
 * TimeLineMonh
 *
 * @author gaoh
 * @date 2020/02/24 20:33
 * @email 2199382542@qq.com
 * @description
 */
@Data
public class TimelineMonth {

    private Integer month;

    private Integer count;

    private List<TimelinePost> posts;

}
