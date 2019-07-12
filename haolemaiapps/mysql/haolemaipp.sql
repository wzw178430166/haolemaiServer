#设置客户端连接的编码
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
INSERT INTO users VALUES('1','www178430166@qq.com','waf182dd545..','13533870622');
INSERT INTO users VALUES(NULL,'www1254877418@qq.com','ttf1f5545..','13660132410');
INSERT INTO users VALUES(NULL,'www178430166@qq.com','br18255545..','18320006057');
INSERT INTO users VALUES(NULL,'tom','123','18320006057');


########################################################################################################

/****购物车****/
CREATE TABLE wy_cart(
  id INT PRIMARY KEY AUTO_INCREMENT,
  img_url VARCHAR(25),
  price   DECIMAL(10,2),
  title   VARCHAR(255),
  count   INT,
  uid     INT
);
INSERT INTO wy_cart VALUES(null,'011.jpg',100,'罗技鼠标',1,1);
INSERT INTO wy_cart VALUES(null,'012.jpg',110,'内存条',1,1);
INSERT INTO wy_cart VALUES(null,'011.jpg',101,'罗技鼠标3',1,1);
INSERT INTO wy_cart VALUES(null,'011.jpg',102,'罗技鼠标4',1,1);


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

/*商品数据1111111111*/
CREATE TABLE index_shangpin(
id INT PRIMARY KEY AUTO_INCREMENT,
img_url VARCHAR(60),
title1 VARCHAR(40),
title2 VARCHAR(40),
amount INT
);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_1.jpg","99封顶","这么便宜不来看看吗",1);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_2.jpg","99封顶","这么便宜不来看看吗",2);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_3.jpg","99封顶","这么便宜不来看看吗",3);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_4.jpg","99封顶","这么便宜不来看看吗",4);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_5.jpg","99封顶","这么便宜不来看看吗",5);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_6.jpg","99封顶","这么便宜不来看看吗",6);
INSERT INTO index_shangpin VALUES(null,"http://127.0.0.1:8095/img/appimg/shangpin/article_7.jpg","99封顶","这么便宜不来看看吗",7);

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
(NULL, 1, './message/nav1/nav1.1.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 1, './message/nav1/nav1.2.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 1, './message/nav1/nav1.3.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 1, './message/nav1/nav1.1.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
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

/**商品详情信息    商品详情页**/
CREATE TABLE wy_product(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属型号家族编号
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题
  price DECIMAL(10,2),        #价格
  promise VARCHAR(64),        #服务承诺
  spec VARCHAR(64),           #规格/颜色

  lname VARCHAR(32),          #商品名称
  os VARCHAR(32),             #操作系统
  memory VARCHAR(32),         #内存容量
  resolution VARCHAR(32),     #分辨率
  video_card VARCHAR(32),     #显卡型号
  cpu VARCHAR(32),            #处理器
  video_memory VARCHAR(32),   #显存容量
  category VARCHAR(32),       #所属分类
  disk VARCHAR(32),           #硬盘容量及类型
  details VARCHAR(1024),      #产品详细说明

  shelf_time BIGINT,          #上架时间
  sold_count INT,             #已售出的数量
  is_onsale BOOLEAN           #是否促销中
);

/**商品详情信息**/
INSERT INTO wy_product VALUES
(1,1,'提花冰丝席三件套 可折叠凉席','凉而不冰，爽滑透气，易收纳',159,' *支持30天无忧退换货 *48小时快速退款  *网易自营品牌','99.3','AppleMacBook Air','MacOS','8G','1920*1080','集成显卡','Intel i5低功耗版','其它','轻薄本','128G固态','<div class="content_tpl"> <div class="formwork">   <div class="formwork_img"><br></div><div class="formwork_img">    <img alt="" class="" src="img/product/detail/57b15612N81dc489d.jpg">   </div>  </div>  <div class="formwork">   <div class="formwork_img">    <img alt="" class="" src="//img20.360buyimg.com/vc/jfs/t2683/60/4222930118/169462/233c7678/57b15616N1e285f09.jpg">   </div>  </div>  <div class="formwork">   <div class="formwork_text">    技术规格请前往 www.apple.com/cn/macbook-air/specs.html 查看完整内容。</div></div></div>',150123456789,2968,true),
(2,1,'男/女复古金属飞行员墨镜','HUGO BOSS制造商出品',69.5,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','双核i5/8GB内存/256GB闪存','AppleMacBook Air','MacOS','8G','1920*1080','集成显卡','Intel i5低功耗版','其它','轻薄本','256G固态','<div class="content_tpl"> <div class="formwork">   <div class="formwork_img"><br></div><div class="formwork_img">    <img alt="" class="" src="img/product/detail/57b15612N81dc489d.jpg">   </div>  </div>  <div class="formwork">   <div class="formwork_img">    <img alt="" class="" src="//img20.360buyimg.com/vc/jfs/t2683/60/4222930118/169462/233c7678/57b15616N1e285f09.jpg">   </div>  </div>  <div class="formwork">   <div class="formwork_text">    技术规格请前往 www.apple.com/cn/macbook-air/specs.html 查看完整内容。</div></div></div>',150223456789,1922,false),
(3,1,'Apple MacBook Air 13.3英寸笔记本电脑 银色(Core i7 处理器/8GB内存/128GB SSD闪存 Z0TA0002L)','i7处理器在此！依旧纤薄轻盈，续航持久，能胜任更多高强度工作，办公利器！',7488,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','定制款：双核i7/8G内存/128G闪存','AppleMacBook Air','MacOS','8G','1920*1080','集成显卡','Intel i7低功耗版','其它','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="//img20.360buyimg.com/vc/jfs/t3034/151/748569500/226790/d6cd86a2/57b15612N81dc489d.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="//img20.360buyimg.com/vc/jfs/t2683/60/4222930118/169462/233c7678/57b15616N1e285f09.jpg"></div></div><div class="formwork"><div class="formwork_text">技术规格 请前往 www.apple.com/cn/macbook-air/specs.html 查看完整内容。</div></div></div>',150323456789,733,false),
(4,1,'Apple MacBook Air 13.3英寸笔记本电脑 银色(Core i7 处理器/8GB内存/256GB SSD闪存 Z0TA0002L)','i7处理器在此！依旧纤薄轻盈，续航持久，能胜任更多高强度工作，办公利器！',7888,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','定制款：双核i7/8G内存/256G闪存','AppleMacBook Air','MacOS','8G','1920*1080','集成显卡','Intel i7低功耗版','其它','轻薄本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="//img20.360buyimg.com/vc/jfs/t3034/151/748569500/226790/d6cd86a2/57b15612N81dc489d.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="//img20.360buyimg.com/vc/jfs/t2683/60/4222930118/169462/233c7678/57b15616N1e285f09.jpg"></div></div><div class="formwork"><div class="formwork_text">技术规格 请前往 www.apple.com/cn/macbook-air/specs.html 查看完整内容。</div></div></div>',150323456789,105,false),
(5,2,'男/女复古金属飞行员墨镜','【i5 独立显卡】全高清窄边框 8G内存 256G固态硬盘 支持SSD硬盘扩容 薄至14.8mm 轻至1.28kg！AKG扬声器！',4999,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【13.3英寸】I5-6200U 8G 256G','小米Air','Windows 10','8G','全高清屏(1920*1080)','入门级游戏独立显卡','Intel i5低功耗版','1G','轻薄本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5886e317Nbc52a580.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f747eNfdc5f737.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7483N695168a2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7486Nf809b915.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748bN28dbcbb2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748fNd2861229.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7493N5a3758af.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7497N20aac53e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58d23597N878bf1f7.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58cfbc2aN51481cf1.png"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74a3N1f47e1f2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74acN9da4ea13.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b0N0af5a884.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b6N10c0f4a0.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c0N452b66a1.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c4N07c85d41.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58d2350bNb98d64e2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/589458f0N90e67b9d.jpg"></div></div></div>',154123456789,1527,true),
(6,2,'小米(MI)Air 12.5英寸全金属超轻薄笔记本(Core M-7Y30 4G 128G固态硬盘 全高清屏 背光键盘 Win10)银','【FHD窄边框】第七代处理器 128G SSD支持M.2接口SSD硬盘扩容 薄至12.9mm 轻至1.07kg！AKG扬声器！',3599,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【12.5银色】 M-7Y30 4G 128G','小米Air','Windows 10','4G','全高清屏(1920*1080)','集成显卡','Intel CoreM','其它','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5886e317Nbc52a580.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f747eNfdc5f737.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7483N695168a2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7486Nf809b915.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748bN28dbcbb2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748fNd2861229.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7493N5a3758af.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7497N20aac53e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58d23597N878bf1f7.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58cfbc2aN51481cf1.png"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74a3N1f47e1f2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74acN9da4ea13.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b0N0af5a884.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b6N10c0f4a0.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c0N452b66a1.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c4N07c85d41.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58d2350bNb98d64e2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/589458f0N90e67b9d.jpg"></div></div></div>',153123456789,115,false),
(7,2,'小米(MI)Air 12.5英寸全金属超轻薄笔记本(Core M-7Y30 4G 128G固态硬盘 全高清屏 背光键盘 Win10)金','【FHD窄边框】第七代处理器 128G SSD支持M.2接口SSD硬盘扩容 薄至12.9mm 轻至1.07kg！AKG扬声器！',3599,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【12.5金色】 M-7Y30 4G 128G','小米Air','Windows 10','4G','全高清屏(1920*1080)','集成显卡','Intel CoreM','其它','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5886e317Nbc52a580.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f747eNfdc5f737.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7483N695168a2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7486Nf809b915.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748bN28dbcbb2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748fNd2861229.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7493N5a3758af.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7497N20aac53e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58d23597N878bf1f7.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58cfbc2aN51481cf1.png"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74a3N1f47e1f2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74acN9da4ea13.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b0N0af5a884.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b6N10c0f4a0.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c0N452b66a1.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c4N07c85d41.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58d2350bNb98d64e2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/589458f0N90e67b9d.jpg"></div></div></div>',156123456789,812,true),
(8,2,'小米(MI)Air 12.5英寸全金属超轻薄笔记本(Core M-6Y30 4G 128G SSD固态硬盘 全高清屏 WIN10) 银','【FHD窄边框】库存紧张 128G固态硬盘 支持M.2接口SSD硬盘扩容 薄至12.9mm 轻至1.07kg！',3499,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【12.5英寸】M-6Y30 4G 128G','小米Air','Windows 10','4G','全高清屏(1920*1080)','集成显卡','Intel CoreM','其它','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5886e317Nbc52a580.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f747eNfdc5f737.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7483N695168a2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7486Nf809b915.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748bN28dbcbb2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748fNd2861229.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7493N5a3758af.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7497N20aac53e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58d23597N878bf1f7.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58cfbc2aN51481cf1.png"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74a3N1f47e1f2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74acN9da4ea13.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b0N0af5a884.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b6N10c0f4a0.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c0N452b66a1.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c4N07c85d41.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58d2350bNb98d64e2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/589458f0N90e67b9d.jpg"></div></div></div>',157123456789,1081,false),
(9,3,'联想(ThinkPad)轻薄系列E480c(20H3A00GCD)14英寸笔记本(i3-6006U 4G 500G 2G独显 Win10)黑色','2017年经典款新！精致小黑！22.3mm轻薄体验，180度开合灵活耐用，高效稳健办公最长可达5小时！',3499,' *退货补运费 *30天无忧退货 *48小时快速退款','【E480C-2017新】i3 4G 500G独显','ThinkPadE480c','Windows10','4G','标准屏(1366×768)','入门级游戏独立显卡','Intel i3','2G','常规笔记本','500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58745160N7de01df6.jpg"></div></div></div>',150423456789,1461,true),
(10,3,'联想(ThinkPad)轻薄系列E480c(20H3A000CD)14英寸笔记本(i5-6200U 4G 500G 2G独显 Win10)黑色','2017年经典款新！精致小黑！22.3mm轻薄体验，180度开合灵活耐用，高效稳健办公最长可达5小时！',4499,' *退货补运费 *30天无忧退货 *48小时快速退款','【E480C-2017新】i5 4G 500G','ThinkPadE480c','Windows10','4G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规笔记本','500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58745160N7de01df6.jpg"></div></div></div>',151423456789,733,false),
(11,3,'联想(ThinkPad)轻薄系列E480c(20H3A002CD)14英寸笔记本(i5-6200U 4G 256G SSD 2G独显 Win10)黑色','2017年经典款新！精致小黑！22.3mm轻薄体验，180度开合灵活耐用，高效稳健办公最长可达5小时！',5399,' *退货补运费 *30天无忧退货 *48小时快速退款','【E480C-2017新】i5 4G 256GSSD','ThinkPadE480c','Windows10','4G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规笔记本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58745160N7de01df6.jpg"></div></div></div>',152423456789,913,true),
(12,3,'联想(ThinkPad)轻薄系列E480c(20H3A001CD)14英寸笔记本电脑(i5-6200U 8G 256G SSD 2G独显 Win10)黑色','2017年经典款新！精致小黑！22.3mm轻薄体验，180度开合灵活耐用，高效稳健办公最长可达5小时！',5999,' *退货补运费 *30天无忧退货 *48小时快速退款','【E480C-2017新】i5 8G 256GSSD','ThinkPadE480c','Windows10','8G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规笔记本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58745160N7de01df6.jpg"></div></div></div>',153423456789,112,false),
(13,4,'华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务手提轻薄便携超薄笔记本电脑 玫瑰金 13.3英寸I3-7100U/4G/128G固态','【铝镁合金 纯固态 轻至1.45kg 金属超极本 】双尺寸可选',4299,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','13.3英寸I3-7100U/4G/128G固态','华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务手提轻薄便携超薄笔记本电脑 玫瑰金 13.3英寸I3-7100U/4G/128G固态','Windows 10','8G','全高清屏(1920×1080)','高性能游戏独立显卡','Intel i5低功耗版','2G','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59190fe7N6a9fb112.jpg"><img class="" src="img/product/detail/58d0bfceNc0694135.jpg"><img class="" src="img/product/detail/59143b58N0f24f48d.jpg"><img class="" src="img/product/detail/58f9de03Nd67611dc.jpg"><img class="" src="img/product/detail/58d0bfcbNc96d061c.jpg"><img class="" src="img/product/detail/58d0bfd1Nea212a7a.jpg"></div></div></div>',151123456789,1197,true),
(14,4,'华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务手提轻薄便携超薄笔记本电脑 玫瑰金 13.3英寸I5/4G/128G固态','【铝镁合金 纯固态 轻至1.45kg 金属超极本 】双尺寸可选',4999,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','13.3英寸I5/4G/128G固态','华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务手提轻薄便携超薄笔记本电脑 玫瑰金 13.3英寸I5/4G/128G固态','Windows 10','8G','全高清屏(1920×1080)','高性能游戏独立显卡','Intel i5低功耗版','2G','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59190fe7N6a9fb112.jpg"><img class="" src="img/product/detail/58d0bfceNc0694135.jpg"><img class="" src="img/product/detail/59143b58N0f24f48d.jpg"><img class="" src="img/product/detail/58f9de03Nd67611dc.jpg"><img class="" src="img/product/detail/58d0bfcbNc96d061c.jpg"><img class="" src="img/product/detail/58d0bfd1Nea212a7a.jpg"></div></div></div>',152123456789,137,false),
(15,4,'华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务手提轻薄便携超薄笔记本电脑 玫瑰金 13.3英寸I5/4G/256G/2G独显','【铝镁合金 纯固态 轻至1.45kg 金属超极本 】双尺寸可选',5499,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','13.3英寸I5/4G/256G/2G独显','华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务手提轻薄便携超薄笔记本电脑 玫瑰金 13.3英寸I5/4G/256G/2G独显','Windows 10','4G','全高清屏(1920×1080)','高性能游戏独立显卡','Intel i5低功耗版','2G','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59190fe7N6a9fb112.jpg"><img class="" src="img/product/detail/58d0bfceNc0694135.jpg"><img class="" src="img/product/detail/59143b58N0f24f48d.jpg"><img class="" src="img/product/detail/58f9de03Nd67611dc.jpg"><img class="" src="img/product/detail/58d0bfcbNc96d061c.jpg"><img class="" src="img/product/detail/58d0bfd1Nea212a7a.jpg"></div></div></div>',153123456789,21,false),
(16,4,'华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务手提轻薄便携超薄笔记本电脑 玫瑰金 13.3英寸I5/8G/256G/2G独显','【铝镁合金 纯固态 轻至1.45kg 金属超极本 】双尺寸可选',5699,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','13.3英寸I5/8G/256G/2G独显','华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务手提轻薄便携超薄笔记本电脑 玫瑰金 13.3英寸I5/8G/256G/2G独显','Windows 10','8G','全高清屏(1920×1080)','高性能游戏独立显卡','Intel i5低功耗版','2G','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59190fe7N6a9fb112.jpg"><img class="" src="img/product/detail/58d0bfceNc0694135.jpg"><img class="" src="img/product/detail/59143b58N0f24f48d.jpg"><img class="" src="img/product/detail/58f9de03Nd67611dc.jpg"><img class="" src="img/product/detail/58d0bfcbNc96d061c.jpg"><img class="" src="img/product/detail/58d0bfd1Nea212a7a.jpg"></div></div></div>',152423456789,981,false),
(17,5,'联想(Lenovo)小新700电竞版 15.6英寸游戏笔记本电脑(i5-6300HQ 8G 500G+128G SSD GTX950M 4G IPS)黑','【小新家族2017闪耀换新！晒单得E卡！12期免息！】小新700电竞版！经典之选',5199,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','小新700【i5 双硬盘 GTX950M】','联想小新700','Windows 10','8G','分辨率：全高清屏(1920×1080)','GTX950M','Intel i5标准电压版','4G','游戏本','128G+500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58ca2b14Nd5c09fcd.jpg"><img class="" src="img/product/detail/58ca2b28Na5a22f83.jpg"><img class="" src="img/product/detail/58ca3012Nc99ab61f.jpg"><img class="" src="img/product/detail/58ca2b51Nbf258c3b.jpg"><img class="" src="img/product/detail/58ca2b67N436e60de.jpg"></div></div></div>',149123456789,192,true),
(18,5,'联想(Lenovo)小新700电竞版 15.6英寸游戏笔记本电脑(i7-6700HQ 8G 500G GTX950M 4G FHD IPS Office)黑','【小新家族2017闪耀换新！晒单得E卡！12期免息！】小新700电竞版！经典之选',5499,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','小新700【i7 8G 500G GTX950M】','联想小新700','Windows 10','8G','分辨率：全高清屏(1920×1080)','GTX950M','Intel i7标准电压版','4G','游戏本','128G+500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58ca2b14Nd5c09fcd.jpg"><img class="" src="img/product/detail/58ca2b28Na5a22f83.jpg"><img class="" src="img/product/detail/58ca3012Nc99ab61f.jpg"><img class="" src="img/product/detail/58ca2b51Nbf258c3b.jpg"><img class="" src="img/product/detail/58ca2b67N436e60de.jpg"></div></div></div>',151523456789,260,false),
(19,6,'戴尔DELL灵越燃7000 R1525S 14.0英寸轻薄窄边框笔记本电脑(i5-7200U 4G 128GSSD+500G 940MX 2G独显 FHD)银','【轻薄微边框、燃7000】七代i5双核CPU、128GSSD+500G双硬盘、IPS全高清显示屏，动力强劲性能澎湃！',5299,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【流光银】i5-7200u 4G 128 500G','戴尔燃7000','Windows 10','4G','全高清屏(1920×1080)','入门级游戏独立显卡','Intel i5低功耗版','2G','轻薄本','128G+500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58d87221Na033954c.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58e5e4b5N862f8aa1.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/57bfa672N20953b71.jpg"></div></div></div>',151923456789,911,false),
(20,6,'戴尔DELL灵越燃7000 R1725G 14.0英寸轻薄窄边框笔记本电脑(i7-7500U 8G 128GSSD+1T 940MX 2G独显 FHD)金','【轻薄微边框、燃7000】七代i7双核CPU、128GSSD+500G双硬盘、IPS全高清显示屏，动力强劲性能澎湃！',6599,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【溢彩金】i7-7500u 8G 128 1T','戴尔燃7000','Windows 10','8G','全高清屏(1920×1080)','入门级游戏独立显卡','Intel i7低功耗版','2G','轻薄本','128G+500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58d87221Na033954c.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58e5e4b5N862f8aa1.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/57bfa672N20953b71.jpg"></div></div></div>',150823456789,1930,true),
(21,6,'戴尔DELL灵越燃7000 R1525P 14.0英寸轻薄窄边框笔记本电脑(i5-7200U 4G 128GSSD+500G 2G独显 FHD)元気粉','【轻薄微边框、燃7000元気粉】七代i5双核CPU、128GSSD+500G双硬盘、IPS全高清显示屏，动力强劲性能澎湃！',5299,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【元気粉】i5-7200u 4G 128 500G','戴尔燃7000','Windows 10','4G','全高清屏(1920×1080)','入门级游戏独立显卡','Intel i5低功耗版','2G','轻薄本','128G+500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58d87221Na033954c.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58e5e4b5N862f8aa1.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/57bfa672N20953b71.jpg"></div></div></div>',151023456789,987,true),
(22,7,'戴尔DELL灵越游匣15PR-5745B 15.6英寸游戏笔记本电脑(i7-7700HQ 8G 128GSSD+1T GTX1050 4G独显 FHD)黑','【白条6期免息 游匣“10”力出击】七代四核CPU ,GTX1050 4G独显,FHD全高清屏,热血出击！',6999,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','宗师版 i7-7700HQ 8G GTX1050 4G','戴尔灵越游匣15PR-5745B','Windows 10','8G','全高清屏(1920×1080)','GTX960M','Intel i7标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d3fNd4e6c74e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d49Nd9aa8623.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d53N79717f17.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003db4N5441df2e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003afdN7d9208b8.jpg"></div></div></div>',148123456789,1901,true),
(23,7,'戴尔DELL灵越游匣15PR-5645SE 15.6英寸游戏笔记本电脑(i5-7300HQ 8G 128GSSD+1T GTX1050 4G独显 FHD)枪弹版','游匣枪弹版精装上市 3D立体喷涂画面 机身更酷炫 七代四核CPU ,GTX1050 4G独显,FHD全高清屏,热血出击！',6699,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','枪弹版 i5-7300HQ 8G GTX1050 4G','戴尔灵越游匣15PR-5645SE','Windows 10','8G','全高清屏(1920×1080)','GTX960M','Intel i5标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d3fNd4e6c74e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d49Nd9aa8623.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d53N79717f17.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003db4N5441df2e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003afdN7d9208b8.jpg"></div></div></div>',153123456789,1231,false),
(24,7,'戴尔DELL灵越游匣15PR-5745SE 15.6英寸游戏笔记本电脑(i7-7700HQ 8G 128GSSD+1T GTX1050 4G独显 FHD)枪弹版','游匣枪弹版精装上市 3D立体喷涂画面 机身更酷炫 七代四核CPU ,GTX1050 4G独显,FHD全高清屏,热血出击！',7999,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','枪弹版 i7-7700HQ 8G GTX1050 4G','戴尔灵越游匣15PR-5645SE','Windows 10','8G','全高清屏(1920×1080)','GTX960M','Intel i7标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d3fNd4e6c74e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d49Nd9aa8623.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d53N79717f17.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003db4N5441df2e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003afdN7d9208b8.jpg"></div></div></div>',1539923456789,221,false),
(25,7,'戴尔DELL灵越游匣15PR-3848B 15.6英寸游戏笔记本电脑(i7-6700HQ 4G 128GSSD+500G GTX960M 4G FHD)黑','【强力散热保性能】 960M 4G独显 预装128SSD 双硬盘游戏更劲爽 我们比大多数产品 散热好一些',6099,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','精锐版 i7-6700HQ 4G GTX960 4G','戴尔游匣','Windows 10','4G','全高清屏(1920×1080)','GTX960M','Intel i7标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d3fNd4e6c74e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d49Nd9aa8623.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d53N79717f17.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003db4N5441df2e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003afdN7d9208b8.jpg"></div></div></div>',1519123456789,711,true),
(26,7,'戴尔DELL灵越游匣15PR-2648B 15.6英寸游戏笔记本电脑(i5-6300HQ 4G 128SSD+500G GTX960M 4G独显 FHD)黑','【选游戏本还得看散热】960M 4G独显 预装128SSD 双硬盘游戏更劲爽 ！',5299,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','精锐版 i5-6300HQ 4G GTX960 4G','戴尔游匣','Windows 10','4G','全高清屏(1920×1080)','GTX960M','Intel i5标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d3fNd4e6c74e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d49Nd9aa8623.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d53N79717f17.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003db4N5441df2e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003afdN7d9208b8.jpg"></div></div></div>',1529123456789,319,false),
(27,7,'戴尔DELL灵越游匣15PR-5645B 15.6英寸游戏笔记本电脑(i5-7300HQ 8G 128GSSD+1T GTX1050 4G独显 FHD)黑','【白条6期免息 游匣“10”力出击】七代四核CPU ,GTX1050 4G独显,FHD全高清屏,热血出击！',5999,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','宗师版 i5-7300HQ 8G GTX1050 4G','戴尔灵越游匣15PR-5645B','Windows 10','8G','全高清屏(1920×1080)','GTX1050','Intel i7标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d3fNd4e6c74e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d49Nd9aa8623.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d53N79717f17.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003db4N5441df2e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003afdN7d9208b8.jpg"></div></div></div>',1511123456789,2110,false),
(28,8,'联想(ThinkPad)轻薄系列E470c(20H3A000CD)14英寸笔记本电脑(i5-6200U 4G 500G 2G独显 Win10)黑色','点击进入5月大促，超值满千减百品牌周',3998,'*30天无忧退货 *48小时快速退款','【E470C-2017新】i5 4G 500G','ThinkPadE470 c','Linux','4G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规本','500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58119b8aNb84f1e22.jpg"></div></div></div>',150123456789,117,true),
(29,8,'联想(ThinkPad)轻薄系列E470c(20H3A004CD)14英寸笔记本电脑(i5-6200U 8G 500G 2G独显 Win10)黑色','点击进入5月大促，超值满千减百品牌周',4699,'*30天无忧退货 *48小时快速退款','【E470C-2017新】i5 8G 500G','ThinkPadE470 c','Linux','8G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规本','500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58119b8aNb84f1e22.jpg"></div></div></div>',151123456789,1862,false),
(30,8,'联想(ThinkPad)轻薄系列E470c(20H3A003CD)14英寸笔记本电脑(i5-6200U 8G 1T 2G独显 Win10)黑色','点击进入5月大促，超值满千减百品牌周',5499,'*30天无忧退货 *48小时快速退款','【E470C-2017新】i5 8G 1TB','ThinkPadE470 c','Linux','8G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规本','1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58119b8aNb84f1e22.jpg"></div></div></div>',152123456789,812,true),
(31,8,'联想(ThinkPad)轻薄系列E470c(20H3A002CD)14英寸笔记本电脑(i5-6200U 4G 256G SSD 2G独显 Win10)黑色','点击进入5月大促，超值满千减百品牌周',5399,'*30天无忧退货 *48小时快速退款','【E470C-2017新】i5 4G 256GSSD','ThinkPadE470 c','Linux','4G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58119b8aNb84f1e22.jpg"></div></div></div>',153123456789,162,false),
(32,8,'联想(ThinkPad)轻薄系列E470c(20H3A001CD)14英寸笔记本电脑(i5-6200U 8G 256G SSD 2G独显 Win10)黑色','点击进入5月大促，超值满千减百品牌周',5499,'*30天无忧退货 *48小时快速退款','【E470C-2017新】i5 8G 256GSSD','ThinkPadE470 c','Linux','8G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58119b8aNb84f1e22.jpg"></div></div></div>',154123456789,1180,false),
(33,9,'华硕(ASUS)顽石电竞版FH5900 15.6英寸游戏笔记本电脑(i7-6700HQ 4G 1TB +128G SSD NV940MX 2G 独显 FHD)','顽石血统 标压电竞版 强劲动力带你畅快遨游',4999,' *退货补运费 *30天无忧退货 *72小时发货','【高速】顽石游戏本i74G1T128SSD','华硕FH5900V','Windows 10','4G','全高清屏(1920*1080)','入门级游戏独立显卡','Intel i7标准电压版','2G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/583d2fb0N44aa29cf.jpg"><img class="" src="img/product/detail/583d2fd5N33db758b.jpg"><img class="" src="img/product/detail/583d359aN47f3276b.jpg"><img class="" src="img/product/detail/583d3036Nef20d28f.jpg"><img class="" src="img/product/detail/583d304aN4722f8d5.jpg"></div></div></div>',1450123456789,1231,false),
(34,9,'华硕(ASUS) 顽石四代尊享版 15.6英寸笔记本电脑(i7-7500U 8G 1TB NV940MX 2G独显 深蓝 FHD )','第七代i7处理器，8G超大内存与1T硬盘，快无止境、大无止境',4699,' *退货补运费 *30天无忧退货 *72小时发货','顽石经典【高配i7 8G 1T 深蓝】','华硕FL5900UQ','Windows 10','8G','全高清屏(1920*1080)','入门级游戏独立显卡','Intel i7低功耗版','2G','游戏本','1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/583d2fb0N44aa29cf.jpg"><img class="" src="img/product/detail/583d2fd5N33db758b.jpg"><img class="" src="img/product/detail/583d359aN47f3276b.jpg"><img class="" src="img/product/detail/583d3036Nef20d28f.jpg"><img class="" src="img/product/detail/583d304aN4722f8d5.jpg"></div></div></div>',1550123456789,1231,true),
(35,9,'华硕(ASUS) 顽石四代旗舰版FL5900 15.6英寸笔记本电脑(i7-7500U 4G 1TB +128GBSSD NV940MX 深蓝 FHD)','混合硬盘，1T搭载128G固态，读取速度更快，智能散热不烫手！！',4999,' *退货补运费 *30天无忧退货 *72小时发货','顽石双盘【i7 4G 1t加128SSD】','华硕FL5900UQ','Windows 10','4G','全高清屏(1920*1080)','入门级游戏独立显卡','Intel i7低功耗版','2G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/583d2fb0N44aa29cf.jpg"><img class="" src="img/product/detail/583d2fd5N33db758b.jpg"><img class="" src="img/product/detail/583d359aN47f3276b.jpg"><img class="" src="img/product/detail/583d3036Nef20d28f.jpg"><img class="" src="img/product/detail/583d304aN4722f8d5.jpg"></div></div></div>',1531023456789,221,false),
(36,9,'华硕(ASUS)顽石四代疾速版 FL5900 15.6英寸笔记本电脑(i7-6500U 4G 512GB SSD NV940M 2G独显 红色)','【同样配置看主板，搭配华硕主板让您放心，屏幕无坏点保证】办公，游戏无压力！！！',4799,' *退货补运费 *30天无忧退货 *72小时发货','顽石高速【i7-4G 512SSD 炫红】','华硕FL5900U','Windows 10','4G','全高清屏(1920*1080)','GT940M','Intel i7低功耗版','2G','游戏本','512G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/583d2fb0N44aa29cf.jpg"><img class="" src="img/product/detail/583d2fd5N33db758b.jpg"><img class="" src="img/product/detail/583d359aN47f3276b.jpg"><img class="" src="img/product/detail/583d3036Nef20d28f.jpg"><img class="" src="img/product/detail/583d304aN4722f8d5.jpg"></div></div></div>',1510123456789,103,true),
(37,9,'华硕(ASUS) 顽石四代疾速版FL5900 15.6英寸笔记本电脑(i7-6500U 4G 512G SSD NV940MX 2G独显 红色 FHD)','疾速版，就是要你快！512G固态硬盘，第六代i7处理器搭载2G独显！',4799,' *退货补运费 *30天无忧退货 *72小时发货','顽石高速【i74G512SSD NV940MX】','华硕FL5900UQ','Windows 10','4G','全高清屏(1920*1080)','入门级游戏独立显卡','Intel i7低功耗版','2G','游戏本','512G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/583d2fb0N44aa29cf.jpg"><img class="" src="img/product/detail/583d2fd5N33db758b.jpg"><img class="" src="img/product/detail/583d359aN47f3276b.jpg"><img class="" src="img/product/detail/583d3036Nef20d28f.jpg"><img class="" src="img/product/detail/583d304aN4722f8d5.jpg"></div></div></div>',1450123456789,341,false),
(38,10,'神舟(HASEE)战神Z7M-KP7GT 15.6英寸游戏本笔记本电脑(i7-7700HQ 8G 1T+128G SSD GTX1050Ti 1080P)IPS屏','超强性价比！！',6199,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','Z7M GT【i7 128G+1T GTX1050Ti】','神舟战神Z7M-KP7GT','Windows 10','8G','全高清屏(1920×1080)','GTX1050Ti','Intel i7标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58c67b22Ned66fcb8.jpg"> <img class="" src="img/product/detail/58c67b23Nfffc2f8b.jpg"> <img class="" src="img/product/detail/58c67b22N04b18388.jpg"> <img class="" src="img/product/detail/58c67b24N6d5ce71c.jpg"> <img class="" src="img/product/detail/58c67b24Nac3dc074.jpg"> <img class="" src="img/product/detail/58c67b22N8aa1905c.jpg"> <img class="" src="img/product/detail/58c67b24N9aa8a252.jpg"></div></div></div>',151123456789,441,false),
(39,10,'神舟(HASEE)战神Z7M-SL7D2 15.6英寸游戏本笔记本电脑(i7-6700HQ 8G 1T+128GB SSD GTX965M 1080P)IPS','六代i7 SSD GTX965M还预装WIN10，一步到位，你赢了！',5499,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','战神Z7M【四核i7 GTX965M】','神舟战神Z7M','Windows 10','8G','全高清屏(1920×1080)','GTX965M','Intel i7标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58c67b22Ned66fcb8.jpg"> <img class="" src="img/product/detail/58c67b23Nfffc2f8b.jpg"> <img class="" src="img/product/detail/58c67b22N04b18388.jpg"> <img class="" src="img/product/detail/58c67b24N6d5ce71c.jpg"> <img class="" src="img/product/detail/58c67b24Nac3dc074.jpg"> <img class="" src="img/product/detail/58c67b22N8aa1905c.jpg"> <img class="" src="img/product/detail/58c67b24N9aa8a252.jpg"></div></div></div>',152123456789,1289,true),
(40,10,'神舟(HASEE)战神Z7M-SL5D1 15.6英寸游戏本笔记本电脑(i5-6300HQ 8G 1TB GTX965M 1080P)IPS屏','超强性价比！！',4499,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','战神Z7M【四核i5 GTX965M】','神舟战神Z7M-SL5D1','Windows 10','8G','全高清屏(1920×1080)','GTX965M','Intel i7标准电压版','2G','游戏本','1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58c67b22Ned66fcb8.jpg"> <img class="" src="img/product/detail/58c67b23Nfffc2f8b.jpg"> <img class="" src="img/product/detail/58c67b22N04b18388.jpg"> <img class="" src="img/product/detail/58c67b24N6d5ce71c.jpg"> <img class="" src="img/product/detail/58c67b24Nac3dc074.jpg"> <img class="" src="img/product/detail/58c67b22N8aa1905c.jpg"> <img class="" src="img/product/detail/58c67b24N9aa8a252.jpg"></div></div></div>',153123456789,231,false),
(41,10,'神舟(HASEE)战神Z6-KP5GT 15.6英寸游戏本笔记本电脑(i5-7300HQ 8G 1T+128G SSD GTX1050 1080P)黑色','超强性价比！！',5199,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','Z6 GT【i5 128G+1T GTX1050】','神舟战神Z6-KP5GT','Windows 10','8G','全高清屏(1920×1080)','GTX1050','Intel i5标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58c67b22Ned66fcb8.jpg"> <img class="" src="img/product/detail/58c67b23Nfffc2f8b.jpg"> <img class="" src="img/product/detail/58c67b22N04b18388.jpg"> <img class="" src="img/product/detail/58c67b24N6d5ce71c.jpg"> <img class="" src="img/product/detail/58c67b24Nac3dc074.jpg"> <img class="" src="img/product/detail/58c67b22N8aa1905c.jpg"> <img class="" src="img/product/detail/58c67b24N9aa8a252.jpg"></div></div></div>',154123456789,469,true),
(42,10,'神舟(HASEE) 战神G6-SL7S2 17.3英寸游戏笔记本(i7-6700HQ 8G 256G SSD GTX960M 2G独显 1080P)黑色','17.3英寸大屏游戏本，纯固态硬盘，秒速开启超神之路！',5499,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','战神G6【17.3英寸 GTX960M】','神舟战神G6','Windows 10','8G','全高清屏(1920×1080)','GTX960M','Intel i7标准电压版','4G','游戏本','256固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58c67b22Ned66fcb8.jpg"> <img class="" src="img/product/detail/58c67b23Nfffc2f8b.jpg"> <img class="" src="img/product/detail/58c67b22N04b18388.jpg"> <img class="" src="img/product/detail/58c67b24N6d5ce71c.jpg"> <img class="" src="img/product/detail/58c67b24Nac3dc074.jpg"> <img class="" src="img/product/detail/58c67b22N8aa1905c.jpg"> <img class="" src="img/product/detail/58c67b24N9aa8a252.jpg"></div></div></div>',155123456789,1223,false),
(43,10,'神舟(HASEE)战神Z6-KP7GT 15.6英寸游戏本笔记本电脑(i7-7700HQ 8G 1T+128G SSD GTX1050 1080P)黑色','预约享5499抢！【128G SSD+1T HDD】双硬盘，春风“十”里，期待是你！',5699,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','Z6 GT【i7 128G+1T GTX1050】','神舟战神Z6-KP7GT','Windows 10','8G','全高清屏(1920×1080)','GTX1050','Intel i7标准电压版','2G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58c67b22Ned66fcb8.jpg"> <img class="" src="img/product/detail/58c67b23Nfffc2f8b.jpg"> <img class="" src="img/product/detail/58c67b22N04b18388.jpg"> <img class="" src="img/product/detail/58c67b24N6d5ce71c.jpg"> <img class="" src="img/product/detail/58c67b24Nac3dc074.jpg"> <img class="" src="img/product/detail/58c67b22N8aa1905c.jpg"> <img class="" src="img/product/detail/58c67b24N9aa8a252.jpg"></div></div></div>',156123456789,1844,true);


/**商品详情信息图片  大中小图片**/
CREATE TABLE wy_product_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #笔记本电脑编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径
);

/**商品详情信息图片  大中小图片**/
INSERT INTO wy_product_pic VALUES
(NULL, 1, './message/nav3/sm/sm1.png','./message/nav3/md/md1.jpg','./message/nav3/big/big1.jpg'),
(NULL, 1, './message/nav3/sm/sm2.jpg','./message/nav3/md/md2.png','./message/nav3/big/big2.png'),
(NULL, 1, './message/nav3/sm/sm1.png','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 2, 'img/product/sm/57b12a31N8f4f75a3.jpg','./message/nav3/md/md3.png','./message/nav3/big/big2.png'),
(NULL, 2, 'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 2, 'img/product/sm/57ad8846N64ac3c79.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 3, 'img/product/sm/57b12a31N8f4f75a3.jpg','./message/nav3/md/md4.png','./message/nav3/big/big3.png'),
(NULL, 3, 'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 3, 'img/product/sm/57ad8846N64ac3c79.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 4, 'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 4, 'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 4, 'img/product/sm/57ad8846N64ac3c79.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg');


#######################################################################################################




