package com.gaoh.feign.feignclient.log;

import com.gaoh.feign.portal.log.LogFeign;
import org.springframework.cloud.openfeign.FeignClient;


/**
 * @Author: GH
 * @Date: 2020/5/5 19:49
 * @Version 1.0
 */
@FeignClient(name = "${feign-client.name}", path = "${feign-client.path}")
public interface LogFeignClient extends LogFeign {


}
