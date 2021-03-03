/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : moca_inventory

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-03-04 00:03:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for agencies
-- ----------------------------
DROP TABLE IF EXISTS `agencies`;
CREATE TABLE `agencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_BN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `head_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `head_designation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_info` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of agencies
-- ----------------------------

-- ----------------------------
-- Table structure for assets
-- ----------------------------
DROP TABLE IF EXISTS `assets`;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `model` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier_id` int(10) DEFAULT NULL,
  `warranty_months` int(10) DEFAULT NULL,
  `license_expiry` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of assets
-- ----------------------------
INSERT INTO `assets` VALUES ('2', 'ল্যাপটপ', '1', '9', null, null, null, null, null, null, null, null, '2020-01-29 14:37:44', null, '2020-01-29 14:37:44', null, null, null);
INSERT INTO `assets` VALUES ('3', 'লেজার প্রিন্টার ', '9', '9', null, null, null, null, null, null, null, null, '2020-01-29 14:37:44', null, '2020-01-29 14:37:44', null, null, null);
INSERT INTO `assets` VALUES ('4', 'কালার প্রিন্টার', '9', '9', null, null, null, null, null, null, null, null, '2020-01-29 14:37:44', null, '2020-01-29 14:37:44', null, null, null);
INSERT INTO `assets` VALUES ('5', 'স্ক্যানার', '15', '9', null, null, null, null, null, '9', null, null, '2020-01-29 14:37:44', null, '2020-02-07 20:25:31', '3', null, null);
INSERT INTO `assets` VALUES ('6', 'ফ্যাক্স মেশিন', '16', '9', null, null, null, null, null, '9', null, null, '2020-01-29 14:37:44', null, '2020-02-07 20:22:34', '3', null, null);
INSERT INTO `assets` VALUES ('7', 'ফটোকপিয়ার', '16', '9', null, null, null, null, null, '9', null, null, '2020-01-29 14:37:44', null, '2020-02-07 20:21:56', '3', null, null);
INSERT INTO `assets` VALUES ('8', 'টেলিফোন', '16', '9', null, null, null, null, null, '9', null, null, '2020-01-29 14:37:44', null, '2020-02-07 20:19:45', '3', null, null);
INSERT INTO `assets` VALUES ('9', 'ইন্টারকম ', '16', '9', null, null, null, null, null, '9', null, null, '2020-01-29 14:37:44', null, '2020-02-08 00:16:25', '3', null, null);
INSERT INTO `assets` VALUES ('10', 'টেলিভিশন', '13', '9', null, null, null, null, null, '9', null, null, '2020-01-29 14:37:44', null, '2020-02-07 20:20:10', '3', null, null);
INSERT INTO `assets` VALUES ('11', 'সেক্রেটারিয়েট টেবিল', '13', '9', null, null, null, null, null, '9', null, null, '2020-01-29 14:37:44', null, '2020-02-08 16:19:12', '3', null, null);
INSERT INTO `assets` VALUES ('12', 'চেয়ার (রিভলবিং)', '13', '9', null, null, null, null, null, '9', null, null, '2020-01-29 14:37:44', null, '2020-02-08 13:54:08', '3', null, null);
INSERT INTO `assets` VALUES ('13', 'ভিজিটর চেয়ার', '13', '9', null, null, null, null, null, '9', null, null, '2020-01-29 14:37:44', null, '2020-02-09 21:58:11', '3', null, null);
INSERT INTO `assets` VALUES ('15', 'কম্পিউটার টেবিল', '13', '9', null, null, null, null, null, '9', null, null, '2020-01-29 14:37:44', null, '2020-02-08 23:22:46', '3', null, null);
INSERT INTO `assets` VALUES ('16', 'আলমিরা (স্টিল)', '13', '9', null, null, null, null, null, '9', null, null, '2020-01-29 14:37:44', null, '2020-02-08 14:27:35', '3', null, null);
INSERT INTO `assets` VALUES ('17', 'ফাইল কেবিনেট', '16', '9', null, null, null, null, null, '9', null, null, '2020-01-29 14:37:44', null, '2020-02-07 20:22:18', '3', null, null);
INSERT INTO `assets` VALUES ('18', 'সাইড র‍্যাক', '13', '9', null, null, null, null, null, '9', null, null, '2020-01-29 14:37:44', null, '2020-02-07 20:24:25', '3', null, null);
INSERT INTO `assets` VALUES ('19', 'সোফা সেট', '13', '9', null, null, null, null, null, '9', null, null, '2020-01-29 14:37:44', null, '2020-02-07 20:24:53', '3', null, null);
INSERT INTO `assets` VALUES ('20', 'বুক সেলফ', '13', '9', null, null, null, null, null, '9', null, null, '2020-01-29 14:37:44', null, '2020-02-07 20:23:54', '3', null, null);
INSERT INTO `assets` VALUES ('22', 'সিলিং ফ্যান', '12', '9', null, null, null, null, null, null, null, null, '2020-01-29 14:37:44', null, '2020-01-29 14:37:44', null, null, null);
INSERT INTO `assets` VALUES ('23', 'টেবিল ফ্যান', '13', '9', null, null, null, null, null, '9', null, null, '2020-01-29 14:37:44', null, '2020-02-07 20:18:07', '3', null, null);
INSERT INTO `assets` VALUES ('24', 'দেয়াল ফ্যান', '13', '9', null, null, null, null, null, '9', null, null, '2020-01-29 14:37:44', null, '2020-02-07 20:20:54', '3', null, null);
INSERT INTO `assets` VALUES ('25', 'দেয়াল ঘড়ি', '16', '9', null, null, null, null, null, '9', null, null, '2020-01-29 14:37:44', null, '2020-02-07 20:20:29', '3', null, null);
INSERT INTO `assets` VALUES ('26', 'ওভেন', '13', '9', null, null, null, null, null, '9', null, null, '2020-01-29 14:37:44', null, '2020-02-07 20:16:33', '3', null, null);
INSERT INTO `assets` VALUES ('27', 'ফ্রিজ', '13', '9', null, null, null, null, null, '9', null, null, '2020-01-29 14:37:44', null, '2020-02-07 20:22:51', '3', null, null);
INSERT INTO `assets` VALUES ('29', 'জীপ', '11', '9', null, null, null, null, null, null, null, null, '2020-01-29 14:37:44', null, '2020-01-29 14:37:44', null, null, null);
INSERT INTO `assets` VALUES ('30', 'মাইক্রোবাস', '11', '9', null, null, null, null, null, null, null, null, '2020-01-29 14:37:44', null, '2020-01-29 14:37:44', null, null, null);
INSERT INTO `assets` VALUES ('31', 'মটর সাইকেল', '11', '9', null, null, null, null, null, null, null, null, '2020-01-29 14:37:44', null, '2020-01-29 14:37:44', null, null, null);
INSERT INTO `assets` VALUES ('32', 'ডেক্সটপ কম্পিউটার', '2', '2', null, null, null, null, null, '9', null, null, '2020-02-07 20:49:06', '3', '2020-02-07 20:49:06', '3', null, null);
INSERT INTO `assets` VALUES ('33', 'চেয়ার (কাঠের)', '13', '9', null, null, null, null, null, '9', null, null, '2020-02-08 13:52:27', '3', '2020-02-08 13:53:45', '3', null, null);
INSERT INTO `assets` VALUES ('34', 'আলমিরা (কাঠের)', '13', '9', null, null, null, null, null, '9', null, null, '2020-02-08 14:27:19', '3', '2020-02-08 14:27:53', '3', null, null);
INSERT INTO `assets` VALUES ('35', 'হাফ সেক্রেটারিয়েট টেবিল', '13', '9', null, null, null, null, null, '9', null, null, '2020-02-08 16:21:25', '3', '2020-02-08 16:21:25', '3', null, null);
INSERT INTO `assets` VALUES ('36', 'সিন্দুক', '13', '9', 'লোহার', null, null, null, null, '9', null, null, '2020-02-09 00:01:09', '3', '2020-02-16 19:44:19', '3', null, null);

-- ----------------------------
-- Table structure for assets_tracking
-- ----------------------------
DROP TABLE IF EXISTS `assets_tracking`;
CREATE TABLE `assets_tracking` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) DEFAULT NULL,
  `section_id` int(10) DEFAULT NULL,
  `designation_id` int(10) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=524 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of assets_tracking
-- ----------------------------
INSERT INTO `assets_tracking` VALUES ('1', '10', '24', '5', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('2', '10', '25', '9', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('3', '10', '26', '6', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('4', '10', '27', '7', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('5', '10', '28', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('6', '19', '25', '9', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('7', '10', '24', '15', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('8', '10', '25', '12', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('9', '10', '25', '13', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('10', '19', '25', '12', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('11', '19', '25', '13', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('12', '19', '24', '15', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('13', '19', '26', '6', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('14', '19', '28', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('15', '19', '29', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('16', '19', '34', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('17', '32', '15', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('18', '32', '15', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('19', '32', '15', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('20', '32', '22', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('21', '32', '22', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('22', '32', '25', '9', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('23', '32', '25', '12', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('24', '32', '25', '13', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('25', '32', '25', '19', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('26', '32', '24', '5', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('27', '32', '24', '15', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('28', '32', '24', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('29', '32', '26', '6', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('30', '32', '26', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('31', '32', '27', '7', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('32', '32', '27', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('33', '32', '28', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('34', '32', '28', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('35', '32', '29', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('36', '32', '29', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('37', '32', '2', '4', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('38', '32', '2', '21', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('39', '32', '9', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('40', '32', '9', '18', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('41', '32', '9', '21', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('42', '32', '10', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('43', '32', '10', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('44', '32', '10', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('45', '32', '20', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('46', '32', '20', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('47', '32', '20', '21', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('48', '32', '21', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('49', '32', '21', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('50', '32', '18', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('51', '32', '18', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('52', '32', '19', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('53', '32', '19', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('54', '32', '33', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('55', '32', '23', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('56', '32', '23', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('57', '32', '8', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('58', '32', '34', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('59', '32', '1', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('60', '32', '1', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('61', '32', '1', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('62', '32', '17', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('63', '32', '17', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('64', '32', '17', '21', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('65', '32', '16', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('66', '32', '16', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('67', '32', '16', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('68', '32', '35', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('69', '32', '13', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('70', '32', '13', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('71', '32', '13', '21', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('72', '32', '14', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('73', '32', '14', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('74', '32', '36', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('75', '32', '36', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('76', '32', '37', '17', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('77', '32', '37', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('78', '32', '11', '17', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('79', '32', '12', '4', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('80', '32', '39', '22', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('81', '32', '39', '23', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('82', '32', '39', '24', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('83', '32', '39', '21', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('84', '32', '39', '25', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('85', '32', '39', '26', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('86', '19', '24', '5', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('87', '32', '40', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('88', '32', '11', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('89', '32', '12', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('90', '32', '30', '2', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('91', '32', '30', '28', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('92', '32', '34', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('93', '3', '25', '13', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('94', '4', '25', '9', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('95', '4', '25', '12', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('96', '3', '25', '19', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('97', '3', '33', '14', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('98', '4', '24', '5', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('99', '3', '24', '15', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('100', '3', '24', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('101', '3', '28', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('102', '3', '28', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('103', '3', '27', '7', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('104', '3', '27', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('105', '4', '26', '7', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('106', '3', '26', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('107', '3', '36', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('108', '3', '36', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('109', '3', '29', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('110', '3', '29', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('111', '3', '37', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('112', '3', '37', '17', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('113', '3', '21', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('114', '3', '21', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('115', '3', '34', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('116', '3', '34', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('117', '3', '40', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('118', '3', '14', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('119', '3', '14', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('120', '3', '35', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('121', '3', '16', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('122', '3', '16', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('123', '3', '9', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('124', '3', '9', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('125', '3', '15', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('126', '3', '15', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('127', '3', '15', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('128', '4', '15', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('129', '3', '10', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('130', '3', '10', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('131', '3', '10', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('132', '3', '30', '2', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('133', '3', '30', '28', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('134', '3', '17', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('135', '3', '17', '21', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('136', '3', '18', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('137', '3', '18', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('138', '3', '19', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('139', '3', '19', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('140', '3', '20', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('141', '3', '20', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('142', '3', '20', '21', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('143', '3', '13', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('144', '3', '13', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('145', '3', '13', '21', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('146', '3', '39', '22', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('147', '3', '39', '23', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('148', '3', '39', '21', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('149', '3', '39', '26', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('150', '3', '2', '4', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('151', '3', '2', '21', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('152', '3', '11', '17', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('153', '3', '11', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('154', '3', '12', '4', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('155', '3', '12', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('156', '3', '1', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('157', '3', '1', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('158', '3', '1', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('159', '3', '23', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('160', '3', '23', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('162', '3', '8', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('163', '3', '22', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('164', '3', '22', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('165', '10', '15', '29', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('166', '7', '25', '12', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('167', '7', '24', '15', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('168', '7', '16', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('169', '7', '15', '1', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('170', '7', '36', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('171', '7', '37', '17', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('172', '6', '24', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('173', '6', '33', '14', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('175', '6', '26', '6', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('176', '12', '25', '9', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('177', '12', '25', '12', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('178', '12', '25', '13', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('179', '12', '25', '19', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('180', '12', '33', '14', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('181', '12', '24', '5', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('182', '12', '24', '15', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('183', '33', '24', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('184', '12', '28', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('185', '33', '28', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('186', '12', '26', '6', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('187', '33', '26', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('188', '12', '27', '7', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('189', '12', '27', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('190', '12', '36', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('191', '12', '36', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('192', '12', '29', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('193', '12', '37', '17', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('194', '12', '21', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('195', '12', '40', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('196', '12', '14', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('197', '12', '35', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('198', '12', '16', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('199', '33', '16', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('200', '12', '9', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('201', '12', '9', '18', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('202', '12', '15', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('203', '33', '10', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('204', '33', '10', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('205', '12', '30', '2', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('206', '12', '30', '28', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('207', '33', '17', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('208', '33', '17', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('209', '33', '17', '21', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('210', '33', '18', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('211', '33', '18', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('212', '33', '18', '21', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('213', '33', '19', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('214', '33', '19', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('215', '12', '20', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('216', '33', '20', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('217', '12', '13', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('218', '33', '13', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('219', '33', '39', '22', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('220', '12', '39', '23', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('221', '33', '39', '24', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('222', '33', '39', '25', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('223', '33', '39', '21', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('224', '33', '39', '26', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('225', '12', '2', '4', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('226', '33', '2', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('227', '12', '11', '17', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('228', '33', '12', '4', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('229', '12', '1', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('230', '33', '1', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('231', '33', '1', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('232', '33', '23', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('233', '33', '23', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('234', '33', '8', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('235', '12', '22', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('236', '33', '22', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('237', '13', '25', '9', null, '6', null);
INSERT INTO `assets_tracking` VALUES ('238', '13', '25', '12', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('239', '13', '24', '5', null, '4', null);
INSERT INTO `assets_tracking` VALUES ('240', '13', '24', '15', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('241', '13', '28', '11', null, '4', null);
INSERT INTO `assets_tracking` VALUES ('242', '13', '26', '7', null, '6', null);
INSERT INTO `assets_tracking` VALUES ('243', '13', '29', '11', null, '4', null);
INSERT INTO `assets_tracking` VALUES ('244', '13', '37', '17', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('245', '13', '21', '16', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('246', '13', '34', '16', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('247', '13', '40', '16', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('248', '13', '14', '16', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('249', '13', '35', '16', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('250', '13', '16', '16', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('251', '13', '9', '16', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('252', '13', '15', '1', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('253', '13', '10', '3', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('254', '13', '30', '27', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('255', '13', '17', '3', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('256', '13', '18', '3', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('257', '13', '19', '1', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('258', '13', '13', '1', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('259', '13', '39', '22', null, '4', null);
INSERT INTO `assets_tracking` VALUES ('260', '13', '2', '4', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('261', '13', '11', '17', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('262', '13', '12', '4', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('263', '13', '1', '3', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('264', '13', '23', '1', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('265', '13', '22', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('266', '34', '15', '18', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('267', '16', '15', '1', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('268', '16', '25', '12', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('269', '16', '24', '19', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('270', '16', '28', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('271', '16', '26', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('272', '16', '27', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('273', '16', '36', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('274', '16', '29', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('275', '16', '21', '18', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('276', '16', '34', '18', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('277', '16', '40', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('278', '16', '14', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('279', '16', '16', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('280', '16', '9', '18', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('281', '16', '10', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('282', '16', '17', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('283', '16', '18', '18', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('284', '16', '19', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('285', '16', '20', '18', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('286', '16', '13', '18', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('287', '16', '39', '22', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('288', '16', '2', '4', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('289', '16', '11', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('290', '16', '12', '18', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('291', '16', '1', '18', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('292', '16', '23', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('293', '16', '8', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('294', '17', '25', '10', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('295', '17', '25', '12', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('296', '17', '25', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('297', '17', '24', '15', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('298', '17', '24', '19', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('299', '17', '28', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('300', '17', '28', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('301', '17', '27', '6', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('302', '17', '27', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('303', '17', '26', '6', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('304', '17', '26', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('305', '17', '29', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('306', '17', '37', '17', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('307', '17', '21', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('308', '17', '34', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('309', '17', '40', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('310', '17', '14', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('311', '17', '35', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('312', '17', '16', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('313', '17', '9', '18', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('314', '17', '10', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('315', '17', '30', '27', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('316', '17', '17', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('317', '17', '17', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('318', '17', '20', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('319', '17', '39', '22', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('320', '17', '39', '23', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('321', '17', '39', '26', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('322', '17', '2', '4', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('323', '17', '11', '17', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('324', '17', '12', '4', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('325', '17', '1', '18', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('326', '17', '23', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('327', '2', '25', '9', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('328', '2', '24', '5', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('329', '2', '24', '15', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('330', '2', '26', '6', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('331', '2', '27', '7', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('332', '2', '29', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('333', '9', '24', '5', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('334', '9', '24', '15', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('335', '9', '24', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('336', '9', '25', '9', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('337', '9', '25', '12', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('338', '9', '25', '13', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('339', '9', '25', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('340', '9', '33', '14', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('341', '9', '28', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('342', '9', '28', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('343', '9', '27', '7', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('344', '9', '27', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('345', '9', '26', '6', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('346', '9', '26', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('347', '9', '36', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('348', '9', '36', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('349', '9', '29', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('350', '9', '37', '17', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('351', '9', '21', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('352', '9', '34', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('353', '9', '40', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('354', '9', '14', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('355', '9', '35', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('356', '9', '16', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('357', '9', '16', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('358', '9', '9', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('359', '9', '9', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('360', '9', '15', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('361', '9', '15', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('362', '9', '10', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('363', '9', '17', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('364', '9', '18', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('365', '9', '19', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('366', '9', '20', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('367', '9', '13', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('368', '9', '13', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('369', '9', '39', '22', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('370', '9', '2', '4', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('371', '9', '11', '17', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('372', '9', '12', '4', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('373', '9', '1', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('374', '9', '1', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('375', '9', '23', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('376', '9', '8', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('377', '9', '22', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('378', '5', '25', '12', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('379', '5', '25', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('380', '5', '33', '14', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('381', '5', '24', '15', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('382', '5', '24', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('383', '5', '28', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('384', '5', '27', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('385', '5', '26', '6', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('386', '5', '26', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('387', '5', '36', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('388', '5', '37', '17', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('389', '5', '21', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('390', '5', '34', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('391', '5', '14', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('392', '5', '16', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('393', '5', '9', '18', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('394', '5', '15', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('395', '5', '15', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('396', '5', '10', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('397', '5', '30', '2', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('398', '5', '30', '28', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('399', '5', '17', '21', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('400', '5', '18', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('401', '5', '19', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('402', '5', '20', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('403', '5', '13', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('404', '5', '13', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('405', '5', '39', '22', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('406', '5', '2', '4', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('407', '5', '11', '17', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('408', '5', '1', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('409', '5', '23', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('410', '5', '8', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('411', '5', '22', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('412', '5', '22', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('413', '11', '25', '9', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('414', '11', '25', '12', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('415', '11', '25', '13', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('416', '35', '25', '19', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('417', '11', '33', '14', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('418', '11', '24', '5', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('419', '11', '24', '15', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('420', '35', '24', '19', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('421', '11', '28', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('422', '35', '28', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('423', '11', '27', '6', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('424', '35', '27', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('425', '11', '26', '6', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('426', '35', '26', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('427', '11', '36', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('428', '35', '36', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('429', '11', '29', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('430', '35', '29', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('431', '11', '37', '17', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('432', '35', '37', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('433', '11', '21', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('434', '35', '21', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('435', '11', '34', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('436', '35', '34', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('437', '11', '40', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('438', '11', '14', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('439', '35', '14', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('440', '11', '35', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('441', '11', '16', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('442', '11', '9', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('443', '11', '15', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('444', '35', '15', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('445', '11', '10', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('446', '35', '17', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('447', '35', '17', '21', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('448', '35', '18', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('449', '35', '19', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('450', '11', '20', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('451', '11', '13', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('452', '35', '13', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('453', '11', '2', '4', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('454', '35', '2', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('455', '11', '11', '17', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('456', '11', '12', '4', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('457', '11', '1', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('458', '11', '23', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('459', '35', '8', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('460', '11', '22', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('461', '35', '22', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('462', '19', '27', '6', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('463', '19', '36', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('464', '18', '24', '5', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('465', '18', '25', '9', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('466', '15', '25', '9', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('467', '15', '25', '12', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('468', '15', '25', '13', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('469', '15', '25', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('470', '15', '33', '14', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('471', '15', '24', '5', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('472', '15', '24', '15', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('473', '15', '24', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('474', '15', '28', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('475', '15', '26', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('476', '15', '27', '7', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('477', '15', '27', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('478', '15', '36', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('479', '15', '29', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('480', '15', '37', '17', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('481', '15', '37', '20', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('482', '15', '21', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('483', '15', '34', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('484', '15', '40', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('485', '15', '14', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('486', '15', '35', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('487', '15', '16', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('488', '15', '9', '18', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('489', '15', '15', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('490', '15', '10', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('491', '15', '17', '21', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('492', '15', '19', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('493', '15', '20', '16', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('494', '15', '13', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('495', '15', '13', '18', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('496', '15', '39', '22', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('497', '15', '39', '24', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('498', '15', '2', '4', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('499', '15', '11', '20', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('500', '15', '12', '4', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('501', '15', '1', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('502', '15', '23', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('503', '30', '15', '1', null, '3', null);
INSERT INTO `assets_tracking` VALUES ('504', '29', '15', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('505', '31', '15', '1', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('506', '26', '25', '19', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('507', '26', '24', '15', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('508', '26', '26', '7', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('509', '26', '29', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('510', '27', '25', '9', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('511', '27', '24', '15', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('512', '27', '26', '6', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('513', '27', '29', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('514', '36', '39', '22', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('515', '20', '25', '12', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('516', '20', '24', '15', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('517', '20', '26', '7', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('518', '20', '29', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('519', '20', '28', '11', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('520', '20', '27', '6', null, '2', null);
INSERT INTO `assets_tracking` VALUES ('521', '20', '1', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('522', '20', '17', '3', null, '1', null);
INSERT INTO `assets_tracking` VALUES ('523', '20', '2', '4', null, '1', null);

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_active` int(2) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES ('2', 'HP', '2019-11-26 10:32:22', '2019-11-26 10:32:22', '3', '3', null, null);
INSERT INTO `brands` VALUES ('3', 'Dell', '2019-11-26 10:32:25', '2019-11-26 10:32:25', '3', '3', null, null);
INSERT INTO `brands` VALUES ('4', 'অফসেট পেপার', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('5', 'Bili, China', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('6', 'Huaji, China', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('7', 'Deli, China', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('8', 'Kiwi, China', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('9', 'উন্নতমানের', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('10', 'জাপান', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('11', 'এনজেলিক/মারলিন', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('12', 'এসিআই', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('13', 'বসুন্ধরা', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('14', 'ফেবি স্টিক', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('15', 'আর্টলাইন', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('16', 'রেডলীফ ৩০৩, জাপান', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('17', 'Deli, China 303', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('18', 'Deli 0221, China', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('19', 'Deli , China', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('20', 'ক্যানন', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('21', 'ম্যাক্সসেল', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('22', 'ক্যাংগারু', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('23', 'ফেবার ক্যাসেল', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('24', 'ফেভার ক্যাসেল', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('25', 'চায়না', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('26', 'লাইফবয়', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('27', 'বাংলাদেশ', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('28', 'মি. ব্রাসো', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('29', 'ভাল মানের', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('30', '২.০ ইঞ্চি', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('31', '১.৫ ইঞ্চি', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('32', '১ ইঞ্চি', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('33', 'উন্নতমানের কাগজে', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('34', 'সিটিসান', '2019-11-26 10:32:25', '2019-11-26 10:32:25', null, null, null, null);
INSERT INTO `brands` VALUES ('35', 'ডেল', '2020-01-28 11:20:16', '2020-01-28 11:20:16', '3', '3', null, null);
INSERT INTO `brands` VALUES ('36', 'ইউএসএ', '2020-02-06 21:24:43', '2020-02-06 21:24:43', '3', '3', null, null);
INSERT INTO `brands` VALUES ('37', 'ক্যানন', '2020-02-06 23:46:27', '2020-02-06 23:46:27', '3', '3', null, null);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_active` int(2) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', 'ল্যাপটপ', '2019-11-11 14:59:22', null, null, null, '0', null);
INSERT INTO `categories` VALUES ('2', 'কম্পিউটার', '2019-11-11 15:32:46', '2019-11-11 15:32:46', null, null, '1', null);
INSERT INTO `categories` VALUES ('3', 'গাড়ির সরঞ্জামাদি', '2019-11-11 15:35:09', '2019-11-11 15:35:09', '2', null, '1', null);
INSERT INTO `categories` VALUES ('4', 'স্ক্যানার', '2019-11-11 15:35:33', '2019-11-11 15:35:33', '2', '2', '1', null);
INSERT INTO `categories` VALUES ('7', 'কম্পিউটার এক্সেসরিস', '2019-11-25 15:27:00', '2019-11-25 15:27:01', '3', '3', null, null);
INSERT INTO `categories` VALUES ('9', 'প্রিন্টার', '2020-01-28 10:45:21', '2020-01-28 10:45:21', '3', '3', null, null);
INSERT INTO `categories` VALUES ('10', 'ক্রোকারীজ', '2020-01-28 11:18:46', '2020-01-28 11:18:46', '3', '3', null, null);
INSERT INTO `categories` VALUES ('11', 'যানবাহন', '2020-01-28 11:18:46', null, null, null, null, null);
INSERT INTO `categories` VALUES ('12', 'বিবিধ', '2020-01-28 11:18:46', null, null, null, null, null);
INSERT INTO `categories` VALUES ('13', 'আসবাবপত্র', '2020-01-29 15:39:38', '2020-01-29 15:39:38', '3', '3', null, null);
INSERT INTO `categories` VALUES ('14', 'স্টেশনারী', '2020-02-05 21:13:56', '2020-02-05 21:13:56', '3', '3', null, null);
INSERT INTO `categories` VALUES ('15', 'স্ক্যানার', '2020-02-06 00:20:34', '2020-02-06 00:20:34', '3', '3', null, null);
INSERT INTO `categories` VALUES ('16', 'অফিস সরঞ্জাম', '2020-02-07 20:19:21', '2020-02-07 20:19:21', '3', '3', null, null);

-- ----------------------------
-- Table structure for ci_sessions
-- ----------------------------
DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ci_sessions
-- ----------------------------
INSERT INTO `ci_sessions` VALUES ('60225vc7ms29en151352sg0mmdbr8nmt', '::1', '1573452671', 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333435323637313B6964656E746974797C733A31353A2261646D696E4061646D696E2E636F6D223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2231223B6F6C645F6C6173745F6C6F67696E7C733A343A2232303139223B6C6173745F636865636B7C693A313537333435323637313B);
INSERT INTO `ci_sessions` VALUES ('h7foug326f0habkfokofai10f7o4ck96', '::1', '1573452671', 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333435323637313B6964656E746974797C733A31353A2261646D696E4061646D696E2E636F6D223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2231223B6F6C645F6C6173745F6C6F67696E7C733A343A2232303139223B6C6173745F636865636B7C693A313537333435323637313B757365725F6C6F676765645F696E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A31333A2261646D696E6973747261746F72223B733A31303A226C6173745F6C6F67696E223B733A343A2232303139223B733A31303A2266697273745F6E616D65223B733A353A2241646D696E223B733A393A226C6173745F6E616D65223B733A383A226973747261746F72223B733A393A2266696C655F70617468223B733A33333A226173736574732F696D616765732F757365722F313536383631323538382E706E67223B7D73657474696E67735F646174617C613A393A7B733A31313A2273657474696E67735F6964223B733A313A2231223B733A31333A2273657474696E67735F6E616D65223B733A34333A224D6F64756C617220426173652041646D696E4C74652047726F63657279204372756420496F6E2041757468223B733A31343A2273657474696E67735F656D61696C223B733A31363A22696E666F406578616D706C652E636F6D223B733A333A22726567223B733A383A223132333435363738223B733A31313A2265737461626C6973686564223B733A31303A22323031392D30392D3136223B733A31363A2273657474696E67735F61646472657373223B733A32313A22446577616E62617A61722C436869747461676F6E67223B733A373A22666F756E646572223B733A393A2252616A696220446173223B733A31363A2273657474696E67735F636F6E74616374223B733A31313A223031383531333334323335223B733A31383A2273657474696E67735F66696C655F70617468223B733A31343A2233643731612D6C6F676F2E706E67223B7D);
INSERT INTO `ci_sessions` VALUES ('k7jdrueneor5k656tm4s6fchpp77n26k', '::1', '1573452709', 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333435323730393B6964656E746974797C733A31353A2261646D696E4061646D696E2E636F6D223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2231223B6F6C645F6C6173745F6C6F67696E7C733A343A2232303139223B6C6173745F636865636B7C693A313537333435323730393B);
INSERT INTO `ci_sessions` VALUES ('lp2127asqvbl5d0d4r7p4n6ukteme051', '::1', '1573453176', 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333435333137363B6964656E746974797C733A31353A2261646D696E4061646D696E2E636F6D223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2231223B6F6C645F6C6173745F6C6F67696E7C733A343A2232303139223B6C6173745F636865636B7C693A313537333435323730393B757365725F6C6F676765645F696E7C613A363A7B733A373A22757365725F6964223B733A313A2231223B733A383A22757365726E616D65223B733A31333A2261646D696E6973747261746F72223B733A31303A226C6173745F6C6F67696E223B733A343A2232303139223B733A31303A2266697273745F6E616D65223B733A353A2241646D696E223B733A393A226C6173745F6E616D65223B733A383A226973747261746F72223B733A393A2266696C655F70617468223B733A33333A226173736574732F696D616765732F757365722F313536383631323538382E706E67223B7D73657474696E67735F646174617C613A393A7B733A31313A2273657474696E67735F6964223B733A313A2231223B733A31333A2273657474696E67735F6E616D65223B733A34333A224D6F64756C617220426173652041646D696E4C74652047726F63657279204372756420496F6E2041757468223B733A31343A2273657474696E67735F656D61696C223B733A31363A22696E666F406578616D706C652E636F6D223B733A333A22726567223B733A383A223132333435363738223B733A31313A2265737461626C6973686564223B733A31303A22323031392D30392D3136223B733A31363A2273657474696E67735F61646472657373223B733A32313A22446577616E62617A61722C436869747461676F6E67223B733A373A22666F756E646572223B733A393A2252616A696220446173223B733A31363A2273657474696E67735F636F6E74616374223B733A31313A223031383531333334323335223B733A31383A2273657474696E67735F66696C655F70617468223B733A31343A2233643731612D6C6F676F2E706E67223B7D);
INSERT INTO `ci_sessions` VALUES ('48olmnd481r5sa2egce3isf2pehaf21v', '::1', '1573453208', 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333435333230383B6964656E746974797C733A31333A227465737440746573742E636F6D223B656D61696C7C733A31333A227465737440746573742E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C4E3B6C6173745F636865636B7C693A313537333435333230383B);
INSERT INTO `ci_sessions` VALUES ('73u1hl1vk7ashefk58ib8vuf26tn4kf0', '::1', '1573454339', 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333435343333393B6964656E746974797C733A31333A227465737440746573742E636F6D223B656D61696C7C733A31333A227465737440746573742E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C4E3B6C6173745F636865636B7C693A313537333435333230383B757365725F6C6F676765645F696E7C613A363A7B733A373A22757365725F6964223B733A313A2232223B733A383A22757365726E616D65223B733A343A2274657374223B733A31303A226C6173745F6C6F67696E223B733A343A2232303139223B733A31303A2266697273745F6E616D65223B733A343A2254657374223B733A393A226C6173745F6E616D65223B733A343A2254657374223B733A393A2266696C655F70617468223B733A33333A226173736574732F696D616765732F757365722F313438323832393333352E706E67223B7D73657474696E67735F646174617C613A393A7B733A31313A2273657474696E67735F6964223B733A313A2231223B733A31333A2273657474696E67735F6E616D65223B733A34333A224D6F64756C617220426173652041646D696E4C74652047726F63657279204372756420496F6E2041757468223B733A31343A2273657474696E67735F656D61696C223B733A31363A22696E666F406578616D706C652E636F6D223B733A333A22726567223B733A383A223132333435363738223B733A31313A2265737461626C6973686564223B733A31303A22323031392D30392D3136223B733A31363A2273657474696E67735F61646472657373223B733A32313A22446577616E62617A61722C436869747461676F6E67223B733A373A22666F756E646572223B733A393A2252616A696220446173223B733A31363A2273657474696E67735F636F6E74616374223B733A31313A223031383531333334323335223B733A31383A2273657474696E67735F66696C655F70617468223B733A31343A2233643731612D6C6F676F2E706E67223B7D);
INSERT INTO `ci_sessions` VALUES ('9am80hri8mk4l8j8jh5ll11mr64oi3pq', '::1', '1573460377', 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333436303337373B6964656E746974797C733A31333A227465737440746573742E636F6D223B656D61696C7C733A31333A227465737440746573742E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C4E3B6C6173745F636865636B7C693A313537333435333230383B757365725F6C6F676765645F696E7C613A363A7B733A373A22757365725F6964223B733A313A2232223B733A383A22757365726E616D65223B733A343A2274657374223B733A31303A226C6173745F6C6F67696E223B733A343A2232303139223B733A31303A2266697273745F6E616D65223B733A343A2254657374223B733A393A226C6173745F6E616D65223B733A343A2254657374223B733A393A2266696C655F70617468223B733A33333A226173736574732F696D616765732F757365722F313438323832393333352E706E67223B7D73657474696E67735F646174617C613A393A7B733A31313A2273657474696E67735F6964223B733A313A2231223B733A31333A2273657474696E67735F6E616D65223B733A34333A224D6F64756C617220426173652041646D696E4C74652047726F63657279204372756420496F6E2041757468223B733A31343A2273657474696E67735F656D61696C223B733A31363A22696E666F406578616D706C652E636F6D223B733A333A22726567223B733A383A223132333435363738223B733A31313A2265737461626C6973686564223B733A31303A22323031392D30392D3136223B733A31363A2273657474696E67735F61646472657373223B733A32313A22446577616E62617A61722C436869747461676F6E67223B733A373A22666F756E646572223B733A393A2252616A696220446173223B733A31363A2273657474696E67735F636F6E74616374223B733A31313A223031383531333334323335223B733A31383A2273657474696E67735F66696C655F70617468223B733A31343A2233643731612D6C6F676F2E706E67223B7D);
INSERT INTO `ci_sessions` VALUES ('ih84335gg1vd3ana7id36f8hp1fsnr10', '::1', '1573460893', 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333436303839333B6964656E746974797C733A31333A227465737440746573742E636F6D223B656D61696C7C733A31333A227465737440746573742E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C4E3B6C6173745F636865636B7C693A313537333435333230383B757365725F6C6F676765645F696E7C613A363A7B733A373A22757365725F6964223B733A313A2232223B733A383A22757365726E616D65223B733A343A2274657374223B733A31303A226C6173745F6C6F67696E223B733A343A2232303139223B733A31303A2266697273745F6E616D65223B733A343A2254657374223B733A393A226C6173745F6E616D65223B733A343A2254657374223B733A393A2266696C655F70617468223B733A33333A226173736574732F696D616765732F757365722F313438323832393333352E706E67223B7D73657474696E67735F646174617C613A393A7B733A31313A2273657474696E67735F6964223B733A313A2231223B733A31333A2273657474696E67735F6E616D65223B733A34333A224D6F64756C617220426173652041646D696E4C74652047726F63657279204372756420496F6E2041757468223B733A31343A2273657474696E67735F656D61696C223B733A31363A22696E666F406578616D706C652E636F6D223B733A333A22726567223B733A383A223132333435363738223B733A31313A2265737461626C6973686564223B733A31303A22323031392D30392D3136223B733A31363A2273657474696E67735F61646472657373223B733A32313A22446577616E62617A61722C436869747461676F6E67223B733A373A22666F756E646572223B733A393A2252616A696220446173223B733A31363A2273657474696E67735F636F6E74616374223B733A31313A223031383531333334323335223B733A31383A2273657474696E67735F66696C655F70617468223B733A31343A2233643731612D6C6F676F2E706E67223B7D);
INSERT INTO `ci_sessions` VALUES ('npqjlpodf2es75i971je7uq1tapudfb8', '::1', '1573461307', 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333436313330373B6964656E746974797C733A31333A227465737440746573742E636F6D223B656D61696C7C733A31333A227465737440746573742E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C4E3B6C6173745F636865636B7C693A313537333435333230383B757365725F6C6F676765645F696E7C613A363A7B733A373A22757365725F6964223B733A313A2232223B733A383A22757365726E616D65223B733A343A2274657374223B733A31303A226C6173745F6C6F67696E223B733A343A2232303139223B733A31303A2266697273745F6E616D65223B733A343A2254657374223B733A393A226C6173745F6E616D65223B733A343A2254657374223B733A393A2266696C655F70617468223B733A33333A226173736574732F696D616765732F757365722F313438323832393333352E706E67223B7D73657474696E67735F646174617C613A393A7B733A31313A2273657474696E67735F6964223B733A313A2231223B733A31333A2273657474696E67735F6E616D65223B733A34333A224D6F64756C617220426173652041646D696E4C74652047726F63657279204372756420496F6E2041757468223B733A31343A2273657474696E67735F656D61696C223B733A31363A22696E666F406578616D706C652E636F6D223B733A333A22726567223B733A383A223132333435363738223B733A31313A2265737461626C6973686564223B733A31303A22323031392D30392D3136223B733A31363A2273657474696E67735F61646472657373223B733A32313A22446577616E62617A61722C436869747461676F6E67223B733A373A22666F756E646572223B733A393A2252616A696220446173223B733A31363A2273657474696E67735F636F6E74616374223B733A31313A223031383531333334323335223B733A31383A2273657474696E67735F66696C655F70617468223B733A31343A2233643731612D6C6F676F2E706E67223B7D);
INSERT INTO `ci_sessions` VALUES ('qnn7cmfrvtnsti31skmc910fidtck3sa', '::1', '1573462238', 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333436323233383B6964656E746974797C733A31333A227465737440746573742E636F6D223B656D61696C7C733A31333A227465737440746573742E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C4E3B6C6173745F636865636B7C693A313537333435333230383B757365725F6C6F676765645F696E7C613A363A7B733A373A22757365725F6964223B733A313A2232223B733A383A22757365726E616D65223B733A343A2274657374223B733A31303A226C6173745F6C6F67696E223B733A343A2232303139223B733A31303A2266697273745F6E616D65223B733A343A2254657374223B733A393A226C6173745F6E616D65223B733A343A2254657374223B733A393A2266696C655F70617468223B733A33333A226173736574732F696D616765732F757365722F313438323832393333352E706E67223B7D73657474696E67735F646174617C613A393A7B733A31313A2273657474696E67735F6964223B733A313A2231223B733A31333A2273657474696E67735F6E616D65223B733A34333A224D6F64756C617220426173652041646D696E4C74652047726F63657279204372756420496F6E2041757468223B733A31343A2273657474696E67735F656D61696C223B733A31363A22696E666F406578616D706C652E636F6D223B733A333A22726567223B733A383A223132333435363738223B733A31313A2265737461626C6973686564223B733A31303A22323031392D30392D3136223B733A31363A2273657474696E67735F61646472657373223B733A32313A22446577616E62617A61722C436869747461676F6E67223B733A373A22666F756E646572223B733A393A2252616A696220446173223B733A31363A2273657474696E67735F636F6E74616374223B733A31313A223031383531333334323335223B733A31383A2273657474696E67735F66696C655F70617468223B733A31343A2233643731612D6C6F676F2E706E67223B7D6D6573736167657C733A35323A22596F75206D75737420626520616E2061646D696E6973747261746F7220746F20766965772074686520757365727320706167652E223B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('l1isq3jfqip350f4bh1oflveo6v3t6ti', '::1', '1573462748', 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333436323734383B6964656E746974797C733A31333A227465737440746573742E636F6D223B656D61696C7C733A31333A227465737440746573742E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C4E3B6C6173745F636865636B7C693A313537333435333230383B757365725F6C6F676765645F696E7C613A363A7B733A373A22757365725F6964223B733A313A2232223B733A383A22757365726E616D65223B733A343A2274657374223B733A31303A226C6173745F6C6F67696E223B733A343A2232303139223B733A31303A2266697273745F6E616D65223B733A343A2254657374223B733A393A226C6173745F6E616D65223B733A343A2254657374223B733A393A2266696C655F70617468223B733A33333A226173736574732F696D616765732F757365722F313438323832393333352E706E67223B7D73657474696E67735F646174617C613A393A7B733A31313A2273657474696E67735F6964223B733A313A2231223B733A31333A2273657474696E67735F6E616D65223B733A34333A224D6F64756C617220426173652041646D696E4C74652047726F63657279204372756420496F6E2041757468223B733A31343A2273657474696E67735F656D61696C223B733A31363A22696E666F406578616D706C652E636F6D223B733A333A22726567223B733A383A223132333435363738223B733A31313A2265737461626C6973686564223B733A31303A22323031392D30392D3136223B733A31363A2273657474696E67735F61646472657373223B733A32313A22446577616E62617A61722C436869747461676F6E67223B733A373A22666F756E646572223B733A393A2252616A696220446173223B733A31363A2273657474696E67735F636F6E74616374223B733A31313A223031383531333334323335223B733A31383A2273657474696E67735F66696C655F70617468223B733A31343A2233643731612D6C6F676F2E706E67223B7D);
INSERT INTO `ci_sessions` VALUES ('2qc9s7uccoqj998fvetm4teudnm65fje', '::1', '1573464423', 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333436343432333B6964656E746974797C733A31333A227465737440746573742E636F6D223B656D61696C7C733A31333A227465737440746573742E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C4E3B6C6173745F636865636B7C693A313537333435333230383B757365725F6C6F676765645F696E7C613A363A7B733A373A22757365725F6964223B733A313A2232223B733A383A22757365726E616D65223B733A343A2274657374223B733A31303A226C6173745F6C6F67696E223B733A343A2232303139223B733A31303A2266697273745F6E616D65223B733A343A2254657374223B733A393A226C6173745F6E616D65223B733A343A2254657374223B733A393A2266696C655F70617468223B733A33333A226173736574732F696D616765732F757365722F313438323832393333352E706E67223B7D73657474696E67735F646174617C613A393A7B733A31313A2273657474696E67735F6964223B733A313A2231223B733A31333A2273657474696E67735F6E616D65223B733A34333A224D6F64756C617220426173652041646D696E4C74652047726F63657279204372756420496F6E2041757468223B733A31343A2273657474696E67735F656D61696C223B733A31363A22696E666F406578616D706C652E636F6D223B733A333A22726567223B733A383A223132333435363738223B733A31313A2265737461626C6973686564223B733A31303A22323031392D30392D3136223B733A31363A2273657474696E67735F61646472657373223B733A32313A22446577616E62617A61722C436869747461676F6E67223B733A373A22666F756E646572223B733A393A2252616A696220446173223B733A31363A2273657474696E67735F636F6E74616374223B733A31313A223031383531333334323335223B733A31383A2273657474696E67735F66696C655F70617468223B733A31343A2233643731612D6C6F676F2E706E67223B7D);
INSERT INTO `ci_sessions` VALUES ('u07h200hq7rl7cr6lmo7snmlad1jbna5', '::1', '1573464738', 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333436343733383B6964656E746974797C733A31333A227465737440746573742E636F6D223B656D61696C7C733A31333A227465737440746573742E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C4E3B6C6173745F636865636B7C693A313537333435333230383B757365725F6C6F676765645F696E7C613A363A7B733A373A22757365725F6964223B733A313A2232223B733A383A22757365726E616D65223B733A343A2274657374223B733A31303A226C6173745F6C6F67696E223B733A343A2232303139223B733A31303A2266697273745F6E616D65223B733A343A2254657374223B733A393A226C6173745F6E616D65223B733A343A2254657374223B733A393A2266696C655F70617468223B733A33333A226173736574732F696D616765732F757365722F313438323832393333352E706E67223B7D73657474696E67735F646174617C613A393A7B733A31313A2273657474696E67735F6964223B733A313A2231223B733A31333A2273657474696E67735F6E616D65223B733A34333A224D6F64756C617220426173652041646D696E4C74652047726F63657279204372756420496F6E2041757468223B733A31343A2273657474696E67735F656D61696C223B733A31363A22696E666F406578616D706C652E636F6D223B733A333A22726567223B733A383A223132333435363738223B733A31313A2265737461626C6973686564223B733A31303A22323031392D30392D3136223B733A31363A2273657474696E67735F61646472657373223B733A32313A22446577616E62617A61722C436869747461676F6E67223B733A373A22666F756E646572223B733A393A2252616A696220446173223B733A31363A2273657474696E67735F636F6E74616374223B733A31313A223031383531333334323335223B733A31383A2273657474696E67735F66696C655F70617468223B733A31343A2233643731612D6C6F676F2E706E67223B7D);
INSERT INTO `ci_sessions` VALUES ('b7qgn4j7a31inhcgcorrjqco2sbr3p5b', '::1', '1573466259', 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333436363235393B6964656E746974797C733A31333A227465737440746573742E636F6D223B656D61696C7C733A31333A227465737440746573742E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C4E3B6C6173745F636865636B7C693A313537333435333230383B757365725F6C6F676765645F696E7C613A363A7B733A373A22757365725F6964223B733A313A2232223B733A383A22757365726E616D65223B733A343A2274657374223B733A31303A226C6173745F6C6F67696E223B733A343A2232303139223B733A31303A2266697273745F6E616D65223B733A343A2254657374223B733A393A226C6173745F6E616D65223B733A343A2254657374223B733A393A2266696C655F70617468223B733A33333A226173736574732F696D616765732F757365722F313438323832393333352E706E67223B7D73657474696E67735F646174617C613A393A7B733A31313A2273657474696E67735F6964223B733A313A2231223B733A31333A2273657474696E67735F6E616D65223B733A34333A224D6F64756C617220426173652041646D696E4C74652047726F63657279204372756420496F6E2041757468223B733A31343A2273657474696E67735F656D61696C223B733A31363A22696E666F406578616D706C652E636F6D223B733A333A22726567223B733A383A223132333435363738223B733A31313A2265737461626C6973686564223B733A31303A22323031392D30392D3136223B733A31363A2273657474696E67735F61646472657373223B733A32313A22446577616E62617A61722C436869747461676F6E67223B733A373A22666F756E646572223B733A393A2252616A696220446173223B733A31363A2273657474696E67735F636F6E74616374223B733A31313A223031383531333334323335223B733A31383A2273657474696E67735F66696C655F70617468223B733A31343A2233643731612D6C6F676F2E706E67223B7D);
INSERT INTO `ci_sessions` VALUES ('iglibtnkmmbldqa7m0otfdhnvn7fkdme', '::1', '1573466318', 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333436363331383B6964656E746974797C733A31353A2261646D696E4061646D696E2E636F6D223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2231223B6F6C645F6C6173745F6C6F67696E7C733A343A2232303139223B6C6173745F636865636B7C693A313537333436363331383B);
INSERT INTO `ci_sessions` VALUES ('78ekvkkjt7milafca85jqbm93df5qmfo', '::1', '1573466747', 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333436363734373B6D6573736167657C733A34383A223C703E54656D706F726172696C79204C6F636B6564204F75742E202054727920616761696E206C617465722E3C2F703E223B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `ci_sessions` VALUES ('enqucm94cpfm2bi9ln3cvm9s6ep3c4k5', '::1', '1573466866', 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333436363836363B6964656E746974797C733A31393A2261646D696E406C6F63616C686F73742E636F6D223B656D61696C7C733A31393A2261646D696E406C6F63616C686F73742E636F6D223B757365725F69647C733A313A2233223B6F6C645F6C6173745F6C6F67696E7C4E3B6C6173745F636865636B7C693A313537333436363836363B);
INSERT INTO `ci_sessions` VALUES ('3jcfoo4u97p8d3u64ekc988167467q3h', '::1', '1573467262', 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333436373236323B6964656E746974797C733A31393A2261646D696E406C6F63616C686F73742E636F6D223B656D61696C7C733A31393A2261646D696E406C6F63616C686F73742E636F6D223B757365725F69647C733A313A2233223B6F6C645F6C6173745F6C6F67696E7C4E3B6C6173745F636865636B7C693A313537333436363836363B757365725F6C6F676765645F696E7C613A363A7B733A373A22757365725F6964223B733A313A2233223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A31303A226C6173745F6C6F67696E223B733A343A2232303139223B733A31303A2266697273745F6E616D65223B733A353A2241646D696E223B733A393A226C6173745F6E616D65223B733A353A2261646D696E223B733A393A2266696C655F70617468223B4E3B7D73657474696E67735F646174617C613A393A7B733A31313A2273657474696E67735F6964223B733A313A2231223B733A31333A2273657474696E67735F6E616D65223B733A34333A224D6F64756C617220426173652041646D696E4C74652047726F63657279204372756420496F6E2041757468223B733A31343A2273657474696E67735F656D61696C223B733A31363A22696E666F406578616D706C652E636F6D223B733A333A22726567223B733A383A223132333435363738223B733A31313A2265737461626C6973686564223B733A31303A22323031392D30392D3136223B733A31363A2273657474696E67735F61646472657373223B733A32313A22446577616E62617A61722C436869747461676F6E67223B733A373A22666F756E646572223B733A393A2252616A696220446173223B733A31363A2273657474696E67735F636F6E74616374223B733A31313A223031383531333334323335223B733A31383A2273657474696E67735F66696C655F70617468223B733A31343A2233643731612D6C6F676F2E706E67223B7D);
INSERT INTO `ci_sessions` VALUES ('8hjqv5djfopvo1r9p09j6gclosgifkio', '::1', '1573467745', 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333436373734353B6964656E746974797C733A31393A2261646D696E406C6F63616C686F73742E636F6D223B656D61696C7C733A31393A2261646D696E406C6F63616C686F73742E636F6D223B757365725F69647C733A313A2233223B6F6C645F6C6173745F6C6F67696E7C4E3B6C6173745F636865636B7C693A313537333436363836363B757365725F6C6F676765645F696E7C613A363A7B733A373A22757365725F6964223B733A313A2233223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A31303A226C6173745F6C6F67696E223B733A343A2232303139223B733A31303A2266697273745F6E616D65223B733A353A2241646D696E223B733A393A226C6173745F6E616D65223B733A353A2261646D696E223B733A393A2266696C655F70617468223B4E3B7D73657474696E67735F646174617C613A393A7B733A31313A2273657474696E67735F6964223B733A313A2231223B733A31333A2273657474696E67735F6E616D65223B733A34333A224D6F64756C617220426173652041646D696E4C74652047726F63657279204372756420496F6E2041757468223B733A31343A2273657474696E67735F656D61696C223B733A31363A22696E666F406578616D706C652E636F6D223B733A333A22726567223B733A383A223132333435363738223B733A31313A2265737461626C6973686564223B733A31303A22323031392D30392D3136223B733A31363A2273657474696E67735F61646472657373223B733A32313A22446577616E62617A61722C436869747461676F6E67223B733A373A22666F756E646572223B733A393A2252616A696220446173223B733A31363A2273657474696E67735F636F6E74616374223B733A31313A223031383531333334323335223B733A31383A2273657474696E67735F66696C655F70617468223B733A31343A2233643731612D6C6F676F2E706E67223B7D);
INSERT INTO `ci_sessions` VALUES ('7lf4duseet804vumsf44i7hamfi2v5na', '::1', '1573467937', 0x5F5F63695F6C6173745F726567656E65726174657C693A313537333436373734353B6964656E746974797C733A31393A2261646D696E406C6F63616C686F73742E636F6D223B656D61696C7C733A31393A2261646D696E406C6F63616C686F73742E636F6D223B757365725F69647C733A313A2233223B6F6C645F6C6173745F6C6F67696E7C4E3B6C6173745F636865636B7C693A313537333436363836363B757365725F6C6F676765645F696E7C613A363A7B733A373A22757365725F6964223B733A313A2233223B733A383A22757365726E616D65223B733A353A2261646D696E223B733A31303A226C6173745F6C6F67696E223B733A343A2232303139223B733A31303A2266697273745F6E616D65223B733A353A2241646D696E223B733A393A226C6173745F6E616D65223B733A353A2261646D696E223B733A393A2266696C655F70617468223B4E3B7D73657474696E67735F646174617C613A393A7B733A31313A2273657474696E67735F6964223B733A313A2231223B733A31333A2273657474696E67735F6E616D65223B733A34333A224D6F64756C617220426173652041646D696E4C74652047726F63657279204372756420496F6E2041757468223B733A31343A2273657474696E67735F656D61696C223B733A31363A22696E666F406578616D706C652E636F6D223B733A333A22726567223B733A383A223132333435363738223B733A31313A2265737461626C6973686564223B733A31303A22323031392D30392D3136223B733A31363A2273657474696E67735F61646472657373223B733A32313A22446577616E62617A61722C436869747461676F6E67223B733A373A22666F756E646572223B733A393A2252616A696220446173223B733A31363A2273657474696E67735F636F6E74616374223B733A31313A223031383531333334323335223B733A31383A2273657474696E67735F66696C655F70617468223B733A31343A2233643731612D6C6F676F2E706E67223B7D);

-- ----------------------------
-- Table structure for current_stock
-- ----------------------------
DROP TABLE IF EXISTS `current_stock`;
CREATE TABLE `current_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(10) NOT NULL,
  `available_stock` int(10) NOT NULL,
  `date` date DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of current_stock
-- ----------------------------

-- ----------------------------
-- Table structure for designations
-- ----------------------------
DROP TABLE IF EXISTS `designations`;
CREATE TABLE `designations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `grade` int(10) DEFAULT NULL,
  `rank` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_active` int(2) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of designations
-- ----------------------------

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `contact_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_active` int(2) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of employees
-- ----------------------------

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES ('1', 'admin', 'Administrator');
INSERT INTO `groups` VALUES ('2', 'members', 'General User');
INSERT INTO `groups` VALUES ('3', 'Manager', 'Manager');

-- ----------------------------
-- Table structure for login_attempts
-- ----------------------------
DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_attempts
-- ----------------------------
INSERT INTO `login_attempts` VALUES ('10', '127.0.0.1', '12121', '1614791920');
INSERT INTO `login_attempts` VALUES ('11', '127.0.0.1', 'admin@mocat.com', '1614793983');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('20171017120422');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `section_id` int(10) NOT NULL,
  `order_date` date DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `go_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_active` int(2) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for partners
-- ----------------------------
DROP TABLE IF EXISTS `partners`;
CREATE TABLE `partners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_BN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `partner_head_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `partner_head_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `partner_head_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of partners
-- ----------------------------
INSERT INTO `partners` VALUES ('1', 'মহিলা ও শিশু বিষয়ক মন্ত্রণালয়', 'মহিলা ও শিশু বিষয়ক মন্ত্রণালয়', null, null, null, null, '1');
INSERT INTO `partners` VALUES ('2', 'মহিলা বিষয়ক অধিদপ্তর', 'মহিলা বিষয়ক অধিদপ্তর', null, null, null, null, '1');
INSERT INTO `partners` VALUES ('3', 'জাতীয় মহিলা সংস্থা', 'জাতীয় মহিলা সংস্থা', null, null, null, null, '1');
INSERT INTO `partners` VALUES ('4', 'স্বর্ণ কিশোরী নেটওয়ার্ক ফাউন্ডেশন', 'স্বর্ণ কিশোরী নেটওয়ার্ক ফাউন্ডেশন', null, null, null, null, '1');
INSERT INTO `partners` VALUES ('5', 'বাংলাদেশ শিশু একাডেমী', 'বাংলাদেশ শিশু একাডেমী', null, null, null, null, '1');
INSERT INTO `partners` VALUES ('6', 'বি ডব্লিউ সি সি আই', 'বি ডব্লিউ সি সি আই', null, null, null, null, '1');
INSERT INTO `partners` VALUES ('7', 'কেয়ার ফর মাদার এন্ড চিলড্রেন ফাউন্ডেশন', 'কেয়ার ফর মাদার এন্ড চিলড্রেন ফাউন্ডেশন', null, null, null, null, '1');
INSERT INTO `partners` VALUES ('8', 'আইসিএইচড', 'আইসিএইচডি', '', '', '', '', '1');
INSERT INTO `partners` VALUES ('9', 'জয়িতা ফাউন্ডেশন', 'জয়িতা ফাউন্ডেশন', '', '', '', '', '1');
INSERT INTO `partners` VALUES ('10', 'স্পন্দন-বি', 'স্পন্দন-বি', '', '', '', '', '1');
INSERT INTO `partners` VALUES ('11', 'সুচনা ফাউন্ডেশন', 'সুচনা ফাউন্ডেশন', '', '', '', '', '1');
INSERT INTO `partners` VALUES ('12', 'এফপিএবি', 'এফপিএবি', '', '', '', '', '1');
INSERT INTO `partners` VALUES ('13', 'এআরপি', 'এআরপি', '', '', '', '', '1');
INSERT INTO `partners` VALUES ('14', 'এস এম ই ফাউন্ডেশন', 'এস এম ই ফাউন্ডেশন', '', '', '', '', '1');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `model` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stock_available` int(20) DEFAULT NULL,
  `uom_id` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('2', 'My laptop', '6', '2', 'উন্নতমানের', '234', 'red', '0', null, '2019-11-26 15:51:56', '3', '2019-11-28 12:56:45', '3', null, '1');
INSERT INTO `products` VALUES ('3', 'Mouse', '5', '3', 'উন্নতমানের', '2.3', 'red', '0', null, '2019-12-01 15:13:35', '3', '2019-12-01 15:13:35', '3', null, '1');
INSERT INTO `products` VALUES ('4', 'Keyboard', '5', '3', 'উন্নতমানের', '4', 'red', '0', null, '2019-12-01 15:13:46', '3', '2019-12-01 15:13:46', '3', null, '1');
INSERT INTO `products` VALUES ('5', 'Model', '5', '2', 'উন্নতমানের', '4', 'red', '0', null, '2019-12-01 15:13:53', '3', '2019-12-01 15:13:53', '3', null, '1');
INSERT INTO `products` VALUES ('6', 'সাবান', '6', '3', 'উন্নতমানের', '1', 'white', '0', null, '2019-12-02 15:04:40', '3', '2019-12-02 15:05:33', '3', null, '1');
INSERT INTO `products` VALUES ('7', 'ডাষ্টার ক্লথ (৩২x১৮ ইঞ্চি)', '6', '0', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('8', 'পেন্সিল ব্যাটারী (AA সাইজ)', '6', '0', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('9', 'রিমোট ব্যাটারী  (AAA সাইজ)', '6', '0', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('10', 'পাঞ্চিং মেশিন (এক ছিদ্র)', '6', '0', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('11', 'পাঞ্চিং মেশিন (দুই ছিদ্র)', '6', '0', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('12', 'পেপার ওয়েট (পাথরের চারকোনা)', '6', '0', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('13', 'পেন্সিল কাটার (শার্পনার)', '6', '0', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('14', 'কাঠ পেন্সিল ', '6', '0', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('15', 'ঈরেজার (রাবার)', '6', '0', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('16', 'জেমস্ ক্লীপ (রংগিন প্লাষ্টিক কোডেড)', '6', '0', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('17', 'লিকুইড সোপ (স্প্রে সহ)', '6', '0', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('18', 'হুইল সাবান', '6', '0', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('19', 'লাক্স সাবান (৭৫ গ্রাম)', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('20', 'ভীম বার (৭৫০ গ্রাম)', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('21', 'হারপিক (৫০০ এমএল কৌটা)', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('22', 'সেভলন (১১২ এমএল)', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('23', 'গ্লাস ক্লিনার', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('24', 'কার্টুন টেপ', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('25', 'ফাইল বাধা ফিতা (৪৫ মিটার রোল)', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('26', 'খাকি খাম (ছোট সাইজ)', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('27', 'খাকি খাম (এ-ফোর সাইজ)', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('28', 'খাকি খাম (ফাইল সাইজ)', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('29', 'পেপার বাস্কেট (আরএফএল)', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('30', 'স্কচ টেপ ২.৫ ইঞ্চি', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('31', 'প্লাষ্টিক রিং গার্ড ফাইল (এ-ফোর)', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('32', 'মোমবাতি (মোটা)', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('33', 'গালা (বাক্স)', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('34', 'পেপার ক্লিপ বড় সাইজ', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('35', 'বিবরণ', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('36', 'পেপার ক্লিপ ছোট সাইজ', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('37', 'ফাইল কভার (মন্ত্রণালয়ের নামসহ)', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('38', 'রিমোট কলিং বেল (উন্নতমানের)', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('39', 'ক্যালকুলেটর (১২ ডিজিট)', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('40', 'দেয়াল ঘড়ি (উন্নতমানের)', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('41', 'বড় তোয়ালে (সাইজ ২৭x৫৪)', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('42', 'ছোট তোয়ালে (সাইজ ২১x৩৬)', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('43', 'কাপ', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('44', 'পিরিজ', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('45', 'হাফ প্লেট', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('46', 'ফুল প্লেট', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('47', 'গ্লাস', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('48', 'মগ', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('49', 'কাটা চামুচ', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('50', 'চা চামুচ', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('51', 'কম্পিউটার টোনার ', '6', '29', 'উন্নতমানের', null, null, '0', null, '2020-01-12 11:28:02', null, '2020-01-12 11:28:02', null, null, '1');
INSERT INTO `products` VALUES ('52', 'কম্পিউটার টোনার (ক্যানন ৩০৮)', '7', '10', 'ক্যানন', '', 'কাল', '0', null, '2020-01-12 11:28:02', null, '2020-02-16 19:54:42', '3', null, '1');
INSERT INTO `products` VALUES ('53', 'ফটোকপি টোনার‌ (ক্যানন-২৫২০)', '7', '10', 'ক্যানন', '', 'কাল', '0', null, '2020-01-12 11:28:02', null, '2020-02-16 19:54:27', '3', null, '1');
INSERT INTO `products` VALUES ('54', 'পেন ড্রাইভ (৩২ জিবি)', '7', '29', 'HP / Transcend', '', '', '0', null, '2020-01-12 11:28:02', null, '2020-02-16 19:49:52', '3', null, '1');
INSERT INTO `products` VALUES ('55', 'কি বোর্ড', '7', '29', 'A4 Tech', '', '', '0', null, '2020-01-12 11:28:02', null, '2020-02-16 19:53:50', '3', null, '1');
INSERT INTO `products` VALUES ('56', 'মাউস', '7', '29', 'Logitech / A4 Tech', '', '', '0', null, '2020-01-12 11:28:02', null, '2020-02-16 19:51:54', '3', null, '1');
INSERT INTO `products` VALUES ('57', 'মাউস প্যাড', '7', '29', 'উন্নতমানের', '', '', '0', null, '2020-01-12 11:28:02', null, '2020-02-09 16:56:17', '3', null, '1');
INSERT INTO `products` VALUES ('58', 'মাল্টিপ্লাগ (থ্রি-পিন, ফাইভওয়ে, ১০ মিটার তারসহ)', '7', '29', 'Many', '', '', '0', null, '2020-01-12 11:28:02', null, '2020-02-16 19:53:22', '3', null, '1');
INSERT INTO `products` VALUES ('59', 'টিস্যু পেপার', '6', '13', 'bosundhara', '', '', '0', null, '2020-01-12 11:29:51', '3', '2020-01-12 11:29:51', '3', null, '1');
INSERT INTO `products` VALUES ('68', 'অফসেট পেপার (এ-ফোর)', '14', '9', 'পেপার ওয়ান/ডাবল এ', 'এ-ফোর', 'সাদা', '0', null, '2020-02-06 00:26:31', '3', '2020-02-16 19:47:46', '3', null, '1');
INSERT INTO `products` VALUES ('69', 'অফসেট পেপার (এ-সিক্স)', '14', '9', 'পেপার ওয়ান/ডাবল এ', 'এ-সিক্স', 'সাদা', '0', null, '2020-02-06 00:27:45', '3', '2020-02-16 19:47:21', '3', null, '1');
INSERT INTO `products` VALUES ('70', 'নোট শীট', '14', '9', 'উন্নতমানের', 'এ-ফোর', 'সাদা', '0', null, '2020-02-06 00:29:58', '3', '2020-02-06 00:29:58', '3', null, '1');
INSERT INTO `products` VALUES ('71', 'ক্লীপ ফোল্ডার', '14', '5', 'উন্নতমানের', 'এ-ফোর', 'বিভিন্ন কালার', '0', null, '2020-02-06 00:31:42', '3', '2020-02-06 00:31:42', '3', null, '1');
INSERT INTO `products` VALUES ('72', 'ট্রান্সপারেন্ট ফোল্ডার', '14', '9', 'উন্নতমানের', 'এ-ফোর', 'সাদা', '0', null, '2020-02-06 00:32:49', '3', '2020-02-06 00:32:49', '3', null, '1');
INSERT INTO `products` VALUES ('73', 'কাচি (কাগজ কাটা)', '14', '9', 'স্টীল', '৯ ইঞ্চি', 'কাল', '0', null, '2020-02-06 00:34:12', '3', '2020-02-16 19:55:42', '3', null, '1');
INSERT INTO `products` VALUES ('74', 'ছুড়ি (কাগজ কাটা)', '14', '9', 'উন্নতমানের', '৯ ইঞ্চি', 'হলুদ/কাল', '0', null, '2020-02-06 00:35:41', '3', '2020-02-06 00:35:41', '3', null, '1');
INSERT INTO `products` VALUES ('75', 'সাদা ফ্লুইড', '14', '9', 'উন্নতমানের', '৮.৫ গ্রাম', 'সাদা', '0', null, '2020-02-06 00:36:57', '3', '2020-02-06 00:36:57', '3', null, '1');
INSERT INTO `products` VALUES ('76', 'কার সেন্ট (ক্যালটিনা)', '14', '9', 'জাপান', '', 'বিভিন্ন কালার', '0', null, '2020-02-06 00:39:19', '3', '2020-02-06 00:39:19', '3', null, '1');
INSERT INTO `products` VALUES ('77', 'কার সেন্ট (কলাম)', '14', '10', 'উন্নতমানের', '', '', '0', null, '2020-02-06 00:40:44', '3', '2020-02-06 00:40:44', '3', null, '1');
INSERT INTO `products` VALUES ('78', 'কার সেম্পু', '14', '9', 'উন্নতমানের', '', '', '0', null, '2020-02-06 00:41:41', '3', '2020-02-06 00:41:41', '3', null, '1');
INSERT INTO `products` VALUES ('79', 'এয়ার ফ্রেশনার', '14', '9', 'এসিআই / Fay', '৩০০ মিলি', 'বিভিন্ন কালার', '0', null, '2020-02-06 00:42:51', '3', '2020-02-17 10:19:32', '3', null, '1');
INSERT INTO `products` VALUES ('80', 'এ্যারোসোল', '14', '12', 'এসিআই', '৪৭৫ মিলি', '', '0', null, '2020-02-06 00:44:13', '3', '2020-02-20 11:15:24', '3', null, '1');
INSERT INTO `products` VALUES ('81', 'টয়লেট পেপার', '14', '13', 'বসুন্ধরা', '', 'সাদা', '0', null, '2020-02-06 00:45:02', '3', '2020-02-16 19:57:11', '3', null, '1');
INSERT INTO `products` VALUES ('82', 'গ্লু-স্টিক (গাম)', '14', '14', 'উন্নতমানের', '', '', '0', null, '2020-02-06 00:46:03', '3', '2020-02-06 00:46:03', '3', null, '1');
INSERT INTO `products` VALUES ('83', 'পেন ষ্ট্যান্ড', '14', '9', 'উন্নতমানের', '', '', '0', null, '2020-02-06 00:46:55', '3', '2020-02-06 00:46:55', '3', null, '1');
INSERT INTO `products` VALUES ('84', 'পেন পট (কলমদানি)', '14', '9', 'উন্নতমানের', '', 'বিভিন্ন রংগের', '0', null, '2020-02-06 00:47:45', '3', '2020-02-16 20:54:19', '3', null, '1');
INSERT INTO `products` VALUES ('85', 'কলম (পাইলট ভি-ফাইভ/সেভেন)', '14', '10', 'উন্নতমানের', '', 'কাল/লাল/নীল/সবু', '0', null, '2020-02-06 00:49:01', '3', '2020-02-06 00:49:01', '3', null, '1');
INSERT INTO `products` VALUES ('86', 'জেল পেন / সাইন পেন', '14', '9', 'উন্নতমানের', '', 'কাল', '0', null, '2020-02-06 00:50:18', '3', '2020-02-16 20:35:21', '3', null, '1');
INSERT INTO `products` VALUES ('87', 'ম্যাটাডোর বল পেন', '14', '9', 'উন্নতমানের', '', 'কাল', '0', null, '2020-02-06 00:51:03', '3', '2020-02-06 00:51:03', '3', null, '1');
INSERT INTO `products` VALUES ('88', 'বল পেন / কলম (লাল)', '14', '9', 'উন্নতমানের', '', 'লাল', '0', null, '2020-02-06 00:52:53', '3', '2020-02-16 20:54:01', '3', null, '1');
INSERT INTO `products` VALUES ('89', 'বল পেন / কলম (কাল)', '14', '9', 'উন্নতমানের', '', 'কাল', '0', null, '2020-02-06 00:54:06', '3', '2020-02-16 20:53:45', '3', null, '1');
INSERT INTO `products` VALUES ('90', 'স্ট্যাম্প প্যাড', '14', '15', 'উন্নতমানের', '(১০৬x৬৭ এমএম)', '', '0', null, '2020-02-06 00:55:53', '3', '2020-02-06 00:55:53', '3', null, '1');
INSERT INTO `products` VALUES ('91', 'স্কেল (ষ্টিলের)', '14', '9', 'উন্নতমানের', '', '', '0', null, '2020-02-06 00:56:42', '3', '2020-02-06 00:56:42', '3', null, '1');
INSERT INTO `products` VALUES ('92', 'মার্কার পেন', '14', '16', 'রেডলীফ ৩০৩, জাপান', '', 'হলুদ, সবুজ, লাল', '0', null, '2020-02-06 00:57:50', '3', '2020-02-16 19:58:01', '3', null, '1');
INSERT INTO `products` VALUES ('93', 'স্টেপলার মেশিন (বড় সাইজ)', '14', '19', 'উন্নতমানের', 'বড় সাইজ', '', '0', null, '2020-02-06 00:59:04', '3', '2020-02-06 00:59:04', '3', null, '1');
INSERT INTO `products` VALUES ('94', 'স্টেপলার মেশিন (ছোট সাইজ)', '14', '18', 'উন্নতমানের', 'ছোট সাইজ', '', '0', null, '2020-02-06 01:00:02', '3', '2020-02-06 01:00:02', '3', null, '1');
INSERT INTO `products` VALUES ('95', 'স্টেপলার পিন (বড় সাইজ)', '14', '19', 'উন্নতমানের', 'বড় সাইজ', '', '0', null, '2020-02-06 01:01:04', '3', '2020-02-06 01:01:04', '3', null, '1');
INSERT INTO `products` VALUES ('96', 'স্টেপলার পিন (ছোট সাইজ)', '14', '19', 'উন্নতমানের', 'ছোট সাইজ', '', '0', null, '2020-02-06 01:01:47', '3', '2020-02-06 01:01:47', '3', null, '1');
INSERT INTO `products` VALUES ('97', 'পিন রিমোভার', '14', '9', 'উন্নতমানের', '', '', '0', null, '2020-02-06 01:02:40', '3', '2020-02-06 01:02:40', '3', null, '1');
INSERT INTO `products` VALUES ('98', 'ডাষ্টার ক্লথ (৩২x১৮ ইঞ্চি)', '14', '9', 'উন্নতমানের', 'বড়', 'সাদা', '0', null, '2020-02-06 01:03:39', '3', '2020-02-16 20:39:47', '3', null, '1');
INSERT INTO `products` VALUES ('99', 'পেন্সিল ব্যাটারী (AA)', '14', '21', 'উন্নতমানের', 'AA', '', '0', null, '2020-02-06 01:04:52', '3', '2020-02-06 01:04:52', '3', null, '1');
INSERT INTO `products` VALUES ('100', 'পেন্সিল ব্যাটারী (AAA)', '14', '21', 'উন্নতমানের', 'AAA ', '', '0', null, '2020-02-06 01:05:32', '3', '2020-02-06 01:05:32', '3', null, '1');
INSERT INTO `products` VALUES ('101', 'পাঞ্চিং মেশিন (এক ছিদ্র)', '14', '22', 'উন্নতমানের', '', 'কাল/সিলভার', '0', null, '2020-02-06 01:06:45', '3', '2020-02-06 01:06:45', '3', null, '1');
INSERT INTO `products` VALUES ('102', 'পাঞ্চিং মেশিন (দুই ছিদ্র)', '14', '22', 'উন্নতমানের', '', 'কাল / সিলভার', '0', null, '2020-02-06 01:07:29', '3', '2020-02-06 01:07:29', '3', null, '1');
INSERT INTO `products` VALUES ('103', 'পেপার ওয়েট (চার কোনা)', '14', '9', 'উন্নতমানের', '', '', '0', null, '2020-02-06 01:10:34', '3', '2020-02-06 01:10:34', '3', null, '1');
INSERT INTO `products` VALUES ('104', 'পেন্সিল কার্টার (শার্পনার)', '14', '23', 'উন্নতমানের', '', '', '0', null, '2020-02-06 01:11:28', '3', '2020-02-06 01:11:28', '3', null, '1');
INSERT INTO `products` VALUES ('105', 'কাঠ পেন্সিল', '14', '24', 'উন্নতমানের', '', '', '0', null, '2020-02-06 01:12:15', '3', '2020-02-06 01:12:15', '3', null, '1');
INSERT INTO `products` VALUES ('106', 'ঈরেজার (রাবার)', '14', '9', 'উন্নতমানের', '', '', '0', null, '2020-02-06 01:13:17', '3', '2020-02-06 01:13:17', '3', null, '1');
INSERT INTO `products` VALUES ('107', 'জেমস ক্লিপ (প্লাষ্টিক কোডেড)', '14', '25', 'উন্নতমানের', '', 'রংগিন', '0', null, '2020-02-06 01:14:35', '3', '2020-02-06 01:15:01', '3', null, '1');
INSERT INTO `products` VALUES ('108', 'হুইল সাবান', '14', '27', 'উন্নতমানের', '', '', '0', null, '2020-02-06 01:15:58', '3', '2020-02-06 01:15:58', '3', null, '1');
INSERT INTO `products` VALUES ('109', 'লিকুইড সোপ (স্প্রে সহ)', '14', '26', 'উন্নতমানের', '', '', '0', null, '2020-02-06 01:16:42', '3', '2020-02-06 21:17:10', '3', null, '1');
INSERT INTO `products` VALUES ('110', 'লাক্স সাবান', '14', '27', 'উন্নতমানের', '৭৫ গ্রাম', '', '0', null, '2020-02-06 01:17:29', '3', '2020-02-06 01:17:29', '3', null, '1');
INSERT INTO `products` VALUES ('111', 'ভীম বার', '14', '27', 'উন্নতমানের', '৭৫০ গ্রাম', '', '0', null, '2020-02-06 20:48:30', '3', '2020-02-06 20:48:30', '3', null, '1');
INSERT INTO `products` VALUES ('112', 'হারপিক', '14', '27', 'উন্নতমানের', '৫০০ এমএল', '', '0', null, '2020-02-06 20:49:21', '3', '2020-02-06 20:49:21', '3', null, '1');
INSERT INTO `products` VALUES ('113', 'সেভলন', '14', '9', 'উন্নতমানের', '১১২ এমএল', '', '0', null, '2020-02-06 20:50:17', '3', '2020-02-06 20:50:17', '3', null, '1');
INSERT INTO `products` VALUES ('114', 'কার্টুন টেপ', '14', '9', 'উন্নতমানের', '', '', '0', null, '2020-02-06 20:53:53', '3', '2020-02-06 20:53:53', '3', null, '1');
INSERT INTO `products` VALUES ('115', 'ফাইল বাধা ফিতা', '14', '9', 'উন্নতমানের', '৪৫ মিটার রোল', '', '0', null, '2020-02-06 20:54:44', '3', '2020-02-06 20:55:15', '3', null, '1');
INSERT INTO `products` VALUES ('116', 'খাকি খাম (ছোট সাইজ)', '14', '33', 'উন্নতমানের', 'ছোট', 'খাকি', '0', null, '2020-02-06 20:56:12', '3', '2020-02-06 20:56:12', '3', null, '1');
INSERT INTO `products` VALUES ('117', 'খাকি খাম  (এ-ফোর)', '14', '33', 'উন্নতমানের', 'এ-ফোর', 'খাকি', '0', null, '2020-02-06 20:57:00', '3', '2020-02-06 20:57:00', '3', null, '1');
INSERT INTO `products` VALUES ('118', 'খাকি খাম (ফাইল সাইজ)', '14', '33', 'উন্নতমানের', 'ফাইল সাইজ', 'খাকি', '0', null, '2020-02-06 20:57:37', '3', '2020-02-06 20:57:37', '3', null, '1');
INSERT INTO `products` VALUES ('119', 'পেপার বাস্কেট', '14', '9', 'আরএফএল', 'মাঝারি', 'বিভিন্ন কালার', '0', null, '2020-02-06 20:59:01', '3', '2020-02-06 20:59:01', '3', null, '1');
INSERT INTO `products` VALUES ('120', 'স্কচ টেপ (ছোট সাইজ)', '14', '27', 'উন্নতমানের', 'ছোট সাইজ', 'সাদা', '0', null, '2020-02-06 21:00:03', '3', '2020-02-06 21:00:03', '3', null, '1');
INSERT INTO `products` VALUES ('121', 'প্লাষ্টিক রিং গার্ড ফাইল', '14', '27', 'উন্নতমানের', 'এ-ফোর', 'বিভিন্ন কালার', '0', null, '2020-02-06 21:01:09', '3', '2020-02-06 21:01:09', '3', null, '1');
INSERT INTO `products` VALUES ('122', 'মোমবাতি ( মোটা )', '14', '27', 'উন্নতমানের', 'বড়', '', '0', null, '2020-02-06 21:02:04', '3', '2020-02-06 21:02:04', '3', null, '1');
INSERT INTO `products` VALUES ('123', 'গালা', '14', '27', 'উন্নতমানের', '', '', '0', null, '2020-02-06 21:02:36', '3', '2020-02-06 21:02:36', '3', null, '1');
INSERT INTO `products` VALUES ('124', 'পেপার ক্লিপ (হার্ড ক্লিপ) ২.৫ ইঞ্চি', '14', '27', 'উন্নতমানের', '২.০ ইঞ্চি', 'কাল', '0', null, '2020-02-06 21:03:37', '3', '2020-02-16 19:37:18', '3', null, '1');
INSERT INTO `products` VALUES ('125', 'পেপার ক্লিপ (হার্ড ক্লিপ) ১.৫ ইঞ্চি', '14', '27', 'উন্নতমানের', '১.৫ ইঞ্চি', 'কাল', '0', null, '2020-02-06 21:05:26', '3', '2020-02-16 19:37:03', '3', null, '1');
INSERT INTO `products` VALUES ('126', 'পেপার ক্লিপ (হার্ড ক্লিপ) ১ ইঞ্চি', '14', '27', 'উন্নতমানের', '১ ইঞ্চি', 'কাল', '0', null, '2020-02-06 21:06:16', '3', '2020-02-16 19:36:49', '3', null, '1');
INSERT INTO `products` VALUES ('127', 'ফাইল কভার (খাকি)', '14', '27', 'উন্নতমানের', 'এ-সিক্স', 'খাকি', '0', null, '2020-02-06 21:07:34', '3', '2020-02-06 21:07:34', '3', null, '1');
INSERT INTO `products` VALUES ('128', 'ফাইল কভার (সভার জন্য)', '14', '33', 'উন্নতমানের', 'এ-ফোর', 'রংগিন', '0', null, '2020-02-06 21:08:46', '3', '2020-02-06 21:08:46', '3', null, '1');
INSERT INTO `products` VALUES ('129', 'রিমোট কলিং বেল', '14', '9', 'উন্নতমানের', '', '', '0', null, '2020-02-06 21:09:33', '3', '2020-02-06 21:09:33', '3', null, '1');
INSERT INTO `products` VALUES ('130', 'ক্যালকুলেটর', '14', '9', 'ক্যাসিও', 'মাঝারি', 'কাল', '0', null, '2020-02-06 21:10:23', '3', '2020-02-06 21:12:31', '3', null, '1');
INSERT INTO `products` VALUES ('131', 'দেয়াল ঘড়ি', '14', '9', 'সিটিসান', 'মা‌ঝারি', '', '0', null, '2020-02-06 21:11:28', '3', '2020-02-06 21:12:11', '3', null, '1');
INSERT INTO `products` VALUES ('132', 'তোয়ালে (বড়)', '14', '9', 'উন্নতমানের', 'বড়', '', '0', null, '2020-02-06 21:13:53', '3', '2020-02-16 16:29:54', '3', null, '1');
INSERT INTO `products` VALUES ('133', 'তোয়ালে (বড়) ভিআইপি', '14', '9', 'উন্নতমানের', 'বড়', '', '0', null, '2020-02-06 21:14:43', '3', '2020-02-06 21:14:43', '3', null, '1');
INSERT INTO `products` VALUES ('134', 'তোয়ালে (ছোট)', '14', '9', 'উন্নতমানের', 'ছোট', '', '0', null, '2020-02-06 21:15:14', '3', '2020-02-16 16:30:12', '3', null, '1');
INSERT INTO `products` VALUES ('135', 'তোয়ালে (ছোট) ভিআইপি', '14', '9', 'উন্নতমানের', 'ছোট', '', '0', null, '2020-02-06 21:15:55', '3', '2020-02-06 21:15:55', '3', null, '1');
INSERT INTO `products` VALUES ('136', 'কম্পিউটার টোনার (ক্যানন ৩২৪)', '7', '10', 'অরিজিনাল', '', 'কাল', '0', null, '2020-02-06 21:22:28', '3', '2020-02-20 11:14:46', '3', null, '1');
INSERT INTO `products` VALUES ('137', 'কম্পিউটার টোনার (ক্যানন ৩২৫)', '7', '10', 'অরিজিনাল', '', 'কাল', '0', null, '2020-02-06 21:23:28', '3', '2020-02-20 11:14:29', '3', null, '1');
INSERT INTO `products` VALUES ('138', 'কম্পিউটার টোনার (এইচপি-৮৫এ)', '7', '2', 'অরিজিনাল', '', 'কাল', '0', null, '2020-02-06 21:27:17', '3', '2020-02-09 16:50:59', '3', null, '1');
INSERT INTO `products` VALUES ('139', 'কম্পিউটার টোনার (এইচপি-২৬এ)', '7', '2', 'অরিজিনাল', '', 'কাল', '0', null, '2020-02-06 21:28:55', '3', '2020-02-09 16:51:13', '3', null, '1');
INSERT INTO `products` VALUES ('140', 'কম্পিউটার টোনার (এইচপি-০৫এ)', '7', '36', 'অরিজিনাল', '', 'কাল', '0', null, '2020-02-06 21:30:56', '3', '2020-02-09 16:51:38', '3', null, '1');
INSERT INTO `products` VALUES ('141', 'কম্পিউটার টোনার (এইচপি-১৫এ)', '7', '36', 'অরিজিনাল', '', 'কাল', '0', null, '2020-02-06 21:31:36', '3', '2020-02-16 11:44:01', '3', null, '1');
INSERT INTO `products` VALUES ('142', 'কম্পিউটার টোনার (এইচপি-৫৩এ)', '7', '36', 'অরিজিনাল', '', 'কাল', '0', null, '2020-02-06 21:32:27', '3', '2020-02-09 16:52:31', '3', null, '1');
INSERT INTO `products` VALUES ('143', 'কম্পিউটার টোনার (এইচপি-৫৫এ)', '7', '36', 'অরিজিনাল', '', 'কাল', '0', null, '2020-02-06 21:33:10', '3', '2020-02-09 16:52:44', '3', null, '1');
INSERT INTO `products` VALUES ('144', 'কম্পিউটার টোনার (এইচপি-৮৩এ)', '7', '36', 'অরিজিনাল', '', 'কাল', '0', null, '2020-02-06 21:33:53', '3', '2020-02-09 16:53:06', '3', null, '1');
INSERT INTO `products` VALUES ('145', 'ফটোকপি টোনার(টসিবা-২৫৭)', '7', '10', 'অরিজিনাল', '', 'কাল', '0', null, '2020-02-06 21:34:57', '3', '2020-02-09 16:54:31', '3', null, '1');
INSERT INTO `products` VALUES ('146', 'ফটোকপি টোনার (টশিবা-২৫০৬)', '7', '10', 'অরিজিনাল', '', 'কাল', '0', null, '2020-02-06 21:35:47', '3', '2020-02-16 11:46:54', '3', null, '1');
INSERT INTO `products` VALUES ('147', 'ইউএসবি পোর্ট', '7', '9', 'উন্নতমানের', '', '', '0', null, '2020-02-06 21:37:49', '3', '2020-02-06 21:37:49', '3', null, '1');
INSERT INTO `products` VALUES ('148', 'ফুল প্লেট', '10', '27', 'মুন্নু/সাইনপুকুর', 'ফুল প্লেট', '', '0', null, '2020-02-06 23:24:28', '3', '2020-02-06 23:24:28', '3', null, '1');
INSERT INTO `products` VALUES ('149', 'হাফ প্লেট', '10', '27', 'মুন্নু/সাইনপুকুর', 'হাফ প্লেট', '', '0', null, '2020-02-06 23:25:40', '3', '2020-02-06 23:25:40', '3', null, '1');
INSERT INTO `products` VALUES ('150', 'পানির গ্লাস', '10', '25', 'উন্নতমানের', '', '', '0', null, '2020-02-06 23:26:43', '3', '2020-02-06 23:26:43', '3', null, '1');
INSERT INTO `products` VALUES ('151', 'পানির মগ (কাঁচের)', '10', '25', 'উন্নতমানের', '', '', '0', null, '2020-02-06 23:28:12', '3', '2020-02-06 23:28:12', '3', null, '1');
INSERT INTO `products` VALUES ('152', 'কফি মগ (সিরামিক)', '10', '27', 'উন্নতমানের', '', '', '0', null, '2020-02-06 23:29:17', '3', '2020-02-06 23:29:17', '3', null, '1');
INSERT INTO `products` VALUES ('153', 'চা চামুচ', '10', '27', 'স্টিল', '', '', '0', null, '2020-02-06 23:30:03', '3', '2020-02-06 23:30:03', '3', null, '1');
INSERT INTO `products` VALUES ('154', 'কাঁটা চামুচ', '10', '27', 'স্টিল', '', '', '0', null, '2020-02-06 23:30:55', '3', '2020-02-06 23:30:55', '3', null, '1');
INSERT INTO `products` VALUES ('155', 'কাঁটা চামুচ (বড়)', '10', '27', 'স্টিল', 'বড়', '', '0', null, '2020-02-06 23:31:39', '3', '2020-02-06 23:31:39', '3', null, '1');
INSERT INTO `products` VALUES ('156', 'টি-পট', '10', '27', 'সিরামিক', '', '', '0', null, '2020-02-06 23:32:15', '3', '2020-02-06 23:32:15', '3', null, '1');
INSERT INTO `products` VALUES ('157', 'মিল্ক পট', '10', '27', 'সিরামিক', '', '', '0', null, '2020-02-06 23:32:50', '3', '2020-02-06 23:32:50', '3', null, '1');
INSERT INTO `products` VALUES ('158', 'সুুুুুুুুুুুুুুুুুুুগার পট', '10', '27', 'সিরামিক', '', '', '0', null, '2020-02-06 23:33:13', '3', '2020-02-06 23:33:13', '3', null, '1');
INSERT INTO `products` VALUES ('159', 'পানির জগ (কাঁচের)', '10', '27', 'উন্নতমানের', '', '', '0', null, '2020-02-06 23:33:55', '3', '2020-02-16 16:29:12', '3', null, '1');
INSERT INTO `products` VALUES ('160', 'পাপোষ (বড়)', '13', '27', 'উন্নতমানের', 'বড়', '', '0', null, '2020-02-06 23:36:25', '3', '2020-02-16 16:17:00', '3', null, '1');
INSERT INTO `products` VALUES ('161', 'পাপোষ (ছোট)', '13', '27', 'উন্নতমানের', 'ছোট', '', '0', null, '2020-02-06 23:37:02', '3', '2020-02-16 16:17:17', '3', null, '1');
INSERT INTO `products` VALUES ('162', 'অডনীল', '14', '27', 'উন্নতমানের', '', '', '0', null, '2020-02-06 23:39:00', '3', '2020-02-06 23:39:00', '3', null, '1');
INSERT INTO `products` VALUES ('163', 'বালতি (প্লাস্টিক)', '13', '27', 'আরএফএল', 'বড়/মাঝারি', '', '0', null, '2020-02-06 23:40:12', '3', '2020-02-06 23:40:12', '3', null, '1');
INSERT INTO `products` VALUES ('164', 'স্ক্যানার', '15', '37', 'উন্নতমানের', '', 'কাল', '0', null, '2020-02-06 23:48:13', '3', '2020-02-07 08:57:21', '3', null, '1');
INSERT INTO `products` VALUES ('169', 'কেতলি (বড়)', '10', '9', 'মিয়াকো / স্যানিও', 'বড়', '', '0', null, '2020-02-16 16:33:31', '3', '2020-02-16 19:46:07', '3', null, '1');
INSERT INTO `products` VALUES ('170', 'কেতলী/ফ্লাক্স (১.৫ লিটার)', '10', '9', 'মিয়াকো', 'মাঝারি', '', '0', null, '2020-02-16 16:34:36', '3', '2020-02-16 19:45:26', '3', null, '1');
INSERT INTO `products` VALUES ('171', 'গ্লাসের ডাকনা', '10', '9', 'ম্যালামাইন', '', '', '0', null, '2020-02-16 16:37:09', '3', '2020-02-16 19:45:48', '3', null, '1');
INSERT INTO `products` VALUES ('172', 'ভিম বার', '14', '9', 'ভিম', '৩২৫ গ্রাম', '', '0', null, '2020-02-16 20:32:18', '3', '2020-02-16 20:32:18', '3', null, '1');
INSERT INTO `products` VALUES ('173', 'ভিম (লিকুইড)', '16', '9', 'ভিম', '৫০০ মিলি', '', '0', null, '2020-02-16 20:33:30', '3', '2020-02-16 20:33:30', '3', null, '1');
INSERT INTO `products` VALUES ('174', 'এন্টিকাটার', '16', '19', 'উন্নতমানের', 'মাঝারি', '', '0', null, '2020-02-16 20:34:44', '3', '2020-02-16 20:34:44', '3', null, '1');
INSERT INTO `products` VALUES ('175', 'গাম পট (লিকুইড আঠা)', '16', '9', '', 'বড়', '', '0', null, '2020-02-16 20:36:53', '3', '2020-02-16 20:36:53', '3', null, '1');
INSERT INTO `products` VALUES ('176', 'ফাইল বোর্ড', '16', '33', 'উন্নতমানের', 'এ-সিক্স', 'সাদা', '0', null, '2020-02-16 20:47:22', '3', '2020-02-16 20:47:22', '3', null, '1');
INSERT INTO `products` VALUES ('177', 'স্ট্যাম্প প্যাডের কালি', '16', '15', '', 'মাঝারি', '', '0', null, '2020-02-16 20:48:18', '3', '2020-02-16 20:48:18', '3', null, '1');
INSERT INTO `products` VALUES ('178', 'সার-সংক্ষেপ ফাইল', '16', '33', '', 'এ-সিক্স', 'সাদা', '0', null, '2020-02-16 20:49:15', '3', '2020-02-16 20:49:15', '3', null, '1');
INSERT INTO `products` VALUES ('179', 'সার-সংক্ষেপ খাম', '16', '33', '', 'ফাইল সাইজ', 'সাদা', '0', null, '2020-02-16 20:49:49', '3', '2020-02-16 20:49:49', '3', null, '1');
INSERT INTO `products` VALUES ('180', 'গ্লাস ক্লিনার', '16', '28', '', '৩৫০ এমএল', '', '0', null, '2020-02-16 20:52:08', '3', '2020-02-16 20:52:08', '3', null, '1');
INSERT INTO `products` VALUES ('181', 'ফটোকপি টোনার (ক্যানন ২৪২০)', '7', '37', '২৪২০', '২৪২০', 'কাল', '0', null, '2020-02-20 11:13:14', '3', '2020-02-20 11:13:14', '3', null, '1');

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_BN` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_id` varchar(50) DEFAULT NULL,
  `type_BN` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `main_type_id` int(11) DEFAULT NULL,
  `main_type_BN` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `agency_id` tinyint(4) DEFAULT NULL,
  `agency_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `partner_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_director_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_director_designation` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_director_phone_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_director_email` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` tinyint(4) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` tinyint(4) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of projects
-- ----------------------------

-- ----------------------------
-- Table structure for project_maintypes
-- ----------------------------
DROP TABLE IF EXISTS `project_maintypes`;
CREATE TABLE `project_maintypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_BN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of project_maintypes
-- ----------------------------
INSERT INTO `project_maintypes` VALUES ('1', 'Project', 'প্রকল্প');
INSERT INTO `project_maintypes` VALUES ('2', 'Program', 'কর্মসুচি');

-- ----------------------------
-- Table structure for purchases
-- ----------------------------
DROP TABLE IF EXISTS `purchases`;
CREATE TABLE `purchases` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(10) NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `go_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_active` int(2) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of purchases
-- ----------------------------
INSERT INTO `purchases` VALUES ('1', '2', '2020-02-12', '90', 'Frame Work Tender, 2 Work Order', '2020-02-17 10:22:34', '2020-02-17 10:22:34', '3', '3', '1', null);

-- ----------------------------
-- Table structure for sections
-- ----------------------------
DROP TABLE IF EXISTS `sections`;
CREATE TABLE `sections` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `contact_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_active` int(2) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sections
-- ----------------------------

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `reg` varchar(50) NOT NULL,
  `established` date NOT NULL,
  `address` varchar(200) NOT NULL,
  `founder` varchar(100) NOT NULL,
  `slogan` varchar(500) NOT NULL,
  `file_path` varchar(200) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `cre_or_up_by` varchar(50) NOT NULL,
  `cre_or_up_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('1', 'Inventory Management System, Ministry of Women and Children Affairs', '12345678', '2019-09-16', 'Bangladesh Secretariat, Dhaka-1000', '', 'Inventory Management System', '271a4-bd.jpg', 'admin-2@mowca.gov.bd', '01734646802', '3', '2020-02-14 00:00:00', '1');

-- ----------------------------
-- Table structure for stockinreasons
-- ----------------------------
DROP TABLE IF EXISTS `stockinreasons`;
CREATE TABLE `stockinreasons` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_BN` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stockinreasons
-- ----------------------------
INSERT INTO `stockinreasons` VALUES ('1', 'Order Return', 'স্টোর এ প্রোডাক্ট ফেরত');
INSERT INTO `stockinreasons` VALUES ('2', 'Normal Stock In', 'স্টক ইন');
INSERT INTO `stockinreasons` VALUES ('3', 'Recount-Stock In', 'স্টক ইন');

-- ----------------------------
-- Table structure for stockins
-- ----------------------------
DROP TABLE IF EXISTS `stockins`;
CREATE TABLE `stockins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(10) NOT NULL,
  `product_id` int(20) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `quantity` int(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `stockadjustment` enum('Yes','No') COLLATE utf8_unicode_ci DEFAULT NULL,
  `stockinreason_id` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_active` int(2) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stockins
-- ----------------------------

-- ----------------------------
-- Table structure for stockoutreasons
-- ----------------------------
DROP TABLE IF EXISTS `stockoutreasons`;
CREATE TABLE `stockoutreasons` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_BN` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stockoutreasons
-- ----------------------------
INSERT INTO `stockoutreasons` VALUES ('1', 'Removing Damaged/Stolen Stock', 'স্টক নষ্ট অথবা হারানো');
INSERT INTO `stockoutreasons` VALUES ('2', 'Purchase Return', 'সরবরাহকারীকে প্রোডাক্ট ফেরত');
INSERT INTO `stockoutreasons` VALUES ('3', 'Normal Stock out', 'স্টক আউট');
INSERT INTO `stockoutreasons` VALUES ('4', 'Stock out due to recount', 'স্টক আউট');

-- ----------------------------
-- Table structure for stockouts
-- ----------------------------
DROP TABLE IF EXISTS `stockouts`;
CREATE TABLE `stockouts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL,
  `product_id` int(20) DEFAULT NULL,
  `section_id` int(20) DEFAULT NULL,
  `quantity` int(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `stockoutreason_id` int(4) DEFAULT NULL,
  `stockadjustment` enum('Yes','No') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_active` int(2) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stockouts
-- ----------------------------

-- ----------------------------
-- Table structure for stocks
-- ----------------------------
DROP TABLE IF EXISTS `stocks`;
CREATE TABLE `stocks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product_id` int(20) NOT NULL,
  `transaction_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_id` int(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `stock_available_before_transaction` int(20) DEFAULT NULL,
  `stock_available_after_transaction` int(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_active` int(2) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of stocks
-- ----------------------------

-- ----------------------------
-- Table structure for suppliers
-- ----------------------------
DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `owner_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_active` int(2) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of suppliers
-- ----------------------------

-- ----------------------------
-- Table structure for uoms
-- ----------------------------
DROP TABLE IF EXISTS `uoms`;
CREATE TABLE `uoms` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_active` int(2) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of uoms
-- ----------------------------
INSERT INTO `uoms` VALUES ('1', 'পিস', null, '2020-01-09 21:29:54', null, '3', null, null);
INSERT INTO `uoms` VALUES ('2', 'রীম', '2020-02-06 00:25:10', '2020-02-06 00:25:10', '3', '3', null, null);
INSERT INTO `uoms` VALUES ('3', 'বান্ডিল', '2020-02-06 00:28:59', '2020-02-06 00:28:59', '3', '3', null, null);
INSERT INTO `uoms` VALUES ('4', 'বক্স', '2020-02-06 01:14:46', '2020-02-06 01:14:46', '3', '3', null, null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `activation_selector` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_selector` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_selector` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_path` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_email` (`email`) USING BTREE,
  UNIQUE KEY `uc_activation_selector` (`activation_selector`) USING BTREE,
  UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`) USING BTREE,
  UNIQUE KEY `uc_remember_selector` (`remember_selector`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('2', '::1', 'test', '$2y$10$CxCkP7V0p7H0RJdl3EAf.O0TrCnkw1JyxokGtIEww3JCvSk6aTp7m', 'test@test.com', null, null, null, null, null, null, null, '1573453197', '2019', '1', 'Test', 'Test', null, '0.03123102', 'assets/images/user/1482829335.png');
INSERT INTO `users` VALUES ('3', '::1', 'admin', '$2y$12$DyDxZl3xczxcxF.TIvnjhu5wioqcApkfFYUQMKnh0G8Rb.FPHr4aq', 'admin@moca.com', null, null, null, null, null, null, null, '1573453197', '2021', '1', 'Admin', 'admin', null, null, null);

-- ----------------------------
-- Table structure for users_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`) USING BTREE,
  KEY `fk_users_groups_users1_idx` (`user_id`) USING BTREE,
  KEY `fk_users_groups_groups1_idx` (`group_id`) USING BTREE,
  CONSTRAINT `users_groups_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `users_groups_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_groups
-- ----------------------------
INSERT INTO `users_groups` VALUES ('9', '2', '2');
INSERT INTO `users_groups` VALUES ('10', '3', '1');
