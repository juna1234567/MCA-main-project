/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50130
Source Host           : localhost:3306
Source Database       : coptrack.com

Target Server Type    : MYSQL
Target Server Version : 50130
File Encoding         : 65001

Date: 2019-02-27 11:21:42
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `tbl_admin`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_admin`;
CREATE TABLE `tbl_admin` (
  `admin_id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `phone` int(10) NOT NULL,
  `mobile` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pasw` varchar(50) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_admin
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_complaint`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_complaint`;
CREATE TABLE `tbl_complaint` (
  `cmp_id` int(10) NOT NULL AUTO_INCREMENT,
  `emp_id` int(10) NOT NULL,
  `complaint` varchar(500) NOT NULL,
  `cmp_date` varchar(50) NOT NULL,
  PRIMARY KEY (`cmp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_complaint
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_emp`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_emp`;
CREATE TABLE `tbl_emp` (
  `name` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `firm_name` varchar(50) NOT NULL,
  `aadhar_no` int(20) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `emp_address` varchar(100) NOT NULL,
  `place` varchar(50) NOT NULL,
  `phone` int(10) NOT NULL,
  `mobile` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pswd` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_emp
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_feedback`;
CREATE TABLE `tbl_feedback` (
  `feedback_id` int(10) NOT NULL AUTO_INCREMENT,
  `date` varchar(50) NOT NULL,
  `emp_id` int(10) NOT NULL,
  `feedback_title` varchar(50) NOT NULL,
  `feedback_description` varchar(500) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_jobdetails`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_jobdetails`;
CREATE TABLE `tbl_jobdetails` (
  `job_id` int(10) NOT NULL AUTO_INCREMENT,
  `emp_id` int(10) NOT NULL,
  `job_details` varchar(100) NOT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_jobdetails
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_myworker`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_myworker`;
CREATE TABLE `tbl_myworker` (
  `emp_id` int(10) NOT NULL,
  `worker_id` int(10) NOT NULL,
  `date` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_myworker
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_noc`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_noc`;
CREATE TABLE `tbl_noc` (
  `noc_id` int(10) NOT NULL AUTO_INCREMENT,
  `worker_id` int(10) NOT NULL,
  `station_id` int(10) NOT NULL,
  `date` varchar(50) NOT NULL,
  `crime_details` varchar(1000) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`noc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_noc
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_policestation`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_policestation`;
CREATE TABLE `tbl_policestation` (
  `station_id` int(10) NOT NULL AUTO_INCREMENT,
  `branch` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` int(10) NOT NULL,
  `mobile` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_policestation
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_vacancy`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_vacancy`;
CREATE TABLE `tbl_vacancy` (
  `vacancy_id` int(10) NOT NULL AUTO_INCREMENT,
  `date` varchar(50) NOT NULL,
  `emp_id` int(10) NOT NULL,
  `vacancy` varchar(50) NOT NULL,
  `vacancy_no` int(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`vacancy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_vacancy
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_worker`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_worker`;
CREATE TABLE `tbl_worker` (
  `worker_id` int(10) NOT NULL AUTO_INCREMENT,
  `worker_name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `aadhar_number` int(50) NOT NULL,
  `regis_date` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `languages_known` varchar(100) NOT NULL,
  `phone` int(10) NOT NULL,
  `mobile` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`worker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_worker
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_workershedule`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_workershedule`;
CREATE TABLE `tbl_workershedule` (
  `shedule_id` int(10) NOT NULL AUTO_INCREMENT,
  `emp_id` int(10) NOT NULL,
  `worker_id` int(10) NOT NULL,
  `job_details` varchar(100) NOT NULL,
  `salary` int(100) NOT NULL,
  `time_from` varchar(50) NOT NULL,
  `time_to` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`shedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_workershedule
-- ----------------------------
