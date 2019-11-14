<template>
    <div class="container">
        <van-row class="title">
            <van-col span="4">
                <router-link to="/">
                <van-icon name="arrow-left" size="30px" />
                </router-link>
                </van-col>
            <van-col span="20"><h3><span class="paddingR65">历史记录</span></h3></van-col>
        </van-row>
        <!-- 历史商品栏 -->
        <div class="bg-gray">
            <!-- 第一个商品 -->
            <van-row class="lists">
                <!-- 左边图标 -->
                <van-col class="img" span="6"><img src="../assets/img/history/list1.png" alt=""></van-col>
                <!-- 右边文字 -->
                <van-col span="18">
                    <div class="marginL10">
                    <p>脏脏蛋挞</p>
                    <span class="sub-word">甜甜甜公主</span><br>
                    <span class="sub-word">来自网上厨房</span>
                    </div>
                </van-col>
            </van-row>
            <!-- 第二个商品 -->
            <van-row class="lists">
                <!-- 左边图标 -->
                <van-col class="img" span="6"><img src="../assets/img/history/list2.png" alt=""></van-col>
                <!-- 右边文字 -->
                <van-col span="18">
                    <div class="marginL10">
                    <p>酸菜角炒饭</p>
                    <span class="sub-word">营养师马莉</span><br>
                    <span class="sub-word">来自网上厨房</span>
                    </div>
                </van-col>
            </van-row>

        </div>
    </div>
</template>
<script>
export default {
    
}
</script>
<style scoped>
.container{
    padding-top:30px;
}
/* 第一栏：标题 返回按钮 */
.title h3{
    margin-top: 2px;
}
/*标题微调 */
.paddingR65{
    padding-right: 65px;
}
/*历史商品栏*/
.bg-gray{
    background-color:#fafafa; 
}
/* 第一个商品 */
.lists{
    margin-top:20px;
    text-align:left;
}
/* 左边图标 */
.img{
    width: 90px;
    height:90px;
}
.img img{
    width: 100%;
    height:100%;
}
/* 右边文字 */
.marginL10{
    margin-left: 10px;
}
.sub-word{
    font-size: 14px;
}
</style>