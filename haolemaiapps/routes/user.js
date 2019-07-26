//创建express模块
const express=require('express');
//express下创建用户路由器    
var router=express.Router();
//引入连接池
var pool=require('../pool/pool.js');
//引入手机验证码模块
const request=require("request");
const querystring=require("querystring");
var code=("000000"+Math.floor(Math.random()*999999)).slice(-6)
// parse application/json
// router.get("/liang",(req,res)=>{
//     res.send("hello world");
//     console.log("hello world")
// });
router.post("/sms_send",(req,res)=>{
    var captchaCondition=(Object.keys(req.body)[0]);
    console.log(captchaCondition);
    var phone=captchaCondition.phone;
    console.log(phone)
    var queryData = querystring.stringify({
        "mobile": req.body.phone,  // 接受短信的用户手机号码
        "tpl_id": req.body.tpl_id,  // 您申请的短信模板ID，根据实际情况修改
        "tpl_value": `#code#=${code}`,  // 您设置的模板变量，根据实际情况修改
        "key": req.body.key,  // 应用APPKEY(应用详细页查询)
    });
    
    var queryUrl = 'http://v.juhe.cn/sms/send?'+queryData;
    
    request(queryUrl, function (error, response, body, tpl_value) {
        if (!error && response.statusCode == 200) {
            console.log(body) // 打印接口返回内容
            
            // var jsonObj = JSON.parse(body); // 解析接口返回的JSON内容
            res.send(tpl_value);
            return;
        } 
    })
});
//引入session模块
 //配置session
 //添加路由（用户注册）
 router.post('/register',function(req,res){
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
 router.post('/add',function(req,res){
    var phone = req.body.phone;
    // var upwd = req.body.upwd;
    // console.log(phone);
    var sql1 = "SELECT count(*) as counta FROM users WHERE phone=? ";
    pool.query(sql1, phone, function (err, result) {
        if (err) throw err;
        if (result[0].counta > 0) {
            res.send({code:-1,msg:"该手机号已注册"});
        } else {
        var sql2="INSERT INTO users(phone)VALUES(?)";
        pool.query(sql2,[phone],(err,result)=>{
            if(err)throw err;
            if(result.affectedRow==0){
                res.send("1");
            }else{
                res.send("0");
            }
        })
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

