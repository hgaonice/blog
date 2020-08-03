package com.gaoh.modules.oss.controller;


import com.gaoh.common.Result;
import com.gaoh.common.exception.MyException;
import com.gaoh.common.oss.OssBootUtil;
import com.gaoh.entity.manage.oss.OssResource;
import com.gaoh.modules.oss.service.CloudStorageService;
import com.gaoh.modules.oss.service.OssResourceService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * <p>
 * 云存储资源表 前端控制器
 * </p>
 *
 * @author gaoh
 * @since 2018-11-30
 */
@RestController
@RequestMapping("/admin/oss/resource")
@Api(tags = "文件上传")
@Slf4j
public class OssResourceController {

    @Autowired
    private OssResourceService ossResourceService;

    @Autowired
    private CloudStorageService cloudStorageService;

    @PostMapping("/upload")
    @ApiOperation("文件上传")
    public Result uploadCover(MultipartFile file) throws Exception{
        if (file!=null && file.isEmpty()) {
            throw new MyException("上传文件不能为空");
        }
        //上传文件
//        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
//        String url =cloudStorageService.uploadSuffix(file.getBytes(), suffix);
        String url = OssBootUtil.upload(file, new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        log.debug("img:{}", url);
        OssResource resource=new OssResource(url,file.getOriginalFilename());
        ossResourceService.save(resource);
        return Result.ok().put("resource", resource);
    }
}
