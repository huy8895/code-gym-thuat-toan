/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_mysql(3306)
Source Server Version : 50545
Source Host           : 127.0.0.1:3306
Source Database       : hr

Target Server Type    : MYSQL
Target Server Version : 50545
File Encoding         : 65001

Date: 2020-04-01 16:56:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for adjustsalary
-- ----------------------------
DROP TABLE IF EXISTS `adjustsalary`;
CREATE TABLE `adjustsalary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `asDate` date DEFAULT NULL COMMENT 'Pay date',
  `beforeSalary` int(11) DEFAULT NULL COMMENT 'Pre-adjusted salary',
  `afterSalary` int(11) DEFAULT NULL COMMENT 'Adjusted salary',
  `reason` varchar(255) DEFAULT NULL COMMENT 'Reasons for salary adjustment',
  `remark` varchar(255) DEFAULT NULL COMMENT 'Remarks',
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `adjustsalary_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `t_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adjustsalary
-- ----------------------------

-- ----------------------------
-- Table structure for appraise
-- ----------------------------
DROP TABLE IF EXISTS `appraise`;
CREATE TABLE `appraise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `appDate` date DEFAULT NULL COMMENT 'Assessment date',
  `appResult` varchar(32) DEFAULT NULL COMMENT 'Evaluation results',
  `appContent` varchar(255) DEFAULT NULL COMMENT 'Evaluation content',
  `remark` varchar(255) DEFAULT NULL COMMENT 'Remarks',
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `appraise_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `t_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of appraise
-- ----------------------------

-- ----------------------------
-- Table structure for employeeec
-- ----------------------------
DROP TABLE IF EXISTS `employeeec`;
CREATE TABLE `employeeec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL COMMENT 'employee ID',
  `ecDate` date DEFAULT NULL COMMENT 'Reward date',
  `ecReason` varchar(255) DEFAULT NULL COMMENT 'Reasons for rewards and penalties',
  `ecPoint` int(11) DEFAULT NULL COMMENT 'Reward and penalty points',
  `ecType` int(11) DEFAULT NULL COMMENT 'Reward category，0：prize，1：Penalty',
  `remark` varchar(255) DEFAULT NULL COMMENT 'Remarks',
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `employeeec_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `t_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employeeec
-- ----------------------------

-- ----------------------------
-- Table structure for employeeremove
-- ----------------------------
DROP TABLE IF EXISTS `employeeremove`;
CREATE TABLE `employeeremove` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `afterDepId` int(11) DEFAULT NULL COMMENT 'Post-mobilization department',
  `afterJobId` int(11) DEFAULT NULL COMMENT 'Post-mobilization position',
  `removeDate` date DEFAULT NULL COMMENT 'Date of transfer',
  `reason` varchar(255) DEFAULT NULL COMMENT 'Reason for transfer',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `employeeremove_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `t_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employeeremove
-- ----------------------------

-- ----------------------------
-- Table structure for employeetrain
-- ----------------------------
DROP TABLE IF EXISTS `employeetrain`;
CREATE TABLE `employeetrain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL COMMENT 'employee ID',
  `trainDate` date DEFAULT NULL COMMENT 'Training date',
  `trainContent` varchar(255) DEFAULT NULL COMMENT 'training content',
  `remark` varchar(255) DEFAULT NULL COMMENT 'Remarks',
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `employeetrain_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `t_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employeetrain
-- ----------------------------

-- ----------------------------
-- Table structure for msgcontent
-- ----------------------------
DROP TABLE IF EXISTS `msgcontent`;
CREATE TABLE `msgcontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msgcontent
-- ----------------------------
INSERT INTO `msgcontent` VALUES ('14', '2222222222', '11111111111111111', '2018-02-02 20:46:19');
INSERT INTO `msgcontent` VALUES ('15', '22222222', '3333333333333333333333', '2018-02-02 21:45:57');
INSERT INTO `msgcontent` VALUES ('16', 'Notification title1', 'Notification content1', '2018-02-03 11:41:39');
INSERT INTO `msgcontent` VALUES ('17', 'Notification title2', 'Notification content2', '2018-02-03 11:52:37');
INSERT INTO `msgcontent` VALUES ('18', 'Notification title3', 'Notification content3', '2018-02-03 12:19:41');

-- ----------------------------
-- Table structure for oplog
-- ----------------------------
DROP TABLE IF EXISTS `oplog`;
CREATE TABLE `oplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` date DEFAULT NULL COMMENT 'Add date',
  `operate` varchar(255) DEFAULT NULL COMMENT 'Operation content',
  `hrid` int(11) DEFAULT NULL COMMENT 'operatorID',
  PRIMARY KEY (`id`),
  KEY `hrid` (`hrid`),
  CONSTRAINT `oplog_ibfk_1` FOREIGN KEY (`hrid`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oplog
-- ----------------------------

-- ----------------------------
-- Table structure for sysmsg
-- ----------------------------
DROP TABLE IF EXISTS `sysmsg`;
CREATE TABLE `sysmsg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL COMMENT 'Newsid',
  `type` int(11) DEFAULT '0' COMMENT '0Means group message',
  `hrid` int(11) DEFAULT NULL COMMENT 'Who is this message for',
  `state` int(11) DEFAULT '0' COMMENT '0 unread 1 Have read',
  PRIMARY KEY (`id`),
  KEY `hrid` (`hrid`),
  KEY `sysmsg_ibfk_1` (`mid`),
  CONSTRAINT `sysmsg_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `msgcontent` (`id`),
  CONSTRAINT `sysmsg_ibfk_2` FOREIGN KEY (`hrid`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysmsg
-- ----------------------------
INSERT INTO `sysmsg` VALUES ('57', '14', '0', '3', '1');
INSERT INTO `sysmsg` VALUES ('58', '14', '0', '5', '1');
INSERT INTO `sysmsg` VALUES ('59', '14', '0', '10', '1');
INSERT INTO `sysmsg` VALUES ('60', '14', '0', '11', '0');
INSERT INTO `sysmsg` VALUES ('61', '14', '0', '12', '0');
INSERT INTO `sysmsg` VALUES ('62', '15', '0', '3', '1');
INSERT INTO `sysmsg` VALUES ('63', '15', '0', '5', '1');
INSERT INTO `sysmsg` VALUES ('64', '15', '0', '10', '1');
INSERT INTO `sysmsg` VALUES ('65', '15', '0', '11', '0');
INSERT INTO `sysmsg` VALUES ('66', '15', '0', '12', '0');
INSERT INTO `sysmsg` VALUES ('67', '16', '0', '3', '1');
INSERT INTO `sysmsg` VALUES ('68', '16', '0', '5', '1');
INSERT INTO `sysmsg` VALUES ('69', '16', '0', '10', '1');
INSERT INTO `sysmsg` VALUES ('70', '16', '0', '11', '0');
INSERT INTO `sysmsg` VALUES ('71', '16', '0', '12', '0');
INSERT INTO `sysmsg` VALUES ('72', '17', '0', '3', '1');
INSERT INTO `sysmsg` VALUES ('73', '17', '0', '5', '1');
INSERT INTO `sysmsg` VALUES ('74', '17', '0', '10', '1');
INSERT INTO `sysmsg` VALUES ('75', '17', '0', '11', '0');
INSERT INTO `sysmsg` VALUES ('76', '17', '0', '12', '0');
INSERT INTO `sysmsg` VALUES ('77', '18', '0', '3', '1');
INSERT INTO `sysmsg` VALUES ('78', '18', '0', '5', '0');
INSERT INTO `sysmsg` VALUES ('79', '18', '0', '10', '0');
INSERT INTO `sysmsg` VALUES ('80', '18', '0', '11', '0');
INSERT INTO `sysmsg` VALUES ('81', '18', '0', '12', '0');

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary keyid',
  `name` varchar(64) DEFAULT NULL COMMENT 'Department name',
  `parentId` int(11) DEFAULT NULL,
  `depPath` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `isParent` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COMMENT='department';

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES ('1', 'Shareholders meeting', '-1', '.1', '1', '1');
INSERT INTO `t_department` VALUES ('4', 'Board of Directors', '1', '.1.4', '1', '1');
INSERT INTO `t_department` VALUES ('5', 'General Office', '4', '.1.4.5', '1', '1');
INSERT INTO `t_department` VALUES ('8', 'Finance Department', '5', '.1.4.5.8', '1', '0');
INSERT INTO `t_department` VALUES ('78', 'Marketing Department', '5', '.1.4.5.78', '1', '1');
INSERT INTO `t_department` VALUES ('81', 'North China Market', '78', '.1.4.5.78.81', '1', '1');
INSERT INTO `t_department` VALUES ('82', 'South China Market', '78', '.1.4.5.78.82', '1', '0');
INSERT INTO `t_department` VALUES ('85', 'Shijiazhuang Marketing Department', '81', '.1.4.5.78.81.85', '1', '0');
INSERT INTO `t_department` VALUES ('86', 'Northwest Market', '78', '.1.4.5.78.86', '1', '1');
INSERT INTO `t_department` VALUES ('87', 'Xian Market', '86', '.1.4.5.78.86.87', '1', '1');
INSERT INTO `t_department` VALUES ('89', 'Lianhu District Market', '87', '.1.4.5.78.86.87.89', '1', '0');
INSERT INTO `t_department` VALUES ('91', 'Technology Department', '5', '.1.4.5.91', '1', '0');
INSERT INTO `t_department` VALUES ('92', 'Operations Department', '5', '.1.4.5.92', '1', '1');
INSERT INTO `t_department` VALUES ('93', 'O &amp; M1unit', '92', '.1.4.5.92.93', '1', '0');
INSERT INTO `t_department` VALUES ('94', 'O &amp; M2unit', '92', '.1.4.5.92.94', '1', '0');
INSERT INTO `t_department` VALUES ('115', 'Testing department1', '1', '.1.115', '1', '1');
INSERT INTO `t_department` VALUES ('124', 'aa', '115', '.1.115.124', '1', '1');
INSERT INTO `t_department` VALUES ('125', 'bb', '115', '.1.115.125', '1', '0');
INSERT INTO `t_department` VALUES ('126', 'a1', '124', '.1.115.124.126', '1', '0');

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary keyid',
  `name` varchar(64) DEFAULT NULL COMMENT 'Name',
  `gender` char(6) DEFAULT NULL COMMENT 'gender',
  `birthday` date DEFAULT NULL COMMENT 'date of birth',
  `idCard` char(18) DEFAULT NULL COMMENT 'identification number',
  `wedlock` enum('married','unmarried','Divorce') DEFAULT NULL COMMENT 'marital status',
  `nationId` int(8) DEFAULT NULL COMMENT 'Nation',
  `nativePlace` varchar(20) DEFAULT NULL COMMENT 'Hometown',
  `politicsStatusId` int(8) DEFAULT NULL COMMENT 'political status',
  `email` varchar(20) DEFAULT NULL COMMENT 'E-mail',
  `phone` varchar(11) DEFAULT NULL COMMENT 'telephone number',
  `address` varchar(100) DEFAULT NULL COMMENT 'contact address',
  `departmentId` int(11) DEFAULT NULL COMMENT 'Department',
  `jobTitleId` int(11) DEFAULT NULL COMMENT 'job title',
  `positionId` int(11) DEFAULT NULL COMMENT 'position',
  `salaryId` int(11) DEFAULT NULL COMMENT 'Payroll',
  `engageForm` varchar(20) DEFAULT NULL COMMENT 'Employment form',
  `tiptopDegree` enum('PhD','masters degree','Undergraduate','College','High school','junior high school','primary school','other') DEFAULT NULL COMMENT 'highest education',
  `specialty` varchar(50) DEFAULT NULL COMMENT 'profession',
  `school` varchar(50) DEFAULT NULL COMMENT 'graduated school',
  `beginDate` date DEFAULT NULL COMMENT 'Entry date',
  `workState` enum('In service','Resignation') DEFAULT 'In service' COMMENT 'Working status',
  `workId` char(8) DEFAULT NULL COMMENT 'Job number',
  `contractTerm` double DEFAULT NULL COMMENT 'Contract period',
  `conversionTime` date DEFAULT NULL COMMENT 'Correct date',
  `notWorkDate` date DEFAULT NULL COMMENT 'Resignation date',
  `beginContract` date DEFAULT NULL COMMENT 'Contract start date',
  `endContract` date DEFAULT NULL COMMENT 'Contract termination date',
  `workAge` int(11) DEFAULT NULL COMMENT 'Seniority',
  PRIMARY KEY (`id`),
  KEY `idx_departmentId` (`departmentId`) USING BTREE,
  KEY `idx_nationId` (`nationId`) USING BTREE,
  KEY `idx_jobTitleId` (`jobTitleId`) USING BTREE,
  KEY `idx_positonId` (`positionId`) USING BTREE,
  KEY `idx_politicsStatusId` (`politicsStatusId`) USING BTREE,
  KEY `idx_workId` (`workId`),
  KEY `idx_salaryId` (`salaryId`) USING BTREE,
  CONSTRAINT `fk_emp_departmentId` FOREIGN KEY (`departmentId`) REFERENCES `t_department` (`id`),
  CONSTRAINT `fk_emp_jobTitleId` FOREIGN KEY (`jobTitleId`) REFERENCES `t_jobtitle` (`id`),
  CONSTRAINT `fk_emp_nationId` FOREIGN KEY (`nationId`) REFERENCES `t_nation` (`id`),
  CONSTRAINT `fk_emp_politicsStatusId` FOREIGN KEY (`politicsStatusId`) REFERENCES `t_politicsstatus` (`id`),
  CONSTRAINT `fk_emp_positonId` FOREIGN KEY (`positionId`) REFERENCES `t_position` (`id`),
  CONSTRAINT `fk_emp_salaryId` FOREIGN KEY (`salaryId`) REFERENCES `t_salary` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1958 DEFAULT CHARSET=utf8 COMMENT='Employee';

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES ('1', 'programmer35', 'male', '1990-01-01', '610122199001011256', 'married', '1', 'Shaanxi', '13', 'laowang@qq.com', '18565558897', 'Nanshan District, Shenzhen', '5', '9', '29', '19', 'Labor contract', 'Undergraduate', 'Information management and information system', 'Shenzhen University', '2018-01-01', 'In service', '00000001', '2', '2018-04-01', null, '2018-01-01', '2020-01-01', null);
INSERT INTO `t_employee` VALUES ('2', 'Chen Jing', 'Female', '1989-02-01', '421288198902011234', 'married', '1', 'Hainan', '1', 'chenjing@qq.com', '18795556693', 'Meilan District, Haikou City, Hainan Province', '91', '12', '29', '13', 'Labor Contract', 'High school', 'marketing', 'Wuhan University', '2015-06-09', 'In service', '00000002', '3', '2015-09-10', null, '2015-06-09', '2018-06-08', null);
INSERT INTO `t_employee` VALUES ('3', 'Zhao Linhao', 'male', '1993-03-04', '610122199303041456', 'unmarried', '1', 'Shaanxi', '3', 'zhao@qq.com', '15698887795', 'Lianhu District, Xian, Shaanxi Province', '91', '12', '33', '10', 'Labor Contract', 'PhD', 'Electronic engineering', 'Harbin University of Science and Technology', '2018-01-01', 'In service', '00000003', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `t_employee` VALUES ('4', 'Lu Cunliang', 'male', '1990-01-03', '610122199001031456', 'married', '1', 'Shaanxi', '3', 'zhao@qq.com', '15612347795', 'Lianhu District, Xian, Shaanxi Province', '92', '12', '34', '9', 'Labor Contract', 'High school', 'Electronic engineering', 'Harbin University of Science and Technology', '2018-01-01', 'In service', '00000004', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `t_employee` VALUES ('5', 'Yao Sen', 'male', '1991-02-05', '610122199102058952', 'married', '1', 'Henan', '3', 'yaosen@qq.com', '14785559936', 'Renmin Avenue, Luoyang, Henan58number', '92', '15', '34', '19', 'Labor Contract', 'masters degree', 'Interior decoration design', 'Northwest University', '2017-01-02', 'In service', '00000005', '7', '2017-04-02', null, '2017-01-02', '2024-01-17', null);
INSERT INTO `t_employee` VALUES ('6', 'Yunxing', 'Female', '1993-01-05', '610122199301054789', 'married', '1', 'Xian, Shaanxi', '1', 'yunxing@qq.com', '15644442252', 'Xian New District, Shaanxi', '92', '16', '34', null, 'Labor contract', 'masters degree', 'Communication Engineering', 'Xian Electronic Technology School', '2018-01-01', 'In service', '00000006', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `t_employee` VALUES ('7', 'Jia Xuming', 'male', '1993-11-11', '610122199311111234', 'married', '1', 'Guangzhou, Guangdong', '4', 'jiaxuming@qq.com', '15644441234', 'Xiancun Road, Tianhe District, Guangzhou City, Guangdong Province', '78', '15', '33', null, 'Labor contract', 'junior high school', 'Communication Engineering', 'Northwest University', '2018-01-01', 'In service', '00000007', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `t_employee` VALUES ('8', 'Zhang Liming', 'male', '1991-02-01', '610144199102014569', 'married', '1', 'Guangdong', '6', 'zhangliming@qq.com', '18979994478', 'Zhuhai, Guangdong', '91', '15', '33', null, 'Labor Contract', 'High school', 'archeology', 'Tsinghua University', '2018-01-01', 'In service', '00000008', '7', '2018-04-01', null, '2018-01-01', '2025-01-30', null);
INSERT INTO `t_employee` VALUES ('9', 'Xue Lei', 'male', '1992-07-01', '610144199207017895', 'married', '1', 'Xian, Shaanxi', '13', 'xuelei@qq.com', '15648887741', 'Yanta District, Xian', '92', '14', '34', null, 'Labor Contract', 'junior high school', 'no', 'Huaxu Middle School', '2018-01-01', 'In service', '00000009', '6', '2018-04-01', null, '2018-01-01', '2024-01-17', null);
INSERT INTO `t_employee` VALUES ('10', 'Zhang Jie', 'Female', '1990-10-09', '420177199010093652', 'unmarried', '1', 'Hainan', '5', 'zhangjie@qq.com', '13695557742', 'Meilan District, Haikou City', '92', '16', '34', null, 'Labor Contract', 'High school', 'no', 'Hainan Overseas Chinese', '2018-01-01', 'In service', '00000010', '1', '2018-01-31', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `t_employee` VALUES ('11', 'programmer35-2', 'male', '1990-01-01', '610122199001011256', 'married', '1', 'Shaanxi', '13', 'laowang@qq.com', '18565558897', 'Nanshan District, Shenzhen', '91', '9', '29', null, 'Labor Contract', 'Undergraduate', 'Information management and information system', 'Shenzhen University', '2018-01-01', 'In service', '00000011', '1', '2018-04-01', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `t_employee` VALUES ('12', 'Chen Jing2', 'Female', '1989-02-01', '421288198902011234', 'married', '1', 'Hainan', '1', 'chenjing@qq.com', '18795556693', 'Meilan District, Haikou City, Hainan Province', '82', '12', '30', null, 'Labor Contract', 'High school', 'marketing', 'Wuhan University', '2015-06-09', 'In service', '00000012', '3', '2015-09-10', null, '2015-06-09', '2018-06-08', null);
INSERT INTO `t_employee` VALUES ('13', 'Zhao Linhao2', 'male', '1993-03-04', '610122199303041456', 'unmarried', '1', 'Shaanxi', '3', 'zhao@qq.com', '15698887795', 'Lianhu District, Xian, Shaanxi Province', '91', '12', '33', null, 'Labor Contract', 'PhD', 'Electronic engineering', 'Harbin University of Science and Technology', '2018-01-01', 'In service', '00000013', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `t_employee` VALUES ('14', 'Lu Cunliang2', 'male', '1990-01-03', '610122199001031456', 'married', '1', 'Shaanxi', '3', 'zhao@qq.com', '15612347795', 'Lianhu District, Xian, Shaanxi Province', '92', '12', '34', null, 'Labor Contract', 'High school', 'Electronic engineering', 'Harbin University of Science and Technology', '2018-01-01', 'In service', '00000014', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `t_employee` VALUES ('15', 'Yao Sen2', 'male', '1991-02-05', '610122199102058952', 'married', '1', 'Henan', '3', 'yaosen@qq.com', '14785559936', 'Renmin Avenue, Luoyang, Henan58number', '92', '15', '34', null, 'Labor Contract', 'junior high school', 'Interior decoration design', 'Northwest University', '2017-01-02', 'In service', '00000015', '7', '2017-04-02', null, '2017-01-02', '2024-01-17', null);
INSERT INTO `t_employee` VALUES ('16', 'Yunxing2', 'Female', '1993-01-05', '610122199301054789', 'married', '1', 'Xian, Shaanxi', '1', 'yunxing@qq.com', '15644442252', 'Xian New District, Shaanxi', '92', '16', '34', null, 'Labor contract', 'masters degree', 'Communication Engineering', 'Xian Electronic Technology School', '2018-01-01', 'In service', '00000016', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `t_employee` VALUES ('17', 'Jia Xuming2', 'male', '1993-11-11', '610122199311111234', 'married', '1', 'Guangzhou, Guangdong', '4', 'jiaxuming@qq.com', '15644441234', 'Xiancun Road, Tianhe District, Guangzhou City, Guangdong Province', '78', '15', '33', null, 'Labor contract', 'junior high school', 'Communication Engineering', 'Northwest University', '2018-01-01', 'In service', '00000017', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `t_employee` VALUES ('18', 'Wang Yiting', 'male', '1991-02-01', '610144199102014569', 'married', '1', 'Guangdong', '6', 'zhangliming@qq.com', '18979994478', 'Zhuhai, Guangdong', '91', '15', '33', null, 'Labor Contract', 'High school', 'archeology', 'Tsinghua University', '2018-01-01', 'In service', '00000018', '7', '2018-04-01', null, '2018-01-01', '2025-01-30', null);
INSERT INTO `t_employee` VALUES ('19', 'Xue Lei2', 'male', '1992-07-01', '610144199207017895', 'married', '1', 'Xian, Shaanxi', '13', 'xuelei@qq.com', '15648887741', 'Yanta District, Xian', '92', '14', '34', null, 'Labor Contract', 'junior high school', 'no', 'Huaxu Middle School', '2018-01-01', 'In service', '00000019', '1', '2018-04-01', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `t_employee` VALUES ('20', 'Zhang Jie2', 'Female', '1990-10-09', '420177199010093652', 'unmarried', '1', 'Hainan', '5', 'zhangjie@qq.com', '13695557742', 'Meilan District, Haikou City', '92', '16', '34', null, 'Labor Contract', 'High school', 'no', 'Hainan Overseas Chinese', '2018-01-01', 'In service', '00000020', '1', '2018-01-31', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `t_employee` VALUES ('21', 'programmer35-3', 'male', '1990-01-01', '610122199001011256', 'married', '1', 'Shaanxi', '13', 'laowang@qq.com', '18565558897', 'Nanshan District, Shenzhen', '8', '9', '29', null, 'Labor Contract', 'Undergraduate', 'Information management and information system', 'Shenzhen University', '2018-01-01', 'In service', '00000021', '1', '2018-04-01', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `t_employee` VALUES ('22', 'Chen Jing3', 'Female', '1989-02-01', '421288198902011234', 'married', '1', 'Hainan', '1', 'chenjing@qq.com', '18795556693', 'Meilan District, Haikou City, Hainan Province', '82', '12', '30', null, 'Labor Contract', 'High school', 'marketing', 'Wuhan University', '2015-06-09', 'In service', '00000022', '3', '2015-09-10', null, '2015-06-09', '2018-06-08', null);
INSERT INTO `t_employee` VALUES ('24', 'Lu Cunliang3', 'male', '1990-01-03', '610122199001031456', 'married', '1', 'Shaanxi', '3', 'zhao@qq.com', '15612347795', 'Lianhu District, Xian, Shaanxi Province', '92', '12', '34', null, 'Labor Contract', 'High school', 'Electronic engineering', 'Harbin University of Science and Technology', '2018-01-01', 'In service', '00000024', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `t_employee` VALUES ('25', 'Yao Sen3', 'male', '1991-02-05', '610122199102058952', 'married', '1', 'Henan', '3', 'yaosen@qq.com', '14785559936', 'Renmin Avenue, Luoyang, Henan58number', '92', '15', '34', null, 'Labor Contract', 'junior high school', 'Interior decoration design', 'Northwest University', '2017-01-02', 'In service', '00000025', '7', '2017-04-02', null, '2017-01-02', '2024-01-17', null);
INSERT INTO `t_employee` VALUES ('26', 'Yunxing3', 'Female', '1993-01-05', '610122199301054789', 'married', '1', 'Xian, Shaanxi', '1', 'yunxing@qq.com', '15644442252', 'Xian New District, Shaanxi', '92', '16', '34', null, 'Labor contract', 'masters degree', 'Communication Engineering', 'Xian Electronic Technology School', '2018-01-01', 'In service', '00000026', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `t_employee` VALUES ('27', 'Jia Xuming3', 'male', '1993-11-11', '610122199311111234', 'married', '1', 'Guangzhou, Guangdong', '4', 'jiaxuming@qq.com', '15644441234', 'Xiancun Road, Tianhe District, Guangzhou City, Guangdong Province', '78', '15', '33', null, 'Labor contract', 'junior high school', 'Communication Engineering', 'Northwest University', '2018-01-01', 'In service', '00000027', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `t_employee` VALUES ('28', 'Zhang Liming3', 'male', '1991-02-01', '610144199102014569', 'married', '1', 'Guangdong', '6', 'zhangliming@qq.com', '18979994478', 'Zhuhai, Guangdong', '91', '15', '33', null, 'Labor Contract', 'High school', 'archeology', 'Tsinghua University', '2018-01-01', 'In service', '00000028', '7', '2018-04-01', null, '2018-01-01', '2025-01-30', null);
INSERT INTO `t_employee` VALUES ('29', 'Xue Lei3', 'male', '1992-07-01', '610144199207017895', 'married', '1', 'Xian, Shaanxi', '13', 'xuelei@qq.com', '15648887741', 'Yanta District, Xian', '92', '14', '34', null, 'Labor Contract', 'junior high school', 'no', 'Huaxu Middle School', '2018-01-01', 'In service', '00000029', '6', '2018-04-01', null, '2018-01-01', '2024-01-17', null);
INSERT INTO `t_employee` VALUES ('31', 'programmer35-4', 'male', '1990-01-01', '610122199001011256', 'married', '1', 'Shaanxi', '13', 'laowang@qq.com', '18565558897', 'Nanshan District, Shenzhen', '8', '9', '29', null, 'Labor Contract', 'Undergraduate', 'Information management and information system', 'Shenzhen University', '2018-01-01', 'In service', '00000031', '1', '2018-04-01', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `t_employee` VALUES ('32', 'Chen Jing4', 'Female', '1989-02-01', '421288198902011234', 'married', '1', 'Hainan', '1', 'chenjing@qq.com', '18795556693', 'Meilan District, Haikou City, Hainan Province', '82', '12', '30', null, 'Labor Contract', 'High school', 'marketing', 'Wuhan University', '2015-06-09', 'In service', '00000032', '3', '2015-09-10', null, '2015-06-09', '2018-06-08', null);
INSERT INTO `t_employee` VALUES ('33', 'Zhao Linhao4', 'male', '1993-03-04', '610122199303041456', 'unmarried', '1', 'Shaanxi', '3', 'zhao@qq.com', '15698887795', 'Lianhu District, Xian, Shaanxi Province', '91', '12', '33', null, 'Labor Contract', 'PhD', 'Electronic engineering', 'Harbin University of Science and Technology', '2018-01-01', 'In service', '00000033', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `t_employee` VALUES ('34', 'Lu Cunliang4', 'male', '1990-01-03', '610122199001031456', 'married', '1', 'Shaanxi', '3', 'zhao@qq.com', '15612347795', 'Lianhu District, Xian, Shaanxi Province', '92', '12', '34', null, 'Labor Contract', 'High school', 'Electronic engineering', 'Harbin University of Science and Technology', '2018-01-01', 'In service', '00000034', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `t_employee` VALUES ('35', 'Yao Sen4', 'male', '1991-02-05', '610122199102058952', 'married', '1', 'Henan', '3', 'yaosen@qq.com', '14785559936', 'Renmin Avenue, Luoyang, Henan58number', '92', '15', '34', null, 'Labor Contract', 'junior high school', 'Interior decoration design', 'Northwest University', '2017-01-02', 'In service', '00000035', '7', '2017-04-02', null, '2017-01-02', '2024-01-17', null);
INSERT INTO `t_employee` VALUES ('36', 'Yunxing4', 'Female', '1993-01-05', '610122199301054789', 'married', '1', 'Xian, Shaanxi', '1', 'yunxing@qq.com', '15644442252', 'Xian New District, Shaanxi', '92', '16', '34', null, 'Labor contract', 'masters degree', 'Communication Engineering', 'Xian Electronic Technology School', '2018-01-01', 'In service', '00000036', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `t_employee` VALUES ('37', 'Jia Xuming4', 'male', '1993-11-11', '610122199311111234', 'married', '1', 'Guangzhou, Guangdong', '4', 'jiaxuming@qq.com', '15644441234', 'Xiancun Road, Tianhe District, Guangzhou City, Guangdong Province', '78', '15', '33', null, 'Labor contract', 'junior high school', 'Communication Engineering', 'Northwest University', '2018-01-01', 'In service', '00000037', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `t_employee` VALUES ('38', 'Zhang Liming2', 'male', '1991-02-01', '610144199102014569', 'married', '1', 'Guangdong', '6', 'zhangliming@qq.com', '18979994478', 'Zhuhai, Guangdong', '91', '15', '33', null, 'Labor Contract', 'High school', 'archeology', 'Tsinghua University', '2018-01-01', 'In service', '00000038', '7', '2018-04-01', null, '2018-01-01', '2025-01-30', null);
INSERT INTO `t_employee` VALUES ('39', 'Xue Lei4', 'male', '1992-07-01', '610144199207017895', 'married', '1', 'Xian, Shaanxi', '13', 'xuelei@qq.com', '15648887741', 'Yanta District, Xian', '92', '14', '34', null, 'Labor Contract', 'junior high school', 'no', 'Huaxu Middle School', '2018-01-01', 'In service', '00000039', '6', '2018-04-01', null, '2018-01-01', '2024-01-17', null);
INSERT INTO `t_employee` VALUES ('40', 'Zhang Jie4', 'Female', '1990-10-09', '420177199010093652', 'unmarried', '1', 'Hainan', '5', 'zhangjie@qq.com', '13695557742', 'Meilan District, Haikou City', '92', '16', '34', null, 'Labor Contract', 'High school', 'no', 'Hainan Overseas Chinese', '2018-01-01', 'In service', '00000040', '1', '2018-01-31', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `t_employee` VALUES ('41', 'programmer35-5', 'male', '1990-01-01', '610122199001011256', 'married', '1', 'Shaanxi', '13', 'laowang@qq.com', '18565558897', 'Nanshan District, Shenzhen', '8', '9', '29', null, 'Labor Contract', 'Undergraduate', 'Information management and information system', 'Shenzhen University', '2018-01-01', 'In service', '00000041', '1', '2018-04-01', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `t_employee` VALUES ('42', 'Chen Jing5', 'Female', '1989-02-01', '421288198902011234', 'married', '1', 'Hainan', '1', 'chenjing@qq.com', '18795556693', 'Meilan District, Haikou City, Hainan Province', '82', '12', '30', null, 'Labor Contract', 'High school', 'marketing', 'Wuhan University', '2015-06-09', 'In service', '00000042', '3', '2015-09-10', null, '2015-06-09', '2018-06-08', null);
INSERT INTO `t_employee` VALUES ('43', 'Zhao Linhao5', 'male', '1993-03-04', '610122199303041456', 'unmarried', '1', 'Shaanxi', '3', 'zhao@qq.com', '15698887795', 'Lianhu District, Xian, Shaanxi Province', '91', '12', '33', null, 'Labor Contract', 'PhD', 'Electronic engineering', 'Harbin University of Science and Technology', '2018-01-01', 'In service', '00000043', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `t_employee` VALUES ('44', 'Lu Cunliang5', 'male', '1990-01-03', '610122199001031456', 'married', '1', 'Shaanxi', '3', 'zhao@qq.com', '15612347795', 'Lianhu District, Xian, Shaanxi Province', '92', '12', '34', null, 'Labor Contract', 'High school', 'Electronic engineering', 'Harbin University of Science and Technology', '2018-01-01', 'In service', '00000044', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `t_employee` VALUES ('45', 'Yao Sen5', 'male', '1991-02-05', '610122199102058952', 'married', '1', 'Henan', '3', 'yaosen@qq.com', '14785559936', 'Renmin Avenue, Luoyang, Henan58number', '92', '15', '34', null, 'Labor Contract', 'junior high school', 'Interior decoration design', 'Northwest University', '2017-01-02', 'In service', '00000045', '7', '2017-04-02', null, '2017-01-02', '2024-01-17', null);
INSERT INTO `t_employee` VALUES ('46', 'Yunxing5', 'Female', '1993-01-05', '610122199301054789', 'married', '1', 'Xian, Shaanxi', '1', 'yunxing@qq.com', '15644442252', 'Xian New District, Shaanxi', '92', '16', '34', null, 'Labor contract', 'masters degree', 'Communication Engineering', 'Xian Electronic Technology School', '2018-01-01', 'In service', '00000046', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `t_employee` VALUES ('47', 'Jia Xuming5', 'male', '1993-11-11', '610122199311111234', 'married', '1', 'Guangzhou, Guangdong', '4', 'jiaxuming@qq.com', '15644441234', 'Xiancun Road, Tianhe District, Guangzhou City, Guangdong Province', '78', '15', '33', null, 'Labor contract', 'junior high school', 'Communication Engineering', 'Northwest University', '2018-01-01', 'In service', '00000047', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `t_employee` VALUES ('48', 'Zhang Liming5', 'male', '1991-02-01', '610144199102014569', 'married', '1', 'Guangdong', '6', 'zhangliming@qq.com', '18979994478', 'Zhuhai, Guangdong', '91', '15', '33', null, 'Labor Contract', 'High school', 'archeology', 'Tsinghua University', '2018-01-01', 'In service', '00000048', '7', '2018-04-01', null, '2018-01-01', '2025-01-30', null);
INSERT INTO `t_employee` VALUES ('49', 'Xue Lei5', 'male', '1992-07-01', '610144199207017895', 'married', '1', 'Xian, Shaanxi', '13', 'xuelei@qq.com', '15648887741', 'Yanta District, Xian', '92', '14', '34', null, 'Labor Contract', 'junior high school', 'no', 'Huaxu Middle School', '2018-01-01', 'In service', '00000049', '6', '2018-04-01', null, '2018-01-01', '2024-01-17', null);
INSERT INTO `t_employee` VALUES ('50', 'Zhang Jie5', 'Female', '1990-10-09', '420177199010093652', 'unmarried', '1', 'Hainan', '5', 'zhangjie@qq.com', '13695557742', 'Meilan District, Haikou City', '92', '16', '34', null, 'Labor Contract', 'High school', 'no', 'Hainan Overseas Chinese', '2018-01-01', 'In service', '00000050', '1', '2018-01-31', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `t_employee` VALUES ('51', 'programmer35-6', 'male', '1990-01-01', '610122199001011256', 'married', '1', 'Shaanxi', '13', 'laowang@qq.com', '18565558897', 'Nanshan District, Shenzhen', '8', '9', '29', null, 'Labor Contract', 'Undergraduate', 'Information management and information system', 'Shenzhen University', '2018-01-01', 'In service', '00000051', '1', '2018-04-01', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `t_employee` VALUES ('52', 'Chen Jing6', 'Female', '1989-02-01', '421288198902011234', 'married', '1', 'Hainan', '1', 'chenjing@qq.com', '18795556693', 'Meilan District, Haikou City, Hainan Province', '82', '12', '30', null, 'Labor Contract', 'High school', 'marketing', 'Wuhan University', '2015-06-09', 'In service', '00000052', '3', '2015-09-10', null, '2015-06-09', '2018-06-08', null);
INSERT INTO `t_employee` VALUES ('53', 'Zhao Linhao6', 'male', '1993-03-04', '610122199303041456', 'unmarried', '1', 'Shaanxi', '3', 'zhao@qq.com', '15698887795', 'Lianhu District, Xian, Shaanxi Province', '91', '12', '33', null, 'Labor Contract', 'PhD', 'Electronic engineering', 'Harbin University of Science and Technology', '2018-01-01', 'In service', '00000053', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `t_employee` VALUES ('54', 'Lu Cunliang6', 'male', '1990-01-03', '610122199001031456', 'married', '1', 'Shaanxi', '3', 'zhao@qq.com', '15612347795', 'Lianhu District, Xian, Shaanxi Province', '92', '12', '34', null, 'Labor Contract', 'High school', 'Electronic engineering', 'Harbin University of Science and Technology', '2018-01-01', 'In service', '00000054', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `t_employee` VALUES ('55', 'Yao Sen6', 'male', '1991-02-05', '610122199102058952', 'married', '1', 'Henan', '3', 'yaosen@qq.com', '14785559936', 'Renmin Avenue, Luoyang, Henan58number', '92', '15', '34', null, 'Labor Contract', 'junior high school', 'Interior decoration design', 'Northwest University', '2017-01-02', 'In service', '00000055', '7', '2017-04-02', null, '2017-01-02', '2024-01-17', null);
INSERT INTO `t_employee` VALUES ('56', 'Yunxing6', 'Female', '1993-01-05', '610122199301054789', 'married', '1', 'Xian, Shaanxi', '1', 'yunxing@qq.com', '15644442252', 'Xian New District, Shaanxi', '92', '16', '34', null, 'Labor contract', 'masters degree', 'Communication Engineering', 'Xian Electronic Technology School', '2018-01-01', 'In service', '00000056', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `t_employee` VALUES ('1351', 'programmer35', 'male', '1990-01-01', '610122199001011256', 'married', '1', 'Shaanxi', '13', 'laowang@qq.com', '18565558897', 'Nanshan District, Shenzhen', '8', '9', '29', null, 'Labor Contract', 'Undergraduate', 'Information management and information system', 'Shenzhen University', '2018-01-01', 'In service', '00000001', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `t_employee` VALUES ('1352', 'Chen Jing', 'Female', '1989-02-01', '421288198902011234', 'married', '1', 'Hainan', '1', 'chenjing@qq.com', '18795556693', 'Meilan District, Haikou City, Hainan Province', '82', '12', '30', null, 'Labor Contract', 'High school', 'marketing', 'Wuhan University', '2015-06-09', 'In service', '00000002', '3', null, null, '2015-06-09', '2018-06-08', null);
INSERT INTO `t_employee` VALUES ('1353', 'Zhao Linhao', 'male', '1993-03-04', '610122199303041456', 'unmarried', '1', 'Shaanxi', '3', 'zhao@qq.com', '15698887795', 'Lianhu District, Xian, Shaanxi Province', '91', '12', '33', null, 'Labor Contract', 'PhD', 'Electronic engineering', 'Harbin University of Science and Technology', '2018-01-01', 'In service', '00000003', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `t_employee` VALUES ('1354', 'Lu Cunliang', 'male', '1990-01-03', '610122199001031456', 'married', '1', 'Shaanxi', '3', 'zhao@qq.com', '15612347795', 'Lianhu District, Xian, Shaanxi Province', '92', '12', '34', null, 'Labor Contract', 'High school', 'Electronic engineering', 'Harbin University of Science and Technology', '2018-01-01', 'In service', '00000004', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `t_employee` VALUES ('1355', 'Yao Sen', 'male', '1991-02-05', '610122199102058952', 'married', '1', 'Henan', '3', 'yaosen@qq.com', '14785559936', 'Renmin Avenue, Luoyang, Henan58number', '92', '15', '34', null, 'Labor Contract', 'junior high school', 'Interior decoration design', 'Northwest University', '2017-01-02', 'In service', '00000005', '7', null, null, '2017-01-02', '2024-01-17', null);
INSERT INTO `t_employee` VALUES ('1357', 'Jia Xuming', 'male', '1993-11-11', '610122199311111234', 'married', '1', 'Guangzhou, Guangdong', '4', 'jiaxuming@qq.com', '15644441234', 'Xiancun Road, Tianhe District, Guangzhou City, Guangdong Province', '78', '15', '33', null, 'Labor contract', 'junior high school', 'Communication Engineering', 'Northwest University', '2018-01-01', 'In service', '00000007', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `t_employee` VALUES ('1358', 'Zhang Liming', 'male', '1991-02-01', '610144199102014569', 'married', '1', 'Guangdong', '6', 'zhangliming@qq.com', '18979994478', 'Zhuhai, Guangdong', '91', '15', '33', null, 'Labor Contract', 'High school', 'archeology', 'Tsinghua University', '2018-01-01', 'In service', '00000008', '7', null, null, '2018-01-01', '2025-01-30', null);
INSERT INTO `t_employee` VALUES ('1359', 'Xue Lei', 'male', '1992-07-01', '610144199207017895', 'married', '1', 'Xian, Shaanxi', '13', 'xuelei@qq.com', '15648887741', 'Yanta District, Xian', '92', '14', '34', null, 'Labor Contract', 'junior high school', 'no', 'Huaxu Middle School', '2018-01-01', 'In service', '00000009', '6', null, null, '2018-01-01', '2024-01-17', null);
INSERT INTO `t_employee` VALUES ('1360', 'Zhang Jie', 'Female', '1990-10-09', '420177199010093652', 'unmarried', '1', 'Hainan', '5', 'zhangjie@qq.com', '13695557742', 'Meilan District, Haikou City', '92', '16', '34', null, 'Labor Contract', 'High school', 'no', 'Hainan Overseas Chinese', '2018-01-01', 'In service', '00000010', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `t_employee` VALUES ('1361', 'programmer35-2', 'male', '1990-01-01', '610122199001011256', 'married', '1', 'Shaanxi', '13', 'laowang@qq.com', '18565558897', 'Nanshan District, Shenzhen', '8', '9', '29', null, 'Labor Contract', 'Undergraduate', 'Information management and information system', 'Shenzhen University', '2018-01-01', 'In service', '00000011', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `t_employee` VALUES ('1362', 'Chen Jing2', 'Female', '1989-02-01', '421288198902011234', 'married', '1', 'Hainan', '1', 'chenjing@qq.com', '18795556693', 'Meilan District, Haikou City, Hainan Province', '82', '12', '30', null, 'Labor Contract', 'High school', 'marketing', 'Wuhan University', '2015-06-09', 'In service', '00000012', '3', null, null, '2015-06-09', '2018-06-08', null);
INSERT INTO `t_employee` VALUES ('1363', 'Zhao Linhao2', 'male', '1993-03-04', '610122199303041456', 'unmarried', '1', 'Shaanxi', '3', 'zhao@qq.com', '15698887795', 'Lianhu District, Xian, Shaanxi Province', '91', '12', '33', null, 'Labor Contract', 'PhD', 'Electronic engineering', 'Harbin University of Science and Technology', '2018-01-01', 'In service', '00000013', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `t_employee` VALUES ('1364', 'Lu Cunliang2', 'male', '1990-01-03', '610122199001031456', 'married', '1', 'Shaanxi', '3', 'zhao@qq.com', '15612347795', 'Lianhu District, Xian, Shaanxi Province', '92', '12', '34', null, 'Labor Contract', 'High school', 'Electronic engineering', 'Harbin University of Science and Technology', '2018-01-01', 'In service', '00000014', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `t_employee` VALUES ('1365', 'Yao Sen2', 'male', '1991-02-05', '610122199102058952', 'married', '1', 'Henan', '3', 'yaosen@qq.com', '14785559936', 'Renmin Avenue, Luoyang, Henan58number', '92', '15', '34', null, 'Labor Contract', 'junior high school', 'Interior decoration design', 'Northwest University', '2017-01-02', 'In service', '00000015', '7', null, null, '2017-01-02', '2024-01-17', null);
INSERT INTO `t_employee` VALUES ('1366', 'Yunxing2', 'Female', '1993-01-05', '610122199301054789', 'married', '1', 'Xian, Shaanxi', '1', 'yunxing@qq.com', '15644442252', 'Xian New District, Shaanxi', '92', '16', '34', null, 'Labor contract', 'masters degree', 'Communication Engineering', 'Xian Electronic Technology School', '2018-01-01', 'In service', '00000016', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `t_employee` VALUES ('1367', 'Jia Xuming2', 'male', '1993-11-11', '610122199311111234', 'married', '1', 'Guangzhou, Guangdong', '4', 'jiaxuming@qq.com', '15644441234', 'Xiancun Road, Tianhe District, Guangzhou City, Guangdong Province', '78', '15', '33', null, 'Labor contract', 'junior high school', 'Communication Engineering', 'Northwest University', '2018-01-01', 'In service', '00000017', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `t_employee` VALUES ('1368', 'Wang Yiting', 'male', '1991-02-01', '610144199102014569', 'married', '1', 'Guangdong', '6', 'zhangliming@qq.com', '18979994478', 'Zhuhai, Guangdong', '91', '15', '33', null, 'Labor Contract', 'High school', 'archeology', 'Tsinghua University', '2018-01-01', 'In service', '00000018', '7', null, null, '2018-01-01', '2025-01-30', null);
INSERT INTO `t_employee` VALUES ('1369', 'Xue Lei2', 'male', '1992-07-01', '610144199207017895', 'married', '1', 'Xian, Shaanxi', '13', 'xuelei@qq.com', '15648887741', 'Yanta District, Xian', '92', '14', '34', null, 'Labor Contract', 'junior high school', 'no', 'Huaxu Middle School', '2018-01-01', 'In service', '00000019', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `t_employee` VALUES ('1370', 'Zhang Jie2', 'Female', '1990-10-09', '420177199010093652', 'unmarried', '1', 'Hainan', '5', 'zhangjie@qq.com', '13695557742', 'Meilan District, Haikou City', '92', '16', '34', null, 'Labor Contract', 'High school', 'no', 'Hainan Overseas Chinese', '2018-01-01', 'In service', '00000020', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `t_employee` VALUES ('1371', 'programmer35-3', 'male', '1990-01-01', '610122199001011256', 'married', '1', 'Shaanxi', '13', 'laowang@qq.com', '18565558897', 'Nanshan District, Shenzhen', '8', '9', '29', null, 'Labor Contract', 'Undergraduate', 'Information management and information system', 'Shenzhen University', '2018-01-01', 'In service', '00000021', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `t_employee` VALUES ('1372', 'Chen Jing3', 'Female', '1989-02-01', '421288198902011234', 'married', '1', 'Hainan', '1', 'chenjing@qq.com', '18795556693', 'Meilan District, Haikou City, Hainan Province', '82', '12', '30', null, 'Labor Contract', 'High school', 'marketing', 'Wuhan University', '2015-06-09', 'In service', '00000022', '3', null, null, '2015-06-09', '2018-06-08', null);
INSERT INTO `t_employee` VALUES ('1373', 'Lu Cunliang3', 'male', '1990-01-03', '610122199001031456', 'married', '1', 'Shaanxi', '3', 'zhao@qq.com', '15612347795', 'Lianhu District, Xian, Shaanxi Province', '92', '12', '34', null, 'Labor Contract', 'High school', 'Electronic engineering', 'Harbin University of Science and Technology', '2018-01-01', 'In service', '00000024', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `t_employee` VALUES ('1374', 'Yao Sen3', 'male', '1991-02-05', '610122199102058952', 'married', '1', 'Henan', '3', 'yaosen@qq.com', '14785559936', 'Renmin Avenue, Luoyang, Henan58number', '92', '15', '34', null, 'Labor Contract', 'junior high school', 'Interior decoration design', 'Northwest University', '2017-01-02', 'In service', '00000025', '7', null, null, '2017-01-02', '2024-01-17', null);
INSERT INTO `t_employee` VALUES ('1375', 'Yunxing3', 'Female', '1993-01-05', '610122199301054789', 'married', '1', 'Xian, Shaanxi', '1', 'yunxing@qq.com', '15644442252', 'Xian New District, Shaanxi', '92', '16', '34', null, 'Labor contract', 'masters degree', 'Communication Engineering', 'Xian Electronic Technology School', '2018-01-01', 'In service', '00000026', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `t_employee` VALUES ('1376', 'Jia Xuming3', 'male', '1993-11-11', '610122199311111234', 'married', '1', 'Guangzhou, Guangdong', '4', 'jiaxuming@qq.com', '15644441234', 'Xiancun Road, Tianhe District, Guangzhou City, Guangdong Province', '78', '15', '33', null, 'Labor contract', 'junior high school', 'Communication Engineering', 'Northwest University', '2018-01-01', 'In service', '00000027', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `t_employee` VALUES ('1377', 'Zhang Liming3', 'male', '1991-02-01', '610144199102014569', 'married', '1', 'Guangdong', '6', 'zhangliming@qq.com', '18979994478', 'Zhuhai, Guangdong', '91', '15', '33', null, 'Labor Contract', 'High school', 'archeology', 'Tsinghua University', '2018-01-01', 'In service', '00000028', '7', null, null, '2018-01-01', '2025-01-30', null);
INSERT INTO `t_employee` VALUES ('1378', 'Xue Lei3', 'male', '1992-07-01', '610144199207017895', 'married', '1', 'Xian, Shaanxi', '13', 'xuelei@qq.com', '15648887741', 'Yanta District, Xian', '92', '14', '34', null, 'Labor Contract', 'junior high school', 'no', 'Huaxu Middle School', '2018-01-01', 'In service', '00000029', '6', null, null, '2018-01-01', '2024-01-17', null);
INSERT INTO `t_employee` VALUES ('1379', 'programmer35-4', 'male', '1990-01-01', '610122199001011256', 'married', '1', 'Shaanxi', '13', 'laowang@qq.com', '18565558897', 'Nanshan District, Shenzhen', '8', '9', '29', null, 'Labor Contract', 'Undergraduate', 'Information management and information system', 'Shenzhen University', '2018-01-01', 'In service', '00000031', '1', null, null, '2018-01-01', '2019-01-01', null);
INSERT INTO `t_employee` VALUES ('1380', 'Chen Jing4', 'Female', '1989-02-01', '421288198902011234', 'married', '1', 'Hainan', '1', 'chenjing@qq.com', '18795556693', 'Meilan District, Haikou City, Hainan Province', '82', '12', '30', null, 'Labor Contract', 'High school', 'marketing', 'Wuhan University', '2015-06-09', 'In service', '00000032', '3', null, null, '2015-06-09', '2018-06-08', null);
INSERT INTO `t_employee` VALUES ('1381', 'Zhao Linhao4', 'male', '1993-03-04', '610122199303041456', 'unmarried', '1', 'Shaanxi', '3', 'zhao@qq.com', '15698887795', 'Lianhu District, Xian, Shaanxi Province', '91', '12', '33', null, 'Labor Contract', 'PhD', 'Electronic engineering', 'Harbin University of Science and Technology', '2018-01-01', 'In service', '00000033', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `t_employee` VALUES ('1382', 'Lu Cunliang4', 'male', '1990-01-03', '610122199001031456', 'married', '1', 'Shaanxi', '3', 'zhao@qq.com', '15612347795', 'Lianhu District, Xian, Shaanxi Province', '92', '12', '34', null, 'Labor Contract', 'High school', 'Electronic engineering', 'Harbin University of Science and Technology', '2018-01-01', 'In service', '00000034', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `t_employee` VALUES ('1383', 'Yao Sen4', 'male', '1991-02-05', '610122199102058952', 'married', '1', 'Henan', '3', 'yaosen@qq.com', '14785559936', 'Renmin Avenue, Luoyang, Henan58number', '92', '15', '34', null, 'Labor Contract', 'junior high school', 'Interior decoration design', 'Northwest University', '2017-01-02', 'In service', '00000035', '7', null, null, '2017-01-02', '2024-01-17', null);
INSERT INTO `t_employee` VALUES ('1384', 'Yunxing4', 'Female', '1993-01-05', '610122199301054789', 'married', '1', 'Xian, Shaanxi', '1', 'yunxing@qq.com', '15644442252', 'Xian New District, Shaanxi', '92', '16', '34', null, 'Labor contract', 'masters degree', 'Communication Engineering', 'Xian Electronic Technology School', '2018-01-01', 'In service', '00000036', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `t_employee` VALUES ('1385', 'Jia Xuming4', 'male', '1993-11-11', '610122199311111234', 'married', '1', 'Guangzhou, Guangdong', '4', 'jiaxuming@qq.com', '15644441234', 'Xiancun Road, Tianhe District, Guangzhou City, Guangdong Province', '78', '15', '33', null, 'Labor contract', 'junior high school', 'Communication Engineering', 'Northwest University', '2018-01-01', 'In service', '00000037', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `t_employee` VALUES ('1411', 'Xie Gong', 'Female', '1970-01-01', '618177197001011234', 'Divorce', '1', 'Jiangsu', '1', '584991843@qq.com', '18558887788', 'Beijing', '85', '12', '29', null, 'Labor Contract', 'Undergraduate', 'computer software', 'Nanhua University', '2018-01-01', 'In service', '00000038', '5', '2019-01-01', null, '2018-01-01', '2023-01-01', null);
INSERT INTO `t_employee` VALUES ('1412', 'Lin Zhaoliang', 'male', '1990-01-01', '610122199809091234', 'married', '1', 'Guangdong', '13', '584991843@qq.com', '16767776654', 'Shenzhen, Guangdong', '91', '15', '33', null, 'Labor Contract', 'College', 'computer software', 'Guangdong Vocational and Technical College', '2018-01-01', 'In service', '00000039', '5', '2018-04-01', null, '2018-01-01', '2023-01-01', null);
INSERT INTO `t_employee` VALUES ('1942', 'Test staff', 'male', '1989-12-31', '610122199001011256', 'married', '2', 'Shaanxi', '13', 'laowang@qq.com', '18565558897', 'Nanshan District, Shenzhen', '81', '10', '30', null, 'Labor contract', 'College', 'Information management and information system', 'Shenzhen University', '2017-12-31', 'In service', '00000066', '1.75', '2018-03-31', null, '2017-12-31', '2019-09-30', null);
INSERT INTO `t_employee` VALUES ('1943', 'Test staff2', 'male', '1989-12-31', '610122199001011256', 'married', '1', 'Shaanxi', '1', 'laowang@qq.com', '18565558897', 'Nanshan District, Shenzhen', '91', '9', '29', null, 'Labor contract', 'Undergraduate', 'Information management and information system', 'Shenzhen University', '2017-12-31', 'In service', '00000067', '2', '2018-03-31', null, '2017-12-31', '2019-12-31', null);
INSERT INTO `t_employee` VALUES ('1944', 'Test staff3', 'male', '1989-12-31', '610122199001011256', 'married', '2', 'Shaanxi', '13', 'laowang@qq.com', '18565558897', 'Nanshan District, Shenzhen', '81', '10', '30', null, 'Labor contract', 'College', 'Information management and information system', 'Shenzhen University', '2017-12-31', 'In service', '00000066', '1.75', '2018-03-31', null, '2017-12-31', '2019-09-30', null);
INSERT INTO `t_employee` VALUES ('1945', 'Test staff4', 'male', '1989-12-31', '610122199001011256', 'married', '1', 'Shaanxi', '1', 'laowang@qq.com', '18565558897', 'Nanshan District, Shenzhen', '91', '9', '29', null, 'Labor contract', 'Undergraduate', 'Information management and information system', 'Shenzhen University', '2017-12-31', 'In service', '00000067', '2', '2018-03-31', null, '2017-12-31', '2019-12-31', null);
INSERT INTO `t_employee` VALUES ('1946', 'Test staff5', 'Female', '1989-02-01', '421288198902011234', 'married', '1', 'Hainan', '1', 'chenjing@qq.com', '18795556693', 'Meilan District, Haikou City, Hainan Province', '82', '12', '30', null, 'Labor Contract', 'High school', 'marketing', 'Wuhan University', '2015-06-09', 'In service', '00000032', '3', null, null, '2015-06-09', '2018-06-08', null);
INSERT INTO `t_employee` VALUES ('1947', 'Test staff6', 'male', '1993-03-04', '610122199303041456', 'unmarried', '1', 'Shaanxi', '3', 'zhao@qq.com', '15698887795', 'Lianhu District, Xian, Shaanxi Province', '91', '12', '33', null, 'Labor Contract', 'PhD', 'Electronic engineering', 'Harbin University of Science and Technology', '2018-01-01', 'In service', '00000033', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `t_employee` VALUES ('1948', 'Test staff7', 'male', '1990-01-03', '610122199001031456', 'married', '1', 'Shaanxi', '3', 'zhao@qq.com', '15612347795', 'Lianhu District, Xian, Shaanxi Province', '92', '12', '34', null, 'Labor Contract', 'High school', 'Electronic engineering', 'Harbin University of Science and Technology', '2018-01-01', 'In service', '00000034', '3.5', null, null, '2018-01-01', '2021-07-14', null);
INSERT INTO `t_employee` VALUES ('1949', 'Test staff8', 'male', '1991-02-05', '610122199102058952', 'married', '1', 'Henan', '3', 'yaosen@qq.com', '14785559936', 'Renmin Avenue, Luoyang, Henan58number', '92', '15', '34', null, 'Labor Contract', 'junior high school', 'Interior decoration design', 'Northwest University', '2017-01-02', 'In service', '00000035', '7', null, null, '2017-01-02', '2024-01-17', null);
INSERT INTO `t_employee` VALUES ('1950', 'Test staff9', 'Female', '1993-01-05', '610122199301054789', 'married', '1', 'Xian, Shaanxi', '1', 'yunxing@qq.com', '15644442252', 'Xian New District, Shaanxi', '92', '16', '34', null, 'Labor contract', 'masters degree', 'Communication Engineering', 'Xian Electronic Technology School', '2018-01-01', 'In service', '00000036', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `t_employee` VALUES ('1951', 'Test staff10', 'male', '1993-11-11', '610122199311111234', 'married', '1', 'Guangzhou, Guangdong', '4', 'jiaxuming@qq.com', '15644441234', 'Xiancun Road, Tianhe District, Guangzhou City, Guangdong Province', '78', '15', '33', null, 'Labor contract', 'junior high school', 'Communication Engineering', 'Northwest University', '2018-01-01', 'In service', '00000037', '5.25', null, null, '2018-01-01', '2023-04-13', null);
INSERT INTO `t_employee` VALUES ('1952', 'Test staff11', 'Female', '1970-01-01', '618177197001011234', 'Divorce', '1', 'Jiangsu', '1', '584991843@qq.com', '18558887788', 'Beijing', '85', '12', '29', null, 'Labor Contract', 'Undergraduate', 'computer software', 'Nanhua University', '2018-01-01', 'In service', '00000038', '5', '2019-01-01', null, '2018-01-01', '2023-01-01', null);
INSERT INTO `t_employee` VALUES ('1953', 'Test staff12', 'male', '1990-01-01', '610122199809091234', 'married', '1', 'Guangdong', '13', '584991843@qq.com', '16767776654', 'Shenzhen, Guangdong', '91', '15', '33', null, 'Labor Contract', 'College', 'computer software', 'Guangdong Vocational and Technical College', '2018-01-01', 'In service', '00000039', '5', '2018-04-01', null, '2018-01-01', '2023-01-01', null);
INSERT INTO `t_employee` VALUES ('1954', 'Test staff3', 'male', '1989-12-31', '610122199001011256', 'married', '1', 'Shaanxi', '13', '454407628@qq.com', '18565558897', 'Nanshan District, Shenzhen', '91', '10', '36', null, 'Labor contract', 'Undergraduate', 'Information management and information system', 'Shenzhen University', '2017-12-31', 'In service', '00000068', '2', '2018-03-31', null, '2017-12-31', '2019-12-31', null);
INSERT INTO `t_employee` VALUES ('1955', 'Test staff', 'male', '1989-12-31', '610122199001011256', 'married', '1', 'Shaanxi', '13', '454407628@qq.com', '18565558897', 'Nanshan District, Shenzhen', '91', '10', '36', null, 'Labor contract', 'Undergraduate', 'Information management and information system', 'Shenzhen University', '2017-12-31', 'In service', '00000069', '2', '2018-03-31', null, '2017-12-31', '2019-12-31', null);
INSERT INTO `t_employee` VALUES ('1956', 'Test staff', 'male', '1989-12-31', '610122199001011256', 'married', '1', 'Shaanxi', '13', '454407628@qq.com', '18565558897', 'Nanshan District, Shenzhen', '78', '9', '29', null, 'Labor contract', 'Undergraduate', 'Information management and information system', 'Shenzhen University', '2017-12-31', 'In service', '00000070', '2', '2018-03-31', null, '2017-12-31', '2019-12-31', null);
INSERT INTO `t_employee` VALUES ('1957', 'Test staff', 'male', '1989-12-31', '610122199001011256', 'married', '1', 'Shaanxi', '13', '454407628@qq.com', '18565558897', 'Nanshan District, Shenzhen', '89', '9', '29', null, 'Labor contract', 'Undergraduate', 'Information management and information system', 'Shenzhen University', '2017-12-31', 'In service', '00000071', '2', '2018-03-31', null, '2017-12-31', '2019-12-31', null);

-- ----------------------------
-- Table structure for t_jobtitle
-- ----------------------------
DROP TABLE IF EXISTS `t_jobtitle`;
CREATE TABLE `t_jobtitle` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary keyid',
  `name` varchar(64) DEFAULT NULL COMMENT 'Job title',
  `level` enum('Positive Senior','Deputy Senior','intermediate','primary','Staff') DEFAULT NULL COMMENT 'Title level',
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='job title';

-- ----------------------------
-- Records of t_jobtitle
-- ----------------------------
INSERT INTO `t_jobtitle` VALUES ('9', 'professor', 'Positive Senior', '2018-01-11 00:00:00', '1');
INSERT INTO `t_jobtitle` VALUES ('10', 'Associate Professor', 'Deputy Senior', '2018-01-11 21:19:20', '1');
INSERT INTO `t_jobtitle` VALUES ('12', 'Teaching assistant', 'primary', '2018-01-11 21:35:39', '1');
INSERT INTO `t_jobtitle` VALUES ('13', 'lecturer', 'intermediate', '2018-01-11 00:00:00', '1');
INSERT INTO `t_jobtitle` VALUES ('14', 'Junior engineer', 'primary', '2018-01-14 00:00:00', '1');
INSERT INTO `t_jobtitle` VALUES ('15', 'mid-level engineer66', 'intermediate', '2018-01-14 00:00:00', '1');
INSERT INTO `t_jobtitle` VALUES ('16', 'Senior engineer', 'Deputy Senior', '2018-01-14 16:19:14', '1');
INSERT INTO `t_jobtitle` VALUES ('17', 'Ashes engineer', 'Positive Senior', '2018-01-14 16:19:24', '1');
INSERT INTO `t_jobtitle` VALUES ('18', 'Test title1', 'Deputy Senior', '2020-01-02 13:19:21', '0');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary keyid',
  `url` varchar(64) DEFAULT NULL,
  `path` varchar(64) DEFAULT NULL,
  `component` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `iconCls` varchar(64) DEFAULT NULL,
  `keepAlive` tinyint(1) DEFAULT NULL,
  `requireAuth` tinyint(1) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_parentId` (`parentId`) USING BTREE,
  CONSTRAINT `fk_m_parentId` FOREIGN KEY (`parentId`) REFERENCES `t_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='menu';

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', '/', null, null, 'all', null, null, null, null, '1');
INSERT INTO `t_menu` VALUES ('2', '/', '/home', 'Home', 'Employee information', 'fa fa-user-circle-o', null, '1', '1', '1');
INSERT INTO `t_menu` VALUES ('3', '/', '/home', 'Home', 'HR management', 'fa fa-address-card-o', null, '1', '1', '1');
INSERT INTO `t_menu` VALUES ('4', '/', '/home', 'Home', 'Payroll management', 'fa fa-money', null, '1', '1', '1');
INSERT INTO `t_menu` VALUES ('5', '/', '/home', 'Home', 'Statistics Management', 'fa fa-bar-chart', null, '1', '1', '1');
INSERT INTO `t_menu` VALUES ('6', '/', '/home', 'Home', 'System Management', 'fa fa-windows', null, '1', '1', '1');
INSERT INTO `t_menu` VALUES ('7', '/employee/basic/**', '/emp/basic', 'EmpBasic', 'basic information', null, null, '1', '2', '1');
INSERT INTO `t_menu` VALUES ('8', '/employee/advanced/**', '/emp/adv', 'EmpAdv', 'Advanced Information', null, null, '1', '2', '1');
INSERT INTO `t_menu` VALUES ('9', '/personnel/emp/**', '/per/emp', 'PerEmp', 'Employee information', null, null, '1', '3', '1');
INSERT INTO `t_menu` VALUES ('10', '/personnel/ec/**', '/per/ec', 'PerEc', 'Employee rewards and punishments', null, null, '1', '3', '1');
INSERT INTO `t_menu` VALUES ('11', '/personnel/train/**', '/per/train', 'PerTrain', 'employee training', null, null, '1', '3', '1');
INSERT INTO `t_menu` VALUES ('12', '/personnel/salary/**', '/per/salary', 'PerSalary', 'Employee salary adjustment', null, null, '1', '3', '1');
INSERT INTO `t_menu` VALUES ('13', '/personnel/remove/**', '/per/mv', 'PerMv', 'Staff transfer', null, null, '1', '3', '1');
INSERT INTO `t_menu` VALUES ('14', '/salary/sob/**', '/sal/sob', 'SalSob', 'Payroll set management', null, null, '1', '4', '1');
INSERT INTO `t_menu` VALUES ('15', '/salary/sobcfg/**', '/sal/sobcfg', 'SalSobCfg', 'Employee account set', null, null, '1', '4', '1');
INSERT INTO `t_menu` VALUES ('16', '/salary/table/**', '/sal/table', 'SalTable', 'Payroll management', null, null, '1', '4', '1');
INSERT INTO `t_menu` VALUES ('17', '/salary/month/**', '/sal/month', 'SalMonth', 'End of the month', null, null, '1', '4', '1');
INSERT INTO `t_menu` VALUES ('18', '/salary/search/**', '/sal/search', 'SalSearch', 'Payroll query', null, null, '1', '4', '1');
INSERT INTO `t_menu` VALUES ('19', '/statistics/all/**', '/sta/all', 'StaAll', 'Comprehensive Information Statistics', null, null, '1', '5', '1');
INSERT INTO `t_menu` VALUES ('20', '/statistics/score/**', '/sta/score', 'StaScore', 'Employee points statistics', null, null, '1', '5', '1');
INSERT INTO `t_menu` VALUES ('21', '/statistics/personnel/**', '/sta/pers', 'StaPers', 'Personnel information statistics', null, null, '1', '5', '1');
INSERT INTO `t_menu` VALUES ('22', '/statistics/recored/**', '/sta/record', 'StaRecord', 'Personnel record statistics', null, null, '1', '5', '1');
INSERT INTO `t_menu` VALUES ('23', '/system/basic/**', '/sys/basic', 'SysBasic', 'Basic information settings', null, null, '1', '6', '1');
INSERT INTO `t_menu` VALUES ('24', '/system/cfg/**', '/sys/cfg', 'SysCfg', 'System Management', null, null, '1', '6', '1');
INSERT INTO `t_menu` VALUES ('25', '/system/log/**', '/sys/log', 'SysLog', 'Operation log management', null, null, '1', '6', '1');
INSERT INTO `t_menu` VALUES ('26', '/system/user/**', '/sys/user', 'SysUser', 'User Management', null, null, '1', '6', '1');
INSERT INTO `t_menu` VALUES ('27', '/system/data/**', '/sys/data', 'SysData', 'Backup and restore the database', null, null, '1', '6', '1');
INSERT INTO `t_menu` VALUES ('28', '/system/init/**', '/sys/init', 'SysInit', 'Initialize the database', null, null, '1', '6', '1');

-- ----------------------------
-- Table structure for t_menu_role
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_role`;
CREATE TABLE `t_menu_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary keyid',
  `mid` int(11) DEFAULT NULL COMMENT 'menuid',
  `rid` int(11) DEFAULT NULL COMMENT 'Rolesid',
  PRIMARY KEY (`id`),
  KEY `idx_mid` (`mid`) USING BTREE,
  KEY `idx_rid` (`rid`) USING BTREE,
  CONSTRAINT `fk_mr_mid` FOREIGN KEY (`mid`) REFERENCES `t_menu` (`id`),
  CONSTRAINT `fk_mr_rid` FOREIGN KEY (`rid`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8 COMMENT='Menus and characters';

-- ----------------------------
-- Records of t_menu_role
-- ----------------------------
INSERT INTO `t_menu_role` VALUES ('161', '7', '3');
INSERT INTO `t_menu_role` VALUES ('162', '7', '6');
INSERT INTO `t_menu_role` VALUES ('163', '9', '6');
INSERT INTO `t_menu_role` VALUES ('164', '10', '6');
INSERT INTO `t_menu_role` VALUES ('165', '11', '6');
INSERT INTO `t_menu_role` VALUES ('166', '12', '6');
INSERT INTO `t_menu_role` VALUES ('167', '13', '6');
INSERT INTO `t_menu_role` VALUES ('168', '14', '6');
INSERT INTO `t_menu_role` VALUES ('169', '15', '6');
INSERT INTO `t_menu_role` VALUES ('170', '16', '6');
INSERT INTO `t_menu_role` VALUES ('171', '17', '6');
INSERT INTO `t_menu_role` VALUES ('172', '18', '6');
INSERT INTO `t_menu_role` VALUES ('173', '19', '6');
INSERT INTO `t_menu_role` VALUES ('174', '20', '6');
INSERT INTO `t_menu_role` VALUES ('175', '21', '6');
INSERT INTO `t_menu_role` VALUES ('176', '22', '6');
INSERT INTO `t_menu_role` VALUES ('177', '23', '6');
INSERT INTO `t_menu_role` VALUES ('178', '25', '6');
INSERT INTO `t_menu_role` VALUES ('179', '26', '6');
INSERT INTO `t_menu_role` VALUES ('180', '27', '6');
INSERT INTO `t_menu_role` VALUES ('181', '28', '6');
INSERT INTO `t_menu_role` VALUES ('182', '24', '6');
INSERT INTO `t_menu_role` VALUES ('247', '7', '4');
INSERT INTO `t_menu_role` VALUES ('248', '8', '4');
INSERT INTO `t_menu_role` VALUES ('249', '11', '4');
INSERT INTO `t_menu_role` VALUES ('250', '7', '2');
INSERT INTO `t_menu_role` VALUES ('251', '8', '2');
INSERT INTO `t_menu_role` VALUES ('252', '9', '2');
INSERT INTO `t_menu_role` VALUES ('253', '10', '2');
INSERT INTO `t_menu_role` VALUES ('254', '12', '2');
INSERT INTO `t_menu_role` VALUES ('255', '13', '2');
INSERT INTO `t_menu_role` VALUES ('256', '7', '1');
INSERT INTO `t_menu_role` VALUES ('257', '8', '1');
INSERT INTO `t_menu_role` VALUES ('258', '9', '1');
INSERT INTO `t_menu_role` VALUES ('259', '10', '1');
INSERT INTO `t_menu_role` VALUES ('260', '11', '1');
INSERT INTO `t_menu_role` VALUES ('261', '12', '1');
INSERT INTO `t_menu_role` VALUES ('262', '13', '1');
INSERT INTO `t_menu_role` VALUES ('263', '14', '1');
INSERT INTO `t_menu_role` VALUES ('264', '15', '1');
INSERT INTO `t_menu_role` VALUES ('265', '16', '1');
INSERT INTO `t_menu_role` VALUES ('266', '17', '1');
INSERT INTO `t_menu_role` VALUES ('267', '18', '1');
INSERT INTO `t_menu_role` VALUES ('268', '19', '1');
INSERT INTO `t_menu_role` VALUES ('269', '20', '1');
INSERT INTO `t_menu_role` VALUES ('270', '21', '1');
INSERT INTO `t_menu_role` VALUES ('271', '22', '1');
INSERT INTO `t_menu_role` VALUES ('272', '23', '1');
INSERT INTO `t_menu_role` VALUES ('273', '24', '1');
INSERT INTO `t_menu_role` VALUES ('274', '25', '1');
INSERT INTO `t_menu_role` VALUES ('275', '26', '1');
INSERT INTO `t_menu_role` VALUES ('276', '27', '1');
INSERT INTO `t_menu_role` VALUES ('277', '28', '1');

-- ----------------------------
-- Table structure for t_nation
-- ----------------------------
DROP TABLE IF EXISTS `t_nation`;
CREATE TABLE `t_nation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary keyid',
  `name` varchar(64) DEFAULT NULL COMMENT 'name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='Nation';

-- ----------------------------
-- Records of t_nation
-- ----------------------------
INSERT INTO `t_nation` VALUES ('1', 'Han nationality');
INSERT INTO `t_nation` VALUES ('2', 'Mongolian');
INSERT INTO `t_nation` VALUES ('3', 'Hui');
INSERT INTO `t_nation` VALUES ('4', 'Tibetan');
INSERT INTO `t_nation` VALUES ('5', 'Uighur');
INSERT INTO `t_nation` VALUES ('6', 'Hmong');
INSERT INTO `t_nation` VALUES ('7', 'Yi nationality');
INSERT INTO `t_nation` VALUES ('8', 'Zhuang');
INSERT INTO `t_nation` VALUES ('9', 'Buyi');
INSERT INTO `t_nation` VALUES ('10', 'Korean');
INSERT INTO `t_nation` VALUES ('11', 'Manchu');
INSERT INTO `t_nation` VALUES ('12', 'Dong Nationality');
INSERT INTO `t_nation` VALUES ('13', 'Yao nationality');
INSERT INTO `t_nation` VALUES ('14', 'Bai');
INSERT INTO `t_nation` VALUES ('15', 'Tujia');
INSERT INTO `t_nation` VALUES ('16', 'Hani');
INSERT INTO `t_nation` VALUES ('17', 'Kazakh');
INSERT INTO `t_nation` VALUES ('18', 'Dai people');
INSERT INTO `t_nation` VALUES ('19', 'Li nationality');
INSERT INTO `t_nation` VALUES ('20', 'Lisu');
INSERT INTO `t_nation` VALUES ('21', 'Wa Nationality');
INSERT INTO `t_nation` VALUES ('22', 'She Nationality');
INSERT INTO `t_nation` VALUES ('23', 'Gaoshan');
INSERT INTO `t_nation` VALUES ('24', 'Lahu');
INSERT INTO `t_nation` VALUES ('25', 'Aqua');
INSERT INTO `t_nation` VALUES ('26', 'Dongxiang');
INSERT INTO `t_nation` VALUES ('27', 'Naxi');
INSERT INTO `t_nation` VALUES ('28', 'Jingpo');
INSERT INTO `t_nation` VALUES ('29', 'Kirgiz');
INSERT INTO `t_nation` VALUES ('30', 'Tu');
INSERT INTO `t_nation` VALUES ('31', 'Daur');
INSERT INTO `t_nation` VALUES ('32', 'Mulam');
INSERT INTO `t_nation` VALUES ('33', 'Qiang');
INSERT INTO `t_nation` VALUES ('34', 'Blang');
INSERT INTO `t_nation` VALUES ('35', 'Salar');
INSERT INTO `t_nation` VALUES ('36', 'Mao Nan');
INSERT INTO `t_nation` VALUES ('37', 'Gelao');
INSERT INTO `t_nation` VALUES ('38', 'Xibe');
INSERT INTO `t_nation` VALUES ('39', 'Achang');
INSERT INTO `t_nation` VALUES ('40', 'Pumi');
INSERT INTO `t_nation` VALUES ('41', 'Tajik');
INSERT INTO `t_nation` VALUES ('42', 'Nu');
INSERT INTO `t_nation` VALUES ('43', 'Uzbek');
INSERT INTO `t_nation` VALUES ('44', 'Russian');
INSERT INTO `t_nation` VALUES ('45', 'Ewenki');
INSERT INTO `t_nation` VALUES ('46', 'Benglong tribe');
INSERT INTO `t_nation` VALUES ('47', 'Baoan');
INSERT INTO `t_nation` VALUES ('48', 'Yugu');
INSERT INTO `t_nation` VALUES ('49', 'Jing nationality');
INSERT INTO `t_nation` VALUES ('50', 'Tatar');
INSERT INTO `t_nation` VALUES ('51', 'Dulong');
INSERT INTO `t_nation` VALUES ('52', 'Oroqen');
INSERT INTO `t_nation` VALUES ('53', 'Hezhe');
INSERT INTO `t_nation` VALUES ('54', 'Menba');
INSERT INTO `t_nation` VALUES ('55', 'Lhoba');
INSERT INTO `t_nation` VALUES ('56', 'Jinuo');

-- ----------------------------
-- Table structure for t_politicsstatus
-- ----------------------------
DROP TABLE IF EXISTS `t_politicsstatus`;
CREATE TABLE `t_politicsstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary keyid',
  `name` varchar(64) DEFAULT NULL COMMENT 'name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='political status';

-- ----------------------------
-- Records of t_politicsstatus
-- ----------------------------
INSERT INTO `t_politicsstatus` VALUES ('1', 'Communist Party members');
INSERT INTO `t_politicsstatus` VALUES ('2', 'Communist probationary member');
INSERT INTO `t_politicsstatus` VALUES ('3', 'Member of the Communist Youth League');
INSERT INTO `t_politicsstatus` VALUES ('4', 'Member of the National Revolutionary Party');
INSERT INTO `t_politicsstatus` VALUES ('5', 'League members');
INSERT INTO `t_politicsstatus` VALUES ('6', 'DAB members');
INSERT INTO `t_politicsstatus` VALUES ('7', 'Democratic Progressive Member');
INSERT INTO `t_politicsstatus` VALUES ('8', 'Agrarian Party Member');
INSERT INTO `t_politicsstatus` VALUES ('9', 'To the party members');
INSERT INTO `t_politicsstatus` VALUES ('10', 'Member of Jiu San Society');
INSERT INTO `t_politicsstatus` VALUES ('11', 'Taiwan League member');
INSERT INTO `t_politicsstatus` VALUES ('12', 'Nonpartisan democrats');
INSERT INTO `t_politicsstatus` VALUES ('13', 'Ordinary citizen');

-- ----------------------------
-- Table structure for t_position
-- ----------------------------
DROP TABLE IF EXISTS `t_position`;
CREATE TABLE `t_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary keyid',
  `name` varchar(64) DEFAULT NULL COMMENT 'Job Title',
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='position';

-- ----------------------------
-- Records of t_position
-- ----------------------------
INSERT INTO `t_position` VALUES ('29', 'technical director', '2018-01-11 21:13:42', '1');
INSERT INTO `t_position` VALUES ('30', 'Operations Director', '2018-01-11 21:13:48', '1');
INSERT INTO `t_position` VALUES ('31', 'Director of Marketing', '2018-01-11 00:00:00', '1');
INSERT INTO `t_position` VALUES ('33', 'R &amp; D Engineer', '2018-01-14 00:00:00', '1');
INSERT INTO `t_position` VALUES ('34', 'Operation and Maintenance Engineer', '2018-01-14 16:11:41', '1');
INSERT INTO `t_position` VALUES ('36', 'JavaR &amp; D Manager', '2019-10-01 00:00:00', '1');
INSERT INTO `t_position` VALUES ('41', 'Test position1', '2020-01-02 10:06:03', '0');
INSERT INTO `t_position` VALUES ('42', 'aa', '2020-01-18 10:33:11', '1');
INSERT INTO `t_position` VALUES ('45', 'bb', '2020-01-18 10:36:32', '1');
INSERT INTO `t_position` VALUES ('47', '11', '2020-01-18 10:39:02', '1');
INSERT INTO `t_position` VALUES ('48', 'aaa', '2020-01-18 10:39:22', '1');
INSERT INTO `t_position` VALUES ('49', 'aaccc', '2020-01-18 10:51:15', '1');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary keyid',
  `name` varchar(64) DEFAULT NULL COMMENT 'Role Name',
  `nameZh` varchar(64) DEFAULT NULL COMMENT 'Chinese character name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Roles';

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'ROLE_manager', 'Department manager');
INSERT INTO `t_role` VALUES ('2', 'ROLE_personnel', 'Personnel Commissioner');
INSERT INTO `t_role` VALUES ('3', 'ROLE_recruiter', 'Recruitment supervisor');
INSERT INTO `t_role` VALUES ('4', 'ROLE_train', 'Training Director');
INSERT INTO `t_role` VALUES ('5', 'ROLE_performance', 'Compensation Performance Supervisor');
INSERT INTO `t_role` VALUES ('6', 'ROLE_admin', 'System administrator');
INSERT INTO `t_role` VALUES ('14', 'ROLE_test1', 'Test role1');
INSERT INTO `t_role` VALUES ('15', 'ROLE_test2', 'Test role2');

-- ----------------------------
-- Table structure for t_salary
-- ----------------------------
DROP TABLE IF EXISTS `t_salary`;
CREATE TABLE `t_salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary keyid',
  `name` varchar(64) DEFAULT NULL COMMENT 'A / C set name',
  `basicSalary` int(11) DEFAULT NULL COMMENT 'Basic wage',
  `bonus` int(11) DEFAULT NULL COMMENT 'bonus',
  `lunchSalary` int(11) DEFAULT NULL COMMENT 'Lunch allowance',
  `trafficSalary` int(11) DEFAULT NULL COMMENT 'Transport Allowance',
  `allSalary` int(11) DEFAULT NULL COMMENT 'Payable',
  `pensionBase` int(11) DEFAULT NULL COMMENT 'Pension base',
  `pensionPer` float DEFAULT NULL COMMENT 'Pension ratio',
  `medicalBase` int(11) DEFAULT NULL COMMENT 'Medical insurance base',
  `medicalPer` float DEFAULT NULL COMMENT 'Medical insurance ratio',
  `accumulationFundBase` int(11) DEFAULT NULL COMMENT 'Provident Fund Base',
  `accumulationFundPer` float DEFAULT NULL COMMENT 'Provident Fund Ratio',
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='Payroll';

-- ----------------------------
-- Records of t_salary
-- ----------------------------
INSERT INTO `t_salary` VALUES ('9', 'Marketing Department Payroll Set', '9000', '4000', '800', '500', null, '2000', '0.07', '2000', '0.07', '2000', '0.07', '2018-01-24 00:00:00');
INSERT INTO `t_salary` VALUES ('10', 'Payroll set of personnel', '2000', '2000', '400', '1000', null, '2000', '0.07', '2000', '0.07', '2000', '0.07', '2018-01-01 00:00:00');
INSERT INTO `t_salary` VALUES ('13', 'Operation and Maintenance Department Salary Set', '20000', '3000', '500', '500', null, '4000', '0.07', '4000', '0.07', '4000', '0.07', '2018-01-25 00:00:00');
INSERT INTO `t_salary` VALUES ('19', 'Test payroll', '8888', '700', '600', '500', null, '5000', '0.05', '6000', '0.06', '7000', '0.07', '2020-01-23 20:18:21');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary keyid',
  `name` varchar(64) DEFAULT NULL COMMENT 'Name',
  `phone` char(11) DEFAULT NULL COMMENT 'mobile phone number',
  `telephone` varchar(16) DEFAULT NULL COMMENT 'telephone number',
  `address` varchar(64) DEFAULT NULL COMMENT 'address',
  `enabled` tinyint(1) DEFAULT '1',
  `username` varchar(255) DEFAULT NULL COMMENT 'username',
  `password` varchar(255) DEFAULT NULL COMMENT 'password',
  `userface` varchar(255) DEFAULT NULL COMMENT 'profile picture',
  `remark` varchar(255) DEFAULT NULL COMMENT 'Remarks',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='user';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('3', 'System administrator', '18568887789', '029-82881234', 'Shenzhen Nanshan', '1', 'admin', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'http://bpic.588ku.com/element_pic/01/40/00/64573ce2edc0728.jpg', '');
INSERT INTO `t_user` VALUES ('5', 'Li Bai', '18568123489', '029-82123434', 'Haikou Meilan', '1', 'libai', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'http://bpic.588ku.com/element_pic/01/40/00/64573ce2edc0728.jpg', '');
INSERT INTO `t_user` VALUES ('10', 'Han Yu', '18568123666', '029-82111555', 'Guangzhou Panyu', '1', 'hanyu', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517070040185&di=be0375e0c3db6c311b837b28c208f318&imgtype=0&src=http%3A%2F%2Fimg2.soyoung.com%2Fpost%2F20150213%2F6%2F20150213141918532.jpg', '');
INSERT INTO `t_user` VALUES ('11', 'Liu Zongyuan', '18568123377', '029-82111333', 'Guangzhou Tianhe', '1', 'liuzongyuan', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515233756&di=0856d923a0a37a87fd26604a2c871370&imgtype=jpg&er=1&src=http%3A%2F%2Fwww.qqzhi.com%2Fuploadpic%2F2014-09-27%2F041716704.jpg', '');
INSERT INTO `t_user` VALUES ('12', 'Zeng Gong', '18568128888', '029-82111222', 'Guangzhou Yuexiu', '1', 'zenggong', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517070040185&di=be0375e0c3db6c311b837b28c208f318&imgtype=0&src=http%3A%2F%2Fimg2.soyoung.com%2Fpost%2F20150213%2F6%2F20150213141918532.jpg', '');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary keyid',
  `uid` int(11) DEFAULT NULL COMMENT 'userid',
  `rid` int(11) DEFAULT NULL COMMENT 'Rolesid',
  PRIMARY KEY (`id`),
  KEY `idx_rid` (`rid`) USING BTREE,
  KEY `idx_uid` (`uid`) USING BTREE,
  CONSTRAINT `fk_ur_rid` FOREIGN KEY (`rid`) REFERENCES `t_role` (`id`),
  CONSTRAINT `fk_ur_uid` FOREIGN KEY (`uid`) REFERENCES `t_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='Users and roles';

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '3', '6');
INSERT INTO `t_user_role` VALUES ('35', '12', '4');
INSERT INTO `t_user_role` VALUES ('36', '12', '3');
INSERT INTO `t_user_role` VALUES ('37', '12', '2');
INSERT INTO `t_user_role` VALUES ('43', '11', '3');
INSERT INTO `t_user_role` VALUES ('44', '11', '2');
INSERT INTO `t_user_role` VALUES ('45', '11', '4');
INSERT INTO `t_user_role` VALUES ('46', '11', '5');
INSERT INTO `t_user_role` VALUES ('48', '10', '3');
INSERT INTO `t_user_role` VALUES ('49', '10', '4');
INSERT INTO `t_user_role` VALUES ('61', '5', '1');
INSERT INTO `t_user_role` VALUES ('62', '5', '3');

-- ----------------------------
-- Procedure structure for addDep
-- ----------------------------
DROP PROCEDURE IF EXISTS `addDep`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addDep`(in depName varchar(32),in parentId int,in enabled boolean,out result int,out result2 int)
begin
  -- Unused，Has been changed toserviceachieve
  declare did int;
  declare pDepPath varchar(64);
  insert into t_department set name=depName,parentId=parentId,enabled=enabled;
  select row_count() into result;
  select last_insert_id() into did;
  set result2=did;
  select depPath into pDepPath from t_department where id=parentId;
  update t_department set depPath=concat(pDepPath,'.',did) where id=did;
  update t_department set isParent=true where id=parentId;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for deleteDep
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteDep`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDep`(in did int,out result int)
begin
  -- Unused，Has been changed toserviceachieve
  declare ecount int;
  declare pid int;
  declare pcount int;
  declare a int;
  select count(*) into a from t_department where id=did and isParent=false;
  if a=0 then set result=-2;
  else
  select count(*) into ecount from t_employee where departmentId=did;
  if ecount>0 then set result=-1;
  else 
  select parentId into pid from t_department where id=did;
  delete from t_department where id=did and isParent=false;
  select row_count() into result;
  select count(*) into pcount from t_department where parentId=pid;
  if pcount=0 then update t_department set isParent=false where id=pid;
  end if;
  end if;
  end if;
end
;;
DELIMITER ;
