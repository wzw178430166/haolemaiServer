//创建express模块1111
const express=require('express');
//express下创建购物车路由器    
var Cart=express.Router();
//引入连接池
var pool=require('../pool/pool.js');
//引入session模块
 //配置session

   //登录后查看自己购物车的商品
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
 
    //加入购物车
    Cart.get("/add",(req,res)=>{
      console.log(req.query);
    var lid=req.query.lid;
    console.log(lid);
    var output={
      products:[],
      specs:[],
      pics:[],
      size:[],
      dibu:[]
    }
    if(lid!==undefined){
      var sql1=`select price,lname from wy_product where lid=?`;
      pool.query(sql1,[lid],(err,result)=>{
        if(err) console.log(err);
        output.products=result[0];
        //console.log(output);
        var family_id=output.products["family_id"];
        var sql2=`select * from wy_meticulous where lid=?`;
        pool.query(sql2,[lid],(err,result)=>{
          if(err) console.log(err);
          output.specs=result;
          console.log(result);
          var sql3=`select * from wy_product_pic where laptop_id=?`;
          pool.query(sql3,[lid],(err,result)=>{
            if(err) console.log(err);
            output.pics=result;
            //console.log(output);
          });
          var sql4=`select yardage_a,yardage_b,yardage_c,yardage_d,yardage_e,yardage_f,yardage_g,yardage_h,yardage_i,yardage_u from wy_details_size where lid=?`;
          pool.query(sql4,[lid],(err,result)=>{
            if(err) console.log(err);
            output.size=result;
          });
          var sql5=`select img from wy_details_pic where laptop_id=?`;
          pool.query(sql5,[lid],(err,result)=>{
            if(err) console.log(err);
            output.dibu=result;
            res.send(output);
          });
        })
      })
    }else{
      res.send(output);
    }
  })
   

//导出购物车路由器对象   /shopping
module.exports=Cart;

