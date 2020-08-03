package com.gaoh;

import org.apache.commons.lang.StringUtils;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;


/**
 * @Author: GH
 * @Date: 2020/5/3 17:47
 * @Version 1.0
 */
@SpringBootApplication
@EnableHystrix
@EnableEurekaClient
@EnableFeignClients(basePackages = {"com.gaoh.feign"})
public class BlogPortalService {

    public static void main(String[] args) {
        System.setProperty("es.set.netty.runtime.available.processors","false");
        ConfigurableApplicationContext applicationContext = SpringApplication.run(BlogPortalService.class, args);
        Environment env = applicationContext.getEnvironment();
        String port = env.getProperty("server.port");
        String path = env.getProperty("server.servlet.context-path");
        path = StringUtils.isNotBlank(path) ? path : "";
        System.out.println("\n----------------------------------------------------------\n\t" +
                "Application Project is running! Access URLs:\n\t" +
                "Local: \t\thttp://localhost:" + port + path + "/\n\t" +
                "\n----------------------------------------------------------");
    }
}
