package org.gaoh.modules.api;

import com.alibaba.fastjson.JSONObject;
import org.gaoh.common.constants.ServiceNameConstants;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;

/**
 * @Description: TODO
 * @author: scott
 * @date: 2020年05月21日 14:32
 */
@Component
@FeignClient(contextId = "sysBaseRemoteApi", value = ServiceNameConstants.SYSTEM_MANAGE)
public interface SysBaseRemoteApi {

/*    @GetMapping("/sys/user/info/{username}")
    Result<LoginUser> getUserByName(@PathVariable("username") String username);*/

}
