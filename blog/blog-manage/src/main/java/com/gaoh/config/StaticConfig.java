package com.gaoh.config;

import com.gaoh.common.oss.OssBootUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 设置静态参数初始化
 */
@Configuration
public class StaticConfig {
    @Value("${blog.oss.endpoint}")
    private  String endPoint;
    @Value("${blog.oss.accessKey}")
    private  String accessKeyIdOos;
    @Value("${blog.oss.secretKey}")
    private  String accessKeySecretOos;
    @Value("${blog.oss.bucketName}")
    private  String bucketName;

    @Bean
    public void initStatic() {
        OssBootUtil.setBucketName(bucketName);
        OssBootUtil.setAccessKeyId(accessKeyIdOos);
        OssBootUtil.setAccessKeySecret(accessKeySecretOos);
        OssBootUtil.setEndPoint(endPoint);
    }
}
