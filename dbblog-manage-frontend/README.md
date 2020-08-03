# blog-manage-frontend

> 一个前后端分离的博客系统，这是后台管理的前端页面，基于Vue

## Build Setup

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build

# build for production and view the bundle analyzer report
npm run build --report

# run unit tests
npm run unit

# run e2e tests
npm run e2e

# run all tests
npm test
```
npm ERR! errno 1 npm ERR! chromedriver@2.35.0 install: `node install.js`问题解决，一条条的试

```shell
npm install chromedriver@2.35.0 --ignore-scripts
npm install chromedriver -g 
npm install chromedriver -- chromedriver_cdnurl=http://cdn.npm.taobao.org/dist/chromedriver
```



Module build failed: Error: ENOENT: no such file or directory问题

```shell
npm rebuild node-sass
```

For a detailed explanation on how things work, check out the [guide](http://vuejs-templates.github.io/webpack/) and [docs for vue-loader](http://vuejs.github.io/vue-loader).
