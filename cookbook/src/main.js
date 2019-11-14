// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'




Vue.config.productionTip = false

//1:完整引入element-ui组件库中所有组件
import ElementUI from 'element-ui';
//2:单引入element-ui库中样式文件
import 'element-ui/lib/theme-chalk/index.css';
//将ElementUI注册vue
Vue.use(ElementUI);

//1:完整引入mint-ui组件库中所有组件
import MintUI from "mint-ui"
//2:单引入mint-ui库中样式文件
import "mint-ui/lib/style.css"
//3:将mint-ui注册vue
Vue.use(MintUI)

//5:引入axios模块
import axios from "axios"
//6:配置服务器基础路径
axios.defaults.baseURL="http://htcookbook.applinzi.com/"
//7:配置保存session信息
axios.defaults.withCredentials=true
//8:axios 注册vue
Vue.prototype.axios = axios;

//9:完整引入Vant组件库中所有组件
import Vant from 'vant';
//10:单引入vant库中样式文件
import 'vant/lib/index.css';
//11:将mint-ui注册vue
Vue.use(Vant);
// 12.引入vuex第三方模块
import Vuex from "vuex";
// 13.先注册vuex
Vue.use(Vuex);


/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  render: h => h(App),
  template: '<App/>'
})
