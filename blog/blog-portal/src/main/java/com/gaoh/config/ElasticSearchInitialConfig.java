package com.gaoh.config;

import com.gaoh.common.constants.RabbitMqConstants;
import com.gaoh.common.util.RabbitMqUtils;
import com.rabbitmq.client.ConnectionFactory;
import org.elasticsearch.client.ElasticsearchClient;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

/**
 * InitialConfig
 *
 * @author gaoh
 * @date 2020/03/16 23:04
 * @email 2199382542@qq.com
 * @description
 */
@Configuration
//@ConditionalOnBean(ElasticsearchClient.class)
public class ElasticSearchInitialConfig {

    @Resource
    private RabbitMqUtils rabbitMqUtils;

    /**
     * 项目启动时重新导入索引
     */
    @PostConstruct
    public void initEsIndex(){
        rabbitMqUtils.send(RabbitMqConstants.REFRESH_ES_INDEX_QUEUE,"blog-search init index");
        ConnectionFactory connectionFactory = new ConnectionFactory();
        connectionFactory.setAutomaticRecoveryEnabled(false);
    }
}
