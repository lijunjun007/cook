<template>
  <div class="parent">
    <!-- 1.顶部搜索框 -->
    <div class="top">
      <div class="logo">
        <img src="../../assets/logo.jpg">
      </div>
      <div class="text">
        <span>减肥食谱</span>
      </div>
      <div class="search">
        <searchimg-tag></searchimg-tag>
      </div>
    </div>
    <!-- 2.轮播图 -->
    <van-swipe :autoplay="3000">
      <van-swipe-item v-for="(image, index) in images" :key="index">
        <img :src="image" />
      </van-swipe-item>
    </van-swipe>
    <!-- 3.宫格 -->
    <div class="grid">
      <van-grid :column-num="4" clickable >
        <van-grid-item>
          <van-image :src="require('../../assets/jiankangshipu.png')" />食物库
        </van-grid-item>
        <van-grid-item >
          <van-image :src="require('../../assets/qingshi.png')" />轻食
        </van-grid-item>
        <van-grid-item>
          <van-image :src="require('../../assets/zhuyi.png')" />注意
        </van-grid-item>
        <van-grid-item>
          <van-image :src="require('../../assets/yaling.png')" />测一测
        </van-grid-item>
      </van-grid>
    </div>
    <!-- 4.滑动 -->
    <div class="tuijian">
      <div class="jinri">
        <div class="floor">
          <h4>今日推荐</h4>
          <span @click="loadMore">换一换</span>
        </div>
        <div class="jinri-content" v-for="(item,index) of list" :key="index">
          <router-link :to="`/details?fid=${item.fid}`">
            <img :src="`http://htcookbook.applinzi.com/${item.img_url}`" />
          </router-link>
          <span class="food_name">{{item.food_name}}</span>
        </div>
      </div>
      <div class="mingxing">
        <div class="floor">
          <h4>明星推荐</h4>
          <span @click="loadMovie">换一换</span>
        </div>
        <div class="mingxing image2">
          <div class="mingxing-content" v-for="(item,index) of movie" :key="index">
            <router-link :to="`/MovieDetails?mid=${item.mid}`">
              <img :src="`http://htcookbook.applinzi.com/${item.movie_img}`" />
            </router-link>
            <div class="content">
              <h4>视频:{{item.title}}</h4>
              <span>作者:{{item.zuoze}}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import fun from "../../assets/fun.js"
import SearchImg from "./SearchImg.vue"
export default {
  data(){
    return{
      images: [ //轮播图的路径
       require('../../../static/img/zhengdan.jpg'),
       require('../../../static/img/jiroushala.jpg'),
       require('../../../static/img/jiaozi.jpg'),
       require('../../../static/img/xibing.jpg'),
      ],
      /* 今日推荐 */
      pno:0,
      list:[], 
      /* 明星推荐 */
      movie:[]
    }
  },
  methods:{
    // // 更换视频数据
    // changeMovie(){
    //   this.loadMovie();
    // },
    // // 更换食谱数据
    // changeFood(){
    //   this.loadMore();
    // },
    //加载食谱数据
    loadMore(){
      this.pno++;
      if(this.pno>3){
        this.pno=1;
      }
      fun.getToday(this.pno,result=>{
        this.list=result.data.data;
      })
    },
    //加载视频数据
    loadMovie(){
      this.pno++;
      if(this.pno>2){
        this.pno=1;
      }
      fun.getMovie(this.pno,result=>{
        this.movie=result.data.data;
      })
    }
  },
  created(){
    this.loadMore();
    this.loadMovie();
  },
  components:{
    "searchimg-tag":SearchImg
  }
  
}
</script>



<style scoped>
  /* 最外层父元素 */
  .parent{
    margin-top: 20px;
    background-color: rgba(248,248,248,1);
    padding-top: 10px;
  }
  /* 1.顶部搜索框父元素样式 */
  .top{
    display:flex;
    width:95%;
    justify-content: space-between;
    border-bottom:1px solid #bfbfbf;
    padding-left: 5%;
    margin-bottom: 5%;
  }
  /* 搜索框 */
  .top>.search{
    padding-right:10px;
  }
  /* 2.轮播图图片样式 */
  .van-swipe-item img{
    width:90%;
    border-radius: 8px;
  }
  /* 3.宫格样式 */
  div.grid{
    border-radius: 8px;
    margin: 8%;
    margin-top:-6%;
    margin-bottom: 0;
  }
  /* 4.推荐 */
  .floor{
    display: flex;
    justify-content: space-between;
    padding:10px 20px;
    margin:3% 0;
    width:100%;
    border-bottom:1px solid #ddd;
  }
  .floor h4{
    margin: 0;
  }
  .floor span{
    font-size: 14px;
  }
  
  /* 5.今日推荐 */
  .jinri,.mingxing{
    width:100%;
    display:flex;
    flex-wrap: wrap;
    justify-content: space-around;
  }
  .jinri-content{
    display: block;
    width:45%;
    margin-top:15px;
  }
  .jinri-content a{
    width: 100%;
    height:96px;
  }
  .jinri-content img,.mingxing-content img{
    width:100%;
    border-radius: 5px;
  }
  .food_name{
    font-size: 14px;
  }
  /* 6.明星推荐 */
  .mingxing-content{
    width:100%;
    height:130px;
    display: flex;
    justify-content: space-around;
    align-items: center;
  }
  .mingxing-content a{
    display: block;
    width:45%;
  }
  .mingxing-content img{
    width:100%;
  }
  .content{
    width:45%;
    text-align: left;
  }
  .content h4{
    overflow: hidden;
    margin:10px 0;
    white-space:nowrap;
    text-overflow:ellipsis;
  }
  /* 7.宫格的默认样式 */
  .parent >>> [class*=van-hairline]::after{
    border:none;
  }
  .parent >>> .van-grid-item__content::after{
    border-width:none;
  }
  .parent >>> .van-grid-item__content{
    border:2px solid #fff;
  }
  .parent >>> .van-grid.van-hairline--top{
    border-radius: 10px;

  }
</style>