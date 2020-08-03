package com.gaoh.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.gaoh.common.util.PageUtils;
import com.gaoh.entity.manage.sys.SysParam;

import java.util.Map;

/**
 * <p>
 * 系统参数 服务类
 * </p>
 *
 * @author gaoh
 * @since 2018-12-28
 */
public interface SysParamService extends IService<SysParam> {

    /**
     * 分页查询
     * @param params
     * @return
     */
     PageUtils queryPage(Map<String, Object> params);
}
