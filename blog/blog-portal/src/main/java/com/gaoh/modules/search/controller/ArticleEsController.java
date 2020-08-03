package com.gaoh.modules.search.controller;

import com.gaoh.common.Result;
import com.gaoh.common.constants.RabbitMqConstants;
import com.gaoh.entity.manage.article.Article;
import com.gaoh.feign.feignclient.article.ArticleFeignClient;
import com.gaoh.modules.search.mapper.ArticleRepository;
import com.google.common.collect.Lists;
import com.rabbitmq.client.Channel;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;

/**
 * ArticleEsController
 *
 * @author gaoh
 * @date 2020/03/13 15:04
 * @email 2199382542@qq.com
 * @description
 */
@RestController
@Slf4j
@Api(tags = "elasticSearch全局检索")
public class ArticleEsController {

    @Resource
    private ArticleRepository articleRepository;


    @Resource
    private ArticleFeignClient articleFeignClient;
    /**
     * 搜索标题，描述，内容
     * @param keywords
     * @return
     */
    @ApiOperation("搜索标题，描述，内容")
    @GetMapping("articles/search")
    public Result search(@RequestParam("keywords") String keywords){
        // 对所有索引进行搜索
        QueryBuilder queryBuilder = QueryBuilders.queryStringQuery(keywords);

        Iterable<Article> listIt =  articleRepository.search(queryBuilder);

        //Iterable转list
        List<Article> articleList= Lists.newArrayList(listIt);

        return Result.ok().put("articleList",articleList);
    }

    @RabbitListener(queues= RabbitMqConstants.REFRESH_ES_INDEX_QUEUE)
    public void refresh(Message message, Channel channel){
        try {
            //手动确认消息已经被消费
            channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
            articleRepository.deleteAll();
            List<Article> list = articleFeignClient.getList().getResult();
            articleRepository.saveAll(list);
            log.info(message.toString());

        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
