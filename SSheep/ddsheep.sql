/*
Navicat MySQL Data Transfer

Source Server         : 123
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ddsheep

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-01-08 22:26:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ` constellation`
-- ----------------------------
DROP TABLE IF EXISTS ` constellation`;
CREATE TABLE ` constellation` (
  `C_id` int(11) NOT NULL,
  `C_name` varchar(255) NOT NULL,
  `C_information` varchar(255) DEFAULT NULL,
  `C_date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`C_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of  constellation
-- ----------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `A_id` int(3) NOT NULL,
  `A_name` varchar(20) NOT NULL,
  `A_password` varchar(50) NOT NULL,
  PRIMARY KEY (`A_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '123', '123');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `U_id` int(11) NOT NULL,
  `U_username` varchar(255) DEFAULT NULL,
  `M_information` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`U_id`),
  KEY `U_nsername` (`U_username`),
  CONSTRAINT `U_id` FOREIGN KEY (`U_id`) REFERENCES `user` (`U_id`),
  CONSTRAINT `U_nsername` FOREIGN KEY (`U_username`) REFERENCES `user` (`U_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `U_id` int(5) NOT NULL AUTO_INCREMENT,
  `U_username` varchar(20) NOT NULL,
  `U_password` varchar(50) NOT NULL,
  `U_date` date DEFAULT NULL,
  `U_sex` varchar(2) DEFAULT NULL,
  `U_email` varchar(20) DEFAULT NULL,
  `U_information` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`U_id`),
  KEY `U_username` (`U_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
