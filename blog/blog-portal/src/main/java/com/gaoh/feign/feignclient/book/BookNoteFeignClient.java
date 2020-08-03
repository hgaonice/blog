package com.gaoh.feign.feignclient.book;

import com.gaoh.feign.portal.book.BookNoteFeign;
import org.springframework.cloud.openfeign.FeignClient;

/**
 * @Author: GH
 * @Date: 2020/5/5 17:44
 * @Version 1.0
 */
@FeignClient(name = "${feign-client.name}", path = "${feign-client.path}")
public interface BookNoteFeignClient extends BookNoteFeign {
}
