package org.gaoh.modules.entity.manage.timeline;

import lombok.Data;

import java.util.List;

/**
 * TimeLine
 *
 * @author gaoh
 * @date 2020/02/24 20:33
 * @email 2199382542@qq.com
 * @description
 */
@Data
public class Timeline {

    private Integer year;

    private Integer count;

    private List<TimelineMonth> months;
}
