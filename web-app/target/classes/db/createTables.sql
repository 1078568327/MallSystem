#用户表
DROP TABLE IF EXISTS t_user;
CREATE TABLE t_user(

	id	VARCHAR(50) PRIMARY KEY,
	username		VARCHAR(20),
	mobile_no		VARCHAR(20) NOT NULL,
	password		VARCHAR(50) NOT NULL,
	gender			VARCHAR(2) DEFAULT '保密',
	birthday		DATETIME,
	profile_picture		VARCHAR(50) DEFAULT 'mall_system.gif',
	email			VARCHAR(50),
	member_exp	BIGINT UNSIGNED DEFAULT 0,
	member_point	INT UNSIGNED DEFAULT 0

)ENGINE=InnoDB DEFAULT CHARSET=utf8;

#地址表
DROP TABLE IF EXISTS t_address;
CREATE TABLE t_address(

	id	VARCHAR(50)	PRIMARY KEY,
	province	VARCHAR(20),
	city	VARCHAR(20),
	district	VARCHAR(20),
	detail	VARCHAR(50),
	postcode  VARCHAR(10),
	consignee   VARCHAR(10),
	mobile_no  VARCHAR(20)

) ENGINE=InnoDB	DEFAULT CHARSET=utf8;

#配送地址管理表
DROP TABLE IF EXISTS t_shipping_address;
CREATE TABLE t_shipping_address(

	id	VARCHAR(50) PRIMARY KEY,
	user_id	VARCHAR(50) NOT NULL,
	address_id	VARCHAR(50) NOT NULL,
	remark_name	VARCHAR(20),
	is_default TINYINT UNSIGNED DEFAULT 0

)	ENGINE=InnoDB	DEFAULT CHARSET=utf8;

#cookie表(用户记住登录)
DROP TABLE IF EXISTS t_cookie;
CREATE TABLE t_cookie(

	id	VARCHAR(50)	PRIMARY KEY,
	user_id	VARCHAR(50)	NOT NULL,
	session_id	VARCHAR(50) NOT NULL,
	create_time	DATETIME NOT NULL,
	dead_time	DATETIME NOT NULL

)ENGINE=InnoDB DEFAULT CHARSET=utf8;

#商品表
DROP TABLE IF EXISTS t_goods;
CREATE TABLE t_goods(

	id	VARCHAR(50) PRIMARY KEY,
	goods_name	VARCHAR(20) NOT NULL,
	goods_price	DECIMAL(7,2)	NOT NULL,
	origin_price	DECIMAL(7,2) NOT NULL,
	goods_images	VARCHAR(50) NOT NULL,
	detail_images	VARCHAR(80),
	goods_type	VARCHAR(20)	NOT NULL,
	comment_amount	INT UNSIGNED DEFAULT 0,
	collect_amount	INT UNSIGNED DEFAULT 0,
	deal_amount		INT UNSIGNED DEFAULT 0,
	add_time	DATETIME,
	is_sale	TINYINT UNSIGNED	DEFAULT	1

)ENGINE=INNODB DEFAULT CHARSET=UTF8;

#商品库存表
DROP TABLE IF EXISTS t_stock;
CREATE TABLE t_stock(

	id	VARCHAR(50) PRIMARY KEY,
	goods_id	VARCHAR(50) NOT NULL,
	goods_stock	BIGINT UNSIGNED	DEFAULT 0,
	update_time	DATETIME

)ENGINE=INNODB DEFAULT CHARSET=UTF8;

#购物车表
DROP TABLE IF EXISTS t_shopping_cart;
CREATE TABLE t_shopping_cart(

	id	VARCHAR(50) PRIMARY KEY,
	user_id	VARCHAR(50) NOT NULL,
	goods_id	VARCHAR(50)	NOT NULL,
	amount	INT	UNSIGNED DEFAULT 1,
	create_time  DATETIME,
	is_buy  TINYINT UNSIGNED DEFAULT 0

)ENGINE = INNODB DEFAULT CHARSET = UTF8;

#订单表
DROP TABLE IF EXISTS t_order;
CREATE TABLE t_order(

	id  VARCHAR(50) PRIMARY KEY,
	user_id  VARCHAR(50)  NOT NULL,
	goods_id  VARCHAR(50)  NOT NULL,
	amount  INT UNSIGNED DEFAULT 1,
	total_price  DECIMAL(8,2),
	address_id  VARCHAR(50)  NOT NULL,
	create_time  DATETIME,
	order_status  TINYINT UNSIGNED DEFAULT 0

)ENGINE=INNODB DEFAULT CHARSET=UTF8;
























