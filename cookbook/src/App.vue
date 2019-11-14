<template>
  <div id="app">
    <!-- 手机顶部信息 -->
    <div class="zuitop">

      <div class="top">
        <div class="left">
          <img src="./assets/xinhao.png" />
          <span>中国移动</span>
          <span class="small">4G</span>
        </div>
        <div>
          <span class="time">10:00</span>
        </div>
        <div class="right">
          <span class="small">80%</span>
          <img src="./assets/80dianliang.png" />
        </div>
      </div>
    </div>
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style scoped>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-bottom:20%;
}
.zuitop{
  width: 100%;
  position: fixed;
  z-index: 1000;
}
#app .top{
  display: flex;
  justify-content: space-between;
  font-size: 13px;
  align-items: center;
  padding:0 5px ;
  padding-bottom: 5px;
  background: #fff;
}
.left,.right{
  display: flex;
  align-items: center;
}
.left>span{
  margin-left:5px;
}
.right>span{
  margin-right:5px;  
}
.small{
  font-size: 12px;
}
.time{
  margin-left:-30px;
}
</style>
