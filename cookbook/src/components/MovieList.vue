<template>
    <div> 
        <span class="spantit">厨房故事</span>
      <div class="myzujian" v-for="(item,i) of list" :key="i"  >
         <span class="title">{{item.title}}</span> 
            <router-link class="my-img" :to="`/MovieDetails?mid=${item.mid}`">
              <img :src="`http://htcookbook.applinzi.com/`+item.movie_img" alt="">
              
              </router-link>
          <span class="footer">来自:{{item.zuoze}}</span>
       </div>  
       <van-button color="linear-gradient(to right, #4bb0ff, #6149f6)" v-if="isxian"  @click="loadMore">加载更多</van-button>
       <p v-else>已经到底了</p>
    </div>
</template>
<script>
import funs from "../assets/fun.js"
export default {
    data() {
        return {
            pno:0,
            list:[],
            mid:"",
            isxian:true
        }
    },
    methods:{
        loadMore(){
              this.pno++;
            funs.getMovieLise(this.pno,result=>{
                if(result.data.code!=-1){
                this.list= this.list.concat(result.data.data);
                }else{
                    this.isxian=false;
                  this.$toast('我是有底线的');
                }
            })
        }
    },
    created(){
        this.loadMore();
    },
}
</script>
<style scoped>
.spantit{
    font-size: 24px;
    font-weight: bold;
    display: block;
    margin-top: 28px;
}
.myzujian{
    margin-top: 5px;
    }
    .title{
        display:inline-block; 
        width:90%;
        font-size:18px;
        font-weight: 300;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        margin: 5px 0;
        text-align: left;
    }
    .my-img{
        width: 100%;
        height:206px;
    }
    .my-img img{
        width: 90%;
        border-radius:6px;
        height:206px;
    }
    .footer{
      display:inline-block;
      width: 90%;
      text-align: left; 
      font-size: 14px;
      font-weight: 300;
      margin: 5px 0 0 0;
    }
</style>
