package com.gaoh.base;

import com.gaoh.entity.manage.sys.SysUser;
import org.apache.shiro.SecurityUtils;

/**
 * AbstractController
 *
 * @author gaoh
 * @date 2018/10/22 12:35
 * @email 2199382542@qq.com
 * @description
 */
public class AbstractController {

    protected SysUser getUser(){
        return (SysUser) SecurityUtils.getSubject().getPrincipal();
    }

    protected Integer getUserId(){
        return getUser().getUserId();
    }
}
