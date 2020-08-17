package org.gaoh.modules.base;

import org.apache.shiro.SecurityUtils;
import org.gaoh.common.constants.RedisKeyConstants;
import org.gaoh.common.util.RedisUtil;
import org.gaoh.common.util.SpringContextUtils;
import org.gaoh.modules.entity.manage.sys.SysUser;

/**
 * AbstractController
 *
 * @author gaoh
 * @date 2018/10/22 12:35
 * @email 2199382542@qq.com
 * @description
 */
public class AbstractController {

    protected SysUser getUser() {
//        RedisUtil redisUtil = SpringContextUtils.getApplicationContext().getBean(RedisUtil.class);
//        return (SysUser) redisUtil.get(RedisKeyConstants.MANAGE_SYS_USER_INFO);
        return (SysUser) SecurityUtils.getSubject().getPrincipal();
    }

    protected Integer getUserId() {
        return getUser().getUserId();
    }
}
