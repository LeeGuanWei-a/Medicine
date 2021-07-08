/*
Navicat MySQL Data Transfer

Source Server         : mysql1
Source Server Version : 80020
Source Host           : localhost:3306
Source Database       : medicine

Target Server Type    : MYSQL
Target Server Version : 80020
File Encoding         : 65001

Date: 2021-05-23 21:55:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `account` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', '1');
INSERT INTO `tb_admin` VALUES ('123', '123');
INSERT INTO `tb_admin` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for tb_medicine
-- ----------------------------
DROP TABLE IF EXISTS `tb_medicine`;
CREATE TABLE `tb_medicine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` float DEFAULT NULL,
  `press` varchar(50) DEFAULT NULL,
  `YB` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '药品编号',
  `pic` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_medicine
-- ----------------------------
INSERT INTO `tb_medicine` VALUES ('83', '北京同仁堂人参鹿鞭片丸膏', '198', '正当年医药科技（广州）有限公司', '11', '北京同仁堂人参鹿鞭片丸膏.jpg');
INSERT INTO `tb_medicine` VALUES ('85', '安瓶神退腿褪黑色素片', '89.9', '华润圣海健康科技有限公司', '22', '安瓶神退腿褪黑色素片.jpg');
INSERT INTO `tb_medicine` VALUES ('86', '白云山口洁喷雾剂', '35.5', '广州白云山制药股份有限公司白云山何济公制药厂', '33', '白云山口洁喷雾剂.jpg');
INSERT INTO `tb_medicine` VALUES ('87', '北京同仁堂正品人参五宝茶', '59.9', '安徽东荣堂生物科技有限公司', '44', '北京同仁堂正品人参五宝茶.jpg');
INSERT INTO `tb_medicine` VALUES ('88', '康恩贝维生素c咀嚼片', '49.9', '山东圣海保健品有限公司', '55', '康恩贝维生素c咀嚼片.jpg');
INSERT INTO `tb_medicine` VALUES ('89', '皓研云南本草口腔溃疡喷剂', '46', '陕西秦石药业有限公司', '66', '皓研云南本草口腔溃疡喷剂.jpg');
INSERT INTO `tb_medicine` VALUES ('90', '康恩贝维生素c咀嚼片2', '40', '正当年医药科技（广州）有限公司', '12', '康恩贝维生素c咀嚼片2.jpg');
