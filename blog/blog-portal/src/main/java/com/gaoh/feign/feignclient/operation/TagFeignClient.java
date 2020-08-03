package com.gaoh.feign.feignclient.operation;

import com.gaoh.feign.portal.operation.TagFeign;
import org.springframework.cloud.openfeign.FeignClient;

/**
 * @Author: GH
 * @Date: 2020/5/5 18:19
 * @Version 1.0
 */
@FeignClient(name = "${feign-client.name}", path = "${feign-client.path}")
public interface TagFeignClient extends TagFeign {
}
