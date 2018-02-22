/*
Navicat MySQL Data Transfer

Source Server         : MallSystem
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : mall_system

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-02-06 19:52:11
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
  `postcode` varchar(10) DEFAULT NULL,
  `consignee` varchar(10) DEFAULT NULL,
  `mobile_no` varchar(20) DEFAULT NULL,
  `user_id` varchar(50) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_address
-- ----------------------------
INSERT INTO `t_address` VALUES ('250a9318-0588-4a54-896d-85d1a2ab404c', '广东省', '深圳市 ', '宝安区', '西乡固戍石街新村', '518000', '陈钦西', '15602283536', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', '2018-01-25 17:08:06');
INSERT INTO `t_address` VALUES ('8b26a896-8d24-4a7b-ac92-ffc6cc6c4244', '广东省', '广州市  ', '番禺区', '大学城广州大学', '510000', '陈钦西', '15602283536', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', '2018-01-25 16:41:55');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `goods_id` varchar(50) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `fit_score` decimal(2,1) DEFAULT NULL,
  `seller_score` decimal(2,1) DEFAULT NULL,
  `logistics_score` decimal(2,1) DEFAULT NULL,
  `goods_comment` varchar(80) DEFAULT NULL,
  `service_comment` varchar(80) DEFAULT NULL,
  `comment_picture` varchar(80) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('6ff0c3a6-3ac6-4102-9cf5-5548812f6f28', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', '256818a5-7c0a-49b7-aa85-e45f4a2a79df', '8834260b-59a7-4bf7-9e02-771f7a24a886', '4.5', '5.0', '0.0', '很好，柠檬味道很赞，颜色也很漂亮', '商家服务态度好~~~', null, '2018-02-03 16:06:45');

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
INSERT INTO `t_cookie` VALUES ('0c88f168-7b02-43d8-a812-dd38d093d39b', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', 'D8407C56FD7AE1825A8481F8DAEC0914', '2018-02-06 14:50:48', '2018-02-13 14:50:48');
INSERT INTO `t_cookie` VALUES ('35442e9e-ddf5-4732-9023-bd20c9952bd2', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', '8B77523B6863890027747C404B177F04', '2018-01-12 17:24:17', '2018-01-19 17:24:17');
INSERT INTO `t_cookie` VALUES ('3cbf356b-a844-4ed1-99cf-dd9b1f48eba1', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', '6CC7490D1310B3EF6B51126B3B1FEB5F', '2018-01-21 20:07:06', '2018-01-28 20:07:06');
INSERT INTO `t_cookie` VALUES ('4ee58215-f87e-4bef-8f2c-1a9cfa076da8', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', 'BD3A1A5D916A2123F6AF45D19736AC13', '2018-01-12 18:45:16', '2018-01-19 18:45:16');
INSERT INTO `t_cookie` VALUES ('6bd04256-39ee-4319-b411-d64b3d785c13', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', 'CFD91AA78C8CE46B8143F1FF8563047E', '2018-01-12 18:41:06', '2018-01-19 18:41:06');
INSERT INTO `t_cookie` VALUES ('bd29570d-5de1-487e-b948-fcea89ef36b4', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', 'FFD90456338D48150D5EF8625C926959', '2018-01-16 12:15:02', '2018-01-23 12:15:02');
INSERT INTO `t_cookie` VALUES ('d65fa13d-e92e-4de6-a910-b47aaebdd795', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', 'FA9348B6A76B566DB7A7D4FD90D2C5EA', '2018-01-30 14:18:08', '2018-02-06 14:18:08');
INSERT INTO `t_cookie` VALUES ('f240984c-db5b-4933-8996-4e738a2e0ab6', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', 'D74D087E374F70B6ECC2135D2A94075B', '2018-01-21 20:04:54', '2018-01-28 20:04:54');

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
INSERT INTO `t_goods` VALUES ('0c438235-aa44-4ba8-938b-66bf2306cb41', '佳沛新西兰阳光金奇异果8颗', '29.00', '0.00', 'images/abroad/abr_6_title.jpg', 'abr_6_detail_1.png|abr_6_detail_2.png', '进口', '0', '0', '5', '2018-01-17 20:47:14', '1');
INSERT INTO `t_goods` VALUES ('121d148b-149a-4bfb-afed-1b4c5b447cc5', '菲律宾进口菠萝凤梨 2个', '28.00', '28.00', 'images/abroad/abr_5_title.jpg', 'abr_5_detail_1.png|abr_5_detail_2.png|abr_5_detail_3.png', '进口', '0', '0', '0', '2018-01-17 20:38:28', '1');
INSERT INTO `t_goods` VALUES ('163d2d8d-5604-4b89-b32d-501a048e2d72', '大红脆甜水蜜桃 5斤', '29.00', '31.50', 'images/domestic/dmes_4_title.jpg', 'dmes_4_detail_1.png|dmes_4_detail_2.png|dmes_4_detail_3.png', '国产', '0', '0', '0', '2018-01-17 20:37:01', '1');
INSERT INTO `t_goods` VALUES ('18eeff54-cda9-48f9-83f9-010ea7d95515', '广西青皮芒果青芒玉芒 5斤', '69.00', '0.00', 'images/domestic/dmes_7_title.jpg', 'dmes_7_detail_1.png|dmes_7_detail_2.png|dmes_7_detail_3.png|dmes_7_detail_4.png', '国产', '0', '0', '0', '2018-01-17 20:43:15', '1');
INSERT INTO `t_goods` VALUES ('256818a5-7c0a-49b7-aa85-e45f4a2a79df', '南非进口黄柠檬 6个装', '29.00', '25.00', 'images/abroad/abr_2_title.jpg', 'abr_2_detail_1.png|abr_2_detail_2.png|abr_2_detail_3.png|abr_2_detail_4.png', '进口', '0', '2', '8', '2018-01-17 16:59:40', '1');
INSERT INTO `t_goods` VALUES ('2b96ef7a-5320-4689-a3fd-56273d626eb7', '新疆库尔勒香梨 5斤礼盒装', '38.00', '0.00', 'images/domestic/dmes_15_title.jpg', 'dmes_15_detail_1.png|dmes_15_detail_2.png|dmes_15_detail_3.png', '国产', '0', '0', '0', '2018-01-17 21:08:10', '1');
INSERT INTO `t_goods` VALUES ('2c3d1198-a7dd-4a20-82e6-0fd5deff1d20', '加力果嗄啦果苹果12个装', '36.00', '39.90', 'images/domestic/dmes_8_title.jpg', '', '国产', '0', '0', '0', '2018-01-17 20:44:51', '1');
INSERT INTO `t_goods` VALUES ('3977a9ac-4711-4a9b-97d1-7278a3b6de18', '菠菜280g', '8.00', '9.50', 'images/domestic/dmes_3_title.jpg', 'dmes_3_detail_1.png', '蔬菜', '0', '0', '0', '2018-01-17 20:35:44', '1');
INSERT INTO `t_goods` VALUES ('44d960ad-5698-4abb-b772-cb09860863e9', '国产绿奇异果 16颗', '49.00', '39.90', 'images/domestic/dmes_1_title.jpg', 'dmes_1_detail_1.png|dmes_1_detail_2.png|dmes_1_detail_3.png|dmes_1_detail_4.png', '国产', '0', '0', '0', '2018-01-17 19:13:57', '1');
INSERT INTO `t_goods` VALUES ('486937c7-f5f0-4a32-b183-c5ff6f5fd468', '福建特级红心蜜柚 4个', '69.00', '0.00', 'images/domestic/dmes_6_title.jpg', 'dmes_6_detail_1.png|dmes_6_detail_2.png|dmes_6_detail_3.png', '国产', '0', '0', '2', '2018-01-17 20:40:44', '1');
INSERT INTO `t_goods` VALUES ('579afab0-27b7-47da-b7eb-8ebe012e73ab', '越南进口红心火龙果 5斤', '38.00', '0.00', 'images/abroad/abr_12_title.jpg', 'abr_12_detail_1.png|abr_12_detail_2.png|abr_12_detail_3.png', '进口', '0', '0', '0', '2018-01-17 21:11:00', '1');
INSERT INTO `t_goods` VALUES ('58c5be6d-2c2a-42b7-adf0-0fb5b1e263c1', '美国进口无籽红提 1kg', '39.00', '35.00', 'images/abroad/abr_4_title.jpg', 'abr_4_detail_1.png|abr_4_detail_2.png', '进口', '0', '0', '4', '2018-01-17 19:13:18', '1');
INSERT INTO `t_goods` VALUES ('63bf9efe-ad32-4911-ac4f-5476178aeab5', '四川大凉山会理石榴8个', '48.00', '49.00', 'images/domestic/dmes_12_title.jpg', 'dmes_12_detail_1.png', '国产', '0', '0', '0', '2018-01-17 21:01:10', '1');
INSERT INTO `t_goods` VALUES ('64fee153-e2d9-4403-b7f9-3940e498dc58', '油菜300g', '5.00', '5.00', 'images/domestic/dmes_17_title.jpg', 'dmes_17_detail_1.png|dmes_17_detail_2.png', '蔬菜', '0', '0', '1', '2018-01-17 21:10:02', '1');
INSERT INTO `t_goods` VALUES ('6d00919a-56c1-42f8-a456-7ca31b17089e', '新鲜水果龙眼 1kg', '12.00', '0.00', 'images/domestic/dmes_16_title.jpg', 'dmes_16_detail_1.jpg|dmes_16_detail_2.jpg', '国产', '0', '0', '0', '2018-01-17 21:09:02', '1');
INSERT INTO `t_goods` VALUES ('7272e9e4-269b-44d8-b12f-c99f044f8c8b', '西湖莲藕2kg', '37.00', '0.00', 'images/domestic/dmes_10_title.jpg', 'dmes_10_detail_1.png|dmes_10_detail_2.png', '蔬菜', '0', '0', '3', '2018-01-17 20:50:20', '1');
INSERT INTO `t_goods` VALUES ('734175bd-ce3b-40e6-96ee-73fa13b7b508', '进口新鲜青苹果 5斤', '30.00', '0.00', 'images/abroad/abr_7_title.jpg', 'abr_7_detail_1.png|abr_7_detail_2.png|abr_7_detail_3.png|abr_7_detail_4.png', '进口', '0', '0', '0', '2018-01-17 20:52:32', '1');
INSERT INTO `t_goods` VALUES ('8828774b-9fab-446d-9ce7-4c32adf3d24b', '泰国金枕头榴莲 5斤', '129.00', '129.00', 'images/abroad/abr_10_title.jpg', 'abr_10_detail_1.png', '进口', '0', '0', '0', '2018-01-17 21:02:36', '1');
INSERT INTO `t_goods` VALUES ('8fea2c3b-e381-43d3-9316-55ef29ad5632', '绿芦笋200g', '39.00', '42.00', 'images/domestic/dmes_11_title.jpg', 'dmes_11_detail_1.png', '蔬菜', '0', '0', '2', '2018-01-17 20:54:48', '1');
INSERT INTO `t_goods` VALUES ('9ed05998-3eb7-4d4a-9022-14668f3c3fa5', '浙江涌泉蜜桔无核桔子5斤', '39.00', '39.00', 'images/domestic/dmes_2_title.jpg', 'dmes_2_detail_1.png|dmes_2_detail_2.png', '国产', '0', '0', '6', '2018-01-17 19:14:47', '1');
INSERT INTO `t_goods` VALUES ('a370cc83-8d8d-44f4-bd1f-2324dd1500a5', '西葫500g', '14.00', '14.00', 'images/domestic/dmes_13_title.jpg', 'dmes_13_detail_1.png|dmes_13_detail_2.png', '蔬菜', '0', '0', '0', '2018-01-17 21:05:08', '1');
INSERT INTO `t_goods` VALUES ('a3ddb9c7-2839-4d6c-a2aa-9eb5a3b85ae7', '墨西哥进口牛油果 10个', '45.00', '49.00', 'images/abroad/abr_9_title.jpg', 'abr_9_detail_1.png|abr_9_detail_2.png|abr_9_detail_3.png', '进口', '0', '0', '0', '2018-01-17 20:58:54', '1');
INSERT INTO `t_goods` VALUES ('a83ffa4c-36d6-486e-ac74-76a8fc32b64c', '进口香蕉超甜蕉2kg', '18.00', '20.00', 'images/abroad/abr_8_title.jpg', 'abr_8_detail_1.png|abr_8_detail_2.png', '进口', '0', '0', '0', '2018-01-17 20:56:43', '1');
INSERT INTO `t_goods` VALUES ('c035e975-0eee-46a8-8796-717818387647', '泰国进口山竹 2斤', '29.00', '29.00', 'images/abroad/abr_11_title.jpg', 'abr_11_detail_1.ong|abr_11_detail_2.png', '进口', '0', '0', '0', '2018-01-17 21:03:34', '1');
INSERT INTO `t_goods` VALUES ('d9c33e77-86d3-4452-856f-e542e8870b45', '智利进口新鲜蓝莓 4盒', '99.00', '89.90', 'images/abroad/abr_1_title.jpg', 'abr_1_detail_1.png|abr_1_detail_2.png|abr_1_detail_3.png|abr_1_detail_4.png', '进口', '0', '0', '6', '2018-01-17 19:07:34', '1');
INSERT INTO `t_goods` VALUES ('db0f7ca2-0744-4390-be18-528027291dc2', '精选百香果西番莲8颗', '29.00', '0.00', 'images/domestic/dmes_9_title.jpg', 'dmes_9_detail_1.png|dmes_9_deail_2.png|dmes_9_detail_3.png', '国产', '0', '0', '0', '2018-01-17 20:48:30', '1');
INSERT INTO `t_goods` VALUES ('f4cdb30f-82dd-4cd4-854a-d0181b58780b', '美国进口红啤梨 6个', '48.00', '48.00', 'images/abroad/abr_3_title.jpg', 'abr_3_detail_1.png|abr_3_detail_2.png', '进口', '0', '0', '0', '2018-01-17 19:12:27', '1');
INSERT INTO `t_goods` VALUES ('fe685497-a52d-439b-b527-c157c9b46fed', '西兰花270g', '19.00', '0.00', 'images/domestic/dmes_14_title.jpg', 'dmes_14_detail_1.png|dmes_14_detail_2.png', '蔬菜', '0', '0', '0', '2018-01-17 21:06:51', '1');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `goods_id` varchar(50) NOT NULL,
  `amount` int(10) unsigned DEFAULT '1',
  `total_price` decimal(8,2) DEFAULT NULL,
  `address_id` varchar(50) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `order_status` tinyint(3) unsigned DEFAULT '0',
  `order_num` int(10) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('13c2b843-1f61-443f-b56a-d8e381b2606c', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', '8828774b-9fab-446d-9ce7-4c32adf3d24b', '1', '129.00', '8b26a896-8d24-4a7b-ac92-ffc6cc6c4244', '2018-01-31 15:40:01', '1', '1');
INSERT INTO `t_order` VALUES ('1d104f1f-6e13-47e2-a93e-62eac8ebaae3', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', '18eeff54-cda9-48f9-83f9-010ea7d95515', '1', '69.00', '8b26a896-8d24-4a7b-ac92-ffc6cc6c4244', '2018-01-31 15:40:04', '1', '1');
INSERT INTO `t_order` VALUES ('23822859-095c-4713-88e7-fe940b9a8aed', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', '0c438235-aa44-4ba8-938b-66bf2306cb41', '1', '29.00', '8b26a896-8d24-4a7b-ac92-ffc6cc6c4244', '2018-01-31 16:46:21', '4', '4');
INSERT INTO `t_order` VALUES ('25f318fc-79ee-40b7-9343-25ff39174a96', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', '121d148b-149a-4bfb-afed-1b4c5b447cc5', '1', '28.00', '8b26a896-8d24-4a7b-ac92-ffc6cc6c4244', '2018-01-31 15:40:05', '1', '1');
INSERT INTO `t_order` VALUES ('5adfaf24-564c-4f4f-b093-8470864c0849', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', '8fea2c3b-e381-43d3-9316-55ef29ad5632', '1', '39.00', '8b26a896-8d24-4a7b-ac92-ffc6cc6c4244', '2018-01-31 15:40:04', '1', '1');
INSERT INTO `t_order` VALUES ('71481fbe-fcfe-4646-b57a-f034ed867898', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', '0c438235-aa44-4ba8-938b-66bf2306cb41', '2', '58.00', '8b26a896-8d24-4a7b-ac92-ffc6cc6c4244', '2018-01-31 15:40:05', '1', '1');
INSERT INTO `t_order` VALUES ('8834260b-59a7-4bf7-9e02-771f7a24a886', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', '256818a5-7c0a-49b7-aa85-e45f4a2a79df', '1', '29.00', '8b26a896-8d24-4a7b-ac92-ffc6cc6c4244', '2018-01-31 16:26:41', '3', '2');
INSERT INTO `t_order` VALUES ('8d6d08c7-860b-44e5-bc06-4a075098875f', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', '9ed05998-3eb7-4d4a-9022-14668f3c3fa5', '1', '39.00', '8b26a896-8d24-4a7b-ac92-ffc6cc6c4244', '2018-01-31 15:40:05', '1', '1');
INSERT INTO `t_order` VALUES ('c1c26f39-f661-4396-b3a7-0373ee92bd97', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', '8fea2c3b-e381-43d3-9316-55ef29ad5632', '2', '78.00', '8b26a896-8d24-4a7b-ac92-ffc6cc6c4244', '2018-01-31 15:40:03', '1', '1');
INSERT INTO `t_order` VALUES ('cc4587fa-d8bf-4793-ba1c-7fa75d7612a3', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', '256818a5-7c0a-49b7-aa85-e45f4a2a79df', '1', '29.00', '8b26a896-8d24-4a7b-ac92-ffc6cc6c4244', '2018-01-31 15:40:05', '1', '1');
INSERT INTO `t_order` VALUES ('cff7a264-e3bd-45ba-a695-90f041e419dd', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', 'd9c33e77-86d3-4452-856f-e542e8870b45', '1', '99.00', '8b26a896-8d24-4a7b-ac92-ffc6cc6c4244', '2018-01-31 15:40:05', '1', '1');
INSERT INTO `t_order` VALUES ('da4def74-13d4-4719-81b8-62206680a6bb', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', '8828774b-9fab-446d-9ce7-4c32adf3d24b', '1', '129.00', '8b26a896-8d24-4a7b-ac92-ffc6cc6c4244', '2018-01-31 16:50:31', '2', '5');
INSERT INTO `t_order` VALUES ('ed671146-581e-4810-883e-700f1fc9cd3b', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', '58c5be6d-2c2a-42b7-adf0-0fb5b1e263c1', '2', '78.00', '8b26a896-8d24-4a7b-ac92-ffc6cc6c4244', '2018-01-31 15:40:03', '1', '1');

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
INSERT INTO `t_shipping_address` VALUES ('32da76f2-1eb8-4282-bcd3-a81c9744094c', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', '8b26a896-8d24-4a7b-ac92-ffc6cc6c4244', null, '1');
INSERT INTO `t_shipping_address` VALUES ('ec372120-f501-4f1a-bf97-94bab611016b', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', '250a9318-0588-4a54-896d-85d1a2ab404c', null, '0');

-- ----------------------------
-- Table structure for t_shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_shopping_cart`;
CREATE TABLE `t_shopping_cart` (
  `id` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `goods_id` varchar(50) NOT NULL,
  `amount` int(10) unsigned DEFAULT '1',
  `create_time` datetime DEFAULT NULL,
  `is_buy` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shopping_cart
-- ----------------------------
INSERT INTO `t_shopping_cart` VALUES ('4afef3ad-7f32-4666-9bb8-10b24d952bfa', '1f81d4b0-6c94-41ef-8cca-4a6a4be4bd09', '256818a5-7c0a-49b7-aa85-e45f4a2a79df', '1', '2018-02-05 20:46:47', '0');

-- ----------------------------
-- Table structure for t_stock
-- ----------------------------
DROP TABLE IF EXISTS `t_stock`;
CREATE TABLE `t_stock` (
  `id` varchar(50) NOT NULL,
  `goods_id` varchar(50) NOT NULL,
  `goods_stock` bigint(20) unsigned DEFAULT '0',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stock
-- ----------------------------
INSERT INTO `t_stock` VALUES ('1e4dd554-9076-4f0a-8ab2-92033eedfdf3', 'db0f7ca2-0744-4390-be18-528027291dc2', '1000', '2018-01-27 15:02:49');
INSERT INTO `t_stock` VALUES ('34e813d1-5fdd-4c7e-a56d-02b16593144a', '6d00919a-56c1-42f8-a456-7ca31b17089e', '1000', '2018-01-27 15:02:48');
INSERT INTO `t_stock` VALUES ('36a97ac6-1c25-4a9f-8668-daf4fe44632b', '121d148b-149a-4bfb-afed-1b4c5b447cc5', '999', '2018-01-31 15:40:05');
INSERT INTO `t_stock` VALUES ('37577dbd-de51-4fec-b490-01b88ee40f1d', '8828774b-9fab-446d-9ce7-4c32adf3d24b', '998', '2018-01-31 16:50:31');
INSERT INTO `t_stock` VALUES ('3d38c679-f1d6-4868-96b7-e342b712cc6d', '163d2d8d-5604-4b89-b32d-501a048e2d72', '1000', '2018-01-27 15:02:49');
INSERT INTO `t_stock` VALUES ('42eefb66-d4db-481a-aa33-f404fed420e0', '18eeff54-cda9-48f9-83f9-010ea7d95515', '989', '2018-01-31 15:40:04');
INSERT INTO `t_stock` VALUES ('4518da56-8732-403d-832f-518b00ae3533', '256818a5-7c0a-49b7-aa85-e45f4a2a79df', '985', '2018-01-31 16:33:32');
INSERT INTO `t_stock` VALUES ('4a38426b-e24b-4e7f-b636-3fa4c2aa2b4a', '486937c7-f5f0-4a32-b183-c5ff6f5fd468', '1000', '2018-01-27 15:02:49');
INSERT INTO `t_stock` VALUES ('4e0f6c62-c7f7-4a5d-8fa5-6009e871ccdc', '58c5be6d-2c2a-42b7-adf0-0fb5b1e263c1', '989', '2018-01-31 15:40:03');
INSERT INTO `t_stock` VALUES ('6028ec0b-1479-445d-8d14-2e8237f7a01b', '579afab0-27b7-47da-b7eb-8ebe012e73ab', '1000', '2018-01-27 15:02:47');
INSERT INTO `t_stock` VALUES ('65ab2934-41d1-45e8-b78e-8342df8f663b', 'a3ddb9c7-2839-4d6c-a2aa-9eb5a3b85ae7', '1000', '2018-01-27 15:02:48');
INSERT INTO `t_stock` VALUES ('6cc1ecaa-f10a-41e5-9e17-4ccb9b6aa5ff', 'fe685497-a52d-439b-b527-c157c9b46fed', '1000', '2018-01-27 15:02:48');
INSERT INTO `t_stock` VALUES ('73572359-769c-4777-8e29-d017c8e07a2d', 'a83ffa4c-36d6-486e-ac74-76a8fc32b64c', '1000', '2018-01-27 15:02:48');
INSERT INTO `t_stock` VALUES ('7b6d3f93-2b3f-4733-9399-7f26393e587e', '2c3d1198-a7dd-4a20-82e6-0fd5deff1d20', '1000', '2018-01-27 15:02:49');
INSERT INTO `t_stock` VALUES ('7d5fd823-1a74-4b51-942b-4b15a38e185e', '3977a9ac-4711-4a9b-97d1-7278a3b6de18', '1000', '2018-01-27 15:02:49');
INSERT INTO `t_stock` VALUES ('828d7c17-e070-4fcc-8fec-b60a4ab07ff2', 'd9c33e77-86d3-4452-856f-e542e8870b45', '989', '2018-01-31 15:40:05');
INSERT INTO `t_stock` VALUES ('9bb46dce-0e6c-4301-b9e8-fe77d0421530', '734175bd-ce3b-40e6-96ee-73fa13b7b508', '1000', '2018-01-27 15:02:49');
INSERT INTO `t_stock` VALUES ('9e0ee771-ff67-4549-b0e5-75393aa0dcfe', '44d960ad-5698-4abb-b772-cb09860863e9', '1000', '2018-01-27 15:02:50');
INSERT INTO `t_stock` VALUES ('a1d15b81-5bc2-4417-b74e-4920d3427b89', 'c035e975-0eee-46a8-8796-717818387647', '1000', '2018-01-27 15:02:48');
INSERT INTO `t_stock` VALUES ('a20070eb-9a77-4a39-9a90-c124d9387aa7', '2b96ef7a-5320-4689-a3fd-56273d626eb7', '1000', '2018-01-27 15:02:48');
INSERT INTO `t_stock` VALUES ('a3f79848-040d-47af-b2a1-b27ae90f295b', 'a370cc83-8d8d-44f4-bd1f-2324dd1500a5', '1000', '2018-01-27 15:02:48');
INSERT INTO `t_stock` VALUES ('a5647d56-1241-4615-9679-dcf219d7b4a8', '9ed05998-3eb7-4d4a-9022-14668f3c3fa5', '988', '2018-01-31 16:20:19');
INSERT INTO `t_stock` VALUES ('b11074bb-c075-43d4-8f00-74106a643f2c', '63bf9efe-ad32-4911-ac4f-5476178aeab5', '1000', '2018-01-27 15:02:48');
INSERT INTO `t_stock` VALUES ('b416ef12-0233-406e-984f-84c43effe141', '64fee153-e2d9-4403-b7f9-3940e498dc58', '1000', '2018-01-27 15:02:48');
INSERT INTO `t_stock` VALUES ('bbe4f82d-fcb9-43d2-9377-754ccf7e025f', '8fea2c3b-e381-43d3-9316-55ef29ad5632', '978', '2018-01-31 15:40:04');
INSERT INTO `t_stock` VALUES ('c36a1db7-0627-4a7e-9dcd-ddf3e932322c', '0c438235-aa44-4ba8-938b-66bf2306cb41', '986', '2018-01-31 16:46:21');
INSERT INTO `t_stock` VALUES ('c959f0c0-c0a4-40e1-bc18-d5aec41dcd96', '7272e9e4-269b-44d8-b12f-c99f044f8c8b', '1000', '2018-01-27 15:02:49');
INSERT INTO `t_stock` VALUES ('d3073a43-524c-43f9-8800-072897d4fbce', 'f4cdb30f-82dd-4cd4-854a-d0181b58780b', '1000', '2018-01-27 15:02:50');

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
