设置环境变量，新建ERLANG_HOME



修改环境变量path，增加Erlang变量至path，%ERLANG_HOME%\bin;
 

2、安装rabbitmq
 

本文选择解压缩安装rabbitmq-server-windows-3.7.7.zip

将rabbitmq-server-windows-3.7.7.zip解压缩至D:\Program Files目录下

设置环境变量，新建RABBITMQ_SERVER



修改环境变量path，增加rabbitmq变量至path，%RABBITMQ_SERVER%\sbin;

打开cmd命令框，切换至D:\Program Files\rabbitmq_server-3.7.7\sbin目录下，输入rabbitmqctl status



说明rabbmitmq未启动，继续下面操作。

安装插件，命令：rabbitmq-plugins.bat enable rabbitmq_management,出现：



解决方法： 
将 C:\Users\Administrator\.erlang.cookie 同步至C:\Windows\System32\config\systemprofile\.erlang.cookie 

同时删除：C:\Users\Administrator\AppData\Roaming\RabbitMQ目录

输入命令：rabbitmq-plugins.bat enable rabbitmq_management ，出现下面信息表示插件安装成功：



输入命令：rabbitmq-server.bat



rabbitmq启动成功，浏览器中http://localhost:15672，



输入guest,guest进入rabbitMQ管理控制台：



打开cmd，再次输入命令：rabbitmqctl status
 