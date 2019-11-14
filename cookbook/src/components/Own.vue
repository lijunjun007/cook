<template>
    <div>
        <h3>更多</h3>
        <div>
            <img  @click="toLogin" class="picImg" src="../assets/img/login/touxiang.png" alt="123">
        </div>
        <p class="login">
            <span @click="toLogin">{{utel}}</span>
        </p>
        <div class="subtitle">解锁收藏丶云端同步功能丶收藏内容不丢失</div>

        <!-- 菜单单元格 -->
        <van-cell-group class="text-left">
        <router-link to="/collect">
        <van-cell title="菜谱收藏" icon="shop-o" is-link />
        </router-link>
        <router-link to="/cart">
        <van-cell title="菜篮子" icon="shop-o" is-link />
        </router-link>
        <router-link to="/history">
        <van-cell title="历史记录" icon="shop-o" is-link />
        </router-link>
        <router-link to="/history">
        <van-cell title="用着不错，赏个好评去" icon="shop-o" is-link />
        </router-link>
        </van-cell-group>
        <!-- 登录/退出按钮 -->
        <van-button class="btn" color="#FFD700" :style="quitbtnstyle" @click="tuichu">退出登录</van-button>

        <!-- 底部广告栏 -->
        <van-notice-bar class="bottom-fixed" text="减肥首先就要做到科学合理的饮食以及通过相关的运动锻炼等来达到减肥的效果,减肥是一个长久坚持的东西" left-icon="volume-o"/>
    </div>
</template>
<script>
import fun from "../assets/fun"
export default {
    data(){
        return{
            utel:"登录/注册账号",
            islogin:false,
            quitbtnstyle:{ display:"none" },
            userlist:"" //用户信息
        }
    },
    methods:{
        toLogin(){
            if(this.islogin){
                return;
            }
            else{
                this.$router.push("/login")
            }
        },
        //退出登录按钮
        tuichu(){
            fun.exit(result=>{
                // 退出登录成功
                if(result.data.code==1){
                    // 隐藏退出登录按钮
                    this.quitbtnstyle.display="none";
                    // 显示登录
                    this.utel="登录/注册账号";
                    this.islogin=false;
                    // 修改头像图片
                    var picImg=document.querySelector(".picImg");
                    picImg.src="../../static/img/touxiang.png";
                }
            })

        },
        // 获取用户登录信息
        getUserMsg(){
            fun.getUser(result=>{
                if(result.data.code==1){
                    // 获取用户信息，存入userlist
                    this.userlist=result.data.data[0];
                    // 设置utel值为用户昵称
                    this.utel=this.userlist.nickname;
                    // 如果用户是登录状态,显示退出登录按钮
                    this.quitbtnstyle.display="block";
                    var picImg=document.querySelector(".picImg");
                    picImg.src="../../static/img/usen.png"
                }else{
                    // 如果用户不是登录状态,隐藏退出登录按钮
                    this.quitbtnstyle.display="none";
                }
            })
        }

    },
    created(){
        this.getUserMsg();
    }
}
</script>
<style scoped>
.picImg{
    border-radius: 50%;
}
/*设置副标题宽度，居中，字体大小 */
.subtitle{
    width: 60%;
    margin: 0 auto;
    text-align: center;
    font-size: 14px;
}
/* 设置菜单单元格中文字靠右 */
.text-left{
    text-align: left
}
/* 登录/退出按钮 */
.btn{
    display: block;
    width: 90%;
    margin: 60px auto 15px;
}
/*底部固定广告栏*/
.bottom-fixed{
    position: fixed;
    bottom: 0;
    width:100%;
}
</style>