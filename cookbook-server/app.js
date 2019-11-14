const express=require("express");
const cors=require("cors");
const session=require("express-session");
const mysql=require("mysql");
const bodyParser=require('body-parser');

// 创建连接池
var pool=mysql.createPool({
    host:"r.rdc.sae.sina.com.cn",
    port:3306,
    user:"n0yolm2m51",
    password:"14l5hm11xlklwlzjww2mzx24yx30xkkyz30kjyih",
    database:"app_testcookbook",
    connectionLimit:15
});

// 创建服务器
var server=express();
// 配置跨域模块
server.use(cors({
    origin:["http://127.0.0.1:3001","http://localhost:3001","http://127.0.0.1:8080","http://localhost:8080"],
    credentials:true
}));
// 配置session模块
server.use(session({
    secret:"128位字符串",
    resave:true,
    saveUninitialized:true
}));
server.use(bodyParser.urlencoded({
    extended:false  //使用querystring模块，而不是使用第三方的qs模块
}));
// 配置静态资源
server.use(express.static("public"));
// 配置监听端口
server.listen(5050);

// 1.查询用户名是否被注册
server.get("/isReg",(req,res)=>{
    // 获取参数
    var uname=req.query.uname;
    // 查询sql
    var sql=`SELECT * FROM cook_user WHERE uname=?`;
    // 执行sql
    pool.query(sql,[uname],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            // 查询到有此用户，返回提示信息以及查询结果
            res.send({code:-1,msg:"该用户已注册",data:[result[0]]});
        }else{
            res.send({code:1,msg:"该用户可以注册"});
        }
    });
    
});
//2.注册接口
server.post("/reg",(req,res)=>{
    // 获取参数
    var uname=req.body.uname;
    var upwd=req.body.upwd;
    var email=req.body.email;
    var sex=req.body.sex;
    //获取昵称
    var nickname=req.body.nickname;
    // 判断参数值是否定义
    if(uname==undefined || upwd==undefined || email==undefined || sex==undefined || nickname==undefined){
        return;
    }
    var status=req.body.status;
    if(!status){
        status=0;
    }
    // 注册sql
    var sql=`INSERT INTO cook_user (uname,upwd,status,email,sex,nickname) VALUES (?,md5(?),?,?,?,?)`;
    // 执行sql语句
    pool.query(sql,[uname,upwd,status,email,sex,nickname],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"注册成功"});
        }else{
            res.send({code:-1,msg:"注册失败"});
        }
    });
});
//3.登录接口
server.get("/login",(req,res)=>{
    // 获取参数
    var uname=req.query.uname;
    var upwd=req.query.upwd;
    var status=req.query.status;
    if(!status){
        status=0;
    }
    //查询sql
    var sql=`SELECT uid,nickname FROM cook_user WHERE uname=? AND upwd=md5(?) AND status=?`;
    // 执行sql
    pool.query(sql,[uname,upwd,status],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            // 如果登录成功，将用户id和昵称存入session中
            req.session.uid=result[0].uid;
            req.session.nickname=result[0].nickname;
            res.send({code:1,msg:"登录成功"});
        }else{
            res.send({code:-1,msg:"登录失败"});
        }
    });
});

// 4.查询食谱
server.get("/findFood",(req,res)=>{
    var pno=req.query.pno;
    var pageSize=req.query.pageSize;
    
    if(!pno){pno=1}
    if(!pageSize){pageSize=3}
    // 计算limit第一个值
    var off=(pno-1)*pageSize;

    pageSize=parseInt(pageSize);
    // 查询sql，book_factory表中
    var sql=`SELECT fid,food_name,zan,details,img_url,user_img,username FROM cook_food LIMIT ?,?`;
    // 执行sql
    pool.query(sql,[off,pageSize],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"查询成功",data:result});
        }else{
            res.send({code:-1,msg:"查询失败"});
        }
    });
});

// 5.根据fid查询某个食谱
// 查询食谱
server.get("/findFoodById",(req,res)=>{
    // 获取菜谱id
    var fid=req.query.fid;
    // 查询sql，book_factory表中
    var sqlFood=`SELECT food_name,foods,steps,details,img_url,user_img,username,zan,notice FROM cook_food WHERE fid=?`;
    
    // 执行sql
    pool.query(sqlFood,[fid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            // 查询到该菜谱信息,将result放入foodDetails
            res.send({code:1,msg:"菜谱查询成功",data:result});
        }else{
            res.send({code:-1,msg:"菜谱查询失败"});
        }
    });
});
//查询点赞记录表
server.get("/findZan",(req,res)=>{
    // 获取用户id，菜谱id
    var fid=req.query.fid;
    var uid=req.session.uid;
    // 判断用户是否登录
    if(!uid){
        res.send({code:-1,msg:"用户未登陆"});
        return;
    }
    // sql语句
    // 通过uid，fid查询点赞记录表的点赞记录
    var sqlZan=`SELECT id FROM cook_zan WHERE uid=? AND fid=?`;
    pool.query(sqlZan,[uid,fid],(err,result)=>{
        if(err) throw err;
        // 判断是否有记录
        // 有记录,用户有点赞记录
        if(result.length>0){
            // 表示已点赞
            res.send({code:1,msg:"用户已点赞"});
        }else{
            // 没有记录,则用户没有点赞
            res.send({code:-2,msg:"用户未点赞"});
        }
    });
});

// 插入点赞记录
server.post("/insertZan",(req,res)=>{
    // 获取uid,fid
    var uid=req.session.uid;
    var fid=req.body.fid; 
    var zan=req.body.zan;
    // 验证用户是否登录
    if(!uid){
        res.send({code:-1,msg:"请登录"});
        return;
    }
    var sqlUpdateZan="UPDATE cook_food SET zan=? WHERE fid=?";
    // sql语句
    // 将uid,fid,status插入cook_zan表中
    var sqlInsert=`INSERT INTO cook_zan (uid,fid) VALUES (?,?)`;
    // 执行sql
    pool.query(sqlInsert,[uid,fid],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            // 点赞成功
            pool.query(sqlUpdateZan,[zan,fid],(err,result)=>{
                if(err) throw err;
                if(result.affectedRows>0){
                    res.send({code:1,msg:"用户点赞成功,点赞次数修改成功"});
                }else{
                    res.send({code:-2,msg:"用户点赞成功,点赞次数修改失败"});
                }
            });
        }else{
            res.send({code:-3,msg:"用户点赞失败"});
        }
    });
});

//删除点赞记录
server.post("/delZan",(req,res)=>{
    // 获取uid,fid
    var uid=req.session.uid;
    var fid=req.body.fid;
    var zan=req.body.zan;
    // 验证用户是否登录
    if(!uid){
        res.send({code:-1,msg:"请登录"});
        return;
    }
    var sqlUpdateZan="UPDATE cook_food SET zan=? WHERE fid=?";
    var sql=`DELETE FROM cook_zan WHERE uid=? AND fid=?`;
    pool.query(sql,[uid,fid],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            // 点赞成功
            pool.query(sqlUpdateZan,[zan,fid],(err,result)=>{
                if(err) throw err;
                if(result.affectedRows>0){
                    res.send({code:1,msg:"用户取消点赞成功,点赞次数修改成功"});
                }else{
                    res.send({code:-2,msg:"用户取消点赞成功,点赞次数修改失败"});
                }
            });
        }else{
            res.send({code:-3,msg:"取消点赞失败"});
        }
    })
})

//7.分页显示视频
server.get("/findMovie",(req,res)=>{
    var pno=req.query.pno;
    var pageSize=req.query.pageSize;
    if(!pno){pno=1}
    if(!pageSize){pageSize=3}
    // 计算limit第一个值
    var off=(pno-1)*pageSize;

    pageSize=parseInt(pageSize);
    // 查询sql，book_factory表中
    var sql=`SELECT mid,title,zuoze,movie_img FROM food_movie LIMIT ?,?`;
    // 执行sql
    pool.query(sql,[off,pageSize],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"查询成功",data:result});
        }else{
            res.send({code:-1,msg:"查询失败"});
        }
    });
});

// 8.根据mid查询某个视频
// 查询视频
server.get("/findMovieById",(req,res)=>{
    var mid=req.query.mid;
    // 查询sql，book_factory表中
    var sql=`SELECT title,zuoze,movie_img,details,date_time,movie_url FROM food_movie WHERE mid=?`;
    // 执行sql
    pool.query(sql,[mid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"查询成功",data:result});
        }else{
            res.send({code:-1,msg:"查询失败"});
        }
    });
});

// 9.按uname修改用户信息
server.put("/updateUserByUname",(req,res)=>{
    // 获取参数
    var uname=req.body.uname;
    var nickname=req.body.nickname;
    var email=req.body.email;
    var sex=req.body.sex;
    // sql语句
    var sql=`UPDATE cook_user SET nickname=?,email=?,sex=? WHERE uname=?`;
    // 执行sql语句
    pool.query(sql,[nickname,email,sex,uname],(err,result)=>{
        if(err) throw err;
        // 修改成功
        if(result.affectedRows>0){
            res.send({code:1,msg:"修改成功"});
        }else{
            res.send({code:-1,msg:"修改失败"});
        }
    });
});

// 查询用户信息
server.get("/findUser",(req,res)=>{
    // 获取uid
    var uid=req.session.uid;
    // 验证用户是否登录
    if(!uid){
        res.send({code:-1,msg:"请登录"});
        return;
    }
    var sql=`SELECT nickname,email,sex,uname FROM cook_user WHERE uid=?`;
    // 执行sql
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"查询成功",data:result});
        }else{
            res.send({code:-1,msg:"查询失败"});
        }
    });
});
//判断用户是否登录
server.get("/isLogin",(req,res)=>{
	var uid=req.session.uid;
    // 验证用户是否登录
    if(!uid){
        res.send({code:-1,msg:"请登录"});
    }else{
		res.send({code:1,msg:"用户已登录"});
	}
})
//插入评论
server.post("/insertComment",(req,res)=>{
    // 获取参数
    //发表时间,发表内容,用户的昵称,用户uid
    var time=req.body.time;
    var content=req.body.content;
    var mid=req.body.mid;
    var nickname=req.session.nickname;
    var uid=req.session.uid;
    
    // sql语句
    var sql=`INSERT INTO cook_comment (content,time,nickname,uid,mid) VALUES (?,?,?,?,?)`;
    // 执行插入sql
    pool.query(sql,[content,time,nickname,uid,mid],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"发表成功"});
        }else{
            res.send({code:-2,msg:"发表失败"});
        }
    });
});

// 查询用户评论
server.get("/findComment",(req,res)=>{
    // 获取视频id
    var mid=req.query.mid;
    var sql=`SELECT content,time,nickname,uid FROM cook_comment WHERE mid=?`;
    // 执行sql
    pool.query(sql,[mid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"查询成功",data:result});
        }else{
            res.send({code:-1,msg:"查询失败"});
        }
    });
});

// 搜索框模糊查询
server.get("/findFoodByKeys",(req,res)=>{
    // 获取关键词
    var keys=req.query.keys;
    keys=`%${keys}%`;
    // 模糊查询语句
    var sql=`SELECT fid,food_name,foods,steps,details,img_url,user_img,username,zan FROM cook_food WHERE food_name LIKE ?`;
    // 执行sql
    pool.query(sql,[keys],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"查询成功",data:result});
        }else{
            res.send({code:-1,msg:"查询失败"});
        }
    });
});

// 插入收藏表
server.post("/insertCollect",(req,res)=>{
    var uid=req.session.uid;
    var img_url=req.body.img_url;
    var food_name=req.body.food_name;

    var sql=`INSERT INTO cook_collect (uid,img_url,food_name) VALUES (?,?,?)`;
    pool.query(sql,[uid,img_url,food_name],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"收藏成功"});
        }else{
            res.send({code:-1,msg:"收藏失败"});
        }
    })
})

//退出登录
server.get("/exit",(req,res)=>{
    req.session.uid=null;
    res.send({code:1,msg:"退出登录成功"})  
})