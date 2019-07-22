#设置客户端连接的编码kk
SET NAMES UTF8;
#丢弃数据库
DROP DATABASE IF EXISTS haolemaiapp;
#创建数据库
CREATE DATABASE haolemaiapp CHARSET=UTF8;
#进入该数据库
USE haolemaiapp;



###################################################################################################

#创建用户数据表  个人中心
CREATE TABLE users(
	id INT AUTO_INCREMENT UNIQUE,
	uname VARCHAR(20),
	upwd CHAR(32),   # md5()  单向加密没有解密算法 32位
	phone CHAR(11)
);

#往用户数据表插入数据（定义向前台传递的接口）
INSERT INTO users VALUES('1','www178430166@qq.com','waf182dd545','13533870622');
INSERT INTO users VALUES(NULL,'www1254877418@qq.com','ttf1f5545','13660132410');
INSERT INTO users VALUES(NULL,'www178430166@qq.com','w1111111111','18320006057');
INSERT INTO users VALUES(NULL,'tom','123456a','18320006057');



########################################################################################################

/****购物车11****/
CREATE TABLE wy_cart(
  id INT PRIMARY KEY AUTO_INCREMENT,
      /*对应用户的id*/
  lid VARCHAR(255),
  price   DECIMAL(10,2),
  size   VARCHAR(255),
  img    VARCHAR(255),
  lname  VARCHAR(255),
  subtitle VARCHAR(255),
  title_sec VARCHAR(255),
  title VARCHAR(255)
);
/*INSERT INTO wy_cart VALUES(null,1,238,'35');*/





##################################################################################################


#首页轮播广告商品   首页
CREATE TABLE wy_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  seq_recommended TINYINT,
  href VARCHAR(128)
);

#首页轮播广告商品
INSERT INTO wy_index_carousel VALUES
(NULL,'img/index/banner1.png','轮播广告商品1',1,'./message/break6.jpg'),
(NULL,'img/index/banner2.png','轮播广告商品2',2,'./message/break2.jpg'),
(NULL,'img/index/banner3.png','轮播广告商品3',3,'./message/break3.jpg'),
(NULL,'img/index/banner4.png','轮播广告商品4',4,'./message/break4.jpg'),
(NULL,'img/index/banner4.png','轮播广告商品5',5,'./message/break5.jpg'),
(NULL,'img/index/banner4.png','轮播广告商品6',0,'./message/break1.jpg');



#首页品牌制造商 
CREATE TABLE brand_manufacturer(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  seq_recommended TINYINT,
  href VARCHAR(128),
  price DECIMAL(10,2)
);

/****首页品牌制造商****/
INSERT INTO brand_manufacturer VALUES
(NULL,'img/index/banner1.png','海外制造商',1,'./message/1131323.jpg','9.9'),
(NULL,'img/index/banner2.png','CK制造商',2,'./message/d1f21d3.png','25'),
(NULL,'img/index/banner3.png','新秀丽制造商',3,'./message/break3.jpg','34.9'),
(NULL,'img/index/banner4.png','MUJI制造商',4,'./message/break4.jpg','35'),
(NULL,'img/index/banner4.png','轮播广告商品5',0,'./message/break5.jpg','102'),
(NULL,'img/index/banner4.png','轮播广告商品6',0,'./message/break1.jpg','105');

#首页导航栏轮播广告商品列表
CREATE TABLE wy_nav_carouse(
  nav INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,    #每个导航栏产品应用所属的编号
  img VARCHAR(128),  #图片名称
  title VARCHAR(64),  #图片标题
  seq_recommended TINYINT,  #商品的排名
  href VARCHAR(128)   #图片地址
);

#首页导航栏商品轮播广告商品列表
INSERT INTO wy_nav_carouse VALUES
(NULL,1,'message/nav1/nav1.1.jpg','轮播广告商品1',1,'./message/nav1/nav1.1.jpg'),
(NULL,1,'message/nav1/nav1.2.jpg','轮播广告商品2',2,'./message/nav1/nav1.2.jpg'),
(NULL,1,'img/index/banner3.png','轮播广告商品3',3,'./message/nav1/nav1.3.jpg'),
(NULL,2,'img/index/banner4.png','轮播广告商品4',4,'./message/nav1/nav2.1.jpg'),
(NULL,2,'img/index/banner4.png','轮播广告商品5',5,'./message/nav1/nav2.2.jpg'),
(NULL,2,'img/index/banner4.png','轮播广告商品6',0,'./message/nav1/nav2.3.jpg'),
(NULL,2,'img/index/banner4.png','轮播广告商品7',0,'./message/nav1/nav2.4.jpg');



/*首页商品数据第一页和第三页共用*/
CREATE TABLE index_shangpin(
id INT PRIMARY KEY AUTO_INCREMENT,
img_url VARCHAR(60),
title1 VARCHAR(40),
title2 VARCHAR(40),
amount INT
);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_1.jpg","99封顶","这么便宜不来看看吗",1);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_2.jpg","99封顶","这么便宜不来看看吗",1);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_3.jpg","99封顶","这么便宜不来看看吗",1);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_4.jpg","99封顶","这么便宜不来看看吗",1);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_5.jpg","99封顶","这么便宜不来看看吗",1);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_6.jpg","99封顶","这么便宜不来看看吗",1);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_7.jpg","99封顶","这么便宜不来看看吗",1);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/temai/temai1.png","99封顶","这么便宜呢",2);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/temai/temai2.png","99封顶","这么便宜呢",2);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/temai/temai3.png","99封顶","这么便宜呢",2);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/temai/temai4.png","99封顶","这么便宜呢",2);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/temai/temai5.png","99封顶","这么便宜呢",2);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/temai/temai6.png","99封顶","这么便宜呢",2);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/temai/temai7.png","99封顶","这么便宜呢",2);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/temai/temai8.png","99封顶","这么便宜呢",2);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_1.jpg","99封顶","这么便宜不来看看吗",3);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_2.jpg","99封顶","这么便宜不来看看吗",3);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_3.jpg","99封顶","这么便宜不来看看吗",3);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_4.jpg","99封顶","这么便宜不来看看吗",3);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_5.jpg","99封顶","这么便宜不来看看吗",3);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_6.jpg","99封顶","这么便宜不来看看吗",3);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_7.jpg","99封顶","这么便宜不来看看吗",3);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/temai/temai1.png","99封顶","这么便宜呢",4);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/temai/temai2.png","99封顶","这么便宜呢",4);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/temai/temai3.png","99封顶","这么便宜呢",4);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/temai/temai4.png","99封顶","这么便宜呢",4);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/temai/temai5.png","99封顶","这么便宜呢",4);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/temai/temai6.png","99封顶","这么便宜呢",4);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/temai/temai7.png","99封顶","这么便宜呢",4);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/temai/temai8.png","99封顶","这么便宜呢",4);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_1.jpg","99封顶","这么便宜不来看看吗",5);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_2.jpg","99封顶","这么便宜不来看看吗",5);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_3.jpg","99封顶","这么便宜不来看看吗",5);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_4.jpg","99封顶","这么便宜不来看看吗",5);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_5.jpg","99封顶","这么便宜不来看看吗",5);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_6.jpg","99封顶","这么便宜不来看看吗",5);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_7.jpg","99封顶","这么便宜不来看看吗",5);


/*分类列表*/
CREATE TABLE index_fenlei(
  id INT PRIMARY KEY AUTO_INCREMENT,
  img_url VARCHAR(90),
  title  VARCHAR(40),
  brand  VARCHAR(30),
  biaoji INT(50) 
);
/*查询分类的时候，用分类的表来查询商品的品牌和类别*/
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie/yundong1.jpg","鸿星尔克","杂牌",1);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie/yundong2.png","三叶草","杂牌",1);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie/yundong3.jpg","特步","杂牌",1);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie/yundong4.jpg","耐克","杂牌",1);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie/yundong5.jpg","阿迪达斯","杂牌",1);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie/yundong6.jpg","亚瑟士","鸿星尔克",1);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie/yundong7.jpg","索康尼","鸿星尔克",1);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie/yundong8.jpg","361","鸿星尔克",1);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie/yundong9.jpg","李宁","鸿星尔克",1);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie/yundong10.jpg","安德玛","鸿星尔克",1);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie/yundong11.jpg","乔丹","外星人",1);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie/yundong12.jpg","布鲁克斯","外星人",1);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie/yundong12.jpg","花花公子","外星人",1);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/yifu/yifu1.jpg","布鞋","外星人",2);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/yifu/yifu2.jpg","布鞋","外星人",2);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/yifu/yifu3.jpg","布鞋","外星人",2);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/yifu/yifu4.png","布鞋","杂牌",2);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/yifu/yifu5.png","布鞋","杂牌",2);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/yifu/yifu6.png","布鞋","杂牌",2);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/yifu/yifu7.jpg","布鞋","杂牌",2);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/yifu/yifu8.png","布鞋","杂牌",2);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/yifu/yifu9.png","布鞋","杂牌",2);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/yifu/yifu10.png","布鞋","杂牌",2);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/yifu/yifu11.png","布鞋","杂牌",2);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/yifu/yifu12.jpg","布鞋","杂牌",2);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie1.jpg","实力拖鞋","杂牌",3);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie2.jpg","实力拖鞋","杂牌",3);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie3.jpg","实力拖鞋","杂牌",3);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie4.jpg","实力拖鞋","杂牌",3);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie5.jpg","实力拖鞋","杂牌",3);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie6.jpg","实力拖鞋","杂牌",3);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie7.jpg","实力拖鞋","杂牌",3);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie8.jpg","实力拖鞋","杂牌",3);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie9.jpg","实力拖鞋","杂牌",3);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie10.jpg","实力拖鞋","杂牌",3);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie11.jpg","实力拖鞋","杂牌",3);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力拖鞋","杂牌",3);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/child/child1.png","实力拖鞋","杂牌",4);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/child/child2.jpg","实力拖鞋","杂牌",4);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/child/child3.jpg","实力拖鞋","杂牌",4);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/child/child4.jpg","实力拖鞋","杂牌",4);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/child/child5.png","实力拖鞋","杂牌",4);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/child/child6.png","实力拖鞋","杂牌",4);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/child/child7.png","实力拖鞋","杂牌",4);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/child/child8.png","实力拖鞋","杂牌",4);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/child/child9.png","实力拖鞋","杂牌",4);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/child/child10.png","实力拖鞋","杂牌",4);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/child/child11.png","实力拖鞋","杂牌",4);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/child/child12.png","实力拖鞋","杂牌",4);
/*循环几次无用的商品*/
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie1.jpg","实力拖鞋","杂牌",5);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie2.jpg","实力凉鞋","杂牌",5);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie3.jpg","实力皮鞋","杂牌",5);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie4.jpg","实力人字拖","杂牌",5);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie5.jpg","黑色凉鞋","杂牌",5);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie6.jpg","实力凉鞋","杂牌",5);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie7.jpg","实力凉鞋","杂牌",5);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie8.jpg","实力凉鞋","杂牌",5);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie9.jpg","实力凉鞋","杂牌",5);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie10.jpg","实力凉鞋","杂牌",5);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie11.jpg","实力凉鞋","杂牌",5);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",5);
/*----*/
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",6);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",6);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",6);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",6);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",6);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",6);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",6);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",6);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",6);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",6);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",6);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",6);
/*----*/
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",7);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",7);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",7);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",7);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",7);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",7);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",7);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",7);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",7);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",7);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",7);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",7);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",7);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",7);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","实力凉鞋","杂牌",7);
/*------*/
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","人字拖","星爷代言",8);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","人字拖","星爷代言",8);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","人字拖","星爷代言",8);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","人字拖","星爷代言",8);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","人字拖","星爷代言",8);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","人字拖","星爷代言",8);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","人字拖","星爷代言",8);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","人字拖","星爷代言",8);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","人字拖","星爷代言",8);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","人字拖","星爷代言",8);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","人字拖","星爷代言",8);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","人字拖","星爷代言",8);
INSERT INTO index_fenlei VALUES(null,"http://127.0.0.1:8095/img/appimg/minImg/xie1/xie12.jpg","人字拖","星爷代言",8);
/*商品列表*/
CREATE TABLE shangpin_list(
  id INT PRIMARY KEY AUTO_INCREMENT,
  title  VARCHAR(40),
  brand  VARCHAR(30),
  img_url VARCHAR(90),
  title1  VARCHAR(40),
  title2  VARCHAR(50),
  price1   DECIMAL(10,2),
  price2   DECIMAL(1,1),
  paixu  INT(100),
  biaoji INT(50)
);
INSERT INTO shangpin_list VALUES(null,"休闲鞋","鸿星尔克","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi1.jpg","杂牌女式EPIC REACT FLYKNIT柔软回弹跑步鞋","休闲鞋5.5折封顶",319,4,1,1);
INSERT INTO shangpin_list VALUES(null,"休闲鞋","鸿星尔克","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.jpg","男士休闲便捷鞋，清爽透气","杂牌6.5折封顶",119,4,2,1);
/*循环测试数据*/
INSERT INTO shangpin_list VALUES(null,"休闲鞋","鸿星尔克","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi3.jpg","又酷又帅，穿了没人爱","某知名品牌3.5折封顶",819,4,3,1);
INSERT INTO shangpin_list VALUES(null,"休闲鞋","鸿星尔克","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi1.png","高仿跑步鞋，便宜耐穿","杂牌8.5折封顶",19,4,4,1);
INSERT INTO shangpin_list VALUES(null,"休闲鞋","鸿星尔克","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,5,1);
INSERT INTO shangpin_list VALUES(null,"休闲鞋","鸿星尔克","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,6,1);
INSERT INTO shangpin_list VALUES(null,"休闲鞋","鸿星尔克","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,7,1);
INSERT INTO shangpin_list VALUES(null,"布鞋","三叶草","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,8,1);
INSERT INTO shangpin_list VALUES(null,"布鞋","三叶草","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,9,1);
INSERT INTO shangpin_list VALUES(null,"布鞋","三叶草","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,10,1);
INSERT INTO shangpin_list VALUES(null,"布鞋","三叶草","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,11,1);
INSERT INTO shangpin_list VALUES(null,"跑步鞋","特步","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,12,1);
INSERT INTO shangpin_list VALUES(null,"跑步鞋","特步","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,13,1);
INSERT INTO shangpin_list VALUES(null,"跑步鞋","特步","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,14,1);
INSERT INTO shangpin_list VALUES(null,"跑步鞋","特步","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,15,1);
INSERT INTO shangpin_list VALUES(null,"跑步鞋","特步","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,16,1);
INSERT INTO shangpin_list VALUES(null,"跑步鞋","特步","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,17,1);
INSERT INTO shangpin_list VALUES(null,"皮鞋","鳄鱼牌","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,18,1);
INSERT INTO shangpin_list VALUES(null,"皮鞋","鳄鱼牌","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,19,1);
INSERT INTO shangpin_list VALUES(null,"皮鞋","鳄鱼牌","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,20,1);
INSERT INTO shangpin_list VALUES(null,"皮鞋","鳄鱼牌","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,21,1);
INSERT INTO shangpin_list VALUES(null,"皮鞋","鳄鱼牌","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,22,1);
INSERT INTO shangpin_list VALUES(null,"皮鞋","鳄鱼牌","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,23,1);
INSERT INTO shangpin_list VALUES(null,"皮鞋","鳄鱼牌","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,24,1);
INSERT INTO shangpin_list VALUES(null,"人字拖","未知品牌","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,25,1);
INSERT INTO shangpin_list VALUES(null,"人字拖","未知品牌","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,26,1);
INSERT INTO shangpin_list VALUES(null,"人字拖","未知品牌","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,27,1);
INSERT INTO shangpin_list VALUES(null,"人字拖","未知品牌","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,28,1);
INSERT INTO shangpin_list VALUES(null,"人字拖","未知品牌","http://127.0.0.1:8095/img/appimg/shangpinlist/xie/xiezi2.png","Nike耐克女式EPIC REACT FLYKNIT柔软回弹跑步鞋","耐克6.5折封顶",519,4,29,1);
/*筛选分类列表*/








#########################################################################################################

/**商品图片列表  轮播图         商品列表页**/
CREATE TABLE wy_laptop_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #商品编号
  img VARCHAR(128),            #图片路径
  href VARCHAR(128),            #商品详情地址
  lg VARCHAR(128)             #大图片路径
);

/**商品图片列表   轮播图**/
INSERT INTO wy_laptop_pic VALUES
(NULL, 1, 'http://127.0.0.1:8095/img/lunbotu/1.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 1, 'http://127.0.0.1:8095/img/lunbotu/2.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 1, 'http://127.0.0.1:8095/img/lunbotu/3.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 1, 'http://127.0.0.1:8095/img/lunbotu/1.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 2, './message/nav1/nav2.1.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 2, './message/nav1/nav2.2.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 2, './message/nav1/nav2.3.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 2, './message/nav1/nav2.4.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 3, './message/nav1/nav3.1.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 3, './message/nav1/nav3.2.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 4, './message/nav1/nav4.1.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 4, './message/nav1/nav4.2.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 4, './message/nav1/nav4.3.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 5, './message/nav1/nav3.1.jpg','img/product/md/57e3b072N661cd00d.jpg','img/product/lg/57e3b072N661cd00d.jpg'),
(NULL, 5, './message/nav1/nav3.2.jpg','img/product/md/57e1ff09Nf610fea3.jpg','img/product/lg/57e1ff09Nf610fea3.jpg'),
(NULL, 5, './message/nav1/nav1.3.jpg','img/product/md/57e1ff17N286390a9.jpg','img/product/lg/57e1ff17N286390a9.jpg'),
(NULL, 5, './message/nav1/nav2.4.jpg','img/product/md/57e1ff2fN8a36d0fe.jpg','img/product/lg/57e1ff2fN8a36d0fe.jpg'),
(NULL, 5, './message/nav1/nav3.1.jpg','img/product/md/57e52dffNa4d8ce2c.jpg','img/product/lg/57e52dffNa4d8ce2c.jpg'),
(NULL, 5, './message/nav1/nav2.2.jpg','img/product/md/57e52e03N4ec367dd.jpg','img/product/lg/57e52e03N4ec367dd.jpg'),
(NULL, 6, './message/nav1/nav4.2.jpg','img/product/md/57e3b072N661cd00d.jpg','img/product/lg/57e3b072N661cd00d.jpg'),
(NULL, 6, './message/nav1/nav3.1.jpg','img/product/md/57e1ff09Nf610fea3.jpg','img/product/lg/57e1ff09Nf610fea3.jpg'),
(NULL, 6, './message/nav1/nav1.2.jpg','img/product/md/57e1ff2fN8a36d0fe.jpg','img/product/lg/57e1ff2fN8a36d0fe.jpg'),
(NULL, 6, './message/nav1/nav3.2.jpg','img/product/md/57e52dffNa4d8ce2c.jpg','img/product/lg/57e52dffNa4d8ce2c.jpg'),
(NULL, 6, './message/nav1/nav4.2.jpg','img/product/md/57e52e03N4ec367dd.jpg','img/product/lg/57e52e03N4ec367dd.jpg'),
(NULL, 6, './message/nav1/nav4.1.jpg','img/product/md/57e52e06N116974f7.jpg','img/product/lg/57e52e06N116974f7.jpg'),
(NULL, 7, './message/nav1/nav2.4.jpg','img/product/md/57e3b072N661cd00d.jpg','img/product/lg/57e3b072N661cd00d.jpg'),
(NULL, 7, './message/nav1/nav2.1.jpg','img/product/md/57e1ff17N286390a9.jpg','img/product/lg/57e1ff17N286390a9.jpg'),
(NULL, 7, './message/nav1/nav3.1.jpg','img/product/md/57e1ff2fN8a36d0fe.jpg','img/product/lg/57e1ff2fN8a36d0fe.jpg'),
(NULL, 7, './message/nav1/nav4.1.jpg','img/product/md/57e52dffNa4d8ce2c.jpg','img/product/lg/57e52dffNa4d8ce2c.jpg'),
(NULL, 7, './message/nav1/nav2.4.jpg','img/product/md/57e52e03N4ec367dd.jpg','img/product/lg/57e52e03N4ec367dd.jpg'),
(NULL, 8, './message/nav1/nav1.1.jpg','img/product/md/57e1ff2fN8a36d0fe.jpg','img/product/lg/57e1ff2fN8a36d0fe.jpg'),
(NULL, 8, './message/nav1/nav4.1.jpg','img/product/md/57e52dffNa4d8ce2c.jpg','img/product/lg/57e52dffNa4d8ce2c.jpg'),
(NULL, 8, './message/nav1/nav2.4.jpg','img/product/md/57e52e03N4ec367dd.jpg','img/product/lg/57e52e03N4ec367dd.jpg'),
(NULL, 9, './message/nav1/nav3.1.jpg','img/product/md/57e1ff2fN8a36d0fe.jpg','img/product/lg/57e1ff2fN8a36d0fe.jpg'),
(NULL, 9, './message/nav1/nav2.1.jpg','img/product/md/57e52dffNa4d8ce2c.jpg','img/product/lg/57e52dffNa4d8ce2c.jpg'),
(NULL, 9, './message/nav1/nav3.1.jpg','img/product/md/57e52e03N4ec367dd.jpg','img/product/lg/57e52e03N4ec367dd.jpg'),
(NULL, 10, './message/nav1/nav2.1.jpg','img/product/md/57e1ff2fN8a36d0fe.jpg','img/product/lg/57e1ff2fN8a36d0fe.jpg'),
(NULL, 10, './message/nav1/nav2.2.jpg','img/product/md/57e52dffNa4d8ce2c.jpg','img/product/lg/57e52dffNa4d8ce2c.jpg'),
(NULL, 10, './message/nav1/nav3.2.jpg','img/product/md/57e52e03N4ec367dd.jpg','img/product/lg/57e52e03N4ec367dd.jpg');



/****产品列表商品****/
CREATE TABLE wy_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),   #标题
  details VARCHAR(128),  #副标题
  log_t VARCHAR(64),   #标签码 橙色的提示
  product_title VARCHAR(64),  #商品名称
  pic VARCHAR(128),  #商品图片
  price DECIMAL(10,2),  
  href VARCHAR(128),
  seq_recommended TINYINT,
  seq_new_arrival TINYINT,
  seq_top_sale TINYINT,
  original DECIMAL(10,2),
  product_msg VARCHAR(128),
  laptop_list INT            #商品编号
);

/****商品列表商品****/
INSERT INTO wy_index_product VALUES
(NULL, '夏季新品', '夏季热力爆品 抢先预览','限时购','男式运动弹力T桖','./message/nav2/summer/summer1.png', 6988, 'product.html?lid=1', 1, 1, 1,197,'舒适透气，弹力拉伸',1),
(NULL, '小米Air 金属超轻薄', '夏季热力爆品 抢先预览','7月画册特惠','拉拉杯 无螺纹玻璃随行杯','./message/nav2/summer/summer2.png', 89, 'product.html?lid=2', 2, 2, 2,88,'量身定做，弹力拉伸',1),
(NULL, '联想E480C 轻薄系列', '夏季热力爆品 抢先预览','特价','男式运动弹力T桖','./message/nav2/summer/summer3.png', 5399, 'product.html?lid=3', 3, 3, 3,97,'家的感觉，超薄避孕套',1),
(NULL, '华硕RX310 金属超极本', '夏季热力爆品 抢先预览','7月画册特惠','男式运动弹力T桖','./message/nav2/summer/summer4.png', 55, 'product.html?lid=4', 4, 4, 4,64,'特价游，弹力拉伸',1),
(NULL, '联想小新700 电竞版游戏本', '夏季热力爆品 抢先预览','好货内部价','男式运动弹力T桖','./message/nav2/summer/summer5.png', 85, 'product.html?lid=5', 5, 5, 5,97,'舒适透气，弹力拉伸',1),
(NULL, '戴尔灵越燃7000 轻薄窄边', '夏季热力爆品 抢先预览','特价','男式运动弹力T桖','./message/nav2/summer/summer6.png', 5199, 'product.html?lid=6', 6, 6, 6,97,'三指一扣，一秒即开',1),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer1.png', 46, 'product.html?lid=7', 0, 0, 0,97,'舒适透气，弹力拉伸',1),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer5.png', 46, 'product.html?lid=8', 0, 0, 0,97,'舒适透气，弹力拉伸',1),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer4.png', 46, 'product.html?lid=9', 0, 0, 0,97,'舒适透气，弹力拉伸',1),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer6.png', 46, 'product.html?lid=10', 0, 0, 0,97,'舒适透气，弹力拉伸',1),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer5.png', 46, 'product.html?lid=11', 0, 0, 0,97,'舒适透气，弹力拉伸',1),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer1.png', 46, 'product.html?lid=12', 0, 0, 0,97,'舒适透气，弹力拉伸',1),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer7.png', 46, 'product.html?lid=13', 0, 0, 0,97,'舒适透气，弹力拉伸',1),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer5.png', 46, 'product.html?lid=14', 0, 0, 0,97,'舒适透气，弹力拉伸',1),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer7.png', 46, 'product.html?lid=15', 0, 0, 0,97,'舒适透气，弹力拉伸',1),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer2.png', 46, 'product.html?lid=16', 0, 0, 0,97,'舒适透气，弹力拉伸',2),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer5.png', 46, 'product.html?lid=17', 0, 0, 0,97,'舒适透气，弹力拉伸',2),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer7.png', 46, 'product.html?lid=18', 0, 0, 0,97,'舒适透气，弹力拉伸',2),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer7.png', 46, 'product.html?lid=19', 0, 0, 0,97,'舒适透气，弹力拉伸',2),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer4.png', 46, 'product.html?lid=20', 0, 0, 0,97,'舒适透气，弹力拉伸',2),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer9.png', 46, 'product.html?lid=21', 0, 0, 0,97,'舒适透气，弹力拉伸',2),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer7.png', 46, 'product.html?lid=22', 0, 0, 0,97,'舒适透气，弹力拉伸',2),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer7.png', 46, 'product.html?lid=23', 0, 0, 0,97,'舒适透气，弹力拉伸',2),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer10.png', 46, 'product.html?lid=24', 0, 0, 0,97,'舒适透气，弹力拉伸',2),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer8.png', 46, 'product.html?lid=25', 0, 0, 0,97,'舒适透气，弹力拉伸',2),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer7.png', 46, 'product.html?lid=26', 0, 0, 0,97,'舒适透气，弹力拉伸',2),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer6.png', 46, 'product.html?lid=27', 0, 0, 0,97,'舒适透气，弹力拉伸',3),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer5.png', 46, 'product.html?lid=28', 0, 0, 0,97,'舒适透气，弹力拉伸',3),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer7.png', 46, 'product.html?lid=29', 0, 0, 0,97,'舒适透气，弹力拉伸',3),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer1.png', 46, 'product.html?lid=30', 0, 0, 0,97,'舒适透气，弹力拉伸',3),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer7.png', 46, 'product.html?lid=31', 0, 0, 0,97,'舒适透气，弹力拉伸',3),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer4.png', 46, 'product.html?lid=32', 0, 0, 0,97,'舒适透气，弹力拉伸',3),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer7.png', 46, 'product.html?lid=33', 0, 0, 0,97,'舒适透气，弹力拉伸',3),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer5.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',3),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer7.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',3),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer6.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',3),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer7.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',3),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer8.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',3),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer6.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',4),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer7.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',4),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer8.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',4),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer6.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',4),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer7.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',4),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer8.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',4),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer4.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',4),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer7.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',4),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer8.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',4),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer2.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',4),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer7.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',4),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer1.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',4),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer5.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',5),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer7.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',5),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer4.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',5),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer7.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',5),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer5.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',5),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer7.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',6),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer10.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',6),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer5.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',6),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer7.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',6),
(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览',NULL,'男式运动弹力T桖','./message/nav2/summer/summer8.png', 46, 'product.html?lid=1', 0, 0, 0,97,'舒适透气，弹力拉伸',6),

(NULL, '神州战神Z7M 高性价比游戏本', '夏季热力爆品 抢先预览','好货内部价','男式运动弹力T桖','./message/nav2/summer/summer8.png', 33, 'product.html', 0, 0, 0,97,'舒适透气，弹力拉伸',5);


#########################################################################################################

/**商品的（每对鞋子存有的尺寸）**/
CREATE TABLE wy_details_size(
  lid INT PRIMARY KEY AUTO_INCREMENT,   /*每对鞋的id*/
  family_id INT,             /*种类归类*/
  yardage_a VARCHAR(128),      /*尺寸*/
  yardage_b VARCHAR(128),      
  yardage_c VARCHAR(128),        
  yardage_d VARCHAR(128),   
  yardage_e VARCHAR(128),       
  yardage_f VARCHAR(128),    
  yardage_g VARCHAR(128),     
  yardage_h VARCHAR(128),      
  yardage_i VARCHAR(128),       
  yardage_u VARCHAR(128)   
);
/**商品的（每对鞋子存有的尺寸）**/
INSERT INTO wy_details_size VALUES 
(1,1,'w5','w6','w7','w8','w9','w10','w11','w12','w13','w14'),
(2,2,'35','35.5','36','38','39','39.5','40','42','43','44'),
(3,3,'35.5','36.5','37','38','39','40.5','41.5','42.5','43','44'),
(4,4,'w5','w6','w7','w8','w9','w10','w11','w12','w13','w14'),
(5,5,'w5','w6','w7','w8','w9','w10','w11','w12','w13','w14');

/**商品详情信息    商品详情页**/
CREATE TABLE wy_product(
  lid INT PRIMARY KEY AUTO_INCREMENT, 
  family_id INT,              #所属类型型号家族编号
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题
  title_sec VARCHAR(128),       #主标题
  subtitle_sec VARCHAR(128),    #副标题
  price DECIMAL(10,2),        #价格
  original DECIMAL(10,2),     #原价
  promise VARCHAR(64),        #服务承诺 此商品仅支持退货，不支持换货。
  lname VARCHAR(32),          #商品名称
  logo_img VARCHAR(128),      #商标
  logo_test VARCHAR(128),     #商标文字
  project VARCHAR(128),       #专题列表地址
  shelf_time BIGINT,          #下架时间
  spec VARCHAR(64),           #规格/颜色
  category VARCHAR(32),       #所属分类
  details VARCHAR(1024),      #产品详细说明
  sold_count INT,             #已售出的数量
  is_onsale BOOLEAN           #是否促销中
);

/**商品详情信息**/
INSERT INTO wy_product VALUES 
(1,1,'限时特卖','满2件件200元，还差1件享受此活动','满折','满2件件200元，还差1件享受此活动。','129','599','此商品仅支持退货，不支持换货。','女式 卡骆驰女士激浪静电纹束带鞋','http://0.image.al.okbuycdn.com//static/a62b07b87986914e495e0333ea5b6cd8.png','CROCS卡骆驰','http://127.0.0.1:8095/index',1564070351000,'32码粉红色','运动鞋','产品详细说明',2011,true),
(NULL,1,'限时特卖','满500元减100元，还差311元享受此活动。','满折','【下单8折】crocs度假嗨起 >>','215','499','此商品仅支持退货，不支持换货。','女式 卡骆驰女士都会街头帆布便鞋','http://0.image.al.okbuycdn.com//static/a62b07b87986914e495e0333ea5b6cd8.png','CROCS卡骆驰','http://127.0.0.1:8095/index',1568044751000,'32码粉红色','运动鞋','产品详细说明',2011,true),
(NULL,1,'聚划算','李宁夏装特惠','满折','【下单8折】crocs度假嗨起 >>','77','211','此商品仅支持退货，不支持换货。','男式 李宁卓逸轻便一体织百搭休闲鞋','http://0.image.al.okbuycdn.com//static/a62b07b87986914e495e0333ea5b6cd8.png','CROCS卡骆驰','http://127.0.0.1:8095/index',1570636751000,'32码粉红色','运动鞋','产品详细说明',2011,true),
(NULL,1,'限时特卖','【特价且部分享8折】CROCS清仓','满折','【下单8折】crocs度假嗨起 >>','129','599','此商品仅支持退货，不支持换货。','女式 卡骆驰女士激浪静电纹束带鞋','http://0.image.al.okbuycdn.com//static/a62b07b87986914e495e0333ea5b6cd8.png','CROCS卡骆驰','http://127.0.0.1:8095/index',1565884751000,'32码粉红色','运动鞋','产品详细说明',2011,true),
(NULL,1,'限时特卖','【特价且部分享8折】CROCS清仓','满折','【下单8折】crocs度假嗨起 >>','129','599','此商品仅支持退货，不支持换货。','女式 卡骆驰女士激浪静电纹束带鞋','http://0.image.al.okbuycdn.com//static/a62b07b87986914e495e0333ea5b6cd8.png','CROCS卡骆驰','http://127.0.0.1:8095/index',1570636751000,'32码粉红色','运动鞋','产品详细说明',2011,true),
(NULL,2,'限时特卖','【特价且部分享8折】CROCS清仓','满折','【下单8折】crocs度假嗨起 >>','129','599','此商品仅支持退货，不支持换货。','女式 卡骆驰女士激浪静电纹束带鞋','http://0.image.al.okbuycdn.com//static/a62b07b87986914e495e0333ea5b6cd8.png','CROCS卡骆驰','http://127.0.0.1:8095/index',1565884751000,'32码粉红色','运动鞋','产品详细说明',2011,true),
(NULL,2,'限时特卖','【特价且部分享8折】CROCS清仓','满折','【下单8折】crocs度假嗨起 >>','129','599','此商品仅支持退货，不支持换货。','女式 卡骆驰女士激浪静电纹束带鞋','http://0.image.al.okbuycdn.com//static/a62b07b87986914e495e0333ea5b6cd8.png','CROCS卡骆驰','http://127.0.0.1:8095/index',1570636751000,'32码粉红色','运动鞋','产品详细说明',2011,true),
(NULL,2,'限时特卖','【特价且部分享8折】CROCS清仓','满折','【下单8折】crocs度假嗨起 >>','129','599','此商品仅支持退货，不支持换货。','女式 卡骆驰女士激浪静电纹束带鞋','http://0.image.al.okbuycdn.com//static/a62b07b87986914e495e0333ea5b6cd8.png','CROCS卡骆驰','http://127.0.0.1:8095/index',1570636751000,'32码粉红色','运动鞋','产品详细说明',2011,true),
(NULL,2,'限时特卖','【特价且部分享8折】CROCS清仓','满折','【下单8折】crocs度假嗨起 >>','129','599','此商品仅支持退货，不支持换货。','女式 卡骆驰女士激浪静电纹束带鞋','http://0.image.al.okbuycdn.com//static/a62b07b87986914e495e0333ea5b6cd8.png','CROCS卡骆驰','http://127.0.0.1:8095/index',1570636751000,'32码粉红色','运动鞋','产品详细说明',2011,true);



/**商品详情信息图片  大中小图片**/
CREATE TABLE wy_product_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #鞋子编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径
);

/**商品详情信息图片  大中小图片**/
INSERT INTO wy_product_pic VALUES
(NULL, 1, 'http://127.0.0.1:8095/img/lunbotu/1.1.jpg','./message/nav3/md/md1.jpg','./message/nav3/big/big1.jpg'),
(NULL, 1, 'http://127.0.0.1:8095/img/lunbotu/1.2.jpg','./message/nav3/md/md2.png','./message/nav3/big/big2.png'),
(NULL, 1, 'http://127.0.0.1:8095/img/lunbotu/1.3.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 1, 'http://127.0.0.1:8095/img/lunbotu/1.4.jpg','./message/nav3/md/md3.png','./message/nav3/big/big2.png'),
(NULL, 1, 'http://127.0.0.1:8095/img/lunbotu/1.5.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 2, 'http://127.0.0.1:8095/img/lunbotu/2.2.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 2, 'http://127.0.0.1:8095/img/lunbotu/2.1.jpg','./message/nav3/md/md4.png','./message/nav3/big/big3.png'),
(NULL, 2, 'http://127.0.0.1:8095/img/lunbotu/2.3.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 2, 'http://127.0.0.1:8095/img/lunbotu/2.4.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 3, 'http://127.0.0.1:8095/img/lunbotu/3.1.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 3, 'http://127.0.0.1:8095/img/lunbotu/3.2.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 3, 'http://127.0.0.1:8095/img/lunbotu/3.3.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 3, 'http://127.0.0.1:8095/img/lunbotu/3.4.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg');

                                 /* 产品的详细信息*/
   CREATE TABLE wy_meticulous(
  lid INT PRIMARY KEY AUTO_INCREMENT, 
  family_id INT,              #所属类型型号家族编号
  product_ID VARCHAR(128),         #商品编号
  sex VARCHAR(128),              #性别
  vamp VARCHAR(32),             #鞋面材质
  texture VARCHAR(128),        #鞋底材质
  uppers VARCHAR(128),         #鞋帮
  closed VARCHAR(128),        #闭合方式
  actions VARCHAR(128),      #功能
  sites VARCHAR(64),        # 适用场地
  season VARCHAR(32),          #季节
  temperature VARCHAR(128),      #温度
  seasonal VARCHAR(128)     #应季月份
);   

INSERT INTO wy_meticulous VALUES
(1,1,'17741192','0,1','布料','橡胶底','低帮','系带','轻便,耐磨,防滑,透气','室外硬地,公路','春','适中','11月,10月,9月,8月,7月,6月,5月,4月,3月'),
(NULL,1,'17537931','1','网面','低帮','低帮','系带','轻便,耐磨,防滑,透气','室外硬地,公路','秋,夏,春','适中','9月,8月,7月,6月,5月,4月,3月'),
(NULL,1,'17741442','0','牛皮','橡胶底','低帮','系带','轻便,耐磨,防滑,透气','室外硬地,公路','秋','适中','11月,8月,7月,6月,5月,4月,3月'),
(NULL,1,'17721132','0,1','牛皮','橡胶底','低帮','系带','轻便,耐磨,防滑,透气','室外硬地,公路','春','适中','11月,10月,9月');


 /* 商品详情最底下的图片*/
 CREATE TABLE wy_details_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #商品编号
  img VARCHAR(128),            #图片路径
  href VARCHAR(128),            #商品详情地址
  lg VARCHAR(128)             #大图片路径
);
 
/**商品详情最底下的图片**/
INSERT INTO wy_details_pic VALUES
(NULL, 1, 'http://127.0.0.1:8095/img/details/8.png','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 1, 'http://127.0.0.1:8095/img/details/12.png','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 1, 'http://127.0.0.1:8095/img/details/13.png','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 1, 'http://127.0.0.1:8095/img/details/14.png','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 2, 'http://127.0.0.1:8095/img/details/dibu/2.1.png','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 2, 'http://127.0.0.1:8095/img/details/dibu/2.2.png','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 2, 'http://127.0.0.1:8095/img/details/dibu/2.3.png','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 2, 'http://127.0.0.1:8095/img/details/dibu/2.4.png','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 2, 'http://127.0.0.1:8095/img/details/dibu/2.5.png','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 3, 'http://127.0.0.1:8095/img/details/dibu/3.11.png','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 3, 'http://127.0.0.1:8095/img/details/dibu/3.12.png','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 3, 'http://127.0.0.1:8095/img/details/dibu/3.13.png','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 3, 'http://127.0.0.1:8095/img/details/dibu/3.14.png','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 3, 'http://127.0.0.1:8095/img/details/dibu/3.15.png','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 3, 'http://127.0.0.1:8095/img/details/dibu/3.16.png','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg');

/**商品的（每对鞋子存有的尺寸）**/
CREATE TABLE wy_details_img(
  lid INT PRIMARY KEY AUTO_INCREMENT,   /*每对鞋的id*/
  family_id INT,             /*种类归类*/
  img1 VARCHAR(128),      /*尺寸*/
  img2 VARCHAR(128),      
  img3 VARCHAR(128),        
  img4 VARCHAR(128),   
  img5 VARCHAR(128),       
  img6 VARCHAR(128)      
);
/**商品的（每对鞋子存有的尺寸）**/
INSERT INTO wy_details_img VALUES 
(1,1,'http://127.0.0.1:8095/img/details/1.png','http://127.0.0.1:8095/img/details/2.png','http://127.0.0.1:8095/img/details/3.png','http://127.0.0.1:8095/img/details/4.png','http://127.0.0.1:8095/img/details/5.png','http://127.0.0.1:8095/img/details/6.png'),
(2,2,'http://127.0.0.1:8095/img/details/2.1.jpg','http://127.0.0.1:8095/img/details/2.2.jpg','http://127.0.0.1:8095/img/details/2.3.jpg','http://127.0.0.1:8095/img/details/2.4.jpg',NULL,NULL),
(3,3,'http://127.0.0.1:8095/img/details/3.1.jpg','http://127.0.0.1:8095/img/details/3.2.jpg','http://127.0.0.1:8095/img/details/3.3.jpg','http://127.0.0.1:8095/img/details/3.4.jpg','http://127.0.0.1:8095/img/details/3.5.jpg',NULL),
(4,4,'http://127.0.0.1:8095/img/details/4.1.jpg','http://127.0.0.1:8095/img/details/4.2.jpg','http://127.0.0.1:8095/img/details/4.3.jpg',NULL,NULL,NULL);



#######################################################################################################




