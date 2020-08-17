package org.gaoh.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * WebMvcConfiguration
 *
 * @author gaoh
 * @date 2018/10/20 17:12
 * @email 2199382542@qq.com
 * @description web相关配置
 */
@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
    private String upLoadPath;

    @Value(value = "${project.path.upload}")
    public void setUploadPath(String uploadPath) {
        if (System.getProperty("os.name").contains("win") || System.getProperty("os.name").contains("Win")) {
            this.upLoadPath = uploadPath.split("\\?")[0];
        } else {
            this.upLoadPath = uploadPath.split("\\?")[1];
        }
    }

    private String webAppPath;

    @Value(value = "${project.path.webapp}")
    public void setWebAppPath(String webAppPath) {
        if (System.getProperty("os.name").contains("win") || System.getProperty("os.name").contains("Win")) {
            this.webAppPath = webAppPath.split("\\?")[0];
        } else {
            this.webAppPath = webAppPath.split("\\?")[1];
        }
    }

    @Value("${spring.resource.static-locations}")
    private String staticLocations;


    //开启会导致 'Access-Control-Allow-Origin' header contains multiple values

  /*  @Bean
    public CorsFilter corsFilter() {
        final UrlBasedCorsConfigurationSource urlBasedCorsConfigurationSource = new UrlBasedCorsConfigurationSource();
        final CorsConfiguration corsConfiguration = new CorsConfiguration();
        *//* 是否允许请求带有验证信息 *//*
        corsConfiguration.setAllowCredentials(true);
        *//* 允许访问的客户端域名 *//*
        corsConfiguration.addAllowedOrigin("*");
        *//* 允许服务端访问的客户端请求头 *//*
        corsConfiguration.addAllowedHeader("*");
        *//* 允许访问的方法名,GET POST等 *//*
        corsConfiguration.addAllowedMethod("*");
        urlBasedCorsConfigurationSource.registerCorsConfiguration("/**", corsConfiguration);
        return new CorsFilter(urlBasedCorsConfigurationSource);
    }*/

/*    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("*")
                .allowCredentials(true)
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .maxAge(3600);
    }*/


    /**
     * 静态资源的配置 - 使得可以从磁盘中读取 Html、图片、视频、音频等
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/**")
                .addResourceLocations("file:" + upLoadPath + "//", "file:" + webAppPath + "//")
                .addResourceLocations(staticLocations.split(","));
    }

    /**
     * 方案一： 默认访问根路径跳转 doc.html页面 （swagger文档页面）
     * 方案二： 访问根路径改成跳转 index.html页面 （简化部署方案： 可以把前端打包直接放到项目的 webapp，上面的配置）
     */
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("doc.html");
//		registry.addViewController("/").setViewName("index.html");
    }
}