<template>
    
<!-- 详情页 -->
    <div id="DetailsPage">
        
        <div>
            <van-nav-bar  id="zuitop"  style="background-color:rgb(251, 244, 242)"  fixed title="菜谱详情" left-text="返回"
            @click-left="fanhui" color="black"   left-arrow>
              <!-- 点赞收藏弹出提示 后台加1-->
                <van-icon :style="{color:color}"  name="good-job" class="dz"  slot="right" size="25px"  @click="LoadZan"  />
                
                <van-icon :style="{color:color1}" class="sc" name="star" slot="right" size="25px"   @click="LoadSou"/>  
            </van-nav-bar>
        </div>
            <div class="cp">
                <img :src="src" alt="">  
            </div>
            <div class="cainame" >
                <p class="title">{{food_name}}</p>
                <small>已获{{this.foodid.zan}}个点赞</small>
                <small>{{b1}}人收藏</small><br>
                <div class="wb">
                    <!-- 简介-->
                    <small><img class="ms" src="../../static/breakfast/meishi.png" alt="">{{foodjs}}</small><br>
                </div>
            </div>
            <!-- 材料 -->
            <div class="cl">
                <van-row type="flex" justify="space-between">
                    <van-col span="12">材料</van-col>
                    <van-col span="12" class="jrcl">加入菜篮子</van-col>
                </van-row>
                <van-row v-for="(item,i) of foods" :key="i">
                    <van-col span="12" >
                        <ul >
                            <li>{{item.food}}</li>
                        </ul>
                    </van-col>
                    <van-col span="12">
                        <ul>
                            <li>{{item.weight}}</li>
                        </ul>
                    </van-col>
                </van-row>
            </div>
            <!-- 公告 -->
                <van-notice-bar  left-icon="volume-o">
                    {{notice}}
                </van-notice-bar>
            <!-- 烹饪步骤 -->
            <div style="border-top:1px black dashed;margin-top:10px">   
                <p>-&nbsp;烹饪步骤&nbsp;-</p>
                    <ol>
                        <li v-for="(a,i) of steps" :key="i">{{a}}</li>
                    </ol>
            </div>
            <div>
                <img src="../../static/breakfast/ggzs.jpg" alt="">
            </div>
    </div>
</template>
<script>
import fun from "../assets/fun.js"
export default {
    data(){
        return{
            b1:1,
           
            // 动态图片路径
            src:"",
            // 动态id获得的值
           foodid:'',
            // 动态名称
            food_name:[],
            // 动态功效
            foodjs:[],
            // 制作材料
            foods:[],
            // 公告内容
            notice:[],
            // 动态食谱步骤
            steps:[],
           
            
            // 点赞收藏颜色
            color:"#888877",
            color1:"#888877",
        }   
    },
    methods:{
        fanhui(){
            this.$router.go(-1)
        },
        // 判断是否点赞
        LoadZanIf(){
            //获取对应的id
            var fid=location.href;
            fid=fid.split("=")[1]
            fun.findZan(fid,result=>{
                if(result.data.code==1){
                     this.color="#E6BD1A"
                }
                if(result.data.code==-2){
                    this.color="#888877"
                }
            })
        },

        // 点击点赞 按钮
        LoadZan(){
            //获取对应的id
            var fid=location.href;
            fid=fid.split("=")[1]

            fun.findZan(fid,result=>{
                // 1.判断是否登录,如果未登录跳转登录页面
               if(result.data.code==-1){
                   this.$toast({
                    message:'请登录',
                    duration:1000
                    });
                this.$router.push("/login")
               }
            //    2.查看点赞状态
                // 2.1 记录为点赞状态
                if(result.data.code==1){
                    // 调用删除记录接口方法
                    this.foodid.zan--;
                    this.deleteZan(fid,this.foodid.zan)
                }
                // 2.1 记录为未点赞状态
                if(result.data.code==-2){
                    // 调用插入点赞记录接口方法
                    this.foodid.zan++;
                    this.insertZan(fid,this.foodid.zan);
                    
                }
              
            })
        },
        // 插入点赞记录
        insertZan(fid,zan){
            fun.insertZan(fid,zan,result=>{
                // 判断修改点赞成功,然后重新加载点赞查询方法
                if(result.data.code==1){
                    this.LoadZanIf();
                    this.$toast({
                message:'点赞成功',
                duration:1000
                });
                }
            })
        },
        // 删除点赞记录
        deleteZan(fid,zan){
            fun.delZan(fid,zan,result=>{
                // 判断取消点赞成功,然后修改点赞次数
                if(result.data.code==1){
                    this.LoadZanIf();
                    this.$toast({
                message:'取消点赞',
                duration:1000
                });
                }
            })
        },
        LoadSou(){          
            this.color1="#E6BD1A"
           
            this.$toast({
                message:'收藏成功',
                duration:500
                });
    
            },
        loadDetails(){
            //获取对应的id
            var fid=location.href;
            fid=fid.split("=")[1]
            // 发送请求
            fun.getFoodById(fid,result=>{
              
                // 获取id对应的菜谱所有内容
                this.foodid=result.data.data[0]
                // 制作步骤赋值制作材料赋值
                this.steps=JSON.parse(this.foodid.steps)
                // 功效赋值
                this.foodjs=this.foodid.details
                //名称赋值
                this.food_name=this.foodid.food_name
                // 图片地址赋值
               this.src='http://htcookbook.applinzi.com/'+this.foodid.img_url;
                //材料赋值
               this.foods=JSON.parse(this.foodid.foods)
                // 公告啊赋值
                this.notice=this.foodid.notice;
                
            })
        } 

    },
    created(){
        this.loadDetails(),
        this.LoadZanIf()
        
    }
}
</script>
<style scoped>
    #zuitop{
        position: fixed;
        margin-top: 20px;
    }
    .jrcl{
        color: darkorange
    }
    p{
            font-weight:1000
        }
    .ms{
        width: 10%
    }
    .cainame{
        border-bottom:1px black dashed;
        margin-bottom:10px;
    }
    .cainame>small{
        padding-bottom:10px;
        border-bottom: dashed 1px;
        margin-left:15px;
    }
    #DetailsPage{
        background-color: rgb(238, 236, 235);
        padding-top: 0px;
    }

    .cl,ol>li{
        margin: 0 20px 20px 20px;
        text-align: center;
    }
    
    .wb {
        margin: 25px;
        text-align:left;
    }

    .cp>img{
        margin-top: 88px;
    }

    /* 开头图片样式 */
   img{
       width: 96%;
        margin: 0 5px 0 5px;
        border-radius:5px;
        overflow: hidden;
         cursor: pointer;
        transition: all 0.6s;
    }
    img:hover{
         transform: scale(1.2);
    }
    
        /*材料样式 */
    
    ul>li{
        padding: 3px 0 3px 0;
        color: #6f5349
        
    }
    small{
        font-size: 16px;
    }
    /* 菜谱名字 */
    .title{
        font-size: 20px;
    }
    .dz{
        margin-right: 10px;
    }
</style>