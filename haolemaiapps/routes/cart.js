//创建express模块1111
const express=require('express');
//express下创建购物车路由器    
var Cart=express.Router();
//引入连接池
var pool=require('../pool/pool.js');
//引入session模块
 //配置session

   //登录后查看自己购物车的商品
 Cart.get("/cart",(req,res)=>{    //注册的时候往购物车数据表添加一个uid
   //var aa=req.query.id;
   //console.log(aa);
    //1:参数(无参数)
      var uid = req.session.uid;
     console.log(uid+'niha');    //登录前
    if(!uid){
       res.send({code:-1,msg:"请先登录！"});
      return;
    }
    //2:sql  //传一个uid =  一个值 1  数据库只有1    //把session的uid存在数据库中当前的用户
    var sql = "SELECT * FROM wy_cart";  //这里找不到数组
    pool.query(sql,[uid],(err,result)=>{
      console.log(result)
      if(err)throw err;
      res.send({code:1,data:result})
    })
    //3:json
  })
  
    //加入购物车   //lid   price  size  标题  小图片
    Cart.get('/add',function(req,res){
      var obj1=req.query;
      console.log(obj1);
      var uid=req.session.uid;
      if(!uid){
        res.send({code:-1,msg:"请先登录！"});
        return;
      }
      pool.query('INSERT INTO wy_cart SET ?'),[obj1],function(err,result){
        if(err) throw err;
        if(result.affectedRows>0){
      res.send('1');
     }else{
      res.send('0');
     }
      }
      
      console.log(obj1);
      pool.query('INSERT INTO wy_cart SET?',[obj1],function(err,result){
       if(err) throw err;
       if(result.affectedRows>0){
     res.send('1');
    }else{
     res.send('0');
    }
     });

    });
   

//导出购物车路由器对象   /shopping
module.exports=Cart;

