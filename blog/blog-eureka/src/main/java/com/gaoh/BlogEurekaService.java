package com.gaoh;

import org.apache.commons.lang.StringUtils;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;
import org.springframework.cloud.netflix.hystrix.dashboard.EnableHystrixDashboard;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;

/**
 * @Author: GH
 * @Date: 2019/7/15 19:47
 * @Version 1.0
 */
@SpringBootApplication
@EnableEurekaServer
@EnableHystrixDashboard
public class BlogEurekaService {
    public static void main(String[] args) {
        ConfigurableApplicationContext applicationContext = SpringApplication.run(BlogEurekaService.class, args);
        Environment env = applicationContext.getEnvironment();
        String port = env.getProperty("server.port");
        String path = env.getProperty("server.servlet.context-path");
        path = StringUtils.isNotBlank(path) ? path : "";
        System.out.println("\n----------------------------------------------------------\n\t" +
                "Application Project is running! Access URLs:\n\t" +
                "Local: \t\thttp://localhost:" + port + path + "/\n\t" +
                "hystrix: \t\thttp://localhost:" + port + path + "/hystrix\n\t" +
                "\n----------------------------------------------------------");
    }
}
