<template>
    <div class="container">
        <!-- 注册第一行 -->
    <van-row class="title-fan">
        <van-col span="4"><span @click="toIndex">返回</span></van-col>
        <van-col  class="title" span="10" offset="3">注册</van-col>
    </van-row>

  <!-- 手机号码输入框-->
<van-row class="marginT-15 pre">
  <van-col span="6" class="yztext">用&nbsp;&nbsp;户&nbsp;&nbsp;名</van-col>
      <!-- 输入栏 -->
  <van-col span="18">
      <van-cell-group>
  <van-field v-model="utel" placeholder="请输入手机号" @blur="blurajax" />
      </van-cell-group>
    </van-col>
    <!-- 手机号码验证信息 -->
    <van-col span="24" offset="6" class="textL chi">
        <span class="test_span" :class="utelClass">{{uteltext}}</span>
    </van-col>
</van-row>

  <!-- 用户名输入框-->
<van-row class="marginT-15 pre">
  <van-col span="6" class="yztext">用户昵称</van-col>
      <!-- 输入栏 -->
  <van-col span="18">
      <van-cell-group>
  <van-field v-model="nickname" placeholder="请输入昵称" />
      </van-cell-group>
    </van-col>
    <!-- 用户名验证信息 -->
    <van-col span="24" offset="6" class="textL chi">
       <span class="test_span" :class="nicknameClass">{{nicknametext}}</span>
    </van-col>
</van-row>

<!-- 电子邮箱-->
<van-row class="marginT-15 pre">
  <van-col span="6" class="yztext">电子邮箱</van-col>
      <!-- 输入栏 -->
  <van-col span="18">
      <van-cell-group>
  <van-field v-model="uemail" placeholder="请输入邮箱" />
      </van-cell-group>
    </van-col>
    <!-- 电子邮箱验证信息 -->
    <van-col span="24" offset="6" class="textL chi">
       <span class="test_span"  :class="uemailClass">{{uemailtext}}</span>
    </van-col>
</van-row>



<!-- 密码输入框-->
<van-row class="marginT-15 pre">
  <van-col span="6" class="yztext">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</van-col>
      <!-- 输入栏 -->
  <van-col span="18">
      <van-cell-group>
  <van-field type="password" v-model="upwd1" placeholder="请输入密码" />
      </van-cell-group>
    </van-col>
    <!-- 密码验证信息 -->
    <van-col span="24" offset="6" class="textL chi">
        <span class="test_span" :class="upwd1Class">{{upwd1text}}</span>
        </van-col>
</van-row>

    <!-- 密码确认框 -->
    <van-row class="marginT-15 pre">
  <van-col span="6" class="yztext">确认密码</van-col>
  <!-- 输入栏 -->
  <van-col span="18">
      <van-cell-group>
  <van-field type="password" v-model="upwd2" placeholder="确认密码" />
      </van-cell-group>
    </van-col>
    <!-- 密码再次确认信息 -->
    <van-col span="24" offset="6" class="textL chi">
      <span class="test_span" :class="upwd2Class">{{upwd2text}}</span>
    </van-col>
</van-row>
<!-- 性别-->
<van-row class="marginT-15 pred-flex">
  <van-col span="6" class="yztext">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</van-col>
      <!-- 输入栏 -->
  <van-col span="18">
      <van-radio-group v-model="sex" class="d-flex marginL20">
        <van-radio name="1">男</van-radio>
        <van-radio name="0">女</van-radio>
    </van-radio-group>
    </van-col>
</van-row>

    <!-- 按钮 -->
    <van-button class="btn jz" @click="regNew" color="#d3d3d3">立即注册</van-button>
    <van-button @click="directLogin" class="btn jz marginT-15" color="#FFD700">已有账号，直接登录</van-button>
</div>
</template>
<script>
import fun from "../assets/fun"
import axios from "axios"
export default {
    data(){
        return{
            //1.双向绑定input框的值
            utel:"",  //电话号码
            nickname:"",//用户名
            uemail:"",//电子邮箱
            upwd1:"",//第一次输入密码
            upwd2:"",//第二次输入密码

            //2.验证正确或错误的文本信息（span）
            uteltext:"",//电话号码文本
            nicknametext:"",//用户名文本
            uemailtext:"",//电子邮箱
            upwd1text:"",//第一次密码
            upwd2text:"",//第二次密码

            //3.给验证信息文本添加class样式
            utelClass:"",//电话号码
            nicknameClass:"",//用户名文本
            uemailClass:"",//电子邮箱
            upwd1Class:"",//第一次密码
            upwd2Class:"",//第二次密码

            //4.所有文本框正确才能发送登录的ajax请求
            boo:[false,false,false,false,false],
            
            //5.性别
            sex:2,
        }
    },
    methods:{
        toIndex(){
            this.$router.go(-1)
        },
        blurajax(){
            if(this.utel==""){
                this.uteltext="电话号码不能为空"
                this.utelClass="red";
                return;
            }
            //发送axios请求判断电话号码是否已注册
            var utel=this.utel;
             fun.getIsReg({uname:utel},(result)=>{
                    if(result.data.code<0){
                    this.uteltext="电话号码已被注册"
                    this.utelClass="red";
                    }else{
                    this.uteltext="电话号码格式符合要求"
                    this.utelClass="green";
                    }
                })
        },
        //正则判断函数
        zzTest(reg,value,text1,text2,text3,class1,class2,i){
            var arr=['testText','color']
            if(value==""){
                arr[0]=text1;
                arr[1]=class1;
                this.boo[i]=false;
                }
                else if(!(reg.test(value))){
                arr[0]=text2;
                arr[1]=class1;
                this.boo[i]=false;
                }else{
                arr[0]=text3;
                arr[1]=class2;
                this.boo[i]=true;
                }
                return arr;
        },
        //有账号直接跳转登录页面
        directLogin(){
            location.href="#/login";
        },
        //注册跳转按钮事件
        regNew(){
            if(!(this.boo[0]&&this.boo[1]&&this.boo[2]&&this.boo[3]&&this.boo[4])){
                // alert("填写的信息不符合要求，请重新填写");
                this.$toast("填写的信息不能为空")
                return;
            }
            else if(this.sex==2){
            //alert("请确认在性别框选定性别信息！");
	    this.$toast("请选择性别")
            return;
            }else{
                var obj={
                    uname:this.utel,
                    nickname:this.nickname,
                    email:this.uemail,
                    upwd:this.upwd1,
                    sex:this.sex,
                }
                console.log(this.uemail);
                fun.getRegister(obj,(result)=>{
                    if(result.data.code>0){
                        alert("注册成功！")
                        this.$router.push("/login")
                    }else{
                        console.log("注册失败！")
                    }
                })
            }
        }
    },
    watch:{
        //电话号码判断
        utel(){
            var reg=/^1[3-8]\d{9}$/;
            var text1='电话号码不能为空';
            var text2="电话号码格式不正确";
            var text3="电话号码格式符合要求";
            var style1="red";
            var style2="green";
            var arr=this.zzTest(reg,this.utel,text1,text2,text3,style1,style2,0)
             this.uteltext=arr[0];
             this.utelClass=arr[1];
        },
        //密码判断
        upwd1(){
            var reg=/^\w{4,8}$/;
            var text1='密码不能为空';
            var text2="密码为4-8位数字或字母";
            var text3="密码符合要求";
            var style1="red";
            var style2="green";
            var arr=this.zzTest(reg,this.upwd1,text1,text2,text3,style1,style2,1)
             this.upwd1text=arr[0];
             this.upwd1Class=arr[1];
        },
        //重复密码判断
        upwd2(){
            if(this.upwd2==this.upwd1){
                 this.upwd2text='密码验证成功';
                 this.upwd2Class='green';
                 this.boo[2]=true;
            }else{
                this.upwd2text='密码两次输入不相同';
                this.upwd2Class='red';
            }
        },
        // 用户名判断
        nickname(){
            var reg=/^[a-zA-Z0-9_-]{4,8}$/;
            var text1='用户名昵称不能为空';   
            var text2="用户名为4-8位的数字、字母、_、-组成";
            var text3="用户名昵称符合要求";
            var style1="red";
            var style2="green";
            var arr=this.zzTest(reg,this.nickname,text1,text2,text3,style1,style2,3)
             this.nicknametext=arr[0];
             this.nicknameClass=arr[1];
    },
        //邮箱判断
        uemail(){
            var reg=/^\w+@\w{2,10}\.[a-z]{2,3}(\.[a-z]{2})?$/;
            var text1='邮箱不能为空';
            var text2="请输入合法的邮箱名";
            var text3="邮箱名符合要求";
            var style1="red";
            var style2="green";
            var arr=this.zzTest(reg,this.uemail,text1,text2,text3,style1,style2,4)
             this.uemailtext=arr[0];
             this.uemailClass=arr[1];
    },
}
}
</script>
<style scoped>

/*弹性布局，水平居中 */
.d-flex{
    display:flex;
    align-items: center;
}
.marginL20{
    margin-left: 20px;
    height:44px;
}
/*块居中 */
.jz{
    margin:0 auto;
}
/*设置最大容器宽度和居中*/
.container{
	width:100%;
    padding-top:25px;
}
/*头头标题字体大小 */
.title{
    font-size: 16px;
    color:#444;
    font-weight:bold;
}
/*设置输入框上边距 */
.marginT-15{
    margin-top: 5%;
}

/*输入框中：图片/容器的样式 */
.imgdiv{
    height:30px;
    width: 30px;
    /* line-height: 66px; */
    text-align: center;
}
.imgdiv img{
    width: 100%;
    height:100%;
}
.textL{
    text-align: left;
}
/*左边距*/
/*去除输入框的上下边框*/
.van-hairline--top-bottom::after, .van-hairline-unset--top-bottom::after{
    border: none;
}
/*指定测试验证span文字的高度和位置 */
.yztext{
    height:44px;
    font-size: 14px;
    line-height: 44px;
}
    /*定位验证文字 */
.pre{
    position: relative;
}  
.chi{
    position: absolute;
    top:65%;
} 
/*注册和直接登录两个按钮*/
.btn{
    display: block;
    width: 100%;
    margin: 15px auto 15px;
}
.red{
    display:block;
    height:16px;
    color:#f00;
    font-size:12px;
    margin-top:10px;
    margin-left:20px;
}
.green{
    display:block;
    height:16px;
    color:#0f0;
    font-size:12px;
    margin-top:10px;
    margin-left:20px;
}
.mint-msgbox{
    width:50% !important;
    margin-left: -25%;
    margin-top:25%;
}
</style>