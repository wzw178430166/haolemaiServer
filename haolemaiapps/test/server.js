const http=require('http');
http.createServer((req,res)=>{
    //在服务端发送消息之前手动修改响应头
    res.writeHead(200,{
         url:"localhost:3000",
        "Access-Control-Allow-Origin":"http://127.0.0.1:5500"  //客户端网页地址栏中的地址
    });
    res.write('beijing sun 18-65');
    res.end();
}).listen(3000);