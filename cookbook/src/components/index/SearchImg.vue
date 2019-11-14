<template>
    <div class="search-header">
        <!-- 搜索按钮 start -->
        <div class="search">
            <!-- 弹出层 -->
            <van-cell style="background:none" is-link @click="showPopup">
                <img src="../../assets/sousuo.png">
            </van-cell>
            <!-- 弹出层的内容 -->
            <van-popup
                v-model="show"
                closeable
                position="top"
                :style="{ height: '100%' }"
            >
                <form action="/">
                    <van-search
                        v-model="value"
                        placeholder="请输入搜索关键词"
                        show-action
                        @keyup.enter="getFoods"
                    />
                </form>
                
            </van-popup>

            <!-- 自定义图标 -->
            <van-popup
                v-model="show"
                closeable
                close-icon="close"
                position="top"
                :style="{ height: '100%' }"
            >
                <form action="/">
                    <van-search
                        v-model="value"
                        placeholder="请输入搜索关键词"
                        show-action
                    />
                </form>
                
            </van-popup>

            <!-- 图标位置 -->
            <van-popup
                v-model="show"
                closeable
                close-icon-position="top-right"
                position="top"
                :style="{ height: '100%' }"
            >
                <form action="/">
                    <van-search
                        v-model="value"
                        placeholder="请输入搜索关键词"
                        show-action
                    />
                </form>
                
                <!-- 查询出来的食谱展示 -->
            <div class="foods" v-for="(item,i) of list" :key="i">
                <div class="left">
                    <router-link :to='`/details?fid=${item.fid}`'>
                        <img class="xiaoimg" :src="`http://htcookbook.applinzi.com/${item.img_url}`">
                    </router-link>
                </div>
                <div class="right">
                    <p>发表者:{{item.username}}</p>
                    <p>菜品:{{item.food_name}}</p>
                </div>
            </div>
            </van-popup>
            
        </div>
        <!-- 搜索按钮 end -->
    </div>
</template>

<script>
import funs from "../../assets/fun.js"
export default {
    data(){
        return {
            show: false,
            showMenu:false,
            value:"",
            tagsList:[["鸡胸肉"],["营养粥"],["沙拉"],["苦瓜汁"]],
            list:[] //模糊查询出来的食谱结果
        }
    },
    methods: {
        showPopup() {
            this.show = true;
        },
        getFoods(){
            if(!this.value){
                return;
            }
            funs.getKeys(this.value,result=>{
                // 判断是否查询成功
                if(result.data.code==1){
                    // 将结果赋值给list
                    this.list=result.data.data;
                }else{
                    this.list="";
                }
            })
        }
    },
    watch:{
        value(){
            this.getFoods()

        }
    }
}
</script>

<style scoped>
    .foods{
        z-index: 100;
        display: flex;
        justify-content: space-around;
        margin-bottom: 15px;
    }
    .left{
        width:35%;
    }
    .right{
        width:60%;
        text-align: left;
    }
    .xiaoimg{
        width:100%;
        border-radius: 10px;

    }
    /* 点击搜索按钮，弹出层的样式 */
    .search{
        z-index:100;
    }
    /* 弹出层的关闭按钮 */
    .van-popup__close-icon--top-right{
        top:22px;
    }
    /* 整个搜索 */
    .van-search.van-search--show-action{
        width:100%;
        height:60px;
        padding-bottom: none;
    }
    .search-header >>> .van-cell{
        padding: 0;
        line-height: none;
    }
    /* >符号的样式 */
    .van-icon-arrow{
        display: none;
    }
    /* 弹出层的× */
    .search-header >>> .van-icon.van-icon-cross.van-popup__close-icon.van-popup__close-icon--top-right:before{
        content: "";
        display: block;
        width:20px;
        height:40px;
    }
    /* 搜索的图片 */
    .van-cell__value.van-cell__value--alone img{
        width:27px;
        height:27px;
    }
    /* input框 */
    .van-cell.van-cell--borderless.van-field{
        font-size: 16px;
        height:40px;
        line-height: 40px;
    }
    /* input框里面的框 */
    .van-field__body,.van-field__control{
        width: 100%;
    }
    /* 文字 取消 */
    .van-search__action{
        font-size: 16px; 
    }
    /* 搜索框的搜索图片 */
    .van-icon-cross:before{
        content: "";
    }

    /* 标签们的样式 */
    .tags{
        display: flex;
        flex-wrap: wrap;
        margin-left: 5px;
    }
    .tags span{
        display: inline-block;
        font-size: 16px;
        text-align: center;
    }
    .tags span+span,.tags span{
        font-size: 16px;
        margin:5px;
    }

</style>