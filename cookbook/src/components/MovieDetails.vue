<template>
    <div class="details">
        <div class="content" v-for="(item,i) of list" :key="i">
            <zhujian :title="item.title"></zhujian>
            <span class="title">{{item.title}}</span> 
            <p class="t-title">
                <span class="tiltezz">作者:{{item.zuoze}}</span>
                <span class="titledate">{{item.date_time}}26 </span>
            </p>
            <video class="mysp" :src="`http://htcookbook.applinzi.com/${item.movie_url}`" controls  :poster="`http://htcookbook.applinzi.com/${item.movie_img}`"></video>
            <!-- <span class="footer">{{item.details}}</span> -->
            <span class="text-left">{{item.title}}的做法</span>
            <ul v-for="(item,a) of details" :key="a" class="steps">
                <li>{{item}}</li>
            </ul>
            <router-link :to="`/MovieDetails?mid=${parseInt(mid)-1}`">
              <span class="footspan" :class="myspan">上一篇:{{titl}}</span>
            </router-link>
            <router-link :to="`/MovieDetails?mid=${parseInt(mid)+1}`">
              <span class="footspan" :class="myxpan">下一篇:{{tit}}</span>
            </router-link>
            <p class="footp">厨房评论</p>
            <!-- 评论区 -->
            <div class="pinglun">
                <input type="text" :disabled="disable" placeholder="想说点什么" class="footinput" v-model="ping_value"/>
                <!-- 未登录显示span 已登录隐藏span -->
                <span class="ping_span" :class="spanlog">发表评论,你需要 
                    <router-link to="/login">登录</router-link>或
                    <router-link to="/register">注册</router-link>
                </span>
                <van-button class="mybtn" round type="info" @click="getinit" :disabled="disable">评论</van-button>
            </div>
        </div>
        <!-- 用户评论显示区 -->
        <div class="comment" :class="myping"  v-for="(item,a) of ping_lun" :key="a+'i'" >
            <div class="dimg">
                <img src="../../static/img/usen.png" alt="">
            </div>
            <div class="dspan">
                <span>{{item.nickname}}</span>
                <span>{{item.time}}</span>
                <p>{{item.content}}</p>
            </div>
        </div>
    </div>
</template>
<script>
import funs from "../assets/fun.js"
import zhujian from "./zhujian.vue"
export default {
    data() {
        return {
            list:[],
            myspan:{   //设置上一篇class为ture或false
                spannone:Boolean
            },
            myxpan:{  //设置下一篇的class为ture或false
                spannone:Boolean
            },
            mid:"",//当前页面id
            title:"",//当前页面标题
            titl:"",//上一篇标题
            tit:"",//下一篇标题
            ping_lun:[],//保存已评论数据
            ping_value:"",//获取用户输入评论内容
            myping:{   //视频没有评论就不显示评论区
                spannone:Boolean
            },
            spanlog:{  //用户登录成功设置隐藏跳转注册和登录页
                spannone:Boolean
            },
            disable:false, //当前用户未登录就禁用评论和输入框
            details:"",
        }
    },
    components:{
        "zhujian":zhujian
    },methods: {
        loadMore(){
            this.mid=location.href.split("=")[1];//获取当前页id
            var mid=this.mid
            funs.getMovieDrails(this.mid,result=>{  //发送请求获取当前id的数据
                if(result.data.code==1){

                    this.list=result.data.data
                    this.details=JSON.parse(this.list[0].details);
                    if(this.mid==1){   //判断id为1时 上一篇隐藏
                        this.myspan.spannone=true;
                    }else{
                       this.myspan.spannone=false; 
                    }
                }
            }); 
            var next=parseInt(this.mid)+1  //发送请求获取当前id+1 的标题放入下一篇的span中
            funs.getMovieDrails(next,result=>{
            if(result.data.code!==-1){  //当下一遍没有数据后就隐藏下一篇标题
                this.myxpan.spannone=false; 
                this.tit=result.data.data[0].title
            }else{
                this.myxpan.spannone=true;
            }  
         });
                var prev=parseInt(this.mid)-1
                if(prev>0){
                   funs.getMovieDrails(prev,result=>{
                this.titl=result.data.data[0].title
                });
            }
             funs.getMovieCritical(mid,result=>{ //发送请求获取当前id用户评论内容
        //判断返回数据code查询成功显示评论区 否则code为-1没有数据隐藏评论区 
                if(result.data.code==1){
                  this.ping_lun=result.data.data
                  this.myping.spannone=false;
                }else{
                this.myping.spannone=true;
                }
              })
              //发送求判断当前用户是否登录
              funs.getLogin(result=>{
                  if(result.data.code==-1){ //用户未登录禁用输入框和评论按钮
                      this.disable=true;
                      this.spanlog.spannone=false;
		      if(document.querySelector(".footinput")){
			document.querySelector(".footinput").placeholder="";
		      }
                  }else if(result.data.code==1){//用户登录隐藏跳转登录注册页按钮和取消禁用输入框评论按钮
                    this.disable=false;
                    this.spanlog.spannone=true;
		    if(document.querySelector(".footinput")){
			document.querySelector(".footinput").placeholder="说点什么咯";
			
		    }
                  }
              })
        },
    getinit(){  //获取当前用户评论是的时间 
        var date=new Date();
        var year=date.getFullYear();//年
        var month=date.getMonth()+1;//月
        var day=date.getDate();     //日
        var hh=date.getHours();     //时
        var mm=date.getMinutes();   //分
        var ss=date.getSeconds();   //秒
        var time=year+"年"+month+"月"+day+"日"+hh+":"+mm+":"+ss;
        //获取当前用户评论内容
        var content=this.ping_value
        var mid=this.mid
        if(content!=""){ //判断用户是否输入评论内容
        var arr={
            time,
            content,
            mid
        }
        funs.insertComment(arr,result=>{ //发送请求提交评论
            if(result.data.code==1){
                this.$toast('评论成功');
                this.loadMore();
                this.ping_value="";//评论成功清空input内容
            }else{
                this.$toast('提交评论中...');
            }
        })
      }else{
        this.$toast('请输入评论内容');
        return;
      }
    }
    },
    created(){
            this.loadMore();
    },
    watch:{
      $route(){
            this.loadMore();
        }
    },
}
</script>
<style scoped>

.text-left{
    width:100%;
    display: block;
    text-align: left !important;
    font-size: 20px;
    color: #333;
    padding:3px 10px;
    margin-top: 10px;
}

.steps{
    text-align: left;
    padding:3px 10px;
}
.details{
    padding:0 10px;
    margin-top:0px;
}
.t-title{
    text-align: left;
}
.title{
        display:inline-block; 
        /* width:50%; */
        font-size:20px;
        font-weight: bold;
        white-space: pre-wrap;
        text-align: left;
        margin-left: 8px;
        padding-top: 20px;
        }
.tiltezz{
    display: inline-block;
    /* width:70%; */
    margin-left: 10px;
}
.titledate{
    display: inline-block;
    text-align: left;
    width: 96%;
    margin: 5px 10px;
    }
.mysp{
    width: 96%;
    height: 206px;
    object-fit: fill;
}
.footer{
display: inline-block;
text-align: left;
width: 96%;
margin-top: 10px;
}
.footspan,.footp{
    display:inline-block;
    text-align: left;
    width: 96%;
    margin: 10px 0;
}
.footspan{
    font-weight: bold;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.spannone{
    display: none !important;
}
.footp{
    font-size: 20px;
    font-weight: bold;
}
.mybtn{
width: 20%;
background-color:#ffc000;
color:#fff;
font-size: 16px;
height: 32px;
line-height: 32px;
}
.footinput{
    width: 70%;
    display: inline-block;
   border:none;
   border-bottom: 0.5px solid #000;
}
.comment{
display: flex;
justify-content: space-around;
margin-top:15px; 
width: 96%;
}
.comment .dimg{
    width: 54px;
    height: 54px;
    margin: 0 10px;
}
.comment .dimg img{
width: 54px;
height: 54px;
border-radius: 50%;
vertical-align:bottom;
}
.comment .dspan{
    width: 96%;
    height: 53px;
    white-space: nowrap;
    text-align: left;
}
.comment .dspan>span:first-child{
    font-family: 苹方-简 常规体;
    font-size: 16px;
    font-weight: bold;
    color: #333;
    line-height: 21px;
    margin-right: 9px;
}
.comment .dspan>span:nth-child(2){
    color:#999;
    font:12px 苹方-简 常规体;
}
.comment .dspan>p:last-child{
    margin-top: 10px;
    font:14px 苹方-简 常规体;
    color: #333;
    width: 96%;
    white-space:pre-wrap;
}
/*评论区设置输入框中登录或注册*/
.pinglun{
    position: relative;
}
.ping_span{
    position: absolute;
    top: 0;
    left: 5%;
}
</style>