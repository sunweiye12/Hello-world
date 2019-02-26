day15day15 CREATE DATABASE lab;  -- 创建一个数据库
 
 USE lab;  		-- 使用该数据库
 
 SHOW TABLES;  -- 当前数据库中的所有表  
 
 CREATE TABLE  stu(      -- 创建一个stu的表dept
	id INT PRIMARY KEY AUTO_INCREMENT,  	-- 主键且自动增长id自动增加 
	NAME VARCHAR(50) NOT NULL,    		-- 名字 唯一约束,不能为空
	sid VARCHAR(50),			-- 学号
	PASSWORD VARCHAR(50),			-- 密码
	teachername VARCHAR(50),		-- 导师名字
	phone VARCHAR(50),			-- 电话
	qq VARCHAR(50),				-- qq
	wechat VARCHAR(50)			-- 微信
);
 

INSERT INTO stu(NAME,sid,PASSWORD,teachername,phone,qq,wechat)VALUES('邓杰', 'S201761123','','邓军','17801020179','794982825','Beyood88');


UPDATE account SET money=money-100 WHERE NAME='aaa';   -- 修改数据usersstu

-- 微信##################################################

 CREATE DATABASE day15;
 
 USE day15;

SELECT * FROM book;

DROP TABLE stu ;  -- 删除表

-- 给表添加数据
INSERT INTO book(id,NAME,price,pnum,category,description)VALUES('agdyufgy', '金瓶梅',10,100,'动作','好书');
INSERT INTO book(id,NAME,price,pnum,category,description)VALUES('3424d1fgy', 'java',30,200,'科技','信息技术类数据');
INSERT INTO book(id,NAME,price,pnum,category,description)VALUES('agd3489776gy', '葵花宝典',20,50,'武功','好书???');
INSERT INTO book(id,NAME,price,pnum,category,description)VALUES('ag234ufgy', '天龙八部',15,20,'动作','好书///');


-- 分页操作
INT currentPage = 1;	-- 当前页
INT pageSize = 3;	-- 每页显示的数据个数

INT COUNT = SELECT COUNT(*) FROM book; -- 一共有多少数据
--  INT totalPage = count%pageSize==0?COUNT/pageSize:COUNT/pageSize+1;  -- 一共有几页
INT totalPage = Math.ceil(COUNT*1.0/pageSize);			-- 一共有几页
SELECT * FROM book LIMIT (currentPage-1)*pageSize,pageSize;	-- 第一个参数:从哪开始查  第二个参数:查几条


-- 创建用户注册信息表
users

SELECT NAME FROM book WHERE NAME LIKE "%葵花%";


-- bookStores数据库表的实现##################################################
-- 创建数据库 
CREATE DATABASE bookStore;
USE bookStore;
-- 用户表
CREATE TABLE `user` (
  `id` INT(11) AUTO_INCREMENT,
  `username` VARCHAR(20) ,
  `PASSWORD` VARCHAR(20) ,
  `gender` VARCHAR(10) ,
  `email` VARCHAR(50) ,
  `telephone` VARCHAR(20) ,
  `introduce` VARCHAR(100),
  `activeCode` VARCHAR(50) ,
  `state` INT(11) ,
  `role` VARCHAR(10) DEFAULT '普通用户',
  `registTime` TIMESTAMP ,
  PRIMARY KEY (`id`)
)
-- 商品表
CREATE TABLE `products` (
  `id` VARCHAR(100) ,
  `name` VARCHAR(40) ,
  `price` DOUBLE ,
  `category` VARCHAR(40) ,
  `pnum` INT(11) ,
  `imgurl` VARCHAR(100) ,
  `description` VARCHAR(255) ,
  PRIMARY KEY (`id`)
)
-- 订单表
CREATE TABLE `orders` (
  `id` VARCHAR(100) ,
  `money` DOUBLE ,
  `receiverAddress` VARCHAR(255) ,
  `receiverName` VARCHAR(20) ,
  `receiverPhone` VARCHAR(20) ,
  `paystate` INT(11) ,
  `ordertime` TIMESTAMP ,
  `user_id` INT(11) ,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
)
-- 订单项表
CREATE TABLE `orderitem` (
  `order_id` VARCHAR(100) ,
  `product_id` VARCHAR(100),
  `buynum` INT(11) ,
  PRIMARY KEY (`order_id`,`product_id`),
  FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
)