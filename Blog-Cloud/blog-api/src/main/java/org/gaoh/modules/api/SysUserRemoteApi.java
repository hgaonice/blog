package org.gaoh.modules.api;

import org.gaoh.common.Result;
import org.gaoh.common.constants.ServiceNameConstants;
import org.gaoh.modules.api.factory.SysUserRemoteApiFallbackFactory;
import org.gaoh.modules.api.fallback.SysUserRemoteApiFallbackImpl;
import org.gaoh.modules.entity.manage.sys.SysMenu;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Component
@FeignClient(contextId = "sysUserRemoteApi", value = ServiceNameConstants.SYSTEM_MANAGE, fallback = SysUserRemoteApiFallbackImpl.class, fallbackFactory = SysUserRemoteApiFallbackFactory.class)
public interface SysUserRemoteApi {

    @GetMapping("/admin/sys/user/info/{userId}")
    Result selectById(@PathVariable("userId") Integer userId);

    @GetMapping("/admin/sys/user/list")
    List<SysMenu> selectList();

    @GetMapping("/admin/sys/user/queryAllPerms")
    List<String> queryAllPerms(Integer userId);


    @GetMapping("/test/test")
    org.gaoh.common.vo.Result test();

    @GetMapping("/test/test1/{val}")
    Result test1(@PathVariable("val") Integer val);
}
