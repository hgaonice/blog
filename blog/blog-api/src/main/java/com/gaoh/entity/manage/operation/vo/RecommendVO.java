package com.gaoh.entity.manage.operation.vo;

import com.gaoh.entity.manage.operation.Recommend;
import com.gaoh.entity.manage.operation.Tag;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * RecommendVo
 *
 * @author gaoh
 * @date 2020/02/22 10:49
 * @email 2199382542@qq.com
 * @description
 */
@Data
public class RecommendVO extends Recommend {

    private String description;

    private Long readNum;

    private Long commentNum;

    private Long likeNum;

    private String urlType;

    private String cover;

    private Date createTime;

    private List<Tag> tagList;

}
