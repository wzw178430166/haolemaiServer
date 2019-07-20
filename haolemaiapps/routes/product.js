const express=require("express")
//创建商品列表路由  商品列表导航   尽量一次性请求完商品列表页所需要的数据 prouct_list.html
const product=express.Router();
const pool=require("../pool/pool.js")

//服务端接口地址http://localhost:3000/details
//客户端请求时:
//http://localhost:3000/details?lid=1
product.get("/",(req,res)=>{
  var lid=req.query.lid;
  console.log(lid,666);
  var output={
    product:{},
    productList:[],
    pics:[],
  }
  if(lid!==undefined){
    var sql1=`select * from wy_product where lid=?`;
    pool.query(sql1,[lid],(err,result)=>{
      if(err) console.log(err);
      output.product=result[0];
     // console.log(output+1);
      //var family_id=output.product["family_id"];
      var sql2=`select * from wy_index_product where laptop_list=?`;
      pool.query(sql2,[lid],(err,result)=>{
        if(err) console.log(err);
        output.productList=result;
//        console.log(output);
        var sql3=`select * from wy_laptop_pic where laptop_id=?`
        pool.query(sql3,[lid],(err,result)=>{
          if(err) console.log(err);
          output.pics=result;
//          console.log(output);
          res.send(output);
        })
      })
    })
  }else{
    res.send(output);
  }
})
//导出商品列表路由  /product
module.exports=product;