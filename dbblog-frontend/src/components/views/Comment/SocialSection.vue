<template>
  <div class="social-section">
    <div id="gitalk-container" v-if="show"></div>
    <!--<div id="SOHUCS" :sid="type+postId"></div>-->
  </div>
</template>

<script type="text/ecmascript-6">
import BrowseMore from '@/components/views/BrowseMore'

export default {
  props: {
    type: String,
    postId: Number
  },
  data () {
    return {
      show: null
    }
  },
  components: {
    'browse-more': BrowseMore
  },
  watch: {
    postId (value) {
      this.show = value
      this.$nextTick(() => {
        // eslint-disable-next-line no-undef
        var gitalk = new Gitalk({
          clientID: '36d4801d5253f0f35bff',
          clientSecret: '1b454b3b9126e4b7f2bd85f8f2ff4ef8f4c23638',
          repo: 'blog-gitalk-comment',
          owner: 'GitSorcerer',
          labels: [this.type],
          admin: ['GitSorcerer'],
          id: location.href, // Ensure uniqueness and length less than 50
          distractionFreeMode: false // Facebook-like distraction free mode
        })
        gitalk.render('gitalk-container')
      })
    }
  }
  // mounted () {
  // 畅言插件电脑端
  // if (document.body.clientWidth > 768) {
  //   window.changyan = undefined
  //   window.cyan = undefined
  //   this.$loadScript(null, 'https://changyan.sohu.com/upload/changyan.js', () => {
  //     window.changyan.api.config({
  //       appid: 'cyukGLEb1', // 此处换成你的畅言应用的appid,
  //       conf: 'prod_4bfbafbc1dfd8e1854aa10135fef9bf9' // 此处换成你畅言应用的conf。
  //     })
  //   })
  // // 手机端
  // } else {
  //   let script = document.createElement('script')
  //   script.id = 'changyan_mobile_js'
  //   this.$loadScript(script, 'https://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=cyukGLEb1&conf=prod_4bfbafbc1dfd8e1854aa10135fef9bf9', () => {})
  // }
  // // 加载畅言评论框及评论数
  // this.$loadScript(null, 'https://assets.changyan.sohu.com/upload/plugins/plugins.count.js', () => {})
  // },
  // 此方法是路由跳转时移除畅言插件
  // beforeDestroy () {
  //   try {
  //     // eslint-disable-next-line no-useless-escape
  //     const removeRep = /^http(s)?\:\/\/changyan\./
  //     const $head = document.getElementsByTagName('head')[0] || document.head || document.documentElement
  //     const $script = $head.querySelectorAll('script')
  //     $script.forEach((item, index) => {
  //       const src = item.getAttribute('src')
  //       if (src && removeRep.test(src)) {
  //         $head.removeChild(item)
  //       }
  //     })
  //     for (const key in window) {
  //       if (/^(changyan(\d)?|cyan)/.test(key)) {
  //         window[key] = undefined
  //       }
  //     }
  //   } catch (error) {}
  // }
}
</script>
