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
            var j=req.query.j
            console.log(j);
            var sql=`SELECT * FROM index_shangpin where amount=?`;
        pool.query(sql,[j],(err,result)=>{
            if(err){
            console.log(err);
            res.send({code:0});
        }else{
            res.send(result);
           
        }
        })
        })
    //分类商品主页列表
        index.get("/fenlei",(req,res)=>{
           var j=req.query.j;
            var sql="SELECT * FROM index_fenlei where biaoji=?";
            pool.query(sql,[j],(err,result)=>{
                if(err){
                   // console.log(err);
                    res.send({code:0});
                }else{
                    res.send(result);
                  // console.log(result);
                }
            })
        })
    //商品列表，分页显示
        index.get("/commlist",(req,res)=>{
            var pno =req.query.pno;
            var ps=req.query.pageSize;
            //设置默认值
            if(!pno){pno=1}
            if(!ps){ps=4}
            //第一个sql语句，当前语句
            var obj={code:1,msg:"查询成功"}
            var sql="SELECT id,paixu,biaoji,img_url,title1,title2,price1,price2 FROM shangpin_list LIMIT ?,?";
            var off=(pno-1)*ps;
            ps=parseInt(ps);//转换成整数
            pool.query(sql,[off,ps],(err,result)=>{
                if(err) throw err;
                obj.data=result;//强行赋值
                var sql="SELECT count(*) AS c FROM shangpin_list";
                pool.query(sql,(err,result)=>{
                    if(err) throw err;
                    //查询得到的是result[{c:?}]
                    var pc=Math.ceil(result[0].c/ps);//计算当页内容
                    obj.pc=pc;
                    res.send(obj);
                    console.log(pc);
                })
            })
        })
    //筛选列表分类
       index.get("/fenlei1",(req,res)=>{
           //查询index_fenlei表中，title字节段重复的数据
           var sql="SELECT title FROM shangpin_list group by title";
           pool.query(sql,(err,result)=>{
               if(err) throw err;
               res.send(result);
               console.log(result);
           })
       })
    //筛选列表品牌。。。
        index.get("/brand1",(req,res)=>{
            // 查询index_fenlei 表中，brand字节段重复的数据和次数
            // var sql="select brand,count(*) as count from index_fenlei group by brand having count>1;";
            //查询表中brand的值，去除重复的数据 
            var sql="select brand from shangpin_list group by brand";
            pool.query(sql,(err,result)=>{
                if(err) throw err;
                res.send(result);
            })
        })
    //筛选尺寸。。。
    

    //筛选商品商品,根据传回来的参数查询数据库发送请求
    index.get('/btn',(req,res)=>{
         var fenl = req.query.fenl
         if(!fenl){
          res.send({code:0,case:"没有接收到数据"})
         }
       var sql = "select * from shangpin_list where title=?"
        pool.query(sql,[fenl],(err,result)=>{
            if(err) throw err;//如果有错误，抛出错误
            res.send(result);
        })
    })
    //筛选商品品牌，根据穿回来的参数查询数据
    index.get("/btn2",(req,res)=>{
       var brand =req.query.brand;
        if(!brand){
            res.send({code:0,case:"没有接收到数据"});
        }
       var sql="select * from shangpin_list where brand=?"
       pool.query(sql,[brand],(err,result)=>{
           if(err) throw err;
           res.send(result);
       })
    })


//lalalalalala
//导出首页数据路由   /index
module.exports=index;