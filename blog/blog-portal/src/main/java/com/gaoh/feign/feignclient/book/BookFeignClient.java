package com.gaoh.feign.feignclient.book;

import com.gaoh.feign.portal.book.BookFeign;
import org.springframework.cloud.openfeign.FeignClient;

/**
 * @Author: GH
 * @Date: 2020/5/5 16:06
 * @Version 1.0
 */
@FeignClient(name = "${feign-client.name}", path = "${feign-client.path}")
public interface BookFeignClient extends BookFeign {

}
