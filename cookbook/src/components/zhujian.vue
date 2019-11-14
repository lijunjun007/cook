<template>
    <div class="zhujian">
        <!-- <router-link to="/"><img class="title_img" src="../../static/img/xy.png" alt=""></router-link>
        <span class="title_span">{{title}}</span>
        <router-link to="/"><img class="title_log" src="../../static/img/logo.jpg" alt=""></router-link> -->
       
        <van-nav-bar class="top" fixed :title="title" left-text="返回" @click-left="fanhui" left-arrow>
           <van-icon @click="go"  name="wap-home-o" slot="right" size="20px"/>
       </van-nav-bar>
    </div>
</template>
<script>
export default {
    props:["title"],
    methods:{
        fanhui(){
            this.$router.go(-1)
        },
        go(){
            this.$router.push('/')
        }
    }

}
</script>
<style scoped>
.title_img,.title_log{
    width: 32px;
    margin: 10px 0 0 5px;
    display:inline-block;
    margin-right: 20%;
}
.title_span{
font-size: 16px;
font-weight: bold;
display: inline-block;
width: 35%;
text-align: center;
overflow: hidden;
white-space: nowrap;
line-height: 50px;
}
.zhujian{
    margin-bottom: 40px;
    text-align: left;
    display: flex;
    justify-content: space-between;
    width: 98%
}
.top{
    top:15px;
    position: fixed;
    margin-bottom: 20px;
}
</style>