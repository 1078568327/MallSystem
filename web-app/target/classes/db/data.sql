/*
Navicat MySQL Data Transfer

Source Server         : MallSystem
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : mall_system

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-01-17 21:14:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_address
-- ----------------------------
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE `t_address` (
  `id` varchar(50) NOT NULL,
  `province` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `district` varchar(20) DEFAULT NULL,
  `detail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_address
-- ----------------------------

-- ----------------------------
-- Table structure for t_cookie
-- ----------------------------
DROP TABLE IF EXISTS `t_cookie`;
CREATE TABLE `t_cookie` (
  `id` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `session_id` varchar(50) NOT NULL,
  `create_time` datetime NOT NULL,
  `dead_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cookie
-- ----------------------------
INSERT INTO `t_cookie` VALUES ('35442e9e-ddf5-4732-9023-bd20c9952bd2', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', '8B77523B6863890027747C404B177F04', '2018-01-12 17:24:17', '2018-01-19 17:24:17');
INSERT INTO `t_cookie` VALUES ('4ee58215-f87e-4bef-8f2c-1a9cfa076da8', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', 'BD3A1A5D916A2123F6AF45D19736AC13', '2018-01-12 18:45:16', '2018-01-19 18:45:16');
INSERT INTO `t_cookie` VALUES ('6bd04256-39ee-4319-b411-d64b3d785c13', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', 'CFD91AA78C8CE46B8143F1FF8563047E', '2018-01-12 18:41:06', '2018-01-19 18:41:06');
INSERT INTO `t_cookie` VALUES ('bd29570d-5de1-487e-b948-fcea89ef36b4', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', 'FFD90456338D48150D5EF8625C926959', '2018-01-16 12:15:02', '2018-01-23 12:15:02');

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` varchar(50) NOT NULL,
  `goods_name` varchar(20) NOT NULL,
  `goods_price` decimal(7,2) NOT NULL,
  `origin_price` decimal(7,2) NOT NULL,
  `goods_images` varchar(50) NOT NULL,
  `detail_images` varchar(80) DEFAULT NULL,
  `goods_type` varchar(20) NOT NULL,
  `comment_amount` int(10) unsigned DEFAULT '0',
  `collect_amount` int(10) unsigned DEFAULT '0',
  `deal_amount` int(10) unsigned DEFAULT '0',
  `add_time` datetime DEFAULT NULL,
  `is_sale` tinyint(3) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('0c438235-aa44-4ba8-938b-66bf2306cb41', '佳沛新西兰阳光金奇异果8颗', '29.00', '0.00', 'images/abroad/abr_6_title.jpg', null, '进口', '0', '0', '0', '2018-01-17 20:47:14', '1');
INSERT INTO `t_goods` VALUES ('121d148b-149a-4bfb-afed-1b4c5b447cc5', '菲律宾进口菠萝凤梨 2个', '28.00', '28.00', 'images/abroad/abr_5_title.jpg', null, '进口', '0', '0', '0', '2018-01-17 20:38:28', '1');
INSERT INTO `t_goods` VALUES ('163d2d8d-5604-4b89-b32d-501a048e2d72', '大红脆甜水蜜桃 5斤', '29.00', '31.50', 'images/domestic/dmes_4_title.jpg', null, '国产', '0', '0', '0', '2018-01-17 20:37:01', '1');
INSERT INTO `t_goods` VALUES ('18eeff54-cda9-48f9-83f9-010ea7d95515', '广西青皮芒果青芒玉芒 5斤', '69.00', '0.00', 'images/domestic/dmes_7_title.jpg', null, '国产', '0', '0', '0', '2018-01-17 20:43:15', '1');
INSERT INTO `t_goods` VALUES ('256818a5-7c0a-49b7-aa85-e45f4a2a79df', '南非进口黄柠檬 6个装', '29.00', '25.00', 'images/abroad/abr_1_title.jpg', null, '进口', '0', '0', '0', '2018-01-17 16:59:40', '1');
INSERT INTO `t_goods` VALUES ('2b96ef7a-5320-4689-a3fd-56273d626eb7', '新疆库尔勒香梨 5斤礼盒装', '38.00', '0.00', 'images/domestic/dmes_15_title.jpg', null, '国产', '0', '0', '0', '2018-01-17 21:08:10', '1');
INSERT INTO `t_goods` VALUES ('2c3d1198-a7dd-4a20-82e6-0fd5deff1d20', '加力果嗄啦果苹果12个装', '36.00', '39.90', 'images/domestic/dmes_8_title.jpg', null, '国产', '0', '0', '0', '2018-01-17 20:44:51', '1');
INSERT INTO `t_goods` VALUES ('3977a9ac-4711-4a9b-97d1-7278a3b6de18', '菠菜280g', '8.00', '9.50', 'images/domestic/dmes_3_title.jpg', null, '蔬菜', '0', '0', '0', '2018-01-17 20:35:44', '1');
INSERT INTO `t_goods` VALUES ('44d960ad-5698-4abb-b772-cb09860863e9', '国产绿奇异果 16颗', '49.00', '39.90', 'images/domestic/dmes_1_title.jpg', null, '国产', '0', '0', '0', '2018-01-17 19:13:57', '1');
INSERT INTO `t_goods` VALUES ('486937c7-f5f0-4a32-b183-c5ff6f5fd468', '福建特级红心蜜柚 4个', '69.00', '0.00', 'images/domestic/dmes_6_title.jpg', null, '国产', '0', '0', '0', '2018-01-17 20:40:44', '1');
INSERT INTO `t_goods` VALUES ('579afab0-27b7-47da-b7eb-8ebe012e73ab', '越南进口红心火龙果 5斤', '38.00', '0.00', 'images/abroad/abr_12_title.jpg', null, '蔬菜', '0', '0', '0', '2018-01-17 21:11:00', '1');
INSERT INTO `t_goods` VALUES ('58c5be6d-2c2a-42b7-adf0-0fb5b1e263c1', '美国进口无籽红提 1kg', '39.00', '35.00', 'images/abroad/abr_4_title.jpg', null, '进口', '0', '0', '0', '2018-01-17 19:13:18', '1');
INSERT INTO `t_goods` VALUES ('63bf9efe-ad32-4911-ac4f-5476178aeab5', '四川大凉山会理石榴8个', '48.00', '49.00', 'images/domestic/dmes_12_title.jpg', null, '国产', '0', '0', '0', '2018-01-17 21:01:10', '1');
INSERT INTO `t_goods` VALUES ('64fee153-e2d9-4403-b7f9-3940e498dc58', '油菜300g', '5.00', '5.00', 'images/domestic/dmes_17_title.jpg', null, '蔬菜', '0', '0', '0', '2018-01-17 21:10:02', '1');
INSERT INTO `t_goods` VALUES ('6d00919a-56c1-42f8-a456-7ca31b17089e', '新鲜水果龙眼 1kg', '12.00', '0.00', 'images/domestic/dmes_16_title.jpg', null, '国产', '0', '0', '0', '2018-01-17 21:09:02', '1');
INSERT INTO `t_goods` VALUES ('7272e9e4-269b-44d8-b12f-c99f044f8c8b', '西湖莲藕2kg', '37.00', '0.00', 'images/domestic/dmes_10_title.jpg', null, '蔬菜', '0', '0', '0', '2018-01-17 20:50:20', '1');
INSERT INTO `t_goods` VALUES ('734175bd-ce3b-40e6-96ee-73fa13b7b508', '进口新鲜青苹果 5斤', '30.00', '0.00', 'images/abroad/abr_7_title.jpg', null, '进口', '0', '0', '0', '2018-01-17 20:52:32', '1');
INSERT INTO `t_goods` VALUES ('8828774b-9fab-446d-9ce7-4c32adf3d24b', '泰国金枕头榴莲 5斤', '129.00', '129.00', 'images/abroad/abr_10_title.jpg', null, '进口', '0', '0', '0', '2018-01-17 21:02:36', '1');
INSERT INTO `t_goods` VALUES ('8fea2c3b-e381-43d3-9316-55ef29ad5632', '绿芦笋200g', '39.00', '42.00', 'images/domestic/dmes_11_title.jpg', null, '蔬菜', '0', '0', '0', '2018-01-17 20:54:48', '1');
INSERT INTO `t_goods` VALUES ('9ed05998-3eb7-4d4a-9022-14668f3c3fa5', '浙江涌泉蜜桔无核桔子5斤', '39.00', '39.00', 'images/domestic/dmes_2_title.jpg', null, '国产', '0', '0', '0', '2018-01-17 19:14:47', '1');
INSERT INTO `t_goods` VALUES ('a370cc83-8d8d-44f4-bd1f-2324dd1500a5', '西葫500g', '14.00', '14.00', 'images/domestic/dmes_13_title.jpg', null, '蔬菜', '0', '0', '0', '2018-01-17 21:05:08', '1');
INSERT INTO `t_goods` VALUES ('a3ddb9c7-2839-4d6c-a2aa-9eb5a3b85ae7', '墨西哥进口牛油果 10个', '45.00', '49.00', 'images/abroad/abr_9_title.jpg', null, '进口', '0', '0', '0', '2018-01-17 20:58:54', '1');
INSERT INTO `t_goods` VALUES ('a83ffa4c-36d6-486e-ac74-76a8fc32b64c', '进口香蕉超甜蕉2kg', '18.00', '20.00', 'images/abroad/abr_8_title.jpg', null, '进口', '0', '0', '0', '2018-01-17 20:56:43', '1');
INSERT INTO `t_goods` VALUES ('c035e975-0eee-46a8-8796-717818387647', '泰国进口山竹 2斤', '29.00', '29.00', 'images/abroad/abr_11_title.jpg', null, '进口', '0', '0', '0', '2018-01-17 21:03:34', '1');
INSERT INTO `t_goods` VALUES ('d9c33e77-86d3-4452-856f-e542e8870b45', '智利进口新鲜蓝莓 4盒', '99.00', '89.90', 'images/abroad/abr_2_title.jpg', null, '进口', '0', '0', '0', '2018-01-17 19:07:34', '1');
INSERT INTO `t_goods` VALUES ('db0f7ca2-0744-4390-be18-528027291dc2', '精选百香果西番莲8颗', '29.00', '0.00', 'images/domestic/dmes_9_title.jpg', null, '国产', '0', '0', '0', '2018-01-17 20:48:30', '1');
INSERT INTO `t_goods` VALUES ('f4cdb30f-82dd-4cd4-854a-d0181b58780b', '美国进口红啤梨 6个', '48.00', '48.00', 'images/abroad/abr_3_title.jpg', null, '进口', '0', '0', '0', '2018-01-17 19:12:27', '1');
INSERT INTO `t_goods` VALUES ('fe685497-a52d-439b-b527-c157c9b46fed', '西兰花270g', '19.00', '0.00', 'images/domestic/dmes_14_title.jpg', null, '蔬菜', '0', '0', '0', '2018-01-17 21:06:51', '1');

-- ----------------------------
-- Table structure for t_shipping_address
-- ----------------------------
DROP TABLE IF EXISTS `t_shipping_address`;
CREATE TABLE `t_shipping_address` (
  `id` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `address_id` varchar(50) NOT NULL,
  `remark_name` varchar(20) DEFAULT NULL,
  `is_default` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shipping_address
-- ----------------------------

-- ----------------------------
-- Table structure for t_stock
-- ----------------------------
DROP TABLE IF EXISTS `t_stock`;
CREATE TABLE `t_stock` (
  `id` varchar(50) NOT NULL,
  `goods_id` varchar(50) NOT NULL,
  `goods_stock` bigint(20) unsigned DEFAULT '0',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stock
-- ----------------------------
INSERT INTO `t_stock` VALUES ('00a76ac2-a12b-4760-8191-2f713d158136', '2b96ef7a-5320-4689-a3fd-56273d626eb7', '10000', '2018-01-17 21:13:29');
INSERT INTO `t_stock` VALUES ('063c8cb2-7624-4d6e-bfde-c59c35e9ab90', 'c035e975-0eee-46a8-8796-717818387647', '10000', '2018-01-17 21:13:29');
INSERT INTO `t_stock` VALUES ('0d76cc5d-85a2-43f0-999a-11c470262f24', 'db0f7ca2-0744-4390-be18-528027291dc2', '10000', '2018-01-17 21:13:30');
INSERT INTO `t_stock` VALUES ('1f0ae45a-0015-40b9-add8-8ca008996014', 'a370cc83-8d8d-44f4-bd1f-2324dd1500a5', '10000', '2018-01-17 21:13:29');
INSERT INTO `t_stock` VALUES ('289e2942-1263-490b-9e3b-7686c2aa2cd2', 'd9c33e77-86d3-4452-856f-e542e8870b45', '10000', '2018-01-17 21:13:31');
INSERT INTO `t_stock` VALUES ('28b6aa93-2495-4ac4-a9d9-05533621c0de', '64fee153-e2d9-4403-b7f9-3940e498dc58', '10000', '2018-01-17 21:13:29');
INSERT INTO `t_stock` VALUES ('2ca6dd6b-801f-4eed-9d33-7a1ee4d02f35', '579afab0-27b7-47da-b7eb-8ebe012e73ab', '10000', '2018-01-17 21:13:28');
INSERT INTO `t_stock` VALUES ('30801a1b-8469-4df1-8469-ca1578268a5c', '121d148b-149a-4bfb-afed-1b4c5b447cc5', '10000', '2018-01-17 21:13:30');
INSERT INTO `t_stock` VALUES ('34676eb8-2813-41a8-8db2-5eca600f9521', '3977a9ac-4711-4a9b-97d1-7278a3b6de18', '10000', '2018-01-17 21:13:30');
INSERT INTO `t_stock` VALUES ('3f284b52-9285-4056-a6f0-bfc56c846506', '44d960ad-5698-4abb-b772-cb09860863e9', '10000', '2018-01-17 21:13:31');
INSERT INTO `t_stock` VALUES ('4233d4bf-bfe7-4e7e-bb8f-b04edd19d989', '58c5be6d-2c2a-42b7-adf0-0fb5b1e263c1', '10000', '2018-01-17 21:13:31');
INSERT INTO `t_stock` VALUES ('4311e27e-add3-4564-910a-2d1708ba779b', 'a83ffa4c-36d6-486e-ac74-76a8fc32b64c', '10000', '2018-01-17 21:13:30');
INSERT INTO `t_stock` VALUES ('43ff3b6b-cf8b-4f23-b98a-649fd7c485c6', 'f4cdb30f-82dd-4cd4-854a-d0181b58780b', '10000', '2018-01-17 21:13:31');
INSERT INTO `t_stock` VALUES ('6922d192-210f-4b14-8e2f-a9e637b7f4bc', '2c3d1198-a7dd-4a20-82e6-0fd5deff1d20', '10000', '2018-01-17 21:13:30');
INSERT INTO `t_stock` VALUES ('8a437a83-9cb2-4f04-b7ef-396b30db5839', '63bf9efe-ad32-4911-ac4f-5476178aeab5', '10000', '2018-01-17 21:13:29');
INSERT INTO `t_stock` VALUES ('8e117cd3-48e7-4c11-8690-0b2d8b2c2f2d', '6d00919a-56c1-42f8-a456-7ca31b17089e', '10000', '2018-01-17 21:13:29');
INSERT INTO `t_stock` VALUES ('925f66ca-5cbb-4a85-90e9-bf82ab406a5a', '0c438235-aa44-4ba8-938b-66bf2306cb41', '10000', '2018-01-17 21:13:30');
INSERT INTO `t_stock` VALUES ('95ffa4c6-22cf-43dc-ae78-f6a7fab10d1b', '256818a5-7c0a-49b7-aa85-e45f4a2a79df', '10000', '2018-01-17 21:13:31');
INSERT INTO `t_stock` VALUES ('9a043f8d-dc6b-4bec-a71d-396043fbb6d6', '734175bd-ce3b-40e6-96ee-73fa13b7b508', '10000', '2018-01-17 21:13:30');
INSERT INTO `t_stock` VALUES ('b3ea382e-a818-4f49-b401-155d71bf39ac', '18eeff54-cda9-48f9-83f9-010ea7d95515', '10000', '2018-01-17 21:13:30');
INSERT INTO `t_stock` VALUES ('b4128b40-4aa9-4caa-a9c0-e10bbda6c171', '163d2d8d-5604-4b89-b32d-501a048e2d72', '10000', '2018-01-17 21:13:30');
INSERT INTO `t_stock` VALUES ('c7e66d59-6150-4825-9034-f2d0ad7bba6d', '8828774b-9fab-446d-9ce7-4c32adf3d24b', '10000', '2018-01-17 21:13:29');
INSERT INTO `t_stock` VALUES ('cf80344a-c9e5-4633-891a-9026f81097c9', 'a3ddb9c7-2839-4d6c-a2aa-9eb5a3b85ae7', '10000', '2018-01-17 21:13:29');
INSERT INTO `t_stock` VALUES ('dc2e2342-99e9-4666-afc9-6a19ac485ce9', '8fea2c3b-e381-43d3-9316-55ef29ad5632', '10000', '2018-01-17 21:13:30');
INSERT INTO `t_stock` VALUES ('e74deab6-6599-4cfd-b769-b543878773d1', '486937c7-f5f0-4a32-b183-c5ff6f5fd468', '10000', '2018-01-17 21:13:30');
INSERT INTO `t_stock` VALUES ('f7834a8d-8826-4c68-be25-9b17c4472096', '9ed05998-3eb7-4d4a-9022-14668f3c3fa5', '10000', '2018-01-17 21:13:30');
INSERT INTO `t_stock` VALUES ('f88ca1a5-eefe-4e43-bd8d-dfbcc241153d', 'fe685497-a52d-439b-b527-c157c9b46fed', '10000', '2018-01-17 21:13:29');
INSERT INTO `t_stock` VALUES ('f9cdc1a7-a8cf-46a8-9779-740fa95d4ce0', '7272e9e4-269b-44d8-b12f-c99f044f8c8b', '10000', '2018-01-17 21:13:30');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(50) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `mobile_no` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `gender` varchar(2) DEFAULT '保密',
  `birthday` datetime DEFAULT NULL,
  `profile_picture` varchar(50) DEFAULT 'mall_system.gif',
  `email` varchar(50) DEFAULT NULL,
  `member_exp` bigint(20) unsigned DEFAULT '0',
  `member_point` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', 'qinxi', '15602283536', 'E10ADC3949BA59ABBE56E057F20F883E', '男', '2018-01-12 00:00:00', '15602283536.jpg', '15602283536@163.com', '0', '0');
