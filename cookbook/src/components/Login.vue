<template>
    <div class="container">
    <van-row>
        <van-col span="4"><router-link to="/" @click="go">返回</router-link></van-col>
        <van-col span="10" offset="4">密码登录</van-col>
    </van-row>

<!-- 输入手机号-->
<van-row class="marginT25 utel">
    <van-col span="3">
        <div class="imgdiv">
            <img src="../assets/img/register/shouji.png" alt="">
        </div>
    </van-col>
        <!-- 输入栏 -->
    <van-col span="21">
        <van-cell-group>
            <van-field v-model="utel"  placeholder="手机号/Email" />
        </van-cell-group>
        <!-- 手机号码验证信息 -->   
        <span class="msg">{{utelMsg}}</span>
    </van-col>
</van-row>

<!-- 密码输入框-->
<van-row class="marginT25 upwd">
    <van-col span="3">
        <div class="imgdiv">
            <img src="../assets/img/register/mima.png" alt="">
        </div>
    </van-col>
    <!-- 输入栏 -->
    <van-col span="21">
        <van-cell-group>
            <van-field v-model="upwd" type="password"  placeholder="密码(区分大小写)" />
        </van-cell-group>
        <!-- 密码验证信息 -->
        <span class="msg">{{upwdMsg}}</span>
    </van-col>
</van-row>
<!-- 登录按钮 -->
<van-button  class="btn" @click="login" color="#FFD700">登录</van-button>
<p class="pLeft" @click="goReg">没有账号，前往注册？</p>
    </div>
</template>
<script>
import fun from "../assets/fun"
export default {
    data(){
        return{
            utel:"",//用户名
            upwd:"",//密码
            utelMsg:"",//用户名验证提示
            upwdMsg:"",//密码验证提示
        }
    },
    methods:{
        // 返回按钮
        go(){
            this.$router.go(-1);
        },
        //前往注册
        goReg(){
            this.$router.push("/Register");
        },
        // 用户名utel失去焦点验证
        checkUtel(){
            var utelMsg=document.querySelector(".utel .msg");
            // 判断是否为空
            if(!this.utel){
                this.utelMsg="用户名不能为空";
                utelMsg.style.color="#f00";
                return;
            }else{
                this.utelMsg="";
            }
            //验证手机号格式
            if(/^1[3-8]\d{9}$/.test(this.utel)==false){
                this.utelMsg="手机号格式不正确";
                utelMsg.style.color="#f00";
                return;
            }else{
                this.utelMsg="手机号格式正确";
                utelMsg.style.color="#0f0";
            }
            //验证该用户名是否已经注册
            var obj={
                uname:this.utel
            }
            fun.getIsReg(obj,result=>{
                // 判断result.data.code是否为1，是，则用户未注册
                if(result.data.code==1){
                    this.$messagebox("提示","此用户未注册")
                }
            })
        },
        //验证密码格式
        checkUpwd(){
            var upwdMsg=document.querySelector(".upwd .msg");
            // 判断是否为空
            if(!this.upwd){
                this.upwdMsg="密码不能为空";
                upwdMsg.style.color="#f00";
                return;
            }else{
                this.upwdMsg="";
            }
            //验证手机号格式
            if(/^\w{4,8}$/.test(this.upwd)==false){
                this.upwdMsg="密码格式为4-8位数字或字母";
                upwdMsg.style.color="#f00";
                return;
            }else{
                this.upwdMsg="密码格式正确";
                upwdMsg.style.color="#0f0";
            }
        },
        // 点击登录按钮
        login(){
            var utelMsg=document.querySelector(".utel .msg");
            // 判断用户名是否为空
            if(!this.utel){
                this.utelMsg="用户名不能为空";
                utelMsg.style.color="#f00";
                return;
            }else{
                this.utelMsg="";
            }
            var upwdMsg=document.querySelector(".upwd .msg");
            // 判断密码是否为空
            if(!this.upwd){
                this.upwdMsg="密码不能为空";
                upwdMsg.style.color="#f00";
                return;
            }else{
                this.upwdMsg="";
            }
            // 发送登录axios
            var obj={
                uname:this.utel,
                upwd:this.upwd
            }
            fun.getlogin(obj,(result)=>{
                // 判断登录成功，跳转上一级页面
                if(result.data.code==1){
                    this.$router.go(-1)
                }
            })
        }
    },
    watch: {
        //监听用户名输入格式
        utel(){
            this.checkUtel();
        },
        //监听密码输入格式        
        upwd(){
            this.checkUpwd();
        }
    },
}
</script>
<style scoped>
/*设置最大容器宽度和居中*/
.container{
    width: 100%;
    padding-top:25px;
}
/*设置输入框上边距 */
.marginT25{
    margin-top: 5%;
}
/*输入框中：图片/容器的样式 */
.imgdiv{
    height:30px;
    line-height: 66px;
    text-align: center;
}
.imgdiv img{
    width: 70%;
    height:100%;
}
/*去除输入框的上下边框*/
.van-hairline--top-bottom::after, .van-hairline-unset--top-bottom::after{
    border: none;
}
/*注册和直接登录两个按钮*/
.btn{
    display: block;
    width: 100%;
    margin: 30px auto 15px;
}
.pLeft{
    text-align: right;
    margin-top:5%;
}
/* 验证信息 */
.msg{
    display: block;
    width:100%;
    height:20px;
    font-size: 13px;
    text-align: left;
    margin-left:12px;
}
</style>