//创建express模块111111111555555555555555588888888888888888888
const express=require('express');
//express下创建购物车路由器    
var Cart=express.Router();
//引入连接池
var pool=require('../pool/pool.js');
//引入session模块
 //配置session

   //登录后查看自己购物车的商品111111111111111
 Cart.get("/cart",(req,res)=>{ 
    //1:参数(无参数)
    var uid = req.session.uid;
    console.log(uid+'niha');    //登录 后
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




//导出购物车路由器对象   /shopping
module.exports=Cart;

