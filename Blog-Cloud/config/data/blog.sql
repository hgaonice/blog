/*
 Navicat Premium Data Transfer

 Source Server         : CloudData
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : 39.102.28.164:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 03/08/2020 11:22:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章描述',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章作者',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  `content_format` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'html的content',
  `read_num` int(11) NULL DEFAULT 0 COMMENT '阅读量',
  `comment_num` int(11) NULL DEFAULT 0 COMMENT '评论量',
  `like_num` int(11) NULL DEFAULT 0 COMMENT '点赞量',
  `cover_type` int(11) NULL DEFAULT NULL COMMENT '文章展示类别,1:普通，2：大图片，3：无图片',
  `cover` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '封面',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否推荐文章',
  `category_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类类别存在多级分类，用逗号隔开',
  `publish` tinyint(4) NULL DEFAULT 0 COMMENT '发布状态',
  `top` tinyint(1) NULL DEFAULT 0 COMMENT '是否置顶',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '关于本站和博主', '关于本站和博主', 'gaoh', '# 关于项目\n本项目是借鉴与[https://github.com/llldddbbb/dbblog](https://github.com/llldddbbb/dbblog) 由于在学习springcloud微服务框架,看了该同学的开源框架,于是心想改成微服务架构,就在该同学的架构基础上添加了部分功能,前端几乎没做任何变化,后面再继续维护升级.\n# 关于本站 \n1. 本站后端采用的是``springcloud``+``elasticSearch``+``shiro``+``mybatis-plus``+``rabbitMQ``+``Redis `` 搭建的一个简单的微服务\n2. 前端采用的是``Vue``(``Vue2.X``的版本,博主想换为``Vue3.X``或者``Vue4.X``的但是苦于前端学识太浅,技术不精,难以实现,如果有同学会可以联系博主,一起交流讨论),分为博客浏览与博客管理,其中博客管理使用的``element ui`` \n\n# 部署\n本项目部署在Linux服务器上使用的是阿里云,文件上传使用的是阿里云的oss,数据库采用云数据库RDS,前端采用Nginx部署\n\n\n# 关于我\ngaoh，是一名努力成长中的Java爱好者  \n以下是微信，欢迎互相交流\n![mmqrcode1589453994525.png](https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-14/6e9b5a7de9b8472c9bbbca8db5574025.png)\n# 关于本站\n本站前端Vue，后台是Java\n项目还会持续更新，欢迎大家star,谢谢！\n', '<h1 id=\"关于项目\">关于项目</h1>\n<p>本项目是借鉴与<a href=\"https://github.com/llldddbbb/dbblog\">https://github.com/llldddbbb/dbblog</a> 由于在学习springcloud微服务框架,看了该同学的开源框架,于是心想改成微服务架构,就在该同学的架构基础上添加了部分功能,前端几乎没做任何变化,后面再继续维护升级.</p>\n<h1 id=\"关于本站\">关于本站</h1>\n<ol>\n<li>本站后端采用的是<code>springcloud</code>+<code>elasticSearch</code>+<code>shiro</code>+<code>mybatis-plus</code>+<code>rabbitMQ</code>+<code>Redis</code> 搭建的一个简单的微服务</li>\n<li>前端采用的是<code>Vue</code>(<code>Vue2.X</code>的版本,博主想换为<code>Vue3.X</code>或者<code>Vue4.X</code>的但是苦于前端学识太浅,技术不精,难以实现,如果有同学会可以联系博主,一起交流讨论),分为博客浏览与博客管理,其中博客管理使用的<code>element ui</code> </li>\n</ol>\n<h1 id=\"部署\">部署</h1>\n<p>本项目部署在Linux服务器上使用的是阿里云,文件上传使用的是阿里云的oss,数据库采用云数据库RDS,前端采用Nginx部署</p>\n<h1 id=\"关于我\">关于我</h1>\n<p>gaoh，是一名努力成长中的Java爱好者<br>以下是微信，欢迎互相交流<br><img src=\"https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-14/6e9b5a7de9b8472c9bbbca8db5574025.png\" alt=\"mmqrcode1589453994525.png\"></p>\n<h1 id=\"关于本站-1\">关于本站</h1>\n<p>本站前端Vue，后台是Java<br>项目还会持续更新，欢迎大家star,谢谢！</p>\n', 94, 0, 39, 1, 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-16/b8347bb27dfd402eb777042380696fdc.jpg', '2020-05-16 15:37:32', '2020-06-23 10:07:36', 1, '1,2,3', 1, 1);
INSERT INTO `article` VALUES (6, '微信支付', 'java微信支付', 'gaoh', '## 相关说明\n最近在 做一个微信公众号.前端Vue+vant,后端springcloud.里面需要调取微信支付功能,在此记录一下操作的流程.看过很多博客大多数都是转载或者复制粘贴,没有太大作用.最终还是得看[微信支付官方文档](https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=7_1)\n\n## 微信配置\n\n### 微信公众平台配置\n#### 公众号设置\n产品中心>开发配置\n\n![3.png](https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-27/734463e44f124a0990751c91fb48a342.png)\n在设置域名的时候需要检验一个文件,最简单的方式就是在域名所指向的服务器起一个**nginx**监听**80**端口,然后将对应的文件放在html下面即可.\nPS:配置的**网页授权域名**一定要和前端回调的域名保持一致,否则会报*redirect_uri域名与后台配置不一致*,由于域名配置中一个月只能修改三次,所以笔者每次只添加域名上去没有对之前配置的错误域名进行删除.\n### 微信支付平台配置\n#### 微信支付平台需要绑定对应的微信公众号\n在微信支付平台中发起,在公众号中接收就可以了,笔者就不演示了.\n#### 设置API密钥\n账户中心>API安全 下面配置密钥,可以生成一个UUID然后粘过来,满足要求即可,生成的UUID一定要保存着,因为后面需要用到.\n#### 域名配置\n和公众号配置相同\n\n## 相关流程\n1. 首先前端需要跳转到微信的授权链接,采用的静默授权(**scope=snsapi_base**),用以获取**openid**.需要的参数有:*appid*(公众号ID)、*redirect_uri*(后端的回调地址)、*state*(订单id).\n2. 微信会跳转到回调的后端地址,在后端获取对应的**openid**,根据**openid**以及传入的订单Id获取到**prepay_id**,**prepay_id**里面就是微信的支付信息,包括支付的金额,支付的订单号(微信后台的)等等信息.跳转到公众号的一个页面带上**prepay_id**以及**订单Id**\n3. 前端根据**prepay_id**发起微信支付\n4. 微信支付成功后,减去相关库存\n\n## 相关代码\n### 重定向到前端页面,获取prepay_id\n#### 前端\n```js\n getAction(\"/weixin/parseUrlEncode\", {\n          url: \"http://www.XXX.cn/weixin/getPrepayId\"\n        }).then(res => {\n          const result = res.result;\n          const orderId = than.order.order.id;\n          //如果result不为空\n          if (!isBlankObj(result)) {\n            const url =\n              \"https://open.weixin.qq.com/connect/oauth2/authorize\" +\n              \"?appid=\" + result.appId +\n              \"&redirect_uri=\" + result.url +\n              \"&response_type=code\" +\n              \"&scope=snsapi_base\" +\n              \"&state=\" + orderId +\n              \"#wechat_redirect\";\n            //跳转到微信授权的Url\n            window.location.href = url;\n          }\n});\n```\n**getAction**是我对**axios**的封装,**/weixin/parseUrlEncode**是后端的一个请求,主要是将url进行urlEncode处理并且返回.还有返回appid.传入orderId是方便生成支付金额.\n![4.png](https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-27/48eb36d9e44c424e890f15ae81cd1a55.png)\n\n**PS:www.XXX.cn要和配置中的域名一致**\n\n#### 后端\n```java\n    /**开发者ID(AppID)   在yml中配置*/\n    @Value(\"${weixin.appId}\")\n    private String appId;\n    /**公众号的appsecret*/\n    @Value(\"${weixin.secret}\")\n    private String secret;\n\n    @RequestMapping(value = \"/getPrepayId\", method = RequestMethod.GET)\n    public String getOpenId(HttpServletRequest request, HttpServletResponse response) {\n        //订单Id\n        String state = request.getParameter(\"state\");\n        log.debug(\"PrepayId,state:{}\", state);\n\n        String codeUrl = \"https://api.weixin.qq.com/sns/oauth2/access_token\";\n        Map<String, String> param = new HashMap<>(4);\n        param.put(\"appid\", appId);\n        param.put(\"secret\", secret);\n        param.put(\"code\", request.getParameter(\"code\"));\n        param.put(\"grant_type\", \"authorization_code\");\n        \n        //根据appid secret 获取openid数据\n        String resultData = HttpClientUtils.httpClient(codeUrl, param, \"GET\");\n        JSONObject jsonObject = JSONObject.parseObject(resultData);\n        //根据参数生成签名 下文对unifiedorder有相关描述\n        Map<String, String> unifiedorder = weiXinService.unifiedorder(jsonObject.get(\"openid\").toString(), request, state);\n        String reqBody = \"\";\n        try {\n            //将参数生成XML格式的数据 获取prepayId 需要\n            reqBody = WXPayUtil.mapToXml(unifiedorder);\n            log.debug(\"reqBody:{}\", reqBody);\n        } catch (Exception e) {\n            e.printStackTrace();\n        }\n        String prepayId = \"\";\n        try {\n            //获取prepay_id\n            String url = \"https://api.mch.weixin.qq.com/pay/unifiedorder\";\n            String fromStatus = HttpClientUtils.postHttpClientEntity(url, reqBody);\n            log.debug(\"prepayData:{}\", fromStatus);\n            Map<String, String> map = WXPayUtil.xmlToMap(fromStatus);\n            log.debug(\"map:{}\", JSONObject.toJSONString(map));\n            prepayId = map.get(\"prepay_id\");\n            log.debug(\"prepayId:{}\", prepayId);\n        } catch (Exception e) {\n            e.printStackTrace();\n        }\n\n\n        String returnUrl = \"redirect:\" + \"http://www.XXX.cn:8080/success?prepay_id=\" + prepayId + \"&orderId=\" + state;\n        log.debug(\"url:{}\", returnUrl);\n        return returnUrl;\n    }\n```\n以上操作主要就是就是获取**prepay_id**重定向到前端页面\n> 向微信服务端发送了两次请求,第一次**HttpClientUtils.httpClient(codeUrl, param, \"GET\")**获取**openid**,第二次**HttpClientUtils.postHttpClientEntity(url, reqBody)**根据**openid**以及订单数据获取\n**prepay_id**也就是微信支付所需要的参数,最后将**prepay_id**重定向到前端页面(*PS:重定向的页面需要时外网直接可以访问的,我前端的端口是8080*)\n\n##### 相关处理方法\n**weiXinService.unifiedorder**\n```java\n    @Value(\"${weixin.appId}\")\n    private String appId;\n    /** 商户密钥key  就是之前生成的UUID*/\n    @Value(\"${weixin.key}\")\n    private String key;\n    /**商户Id*/\n    @Value(\"${weixin.merchantsId}\")\n    private String merchantsId;\n\n    public Map<String, String> unifiedorder(String openid, HttpServletRequest request, String orderId) {\n	//根据Id获取订单\n        TbOrderModel orderModel = orderService.getById(orderId);\n\n        if (orderModel == null) {\n            return null;\n        }\n        Map<String, String> params = new HashMap<>(12);\n        params.put(\"appid\", appId);\n        params.put(\"mch_id\", merchantsId);\n        params.put(\"device_info\", \"WEB\");\n        params.put(\"nonce_str\", WXPayUtil.generateNonceStr());\n        params.put(\"sign_type\", \"MD5\");\n        params.put(\"body\", \"小坤好物-商超\");\n        //微信生成的订单编号\n        params.put(\"out_trade_no\", \"Order_\" + System.currentTimeMillis());\n        //支付费用(分) 不支持小数    获取订单中的金额\n        params.put(\"total_fee\", orderModel.getPayment().multiply(new BigDecimal(100).setScale(0, BigDecimal.ROUND_UP)).intValue() + \"\");\n        params.put(\"spbill_create_ip\", request.getRemoteAddr());\n        params.put(\"trade_type\", \"JSAPI\");\n	//通知地址 我是随便填的\n        params.put(\"notify_url\", \"www.XXX.cn:8080/home\");\n        params.put(\"openid\", openid);\n        try {\n            params.put(\"sign\", WXPayUtil.generateSignature(params, key));\n        } catch (Exception e) {\n            e.printStackTrace();\n        }\n\n        return params;\n    }\n\n```\nWXPayUtil是微信支付 [DEMO](https://pay.weixin.qq.com/wiki/doc/api/download/WxPayAPI_JAVA.zip)中的,可以自行下载,把需要用的拿过来就行了\n详细的参数配置可参考[参数配置](https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_1)\n\n**HttpClientUtils**\n```java\n     /**\n     * <p>\n     * post/get请求\n     * </p>\n     *\n     * @param url         请求的URL\n     * @param paramMap    请求的参数\n     * @param requestType 请求类型\n     * @return 返回的字符串\n     */\n    public static String httpClient(String url, Map<String, String> paramMap, String requestType) {\n        if (StringUtils.isBlank(url)) {\n            return \"url不能为空!\";\n        }\n        if (StringUtils.isBlank(requestType)) {\n            return \"请求类型不能为空!\";\n        }\n        // 获得Http客户端(可以理解为:你得先有一个浏览器;注意:实际上HttpClient与浏览器是不一样的)\n        CloseableHttpClient httpClient = HttpClientBuilder.create().build();\n        // 参数\n        StringBuilder params = new StringBuilder();\n        if (paramMap != null) {\n            log.info(\"请求参数:\" + JSONObject.toJSONString(paramMap));\n            Iterator<Map.Entry<String, String>> iterator = paramMap.entrySet().iterator();\n            for (int i = 0; iterator.hasNext(); ++i) {\n                Map.Entry<String, String> next = iterator.next();\n                String symbol = \"&\";\n                if (i == 0) {\n                    if (!url.contains(\"?\")) {\n                        symbol = \"?\";\n                    }\n                }\n                params.append(symbol).append(next.getKey()).append(\"=\").append(next.getValue());\n            }\n        }\n        log.info(params.toString());\n        // 响应模型\n        CloseableHttpResponse response = null;\n        url += params;\n        try {\n            if (\"GET\".equalsIgnoreCase(requestType)) {\n                HttpGet httpGet = new HttpGet(url);\n                response = httpClient.execute(httpGet);\n            } else if (\"POST\".equalsIgnoreCase(requestType)) {\n                // 创建Post请求\n                HttpPost httpPost = new HttpPost(url);\n                // 设置ContentType(注:如果只是传普通参数的话,ContentType不一定非要用application/json)\n                httpPost.setHeader(\"Content-Type\", \"application/json;charset=utf8\");\n                // 由客户端执行(发送)Post请求\n                response = httpClient.execute(httpPost);\n            }\n        } catch (IOException e) {\n            e.printStackTrace();\n        }\n        log.info(\"请求类型:{},请求路径:{}\", requestType, url);\n        if (response == null) return \"response空!\";\n        try {\n            // 从响应模型中获取响应实体\n            HttpEntity responseEntity = response.getEntity();\n\n            StatusLine statusLine = response.getStatusLine();\n\n            log.info(\"响应状态为:\" + response.getStatusLine());\n            log.info(\"响应内容长度为:\" + responseEntity.getContentLength());\n            if (statusLine.toString().contains(HttpStatus.SC_OK + \"\")) {\n                log.info(\"请求成功!\");\n                String fromStatus = EntityUtils.toString(responseEntity);\n                log.info(\"响应内容为:\" + fromStatus);\n                return fromStatus;\n            } else {\n                return response.getStatusLine().toString();\n            }\n        } catch (Exception e) {\n            e.printStackTrace();\n        } finally {\n            close(httpClient, response);\n        }\n        return \"\";\n    }\n\n\n\n     /**\n     * <p>\n     * post请求\n     * </p>\n     *\n     * @param url    路径\n     * @param object 实体对象\n     * @return 请求的数据\n     */\n    public static String postHttpClientEntity(String url, Object object) {\n        if (StringUtils.isBlank(url)) {\n            return \"url不能为空!\";\n        }\n        if (object == null) {\n            return \"实体对象不能为空!\";\n        }\n        // 获得Http客户端(可以理解为:你得先有一个浏览器;注意:实际上HttpClient与浏览器是不一样的)\n        CloseableHttpClient httpClient = HttpClientBuilder.create().build();\n\n        // 创建Post请求\n        HttpPost httpPost = new HttpPost(url);\n        // 我这里利用阿里的fastjson，将Object转换为json字符串;\n        // (需要导入com.alibaba.fastjson.JSON包)\n        StringEntity entity = new StringEntity(JSON.toJSONString(object), \"UTF-8\");\n        // post请求是将参数放在请求体里面传过去的;这里将entity放入post请求体中\n        httpPost.setEntity(entity);\n        httpPost.setHeader(\"Content-Type\", \"application/json;charset=utf8\");\n        // 响应模型\n        CloseableHttpResponse response = null;\n        try {\n            // 由客户端执行(发送)Post请求\n            response = httpClient.execute(httpPost);\n            // 从响应模型中获取响应实体\n            HttpEntity responseEntity = response.getEntity();\n\n            StatusLine statusLine = response.getStatusLine();\n            System.out.println(\"响应状态为:\" + response.getStatusLine());\n            if (statusLine.toString().contains(HttpStatus.SC_OK + \"\")) {\n                log.info(\"请求成功!\");\n                String fromStatus = EntityUtils.toString(responseEntity);\n                log.info(\"响应内容为:\" + fromStatus);\n                return fromStatus;\n            } else {\n                return statusLine.toString();\n            }\n        } catch (Exception e) {\n            e.printStackTrace();\n        } finally {\n            close(httpClient, response);\n        }\n        return \"\";\n    }\n\n```\n\n#### 前端\nsuccess页面\n```js\ndata() {\n      return {\n        prepay_id: \'\',\n        url: {\n          weiXinPay: \'/weixin/weiXinPay\'\n        },\n        wxConfig: {},\n        orderId: \'\',\n      }\n    },\n    created() {\n      //获取Url上的参数\n      this.prepay_id = this.getQueryVariable(\"prepay_id\");\n      this.orderId = this.getQueryVariable(\"orderId\");\n      console.log(this.prepay_id);\n      if (this.prepay_id) {\n        this.weixin();\n      }\n    },\n    methods: {\n      //获取Url参数\n      getQueryVariable(variable) {\n        const query = window.location.search.substring(1);\n        let vars = query.split(\"&\");\n        for (let i = 0; i < vars.length; i++) {\n          let pair = vars[i].split(\"=\");\n          if (pair[0] == variable) {\n            return pair[1];\n          }\n        }\n        return (false);\n      },\n      //微信支付\n      weixin() {\n        const that = this;\n        const params = {\n          prepay_id: this.prepay_id\n        };\n        //将所有参数生成签名(后台操作)\n        postAction(this.url.weiXinPay, params).then((res) => {\n          that.wxConfig = res.result;\n          console.log(\"that.wxConfig:\", that.wxConfig);        \n	  //支付 \n          that.onBridgeReady();\n          this.init();\n        })\n      },\n      onBridgeReady() {\n        const that = this;\n        WeixinJSBridge.invoke(\n          \'getBrandWCPayRequest\', {\n            \"appId\": that.wxConfig.appId,     //公众号名称，由商户传入\n            \"timeStamp\": that.wxConfig.timeStamp,         //时间戳，自1970年以来的秒数\n            \"nonceStr\": that.wxConfig.nonceStr, //随机串\n            \"package\": \'prepay_id=\' + that.wxConfig.prepay_id,\n            \"signType\": \"MD5\",         //微信签名方式：\n            \"paySign\": that.wxConfig.paySign //微信签名\n          },\n          function (res) {\n            if (res.err_msg == \"get_brand_wcpay_request:ok\") {\n              // 使用以上方式判断前端返回,微信团队郑重提示：\n              //res.err_msg将在用户支付成功后返回ok，但并不保证它绝对可靠。\n              that.$toast.success(\"支付成功!\");\n	      //修改订单\n              that.updateOrderStatus();\n            }\n          });\n      },\n      //初始化JSAPI内置对象\n      init() {\n        if (typeof WeixinJSBridge == \"undefined\") {\n          if (document.addEventListener) {\n            document.addEventListener(\'WeixinJSBridgeReady\', onBridgeReady, false);\n          } else if (document.attachEvent) {\n            document.attachEvent(\'WeixinJSBridgeReady\', onBridgeReady);\n            document.attachEvent(\'onWeixinJSBridgeReady\', onBridgeReady);\n          }\n        } else {\n          this.onBridgeReady();\n        }\n      },\n      //修改订单状态\n      updateOrderStatus() {\n        //在这里就不写  修改订单后跳转到对应的页面\n      }\n\n    }\n```\n\n\n这里的支付直接是从微信官网拿下来的,用的是微信的内置对象不需要引入其他的依赖,只改了相关[配置](https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=7_7&index=6)\n**PS:前后端的参数名称大小写一定要注意,不然生成的签名就会有问题**\n\n#### 后台\n后端对参数进行处理并返回给前端\n```java\n     /**\n     * 支付签名等信息生成\n     *\n     * @param jsonObject\n     * @return\n     */\n    @RequestMapping(value = \"/weiXinPay\", method = RequestMethod.POST)\n    @ResponseBody\n    public Result<Map<String, String>> weiXinPay(@RequestBody JSONObject jsonObject) {\n        Result<Map<String, String>> result = new Result<>();\n        Map<String, String> paramsMap = new HashMap<>(10);\n        paramsMap.put(\"appId\", appId);\n        paramsMap.put(\"timeStamp\", System.currentTimeMillis() / 1000 + \"\");\n        paramsMap.put(\"nonceStr\", WXPayUtil.generateNonceStr());\n        paramsMap.put(\"package\", \"prepay_id=\" + jsonObject.getString(\"prepay_id\"));\n        paramsMap.put(\"signType\", \"MD5\");\n        try {\n            //生成签名\n            paramsMap.put(\"paySign\", WXPayUtil.generateSignature(paramsMap, key));\n        } catch (Exception e) {\n            e.printStackTrace();\n        }\n        paramsMap.put(\"prepay_id\", jsonObject.getString(\"prepay_id\"));\n        result.setResult(paramsMap);\n        log.debug(JSONObject.toJSONString(paramsMap));\n        log.debug(\"支付授权!\");\n        return result;\n    }\n\n```\n\n\n## 说明\n到此微信支付就完成了,如果文中哪些地方写的有问题欢迎及时指正.\n\n\n', '<h2 id=\"相关说明\">相关说明</h2>\n<p>最近在 做一个微信公众号.前端Vue+vant,后端springcloud.里面需要调取微信支付功能,在此记录一下操作的流程.看过很多博客大多数都是转载或者复制粘贴,没有太大作用.最终还是得看<a href=\"https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=7_1\">微信支付官方文档</a></p>\n<h2 id=\"微信配置\">微信配置</h2>\n<h3 id=\"微信公众平台配置\">微信公众平台配置</h3>\n<h4 id=\"公众号设置\">公众号设置</h4>\n<p>产品中心&gt;开发配置</p>\n<p><img src=\"https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-27/734463e44f124a0990751c91fb48a342.png\" alt=\"3.png\"><br>在设置域名的时候需要检验一个文件,最简单的方式就是在域名所指向的服务器起一个<strong>nginx</strong>监听<strong>80</strong>端口,然后将对应的文件放在html下面即可.<br>PS:配置的<strong>网页授权域名</strong>一定要和前端回调的域名保持一致,否则会报<em>redirect_uri域名与后台配置不一致</em>,由于域名配置中一个月只能修改三次,所以笔者每次只添加域名上去没有对之前配置的错误域名进行删除.</p>\n<h3 id=\"微信支付平台配置\">微信支付平台配置</h3>\n<h4 id=\"微信支付平台需要绑定对应的微信公众号\">微信支付平台需要绑定对应的微信公众号</h4>\n<p>在微信支付平台中发起,在公众号中接收就可以了,笔者就不演示了.</p>\n<h4 id=\"设置api密钥\">设置API密钥</h4>\n<p>账户中心&gt;API安全 下面配置密钥,可以生成一个UUID然后粘过来,满足要求即可,生成的UUID一定要保存着,因为后面需要用到.</p>\n<h4 id=\"域名配置\">域名配置</h4>\n<p>和公众号配置相同</p>\n<h2 id=\"相关流程\">相关流程</h2>\n<ol>\n<li>首先前端需要跳转到微信的授权链接,采用的静默授权(<strong>scope=snsapi_base</strong>),用以获取<strong>openid</strong>.需要的参数有:<em>appid</em>(公众号ID)、<em>redirect_uri</em>(后端的回调地址)、<em>state</em>(订单id).</li>\n<li>微信会跳转到回调的后端地址,在后端获取对应的<strong>openid</strong>,根据<strong>openid</strong>以及传入的订单Id获取到<strong>prepay_id</strong>,<strong>prepay_id</strong>里面就是微信的支付信息,包括支付的金额,支付的订单号(微信后台的)等等信息.跳转到公众号的一个页面带上<strong>prepay_id</strong>以及<strong>订单Id</strong></li>\n<li>前端根据<strong>prepay_id</strong>发起微信支付</li>\n<li>微信支付成功后,减去相关库存</li>\n</ol>\n<h2 id=\"相关代码\">相关代码</h2>\n<h3 id=\"重定向到前端页面获取prepay_id\">重定向到前端页面,获取prepay_id</h3>\n<h4 id=\"前端\">前端</h4>\n<pre><code class=\"language-js\"> getAction(&quot;/weixin/parseUrlEncode&quot;, {\n          url: &quot;http://www.XXX.cn/weixin/getPrepayId&quot;\n        }).then(res =&gt; {\n          const result = res.result;\n          const orderId = than.order.order.id;\n          //如果result不为空\n          if (!isBlankObj(result)) {\n            const url =\n              &quot;https://open.weixin.qq.com/connect/oauth2/authorize&quot; +\n              &quot;?appid=&quot; + result.appId +\n              &quot;&amp;redirect_uri=&quot; + result.url +\n              &quot;&amp;response_type=code&quot; +\n              &quot;&amp;scope=snsapi_base&quot; +\n              &quot;&amp;state=&quot; + orderId +\n              &quot;#wechat_redirect&quot;;\n            //跳转到微信授权的Url\n            window.location.href = url;\n          }\n});</code></pre>\n<p><strong>getAction</strong>是我对<strong>axios</strong>的封装,<strong>/weixin/parseUrlEncode</strong>是后端的一个请求,主要是将url进行urlEncode处理并且返回.还有返回appid.传入orderId是方便生成支付金额.<br><img src=\"https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-27/48eb36d9e44c424e890f15ae81cd1a55.png\" alt=\"4.png\"></p>\n<p><strong>PS:<a href=\"http://www.XXX.cn%E8%A6%81%E5%92%8C%E9%85%8D%E7%BD%AE%E4%B8%AD%E7%9A%84%E5%9F%9F%E5%90%8D%E4%B8%80%E8%87%B4\">www.XXX.cn要和配置中的域名一致</a></strong></p>\n<h4 id=\"后端\">后端</h4>\n<pre><code class=\"language-java\">    /**开发者ID(AppID)   在yml中配置*/\n    @Value(&quot;${weixin.appId}&quot;)\n    private String appId;\n    /**公众号的appsecret*/\n    @Value(&quot;${weixin.secret}&quot;)\n    private String secret;\n\n    @RequestMapping(value = &quot;/getPrepayId&quot;, method = RequestMethod.GET)\n    public String getOpenId(HttpServletRequest request, HttpServletResponse response) {\n        //订单Id\n        String state = request.getParameter(&quot;state&quot;);\n        log.debug(&quot;PrepayId,state:{}&quot;, state);\n\n        String codeUrl = &quot;https://api.weixin.qq.com/sns/oauth2/access_token&quot;;\n        Map&lt;String, String&gt; param = new HashMap&lt;&gt;(4);\n        param.put(&quot;appid&quot;, appId);\n        param.put(&quot;secret&quot;, secret);\n        param.put(&quot;code&quot;, request.getParameter(&quot;code&quot;));\n        param.put(&quot;grant_type&quot;, &quot;authorization_code&quot;);\n\n        //根据appid secret 获取openid数据\n        String resultData = HttpClientUtils.httpClient(codeUrl, param, &quot;GET&quot;);\n        JSONObject jsonObject = JSONObject.parseObject(resultData);\n        //根据参数生成签名 下文对unifiedorder有相关描述\n        Map&lt;String, String&gt; unifiedorder = weiXinService.unifiedorder(jsonObject.get(&quot;openid&quot;).toString(), request, state);\n        String reqBody = &quot;&quot;;\n        try {\n            //将参数生成XML格式的数据 获取prepayId 需要\n            reqBody = WXPayUtil.mapToXml(unifiedorder);\n            log.debug(&quot;reqBody:{}&quot;, reqBody);\n        } catch (Exception e) {\n            e.printStackTrace();\n        }\n        String prepayId = &quot;&quot;;\n        try {\n            //获取prepay_id\n            String url = &quot;https://api.mch.weixin.qq.com/pay/unifiedorder&quot;;\n            String fromStatus = HttpClientUtils.postHttpClientEntity(url, reqBody);\n            log.debug(&quot;prepayData:{}&quot;, fromStatus);\n            Map&lt;String, String&gt; map = WXPayUtil.xmlToMap(fromStatus);\n            log.debug(&quot;map:{}&quot;, JSONObject.toJSONString(map));\n            prepayId = map.get(&quot;prepay_id&quot;);\n            log.debug(&quot;prepayId:{}&quot;, prepayId);\n        } catch (Exception e) {\n            e.printStackTrace();\n        }\n\n\n        String returnUrl = &quot;redirect:&quot; + &quot;http://www.XXX.cn:8080/success?prepay_id=&quot; + prepayId + &quot;&amp;orderId=&quot; + state;\n        log.debug(&quot;url:{}&quot;, returnUrl);\n        return returnUrl;\n    }</code></pre>\n<p>以上操作主要就是就是获取<strong>prepay_id</strong>重定向到前端页面</p>\n<blockquote>\n<p>向微信服务端发送了两次请求,第一次<strong>HttpClientUtils.httpClient(codeUrl, param, &quot;GET&quot;)</strong>获取<strong>openid</strong>,第二次<strong>HttpClientUtils.postHttpClientEntity(url, reqBody)</strong>根据<strong>openid</strong>以及订单数据获取<br><strong>prepay_id</strong>也就是微信支付所需要的参数,最后将<strong>prepay_id</strong>重定向到前端页面(<em>PS:重定向的页面需要时外网直接可以访问的,我前端的端口是8080</em>)</p>\n</blockquote>\n<h5 id=\"相关处理方法\">相关处理方法</h5>\n<p><strong>weiXinService.unifiedorder</strong></p>\n<pre><code class=\"language-java\">    @Value(&quot;${weixin.appId}&quot;)\n    private String appId;\n    /** 商户密钥key  就是之前生成的UUID*/\n    @Value(&quot;${weixin.key}&quot;)\n    private String key;\n    /**商户Id*/\n    @Value(&quot;${weixin.merchantsId}&quot;)\n    private String merchantsId;\n\n    public Map&lt;String, String&gt; unifiedorder(String openid, HttpServletRequest request, String orderId) {\n    //根据Id获取订单\n        TbOrderModel orderModel = orderService.getById(orderId);\n\n        if (orderModel == null) {\n            return null;\n        }\n        Map&lt;String, String&gt; params = new HashMap&lt;&gt;(12);\n        params.put(&quot;appid&quot;, appId);\n        params.put(&quot;mch_id&quot;, merchantsId);\n        params.put(&quot;device_info&quot;, &quot;WEB&quot;);\n        params.put(&quot;nonce_str&quot;, WXPayUtil.generateNonceStr());\n        params.put(&quot;sign_type&quot;, &quot;MD5&quot;);\n        params.put(&quot;body&quot;, &quot;小坤好物-商超&quot;);\n        //微信生成的订单编号\n        params.put(&quot;out_trade_no&quot;, &quot;Order_&quot; + System.currentTimeMillis());\n        //支付费用(分) 不支持小数    获取订单中的金额\n        params.put(&quot;total_fee&quot;, orderModel.getPayment().multiply(new BigDecimal(100).setScale(0, BigDecimal.ROUND_UP)).intValue() + &quot;&quot;);\n        params.put(&quot;spbill_create_ip&quot;, request.getRemoteAddr());\n        params.put(&quot;trade_type&quot;, &quot;JSAPI&quot;);\n    //通知地址 我是随便填的\n        params.put(&quot;notify_url&quot;, &quot;www.XXX.cn:8080/home&quot;);\n        params.put(&quot;openid&quot;, openid);\n        try {\n            params.put(&quot;sign&quot;, WXPayUtil.generateSignature(params, key));\n        } catch (Exception e) {\n            e.printStackTrace();\n        }\n\n        return params;\n    }\n</code></pre>\n<p>WXPayUtil是微信支付 <a href=\"https://pay.weixin.qq.com/wiki/doc/api/download/WxPayAPI_JAVA.zip\">DEMO</a>中的,可以自行下载,把需要用的拿过来就行了<br>详细的参数配置可参考<a href=\"https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_1\">参数配置</a></p>\n<p><strong>HttpClientUtils</strong></p>\n<pre><code class=\"language-java\">     /**\n     * &lt;p&gt;\n     * post/get请求\n     * &lt;/p&gt;\n     *\n     * @param url         请求的URL\n     * @param paramMap    请求的参数\n     * @param requestType 请求类型\n     * @return 返回的字符串\n     */\n    public static String httpClient(String url, Map&lt;String, String&gt; paramMap, String requestType) {\n        if (StringUtils.isBlank(url)) {\n            return &quot;url不能为空!&quot;;\n        }\n        if (StringUtils.isBlank(requestType)) {\n            return &quot;请求类型不能为空!&quot;;\n        }\n        // 获得Http客户端(可以理解为:你得先有一个浏览器;注意:实际上HttpClient与浏览器是不一样的)\n        CloseableHttpClient httpClient = HttpClientBuilder.create().build();\n        // 参数\n        StringBuilder params = new StringBuilder();\n        if (paramMap != null) {\n            log.info(&quot;请求参数:&quot; + JSONObject.toJSONString(paramMap));\n            Iterator&lt;Map.Entry&lt;String, String&gt;&gt; iterator = paramMap.entrySet().iterator();\n            for (int i = 0; iterator.hasNext(); ++i) {\n                Map.Entry&lt;String, String&gt; next = iterator.next();\n                String symbol = &quot;&amp;&quot;;\n                if (i == 0) {\n                    if (!url.contains(&quot;?&quot;)) {\n                        symbol = &quot;?&quot;;\n                    }\n                }\n                params.append(symbol).append(next.getKey()).append(&quot;=&quot;).append(next.getValue());\n            }\n        }\n        log.info(params.toString());\n        // 响应模型\n        CloseableHttpResponse response = null;\n        url += params;\n        try {\n            if (&quot;GET&quot;.equalsIgnoreCase(requestType)) {\n                HttpGet httpGet = new HttpGet(url);\n                response = httpClient.execute(httpGet);\n            } else if (&quot;POST&quot;.equalsIgnoreCase(requestType)) {\n                // 创建Post请求\n                HttpPost httpPost = new HttpPost(url);\n                // 设置ContentType(注:如果只是传普通参数的话,ContentType不一定非要用application/json)\n                httpPost.setHeader(&quot;Content-Type&quot;, &quot;application/json;charset=utf8&quot;);\n                // 由客户端执行(发送)Post请求\n                response = httpClient.execute(httpPost);\n            }\n        } catch (IOException e) {\n            e.printStackTrace();\n        }\n        log.info(&quot;请求类型:{},请求路径:{}&quot;, requestType, url);\n        if (response == null) return &quot;response空!&quot;;\n        try {\n            // 从响应模型中获取响应实体\n            HttpEntity responseEntity = response.getEntity();\n\n            StatusLine statusLine = response.getStatusLine();\n\n            log.info(&quot;响应状态为:&quot; + response.getStatusLine());\n            log.info(&quot;响应内容长度为:&quot; + responseEntity.getContentLength());\n            if (statusLine.toString().contains(HttpStatus.SC_OK + &quot;&quot;)) {\n                log.info(&quot;请求成功!&quot;);\n                String fromStatus = EntityUtils.toString(responseEntity);\n                log.info(&quot;响应内容为:&quot; + fromStatus);\n                return fromStatus;\n            } else {\n                return response.getStatusLine().toString();\n            }\n        } catch (Exception e) {\n            e.printStackTrace();\n        } finally {\n            close(httpClient, response);\n        }\n        return &quot;&quot;;\n    }\n\n\n\n     /**\n     * &lt;p&gt;\n     * post请求\n     * &lt;/p&gt;\n     *\n     * @param url    路径\n     * @param object 实体对象\n     * @return 请求的数据\n     */\n    public static String postHttpClientEntity(String url, Object object) {\n        if (StringUtils.isBlank(url)) {\n            return &quot;url不能为空!&quot;;\n        }\n        if (object == null) {\n            return &quot;实体对象不能为空!&quot;;\n        }\n        // 获得Http客户端(可以理解为:你得先有一个浏览器;注意:实际上HttpClient与浏览器是不一样的)\n        CloseableHttpClient httpClient = HttpClientBuilder.create().build();\n\n        // 创建Post请求\n        HttpPost httpPost = new HttpPost(url);\n        // 我这里利用阿里的fastjson，将Object转换为json字符串;\n        // (需要导入com.alibaba.fastjson.JSON包)\n        StringEntity entity = new StringEntity(JSON.toJSONString(object), &quot;UTF-8&quot;);\n        // post请求是将参数放在请求体里面传过去的;这里将entity放入post请求体中\n        httpPost.setEntity(entity);\n        httpPost.setHeader(&quot;Content-Type&quot;, &quot;application/json;charset=utf8&quot;);\n        // 响应模型\n        CloseableHttpResponse response = null;\n        try {\n            // 由客户端执行(发送)Post请求\n            response = httpClient.execute(httpPost);\n            // 从响应模型中获取响应实体\n            HttpEntity responseEntity = response.getEntity();\n\n            StatusLine statusLine = response.getStatusLine();\n            System.out.println(&quot;响应状态为:&quot; + response.getStatusLine());\n            if (statusLine.toString().contains(HttpStatus.SC_OK + &quot;&quot;)) {\n                log.info(&quot;请求成功!&quot;);\n                String fromStatus = EntityUtils.toString(responseEntity);\n                log.info(&quot;响应内容为:&quot; + fromStatus);\n                return fromStatus;\n            } else {\n                return statusLine.toString();\n            }\n        } catch (Exception e) {\n            e.printStackTrace();\n        } finally {\n            close(httpClient, response);\n        }\n        return &quot;&quot;;\n    }\n</code></pre>\n<h4 id=\"前端-1\">前端</h4>\n<p>success页面</p>\n<pre><code class=\"language-js\">data() {\n      return {\n        prepay_id: &#39;&#39;,\n        url: {\n          weiXinPay: &#39;/weixin/weiXinPay&#39;\n        },\n        wxConfig: {},\n        orderId: &#39;&#39;,\n      }\n    },\n    created() {\n      //获取Url上的参数\n      this.prepay_id = this.getQueryVariable(&quot;prepay_id&quot;);\n      this.orderId = this.getQueryVariable(&quot;orderId&quot;);\n      console.log(this.prepay_id);\n      if (this.prepay_id) {\n        this.weixin();\n      }\n    },\n    methods: {\n      //获取Url参数\n      getQueryVariable(variable) {\n        const query = window.location.search.substring(1);\n        let vars = query.split(&quot;&amp;&quot;);\n        for (let i = 0; i &lt; vars.length; i++) {\n          let pair = vars[i].split(&quot;=&quot;);\n          if (pair[0] == variable) {\n            return pair[1];\n          }\n        }\n        return (false);\n      },\n      //微信支付\n      weixin() {\n        const that = this;\n        const params = {\n          prepay_id: this.prepay_id\n        };\n        //将所有参数生成签名(后台操作)\n        postAction(this.url.weiXinPay, params).then((res) =&gt; {\n          that.wxConfig = res.result;\n          console.log(&quot;that.wxConfig:&quot;, that.wxConfig);        \n      //支付 \n          that.onBridgeReady();\n          this.init();\n        })\n      },\n      onBridgeReady() {\n        const that = this;\n        WeixinJSBridge.invoke(\n          &#39;getBrandWCPayRequest&#39;, {\n            &quot;appId&quot;: that.wxConfig.appId,     //公众号名称，由商户传入\n            &quot;timeStamp&quot;: that.wxConfig.timeStamp,         //时间戳，自1970年以来的秒数\n            &quot;nonceStr&quot;: that.wxConfig.nonceStr, //随机串\n            &quot;package&quot;: &#39;prepay_id=&#39; + that.wxConfig.prepay_id,\n            &quot;signType&quot;: &quot;MD5&quot;,         //微信签名方式：\n            &quot;paySign&quot;: that.wxConfig.paySign //微信签名\n          },\n          function (res) {\n            if (res.err_msg == &quot;get_brand_wcpay_request:ok&quot;) {\n              // 使用以上方式判断前端返回,微信团队郑重提示：\n              //res.err_msg将在用户支付成功后返回ok，但并不保证它绝对可靠。\n              that.$toast.success(&quot;支付成功!&quot;);\n          //修改订单\n              that.updateOrderStatus();\n            }\n          });\n      },\n      //初始化JSAPI内置对象\n      init() {\n        if (typeof WeixinJSBridge == &quot;undefined&quot;) {\n          if (document.addEventListener) {\n            document.addEventListener(&#39;WeixinJSBridgeReady&#39;, onBridgeReady, false);\n          } else if (document.attachEvent) {\n            document.attachEvent(&#39;WeixinJSBridgeReady&#39;, onBridgeReady);\n            document.attachEvent(&#39;onWeixinJSBridgeReady&#39;, onBridgeReady);\n          }\n        } else {\n          this.onBridgeReady();\n        }\n      },\n      //修改订单状态\n      updateOrderStatus() {\n        //在这里就不写  修改订单后跳转到对应的页面\n      }\n\n    }</code></pre>\n<p>这里的支付直接是从微信官网拿下来的,用的是微信的内置对象不需要引入其他的依赖,只改了相关<a href=\"https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=7_7&amp;index=6\">配置</a><br><strong>PS:前后端的参数名称大小写一定要注意,不然生成的签名就会有问题</strong></p>\n<h4 id=\"后台\">后台</h4>\n<p>后端对参数进行处理并返回给前端</p>\n<pre><code class=\"language-java\">     /**\n     * 支付签名等信息生成\n     *\n     * @param jsonObject\n     * @return\n     */\n    @RequestMapping(value = &quot;/weiXinPay&quot;, method = RequestMethod.POST)\n    @ResponseBody\n    public Result&lt;Map&lt;String, String&gt;&gt; weiXinPay(@RequestBody JSONObject jsonObject) {\n        Result&lt;Map&lt;String, String&gt;&gt; result = new Result&lt;&gt;();\n        Map&lt;String, String&gt; paramsMap = new HashMap&lt;&gt;(10);\n        paramsMap.put(&quot;appId&quot;, appId);\n        paramsMap.put(&quot;timeStamp&quot;, System.currentTimeMillis() / 1000 + &quot;&quot;);\n        paramsMap.put(&quot;nonceStr&quot;, WXPayUtil.generateNonceStr());\n        paramsMap.put(&quot;package&quot;, &quot;prepay_id=&quot; + jsonObject.getString(&quot;prepay_id&quot;));\n        paramsMap.put(&quot;signType&quot;, &quot;MD5&quot;);\n        try {\n            //生成签名\n            paramsMap.put(&quot;paySign&quot;, WXPayUtil.generateSignature(paramsMap, key));\n        } catch (Exception e) {\n            e.printStackTrace();\n        }\n        paramsMap.put(&quot;prepay_id&quot;, jsonObject.getString(&quot;prepay_id&quot;));\n        result.setResult(paramsMap);\n        log.debug(JSONObject.toJSONString(paramsMap));\n        log.debug(&quot;支付授权!&quot;);\n        return result;\n    }\n</code></pre>\n<h2 id=\"说明\">说明</h2>\n<p>到此微信支付就完成了,如果文中哪些地方写的有问题欢迎及时指正.</p>\n', 60, 0, 5, 0, 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-27/8fb64000c2ad4b4290705ae74f06d9cd.jpg', '2020-05-16 15:37:32', '2020-05-27 07:43:13', 0, '9,13,14', 1, 1);
INSERT INTO `article` VALUES (7, 'Minio安装与配置(win版)', 'Minio安装与配置,windows环境下', 'gaoh', '## 简介\n    把所有文件的读写操作集成在项目里面是非常耗费项目性能的,文件的读写是比较耗费IO.所以这个时候我们需要将项目中的文件操作从项目中独立出来,于是有了阿里的OSS,七牛云等云存储工具.\n\n    由于市面上的云存储工具都是付费的,我介绍的是Apache的开源项目Minio,适合搭建自己的文件存储系统.\n\n### Minio\nMinIO 是一个基于Apache License v2.0开源协议的对象存储服务。它兼容亚马逊S3云存储服务接口，非常适合于存储大容量非结构化的数据，例如图片、视频、日志文件、备份数据和容器/虚拟机镜像等，而一个对象文件可以是任意大小，从几kb到最大5T不等。\n\nMinIO是一个非常轻量的服务(从名称就可以看出来),可以很简单的和其他应用的结合，使用Go语言开发的。详细介绍请查看[官网](https://min.io/)\n\n## 下载\n1. 可以直接在官网下载\n[下载地址](https://min.io/download#/windows) ,选择对于的平台.由于是外国的服务器,下载的比较慢.\n2. 博主提供的下载地址\n[windows版本](https://gaohoos.oss-cn-beijing.aliyuncs.com/resources/minio/minio.exe)--[Linux版本](https://gaohoos.oss-cn-beijing.aliyuncs.com/resources/minio/minio) 博主已放在阿里云OSS上\n\n## 安装\n将下载后的文件单独放到一个文件夹,并在该文件夹下创建**data**目录\n![2.png](https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/83ca79da8d2a427ebbd2ca72d8ee4b98.png)\n\n启动 \n```shell\nminio.exe server D:\\minio\\data\n```\n控制台会输出对于的日志\n\n浏览器访问[http://127.0.0.1:9000](http://127.0.0.1:9000),会进去以下页面\n![3.png](https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/c8b9878cfa17411398f1911992548239.png)\n默认的用户名和密码是:**minioadmin**\n\n## 配置\n点击右下角的 +  创建**Bucket**\n\n这个时候你可以手动上传一个文件,然后copy它的Url在浏览器上访问\n\n![4.png](https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/5eba7c2871004ac78bee830314223ff6.png)\n你会发现后面有一串很长的字符串,当你去掉后面那段字符串后是无法访问的(或者调转到Minio页面).这是由于你的**Bucket**没有设置公共读,访问它的时候需要带上类似于签名的信息确保数据安全.\n\n设置公共读即可解决\n![5.png](https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/83b4f45eb34444af9f135860fcc50538.png)\n\n\n![6.png](https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/17174abe5569485aa0d236c7945c5746.png)\n\n这个时候访问文件就可以不需要带上后面的签名了.\n\n\n修改**access_key**和**secret_key**\n找到:data>>.minio.sys>>config>>config.json\n![7.png](https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/31c0661ee83b4b8bbf46e6ecccff9bad.png)\n**secret_key**至少是8位数字或字符\n\n然后重启Minio\n![8.png](https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/474f7e36899a433ea09ed94767550ea2.png)\n登录时输入刚才配置的**access_key**和**secret_key**即可', '<h2 id=\"简介\">简介</h2>\n<pre><code>把所有文件的读写操作集成在项目里面是非常耗费项目性能的,文件的读写是比较耗费IO.所以这个时候我们需要将项目中的文件操作从项目中独立出来,于是有了阿里的OSS,七牛云等云存储工具.\n\n由于市面上的云存储工具都是付费的,我介绍的是Apache的开源项目Minio,适合搭建自己的文件存储系统.</code></pre><h3 id=\"minio\">Minio</h3>\n<p>MinIO 是一个基于Apache License v2.0开源协议的对象存储服务。它兼容亚马逊S3云存储服务接口，非常适合于存储大容量非结构化的数据，例如图片、视频、日志文件、备份数据和容器/虚拟机镜像等，而一个对象文件可以是任意大小，从几kb到最大5T不等。</p>\n<p>MinIO是一个非常轻量的服务(从名称就可以看出来),可以很简单的和其他应用的结合，使用Go语言开发的。详细介绍请查看<a href=\"https://min.io/\">官网</a></p>\n<h2 id=\"下载\">下载</h2>\n<ol>\n<li>可以直接在官网下载<br><a href=\"https://min.io/download#/windows\">下载地址</a> ,选择对于的平台.由于是外国的服务器,下载的比较慢.</li>\n<li>博主提供的下载地址<br><a href=\"https://gaohoos.oss-cn-beijing.aliyuncs.com/resources/minio/minio.exe\">windows版本</a>--<a href=\"https://gaohoos.oss-cn-beijing.aliyuncs.com/resources/minio/minio\">Linux版本</a> 博主已放在阿里云OSS上</li>\n</ol>\n<h2 id=\"安装\">安装</h2>\n<p>将下载后的文件单独放到一个文件夹,并在该文件夹下创建<strong>data</strong>目录<br><img src=\"https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/83ca79da8d2a427ebbd2ca72d8ee4b98.png\" alt=\"2.png\"></p>\n<p>启动 </p>\n<pre><code class=\"language-shell\">minio.exe server D:\\minio\\data</code></pre>\n<p>控制台会输出对于的日志</p>\n<p>浏览器访问<a href=\"http://127.0.0.1:9000\">http://127.0.0.1:9000</a>,会进去以下页面<br><img src=\"https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/c8b9878cfa17411398f1911992548239.png\" alt=\"3.png\"><br>默认的用户名和密码是:<strong>minioadmin</strong></p>\n<h2 id=\"配置\">配置</h2>\n<p>点击右下角的 +  创建<strong>Bucket</strong></p>\n<p>这个时候你可以手动上传一个文件,然后copy它的Url在浏览器上访问</p>\n<p><img src=\"https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/5eba7c2871004ac78bee830314223ff6.png\" alt=\"4.png\"><br>你会发现后面有一串很长的字符串,当你去掉后面那段字符串后是无法访问的(或者调转到Minio页面).这是由于你的<strong>Bucket</strong>没有设置公共读,访问它的时候需要带上类似于签名的信息确保数据安全.</p>\n<p>设置公共读即可解决<br><img src=\"https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/83b4f45eb34444af9f135860fcc50538.png\" alt=\"5.png\"></p>\n<p><img src=\"https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/17174abe5569485aa0d236c7945c5746.png\" alt=\"6.png\"></p>\n<p>这个时候访问文件就可以不需要带上后面的签名了.</p>\n<p>修改<strong>access_key</strong>和<strong>secret_key</strong><br>找到:data&gt;&gt;.minio.sys&gt;&gt;config&gt;&gt;config.json<br><img src=\"https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/31c0661ee83b4b8bbf46e6ecccff9bad.png\" alt=\"7.png\"><br><strong>secret_key</strong>至少是8位数字或字符</p>\n<p>然后重启Minio<br><img src=\"https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/474f7e36899a433ea09ed94767550ea2.png\" alt=\"8.png\"><br>登录时输入刚才配置的<strong>access_key</strong>和<strong>secret_key</strong>即可</p>\n', 27, 0, 1, 0, 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/a0a2b49b33004bb18f3f7c77bfe47bce.png', '2020-06-02 07:17:24', '2020-06-02 07:18:45', 0, '16,17,18', 1, 0);
INSERT INTO `article` VALUES (8, '使用axios上传文件，因为带上时间戳，导致浏览器无法加上boundary值，引发后端异常', 'axios文件上传', 'gaoh', '# 问题\n在使用axios防止页面缓存，因为在所有请求加上了时间戳，导致后台出现错误。	\n> org.apache.tomcat.util.http.fileupload.FileUploadException: the request was rejected because no multipart boundary was found\n\n**request**对axios的封装\n```js\nexport function uploadFile(url, data) {\n  console.log(\"data:\",data)\n  return request({\n    url,\n    data,\n    method: \'post\',\n    headers: {\n      // 修改请求头\n      \"Content-Type\": \"multipart/form-data;charset=UTF-8\"\n    },\n  })\n}\n```\n\n\n文件上传代码，使用的是vant\n```js\n afterRead(file) {\n    //文件读取完成后的回调函数\n    let formData = new FormData();\n    formData.append(\"file\", file.file);\n    uploadFile(this.url.upload, formData).then(res => {\n       XXXX\n    });\n},\n```\n\n\naxios在上传文件的时候，一般来说是需要在请求头里面带上 **\'Content-Type\': \'multipart/form-data\'** ，并且浏览器会在上面带上**boundary**参数生成一段随机字符串\n![1.png](https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-05/cfa8bf95e02c43a588e332a781dcffe1.png)\n\n当我**interceptors.request.use**在所有的请求里面加上时间戳，上传文件的时候浏览器就不会加上**boundary**，后台就会报错。\n\n## 解决\n\n```js\n\n/**\n * axios 相关封装\n * @param config\n * @returns {AxiosPromise}\n */\nconst request  = (config) => {\n  //1、创建instance实例\n  const instance = axios.create({\n    baseURL: XXXXX,\n    timeout: 10000\n  })\n\n  //2.1请求拦截作用\n  instance.interceptors.request.use(config => {\n    //在请求后面添加时间戳 防止页面缓存\n    if (config.method == \'post\') {\n      const contentType = config.headers[\'Content-Type\'];\n      //判断请求头是否包含multipart/form-data   如果包含  就不加上时间戳\n      if (contentType && contentType.indexOf(\"multipart/form-data\") === -1) {\n        config.data = {\n          ...config.data,\n          _t: Date.parse(new Date()) / 1000\n        }\n      }\n\n    } else if (config.method == \'get\') {\n      config.params = {\n        _t: Date.parse(new Date()) / 1000,\n        ...config.params\n      }\n    }\n }  \n}\n```\n', '<h1 id=\"问题\">问题</h1>\n<p>在使用axios防止页面缓存，因为在所有请求加上了时间戳，导致后台出现错误。    </p>\n<blockquote>\n<p>org.apache.tomcat.util.http.fileupload.FileUploadException: the request was rejected because no multipart boundary was found</p>\n</blockquote>\n<p><strong>request</strong>对axios的封装</p>\n<pre><code class=\"language-js\">export function uploadFile(url, data) {\n  console.log(&quot;data:&quot;,data)\n  return request({\n    url,\n    data,\n    method: &#39;post&#39;,\n    headers: {\n      // 修改请求头\n      &quot;Content-Type&quot;: &quot;multipart/form-data;charset=UTF-8&quot;\n    },\n  })\n}</code></pre>\n<p>文件上传代码，使用的是vant</p>\n<pre><code class=\"language-js\"> afterRead(file) {\n    //文件读取完成后的回调函数\n    let formData = new FormData();\n    formData.append(&quot;file&quot;, file.file);\n    uploadFile(this.url.upload, formData).then(res =&gt; {\n       XXXX\n    });\n},</code></pre>\n<p>axios在上传文件的时候，一般来说是需要在请求头里面带上 <strong>&#39;Content-Type&#39;: &#39;multipart/form-data&#39;</strong> ，并且浏览器会在上面带上<strong>boundary</strong>参数生成一段随机字符串<br><img src=\"https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-05/cfa8bf95e02c43a588e332a781dcffe1.png\" alt=\"1.png\"></p>\n<p>当我<strong>interceptors.request.use</strong>在所有的请求里面加上时间戳，上传文件的时候浏览器就不会加上<strong>boundary</strong>，后台就会报错。</p>\n<h2 id=\"解决\">解决</h2>\n<pre><code class=\"language-js\">\n/**\n * axios 相关封装\n * @param config\n * @returns {AxiosPromise}\n */\nconst request  = (config) =&gt; {\n  //1、创建instance实例\n  const instance = axios.create({\n    baseURL: XXXXX,\n    timeout: 10000\n  })\n\n  //2.1请求拦截作用\n  instance.interceptors.request.use(config =&gt; {\n    //在请求后面添加时间戳 防止页面缓存\n    if (config.method == &#39;post&#39;) {\n      const contentType = config.headers[&#39;Content-Type&#39;];\n      //判断请求头是否包含multipart/form-data   如果包含  就不加上时间戳\n      if (contentType &amp;&amp; contentType.indexOf(&quot;multipart/form-data&quot;) === -1) {\n        config.data = {\n          ...config.data,\n          _t: Date.parse(new Date()) / 1000\n        }\n      }\n\n    } else if (config.method == &#39;get&#39;) {\n      config.params = {\n        _t: Date.parse(new Date()) / 1000,\n        ...config.params\n      }\n    }\n }  \n}</code></pre>\n', 7, 0, 0, 0, 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-05/80e951f79f3c493b9f4910b03588f2ba.jpg', '2020-06-05 09:28:22', '2020-06-05 09:28:25', 0, '19,21', 1, 0);

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `category_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类类别',
  `recommend` tinyint(1) NULL DEFAULT 0 COMMENT '是否推荐',
  `publisher` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `publish_date` date NULL DEFAULT NULL COMMENT '出版日期',
  `page_num` int(11) NULL DEFAULT NULL COMMENT '页数',
  `grade` double NULL DEFAULT NULL COMMENT '评分',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  `catalogue` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '原书目录',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `read_num` int(11) NULL DEFAULT 0 COMMENT '阅读量',
  `comment_num` int(11) NULL DEFAULT 0 COMMENT '评论量',
  `like_num` int(11) NULL DEFAULT 0 COMMENT '点赞量',
  `publish` tinyint(1) NULL DEFAULT 0 COMMENT '是否发布',
  `progress` int(11) NULL DEFAULT 0 COMMENT '读书状态',
  `reading` tinyint(1) NULL DEFAULT NULL COMMENT '是否阅读',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图书表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '深入理解Java虚拟机（第2版）', 'http://oss.dblearn.cn/dbblog/20190303/01c91a28bf944010ade45fd876e94b8c.jpg', '周志明', '4,5,6', 1, '机械工业出版社', '2013-09-01', 0, 4, '<p class=\"ql-align-justify\">周志明，资深Java技术专家，对JavaEE企业级应用开发、OSGi、Java虚拟机和工作流等都有深入的研究，并在大量的实践中积累了丰富的经验。尤其精通Java虚拟机，撰写了大量与JVM相关的经典文章，被各大技术社区争相转载，是ITeye等技术社区公认的Java虚拟机方面的领袖人物之一。除本书外，还著有经典著作《深入理解OSGi：Equinox原理、应用与最佳实践》，广获读者好评。现任远光软件股份有限公司开发部总经理兼架构师，先后参与过国家电网、南方电网等多个国家级大型ERP项目的平台架构工作，对软件系统架构也有深刻的认识和体会。</p><p class=\"ql-align-justify\">《深入理解Java虚拟机:JVM高级特性与最佳实践(第2版)》内容简介：第1版两年内印刷近10次，4家网上书店的评论近4?000条，98%以上的评论全部为5星级的好评，是整个Java图书领域公认的经典著作和超级畅销书，繁体版在台湾也十分受欢迎。第2版在第1版的基础上做了很大的改进：根据最新的JDK 1.7对全书内容进行了全面的升级和补充；增加了大量处理各种常见JVM问题的技巧和最佳实践；增加了若干与生产环境相结合的实战案例；对第1版中的错误和不足之处的修正；等等。第2版不仅技术更新、内容更丰富，而且实战性更强。</p><p class=\"ql-align-justify\">《深入理解Java虚拟机:JVM高级特性与最佳实践(第2版)》共分为五大部分，围绕内存管理、执行子系统、程序编译与优化、高效并发等核心主题对JVM进行了全面而深入的分析，深刻揭示了JVM的工作原理。</p><p class=\"ql-align-justify\">第一部分从宏观的角度介绍了整个Java技术体系、Java和JVM的发展历程、模块化，以及JDK的编译，这对理解书中后面内容有重要帮助。</p><p class=\"ql-align-justify\">第二部分讲解了JVM的自动内存管理，包括虚拟机内存区域的划分原理以及各种内存溢出异常产生的原因；常见的垃圾收集算法以及垃圾收集器的特点和工作原理；常见虚拟机监控与故障处理工具的原理和使用方法。</p><p class=\"ql-align-justify\">第三部分分析了虚拟机的执行子系统，包括类文件结构、虚拟机类加载机制、虚拟机字节码执行引擎。</p><p class=\"ql-align-justify\">第四部分讲解了程序的编译与代码的优化，阐述了泛型、自动装箱拆箱、条件编译等语法糖的原理；讲解了虚拟机的热点探测方法、HotSpot的即时编译器、编译触发条件，以及如何从虚拟机外部观察和分析JIT编译的数据和结果；</p><p class=\"ql-align-justify\">第五部分探讨了Java实现高效并发的原理，包括JVM内存模型的结构和操作；原子性、可见性和有序性在Java内存模型中的体现；先行发生原则的规则和使用；线程在Java语言中的实现原理；虚拟机实现高效并发所做的一系列锁优化措施。</p><p><br></p>', '<p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">前言</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">第一部分走近Java</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">第1章走近Java2</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.1概述2</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.2Java技术体系3</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.3Java发展史5</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.4Java虚拟机发展史9</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.4.1SunClassicExactVM9</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.4.2SunHotSpotVM11</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.4.3SunMobile—EmbeddedVMMeta—CircularVM12</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.4.4BEAJRockitIBMJ9VM13</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.4.5AzulVMBEALiquidVM14</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.4.6ApacheHarmonyGoogleAndroidDalvikVM14</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.4.7MicrosoftJVM及其他15</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.5展望Java技术的未来16</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.5.1模块化17</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.5.2混合语言17</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.5.3多核并行19</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.5.4进一步丰富语法20</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.5.564位虚拟机21</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.6实战：自己编译JDK22</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.6.1获取JDK源码22</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.6.2系统需求24</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.6.3构建编译环境25</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.6.4进行编译26</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.6.5在IDE工具中进行源码调试31</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">1.7本章小结35</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">第二部分自动内存管理机制</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">第2章Java内存区域与内存溢出异常38</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">2.1概述38</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">2.2运行时数据区域38</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">2.2.1程序计数器39</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">2.2.2Java虚拟机栈39</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">2.2.3本地方法栈40</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">2.2.4Java堆41</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">2.2.5方法区41</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">2.2.6运行时常量池42</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">2.2.7直接内存43</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">2.3HotSpot虚拟机对象探秘43</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">2.3.1对象的创建44</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">2.3.2对象的内存布局47</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">2.3.3对象的访问定位48</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">2.4实战：OutOfMemoryError异常50</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">2.4.1Java堆溢出51</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">2.4.2虚拟机栈和本地方法栈溢出53</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">2.4.3方法区和运行时常量池溢出56</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">2.4.4本机直接内存溢出59</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">2.5本章小结60</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">第3章垃圾收集器与内存分配策略61</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.1概述61</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.2对象已死吗62</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.2.1引用计数算法62</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.2.2可达性分析算法64</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.2.3再谈引用65</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.2.4生存还是死亡66</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.2.5回收方法区68</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.3垃圾收集算法69</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.3.1标记—清除算法69</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.3.2复制算法70</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.3.3标记—整理算法71</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.3.4分代收集算法72</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.4HotSpot的算法实现72</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.4.1枚举根节点72</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.4.2安全点73</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.4.3安全区域74</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.5垃圾收集器75</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.5.1Serial收集器76</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.5.2ParNew收集器77</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.5.3ParallelScavenge收集器79</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.5.4SerialOld收集器80</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.5.5ParallelOld收集器80</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.5.6CMS收集器81</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.5.7G1收集器84</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.5.8理解GC日志89</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.5.9垃圾收集器参数总结90</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.6内存分配与回收策略91</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.6.1对象优先在Eden分配91</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.6.2大对象直接进入老年代93</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.6.3长期存活的对象将进入老年代95</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.6.4动态对象年龄判定97</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.6.5空间分配担保98</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">3.7本章小结100</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">第4章虚拟机性能监控与故障处理工具101</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">4.1概述101</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">4.2JDK的命令行工具101</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">4.2.1jps：虚拟机进程状况工具104</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">4.2.2jstat：虚拟机统计信息监视工具105</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">4.2.3jinfo：Java配置信息工具106</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">4.2.4jmap：Java内存映像工具107</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">4.2.5jhat：虚拟机堆转储快照分析工具108</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">4.2.6jstack：Java堆栈跟踪工具109</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">4.2.7HSDIS：JIT生成代码反汇编111</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">4.3JDK的可视化工具114</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">4.3.1JConsole：Java监视与管理控制台115</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">4.3.2VisualVM：多合一故障处理工具122</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">4.4本章小结131</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">第5章调优案例分析与实战132</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">5.1概述132</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">5.2案例分析132</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">5.2.1高性能硬件上的程序部署策略132</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">5.2.2集群间同步导致的内存溢出135</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">5.2.3堆外内存导致的溢出错误136</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">5.2.4外部命令导致系统缓慢137</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">5.2.5服务器JVM进程崩溃138</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">5.2.6不恰当数据结构导致内存占用过大139</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">5.2.7由Windows虚拟内存导致的长时间停顿141</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">5.3实战：Eclipse运行速度调优142</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">5.3.1调优前的程序运行状态142</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">5.3.2升级JDK1.6的性能变化及兼容问题145</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">5.3.3编译时间和类加载时间的优化150</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">5.3.4调整内存设置控制垃圾收集频率153</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">5.3.5选择收集器降低延迟157</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">5.4本章小结160</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">第三部分虚拟机执行子系统</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">第6章类文件结构162</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.1概述162</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.2无关性的基石162</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.3Class类文件的结构164</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.3.1魔数与Class文件的版本166</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.3.2常量池167</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.3.3访问标志173</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.3.4类索引、父类索引与接口索引集合174</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.3.5字段表集合175</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.3.6方法表集合178</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.3.7属性表集合180</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.4字节码指令简介196</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.4.1字节码与数据类型197</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.4.2加载和存储指令199</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.4.3运算指令200</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.4.4类型转换指令202</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.4.5对象创建与访问指令203</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.4.6操作数栈管理指令203</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.4.7控制转移指令204</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.4.8方法调用和返回指令204</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.4.9异常处理指令205</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.4.10同步指令205</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.5公有设计和私有实现206</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.6Class文件结构的发展207</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">6.7本章小结208</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">第7章虚拟机类加载机制209</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">7.1概述209</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">7.2类加载的时机210</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">7.3类加载的过程214</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">7.3.1加载214</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">7.3.2验证216</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">7.3.3准备219</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">7.3.4解析220</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">7.3.5初始化225</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">7.4类加载器227</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">7.4.1类与类加载器228</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">7.4.2双亲委派模型229</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">7.4.3破坏双亲委派模型233</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">7.5本章小结235</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">第8章虚拟机字节码执行引擎236</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">8.1概述236</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">8.2运行时栈帧结构236</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">8.2.1局部变量表238</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">8.2.2操作数栈242</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">8.2.3动态连接243</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">8.2.4方法返回地址243</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">8.2.5附加信息244</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">8.3方法调用244</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">8.3.1解析244</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">8.3.2分派246</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">8.3.3动态类型语言支持258</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">8.4基于栈的字节码解释执行引擎269</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">8.4.1解释执行269</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">8.4.2基于栈的指令集与基于寄存器的指令集270</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">8.4.3基于栈的解释器执行过程272</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">8.5本章小结275</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">第9章类加载及执行子系统的案例与实战276</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">9.1概述276</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">9.2案例分析276</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">9.2.1Tomcat：正统的类加载器架构276</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">9.2.2OSGi：灵活的类加载器架构279</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">9.2.3字节码生成技术与动态代理的实现282</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">9.2.4Retrotranslator：跨越JDK版本286</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">9.3实战：自己动手实现远程执行功能289</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">9.3.1目标290</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">9.3.2思路290</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">9.3.3实现291</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">9.3.4验证298</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">9.4本章小结299</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">第四部分程序编译与代码优化</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">第10章早期（编译期）优化302</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">10.1概述302</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">10.2Javac编译器303</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">10.2.1Javac的源码与调试303</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">10.2.2解析与填充符号表305</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">10.2.3注解处理器307</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">10.2.4语义分析与字节码生成307</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">10.3Java语法糖的味道311</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">10.3.1泛型与类型擦除311</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">10.3.2自动装箱、拆箱与遍历循环315</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">10.3.3条件编译317</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">10.4实战：插入式注解处理器318</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">10.4.1实战目标318</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">10.4.2代码实现319</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">10.4.3运行与测试326</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">10.4.4其他应用案例327</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">10.5本章小结328</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">第11章晚期（运行期）优化329</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">11.1概述329</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">11.2HotSpot虚拟机内的即时编译器329</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">11.2.1解释器与编译器330</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">11.2.2编译对象与触发条件332</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">11.2.3编译过程337</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">11.2.4查看及分析即时编译结果339</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">11.3编译优化技术345</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">11.3.1优化技术概览346</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">11.3.2公共子表达式消除350</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">11.3.3数组边界检查消除351</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">11.3.4方法内联352</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">11.3.5逃逸分析354</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">11.4Java与C/C++的编译器对比356</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">11.5本章小结358</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">第五部分高效并发</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">第12章Java内存模型与线程360</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">12.1概述360</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">12.2硬件的效率与一致性361</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">12.3Java内存模型362</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">12.3.1主内存与工作内存363</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">12.3.2内存间交互操作364</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">12.3.3对于volatile型变量的特殊规则366</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">12.3.4对于long和double型变量的特殊规则372</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">12.3.5原子性、可见性与有序性373</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">12.3.6先行发生原则375</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">12.4Java与线程378</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">12.4.1线程的实现378</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">12.4.2Java线程调度381</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">12.4.3状态转换383</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">12.5本章小结384</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">第13章线程安全与锁优化385</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">13.1概述385</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">13.2线程安全385</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">13.2.1Java语言中的线程安全386</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">13.2.2线程安全的实现方法390</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">13.3锁优化397</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">13.3.1自旋锁与自适应自旋398</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">13.3.2锁消除398</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">13.3.3锁粗化400</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">13.3.4轻量级锁400</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">13.3.5偏向锁402</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">13.4本章小结403</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">附录</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">附录A编译Windows版的OpenJDK406</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">附录B虚拟机字节码指令表414</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">附录CHotSpot虚拟机主要参数表420</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">附录D对象查询语言（OQL）简介424</span></p><p><span style=\"background-color: rgb(250, 250, 250); color: rgb(68, 68, 68);\">附录EJDK历史版本轨迹430</span></p>', '2019-03-03 23:33:11', '2020-05-27 06:40:45', 26, 0, 3, 1, 20, 1);

-- ----------------------------
-- Table structure for book_note
-- ----------------------------
DROP TABLE IF EXISTS `book_note`;
CREATE TABLE `book_note`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '笔记标题',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '笔记描述',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '笔记作者',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '笔记内容',
  `content_format` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'html的context',
  `read_num` int(11) NULL DEFAULT 0 COMMENT '阅读量',
  `comment_num` int(11) NULL DEFAULT 0 COMMENT '评论量',
  `like_num` int(11) NULL DEFAULT 0 COMMENT '点赞量',
  `cover` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '封面',
  `book_id` int(11) NULL DEFAULT NULL COMMENT '所属书本',
  `chapter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属章节',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否推荐笔记',
  `category_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类类别存在多级分类，用逗号隔开',
  `publish` tinyint(4) NULL DEFAULT 0 COMMENT '发布状态',
  `cover_type` int(11) NULL DEFAULT NULL COMMENT '封面类型',
  `top` tinyint(1) NULL DEFAULT NULL COMMENT '是否置顶',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '笔记' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_note
-- ----------------------------
INSERT INTO `book_note` VALUES (1, 'Java虚拟机01——Java内存数据区域和内存溢出异常', 'Java虚拟机在执行Java程序的过程中会把它所管理的内存划分为若干个不同的数据区域。这些区域都有各自的用途，以及创建和销毁的时间，有的区域随着虚拟机进程的启动而存在，有些区域则依赖用户线程的启动和结束而建立和销毁.', 'Bobbi', '# 运行时数据区域\r\n> Java虚拟机在执行Java程序的过程中会把它所管理的内存划分为若干个不同的数据区域。这些区域都有各自的用途，以及创建和销毁的时间，有的区域随着虚拟机进程的启动而存在，有些区域则依赖用户线程的启动和结束而建立和销毁。根据《Java虚拟机规范（Java SE 7版）》的规定，Java虚拟机所管理的内存将会包括以下几个运行时数据区域，如下图所示：\r\n我们可以将上面的数据区域分为线程独有、线程共享及其他三大区域：\r\n## 1.1. 线程独有的数据区域\r\n### 1. 程序计数器（Program Counter Register）\r\n1.   当前线程所执行的字节码的行号指示器。\r\n2. 用于选取下一条需要执行的字节码指令，分支、循环、跳转、异常处理、线程恢复需要依赖这个计数\r\n\r\n### 2. 虚拟机栈（Java Stack）\r\n位于线程私有的内存中，生命周期与线程相同。\r\n描述了Java方法执行的内存模型。\r\n方法执行时使用栈帧（Stack Frame）来存储局部变量表、操作数栈、动态链接、方法出口等信息。\r\n如果线程请求的栈深度大于虚拟机所允许的深度，将抛出StackOverflowError异常。\r\n如果虚拟机栈可以动态扩展，如果扩展时无法申请到足够的内存，就会抛出OutOfMemoryError异常。\r\n### 3. 本地方法栈（Native Method Stack）\r\n与虚拟机栈相类似，区域在于本地方法栈为虚拟机使用到的Native方法服务。\r\n可以由虚拟机设计者自己实现。\r\n本地方法栈区域也会抛出==StackOverflowError==和==OutOfMemoryError==异常\r\n## 1.2. 线程共享的数据区域\r\nJava堆（Heap）\r\n是Java虚拟机所管理内存中最大的一块，在虚拟机启动时创建。\r\n在Java虚拟机规范中的描述是：所有的对象实例以及数组都要在堆上分配。随着JIT编译器的发展与逃逸分析技术逐渐成熟，栈上分配、标量替换优化技术导致某些对象并没有分配在堆上。\r\nJava GC工作的主要区域。现代收集器基本都采用分代收集算法，所以Java堆中还可以细分为新生代和老年代；再细致一点的有Eden空间、From Survivor空间、To Survivor空间等。\r\n如果在堆中没有内存完成实例分配，并且堆也无法再扩展时，将会抛出==OutOfMemoryError==异常。\r\n方法区（Method Area）\r\n用于存储已被虚拟机加载的类信息、常量、静态变量、即时编译器编译后的代码等数据。\r\n它有一个别名叫做Non-Heap（非堆），目的应该是与Java堆区分开来。\r\nHotSpot虚拟机选择把GC分代收集扩展至方法区，即使用永久代来实现方法区，因此也有人将此区域称为“永久代”；JDK 1.7的HotSpot中，已经把原本放在永久代的字符串常量池移出，并逐步改为采用Native Memory来实现方法区的规划。\r\n根据Java虚拟机规范的规定，当方法区无法满足内存分配需求时，将抛出==OutOfMemoryError==异常。\r\n运行时常量池（Runtime Constant Pool）\r\n运行时常量池是方法区的一部分。\r\nClass文件中除了有类的版本、字段、方法、接口等描述信息外，还有一项信息是常量池（Constant Pool Table），用于存放编译期生成的各种字面量和符号引用，这部分内容将在类加载后进入方法区的运行时常量池中存放。\r\n当常量池无法再申请到内存时会抛出==OutOfMemoryError==异常。\r\n## 1.3. 其他区域\r\n直接内存（Direct Memory）\r\n直接内存并不是虚拟机运行时数据区的一部分，也不是Java虚拟机规范中定义的内存区域。\r\n这部分内存也可能导致OutOfMemoryError异常出现。\r\n', '<h1 id=\"运行时数据区域\">运行时数据区域</h1>\n<blockquote>\n<p>Java虚拟机在执行Java程序的过程中会把它所管理的内存划分为若干个不同的数据区域。这些区域都有各自的用途，以及创建和销毁的时间，有的区域随着虚拟机进程的启动而存在，有些区域则依赖用户线程的启动和结束而建立和销毁。根据《Java虚拟机规范（Java SE 7版）》的规定，Java虚拟机所管理的内存将会包括以下几个运行时数据区域，如下图所示：<br>我们可以将上面的数据区域分为线程独有、线程共享及其他三大区域：</p>\n</blockquote>\n<h2 id=\"11-线程独有的数据区域\">1.1. 线程独有的数据区域</h2>\n<h3 id=\"1-程序计数器（program-counter-register）\">1. 程序计数器（Program Counter Register）</h3>\n<ol>\n<li>当前线程所执行的字节码的行号指示器。</li>\n<li>用于选取下一条需要执行的字节码指令，分支、循环、跳转、异常处理、线程恢复需要依赖这个计数</li>\n</ol>\n<h3 id=\"2-虚拟机栈（java-stack）\">2. 虚拟机栈（Java Stack）</h3>\n<p>位于线程私有的内存中，生命周期与线程相同。<br>描述了Java方法执行的内存模型。<br>方法执行时使用栈帧（Stack Frame）来存储局部变量表、操作数栈、动态链接、方法出口等信息。<br>如果线程请求的栈深度大于虚拟机所允许的深度，将抛出StackOverflowError异常。<br>如果虚拟机栈可以动态扩展，如果扩展时无法申请到足够的内存，就会抛出OutOfMemoryError异常。</p>\n<h3 id=\"3-本地方法栈（native-method-stack）\">3. 本地方法栈（Native Method Stack）</h3>\n<p>与虚拟机栈相类似，区域在于本地方法栈为虚拟机使用到的Native方法服务。<br>可以由虚拟机设计者自己实现。<br>本地方法栈区域也会抛出==StackOverflowError==和==OutOfMemoryError==异常</p>\n<h2 id=\"12-线程共享的数据区域\">1.2. 线程共享的数据区域</h2>\n<p>Java堆（Heap）<br>是Java虚拟机所管理内存中最大的一块，在虚拟机启动时创建。<br>在Java虚拟机规范中的描述是：所有的对象实例以及数组都要在堆上分配。随着JIT编译器的发展与逃逸分析技术逐渐成熟，栈上分配、标量替换优化技术导致某些对象并没有分配在堆上。<br>Java GC工作的主要区域。现代收集器基本都采用分代收集算法，所以Java堆中还可以细分为新生代和老年代；再细致一点的有Eden空间、From Survivor空间、To Survivor空间等。<br>如果在堆中没有内存完成实例分配，并且堆也无法再扩展时，将会抛出==OutOfMemoryError==异常。<br>方法区（Method Area）<br>用于存储已被虚拟机加载的类信息、常量、静态变量、即时编译器编译后的代码等数据。<br>它有一个别名叫做Non-Heap（非堆），目的应该是与Java堆区分开来。<br>HotSpot虚拟机选择把GC分代收集扩展至方法区，即使用永久代来实现方法区，因此也有人将此区域称为“永久代”；JDK 1.7的HotSpot中，已经把原本放在永久代的字符串常量池移出，并逐步改为采用Native Memory来实现方法区的规划。<br>根据Java虚拟机规范的规定，当方法区无法满足内存分配需求时，将抛出==OutOfMemoryError==异常。<br>运行时常量池（Runtime Constant Pool）<br>运行时常量池是方法区的一部分。<br>Class文件中除了有类的版本、字段、方法、接口等描述信息外，还有一项信息是常量池（Constant Pool Table），用于存放编译期生成的各种字面量和符号引用，这部分内容将在类加载后进入方法区的运行时常量池中存放。<br>当常量池无法再申请到内存时会抛出==OutOfMemoryError==异常。</p>\n<h2 id=\"13-其他区域\">1.3. 其他区域</h2>\n<p>直接内存（Direct Memory）<br>直接内存并不是虚拟机运行时数据区的一部分，也不是Java虚拟机规范中定义的内存区域。<br>这部分内存也可能导致OutOfMemoryError异常出现。</p>\n', 13, 0, 1, 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-27/f3eefe2a142b4a1bb7d06ef17affd12f.jpg', 1, '第2章 Java内存区域与内存溢出异常', '2019-03-09 17:11:05', '2020-05-27 06:19:39', 1, '4,5,6', 1, 0, NULL);

-- ----------------------------
-- Table structure for book_sense
-- ----------------------------
DROP TABLE IF EXISTS `book_sense`;
CREATE TABLE `book_sense`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `book_id` int(11) NULL DEFAULT NULL COMMENT '关联图书Id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '读后感' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型：0文章，1阅读',
  `rank` int(11) NULL DEFAULT NULL COMMENT '级别',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父主键',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `operation_category_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '漫谈', 0, 0, -1);
INSERT INTO `category` VALUES (2, '本站相关', 0, 1, 1);
INSERT INTO `category` VALUES (3, '关于', 0, 2, 2);
INSERT INTO `category` VALUES (4, '后端', 1, 0, -1);
INSERT INTO `category` VALUES (5, 'Java进阶', 1, 1, 4);
INSERT INTO `category` VALUES (6, 'JVM', 1, 2, 5);
INSERT INTO `category` VALUES (9, '后端', 0, 0, -1);
INSERT INTO `category` VALUES (11, 'Java基础', 0, 1, 9);
INSERT INTO `category` VALUES (12, '面试', 0, 2, 11);
INSERT INTO `category` VALUES (13, '微信操作', 0, 1, 9);
INSERT INTO `category` VALUES (14, '微信支付', 0, 2, 13);
INSERT INTO `category` VALUES (15, '微信授权', 0, 2, 13);
INSERT INTO `category` VALUES (16, '运维', 0, 0, -1);
INSERT INTO `category` VALUES (17, '文件服务器', 0, 1, 16);
INSERT INTO `category` VALUES (18, 'minio', 0, 2, 17);
INSERT INTO `category` VALUES (19, '前端', 0, 0, -1);
INSERT INTO `category` VALUES (20, 'Vue', 0, 1, 19);
INSERT INTO `category` VALUES (21, 'axios', 0, 1, 19);

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接名称',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '友链' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for log_like
-- ----------------------------
DROP TABLE IF EXISTS `log_like`;
CREATE TABLE `log_like`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点赞类型',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '点赞日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of log_like
-- ----------------------------
INSERT INTO `log_like` VALUES (1, 'article', '6', 0, '0:0:0:0:0:0:0:1', '2020-05-01 04:50:03');
INSERT INTO `log_like` VALUES (2, 'article', '1', 36, '27.18.85.133', '2020-05-18 13:09:53');
INSERT INTO `log_like` VALUES (3, 'article', '1', 6, '27.18.85.133', '2020-05-18 13:09:57');
INSERT INTO `log_like` VALUES (4, 'article', '1', 19, '27.18.85.133', '2020-05-18 13:10:00');
INSERT INTO `log_like` VALUES (5, 'article', '1', 7, '27.18.85.133', '2020-05-18 13:10:01');
INSERT INTO `log_like` VALUES (6, 'article', '1', 7, '221.232.204.113', '2020-05-21 04:46:43');
INSERT INTO `log_like` VALUES (7, 'article', '1', 10, '27.18.58.205', '2020-05-23 05:24:51');
INSERT INTO `log_like` VALUES (8, 'article', '1', 11, '27.18.58.205', '2020-05-23 05:24:55');
INSERT INTO `log_like` VALUES (9, 'article', '7', 38, '221.232.206.135', '2020-06-23 10:04:40');
INSERT INTO `log_like` VALUES (10, 'article', '1', 39, '113.118.103.75', '2020-08-03 03:01:08');

-- ----------------------------
-- Table structure for log_view
-- ----------------------------
DROP TABLE IF EXISTS `log_view`;
CREATE TABLE `log_view`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览类型',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '阅读日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of log_view
-- ----------------------------
INSERT INTO `log_view` VALUES (1, 'article', 'cn.dblearn.blog.portal.article.controller.ArticleController.getArticle()', '4', 22, '0:0:0:0:0:0:0:1', '2020-05-01 03:58:33');
INSERT INTO `log_view` VALUES (2, 'article', 'cn.dblearn.blog.portal.article.controller.ArticleController.getArticle()', '4', 225, '0:0:0:0:0:0:0:1', '2020-05-01 04:10:17');
INSERT INTO `log_view` VALUES (3, 'article', 'cn.dblearn.blog.portal.article.controller.ArticleController.getArticle()', '6', 5, '0:0:0:0:0:0:0:1', '2020-05-01 04:49:45');
INSERT INTO `log_view` VALUES (4, 'article', 'cn.dblearn.blog.portal.article.controller.ArticleController.getArticle()', '3', 123, '0:0:0:0:0:0:0:1', '2020-05-05 07:49:49');
INSERT INTO `log_view` VALUES (5, 'article', 'cn.dblearn.blog.portal.article.controller.ArticleController.getArticle()', '3', 28, '0:0:0:0:0:0:0:1', '2020-05-05 07:50:27');
INSERT INTO `log_view` VALUES (6, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '3', 1298, '127.0.0.1', '2020-05-05 07:52:56');
INSERT INTO `log_view` VALUES (7, 'book', 'cn.dblearn.blog.portal.book.controller.BookController.getBook()', '1', 16, '0:0:0:0:0:0:0:1', '2020-05-05 09:51:03');
INSERT INTO `log_view` VALUES (8, 'book', 'cn.dblearn.blog.portal.book.controller.BookController.getBook()', '1', 12, '0:0:0:0:0:0:0:1', '2020-05-05 09:51:10');
INSERT INTO `log_view` VALUES (9, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 466, '119.98.60.170', '2020-05-14 06:47:37');
INSERT INTO `log_view` VALUES (10, 'book', 'com.gaoh.modules.book.controller.BookController.getBook()', '1', 226, '119.98.60.170', '2020-05-14 06:47:44');
INSERT INTO `log_view` VALUES (11, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '3', 105, '119.98.60.170', '2020-05-14 06:48:15');
INSERT INTO `log_view` VALUES (12, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 54, '119.98.60.170', '2020-05-14 06:58:06');
INSERT INTO `log_view` VALUES (13, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '3', 66, '119.98.60.170', '2020-05-14 07:15:02');
INSERT INTO `log_view` VALUES (14, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '5', 134, '119.98.60.170', '2020-05-14 09:01:59');
INSERT INTO `log_view` VALUES (15, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 31, '119.98.60.170', '2020-05-14 11:01:09');
INSERT INTO `log_view` VALUES (16, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 25, '119.98.60.170', '2020-05-14 11:02:37');
INSERT INTO `log_view` VALUES (17, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 34, '119.98.60.170', '2020-05-14 11:03:02');
INSERT INTO `log_view` VALUES (18, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 34, '183.95.248.6', '2020-05-14 11:22:13');
INSERT INTO `log_view` VALUES (19, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 38, '183.95.248.6', '2020-05-14 11:49:47');
INSERT INTO `log_view` VALUES (20, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 31, '183.95.248.6', '2020-05-14 11:49:57');
INSERT INTO `log_view` VALUES (21, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 25, '183.95.248.6', '2020-05-14 11:50:09');
INSERT INTO `log_view` VALUES (22, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '4', 37, '183.95.248.6', '2020-05-14 12:04:23');
INSERT INTO `log_view` VALUES (23, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 31, '183.95.248.6', '2020-05-14 12:14:03');
INSERT INTO `log_view` VALUES (24, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 22, '27.18.85.133', '2020-05-14 14:22:41');
INSERT INTO `log_view` VALUES (25, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 88, '183.95.248.243', '2020-05-15 01:10:29');
INSERT INTO `log_view` VALUES (26, 'book', 'com.gaoh.modules.book.controller.BookController.getBook()', '1', 45, '183.95.248.243', '2020-05-15 01:11:04');
INSERT INTO `log_view` VALUES (27, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 29, '183.95.248.243', '2020-05-15 01:11:32');
INSERT INTO `log_view` VALUES (28, 'book', 'com.gaoh.modules.book.controller.BookController.getBook()', '1', 80, '42.236.10.78', '2020-05-15 01:11:43');
INSERT INTO `log_view` VALUES (29, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 29, '180.163.220.4', '2020-05-15 01:11:59');
INSERT INTO `log_view` VALUES (30, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '3', 23, '183.95.248.243', '2020-05-15 01:12:25');
INSERT INTO `log_view` VALUES (31, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '4', 29, '183.95.248.243', '2020-05-15 01:12:44');
INSERT INTO `log_view` VALUES (32, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 58, '27.18.85.133', '2020-05-16 15:04:49');
INSERT INTO `log_view` VALUES (33, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 58, '27.18.85.133', '2020-05-16 15:32:13');
INSERT INTO `log_view` VALUES (34, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 76, '27.18.85.133', '2020-05-16 15:34:19');
INSERT INTO `log_view` VALUES (35, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 31, '27.18.85.133', '2020-05-16 15:38:46');
INSERT INTO `log_view` VALUES (36, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 31, '27.18.85.133', '2020-05-16 15:46:15');
INSERT INTO `log_view` VALUES (37, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 21, '27.18.85.133', '2020-05-16 15:46:25');
INSERT INTO `log_view` VALUES (38, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 27, '27.18.85.133', '2020-05-16 15:49:17');
INSERT INTO `log_view` VALUES (39, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 79, '27.18.85.133', '2020-05-16 16:25:19');
INSERT INTO `log_view` VALUES (40, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '3', 82, '27.18.85.133', '2020-05-17 02:39:26');
INSERT INTO `log_view` VALUES (41, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 34, '27.18.85.133', '2020-05-17 02:39:50');
INSERT INTO `log_view` VALUES (42, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 22, '219.140.154.35', '2020-05-18 07:08:42');
INSERT INTO `log_view` VALUES (43, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 25, '219.140.154.35', '2020-05-18 07:09:51');
INSERT INTO `log_view` VALUES (44, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 45, '219.140.154.35', '2020-05-18 07:11:04');
INSERT INTO `log_view` VALUES (45, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 23, '219.140.154.35', '2020-05-18 07:12:24');
INSERT INTO `log_view` VALUES (46, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '3', 26, '27.18.85.133', '2020-05-18 13:09:30');
INSERT INTO `log_view` VALUES (47, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '4', 40, '221.232.204.113', '2020-05-20 01:41:40');
INSERT INTO `log_view` VALUES (48, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 18, '183.92.249.219', '2020-05-20 08:40:41');
INSERT INTO `log_view` VALUES (49, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 28, '180.163.220.4', '2020-05-20 08:41:18');
INSERT INTO `log_view` VALUES (50, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 87, '221.232.204.113', '2020-05-21 04:45:54');
INSERT INTO `log_view` VALUES (51, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 20, '221.232.204.113', '2020-05-21 04:46:28');
INSERT INTO `log_view` VALUES (52, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 61, '221.232.204.113', '2020-05-21 04:46:52');
INSERT INTO `log_view` VALUES (53, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 20, '27.18.85.133', '2020-05-21 15:43:44');
INSERT INTO `log_view` VALUES (54, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '3', 22, '27.18.85.133', '2020-05-21 15:49:37');
INSERT INTO `log_view` VALUES (55, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 24, '27.18.58.205', '2020-05-23 05:31:46');
INSERT INTO `log_view` VALUES (56, 'book', 'com.gaoh.modules.book.controller.BookController.getBook()', '1', 227, '27.18.58.205', '2020-05-23 06:51:26');
INSERT INTO `log_view` VALUES (57, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 48, '27.18.58.205', '2020-05-24 06:39:27');
INSERT INTO `log_view` VALUES (58, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 105, '219.140.123.56', '2020-05-26 03:27:05');
INSERT INTO `log_view` VALUES (59, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 70, '219.140.123.56', '2020-05-26 03:38:43');
INSERT INTO `log_view` VALUES (60, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 40, '219.140.123.56', '2020-05-26 03:38:53');
INSERT INTO `log_view` VALUES (61, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 43, '219.140.123.56', '2020-05-26 03:38:58');
INSERT INTO `log_view` VALUES (62, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 29, '111.172.33.102', '2020-05-27 03:58:41');
INSERT INTO `log_view` VALUES (63, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 34, '111.172.33.102', '2020-05-27 04:01:47');
INSERT INTO `log_view` VALUES (64, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 39, '111.172.33.102', '2020-05-27 04:23:13');
INSERT INTO `log_view` VALUES (65, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 24, '111.172.33.102', '2020-05-27 04:26:42');
INSERT INTO `log_view` VALUES (66, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 47, '111.172.33.102', '2020-05-27 04:29:13');
INSERT INTO `log_view` VALUES (67, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '3', 20, '111.172.33.102', '2020-05-27 04:32:07');
INSERT INTO `log_view` VALUES (68, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '4', 49, '111.172.33.102', '2020-05-27 04:32:17');
INSERT INTO `log_view` VALUES (69, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '5', 36, '111.172.33.102', '2020-05-27 04:32:33');
INSERT INTO `log_view` VALUES (70, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 27, '111.172.33.102', '2020-05-27 04:34:53');
INSERT INTO `log_view` VALUES (71, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 51, '111.172.33.102', '2020-05-27 04:36:20');
INSERT INTO `log_view` VALUES (72, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 44, '111.172.33.102', '2020-05-27 04:38:13');
INSERT INTO `log_view` VALUES (73, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 53, '111.172.33.102', '2020-05-27 05:07:27');
INSERT INTO `log_view` VALUES (74, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 60, '111.172.33.102', '2020-05-27 05:08:58');
INSERT INTO `log_view` VALUES (75, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 30, '111.172.33.102', '2020-05-27 05:10:18');
INSERT INTO `log_view` VALUES (76, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 22, '111.172.33.102', '2020-05-27 05:10:34');
INSERT INTO `log_view` VALUES (77, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 33, '111.172.33.102', '2020-05-27 05:18:14');
INSERT INTO `log_view` VALUES (78, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 26, '111.172.33.102', '2020-05-27 05:21:29');
INSERT INTO `log_view` VALUES (79, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 73, '111.172.33.102', '2020-05-27 05:24:49');
INSERT INTO `log_view` VALUES (80, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 80, '111.172.33.102', '2020-05-27 05:27:32');
INSERT INTO `log_view` VALUES (81, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 27, '111.172.33.102', '2020-05-27 05:28:58');
INSERT INTO `log_view` VALUES (82, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 65, '111.172.33.102', '2020-05-27 05:30:46');
INSERT INTO `log_view` VALUES (83, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 30, '111.172.33.102', '2020-05-27 05:33:11');
INSERT INTO `log_view` VALUES (84, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 44, '111.172.33.102', '2020-05-27 05:34:56');
INSERT INTO `log_view` VALUES (85, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 30, '111.172.33.102', '2020-05-27 05:36:00');
INSERT INTO `log_view` VALUES (86, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 56, '111.172.33.102', '2020-05-27 05:39:07');
INSERT INTO `log_view` VALUES (87, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 48, '111.172.33.102', '2020-05-27 05:40:07');
INSERT INTO `log_view` VALUES (88, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 32, '111.172.33.102', '2020-05-27 05:44:20');
INSERT INTO `log_view` VALUES (89, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 36, '111.172.33.102', '2020-05-27 05:45:02');
INSERT INTO `log_view` VALUES (90, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 39, '111.172.33.102', '2020-05-27 05:46:57');
INSERT INTO `log_view` VALUES (91, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 35, '111.172.33.102', '2020-05-27 05:53:21');
INSERT INTO `log_view` VALUES (92, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 24, '111.172.33.102', '2020-05-27 05:55:12');
INSERT INTO `log_view` VALUES (93, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 34, '111.172.33.102', '2020-05-27 05:55:51');
INSERT INTO `log_view` VALUES (94, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 25, '111.172.33.102', '2020-05-27 05:59:43');
INSERT INTO `log_view` VALUES (95, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 32, '111.172.33.102', '2020-05-27 06:01:33');
INSERT INTO `log_view` VALUES (96, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 24, '111.172.33.102', '2020-05-27 06:07:22');
INSERT INTO `log_view` VALUES (97, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 27, '111.172.33.102', '2020-05-27 06:08:41');
INSERT INTO `log_view` VALUES (98, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 30, '111.172.33.102', '2020-05-27 06:09:49');
INSERT INTO `log_view` VALUES (99, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 35, '111.172.33.102', '2020-05-27 06:11:44');
INSERT INTO `log_view` VALUES (100, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 28, '111.172.33.102', '2020-05-27 06:19:49');
INSERT INTO `log_view` VALUES (101, 'book', 'com.gaoh.modules.book.controller.BookController.getBook()', '1', 86, '111.172.33.102', '2020-05-27 06:20:30');
INSERT INTO `log_view` VALUES (102, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 22, '111.172.33.102', '2020-05-27 06:22:11');
INSERT INTO `log_view` VALUES (103, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 27, '111.172.33.102', '2020-05-27 06:41:18');
INSERT INTO `log_view` VALUES (104, 'book', 'com.gaoh.modules.book.controller.BookController.getBook()', '1', 43, '111.172.33.102', '2020-05-27 06:42:04');
INSERT INTO `log_view` VALUES (105, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 32, '111.172.33.102', '2020-05-27 06:42:36');
INSERT INTO `log_view` VALUES (106, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 66, '111.172.33.102', '2020-05-27 07:23:51');
INSERT INTO `log_view` VALUES (107, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 18, '111.172.33.102', '2020-05-27 07:24:39');
INSERT INTO `log_view` VALUES (108, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 26, '111.172.33.102', '2020-05-27 07:24:43');
INSERT INTO `log_view` VALUES (109, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 22, '111.172.33.102', '2020-05-27 07:38:48');
INSERT INTO `log_view` VALUES (110, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 23, '111.172.33.102', '2020-05-27 07:39:47');
INSERT INTO `log_view` VALUES (111, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 57, '111.172.33.102', '2020-05-27 07:43:25');
INSERT INTO `log_view` VALUES (112, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 25, '111.172.33.102', '2020-05-27 07:44:14');
INSERT INTO `log_view` VALUES (113, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 32, '111.172.33.102', '2020-05-27 07:45:40');
INSERT INTO `log_view` VALUES (114, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 80, '49.4.16.35', '2020-05-27 08:03:09');
INSERT INTO `log_view` VALUES (115, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 67, '183.95.250.248', '2020-05-27 10:26:48');
INSERT INTO `log_view` VALUES (116, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 27, '183.95.250.248', '2020-05-27 10:27:29');
INSERT INTO `log_view` VALUES (117, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 79, '111.172.33.222', '2020-05-28 00:37:07');
INSERT INTO `log_view` VALUES (118, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 30, '111.172.33.222', '2020-05-28 07:27:21');
INSERT INTO `log_view` VALUES (119, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 26, '121.35.184.85', '2020-05-28 07:27:41');
INSERT INTO `log_view` VALUES (120, 'bookNote', 'com.gaoh.modules.book.controller.BookNoteController.getBookNote()', '1', 24, '121.35.184.85', '2020-05-28 07:31:41');
INSERT INTO `log_view` VALUES (121, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 24, '121.35.184.85', '2020-05-28 07:32:51');
INSERT INTO `log_view` VALUES (122, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 25, '121.35.184.85', '2020-05-28 07:34:26');
INSERT INTO `log_view` VALUES (123, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 22, '121.35.184.85', '2020-05-28 07:35:26');
INSERT INTO `log_view` VALUES (124, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 30, '121.35.184.85', '2020-05-28 07:36:35');
INSERT INTO `log_view` VALUES (125, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 20, '121.35.184.85', '2020-05-28 07:37:40');
INSERT INTO `log_view` VALUES (126, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 85, '183.95.250.248', '2020-05-28 11:17:22');
INSERT INTO `log_view` VALUES (127, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 21, '183.95.250.150', '2020-05-29 12:25:09');
INSERT INTO `log_view` VALUES (128, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 29, '183.95.250.150', '2020-05-29 12:25:15');
INSERT INTO `log_view` VALUES (129, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 27, '42.236.10.114', '2020-05-29 12:25:31');
INSERT INTO `log_view` VALUES (130, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 92, '180.163.220.5', '2020-05-29 13:03:59');
INSERT INTO `log_view` VALUES (131, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 24, '59.174.250.93', '2020-06-02 07:17:41');
INSERT INTO `log_view` VALUES (132, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 22, '59.174.250.93', '2020-06-02 07:18:48');
INSERT INTO `log_view` VALUES (133, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 69, '59.174.250.93', '2020-06-02 07:47:41');
INSERT INTO `log_view` VALUES (134, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 21, '59.174.250.93', '2020-06-02 07:49:39');
INSERT INTO `log_view` VALUES (135, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 20, '183.95.251.50', '2020-06-02 10:52:44');
INSERT INTO `log_view` VALUES (136, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 25, '183.95.251.50', '2020-06-02 10:55:21');
INSERT INTO `log_view` VALUES (137, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 83, '180.163.220.3', '2020-06-02 22:30:42');
INSERT INTO `log_view` VALUES (138, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 19, '42.236.10.114', '2020-06-02 23:19:36');
INSERT INTO `log_view` VALUES (139, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 21, '111.172.29.202', '2020-06-04 01:06:48');
INSERT INTO `log_view` VALUES (140, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '8', 19, '111.172.30.141', '2020-06-05 09:28:41');
INSERT INTO `log_view` VALUES (141, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '8', 84, '27.18.84.160', '2020-06-11 14:33:35');
INSERT INTO `log_view` VALUES (142, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 24, '27.18.84.160', '2020-06-11 14:34:49');
INSERT INTO `log_view` VALUES (143, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 30, '27.18.84.160', '2020-06-11 15:21:20');
INSERT INTO `log_view` VALUES (144, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '8', 48, '111.175.49.12', '2020-06-12 08:29:13');
INSERT INTO `log_view` VALUES (145, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 35, '111.175.49.12', '2020-06-12 09:03:28');
INSERT INTO `log_view` VALUES (146, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 19, '39.100.11.163', '2020-06-15 04:25:07');
INSERT INTO `log_view` VALUES (147, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 90, '54.174.55.167', '2020-06-15 13:33:16');
INSERT INTO `log_view` VALUES (148, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 27, '66.249.79.175', '2020-06-17 23:08:42');
INSERT INTO `log_view` VALUES (149, 'book', 'com.gaoh.modules.book.controller.BookController.getBook()', '1', 37, '66.249.79.175', '2020-06-17 23:12:51');
INSERT INTO `log_view` VALUES (150, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '8', 67, '66.249.79.175', '2020-06-17 23:14:27');
INSERT INTO `log_view` VALUES (151, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 26, '66.249.79.175', '2020-06-21 00:48:35');
INSERT INTO `log_view` VALUES (152, 'book', 'com.gaoh.modules.book.controller.BookController.getBook()', '1', 35, '66.249.79.175', '2020-06-21 00:55:33');
INSERT INTO `log_view` VALUES (153, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '8', 21, '66.249.79.175', '2020-06-21 00:55:42');
INSERT INTO `log_view` VALUES (154, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 21, '66.249.79.175', '2020-06-21 00:55:46');
INSERT INTO `log_view` VALUES (155, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 16, '66.249.79.175', '2020-06-21 00:55:55');
INSERT INTO `log_view` VALUES (156, 'bookNote', 'com.gaoh.modules.book.controller.BookNoteController.getBookNote()', '1', 12, '66.249.79.177', '2020-06-21 00:56:06');
INSERT INTO `log_view` VALUES (157, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 19, '221.232.206.135', '2020-06-23 10:03:11');
INSERT INTO `log_view` VALUES (158, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 29, '221.232.206.135', '2020-06-23 10:04:27');
INSERT INTO `log_view` VALUES (159, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 23, '221.232.206.135', '2020-06-23 10:08:13');
INSERT INTO `log_view` VALUES (160, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 54, '221.232.206.135', '2020-06-23 10:25:19');
INSERT INTO `log_view` VALUES (161, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 19, '221.232.206.135', '2020-06-23 10:26:26');
INSERT INTO `log_view` VALUES (162, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 81, '119.97.241.202', '2020-06-23 14:27:17');
INSERT INTO `log_view` VALUES (163, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 34, '119.97.241.202', '2020-06-23 14:31:14');
INSERT INTO `log_view` VALUES (164, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 81, '183.92.250.38', '2020-06-23 14:47:08');
INSERT INTO `log_view` VALUES (165, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 23, '183.92.250.38', '2020-06-23 14:54:13');
INSERT INTO `log_view` VALUES (166, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 22, '183.92.250.38', '2020-06-23 15:00:22');
INSERT INTO `log_view` VALUES (167, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 68, '117.152.32.135', '2020-06-23 15:24:32');
INSERT INTO `log_view` VALUES (168, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 76, '27.17.92.185', '2020-06-23 17:54:15');
INSERT INTO `log_view` VALUES (169, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 85, '221.232.206.135', '2020-06-24 00:19:11');
INSERT INTO `log_view` VALUES (170, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 63, '171.113.108.30', '2020-06-25 01:20:35');
INSERT INTO `log_view` VALUES (171, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 22, '219.140.122.51', '2020-06-28 06:02:10');
INSERT INTO `log_view` VALUES (172, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 38, '219.140.122.51', '2020-06-28 06:02:33');
INSERT INTO `log_view` VALUES (173, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 18, '59.173.198.250', '2020-07-13 07:36:39');
INSERT INTO `log_view` VALUES (174, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 29, '59.173.198.250', '2020-07-13 07:38:50');
INSERT INTO `log_view` VALUES (175, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '8', 17, '59.173.198.250', '2020-07-13 07:40:43');
INSERT INTO `log_view` VALUES (176, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 16, '59.173.198.250', '2020-07-13 07:41:04');
INSERT INTO `log_view` VALUES (177, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 33, '171.113.113.152', '2020-07-13 16:11:27');
INSERT INTO `log_view` VALUES (178, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 75, '203.208.60.84', '2020-07-22 15:03:59');
INSERT INTO `log_view` VALUES (179, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 79, '203.208.60.66', '2020-07-22 16:54:03');
INSERT INTO `log_view` VALUES (180, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 59, '203.208.60.12', '2020-07-23 05:17:51');
INSERT INTO `log_view` VALUES (181, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 67, '203.208.60.119', '2020-07-23 08:00:32');
INSERT INTO `log_view` VALUES (182, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 43, '203.208.60.23', '2020-07-23 14:24:03');
INSERT INTO `log_view` VALUES (183, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 29, '171.113.112.250', '2020-07-23 16:11:58');
INSERT INTO `log_view` VALUES (184, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 68, '42.236.10.117', '2020-07-23 17:48:54');
INSERT INTO `log_view` VALUES (185, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 66, '203.208.60.63', '2020-07-24 13:56:45');
INSERT INTO `log_view` VALUES (186, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 54, '203.208.60.120', '2020-07-25 02:07:12');
INSERT INTO `log_view` VALUES (187, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 86, '203.208.60.97', '2020-07-25 12:06:01');
INSERT INTO `log_view` VALUES (188, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 16, '221.232.206.161', '2020-07-29 01:45:37');
INSERT INTO `log_view` VALUES (189, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '7', 157, '219.140.121.5', '2020-07-30 10:59:04');
INSERT INTO `log_view` VALUES (190, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '8', 71, '219.140.121.5', '2020-07-30 11:09:05');
INSERT INTO `log_view` VALUES (191, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 124, '219.140.121.5', '2020-07-31 01:29:52');
INSERT INTO `log_view` VALUES (192, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 91, '219.140.121.5', '2020-07-31 01:31:25');
INSERT INTO `log_view` VALUES (193, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 38, '219.140.121.5', '2020-07-31 05:55:57');
INSERT INTO `log_view` VALUES (194, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 55, '219.140.121.5', '2020-07-31 06:50:49');
INSERT INTO `log_view` VALUES (195, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 43, '113.71.154.199', '2020-07-31 12:00:58');
INSERT INTO `log_view` VALUES (196, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 93, '113.71.154.199', '2020-07-31 12:01:48');
INSERT INTO `log_view` VALUES (197, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 47, '113.71.154.199', '2020-07-31 12:25:00');
INSERT INTO `log_view` VALUES (198, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 29, '113.118.103.75', '2020-08-03 02:55:23');
INSERT INTO `log_view` VALUES (199, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 27, '113.118.103.75', '2020-08-03 03:01:00');
INSERT INTO `log_view` VALUES (200, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '6', 29, '113.118.103.75', '2020-08-03 03:05:01');
INSERT INTO `log_view` VALUES (201, 'article', 'com.gaoh.modules.article.controller.ArticleController.getArticle()', '1', 21, '219.140.122.153', '2020-08-03 03:09:37');

-- ----------------------------
-- Table structure for oss_resource
-- ----------------------------
DROP TABLE IF EXISTS `oss_resource`;
CREATE TABLE `oss_resource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '云存储资源表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oss_resource
-- ----------------------------
INSERT INTO `oss_resource` VALUES (1, '2003287.jpg', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-14/f76eea3642a846409e74b0fed73b7e36.jpg');
INSERT INTO `oss_resource` VALUES (2, '18a6c1d2ed47494396462901ffe02f30.jpg', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-14/a06f01864d4f4879a3b9da2050778b7b.jpg');
INSERT INTO `oss_resource` VALUES (3, 'mmqrcode1589453994525.png', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-14/6e9b5a7de9b8472c9bbbca8db5574025.png');
INSERT INTO `oss_resource` VALUES (4, '2003122.jpg', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-14/acf262a8c3444d8994f573de5b28b932.jpg');
INSERT INTO `oss_resource` VALUES (5, '2003368.jpg', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-16/8a8ec93362b24a14bab589798d3d3afd.jpg');
INSERT INTO `oss_resource` VALUES (6, '18a6c1d2ed47494396462901ffe02f30.jpg', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-16/b8347bb27dfd402eb777042380696fdc.jpg');
INSERT INTO `oss_resource` VALUES (7, '2003368.jpg', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-18/326efbfa118d4d89826c36f424681f61.jpg');
INSERT INTO `oss_resource` VALUES (8, '2014280.jpg', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-18/10a6e4cf75a04c7e928171bc9a6fb0e8.jpg');
INSERT INTO `oss_resource` VALUES (9, '2017460.jpg', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-18/7729757c9ffc4488a5fbaffcc6f2353a.jpg');
INSERT INTO `oss_resource` VALUES (10, '2.png', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-27/6500b7e0459b4124a6e67f01b71b5b8a.png');
INSERT INTO `oss_resource` VALUES (11, '3.png', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-27/734463e44f124a0990751c91fb48a342.png');
INSERT INTO `oss_resource` VALUES (12, '2018603.jpg', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-27/8fb64000c2ad4b4290705ae74f06d9cd.jpg');
INSERT INTO `oss_resource` VALUES (13, '4.png', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-27/48eb36d9e44c424e890f15ae81cd1a55.png');
INSERT INTO `oss_resource` VALUES (14, '2018576.jpg', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-05-27/f3eefe2a142b4a1bb7d06ef17affd12f.jpg');
INSERT INTO `oss_resource` VALUES (15, '1.png', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/102c6e0cad8145dbad92b7be91e42645.png');
INSERT INTO `oss_resource` VALUES (16, '2.png', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/83ca79da8d2a427ebbd2ca72d8ee4b98.png');
INSERT INTO `oss_resource` VALUES (17, '3.png', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/c8b9878cfa17411398f1911992548239.png');
INSERT INTO `oss_resource` VALUES (18, '4.png', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/5eba7c2871004ac78bee830314223ff6.png');
INSERT INTO `oss_resource` VALUES (19, '5.png', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/83b4f45eb34444af9f135860fcc50538.png');
INSERT INTO `oss_resource` VALUES (20, '6.png', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/17174abe5569485aa0d236c7945c5746.png');
INSERT INTO `oss_resource` VALUES (21, '7.png', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/31c0661ee83b4b8bbf46e6ecccff9bad.png');
INSERT INTO `oss_resource` VALUES (22, '8.png', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/474f7e36899a433ea09ed94767550ea2.png');
INSERT INTO `oss_resource` VALUES (23, 'logo.png', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-02/a0a2b49b33004bb18f3f7c77bfe47bce.png');
INSERT INTO `oss_resource` VALUES (24, 'e0baf2f38faf3181262a7efdffc1e6f.jpg', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-04/9467ba8323d44332bc1915c6b2d7121b.jpg');
INSERT INTO `oss_resource` VALUES (25, '311615.jpg', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-05/80e951f79f3c493b9f4910b03588f2ba.jpg');
INSERT INTO `oss_resource` VALUES (26, '1.png', 'https://gaohoos.oss-cn-beijing.aliyuncs.com/2020-06-05/cfa8bf95e02c43a588e332a781dcffe1.png');

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `link_id` int(11) NULL DEFAULT NULL COMMENT '推荐的文章Id',
  `type` int(11) NULL DEFAULT NULL COMMENT '推荐类型',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '顺序',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `top` tinyint(1) NULL DEFAULT 0 COMMENT '置顶',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '推荐' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES (3, 1, 0, 1, '关于本站和博主', 1);
INSERT INTO `recommend` VALUES (4, 1, 2, 2, 'Java虚拟机01——Java内存数据区域和内存溢出异常', 0);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `name` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `icon` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `order_num` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'config', 3);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'http://www.gaohblog.top:8000/blog/druid/sql.html', NULL, 1, 'config', 5);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (30, 0, '博文管理', NULL, NULL, 0, 'article', 0);
INSERT INTO `sys_menu` VALUES (31, 30, '新增博文', 'article/article-add-or-update', 'article:save,article:update', 1, 'add', 0);
INSERT INTO `sys_menu` VALUES (32, 30, '博文列表', 'article/article', NULL, 1, 'list', 0);
INSERT INTO `sys_menu` VALUES (33, 32, '删除', NULL, 'article:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (34, 32, '查看', NULL, 'article:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (38, 43, '分类管理', 'operation/category', NULL, 1, 'category', 6);
INSERT INTO `sys_menu` VALUES (39, 38, '查看', NULL, 'operation:category:list,operation:category:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (40, 38, '新增', NULL, 'operation:category:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (41, 38, '修改', NULL, 'operation:category:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (42, 38, '删除', NULL, 'operation:category:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (43, 0, '运营管理', NULL, NULL, 0, 'operation', 2);
INSERT INTO `sys_menu` VALUES (45, 1, '系统参数', 'sys/param', NULL, 1, 'param', 4);
INSERT INTO `sys_menu` VALUES (46, 45, '查看', NULL, 'sys:param:list,sys:param:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (47, 45, '新增', NULL, 'sys:param:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (48, 45, '修改', NULL, 'sys:param:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (49, 45, '删除', NULL, 'sys:param:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (50, 43, '标签管理', 'operation/tag', NULL, 1, 'tag', 6);
INSERT INTO `sys_menu` VALUES (51, 50, '查看', NULL, 'operation:tag:list,operation:tag:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (52, 50, '新增', NULL, 'operation:tag:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (53, 50, '修改', NULL, 'operation:tag:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (54, 50, '删除', NULL, 'operation:tag:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (61, 66, '图书管理', 'book/book', NULL, 1, 'list', 3);
INSERT INTO `sys_menu` VALUES (62, 61, '查看', NULL, 'book:list,book:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (63, 61, '新增', NULL, 'book:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (64, 61, '修改', NULL, 'book:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (65, 61, '删除', NULL, 'book:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (66, 0, '阅读管理', NULL, NULL, 0, 'read', 1);
INSERT INTO `sys_menu` VALUES (67, 66, '新增图书', 'book/book-add-or-update', '', 1, 'add', 1);
INSERT INTO `sys_menu` VALUES (68, 66, '笔记管理', 'book/note', NULL, 1, 'list', 2);
INSERT INTO `sys_menu` VALUES (69, 68, '查看', NULL, 'book:note:list,book:note:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (70, 68, '新增', NULL, 'book:note:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (71, 68, '修改', NULL, 'book:note:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (72, 68, '删除', NULL, 'book:note:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (73, 66, '新增笔记', 'book/note-add-or-update', '', 1, 'add', 0);
INSERT INTO `sys_menu` VALUES (74, 43, '友链管理', 'operation/link', NULL, 1, 'link', 6);
INSERT INTO `sys_menu` VALUES (75, 74, '查看', NULL, 'operation:link:list,operation:link:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (76, 74, '新增', NULL, 'operation:link:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (77, 74, '修改', NULL, 'operation:link:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (78, 74, '删除', NULL, 'operation:link:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (79, 43, '推荐管理', 'operation/recommend', NULL, 1, 'recommend', 6);
INSERT INTO `sys_menu` VALUES (80, 79, '查看', NULL, 'operation:recommend:list,operation:recommend:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (81, 79, '新增', NULL, 'operation:recommend:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (82, 79, '修改', NULL, 'operation:recommend:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (83, 79, '删除', NULL, 'operation:recommend:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (84, 32, '刷新缓存', NULL, 'article:cache:refresh', 2, NULL, 0);

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `par_key` int(11) NULL DEFAULT NULL,
  `par_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统参数' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_param
-- ----------------------------
INSERT INTO `sys_param` VALUES (2, 0, '一级', '/operation-category', 'CATEGORY_RANK');
INSERT INTO `sys_param` VALUES (3, 1, '二级', '/operation-category', 'CATEGORY_RANK');
INSERT INTO `sys_param` VALUES (4, 2, '三级', '/operation-category', 'CATEGORY_RANK');
INSERT INTO `sys_param` VALUES (7, 0, '小图片', '/article-addOrUpdate', 'ARTICLE_COVER_TYPE');
INSERT INTO `sys_param` VALUES (8, 1, '大图片', '/article-addOrUpdate', 'ARTICLE_COVER_TYPE');
INSERT INTO `sys_param` VALUES (9, 2, '无图片', '/article-addOrUpdate', 'ARTICLE_COVER_TYPE');
INSERT INTO `sys_param` VALUES (10, 0, '文章', NULL, 'MODULE_TYPE');
INSERT INTO `sys_param` VALUES (11, 1, '图书', NULL, 'MODULE_TYPE');
INSERT INTO `sys_param` VALUES (12, 2, '笔记', NULL, 'MODULE_TYPE');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'user', '用户', 1, '2020-05-27 06:25:37');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (64, 1, 30);
INSERT INTO `sys_role_menu` VALUES (65, 1, 31);
INSERT INTO `sys_role_menu` VALUES (66, 1, 32);
INSERT INTO `sys_role_menu` VALUES (67, 1, 33);
INSERT INTO `sys_role_menu` VALUES (68, 1, 34);
INSERT INTO `sys_role_menu` VALUES (69, 1, 84);
INSERT INTO `sys_role_menu` VALUES (70, 1, 66);
INSERT INTO `sys_role_menu` VALUES (71, 1, 61);
INSERT INTO `sys_role_menu` VALUES (72, 1, 62);
INSERT INTO `sys_role_menu` VALUES (73, 1, 63);
INSERT INTO `sys_role_menu` VALUES (74, 1, 64);
INSERT INTO `sys_role_menu` VALUES (75, 1, 65);
INSERT INTO `sys_role_menu` VALUES (76, 1, 67);
INSERT INTO `sys_role_menu` VALUES (77, 1, 68);
INSERT INTO `sys_role_menu` VALUES (78, 1, 69);
INSERT INTO `sys_role_menu` VALUES (79, 1, 70);
INSERT INTO `sys_role_menu` VALUES (80, 1, 71);
INSERT INTO `sys_role_menu` VALUES (81, 1, 72);
INSERT INTO `sys_role_menu` VALUES (82, 1, 73);
INSERT INTO `sys_role_menu` VALUES (83, 1, -666666);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `salt` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_user_id` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'cdac762d0ba79875489f6a8b430fa8b5dfe0cdd81da38b80f02f33328af7fd4a', '571002217@qq.com', 'YzcmCZNvbXocrsz9dm8e', '1', '2019-04-23 19:17:00', 1);
INSERT INTO `sys_user` VALUES (2, 'gaoh', 'e3378aa526d31359dd79a3ebd64538ed8e556ca6a317e79750d477999bf1954b', '2199382542@qq.com', 'qnW6sYXvFZYt2KhFlWkQ', '1', '2020-05-27 06:26:19', 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 2, 1);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名字',
  `type` int(11) NULL DEFAULT NULL COMMENT '所属类别：0文章，1类别',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, '本站相关', 0);
INSERT INTO `tag` VALUES (2, '关于', 0);
INSERT INTO `tag` VALUES (3, 'Java', 1);
INSERT INTO `tag` VALUES (4, 'JVM', 1);
INSERT INTO `tag` VALUES (5, 'Java', 2);
INSERT INTO `tag` VALUES (6, 'JVM', 2);
INSERT INTO `tag` VALUES (7, 'Java', 0);
INSERT INTO `tag` VALUES (8, '面试', 0);
INSERT INTO `tag` VALUES (9, 'ElasticSearch', 0);
INSERT INTO `tag` VALUES (10, 'Arthas', 0);
INSERT INTO `tag` VALUES (11, 'minio', 0);
INSERT INTO `tag` VALUES (12, 'axios', 0);

-- ----------------------------
-- Table structure for tag_link
-- ----------------------------
DROP TABLE IF EXISTS `tag_link`;
CREATE TABLE `tag_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag_id` int(11) NULL DEFAULT NULL COMMENT '标签Id',
  `link_id` int(11) NULL DEFAULT NULL COMMENT '关联Id',
  `type` int(11) NULL DEFAULT NULL COMMENT '所属类别：0文章，1阅读',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签多对多维护表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tag_link
-- ----------------------------
INSERT INTO `tag_link` VALUES (3, 3, 1, 1);
INSERT INTO `tag_link` VALUES (4, 4, 1, 1);
INSERT INTO `tag_link` VALUES (131, 5, 1, 2);
INSERT INTO `tag_link` VALUES (132, 6, 1, 2);
INSERT INTO `tag_link` VALUES (133, 7, 6, 0);
INSERT INTO `tag_link` VALUES (135, 11, 7, 0);
INSERT INTO `tag_link` VALUES (136, 12, 8, 0);
INSERT INTO `tag_link` VALUES (141, 1, 1, 0);
INSERT INTO `tag_link` VALUES (142, 2, 1, 0);

SET FOREIGN_KEY_CHECKS = 1;
