//创建express模块
const express=require('express');
//express下创建用户路由器    
var router=express.Router();
//引入连接池
var pool=require('../pool/pool.js');
//引入session模块
 //配置session
 //添加路由（用户注册）
 router.post('/add',function(req,res){
	 var obj1=req.body;
	 console.log(obj1.phone);
	 pool.query('SELECT count(*) as counta FROM users WHERE phone=?',[obj1.phone],function(err,result){
	  if(err) throw err;
	  if(result[0].counta > 0){
        res.send('1')
        }else{
        res.send('0')
        }
	});
 });

//用户登录 路由
router.get('/login',function(req,res){
    //  req.on('data',function(bnf){
    //var str=bnf.toString();
    //获取post请求数据的对象
    var obj=req.query;
    // console.log(obj);
    if(!obj.phone){
        console.log(obj.phone);
        res.send({code:401,msg:'用户名为空'});
        return;
    };
    if(!obj.upwd){
        res.send({code:402,msg:'密码为空'});
        return;
    };
    //执行SQL语句  查询所有用户名和密码 匹配         upwd=md5(?)  密码加密
    pool.query('SELECT * FROM users WHERE phone=? AND upwd=?',[obj.phone,obj.upwd],function(err,result){
        // if(err) throw err;
        // // console.log(result)
        // if(result.length<=0){
        //     res.send({code:-1,msg:"用户或密码有误"});
        // }else{
        //     res.send({code:1,msg:"用户登录成功"});
            // console.log("用户登录成功");
        // }
        console.log('当前登录用户ID是：'+result[0].id);
        //判断数组是否大于0，结果result是数组，大于0就登录成功，数组等于0就是登录失败
        if(result.length>0){
            req.session.uid=result[0].id;    //将当前登录用户uid保存session对象 
            res.send('1');  //send(里面是一个对象)
        }else{
            res.send('-1');
        }
    })
})

router.get("/cart",(req,res)=>{
    //1:参数(无参数)
    var uid = req.session.uid;
    // console.log(uid+'niha');    //登录后
    if(!uid){
      res.send({code:-1,msg:"请先登录！"});
      return;
    }
    //2:sql  //传一个uid =  一个值 1  数据库只有1
    var sql = "SELECT id,img_url,title,price,count FROM wy_cart WHERE uid = ?";
    pool.query(sql,[uid],(err,result)=>{
      console.log(result)
      if(err)throw err;
      res.send({code:1,data:result})
    })
    //3:json
  })

  
//导出用户路由器对象   /user
module.exports=router;

