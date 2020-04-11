/*
Navicat MySQL Data Transfer

Source Server         : q_pgm
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : q_moly

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2019-10-22 22:25:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for q_admin
-- ----------------------------
DROP TABLE IF EXISTS `q_admin`;
CREATE TABLE `q_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin` varchar(31) COLLATE utf8_bin NOT NULL,
  `pwd` varchar(63) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of q_admin
-- ----------------------------
INSERT INTO `q_admin` VALUES ('2', 'qc', '4eae35f1b35977a00ebd8086c259d4c9');

-- ----------------------------
-- Table structure for q_course
-- ----------------------------
DROP TABLE IF EXISTS `q_course`;
CREATE TABLE `q_course` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(63) COLLATE utf8_bin NOT NULL,
  `type` varchar(31) COLLATE utf8_bin DEFAULT NULL,
  `level` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `teacher_name` varchar(31) COLLATE utf8_bin DEFAULT NULL,
  `img` text COLLATE utf8_bin,
  `video` text COLLATE utf8_bin,
  `direction` varchar(31) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of q_course
-- ----------------------------
INSERT INTO `q_course` VALUES ('1', '[HTML+CSS]五分钟写出漂亮的动态搜索框', 'html', '1', '无', 0x43684D6C5756316B76477149464D5271414257394571785873575941414D30475146654C736341466230713137302E6A7067, 0x38313536313939362D312D33322E6D7034, '前端');
INSERT INTO `q_course` VALUES ('2', '[前端特效] [HTML+CSS] 7分钟写出简单实用的登录页面', 'html', '1', '无', 0x43684D6C576C316B76492D495847765741415F675F37644770744541414D3047774E7A66717341442D45583737332E6A7067, 0x38363535393438302D312D33322E6D7034, '前端');
INSERT INTO `q_course` VALUES ('3', '[前端特效] [HTML+CSS] 10分钟写出PC手机都能用的顶部自适应导航菜单', 'html', '1', '无', 0x43684D6C5756316B764853494F5168414143426E64467347464E7341414D3047514F6E4C446B414947654D3433342E6A7067, 0x38363535373135392D312D33322E6D7034, '前端');
INSERT INTO `q_course` VALUES ('4', '[HTML+CSS]五分钟写出漂亮的动态搜索框', 'css', '1', '无', 0x43684D6C5756316B76477149464D5271414257394571785873575941414D30475146654C736341466230713137302E6A7067, 0x38313536313939362D312D33322E6D7034, '前端');
INSERT INTO `q_course` VALUES ('5', '零基础学java一定要面对的几个难关', 'java', '1', '无', 0x373833335F63313432396234346561356338616631613162383838353733383261383430632E706E67, 0x3132343737323537322D312D33322E6D7034, '后端');
INSERT INTO `q_course` VALUES ('6', '数据库1', 'mysql', '1', '无', 0x323031393232313133353034323733342E6A7067, 0x38363132353837392D312D33322E6D7034, '数据库');
INSERT INTO `q_course` VALUES ('7', '数据库2', 'mysql', '1', '无', 0x30303030342E6A7067, 0x38363132353930352D312D33322E6D7034, '数据库');
INSERT INTO `q_course` VALUES ('8', '数据库3', 'mysql', '1', '无', 0x637368756A752E6A7067, 0x38363132353935392D312D33322E6D7034, '数据库');
INSERT INTO `q_course` VALUES ('9', '安卓教程', 'android', '1', '无', 0x306666343162643561643665646463346664343261613766333964626236666435333636333338382E6A7067, 0x36373531353030392D312D33322E6D7034, '移动');

-- ----------------------------
-- Table structure for q_study
-- ----------------------------
DROP TABLE IF EXISTS `q_study`;
CREATE TABLE `q_study` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `browse_record` varchar(31) COLLATE utf8_bin DEFAULT NULL,
  `collection` varchar(31) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of q_study
-- ----------------------------

-- ----------------------------
-- Table structure for q_teacher
-- ----------------------------
DROP TABLE IF EXISTS `q_teacher`;
CREATE TABLE `q_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(31) COLLATE utf8_bin DEFAULT NULL,
  `tpicture` text COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of q_teacher
-- ----------------------------
INSERT INTO `q_teacher` VALUES ('1', '马云', 0x6D6179756E2E6A7067);
INSERT INTO `q_teacher` VALUES ('2', '马化腾', 0x6D6168756174656E672E6A7067);
INSERT INTO `q_teacher` VALUES ('3', '张小龙', 0x7A68616E677869616F6C6F6E672E6A7067);

-- ----------------------------
-- Table structure for q_user
-- ----------------------------
DROP TABLE IF EXISTS `q_user`;
CREATE TABLE `q_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(31) COLLATE utf8_bin NOT NULL,
  `password` varchar(63) COLLATE utf8_bin NOT NULL,
  `phone` varchar(31) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(63) COLLATE utf8_bin DEFAULT NULL,
  `address` text COLLATE utf8_bin,
  `name` varchar(31) COLLATE utf8_bin DEFAULT NULL,
  `gender` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `picture` text COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of q_user
-- ----------------------------
INSERT INTO `q_user` VALUES ('1', 'qgg', '202cb962ac59075b964b07152d234b70', '1265485215', 'nihaoma@qq.com', 0xE5B9BFE5B79EE5A4A7E5ADA6E58D8EE8BDAFE8BDAFE4BBB6E5ADA6E999A2, '哈哈哈', '男', 0x633331303037626363643132376135386334316135306632396464656665352E6A7067);
INSERT INTO `q_user` VALUES ('2', 'niniubi', '4eae35f1b35977a00ebd8086c259d4c9', '15915961596', 'niniubi@qq.com', 0xE5B9BFE5B79EE5A4A7E5ADA6E58D8EE8BDAFE8BDAFE4BBB6E5ADA6E999A2, '嘿嘿嘿', '女', 0x32303139313032325C62626435613936356563643537323637393739356361643231383961363339322E6A7067);
INSERT INTO `q_user` VALUES ('3', 'aaa', '4124bc0a9335c27f086f24ba207a4912', null, null, null, null, null, 0x32303139313032325C66353836323033343539383361383739313438616531363938303864363365622E6A7067);
