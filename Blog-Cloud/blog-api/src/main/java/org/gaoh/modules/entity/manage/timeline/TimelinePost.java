package org.gaoh.modules.entity.manage.timeline;

import lombok.Data;

import java.util.Date;

/**
 * TimeLineData
 *
 * @author gaoh
 * @date 2020/02/24 20:39
 * @email 2199382542@qq.com
 * @description
 */
@Data
public class TimelinePost {

    private Integer id;

    private String title;

    private String description;

    private String postType;

    private Date createTime;

}
