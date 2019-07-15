//创建express模块
const express=require('express');
//express下创建商品详情路由器    
var details=express.Router();
//引入连接池
var pool=require('../pool/pool.js');

details.get("/",(req,res)=>{
    console.log(req.query);
  var lid=req.query.lid;
  console.log(lid);
  var output={
    products:{},
    specs:[],
    pics:[]
  }
  if(lid!==undefined){
    var sql1=`select * from wy_product where lid=?`;
    pool.query(sql1,[lid],(err,result)=>{
      if(err) console.log(err);
      output.products=result[0];
      //console.log(output);
      var family_id=output.products["family_id"];
      var sql2=`select spec,lid from wy_product where family_id=?`;
      pool.query(sql2,[family_id],(err,result)=>{
        if(err) console.log(err);
        output.specs=result;
        //console.log(output);
        var sql3=`select * from wy_product_pic where laptop_id=?`
        pool.query(sql3,[lid],(err,result)=>{
          if(err) console.log(err);
          output.pics=result;
          //console.log(output);
          res.send(output);
        })
      })
    })
  }else{
    res.send(output);
  }
})


//导出商品详情路由器对象   /details
module.exports=details;

