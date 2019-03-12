/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50130
Source Host           : localhost:3306
Source Database       : coptrack.com

Target Server Type    : MYSQL
Target Server Version : 50130
File Encoding         : 65001

Date: 2019-03-12 16:19:32
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2019-03-01 05:11:26');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2019-03-01 05:11:28');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2019-03-01 05:11:29');
INSERT INTO `django_migrations` VALUES ('4', 'contenttypes', '0002_remove_content_type_name', '2019-03-01 05:11:29');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0002_alter_permission_name_max_length', '2019-03-01 05:11:30');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0003_alter_user_email_max_length', '2019-03-01 05:11:30');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0004_alter_user_username_opts', '2019-03-01 05:11:30');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0005_alter_user_last_login_null', '2019-03-01 05:11:31');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0006_require_contenttypes_0002', '2019-03-01 05:11:31');
INSERT INTO `django_migrations` VALUES ('10', 'sessions', '0001_initial', '2019-03-01 05:11:31');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('9flpp3fn637fzpxjto6wupyxfh2euh8n', 'OTJkNTdjYjVlZmEyN2U1MDU4ZmE4YTIxMjNjZTZiYjg0NTBiZDk2Yjp7InVzZXJuYW1lIjoib3BAZ21haWwuY29tIiwidV9pZCI6MTEsInVzZXJfdHlwZSI6ImVtcGxveWVyIn0=', '2019-03-25 08:26:07');
INSERT INTO `django_session` VALUES ('jt3b0hbnz1vplrecre9gdzpm5rqy3lr6', 'OTJkNTdjYjVlZmEyN2U1MDU4ZmE4YTIxMjNjZTZiYjg0NTBiZDk2Yjp7InVzZXJuYW1lIjoib3BAZ21haWwuY29tIiwidV9pZCI6MTEsInVzZXJfdHlwZSI6ImVtcGxveWVyIn0=', '2019-03-26 06:49:09');
INSERT INTO `django_session` VALUES ('sdgssognhnm4o81u44z1zlg5n6paacwq', 'OTJkNTdjYjVlZmEyN2U1MDU4ZmE4YTIxMjNjZTZiYjg0NTBiZDk2Yjp7InVzZXJuYW1lIjoib3BAZ21haWwuY29tIiwidV9pZCI6MTEsInVzZXJfdHlwZSI6ImVtcGxveWVyIn0=', '2019-03-26 07:43:56');
INSERT INTO `django_session` VALUES ('t7osinir219ji2m4np10udx9xhwjcx3l', 'OTJkNTdjYjVlZmEyN2U1MDU4ZmE4YTIxMjNjZTZiYjg0NTBiZDk2Yjp7InVzZXJuYW1lIjoib3BAZ21haWwuY29tIiwidV9pZCI6MTEsInVzZXJfdHlwZSI6ImVtcGxveWVyIn0=', '2019-03-26 10:36:27');

-- ----------------------------
-- Table structure for `tbl_admin`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_admin`;
CREATE TABLE `tbl_admin` (
  `admin_id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pasw` varchar(50) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_admin
-- ----------------------------
INSERT INTO `tbl_admin` VALUES ('1', 'e', 'e', 'e', '3456789087', '4567432356', 'e@gmail.com', 'e');
INSERT INTO `tbl_admin` VALUES ('2', 'Y', 'G', 'H', '7890876545', '8907654347', 'h@gmail.com', 'ww');
INSERT INTO `tbl_admin` VALUES ('3', 'h', 'h', 'h', '6788999996', '6778906567', 'k@gmail.com', 'k');
INSERT INTO `tbl_admin` VALUES ('4', 'h', 'h', 'h', '6788999996', '6778906567', 'k@gmail.com', 'k');
INSERT INTO `tbl_admin` VALUES ('5', 'h', 'h', 'h', '6788999996', '6778906567', 'k@gmail.com', 'k');
INSERT INTO `tbl_admin` VALUES ('6', 'h', 'h', 'h', '6788999996', '6778906567', 'k@gmail.com', 'k');
INSERT INTO `tbl_admin` VALUES ('7', 'h', 'h', 'h', '6788999996', '6778906567', 'k@gmail.com', 'k');
INSERT INTO `tbl_admin` VALUES ('8', 'h', 'h', 'h', '6788999996', '6778906567', 'k@gmail.com', 'k');
INSERT INTO `tbl_admin` VALUES ('9', 'h', 'h', 'h', '6788999996', '6778906567', 'k@gmail.com', 'k');
INSERT INTO `tbl_admin` VALUES ('10', 'h', 'h', 'h', '6788999996', '6778906567', 'k@gmail.com', 'k');
INSERT INTO `tbl_admin` VALUES ('11', 'h', 'h', 'h', '6788999996', '6778906567', 'k@gmail.com', 'k');
INSERT INTO `tbl_admin` VALUES ('12', 'b', 'b', 'b', '8906567890', '7890656788', 'l@gmail.com', 'l');
INSERT INTO `tbl_admin` VALUES ('13', 'g', 'g', 'g', '1234567890', '1234567890', 'g@gmail.com', 'g');
INSERT INTO `tbl_admin` VALUES ('14', 'g', 'g', 'g', '1234567890', '1234567890', 'g@gmail.com', 'g');
INSERT INTO `tbl_admin` VALUES ('15', 'g', 'g', 'g', '1234567890', '1234567890', 'g@gmail.com', 'g');
INSERT INTO `tbl_admin` VALUES ('16', 'g', 'g', 'g', '1234567890', '1234567890', 'g@gmail.com', 'g');
INSERT INTO `tbl_admin` VALUES ('17', 'g', 'g', 'g', '1234567890', '1234567890', 'g@gmail.com', 'g');
INSERT INTO `tbl_admin` VALUES ('18', 'g', 'g', 'g', '1234567890', '1234567890', 'g@gmail.com', 'g');
INSERT INTO `tbl_admin` VALUES ('19', 'g', 'g', 'g', '1234567890', '1234567890', 'g@gmail.com', 'g');

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
  `emp_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `firm_name` varchar(50) NOT NULL,
  `aadhar_no` int(20) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `emp_address` varchar(100) NOT NULL,
  `place` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pswd` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_emp
-- ----------------------------
INSERT INTO `tbl_emp` VALUES ('1', 'tj', 'male', 'jkyk', '8978', '2003', 'ku', 'tj', '8905678967', '8976545678', 'g@gmail.com', 'y', 'pending');
INSERT INTO `tbl_emp` VALUES ('2', 'f', 'male', 'f', '7788', '2019-03-21', 'd', 'd', '3456789087', '8976545678', 'x@gmail.com', 'x', 'pending');
INSERT INTO `tbl_emp` VALUES ('3', 'f', 'male', 'f', '7788', '2019-03-21', 'd', 'd', '3456789087', '8976545678', 'x@gmail.com', 'x', 'pending');
INSERT INTO `tbl_emp` VALUES ('4', 'f', 'male', 'f', '7788', '2019-03-21', 'd', 'd', '3456789087', '8976545678', 'x@gmail.com', 'x', 'pending');
INSERT INTO `tbl_emp` VALUES ('5', 'f', 'male', 'f', '7788', '2019-03-21', 'd', 'd', '3456789087', '8976545678', 'x@gmail.com', 'x', 'pending');
INSERT INTO `tbl_emp` VALUES ('6', 'f', 'male', 'f', '7788', '2019-03-21', 'd', 'd', '3456789087', '8976545678', 'x@gmail.com', 'x', 'pending');
INSERT INTO `tbl_emp` VALUES ('7', 's', 'male', 's', '333', '2019-03-12', 'dd', 'd', '7890876545', '4567892345', 'c@gmail.com', 'c', 'pending');
INSERT INTO `tbl_emp` VALUES ('8', 's', 'male', 's', '333', '2019-03-12', 'dd', 'd', '7890876545', '4567892345', 'c@gmail.com', 'c', 'pending');
INSERT INTO `tbl_emp` VALUES ('9', 's', 'male', 's', '333', '2019-03-12', 'dd', 'd', '7890876545', '4567892345', 'c@gmail.com', 'c', 'pending');
INSERT INTO `tbl_emp` VALUES ('10', 'gg', 'female', 'hh', '34', '2019-05-29', 'hh', 'hh', '8790765671', '4567432351', 'hh@gmail.com', 'w', 'pending');
INSERT INTO `tbl_emp` VALUES ('11', 'm', 'male', 'm', '89', '2019-03-21', 'yy', 'y', '8790765678', '8907654347', 'op@gmail.com', 'oo', 'Active');
INSERT INTO `tbl_emp` VALUES ('12', 'o', 'female', 'o', '0', '2019-03-08', 'oo', 'o', '9890876789', '9878909878', 'om@gmail.com', 'o', 'Active');
INSERT INTO `tbl_emp` VALUES ('13', 'q', 'female', 'q', '123456789', '2019-04-06', 'qqqq', 'q', '1234567890', '11234567890', 'q@gmail.com', '123', 'Active');
INSERT INTO `tbl_emp` VALUES ('14', 't', 'female', 't', '78', '2019-03-08', 'tt', 't', '1123456789', '1123456789', 't@gmail.com', 'tt', 'Rejected');
INSERT INTO `tbl_emp` VALUES ('15', 'mm', 'female', 'mm', '45', '2019-02-06', 'mm', 'mm', '12345678899', '1234567899', 'mm@gmail.com', 'g', 'pending');
INSERT INTO `tbl_emp` VALUES ('16', 'd', 'female', 'd', '66', '2019-03-11', 'd', 'd', '5345678909', '5345678909', 'd@gmail.com', 'd', 'pending');

-- ----------------------------
-- Table structure for `tbl_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_feedback`;
CREATE TABLE `tbl_feedback` (
  `feedback_id` int(10) NOT NULL AUTO_INCREMENT,
  `date` varchar(50) NOT NULL,
  `emp_id` varchar(10) NOT NULL,
  `worker_id` varchar(10) NOT NULL,
  `feedback_title` varchar(50) NOT NULL,
  `feedback_description` varchar(500) NOT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_feedback
-- ----------------------------
INSERT INTO `tbl_feedback` VALUES ('1', '2019-03-12 14:46:37.689000', '11', '5', 'zzz', 'zzzz');
INSERT INTO `tbl_feedback` VALUES ('2', '2019-03-12 14:46:55.884000', '11', '5', 'vvv', 'vvv');
INSERT INTO `tbl_feedback` VALUES ('3', '2019-03-12 14:58:52.550000', '11', '5', 'zzza', 'za');

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
-- Table structure for `tbl_login`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_login`;
CREATE TABLE `tbl_login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  `u_id` int(10) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_login
-- ----------------------------
INSERT INTO `tbl_login` VALUES ('bb@gmail.com', 'bb', 'police', '3', 'true');
INSERT INTO `tbl_login` VALUES ('c@gmail.com', 'c', 'employer', '10', 'true');
INSERT INTO `tbl_login` VALUES ('d@gmail.com', 'd', 'employer', '16', 'false');
INSERT INTO `tbl_login` VALUES ('ee@gmail.com', 'ee', 'worker', '5', 'true');
INSERT INTO `tbl_login` VALUES ('g@gmail.com', 'g', 'admin', '0', 'false');
INSERT INTO `tbl_login` VALUES ('h@gmail.com', 'g', 'employer', '15', 'false');
INSERT INTO `tbl_login` VALUES ('k@gmail.com', 'k', 'admin', '0', 'true');
INSERT INTO `tbl_login` VALUES ('l@gmail.com', 'l', 'admin', '0', '');
INSERT INTO `tbl_login` VALUES ('om@gmail.com', 'o', 'employer', '12', 'true');
INSERT INTO `tbl_login` VALUES ('op@gmail.com', 'oo', 'employer', '11', 'true');
INSERT INTO `tbl_login` VALUES ('q@gmail.com', '123', 'employer', '13', 'true');
INSERT INTO `tbl_login` VALUES ('t@gmail.com', 'tt', 'employer', '14', 'true');
INSERT INTO `tbl_login` VALUES ('w@gmail.com', 'w', 'employer', '0', 'false');

-- ----------------------------
-- Table structure for `tbl_myworker`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_myworker`;
CREATE TABLE `tbl_myworker` (
  `myworker_id` int(10) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(10) NOT NULL,
  `worker_id` varchar(10) NOT NULL,
  `vacancy_id` varchar(10) NOT NULL,
  `date` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`myworker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_myworker
-- ----------------------------
INSERT INTO `tbl_myworker` VALUES ('1', '11', '5', '1', '2019-03-12 15:41:45.630000', 'fixed');

-- ----------------------------
-- Table structure for `tbl_noc`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_noc`;
CREATE TABLE `tbl_noc` (
  `noc_id` int(10) NOT NULL AUTO_INCREMENT,
  `worker_id` varchar(10) NOT NULL,
  `station_id` varchar(10) NOT NULL,
  `date` varchar(50) NOT NULL,
  `crime` varchar(50) NOT NULL,
  `crime_details` varchar(1000) NOT NULL,
  PRIMARY KEY (`noc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_noc
-- ----------------------------
INSERT INTO `tbl_noc` VALUES ('1', '5', '5', '2019-03-07 12:29:03.087000', 'dgh', 'grh');

-- ----------------------------
-- Table structure for `tbl_policestation`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_policestation`;
CREATE TABLE `tbl_policestation` (
  `station_id` int(10) NOT NULL AUTO_INCREMENT,
  `branch` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_policestation
-- ----------------------------
INSERT INTO `tbl_policestation` VALUES ('1', 't', 't', '5678906567', '7890765456', 'h@gmail.com', 'gg', 'g', 'g', 'g');
INSERT INTO `tbl_policestation` VALUES ('2', 'nn', 'nn', '1234567890', '1234567890', 'nn@gmail.com', 'nn', 'nn', 'nn', 'nn');
INSERT INTO `tbl_policestation` VALUES ('3', 'bb', 'bb', '1234567890', '1234567890', 'bb@gmail.com', 'bb', 'bb', 'bb', 'bb');

-- ----------------------------
-- Table structure for `tbl_vacancy`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_vacancy`;
CREATE TABLE `tbl_vacancy` (
  `vacancy_id` int(10) NOT NULL AUTO_INCREMENT,
  `date` varchar(50) NOT NULL,
  `emp_id` varchar(150) NOT NULL,
  `vacancy` varchar(50) NOT NULL,
  `vacancy_no` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`vacancy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_vacancy
-- ----------------------------
INSERT INTO `tbl_vacancy` VALUES ('1', '2019-03-12 12:22:29.953000', '11', 'dhh', '78', 'gh');
INSERT INTO `tbl_vacancy` VALUES ('2', '2019-03-12 12:21:59.648000', '11', 'hhhh', '5', 'hhh');
INSERT INTO `tbl_vacancy` VALUES ('3', '2019-03-12 12:22:13.545000', '11', 'bbb', '7', 'nnn');

-- ----------------------------
-- Table structure for `tbl_worker`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_worker`;
CREATE TABLE `tbl_worker` (
  `worker_id` int(10) NOT NULL AUTO_INCREMENT,
  `worker_name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `aadhar_number` varchar(50) NOT NULL,
  `regis_date` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `languages_known` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `paswd` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`worker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_worker
-- ----------------------------
INSERT INTO `tbl_worker` VALUES ('1', 'j', 'male', '2019-02-24', '09', '2019-02-28 12:38:37.950000', 'd', 'd', 'd', '7890876623', '3456789789', 'g@mail.com', '', 'PENDING');
INSERT INTO `tbl_worker` VALUES ('2', 'ty', 'male', '2019-02-27', '66', '2019-02-28 12:40:33.146000', 'hj', 'h', 'hy', '9767896545', '9876789876', 'j@gmail.com', '', 'PENDING');
INSERT INTO `tbl_worker` VALUES ('3', 'v', 'male', '2019-03-10', 'ujhj', '2019-03-06 12:29:25.998000', 'j', 'j', 'j', '8493456789', '8324567898', 'j@gmail.com', 'j', 'PENDING');
INSERT INTO `tbl_worker` VALUES ('4', 'vc', 'female', '2019-03-10', 'vc', '2019-03-06 12:41:14.828000', 'vc', 'vc', 'vc', '5678932456', '9087678909', 'vc@gmail.com', 'vc', 'PENDING');
INSERT INTO `tbl_worker` VALUES ('5', 'e', 'female', '2019-03-09', 'ff', '2019-03-06 12:49:16.322000', 'ee', 'ee', 'ee', '6789098789', '3456789876', 'ee@gmail.com', 'ee', 'Active');

-- ----------------------------
-- Table structure for `tbl_workerdetails`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_workerdetails`;
CREATE TABLE `tbl_workerdetails` (
  `worker_id` varchar(10) NOT NULL,
  `vacancy_id` varchar(10) NOT NULL,
  `qualification` varchar(50) NOT NULL,
  `experience` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_workerdetails
-- ----------------------------
INSERT INTO `tbl_workerdetails` VALUES ('12', '12', 'hf', '5');
INSERT INTO `tbl_workerdetails` VALUES ('11', '6', 'VCB', '5');
INSERT INTO `tbl_workerdetails` VALUES ('11', '6', 'VCB', '5');
INSERT INTO `tbl_workerdetails` VALUES ('11', '6', 'MCA', '1');
INSERT INTO `tbl_workerdetails` VALUES ('5', '6', 'ghgh', '4');
INSERT INTO `tbl_workerdetails` VALUES ('5', '1', 'mca', '2');

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
