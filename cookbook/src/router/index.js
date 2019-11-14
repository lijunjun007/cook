import Vue from 'vue'
import Router from 'vue-router'
// 引入注册组件
/* 付雪丽 */
import Index from "../components/index/Index.vue" //主页面
/* 李军 */
import Register from "../components/Register.vue" //注册页面
import Cart from "../components/Cart.vue" //菜篮子
import Login from "../components/Login.vue" //登录
import History  from "../components/History.vue"  //历史记录
import Collect  from "../components/Collect.vue" //收藏
/* 陈修浩 */
import BreakFast  from "../components/BreakFast.vue" //
import Details  from "../components/Details.vue" //
/* 肖中秋 */
import MovieDetails from '../components/MovieDetails.vue'//
import ZhuJian from '../components/zhujian.vue'//

Vue.use(Router)

export default new Router({
  routes: [
    /* 付雪丽 */
    {path: '/',name: 'Index',component: Index},
    {path: '/Index',component: Index},//主页面
    /* 李军 */
    {path: '/Register',component: Register},
    {path: '/Login',component: Login},
    {path: '/Cart',component: Cart},
    {path: '/History',component: History},
    {path: '/Collect',component: Collect},
    /* 陈修浩 */
    {path: '/BreakFast',component: BreakFast},
    {path: '/Details',component: Details},
    /* 肖中秋 */
    {path: '/MovieDetails',component: MovieDetails},
    {path: '/ZhuJian',component: ZhuJian},
  ],
  scrollBehavior (to, from, savedPosition) {
      return { x: 0, y: 0 }
  }
})
