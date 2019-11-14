<template>
    <div id="bj" @click="dianji">
        <!-- 菜谱分类 --> 
        <div>
        <span>{{add[0]}}</span><br>
        <!-- 热门菜系 -->
            <van-row type="flex" justify="space-around">
                <van-col span="6">
                    <img  src="../../static/jstp/zaocan.jpg" alt="">
                    <div class="wz">早餐</div>
                </van-col>
                <van-col span="6">
                    <img src="../../static/jstp/yulei.jpg" alt="">
                    <div class="wz">健身餐</div>
                </van-col>
                <van-col span="6">
                    <img src="../../static/jstp/baby.jpg" alt="">
                    <div class="wz">儿童餐</div>
                </van-col>
                 <van-col span="6">
                    <img src="../../static/jstp/shucai.jpg" alt="">
                    <div class="wz">减肥餐</div>
                </van-col>
            </van-row>
        <span>{{add[1]}}</span><br>
        <!-- 一日三餐 -->
            <van-row type="flex" justify="space-around">
                <van-col span="6">
                    <img src="../../static/jstp/zaocan.jpg" alt="">
                    <div class="wz">早餐</div>
                </van-col>
                <van-col span="6">
                    <img src="../../static/jstp/wucan.jpg" alt="">
                    <div class="wz">午餐</div>
                </van-col>
                <van-col span="6">
                    <img src="../../static/jstp/wancan.jpg" alt="">
                    <div class="wz">晚餐</div>
                </van-col>
                 <van-col span="6">
                    <img src="../../static/jstp/yexiao.jpg" alt="">
                    <div class="wz">夜宵</div>
                </van-col>
            </van-row>
        <span>{{add[2]}}</span><br>
        <!-- 健身食品 -->
            <van-row type="flex" justify="space-around">
                <van-col span="6">
                    <img src="../../static/jstp/yulei.jpg" alt="">
                    <div class="wz">鱼类</div>
                </van-col>
                <van-col span="6">
                    <img src="../../static/jstp/shala.jpg" alt="">
                    <div class="wz">素菜类</div>
                </van-col>
                <van-col span="6">
                    <img src="../../static/jstp/jixiongrou.jpg" alt="">
                    <div class="wz">肉类</div>
                </van-col>
                 <van-col span="6">
                    <img src="../../static/jstp/danbaifen.jpg" alt="">
                    <div class="wz">蛋白粉</div>
                </van-col>
            </van-row>
        <span>{{add[3]}}</span><br>
        <!-- 特色菜系 -->
            <van-row type="flex" justify="space-around">
                <van-col span="6">
                    <img src="../../static/jstp/chuancai.jpg" alt="">
                    <div class="wz">川菜</div>
                </van-col>
                <van-col span="6">
                    <img src="../../static/jstp/yuecai.jpg" alt="">
                    <div class="wz">粤菜</div>
                </van-col>
                <van-col span="6">
                    <img src="../../static/jstp/sucai.jpg" alt="">
                    <div class="wz">苏菜</div>
                </van-col>
                 <van-col span="6">
                    <img src="../../static/jstp/lucai.jpg" alt="">
                    <div class="wz">鲁菜</div>
                </van-col>
        </van-row>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            add:["热门菜品","一日三餐","健身常备","特色菜系"]
        }
    },
    methods:{
        // 跳转
        dianji(e){
            if(e.target.nodeName=="IMG"){
                this.$router.push({path:'/BreakFast'})
    }
    }
    }
}
</script>
<style scoped>
    /* 定位 */
    van-row{
        position:absolute
    }
    /* bj整体布局 */
    #bj{
        text-align: center;
        margin-top: 20px;
    }
    /*图片样式*/
    img{
        width:80%;
        opacity:0.8;
        border-radius: 15px;
        overflow: hidden;
         cursor: pointer;
        transition: all 0.6s;
    }
    img:hover+.wz,img:hover{
       transform: scale(1.2);
    }

    /*图片样式*/
    
    span{
        display: block;
        margin: 15px 0 0 0;
    }
    /* 文字样式 */
    .wz{position: relative;
    top: -25px;color: white;
    margin: 0 10px 0 10px;
    background-color: rgba(0,0,0,0.2);
    border-radius:0 0 15px 15px;
     transition: all 0.6s;
    }
   
    
</style>