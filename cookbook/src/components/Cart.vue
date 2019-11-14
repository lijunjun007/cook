<template>
    <div  class="container">
    <!-- ***顶部栏***-->
    <van-row class="topBar">
        <van-col span="4">
                <router-link to="/">
                <van-icon name="arrow-left" size="30px" />
                </router-link>
        </van-col>
        <van-col span="16">
                <h3>菜篮子(40)</h3>
        </van-col>
        <van-col span="4">
            <p>清空</p>
        </van-col>
    </van-row>
    <!-- 按--材料/菜品--索引栏 -->
    <!-- 1.目录栏 -->
    <div>
        <ul class="listUl">
            <li @click="click1" :style="style1"><span>按材料查看</span></li>
            <li @click="click2" :style="style2"><span>按菜品查看</span></li>
        </ul>
    </div>
    <!-- 2.内容栏 -->
    <div class="content">
    <!-- 内容左 -->
    <div class="contentlist1" :style="style3">
    <dl>
        <dt>淡奶油</dt>
            <dd class="dd-flex">
                <span>淡奶油(脏脏蛋挞)</span>
                <span class="marR5">85g</span>
                </dd>
            <dd  class="dd-flex">
                <span>淡奶油(脏脏蛋挞)</span>
                <span class="marR5">50g</span>
                </dd>
    </dl>
    <dl>
        <dt>八角</dt>
            <dd class="dd-flex">
                <span>八角(排骨烧土豆)</span>
                <span class="marR5">一个</span>
                </dd>
    </dl>
    <dl>
        <dt>冻豆腐</dt>
            <dd  class="dd-flex">
                <span>冻豆腐(鲍鱼番茄海鲜豆腐浓汤)</span>
                <span class="marR5">200g</span>
                </dd>
    </dl>
    </div>
    <!-- 内容右 -->
    <div class="contentlist2" :style="style4">
    <div class="ww-100">
        <div class="dd-flex margT15">
            <div class="dd-flex">
                <img src="../../static/img/cailanzi1.png" alt="">
                <span class="marL5">酸豆角炒饭</span>
            </div>
            <div>
                <span class="css-yellow">移出这个菜</span>
                </div>
        </div>
        <ul>
            <li class="dd-flex right-list">
                <div>隔夜米饭(二人食)</div>
                <div class="marR5">600~700g</div>
                </li>
            <li class="dd-flex right-list">
                <div>老豆腐</div>
                <div class="marR5">200g</div>
                </li>
            <li class="dd-flex right-list">
                <div>酸豆角</div>
                <div class="marR5">3瓷勺</div>
                </li>
            <li class="dd-flex right-list">
                <div>莴笋或西蓝花菜梗 </div>
                <div class="marR5">100g</div>
                </li>
            <li class="dd-flex right-list">
                <div>油菜</div>
                <div class="marR5">1颗</div>
                </li>
            <li class="dd-flex right-list">
                <div>洋葱</div>
                <div class="marR5">30g</div>
                </li>
            <li class="dd-flex right-list">
                <div>食用油丶食盐</div>
                <div class="marR5">适量</div>
                </li>
        </ul>
    </div>
    </div>
 </div>
</div>
</template>
<script>
export default {
    data(){
        return{
        style1:{
            borderBottom:"2px solid #ffd700",
            color:"#ffd700",
        },
        style2:{
            borderBottom:"none",
            color:"#000"
        },
        style3:{
            display:"block",
        },
        style4:{
            display:"none",
        },}
    },
    methods:{
        click1(){
            this.style1.borderBottom="2px solid #ffd700";
            this.style2.borderBottom="none";
            this.style1.color="#ffd700";
            this.style2.color="#000";
            this.style3.display="block";
            this.style4.display="none";
        },
        click2(){
            this.style1.borderBottom="none";
            this.style2.borderBottom="2px solid #ffd700";
            this.style1.color="#000";
            this.style2.color="#ffd700";
            this.style3.display="none";
            this.style4.display="block";
        },
    }
}
</script>
<style scoped>
.container{
    padding-top:30px;
}
/* 顶部栏*/
.topBar h3,.topBar p{
    margin: 4px 0;
}
.topBar p{
    font-size: 19px;
    color:#ffd700;
}
/* ********按--材料/菜品--索引栏 **********/
/* 1.目录栏  */
/*******div:两个标题******/
.listUl{
    display: flex;/*设置弹性布局 */
    justify-content: space-around;
    font-size: 19px;
    margin-top: 15px;
}
/*******内容**** */
.content{
    position: relative;
}
.contentlist1,.contentlist2{
    position: absolute;
    top: 0;
    left: 0;
    margin-left: 5%;
    width: 90%;
}
.dd-flex{
    display:flex;
    justify-content: space-between;
    align-items: center;
}
.ww-100{
    width: 100%;
}
/*- *****内容左**** - */
.contentlist1 dl{
    list-style: none;
    text-align: left;
}
.contentlist1 dl dt{
    font-size: 18px;
    font-weight: bold;
    margin: 10px 0;
}
.contentlist1 dl dd,.right-list{
    margin:10px 0;
    padding: 5px 0 5px 3%;;
    background-color: #f7f7f7;
}
.marR5{
    margin:2%;
}
/* - *****内容右 *****- */
.css-yellow{
    color:#ffd700;
}
.margT15{
    margin-top: 5%;
}
.marR10{
    margin-right: 5%;
}
.marL5{
    margin-left: 5%;
}
</style>