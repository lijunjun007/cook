<template>
<!-- 早餐页面 -->
    <div id="bj">
        
        <!-- 头部导航 -->
       <van-nav-bar id="zuitop" fixed title="早餐" left-text="返回" @click-left="fanhui" left-arrow>
           <van-icon name="wap-home-o" slot="right" size="20px"/>
       </van-nav-bar>
            <!-- 下菜品 -->
            <div class="cp" v-for="(list,i) of foodList" :key="i">
                    <div>
                        <router-link class="cp2" :to="'/Details?fid='+list.fid">
                            <img class="cp3" @click="details" :src="'http://htcookbook.applinzi.com/'+list.img_url" alt="">
                        </router-link>
                    </div>
                <!-- 简介及其用户 -->
                <div class="jj">
                <van-row  type="flex">
                    <van-col span="20">
                        <div class="zt">
                        <span>{{list.food_name}}</span><br>
                            <small class="detl">
                                {{list.details}}
                            </small>
                        </div>
                    </van-col>
                    <van-col span="6" >
                        <!-- yh用户 -->
                        <div class="yh">
                            <img class="yhtx" :src="'http://htcookbook.applinzi.com/'+list.user_img" alt=""><br>
                            <small>{{list.username}}</small>
                        </div>
                    </van-col>
                </van-row>
                </div>
            </div>
             <van-button @click="loadMore" type="default" class="mini">{{more}}</van-button>
    </div>
</template>
<script>
import fun from "../assets/fun.js"
export default {
    data(){
        return{
            pno:0,
            foodList:[],
            isLoading: false,
            more:"加载更多"
        }
    },
    methods:{
        fanhui(){
            this.$router.go(-1)
            
        },
        details(){
        },  
        // 加载食谱
        loadMore(){
            this.pno++;
            fun.getFoods(this.pno,result=>{
                // this.foodList=result.data.data;
                if(result.data.code!=-1){
                    var rows=this.foodList.concat(result.data.data)
                    this.foodList=rows;
                }else{
                    this.$toast({
                        message:'亲！没有东西了',
                        duration:500
                    });
                    this.more="没有东西了";
                }
            })
            
        },
            
    },
    created(){
        this.loadMore();
    }
}
</script>
<style scoped>
    #zuitop{
        position: fixed;
        top:20px;
        background: rgb(238, 236, 235);
        border-bottom: 1px solid #ddd;
       
    }
    span{
        font-weight:1000
    }
    .yh{
        padding: 15%;
    }
    .yh>img{
        width: 80%;
        border-radius: 50%}
    /* 文本 */
    .zt{
        display: inline-block;
        height: 80px;
        overflow:hidden;
        text-align:left
    }
    /* 图片样式 */
    .cp+.cp{
        margin-top:30px;
        padding-top: 10px;
        background-color: rgb(238, 236, 235) 
    }
    .cp{
        padding-top: 80px;
        background-color: rgb(238, 236, 235) ;
    }
    
    .cp2>.cp3{width: 96%;
        margin: 0 5px 0 5px;
        border-radius:5px;
    }
    /* 文本块 */
    .jj{
        margin:10px 20px 10px 20px;
        
    }
    .yhtx{
        overflow: hidden;
         cursor: pointer;
        transition: all 0.6s;
    }
    .yhtx:hover{
        transform: scale(1.2);
    }
    .mini{
        font-size: 20px;
    }
    .detl{
        font-size: 14px;
    }
</style>