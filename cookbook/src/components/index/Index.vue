<template>
  <div>
    <!--2:面板/切换不同内容-->
    <mt-tab-container v-model="active">
      <!--2.1:子面板-->
      <mt-tab-container-item id="tab">
        <!-- 调用首页子组件 -->  
        <!-- 顶部搜索框和轮播图 -->
        <search msg=""></search>
      </mt-tab-container-item>
      <!-- 食谱子组件 -->
      <mt-tab-container-item id="tab1">
        <foodmenu></foodmenu>
      </mt-tab-container-item>
      <!-- 视频子组件 -->
      <mt-tab-container-item id="tab2">
        <movielist></movielist>
      </mt-tab-container-item>
      <!-- 我的子组件 -->
      <mt-tab-container-item id="tab3">
        <own id="own2"></own>
      </mt-tab-container-item>
    </mt-tab-container>
    <!--3:底部导航条 start-->
    <mt-tabbar fixed v-model="active">
      <!--第一个按钮 微信-->
      <mt-tab-item id="tab" @click.native="changeState(0)">
      <indexall
        :focused="list[0].isSelect"
        :selectedImage="require('../../assets/shouye_selected.png')"
        :normalImage="require('../../assets/shouye_normal.png')"
      ></indexall>
        首页
      </mt-tab-item>
      <mt-tab-item id="tab1" @click.native="changeState(1)">
        <indexall
          :focused="list[1].isSelect"
        :selectedImage="require('../../assets/shipu_selected.png')"
        :normalImage="require('../../assets/shipu_normal.png')"
      ></indexall>
        食谱
      </mt-tab-item>
      <mt-tab-item id="tab2" 
      @click.native="changeState(2)" >
        <indexall
          :focused="list[2].isSelect"
        :selectedImage="require('../../assets/shipin1_selected.png')"
        :normalImage="require('../../assets/shipin1_normal.png')"
      ></indexall>
        视频
      </mt-tab-item>
      <mt-tab-item id="tab3" @click.native="changeState(3)">
        <indexall
          :focused="list[3].isSelect"
        :selectedImage="require('../../assets/icon_me_selected.png')"
        :normalImage="require('../../assets/icon_me_normal.png')"
      ></indexall>
        我的
      </mt-tab-item>
    </mt-tabbar>
    <!--3:底部导航条 end-->
  </div>
</template>
<script>
  // 引入Suosou.vue子组件 
  import Search from "./Search"  //搜索框子组件
  import  IndexAll from "./IndexAll" //底部标签栏(IndexAll)
  import  Own from "../Own" //底部标签栏("我的"主界面)
  import  FoodMenu from "../FoodMenu" //底部标签栏("食谱"主界面)
  import  MovieList from "../MovieList" //底部标签栏("视频"主界面)
  export default {
    data(){
      return{
        // active: 0,
        // route:true,
        //保存当前显示子面板id
        active:"tab",
        //创建数组保存tabbar状态
        list:[
          {isSelect:true},//微信
          {isSelect:false},//通讯录
          {isSelect:false},//发现
          {isSelect:false}//我的
        ]
      }
    },
    methods:{
      changeState(idx){
        //-:idx 值 10:52
        //-:当前状态true其它改false
        //1:创建循环遍历数组状态值10:43
        for(var i=0;i<this.list.length;i++){
        //2:判断当前下标是否与参数下标相同 
        if(i==idx){
          this.list[i].isSelect=true
        }else{
          this.list[i].isSelect=false
        }
        //3:修改当前数组状态true
        //4:修改其它状态false
        }
      }
    },
    components:{//注册子组件
      "search":Search , //子组件名:对象(搜索框)
      "indexall":IndexAll,  //子组件名:对象(底部导航)
      "own":Own,  //子组件名:对象(我的)
      "foodmenu":FoodMenu,  //子组件名:对象(食谱)
      "movielist":MovieList,  //子组件名:对象(视频)
    },
  }
</script>
<style scoped>
 /*1:修改indexall中默认 灰和选中 绿*/
 /*  文字颜色*/
 .mint-tabbar>.mint-tab-item{
   color:#999999;
 }
 /*选中文字颜色*/ 
 .mint-tabbar>.mint-tab-item.is-selected{
   background-color:transparent;
   color:#36CA9C;
 }
</style>