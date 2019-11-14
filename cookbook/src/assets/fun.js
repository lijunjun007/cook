import axios from "axios"
export default {
    // 李军负责
    /*检测是否已注册 */
    getIsReg(obj,callback){
        axios.get("/isReg",{params:obj}).then(callback);
     },
     /*注册提交信息 */
    getRegister(obj,callback){
       axios.post("/reg",`uname=${obj.uname}&upwd=${obj.upwd}&nickname=${obj.nickname}&email=${obj.email}&sex=${obj.sex}`).then(callback);
    },
    /*登录 */
    getlogin(obj,callback){
        axios.get("/login",{params:obj}).then(callback);
    },
    /*修改 */ 
    getUpdate(obj,callback){
        axios.post("/updateUserByUname",`uname=${obj.uname}&upwd=${obj.upwd}&nickname=${obj.nickname}&email=${obj.email}`).then(callback);
     },
     /*购物车 */
     getCart(obj,callback){
        axios.get("/cart",{params:obj}).then(callback);
     },
     /*收藏 */
     getCollect(obj,callback){
        axios.get("/collect",{params:obj}).then(callback);
     },
    //  获取用户信息
    getUser(callback){
        axios.get("findUser").then(callback);
    },
    //退出登录
    exit(callback){
        axios.get("exit").then(callback);
    },
    //陈修浩负责
    // 分页查询食谱，默认从第一页开始，每页个数3条
    getFoods(pno,callback){
        axios.get("findFood",{
            params:{
                pno
            }
        }).then(callback)
    },
    // 根据食谱fid，查找对应fid的所有数据
    getFoodById(fid,callback){
        axios.get("findFoodById",{
            params:{
                fid
            }
        }).then(callback)
    },
    //点赞查询是否登录,未登录跳转登录,登录了获取信息
    findZan(fid,callback){
        axios.get("findZan",{
            params:{
                fid,
               
            }
        }).then(callback)
    },
    // 删除赞记录
    delZan(fid,zan,callback){
        axios.post(
            "delZan",
            `fid=${fid}&zan=${zan}`
            
        ).then(callback)
    },
    // 插入赞记录
    insertZan(fid,zan,callback){
        axios.post(
            "insertZan",
            `fid=${fid}&zan=${zan}`
        ).then(callback)
    },
    // 付雪丽负责
    // 首页今日查询图片
    getToday(pno,callback){
        axios.get("findFood",{
            params:{
               pno,
               pageSize:4,
            }
        }).then(callback)
    },
    // 首页明星推荐视频
    getMovie(pno,callback){
        axios.get("findMovie",{
            params:{
                pno,
               pageSize:4, 
            }
        }).then(callback)
    },
    // 弹出层
    getKeys(keys,callback){
        axios.get("findFoodByKeys",{
            params:{
                keys 
            }
        }).then(callback)
    },
    // 肖中秋负责
    // 请求视频列表数据
getMovieLise(pno,callback){
    axios.get("findMovie",{
        params:{
           pno,
            pageSize:2
        }
    }).then(callback)
},
//请求视频详情
getMovieDrails(mid,callback){
    axios.get("findMovieById",{
        params:{
            mid
           }
      }).then(callback)
},
getMovieCritical(mid,callback){
    axios.get("findComment",{
        params:{
            mid
        }
    }).then(callback)
},
//发送请求判断是否登录
getLogin(callback){
    axios.get("isLogin").then(callback)
},
 //请求视频评论内容
 insertComment(arr,callback){
    axios.post(
       "insertComment",
        `content=${arr.content}&time=${arr.time}&mid=${arr.mid}`
    ).then(callback)
 }
}