/**
 * Created by web on 2019/6/15.
 */
//引入模块11111111111111111
const express=require('express');
//express创建首页产品路由  product首页路由  看能不能改为index
var index=express.Router();
//引入连接池
var pool=require('../pool/pool.js');

   //获取首页传回数据，首页轮播图  导航产品轮播图11111111111111111111555555
      index.get("/",(req,res)=>{
            var sql=`SELECT * FROM wy_index_carousel where seq_recommended!=0 ORDER BY seq_recommended`;
        pool.query(sql,[],(err,result)=>{
            if(err){
            console.log(err);
            res.send({code:0});
        }else{
            res.send(result);
        }
        })
        })

      //首页品牌制造商   可以写在上面一次性请求1111111111111
        index.get("/brand",(req,res)=>{
            var sql=`SELECT * FROM index_shangpin`;
        pool.query(sql,[],(err,result)=>{
            if(err){
            console.log(err);
            res.send({code:0});
        }else{
            res.send(result);
        }
        })
        })
    //分类商品列表
        index.get("/fenlei",(req,res)=>{
           var j=req.query.j;
            var sql="SELECT * FROM index_fenlei where biaoji=?";
            pool.query(sql,[j],(err,result)=>{
                if(err){
                    console.log(err);
                    res.send({code:0});
                }else{
                    res.send(result);
                   console.log(result);
                }
            })
        })



//lalalalalala
//导出首页数据路由   /index
module.exports=index;