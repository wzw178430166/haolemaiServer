//引入mysql模块1111111
const mysql=require('mysql');
//创建连接池
var pool=mysql.createPool({
     host:'127.0.0.1',
	 port:'3306',
	 user:'root',
     password:'',
	 database:'haolemaiapp',
	 connectionLimit:20 //设置连接池的大小
});
 //冻结连接池 不能修改
  Object.freeze(pool);
//导出连接池对象
  module.exports=pool;