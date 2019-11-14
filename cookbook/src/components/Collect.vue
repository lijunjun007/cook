<template>
    <div class="container">
        <!-- ***顶部栏***-->
        <van-row  class="marginB50">
            <van-col span="4">
                <router-link to="/">
                <van-icon name="arrow-left" size="30px" />
                </router-link>
            </van-col>
            <van-col span="16">
                <h3>我的收藏</h3>
            </van-col>
            <van-col span="4">
                <img src="../../static/img/ljt.png" alt="">
            </van-col>
        </van-row>
        <!-- 菜品栏 -->
        <div class="caiLists">
            <div class="list">
                <div class="item">
                <img src="../../static/img/cai1.png" alt="">
                <p>排骨烧土豆</p>
                </div>
            </div>
            <div class="list">
                <div class="item">
                <img src="../../static/img/cai1.png" alt="">
                <p>排骨烧土豆</p>
                </div>
            </div>
            <div class="list">
                <div class="item">
                <img src="../../static/img/cai1.png" alt="">
                <p>排骨烧土豆</p>
                </div>
            </div>
            <div class="list">
                <div class="item">
                <img src="../../static/img/cai1.png" alt="">
                <p>排骨烧土豆</p>
                </div>
            </div>
            <div class="list">
                <div class="item">
                <img src="../../static/img/cai1.png" alt="">
                <p>排骨烧土豆</p>
                </div>
            </div>
        </div>
        <!-- 快去收藏更多~ -->
        <p class="endWord">快去收藏更多~</p>
    </div>
</template>
<script>
export default {
    
}
</script>
<style scoped>
/* 顶部栏*/
h3{
    margin: 4px 0;
}
/* 菜品栏 */
.container{
    padding-top:25px;
}
.marginB50{
    margin-bottom: 30px;
}
.caiLists{
    display: flex;
    flex-wrap: wrap;
    margin-top: 5px;
}
.caiLists>.list{
    width: 50%;
}
.caiLists>.list>.item{
    width:95%;
    margin:0 auto;
}
.caiLists>.list>.item img{
    width: 100%;
}
.caiLists>.list>.item p,
.endWord{
    font-size: 14px;
    color: #666;
}
</style>