package org.gaoh.modules.util;

import org.apache.shiro.SecurityUtils;
import org.gaoh.modules.entity.manage.sys.SysUser;

/**
 * @Description:
 * @Author: gaoh
 * @Date: 2020/8/10 20:31
 * @Version: 1.0
 */
public class BlogUtils {

    public static SysUser getUser() {
        return (SysUser) SecurityUtils.getSubject().getPrincipal();
    }

    public static Integer getUserId() {
        return getUser().getUserId();
    }
}
