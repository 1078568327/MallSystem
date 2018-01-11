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
	detail	VARCHAR(50)

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

