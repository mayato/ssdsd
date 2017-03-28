/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2017-03-28 17:21:43
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goods_id` int(10) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `price` float(8,0) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `salenum` int(8) DEFAULT NULL,
  `introduce` varchar(200) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '小竹篮', '竹篮', '10', '1.jpg', null, '2', '这是一个竹篮', 'dasd');
INSERT INTO `goods` VALUES ('2', '1', '竹席', '1', '1', '1', '1', '1', null);
INSERT INTO `goods` VALUES ('3', '2', '竹席', '2', '2', '2', '2', '2', null);
INSERT INTO `goods` VALUES ('4', '45', '竹席', '45', '45', null, '54', '54', 'asdas');
INSERT INTO `goods` VALUES ('5', '45', '竹席', '456', '456', null, '78', '978', 'asd');
INSERT INTO `goods` VALUES ('6', '456', '竹筷', '456', '456', null, '456', '456', 'asd');
INSERT INTO `goods` VALUES ('7', '456', '竹筷', '456', '4578', null, '78', '78', 'asd');
INSERT INTO `goods` VALUES ('8', '789', '竹篮', '789', '', '', '789', '789', 'asd');
INSERT INTO `goods` VALUES ('9', '888', '竹筷', '789', '', '', '789', '789', '');
INSERT INTO `goods` VALUES ('10', '456', '竹椅', '546', '456', null, '456', '456', null);
INSERT INTO `goods` VALUES ('11', '456', '竹椅', '546', 'dfg', null, '456', '456', 'asd');
INSERT INTO `goods` VALUES ('12', '789', '竹椅', '879', '789', null, '789', '789', null);
INSERT INTO `goods` VALUES ('14', '456', '竹扫帚', '789', '789', null, '789', '789', null);
INSERT INTO `goods` VALUES ('15', 'sdf', '竹扫帚', '7489', '789', null, '789', '789', 'asdas');
INSERT INTO `goods` VALUES ('16', 'sdf', '竹扁担', '789', '789', null, '789', '789', 'asdasd');
INSERT INTO `goods` VALUES ('17', 'asd', '竹扁担', '456', '456', null, '456', '456', null);
INSERT INTO `goods` VALUES ('18', 'asd', '竹扁担', '456', '546', null, '456', '456', 'dasd');
INSERT INTO `goods` VALUES ('19', '789', '竹扁担', '789', '789', null, '789', '789', null);
INSERT INTO `goods` VALUES ('20', '789', '竹扁担', '789', '789', null, '789', '789', null);
INSERT INTO `goods` VALUES ('21', '586', '竹扁担', '546', '456', '', '456', '465', '');
INSERT INTO `goods` VALUES ('22', '456', '竹椅', '546', '456', null, '456', '456', null);
INSERT INTO `goods` VALUES ('23', 'zxc', '1', '1', '', '1', null, '1', '1');
INSERT INTO `goods` VALUES ('24', 'zxcv', '1', '1', 'addtocar.png', '1', null, '1', '1');
INSERT INTO `goods` VALUES ('25', '954', '1', '1', '1.jpg', '11', null, '1', '1');
INSERT INTO `goods` VALUES ('26', '12322', '123', '123', 'addtocar.png', '123', null, '123', '123');
INSERT INTO `goods` VALUES ('27', '一辆车', '竹篮', '546', 'buttonsearch.png', '54236', null, '546', '456');
INSERT INTO `goods` VALUES ('28', '789', '竹筷', '789', '', '', null, '789', 'asd');
INSERT INTO `goods` VALUES ('29', '789', '竹筷', '789', '', '', null, '789', '');
INSERT INTO `goods` VALUES ('30', '12322', '竹篮', '123', '', '123', null, '123', '123');
INSERT INTO `goods` VALUES ('31', '32', '竹篮', '23', '', '', null, '', '');
INSERT INTO `goods` VALUES ('32', '1', '竹篮', '1', '', '', null, '', '');
INSERT INTO `goods` VALUES ('33', '12322', '竹篮', '45', '', '', null, '', '');
INSERT INTO `goods` VALUES ('34', '454', '竹篮', '45', '', '', null, '', '');
INSERT INTO `goods` VALUES ('35', '45', '竹篮', '54', '', '', null, '', '');
INSERT INTO `goods` VALUES ('36', '竹雕', '竹雕', '10', 'tologin.png', '无', null, '很大', '浙江');

-- ----------------------------
-- Table structure for `store`
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `goods_id` int(20) NOT NULL,
  `number` int(10) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `s_id` int(20) NOT NULL AUTO_INCREMENT,
  `warehouse_id` int(20) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('1', '1', '5', '3', '1');

-- ----------------------------
-- Table structure for `user_t`
-- ----------------------------
DROP TABLE IF EXISTS `user_t`;
CREATE TABLE `user_t` (
  `user_name` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `sex` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_t
-- ----------------------------
INSERT INTO `user_t` VALUES ('1', '123', '123', '123', '男');
INSERT INTO `user_t` VALUES ('123', '123', '123', '123', 'on');
INSERT INTO `user_t` VALUES ('1234', '123', '123', '123', 'on');
INSERT INTO `user_t` VALUES ('123456', '123', '1111', '111', '男');
INSERT INTO `user_t` VALUES ('1234567', '1', '1', '1', '男');
INSERT INTO `user_t` VALUES ('123456q', '123', '132', '132', '男');
INSERT INTO `user_t` VALUES ('1325', 'qqq', '825273411@qq.com', '13588292576', '男');
INSERT INTO `user_t` VALUES ('18', '1', '1', '1', '男');
INSERT INTO `user_t` VALUES ('1q', '1', '1', '1', '男');
INSERT INTO `user_t` VALUES ('1w', '1', '1', '1', '男');
INSERT INTO `user_t` VALUES ('458798', '1234', '825273411@qq.com', '13588292576', '男');
INSERT INTO `user_t` VALUES ('a111', '1', '825273411@qq.com', '1', '男');
INSERT INTO `user_t` VALUES ('a3445058', '3445058', '825273411@qq.com', '132', '男');
INSERT INTO `user_t` VALUES ('aaa', 'aa', '啊啊', '啊啊', 'on');
INSERT INTO `user_t` VALUES ('admin', 'admin', '825273411@qq.com', '11', '男');
INSERT INTO `user_t` VALUES ('admin1', 'asdasd', 'asdasd', '阿什顿', '男');
INSERT INTO `user_t` VALUES ('asd', 'asd', 'asdasd', 'asd', '男');
INSERT INTO `user_t` VALUES ('asdad', 'asd', 'asd', 'asd', 'on');
INSERT INTO `user_t` VALUES ('qweq', '123', 'sad', '', '男');
INSERT INTO `user_t` VALUES ('qwerasss', '3445058', '825273411@qq.com', 'asd', '男');

-- ----------------------------
-- Table structure for `warehouse`
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse` (
  `warehouse_id` int(20) NOT NULL AUTO_INCREMENT,
  `warehouse_name` varchar(200) DEFAULT NULL,
  `warehouse_place` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
INSERT INTO `warehouse` VALUES ('1', 'name1', '1');
INSERT INTO `warehouse` VALUES ('2', 'name2', '2');
