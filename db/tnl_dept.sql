/*
Navicat MySQL Data Transfer

Source Server         : cms
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : ssm_crud

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2019-04-20 15:52:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tnl_dept`
-- ----------------------------
DROP TABLE IF EXISTS `tnl_dept`;
CREATE TABLE `tnl_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tnl_dept
-- ----------------------------
INSERT INTO `tnl_dept` VALUES ('1', '开发部');
INSERT INTO `tnl_dept` VALUES ('2', '测试部');
