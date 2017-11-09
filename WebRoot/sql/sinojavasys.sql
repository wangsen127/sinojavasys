/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : sinojavasys

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2017-11-09 21:19:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_area`
-- ----------------------------
DROP TABLE IF EXISTS `t_area`;
CREATE TABLE `t_area` (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '地区ID',
  `aname` varchar(30) DEFAULT NULL COMMENT '地区名称',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='地区表';

-- ----------------------------
-- Records of t_area
-- ----------------------------
INSERT INTO `t_area` VALUES ('1', '北京清华');
INSERT INTO `t_area` VALUES ('2', '北京科经管一教');
INSERT INTO `t_area` VALUES ('3', '郑州金水');
INSERT INTO `t_area` VALUES ('4', '深圳一教');
INSERT INTO `t_area` VALUES ('5', '深圳二教');
INSERT INTO `t_area` VALUES ('6', '北京科经管二教');
INSERT INTO `t_area` VALUES ('7', '北京科经管三教');

-- ----------------------------
-- Table structure for `t_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback` (
  `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT '反馈ID',
  `sid` int(11) DEFAULT NULL COMMENT '学生ID',
  `status` int(11) DEFAULT NULL COMMENT '反馈状态\r\n            1问题提出 2解决中 3已解决',
  `content` varchar(300) DEFAULT NULL COMMENT '反馈内容',
  `date` date DEFAULT NULL COMMENT '反馈日期',
  `findate` date DEFAULT NULL COMMENT '完成日期',
  PRIMARY KEY (`bid`),
  KEY `FK_fk_t_feedback_sid` (`sid`),
  CONSTRAINT `FK_fk_t_feedback_sid` FOREIGN KEY (`sid`) REFERENCES `t_student` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='调查反馈表';

-- ----------------------------
-- Records of t_feedback
-- ----------------------------
INSERT INTO `t_feedback` VALUES ('1', '18', '3', '范德萨范德萨分大夫大师范德萨范德萨分范德萨范德萨分大师傅打算和广发东航股份范德萨发大水', '2017-01-05', '2017-01-06');
INSERT INTO `t_feedback` VALUES ('2', '14', '1', null, '2017-01-07', null);
INSERT INTO `t_feedback` VALUES ('3', '14', '1', null, '2017-01-09', null);
INSERT INTO `t_feedback` VALUES ('4', '22', '1', null, '2017-01-15', null);
INSERT INTO `t_feedback` VALUES ('5', '25', '1', null, '2017-01-15', null);

-- ----------------------------
-- Table structure for `t_stuclass`
-- ----------------------------
DROP TABLE IF EXISTS `t_stuclass`;
CREATE TABLE `t_stuclass` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级ID',
  `cname` varchar(20) DEFAULT NULL COMMENT '班级名称',
  `type` int(11) DEFAULT NULL COMMENT '班级类型\r\n            1初级2中级3高级4电商',
  `aid` int(11) DEFAULT NULL COMMENT '操作员',
  `starttime` date DEFAULT NULL COMMENT '开班时间',
  `isend` int(11) DEFAULT NULL COMMENT '是否结课1未结课  0结课',
  `endtime` date DEFAULT NULL COMMENT '结课时间',
  PRIMARY KEY (`cid`),
  KEY `FK_fk_t_class_aid` (`aid`),
  CONSTRAINT `FK_fk_t_class_aid` FOREIGN KEY (`aid`) REFERENCES `t_area` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='班级表';

-- ----------------------------
-- Records of t_stuclass
-- ----------------------------
INSERT INTO `t_stuclass` VALUES ('1', '20161216班', '1', '3', '2016-12-26', '1', null);
INSERT INTO `t_stuclass` VALUES ('2', '20170101班', '1', '1', '2017-01-01', '1', null);
INSERT INTO `t_stuclass` VALUES ('4', '2016fdsfds', '1', '2', '2017-01-03', '0', '2017-01-03');
INSERT INTO `t_stuclass` VALUES ('6', '20170101班', '1', '3', '2017-01-01', '1', null);
INSERT INTO `t_stuclass` VALUES ('7', '20170201班', '2', '2', '2017-02-01', '1', null);
INSERT INTO `t_stuclass` VALUES ('8', '20170107班', '1', '1', '2017-01-07', '1', null);
INSERT INTO `t_stuclass` VALUES ('9', '20070113班', '2', '5', '2007-01-13', '1', null);
INSERT INTO `t_stuclass` VALUES ('10', '20170103班', '1', '4', '2017-01-03', '1', null);
INSERT INTO `t_stuclass` VALUES ('11', '20170115班', '2', '6', '2017-01-15', '1', null);

-- ----------------------------
-- Table structure for `t_student`
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生ID',
  `userid` int(11) DEFAULT NULL COMMENT '用户ID',
  `cid` int(11) DEFAULT NULL COMMENT '班级ID',
  `stuname` varchar(20) DEFAULT NULL COMMENT '学生姓名',
  `cellphone` varchar(30) DEFAULT NULL COMMENT '手机',
  `time` int(3) DEFAULT NULL COMMENT '学生问题次数\r\n            每周清零',
  `status` int(11) DEFAULT NULL COMMENT '学生状态\r\n1正常2重修3休学',
  PRIMARY KEY (`sid`),
  KEY `FK_fk_t_student_cid` (`cid`),
  KEY `FK_fk_t_student_userid` (`userid`),
  CONSTRAINT `FK_fk_t_student_cid` FOREIGN KEY (`cid`) REFERENCES `t_stuclass` (`cid`),
  CONSTRAINT `FK_fk_t_student_userid` FOREIGN KEY (`userid`) REFERENCES `t_user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='学生表';

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('14', '24', '7', '汤姆', '123123', '2', '1');
INSERT INTO `t_student` VALUES ('15', '25', '7', '杰瑞', '123123', '0', '1');
INSERT INTO `t_student` VALUES ('16', '26', '7', '小明', '123123', '0', '1');
INSERT INTO `t_student` VALUES ('17', '27', '7', '小红', '123123', '0', '1');
INSERT INTO `t_student` VALUES ('18', '28', '4', 'aaaa', '123987', '1', '1');
INSERT INTO `t_student` VALUES ('19', '29', '4', 'bbbb', '123987', '0', '1');
INSERT INTO `t_student` VALUES ('20', '30', '1', 'zzzz', '123123', '0', '1');
INSERT INTO `t_student` VALUES ('21', '31', '7', '俄武器', '321', '0', '1');
INSERT INTO `t_student` VALUES ('22', '32', '10', 'cs11', '11', '1', '1');
INSERT INTO `t_student` VALUES ('23', '33', '9', 'cs22', '11', '0', '1');
INSERT INTO `t_student` VALUES ('24', '34', '10', 'cs33', '11', '0', '1');
INSERT INTO `t_student` VALUES ('25', '36', '11', 'cs55', '11', '1', '1');

-- ----------------------------
-- Table structure for `t_student_class_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_student_class_record`;
CREATE TABLE `t_student_class_record` (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `sid` int(11) DEFAULT NULL COMMENT '学生ID',
  `cid` int(11) DEFAULT NULL COMMENT '班级ID',
  `date` date DEFAULT NULL COMMENT '升班日期',
  PRIMARY KEY (`rid`),
  KEY `FK_t_student_class_record_cid` (`cid`),
  KEY `FK_t_student_class_record_sid` (`sid`),
  CONSTRAINT `FK_t_student_class_record_cid` FOREIGN KEY (`cid`) REFERENCES `t_stuclass` (`cid`),
  CONSTRAINT `FK_t_student_class_record_sid` FOREIGN KEY (`sid`) REFERENCES `t_student` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='学生升班记录表';

-- ----------------------------
-- Records of t_student_class_record
-- ----------------------------
INSERT INTO `t_student_class_record` VALUES ('4', '14', '6', '2017-01-04');
INSERT INTO `t_student_class_record` VALUES ('5', '15', '6', '2017-01-04');
INSERT INTO `t_student_class_record` VALUES ('6', '16', '6', '2017-01-04');
INSERT INTO `t_student_class_record` VALUES ('7', '17', '6', '2017-01-04');
INSERT INTO `t_student_class_record` VALUES ('8', '14', '7', '2017-01-04');
INSERT INTO `t_student_class_record` VALUES ('9', '15', '7', '2017-01-04');
INSERT INTO `t_student_class_record` VALUES ('10', '16', '7', '2017-01-04');
INSERT INTO `t_student_class_record` VALUES ('11', '17', '7', '2017-01-04');
INSERT INTO `t_student_class_record` VALUES ('12', '18', '4', '2017-01-05');
INSERT INTO `t_student_class_record` VALUES ('13', '19', '4', '2017-01-05');
INSERT INTO `t_student_class_record` VALUES ('14', '20', '1', '2017-01-06');
INSERT INTO `t_student_class_record` VALUES ('15', '21', '7', '2017-01-07');
INSERT INTO `t_student_class_record` VALUES ('16', '22', '10', '2017-01-13');
INSERT INTO `t_student_class_record` VALUES ('17', '23', '9', '2017-01-13');
INSERT INTO `t_student_class_record` VALUES ('18', '24', '10', '2017-01-13');
INSERT INTO `t_student_class_record` VALUES ('19', '25', '11', '2017-01-15');

-- ----------------------------
-- Table structure for `t_study_inquiry`
-- ----------------------------
DROP TABLE IF EXISTS `t_study_inquiry`;
CREATE TABLE `t_study_inquiry` (
  `inid` int(11) NOT NULL AUTO_INCREMENT COMMENT '调查ID',
  `sid` int(11) DEFAULT NULL COMMENT '学生ID',
  `date` date DEFAULT NULL COMMENT '调查日期',
  `issolve` int(11) DEFAULT NULL COMMENT '解决情况\r\n            上次你提出的问题是否得到相应解决?\r\n            1解决  0未解决',
  `master` int(11) DEFAULT NULL COMMENT '掌握情况\r\n            今天学习的课程是否掌握?\r\n            1完全掌握  2掌握   3部分掌握   4未掌握',
  `easy` int(11) DEFAULT NULL COMMENT '难易程度\r\n            今天学习的课程对你来说难易程度为?\r\n           1容易 2一般  3困难    4非常困难 ',
  `other` varchar(300) DEFAULT NULL COMMENT '其他\r\n            今天学习的内容未掌握部分内容是?\r\n            如果已经掌握，可不填',
  PRIMARY KEY (`inid`),
  KEY `FK_fk_t_study_inquiry_sid` (`sid`),
  CONSTRAINT `FK_fk_t_study_inquiry_sid` FOREIGN KEY (`sid`) REFERENCES `t_student` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='学习进度调查表';

-- ----------------------------
-- Records of t_study_inquiry
-- ----------------------------
INSERT INTO `t_study_inquiry` VALUES ('1', '19', '2017-01-05', '1', '1', '1', '');
INSERT INTO `t_study_inquiry` VALUES ('2', '18', '2017-01-05', '1', '3', '2', '哈哈');
INSERT INTO `t_study_inquiry` VALUES ('3', '14', '2017-01-07', '0', '1', '3', '');
INSERT INTO `t_study_inquiry` VALUES ('4', '14', '2017-01-07', '0', '3', '2', '');
INSERT INTO `t_study_inquiry` VALUES ('5', '14', '2017-01-07', '1', '2', '3', '');
INSERT INTO `t_study_inquiry` VALUES ('6', '14', '2017-01-09', '1', '2', '3', '');
INSERT INTO `t_study_inquiry` VALUES ('7', '15', '2017-01-09', '1', '2', '4', '');
INSERT INTO `t_study_inquiry` VALUES ('8', '14', '2017-01-09', '0', '3', '2', '1111111');
INSERT INTO `t_study_inquiry` VALUES ('9', '18', '2017-01-15', '1', '2', '2', '');
INSERT INTO `t_study_inquiry` VALUES ('10', '22', '2017-01-15', '1', '3', '3', '');
INSERT INTO `t_study_inquiry` VALUES ('11', '25', '2017-01-15', '0', '3', '4', '');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `usercode` varchar(30) DEFAULT NULL COMMENT '用户代码',
  `username` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `role` int(1) DEFAULT NULL COMMENT '1管理员2基地主任3讲师4助教5学生',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `sex` int(1) DEFAULT NULL COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `cellphone` varchar(30) DEFAULT NULL COMMENT '手机',
  `office_phone` varchar(30) DEFAULT NULL COMMENT '办公电话',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `loginIp` varchar(50) DEFAULT NULL COMMENT '最后登录IP',
  `loginDate` date DEFAULT NULL COMMENT '最后登录时间',
  `delflag` int(1) DEFAULT '1' COMMENT '删除标志\r\n            1存在0删除',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'wangsen', '王森123', 'C4CA4238A0B923820DCC509A6F75849B', '1', 'wangsen@qq.com', '1', null, '12345678910', '12345678910', null, null, null, '1');
INSERT INTO `t_user` VALUES ('2', 'qinyinli', '秦印利', 'C4CA4238A0B923820DCC509A6F75849B', '3', 'qyl@163.com', '1', null, '98765432101', '98765432101', null, null, null, '1');
INSERT INTO `t_user` VALUES ('3', 'aaa', 'aaa', 'C4CA4238A0B923820DCC509A6F75849B', '2', 'aaa', '1', null, 'aaa', 'aaa', null, null, null, '1');
INSERT INTO `t_user` VALUES ('4', 'bbb', 'bbb', 'C4CA4238A0B923820DCC509A6F75849B', '4', 'bbb', '1', null, 'bbb', 'bbb', null, null, null, '1');
INSERT INTO `t_user` VALUES ('24', 'tom', '汤姆', 'C4CA4238A0B923820DCC509A6F75849B', '5', '123123', '1', null, '123123', null, null, null, null, '1');
INSERT INTO `t_user` VALUES ('25', 'jerry', '杰瑞', 'C4CA4238A0B923820DCC509A6F75849B', '5', '123123', '0', null, '123123', null, null, null, null, '1');
INSERT INTO `t_user` VALUES ('26', 'xiaoming', '小明', 'C4CA4238A0B923820DCC509A6F75849B', '5', '123123', '1', null, '123123', null, null, null, null, '1');
INSERT INTO `t_user` VALUES ('27', 'xiaohong', '小红', 'C4CA4238A0B923820DCC509A6F75849B', '5', '123123', '0', null, '123123', null, null, null, null, '1');
INSERT INTO `t_user` VALUES ('28', 'aaaa', 'aaaa', 'C4CA4238A0B923820DCC509A6F75849B', '5', '', '1', null, '123987', null, null, null, null, '1');
INSERT INTO `t_user` VALUES ('29', 'bbbb', 'bbbb', 'C4CA4238A0B923820DCC509A6F75849B', '5', '', '0', null, '123987', null, null, null, null, '1');
INSERT INTO `t_user` VALUES ('30', 'zzzz', 'zzzz', 'C4CA4238A0B923820DCC509A6F75849B', '5', '123123', '1', null, '123123', 'bbb', null, null, null, '1');
INSERT INTO `t_user` VALUES ('31', 'aaaa1', '俄武器', 'C4CA4238A0B923820DCC509A6F75849B', '5', '321', '1', null, '321', null, null, null, null, '1');
INSERT INTO `t_user` VALUES ('32', 'cs11', 'cs11', '96E79218965EB72C92A549DD5A330112', '5', '', '1', null, '11', null, null, null, null, '1');
INSERT INTO `t_user` VALUES ('33', 'cs22', 'cs22', '96E79218965EB72C92A549DD5A330112', '5', '', '1', null, '11', null, null, null, null, '1');
INSERT INTO `t_user` VALUES ('34', 'cs33', 'cs33', '96E79218965EB72C92A549DD5A330112', '5', '', '1', null, '11', null, null, null, null, '1');
INSERT INTO `t_user` VALUES ('35', 'cs44', 'cs44', '7FA8282AD93047A4D6FE6111C93B308A', '5', '', '1', null, '11', null, null, null, null, '1');
INSERT INTO `t_user` VALUES ('36', 'cs55', 'cs55', '96E79218965EB72C92A549DD5A330112', '5', '', '1', null, '11', null, null, null, null, '1');

-- ----------------------------
-- Table structure for `t_user_area`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_area`;
CREATE TABLE `t_user_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fk_t_user_area_aid` (`aid`),
  KEY `FK_fk_t_user_area_userid` (`userid`),
  CONSTRAINT `FK_fk_t_user_area_aid` FOREIGN KEY (`aid`) REFERENCES `t_area` (`aid`),
  CONSTRAINT `FK_fk_t_user_area_userid` FOREIGN KEY (`userid`) REFERENCES `t_user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='用户管理地区表';

-- ----------------------------
-- Records of t_user_area
-- ----------------------------
INSERT INTO `t_user_area` VALUES ('20', '4', '5');
INSERT INTO `t_user_area` VALUES ('21', '3', '5');
INSERT INTO `t_user_area` VALUES ('22', '3', '4');
INSERT INTO `t_user_area` VALUES ('23', '2', '5');
INSERT INTO `t_user_area` VALUES ('29', '1', '1');
INSERT INTO `t_user_area` VALUES ('30', '1', '2');
INSERT INTO `t_user_area` VALUES ('31', '1', '3');
INSERT INTO `t_user_area` VALUES ('32', '1', '4');
INSERT INTO `t_user_area` VALUES ('33', '1', '5');
INSERT INTO `t_user_area` VALUES ('34', '1', '6');
INSERT INTO `t_user_area` VALUES ('35', '1', '7');
