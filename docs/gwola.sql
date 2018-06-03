/*
 Navicat MariaDB Data Transfer

 Source Server         : localhost
 Source Server Type    : MariaDB
 Source Server Version : 100307
 Source Host           : localhost:3306
 Source Schema         : gwola

 Target Server Type    : MariaDB
 Target Server Version : 100307
 File Encoding         : 65001

 Date: 02/06/2018 13:04:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for msg_announce
-- ----------------------------
DROP TABLE IF EXISTS `msg_announce`;
CREATE TABLE `msg_announce` (
  `announce_id` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `create_user_id` varchar(40) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `read_count` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `is_top` int(11) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `target_type` int(11) DEFAULT NULL,
  `target` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`announce_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for msg_channel
-- ----------------------------
DROP TABLE IF EXISTS `msg_channel`;
CREATE TABLE `msg_channel` (
  `channel_id` varchar(10) NOT NULL COMMENT '渠道编号',
  `channel_name` varchar(20) DEFAULT NULL COMMENT '渠道名称',
  PRIMARY KEY (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息渠道表';

-- ----------------------------
-- Table structure for msg_message
-- ----------------------------
DROP TABLE IF EXISTS `msg_message`;
CREATE TABLE `msg_message` (
  `message_id` varchar(40) NOT NULL COMMENT '消息ID',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `content` longtext DEFAULT NULL COMMENT '消息内容',
  `title` varchar(100) DEFAULT NULL COMMENT '消息标题',
  `template_id` varchar(40) NOT NULL COMMENT '消息模板ID',
  `target_type` int(11) DEFAULT NULL COMMENT '目标用户类型',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息表';

-- ----------------------------
-- Table structure for msg_message_user
-- ----------------------------
DROP TABLE IF EXISTS `msg_message_user`;
CREATE TABLE `msg_message_user` (
  `message_id` varchar(40) NOT NULL COMMENT '消息ID',
  `user_id` varchar(40) NOT NULL COMMENT '用户ID',
  `status` int(11) DEFAULT NULL COMMENT '消息状态',
  PRIMARY KEY (`message_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息用户关联表';

-- ----------------------------
-- Table structure for msg_template
-- ----------------------------
DROP TABLE IF EXISTS `msg_template`;
CREATE TABLE `msg_template` (
  `template_id` varchar(40) NOT NULL COMMENT '消息模板ID',
  `title` varchar(100) DEFAULT NULL COMMENT '消息模板标题',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `content` longtext DEFAULT NULL COMMENT '消息内容',
  `msg_type_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统消息模板表';

-- ----------------------------
-- Table structure for msg_template_channel
-- ----------------------------
DROP TABLE IF EXISTS `msg_template_channel`;
CREATE TABLE `msg_template_channel` (
  `channel_id` varchar(10) NOT NULL COMMENT '渠道编号',
  `template_id` varchar(40) NOT NULL COMMENT '消息模板ID',
  PRIMARY KEY (`channel_id`,`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息模板渠道表';

-- ----------------------------
-- Table structure for msg_template_weixin
-- ----------------------------
DROP TABLE IF EXISTS `msg_template_weixin`;
CREATE TABLE `msg_template_weixin` (
  `wx_template_id` varchar(100) DEFAULT NULL COMMENT '微信模板编号',
  `wx_template_head` varchar(100) DEFAULT NULL COMMENT '微信模板头部',
  `wx_template_tail` varchar(100) DEFAULT NULL COMMENT '微信模板尾部',
  `template_id` varchar(40) NOT NULL COMMENT '微信消息模板ID',
  `title` varchar(100) DEFAULT NULL COMMENT '消息模板标题',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信消息模板表';

-- ----------------------------
-- Table structure for msg_type
-- ----------------------------
DROP TABLE IF EXISTS `msg_type`;
CREATE TABLE `msg_type` (
  `msg_type_code` varchar(10) NOT NULL COMMENT '消息类型编码',
  `msg_type_name` varchar(20) DEFAULT NULL COMMENT '消息类型名称',
  PRIMARY KEY (`msg_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统消息类型表';

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `parent_id` varchar(10) DEFAULT NULL,
  `parent_ids` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `id` varchar(10) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `del_flag` char(18) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_area
-- ----------------------------
BEGIN;
INSERT INTO `sys_area` VALUES ('0', '0,', '中国', '1', '100000', '0');
INSERT INTO `sys_area` VALUES ('8', '0,1,2,8,', '历城区', '10', '370532', '0');
INSERT INTO `sys_area` VALUES ('8', '0,1,2,8,', '历城区', '11', '370533', '0');
INSERT INTO `sys_area` VALUES ('8', '0,1,2,8,', '历下区', '12', '370534', '0');
INSERT INTO `sys_area` VALUES ('8', '0,1,2,8,', '天桥区', '13', '370535', '0');
INSERT INTO `sys_area` VALUES ('8', '0,1,2,8,', '槐荫区', '14', '370536', '0');
INSERT INTO `sys_area` VALUES ('1', '0,1,', '北京市', '2', '110000', '0');
INSERT INTO `sys_area` VALUES ('2', '0,1,2,', '东城区', '3', '110101', '0');
INSERT INTO `sys_area` VALUES ('2', '0,1,2,', '西城区', '4', '110102', '0');
INSERT INTO `sys_area` VALUES ('2', '0,1,2,', '朝阳区', '5', '110103', '0');
INSERT INTO `sys_area` VALUES ('2', '0,1,2,', '海淀区', '7', '110105', '0');
INSERT INTO `sys_area` VALUES ('2', '0,1,2,', '丰台区', '8', '110104', '0');
INSERT INTO `sys_area` VALUES ('d406d79a-1', '0,1,2,7,d406d79a-1,', '海淀区22233', '9', '333333', '1');
INSERT INTO `sys_area` VALUES (NULL, NULL, '海淀区1', 'a78c1178-b', '11111', '0');
INSERT INTO `sys_area` VALUES ('7', '0,1,2,7,', '海淀区222', 'd406d79a-1', '233333', '1');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES ('1', '正常', '0', 'del_flag', '删除标记', 10, NULL, 0);
INSERT INTO `sys_dict` VALUES ('10', '黄色', 'yellow', 'color', '颜色值', 40, NULL, 0);
INSERT INTO `sys_dict` VALUES ('11', '橙色', 'orange', 'color', '颜色值', 50, NULL, 0);
INSERT INTO `sys_dict` VALUES ('12', '默认主题', 'default', 'theme', '主题方案', 10, NULL, 0);
INSERT INTO `sys_dict` VALUES ('13', '天蓝主题', 'cerulean', 'theme', '主题方案', 20, NULL, 0);
INSERT INTO `sys_dict` VALUES ('14', '橙色主题', 'readable', 'theme', '主题方案', 30, NULL, 0);
INSERT INTO `sys_dict` VALUES ('15', '红色主题', 'united', 'theme', '主题方案', 40, NULL, 0);
INSERT INTO `sys_dict` VALUES ('16', 'Flat主题', 'flat', 'theme', '主题方案', 60, NULL, 0);
INSERT INTO `sys_dict` VALUES ('17', '国家', '1', 'sys_area_type', '区域类型', 10, NULL, 0);
INSERT INTO `sys_dict` VALUES ('18', '省份、直辖市', '2', 'sys_area_type', '区域类型', 20, NULL, 0);
INSERT INTO `sys_dict` VALUES ('19', '地市', '3', 'sys_area_type', '区域类型', 30, NULL, 0);
INSERT INTO `sys_dict` VALUES ('1d157cf94b7144779113d991aff87625', '签章', '100', 'default_sign_count', '默认签章份数', 10, NULL, 0);
INSERT INTO `sys_dict` VALUES ('2', '删除', '1', 'del_flag', '删除标记', 20, NULL, 0);
INSERT INTO `sys_dict` VALUES ('20', '区县', '4', 'sys_area_type', '区域类型', 40, NULL, 0);
INSERT INTO `sys_dict` VALUES ('21', '公司', '1', 'sys_office_type', '机构类型', 60, NULL, 0);
INSERT INTO `sys_dict` VALUES ('22', '部门', '2', 'sys_office_type', '机构类型', 70, NULL, 0);
INSERT INTO `sys_dict` VALUES ('23', '一级', '1', 'sys_office_grade', '机构等级', 10, NULL, 0);
INSERT INTO `sys_dict` VALUES ('24', '二级', '2', 'sys_office_grade', '机构等级', 20, NULL, 0);
INSERT INTO `sys_dict` VALUES ('25', '三级', '3', 'sys_office_grade', '机构等级', 30, NULL, 0);
INSERT INTO `sys_dict` VALUES ('26', '四级', '4', 'sys_office_grade', '机构等级', 40, NULL, 0);
INSERT INTO `sys_dict` VALUES ('27', '所有数据', '1', 'sys_data_scope', '数据范围', 10, NULL, 0);
INSERT INTO `sys_dict` VALUES ('28', '所在公司及以下数据', '2', 'sys_data_scope', '数据范围', 20, NULL, 0);
INSERT INTO `sys_dict` VALUES ('29', '所在公司数据', '3', 'sys_data_scope', '数据范围', 30, NULL, 0);
INSERT INTO `sys_dict` VALUES ('2918c2cd29aa4ffd8f3ded4056c0152f', '电子公章', '1', 'esign_seal_type', '印章类型', 10, NULL, 0);
INSERT INTO `sys_dict` VALUES ('2BSL83Y2MD', '50 - 100人', '3', 'supplier_emploee_count', '从业人数', 3, NULL, 0);
INSERT INTO `sys_dict` VALUES ('2CAMKUHZYA', '100 - 200人', '4', 'supplier_emploee_count', '从业人数', 3, NULL, 0);
INSERT INTO `sys_dict` VALUES ('3', '显示', '1', 'show_hide', '显示/隐藏', 10, NULL, 0);
INSERT INTO `sys_dict` VALUES ('30', '所在部门及以下数据', '4', 'sys_data_scope', '数据范围', 40, NULL, 0);
INSERT INTO `sys_dict` VALUES ('31', '所在部门数据', '5', 'sys_data_scope', '数据范围', 50, NULL, 0);
INSERT INTO `sys_dict` VALUES ('32', '仅本人数据', '8', 'sys_data_scope', '数据范围', 90, NULL, 0);
INSERT INTO `sys_dict` VALUES ('33', '按明细设置', '9', 'sys_data_scope', '数据范围', 100, NULL, 0);
INSERT INTO `sys_dict` VALUES ('34', '系统管理', '1', 'sys_user_type', '用户类型', 10, NULL, 0);
INSERT INTO `sys_dict` VALUES ('35', '部门经理', '2', 'sys_user_type', '用户类型', 20, NULL, 0);
INSERT INTO `sys_dict` VALUES ('36', '普通用户', '3', 'sys_user_type', '用户类型', 30, NULL, 0);
INSERT INTO `sys_dict` VALUES ('37', '基础主题', 'basic', 'cms_theme', '站点主题', 10, NULL, 0);
INSERT INTO `sys_dict` VALUES ('38', '蓝色主题', 'blue', 'cms_theme', '站点主题', 20, NULL, 1);
INSERT INTO `sys_dict` VALUES ('39', '红色主题', 'red', 'cms_theme', '站点主题', 30, NULL, 1);
INSERT INTO `sys_dict` VALUES ('3edb970d26414713b2185c6a0b347a71', 'test', 'test', 'test', 'test', 1, NULL, 1);
INSERT INTO `sys_dict` VALUES ('4', '隐藏', '0', 'show_hide', '显示/隐藏', 20, NULL, 0);
INSERT INTO `sys_dict` VALUES ('40', '文章模型', 'article', 'cms_module', '栏目模型', 10, NULL, 0);
INSERT INTO `sys_dict` VALUES ('41', '图片模型', 'picture', 'cms_module', '栏目模型', 20, NULL, 1);
INSERT INTO `sys_dict` VALUES ('42', '下载模型', 'download', 'cms_module', '栏目模型', 30, NULL, 1);
INSERT INTO `sys_dict` VALUES ('43', '链接模型', 'link', 'cms_module', '栏目模型', 40, NULL, 0);
INSERT INTO `sys_dict` VALUES ('44', '专题模型', 'special', 'cms_module', '栏目模型', 50, NULL, 1);
INSERT INTO `sys_dict` VALUES ('45', '默认展现方式', '0', 'cms_show_modes', '展现方式', 10, NULL, 0);
INSERT INTO `sys_dict` VALUES ('46', '首栏目内容列表', '1', 'cms_show_modes', '展现方式', 20, NULL, 0);
INSERT INTO `sys_dict` VALUES ('47', '栏目第一条内容', '2', 'cms_show_modes', '展现方式', 30, NULL, 0);
INSERT INTO `sys_dict` VALUES ('4776d388525d49f88259dde586e4a014', 'test1', '1231', 'test1', 'test1', 1, NULL, 1);
INSERT INTO `sys_dict` VALUES ('48', '发布2', '0', 'cms_del_flag', '内容状态2', 15, NULL, 0);
INSERT INTO `sys_dict` VALUES ('49', '删除', '1', 'cms_del_flag', '内容状态', 20, NULL, 0);
INSERT INTO `sys_dict` VALUES ('5', '是', '1', 'yes_no', '是/否', 10, NULL, 0);
INSERT INTO `sys_dict` VALUES ('50', '审核1', '2', 'cms_del_flag', '内容状态1', 14, NULL, 0);
INSERT INTO `sys_dict` VALUES ('51', '首页焦点图', '1', 'cms_posid', '推荐位', 10, NULL, 0);
INSERT INTO `sys_dict` VALUES ('52', '栏目页文章推荐', '2', 'cms_posid', '推荐位', 20, NULL, 0);
INSERT INTO `sys_dict` VALUES ('53', '咨询', '1', 'cms_guestbook', '留言板分类', 10, NULL, 0);
INSERT INTO `sys_dict` VALUES ('54', '建议', '2', 'cms_guestbook', '留言板分类', 20, NULL, 0);
INSERT INTO `sys_dict` VALUES ('55', '投诉', '3', 'cms_guestbook', '留言板分类', 30, NULL, 0);
INSERT INTO `sys_dict` VALUES ('56', '其它', '4', 'cms_guestbook', '留言板分类', 40, NULL, 0);
INSERT INTO `sys_dict` VALUES ('57', '公休', '1', 'oa_leave_type', '请假类型', 10, NULL, 0);
INSERT INTO `sys_dict` VALUES ('58', '病假', '2', 'oa_leave_type', '请假类型', 20, NULL, 0);
INSERT INTO `sys_dict` VALUES ('59', '事假', '3', 'oa_leave_type', '请假类型', 30, NULL, 0);
INSERT INTO `sys_dict` VALUES ('5ab539dcd6924666973187b376e3aab2', '个人私章', '2', 'esign_seal_type', '印章类型', 20, NULL, 0);
INSERT INTO `sys_dict` VALUES ('6', '否', '0', 'yes_no', '是/否', 20, NULL, 0);
INSERT INTO `sys_dict` VALUES ('60', '调休', '4', 'oa_leave_type', '请假类型', 40, NULL, 0);
INSERT INTO `sys_dict` VALUES ('61', '婚假', '5', 'oa_leave_type', '请假类型', 60, NULL, 0);
INSERT INTO `sys_dict` VALUES ('62', '接入日志', '1', 'sys_log_type', '日志类型', 30, NULL, 0);
INSERT INTO `sys_dict` VALUES ('625a7663b79b4dff849e16da9e395edd', 'test_user2', 'test_user2', 'test_user', 'test_user2', 3, NULL, 1);
INSERT INTO `sys_dict` VALUES ('63', '异常日志', '2', 'sys_log_type', '日志类型', 40, NULL, 0);
INSERT INTO `sys_dict` VALUES ('64', '单表增删改查', 'single', 'prj_template_type', '代码模板', 10, NULL, 0);
INSERT INTO `sys_dict` VALUES ('65', '所有entity和dao', 'entityAndDao', 'prj_template_type', '代码模板', 20, NULL, 0);
INSERT INTO `sys_dict` VALUES ('7', '红色', 'red', 'color', '颜色值', 10, NULL, 0);
INSERT INTO `sys_dict` VALUES ('8', '绿色', 'green', 'color', '颜色值', 20, NULL, 0);
INSERT INTO `sys_dict` VALUES ('850dde0ae436473e86cba2596a4513a1', 'test', 'test', 'test', 'test', 11, NULL, 1);
INSERT INTO `sys_dict` VALUES ('9', '蓝色', 'blue', 'color', '颜色值', 30, NULL, 0);
INSERT INTO `sys_dict` VALUES ('a2122007c7ba4c26b1e3c67f4da7ac2f', 'test', 'test', 'test', 'test', 1, NULL, 1);
INSERT INTO `sys_dict` VALUES ('b45ea42eccc04088beca1ebad9db78a2', '测试用户', 'test_user', 'test_user', '测试用户', 1, NULL, 1);
INSERT INTO `sys_dict` VALUES ('b9c61f7858ce4a5d87c0f33667340c98', 'test1', 'test1', 'test', 'test1', 2, NULL, 0);
INSERT INTO `sys_dict` VALUES ('bae2751e29f14c18b1f836ecbf814c81', 'test', '121', 'test', 'test1', 2, NULL, 1);
INSERT INTO `sys_dict` VALUES ('BHFUVYV9HH', '长沙银行', '3', 'supplier_bank', '开户银行', 1, NULL, 0);
INSERT INTO `sys_dict` VALUES ('BMUWL87VLT', '10 - 50人', '2', 'supplier_emploee_count', '从业人数', 2, NULL, 0);
INSERT INTO `sys_dict` VALUES ('C3PNEJSLJP', '1 - 10人', '1', 'supplier_emploee_count', '从业人数', 2, NULL, 0);
INSERT INTO `sys_dict` VALUES ('c51b59d7de694d7db28dd479ab4b99de', 'test1', 'test1', 'test1', 'test1', 2, NULL, 1);
INSERT INTO `sys_dict` VALUES ('c8e0c5efa7844ae7abf466c9cb2d1a4d', '测试用户u', 'test_user1', 'test_user', '测试用户1', 1, NULL, 1);
INSERT INTO `sys_dict` VALUES ('d7e3a194fede4d74bad573205ec8bda4', 'ttt', 'ttt', 'ttt', 'ttt', 1, NULL, 1);
INSERT INTO `sys_dict` VALUES ('DCGP4HZN6X', '国营企业', '1', 'supplier_office_nature', '单位性质', 1, NULL, 0);
INSERT INTO `sys_dict` VALUES ('dd131b40572d41b69880ff5213f96050', 'test', 'test', 'test', 'test', 1, NULL, 1);
INSERT INTO `sys_dict` VALUES ('DVWPEFGXJ8', '软件/硬件', '2', 'supplier_business_type', '所属行业', 2, NULL, 0);
INSERT INTO `sys_dict` VALUES ('TF9Y3LV3L5', '私营企业', '2', 'supplier_office_nature', '单位性质', 2, NULL, 0);
INSERT INTO `sys_dict` VALUES ('URUER8YJLC', '建设银行', '1', 'supplier_bank', '开户银行', 1, NULL, 0);
INSERT INTO `sys_dict` VALUES ('WUM24EZ2R3', '机械', '1', 'supplier_business_type', '所属行业', 2, NULL, 0);
INSERT INTO `sys_dict` VALUES ('Y99V8YQ7AS', '工商银行', '2', 'supplier_bank', '开户银行', 1, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `file_id` varchar(50) NOT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `file_type` varchar(20) DEFAULT NULL,
  `save_path` varchar(200) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `last_update_time` timestamp NULL DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
BEGIN;
INSERT INTO `sys_file` VALUES ('34d35a1fc2654214b8f0bbaa20e951b7', '印章图象', 'bmp', '2017\\05\\16\\f91f285c489d4906bd892063fdc835f4.zip', '2017-05-16 19:17:59', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_file` VALUES ('3af30510a3bd478990d6c869f8a5fe97', '2M', 'rar', '2017\\05\\16\\481e26fb6d044848a0ad1023473fc160.rar', '2017-05-16 19:21:15', NULL, NULL, NULL, '5749500575', NULL);
INSERT INTO `sys_file` VALUES ('3d8fa29ff0d0466b932e342d32f8b175', '5M', 'rar', '2017\\05\\16\\fb45839aeff44d56985352880b01d3fe.rar', '2017-05-16 19:22:04', NULL, NULL, NULL, '5749500575', NULL);
INSERT INTO `sys_file` VALUES ('4b98b39df7774c4e937df1eb1a7c5593', '2M', 'rar', '2017\\05\\16\\b2be68f232194938a416a80773ce7abd.rar', '2017-05-16 21:39:58', NULL, NULL, NULL, NULL, 'application/octet-stream');
INSERT INTO `sys_file` VALUES ('7c1243472ad2421cae20339283c49b80', '10M', 'rar', '2017\\05\\16\\01088b51ea2f420294514988a6843e6a.rar', '2017-05-16 19:22:09', NULL, NULL, NULL, '5749500575', NULL);
INSERT INTO `sys_file` VALUES ('7fc4a78e56e545898e84472275da5bf9', '5M', 'rar', '2017\\05\\16\\f37844d2b8fc4671a448d2e42db960a1.rar', '2017-05-16 19:21:42', NULL, NULL, NULL, '5749500575', NULL);
INSERT INTO `sys_file` VALUES ('a908ebd8bb5f41479bb7a6909938d29b', '30M', 'rar', '2017\\05\\16\\6688d882cf0048a9869110b44dc22b41.rar', '2017-05-16 19:22:19', NULL, NULL, NULL, '5749500575', NULL);
INSERT INTO `sys_file` VALUES ('bdbccde5195b4f2daeb86dad476c3756', '2M', 'rar', '2017\\05\\16\\8e94d00bf084499f81eedfdb35a2850c.rar', '2017-05-16 19:39:13', NULL, NULL, NULL, NULL, 'application/octet-stream');
INSERT INTO `sys_file` VALUES ('e32bbf78bc874c6aab0139b10e7b3396', '印章图象', 'bmp', '2017\\05\\16\\96e270224d23433f8f0720ec97c9ffd7.bmp', '2017-05-16 19:20:33', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_file` VALUES ('e3677b2a81e9402887246f3edd0b7f87', '印章图象', 'bmp', '2017\\05\\16\\667be6658c224894b9995cf755d760c1.bmp', '2017-05-16 19:37:35', NULL, NULL, NULL, '5749500575', 'image/bmp');
INSERT INTO `sys_file` VALUES ('e53cfbc42cad4b25855f3fc1f0131d00', '印章图象', 'bmp', '2017\\05\\16\\8881c2fc127746c2a7ae3d354a4a9510.zip', '2017-05-16 19:19:55', NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_home_component
-- ----------------------------
DROP TABLE IF EXISTS `sys_home_component`;
CREATE TABLE `sys_home_component` (
  `component_id` varchar(64) NOT NULL COMMENT '组件编号',
  `component_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '组件标题',
  `component_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '组件名称',
  `component_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '组件链接',
  `component_type` tinyint(4) DEFAULT NULL COMMENT '组件类型',
  `config` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '设置',
  PRIMARY KEY (`component_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统首页组件';

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `log_id` varchar(40) NOT NULL,
  `http_method` varchar(10) DEFAULT NULL,
  `http_uri` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `user_id` varchar(40) DEFAULT NULL,
  `http_user_agent` varchar(200) DEFAULT NULL,
  `http_remote_host` varchar(20) DEFAULT NULL,
  `http_paramters` varchar(500) DEFAULT NULL,
  `execute_time` int(11) DEFAULT NULL,
  `remark` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES ('f1a3e0ad2a6a4846b547eb05c1ab8a8a', 'GET', '/api/login', '2018-05-28 23:27:59', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{password=admin, verifyCode=, isRememberMe=false, username=admin}', 2683, '');
INSERT INTO `sys_log` VALUES ('cea1a055b82a4360a412af692acaad62', 'GET', '/error', '2018-05-28 23:28:02', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 71, '');
INSERT INTO `sys_log` VALUES ('c87268881e4e400ebb7061390758cf4a', 'GET', '/api/initData', '2018-05-28 23:28:11', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 3158, '');
INSERT INTO `sys_log` VALUES ('aadbbf3ff8c94346b8c505877ed9cbbd', 'GET', '/error', '2018-05-28 23:28:30', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 6, '');
INSERT INTO `sys_log` VALUES ('8bb1b02589bd42ee9358f49a48fd5e51', 'GET', '/api/initData', '2018-05-28 23:28:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 212, '');
INSERT INTO `sys_log` VALUES ('0233b27058a6491196feb936ab7fddeb', 'GET', '/error', '2018-05-28 23:28:39', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 16, '');
INSERT INTO `sys_log` VALUES ('83e866d083af4cdd84c64024845a35cc', 'GET', '/api/msg/message', '2018-05-28 23:28:40', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 970, '');
INSERT INTO `sys_log` VALUES ('1fa1dc12e856438095af1c3c7024230b', 'GET', '/error', '2018-05-28 23:28:43', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 2, '');
INSERT INTO `sys_log` VALUES ('8ff0c2648bca4e81aab1a3ff1bf7f131', 'GET', '/error', '2018-05-28 23:28:48', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 12, '');
INSERT INTO `sys_log` VALUES ('348842557dd14235b4feb9f0459409ef', 'GET', '/api/msg/message', '2018-05-28 23:28:52', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 83, '');
INSERT INTO `sys_log` VALUES ('258dc5b76ed94864893275b84dbfd0a7', 'GET', '/error', '2018-05-28 23:28:54', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 5, '');
INSERT INTO `sys_log` VALUES ('0b4ee15a80ec4365b2516ca2d80ebcd9', 'GET', '/api/isLogin', '2018-05-28 23:29:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 437, '');
INSERT INTO `sys_log` VALUES ('950e8c83246a4d4aaee37f563e87f4ca', 'GET', '/api/msg/message', '2018-05-28 23:29:39', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 29, '');
INSERT INTO `sys_log` VALUES ('48235e18c601447ca439921ebf37a9c5', 'GET', '/api/sys/dict/type', '2018-05-28 23:29:42', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 102, '');
INSERT INTO `sys_log` VALUES ('2c4e2c4df88e4e0890f294d5070d4590', 'GET', '/api/sys/dict', '2018-05-28 23:29:42', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, description=, pageSize=10, type=}', 181, '');
INSERT INTO `sys_log` VALUES ('4b4469d07c0a4f449e11c11bfdd8c8c0', 'GET', '/api/sys/area/tree', '2018-05-28 23:29:43', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 460, '');
INSERT INTO `sys_log` VALUES ('fa672f52240945a69769f82457febb0b', 'GET', '/api/sys/menu/tree', '2018-05-28 23:29:44', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 160, '');
INSERT INTO `sys_log` VALUES ('42040747ac144a84bc5e7fd244286d6d', 'GET', '/api/sys/role', '2018-05-28 23:29:46', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, roleName=, pageSize=10}', 63, '');
INSERT INTO `sys_log` VALUES ('14bb00e0d9d4499fbf02de1e0a4035ab', 'GET', '/api/sys/office/tree', '2018-05-28 23:29:51', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 774, '');
INSERT INTO `sys_log` VALUES ('ace9f9d1270546458aff4bced3f28a2d', 'GET', '/api/user/manager', '2018-05-28 23:29:54', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, pageSize=10}', 148, '');
INSERT INTO `sys_log` VALUES ('518ee376cd944c5ab14a8e9d1b7b2a32', 'GET', '/api/sys/office/tree', '2018-05-28 23:29:57', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 30, '');
INSERT INTO `sys_log` VALUES ('081a21b8861d41ee9305df19d21adc57', 'GET', '/api/sys/menu/tree', '2018-05-28 23:29:58', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 27, '');
INSERT INTO `sys_log` VALUES ('8e0f7dc8c72b431baeafd35adcf16478', 'GET', '/api/user/manager', '2018-05-28 23:30:00', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, pageSize=10}', 75, '');
INSERT INTO `sys_log` VALUES ('57fa2a2fed864b46b1e0ad9f2a71d248', 'GET', '/api/isLogin', '2018-05-28 23:30:34', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 12, '');
INSERT INTO `sys_log` VALUES ('ed898cc871c74732a6d26d17a5ea8af4', 'GET', '/api/msg/message', '2018-05-28 23:30:39', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 48, '');
INSERT INTO `sys_log` VALUES ('6dc1cff878154ca4a7ad195d684c1c2d', 'GET', '/api/sys/office/tree', '2018-05-28 23:31:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 112, '');
INSERT INTO `sys_log` VALUES ('e1b2092392534e6c8412b0095d7653df', 'GET', '/api/sys/dict/type', '2018-05-28 23:31:08', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 18, '');
INSERT INTO `sys_log` VALUES ('6b7ed54441dd485da58906c497e25994', 'GET', '/api/sys/dict', '2018-05-28 23:31:08', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, description=, pageSize=10, type=}', 24, '');
INSERT INTO `sys_log` VALUES ('83a679bca8c6487b9128eba44d194eae', 'GET', '/api/sys/area/tree', '2018-05-28 23:31:10', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 24, '');
INSERT INTO `sys_log` VALUES ('1a6e8fbe68ab47e4abd933c9d9bcab92', 'GET', '/api/sys/menu/tree', '2018-05-28 23:31:11', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 32, '');
INSERT INTO `sys_log` VALUES ('6f63843960c4479e9421569f525acbc2', 'GET', '/api/sys/role', '2018-05-28 23:31:12', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, roleName=, pageSize=10}', 10, '');
INSERT INTO `sys_log` VALUES ('f5fc12a02d7d46e08877512d3a19d6ea', 'GET', '/api/sys/office/tree', '2018-05-28 23:31:14', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 25, '');
INSERT INTO `sys_log` VALUES ('0ef8c8be38994831acf7b86329ebba7d', 'GET', '/api/isLogin', '2018-05-28 23:31:34', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 18, '');
INSERT INTO `sys_log` VALUES ('7b5fcbe065474d23b3a52f7f18323c30', 'GET', '/api/isLogin', '2018-05-28 23:32:34', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 4, '');
INSERT INTO `sys_log` VALUES ('54f3d03c12da4a66a679a529969ee68e', 'GET', '/api/isLogin', '2018-05-28 23:33:34', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 25, '');
INSERT INTO `sys_log` VALUES ('39a75e1c920b40399935193c3fb7ad66', 'GET', '/api/msg/message', '2018-05-28 23:33:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 22, '');
INSERT INTO `sys_log` VALUES ('e908af1efdc446439432a3fe08be8ba0', 'GET', '/api/sys/office/tree', '2018-05-28 23:33:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 36, '');
INSERT INTO `sys_log` VALUES ('2d49180f8ba9482e9a0450034b3e9dcf', 'GET', '/error', '2018-05-28 23:33:36', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 1, '');
INSERT INTO `sys_log` VALUES ('f265c655df6246a5a2373e58e20b61a9', 'GET', '/api/isLogin', '2018-05-28 23:34:34', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 13, '');
INSERT INTO `sys_log` VALUES ('6fa65d6c1c984aceb825e6dd8146bf41', 'GET', '/api/msg/message', '2018-05-28 23:34:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 20, '');
INSERT INTO `sys_log` VALUES ('85cc7ba4d2164d96864e3aa98b91edde', 'GET', '/api/user/manager', '2018-05-28 23:34:37', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, pageSize=10}', 38, '');
INSERT INTO `sys_log` VALUES ('1f0834bcfc594234918e9830c73e2c6c', 'GET', '/api/sys/office/tree', '2018-05-28 23:34:42', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 54, '');
INSERT INTO `sys_log` VALUES ('f7c5a5486ed34225965c647295a71062', 'GET', '/api/sys/role', '2018-05-28 23:34:42', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=100}', 63, '');
INSERT INTO `sys_log` VALUES ('8fb7485be79f4ffca86064b5886379b7', 'GET', '/api/user/manager/1', '2018-05-28 23:34:42', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 73, '');
INSERT INTO `sys_log` VALUES ('f8ad4387cb834563aa4d5060601731aa', 'GET', '/api/sys/office/tree', '2018-05-28 23:34:52', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 129, '');
INSERT INTO `sys_log` VALUES ('b989574ec4a64036bb0f2f896c64adc9', 'GET', '/api/user/manager', '2018-05-28 23:34:57', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, pageSize=10}', 33, '');
INSERT INTO `sys_log` VALUES ('faec3a9b976b42308e6ff4e0c9b65989', 'GET', '/api/isLogin', '2018-05-28 23:35:36', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 30, '');
INSERT INTO `sys_log` VALUES ('f6567d5ca03342d598318044a7155f9a', 'GET', '/api/msg/message', '2018-05-28 23:35:36', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 33, '');
INSERT INTO `sys_log` VALUES ('aa98abac02f244adaab342f142b04fa4', 'GET', '/api/isLogin', '2018-05-28 23:36:34', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 11, '');
INSERT INTO `sys_log` VALUES ('40788beacbea40bd980155aa6554bea0', 'GET', '/api/msg/message', '2018-05-28 23:36:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 14, '');
INSERT INTO `sys_log` VALUES ('cbd0ecd7d25046e0bb3d18e230553732', 'GET', '/api/isLogin', '2018-05-28 23:37:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 13, '');
INSERT INTO `sys_log` VALUES ('60f68ef3e9e34a0493bdc13afbd3d16e', 'GET', '/api/msg/message', '2018-05-28 23:37:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 13, '');
INSERT INTO `sys_log` VALUES ('95e30a453dd940f6a8672c152aec24e6', 'GET', '/api/isLogin', '2018-05-28 23:38:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 27, '');
INSERT INTO `sys_log` VALUES ('57b9d1131cb94d86bffc1a2b833084e3', 'GET', '/api/msg/message', '2018-05-28 23:38:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 51, '');
INSERT INTO `sys_log` VALUES ('f67be7bc8772432ca3b6d412ae2eed0b', 'GET', '/api/isLogin', '2018-05-28 23:39:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 9, '');
INSERT INTO `sys_log` VALUES ('63b1aa51509c480e93c98c82648c9ea1', 'GET', '/api/msg/message', '2018-05-28 23:39:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 23, '');
INSERT INTO `sys_log` VALUES ('717c668d3a594ff6940df84a409cf60b', 'GET', '/api/isLogin', '2018-05-28 23:40:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 20, '');
INSERT INTO `sys_log` VALUES ('07939d25c665474bb50c04a3833d1dc2', 'GET', '/api/msg/message', '2018-05-28 23:40:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 30, '');
INSERT INTO `sys_log` VALUES ('17fed5ad84e84663bc4a15513b02fb58', 'GET', '/api/isLogin', '2018-05-28 23:41:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 18, '');
INSERT INTO `sys_log` VALUES ('d05e38cd6bbc47e09ecbb6644cbbd54a', 'GET', '/api/msg/message', '2018-05-28 23:41:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 31, '');
INSERT INTO `sys_log` VALUES ('c43d04d133814463830b37225a572113', 'GET', '/api/isLogin', '2018-05-28 23:42:34', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 2, '');
INSERT INTO `sys_log` VALUES ('b7a01baa860d49daa896992708aa4112', 'GET', '/api/msg/message', '2018-05-28 23:42:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 8, '');
INSERT INTO `sys_log` VALUES ('99d9ba31fba749c1b694978715469100', 'GET', '/api/isLogin', '2018-05-28 23:43:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 38, '');
INSERT INTO `sys_log` VALUES ('d6720772637241178e218c30d0b1e108', 'GET', '/api/msg/message', '2018-05-28 23:43:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 32, '');
INSERT INTO `sys_log` VALUES ('f94aff140739445689cca456600ed1c0', 'GET', '/api/isLogin', '2018-05-28 23:44:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 11, '');
INSERT INTO `sys_log` VALUES ('eb4990e8a07d4a25bb79a397bc004274', 'GET', '/api/msg/message', '2018-05-28 23:44:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 38, '');
INSERT INTO `sys_log` VALUES ('7f24906d900943018d1554df62007c8c', 'GET', '/api/isLogin', '2018-05-28 23:45:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 42, '');
INSERT INTO `sys_log` VALUES ('2540f4da0cba4cd18984f546b7c664c3', 'GET', '/api/msg/message', '2018-05-28 23:45:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 82, '');
INSERT INTO `sys_log` VALUES ('23657436df7945dca788273fdc082677', 'GET', '/api/isLogin', '2018-05-28 23:46:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 10, '');
INSERT INTO `sys_log` VALUES ('0627eeaf6c8645b09f800794f4db86a0', 'GET', '/api/msg/message', '2018-05-28 23:46:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 23, '');
INSERT INTO `sys_log` VALUES ('7b73f8655daa4665bfb6864bf9cf5a89', 'GET', '/api/isLogin', '2018-05-28 23:47:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 7, '');
INSERT INTO `sys_log` VALUES ('d991355e6b05457d8ef52f38a6390539', 'GET', '/api/msg/message', '2018-05-28 23:47:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 16, '');
INSERT INTO `sys_log` VALUES ('d2c8d8b713104448bd07ca9074b62423', 'GET', '/api/login', '2018-05-29 15:59:23', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{password=admin, verifyCode=, isRememberMe=false, username=admin}', 2634, '');
INSERT INTO `sys_log` VALUES ('1689b23c0aa1433dba0fe510cf524853', 'GET', '/error', '2018-05-29 15:59:24', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 76, '');
INSERT INTO `sys_log` VALUES ('7de59c8e3a3c439fa720c16e339c406b', 'GET', '/api/initData', '2018-05-29 15:59:30', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 2269, '');
INSERT INTO `sys_log` VALUES ('5105fbc85e3141848b3200dbd5b0b279', 'GET', '/error', '2018-05-29 15:59:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 4, '');
INSERT INTO `sys_log` VALUES ('bce98d6d29174d0398809d6301611c1f', 'GET', '/api/msg/message', '2018-05-29 15:59:34', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 827, '');
INSERT INTO `sys_log` VALUES ('03220e02d95d4478b3a937273668602c', 'GET', '/error', '2018-05-29 15:59:34', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 1, '');
INSERT INTO `sys_log` VALUES ('99aca80be2e74b89b96d942e2ef75b6c', 'GET', '/error', '2018-05-29 15:59:38', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 1, '');
INSERT INTO `sys_log` VALUES ('492162d2155c4da88a789d5b3a9ed6ce', 'GET', '/error', '2018-05-29 15:59:41', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 2, '');
INSERT INTO `sys_log` VALUES ('04e5ff91af374296ac80eef5269cb340', 'GET', '/api/isLogin', '2018-05-29 16:00:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 52, '');
INSERT INTO `sys_log` VALUES ('00da56fe18e84a20a2df1bf9a1048c82', 'GET', '/api/msg/message', '2018-05-29 16:00:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 35, '');
INSERT INTO `sys_log` VALUES ('84244f69ef7448fbbeb010cc4070f446', 'PUT', '/api/updateUserInfo', '2018-05-29 16:00:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 59, '');
INSERT INTO `sys_log` VALUES ('12406680c76942d492f149ab59d2c495', 'GET', '/api/sys/dict/type', '2018-05-29 16:01:26', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 77, '');
INSERT INTO `sys_log` VALUES ('fec4783a12984a37951c3da51e786bf9', 'GET', '/api/sys/dict', '2018-05-29 16:01:26', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, description=, pageSize=10, type=}', 91, '');
INSERT INTO `sys_log` VALUES ('bdb5f308f94a4e09b826446c247ab8d3', 'GET', '/api/sys/area/tree', '2018-05-29 16:01:27', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 77, '');
INSERT INTO `sys_log` VALUES ('b5310f009d2145e5989d307c773016a9', 'GET', '/api/isLogin', '2018-05-29 16:01:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 4, '');
INSERT INTO `sys_log` VALUES ('8dd8af8d243b4729a77addb56fc90c98', 'GET', '/api/sys/menu/tree', '2018-05-29 16:01:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 47, '');
INSERT INTO `sys_log` VALUES ('fc018453bb9149ac8101ee32b8efa7e6', 'GET', '/api/sys/role', '2018-05-29 16:01:29', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, roleName=, pageSize=10}', 32, '');
INSERT INTO `sys_log` VALUES ('ec9fae2c3d614bf9af832813355d0a38', 'GET', '/api/msg/message', '2018-05-29 16:01:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 13, '');
INSERT INTO `sys_log` VALUES ('100d46cc0cec47c48a47ba024462ead3', 'GET', '/api/sys/menu/tree', '2018-05-29 16:01:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 33, '');
INSERT INTO `sys_log` VALUES ('f9f34a5490d4463f890d312aa2d09916', 'GET', '/api/sys/role/20', '2018-05-29 16:01:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 378, 'org.springframework.dao.InvalidDataAccessResourceUsageException: could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet');
INSERT INTO `sys_log` VALUES ('6d1df3d07ed44fb4b8443d3375011ea3', 'GET', '/api/sys/homeComponent', '2018-05-29 16:01:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 368, 'org.springframework.dao.InvalidDataAccessResourceUsageException: could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet');
INSERT INTO `sys_log` VALUES ('7becbfeeedfb4e5b8f286c8b4e363632', 'GET', '/api/isLogin', '2018-05-29 16:02:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 17, '');
INSERT INTO `sys_log` VALUES ('7e5002ea1685499a9fce4714db3f029d', 'GET', '/api/msg/message', '2018-05-29 16:02:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 22, '');
INSERT INTO `sys_log` VALUES ('015330ed524249d1a82687f89a6ec8c4', 'GET', '/api/sys/role', '2018-05-29 16:02:45', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, roleName=, pageSize=10}', 65, '');
INSERT INTO `sys_log` VALUES ('843a0bd1fc854e9096c27c3fcfe054ec', 'GET', '/api/sys/homeComponent', '2018-05-29 16:02:47', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 13, 'org.springframework.dao.InvalidDataAccessResourceUsageException: could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet');
INSERT INTO `sys_log` VALUES ('dfee900341404e3caef97d001b529a24', 'GET', '/api/sys/menu/tree', '2018-05-29 16:02:47', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 23, '');
INSERT INTO `sys_log` VALUES ('61a481f3ba104319971d0f66b4ec4ce5', 'GET', '/api/sys/role/1', '2018-05-29 16:02:47', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 28, 'org.springframework.dao.InvalidDataAccessResourceUsageException: could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet');
INSERT INTO `sys_log` VALUES ('b877e12106d742e38b005b9f2e80862d', 'GET', '/api/sys/role', '2018-05-29 16:02:54', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, roleName=, pageSize=10}', 7, '');
INSERT INTO `sys_log` VALUES ('89dc8619be1544cd8fff6cb8f1466177', 'GET', '/api/sys/menu/tree', '2018-05-29 16:02:58', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 14, '');
INSERT INTO `sys_log` VALUES ('0ba4b10ff5c2404998b66f8489b5c4cc', 'GET', '/api/sys/homeComponent', '2018-05-29 16:02:58', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 13, 'org.springframework.dao.InvalidDataAccessResourceUsageException: could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet');
INSERT INTO `sys_log` VALUES ('744ba34417dc4a46b17caa52d393ed50', 'GET', '/api/sys/role/20', '2018-05-29 16:02:58', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 18, 'org.springframework.dao.InvalidDataAccessResourceUsageException: could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet');
INSERT INTO `sys_log` VALUES ('0fb1294e4323435882960f4eb48ca55d', 'GET', '/api/sys/role', '2018-05-29 16:03:00', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, roleName=, pageSize=10}', 12, '');
INSERT INTO `sys_log` VALUES ('6c8ad430230546b0933f6425d9dadcb2', 'GET', '/api/sys/role/30', '2018-05-29 16:03:01', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 11, 'org.springframework.dao.InvalidDataAccessResourceUsageException: could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet');
INSERT INTO `sys_log` VALUES ('704e8b9d337b48afa99ceb3cf0c3b23a', 'GET', '/api/sys/homeComponent', '2018-05-29 16:03:01', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 15, 'org.springframework.dao.InvalidDataAccessResourceUsageException: could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet');
INSERT INTO `sys_log` VALUES ('7c88733f54644fefab46fb2975fac96b', 'GET', '/api/sys/menu/tree', '2018-05-29 16:03:01', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 26, '');
INSERT INTO `sys_log` VALUES ('9f5be3daefd44f9284d3530c927f1a93', 'GET', '/api/sys/role', '2018-05-29 16:03:06', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, roleName=, pageSize=10}', 10, '');
INSERT INTO `sys_log` VALUES ('b14a262d6798431f943edcf39d8565b4', 'GET', '/api/sys/homeComponent', '2018-05-29 16:03:10', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 16, 'org.springframework.dao.InvalidDataAccessResourceUsageException: could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet');
INSERT INTO `sys_log` VALUES ('e95e357fb5b04286abce6ba651304c80', 'GET', '/api/sys/menu/tree', '2018-05-29 16:03:10', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 29, '');
INSERT INTO `sys_log` VALUES ('8787a93435914a7b9b089c98c4dc165a', 'GET', '/api/sys/role', '2018-05-29 16:03:16', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, roleName=, pageSize=10}', 17, '');
INSERT INTO `sys_log` VALUES ('09ce53aabe294de79ef1a2d10d437f52', 'GET', '/api/sys/homeComponent', '2018-05-29 16:03:18', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 30, 'org.springframework.dao.InvalidDataAccessResourceUsageException: could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet');
INSERT INTO `sys_log` VALUES ('f6c4f6044a994e1fbc25ef56067d788a', 'GET', '/api/sys/menu/tree', '2018-05-29 16:03:18', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 62, '');
INSERT INTO `sys_log` VALUES ('fb071c447ca14cde9485b20c6adcdb5c', 'GET', '/api/sys/role/1', '2018-05-29 16:03:18', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 106, 'org.springframework.dao.InvalidDataAccessResourceUsageException: could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet');
INSERT INTO `sys_log` VALUES ('59fadd3645c04c0289ea19eeb0cbd04b', 'GET', '/api/isLogin', '2018-05-29 16:03:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 6, '');
INSERT INTO `sys_log` VALUES ('a0b6bf58a5a8465aaa92c3f43037452f', 'GET', '/api/msg/message', '2018-05-29 16:03:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 13, '');
INSERT INTO `sys_log` VALUES ('f7cbec7488314bc297059d93b798c5a5', 'GET', '/api/sys/role', '2018-05-29 16:04:12', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, roleName=, pageSize=10}', 13, '');
INSERT INTO `sys_log` VALUES ('e7bdd2c8aeb84c148cfc4e6bfc330711', 'GET', '/api/sys/menu/tree', '2018-05-29 16:04:27', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 26, '');
INSERT INTO `sys_log` VALUES ('f7cb85c36802473e9097f6e5f98fe7b7', 'GET', '/api/sys/homeComponent', '2018-05-29 16:04:27', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 19, 'org.springframework.dao.InvalidDataAccessResourceUsageException: could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet');
INSERT INTO `sys_log` VALUES ('91d1cd6edeb443348c97d4c5ea7d7c84', 'GET', '/api/sys/role/1', '2018-05-29 16:04:27', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 22, 'org.springframework.dao.InvalidDataAccessResourceUsageException: could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet');
INSERT INTO `sys_log` VALUES ('d85713db4807414e89abdc854751ce98', 'GET', '/api/isLogin', '2018-05-29 16:04:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 4, '');
INSERT INTO `sys_log` VALUES ('9fe773d00efa4f74bb950924d1636c95', 'GET', '/api/msg/message', '2018-05-29 16:04:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 16, '');
INSERT INTO `sys_log` VALUES ('d66ed4b5d00b40e2a8bb6e58089837ee', 'GET', '/api/isLogin', '2018-05-29 16:05:29', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 32, '');
INSERT INTO `sys_log` VALUES ('a620fab6056b44e7a1125b965d17183e', 'GET', '/api/msg/message', '2018-05-29 16:05:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 25, '');
INSERT INTO `sys_log` VALUES ('a3289777b47d48a0bd07de6bcea604f2', 'GET', '/api/isLogin', '2018-05-29 16:06:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 12, '');
INSERT INTO `sys_log` VALUES ('ad751557a15643e48d2a52da18ba76dc', 'GET', '/api/msg/message', '2018-05-29 16:06:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 11, '');
INSERT INTO `sys_log` VALUES ('c855784bb04b4b22ab4df61f92460d35', 'GET', '/api/isLogin', '2018-05-29 16:07:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 10, '');
INSERT INTO `sys_log` VALUES ('0a2b56c93ba6417da3c55642648c0068', 'GET', '/api/msg/message', '2018-05-29 16:07:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 12, '');
INSERT INTO `sys_log` VALUES ('87538a8364b64d9daaec2dbc5deed400', 'GET', '/api/isLogin', '2018-05-29 16:08:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 9, '');
INSERT INTO `sys_log` VALUES ('db9696400e0743b0ab9d720d0130f839', 'GET', '/api/msg/message', '2018-05-29 16:08:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 18, '');
INSERT INTO `sys_log` VALUES ('750ad89c13c94a838bb923e5f01c3903', 'GET', '/api/isLogin', '2018-05-29 16:09:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 23, '');
INSERT INTO `sys_log` VALUES ('12f771e2dd4a4ce5afce43155779e0fe', 'GET', '/api/msg/message', '2018-05-29 16:09:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 11, '');
INSERT INTO `sys_log` VALUES ('5bd764805440481782d5f4359010edfc', 'GET', '/api/isLogin', '2018-05-29 16:10:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 22, '');
INSERT INTO `sys_log` VALUES ('a1ee69544f3249ac9749b16b32fe8618', 'GET', '/api/msg/message', '2018-05-29 16:10:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 13, '');
INSERT INTO `sys_log` VALUES ('6be6a7fb033f42a68062c86375af8912', 'PUT', '/api/sys/role', '2018-05-29 16:10:57', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 344, 'org.springframework.orm.jpa.JpaSystemException: ids for this class must be manually assigned before calling save(): com.lcw.one.sys.entity.SysRoleEO; nested exception is org.hibernate.id.IdentifierGenerationException: ids for this class must be manually assigned before calling save(): com.lcw.one.sys.entity.SysRoleEO');
INSERT INTO `sys_log` VALUES ('46665c298d6e49368ab5e21437944b27', 'GET', '/api/isLogin', '2018-05-29 16:11:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 15, '');
INSERT INTO `sys_log` VALUES ('ffb992618675408ca8a527f96fd9812f', 'GET', '/api/msg/message', '2018-05-29 16:11:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 12, '');
INSERT INTO `sys_log` VALUES ('760cbcf71ef14e07b08a29968d58828a', 'GET', '/api/isLogin', '2018-05-29 16:12:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 17, '');
INSERT INTO `sys_log` VALUES ('cdf5c9c202ed491f8cf3e6c1f513d9f5', 'GET', '/api/msg/message', '2018-05-29 16:12:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 19, '');
INSERT INTO `sys_log` VALUES ('6d795658747b4e9eb8e275f14e2abf24', 'GET', '/api/isLogin', '2018-05-29 16:13:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 24, '');
INSERT INTO `sys_log` VALUES ('fd79d1af5c1d40648a82b5bcf26823bc', 'GET', '/api/msg/message', '2018-05-29 16:13:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 11, '');
INSERT INTO `sys_log` VALUES ('2897ce289f344c2aa5b79c202e24fa05', 'GET', '/api/isLogin', '2018-05-29 16:14:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 32, '');
INSERT INTO `sys_log` VALUES ('2d854f8edcb84babb65884a9b9112667', 'GET', '/api/msg/message', '2018-05-29 16:14:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 13, '');
INSERT INTO `sys_log` VALUES ('687f698c67cd44e7a6fd055c941fd528', 'GET', '/api/isLogin', '2018-05-29 16:15:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 18, '');
INSERT INTO `sys_log` VALUES ('8c581425d448415dbbedc7447d5587f7', 'GET', '/api/msg/message', '2018-05-29 16:15:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 8, '');
INSERT INTO `sys_log` VALUES ('4e9a52a372c94c4981b6d3dc6fb91cd7', 'GET', '/api/isLogin', '2018-05-29 16:16:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 2, '');
INSERT INTO `sys_log` VALUES ('0fb7bb28fd16499780e2f005fd0bf80e', 'GET', '/api/msg/message', '2018-05-29 16:16:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 14, '');
INSERT INTO `sys_log` VALUES ('0dd55233f5464ef690cf1f141f541e84', 'GET', '/api/isLogin', '2018-05-29 16:17:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 16, '');
INSERT INTO `sys_log` VALUES ('a80c9b731a8f44f0b087f86d1354dbfe', 'GET', '/api/msg/message', '2018-05-29 16:17:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 24, '');
INSERT INTO `sys_log` VALUES ('b7c90f31d40a40d983fd6d322fdc224e', 'GET', '/api/isLogin', '2018-05-29 16:18:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 22, '');
INSERT INTO `sys_log` VALUES ('6f89004b95414853b6bd27247a365ba5', 'GET', '/api/msg/message', '2018-05-29 16:18:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 16, '');
INSERT INTO `sys_log` VALUES ('d211fb894b0a4a7e899c5edd4d0d2cb4', 'GET', '/api/isLogin', '2018-05-29 16:19:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 1, '');
INSERT INTO `sys_log` VALUES ('ba7890a92be9469c895f4fbacae942a0', 'GET', '/api/msg/message', '2018-05-29 16:19:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 6, '');
INSERT INTO `sys_log` VALUES ('16e6743cef554d9989f33aaaebf612f6', 'GET', '/api/sys/dict/type', '2018-05-29 16:20:12', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 26, '');
INSERT INTO `sys_log` VALUES ('400830badbba4f43a7e0583dd23df59b', 'GET', '/api/sys/dict', '2018-05-29 16:20:12', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, description=, pageSize=10, type=}', 31, '');
INSERT INTO `sys_log` VALUES ('3a16c7e4750b4d3fbbe718be42570885', 'GET', '/api/sys/role', '2018-05-29 16:20:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, roleName=, pageSize=10}', 14, '');
INSERT INTO `sys_log` VALUES ('fb630f3ed68144d08bc52ed69989c0ed', 'GET', '/api/isLogin', '2018-05-29 16:20:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 24, '');
INSERT INTO `sys_log` VALUES ('b6106679143a461aa548ba9548e32779', 'GET', '/api/sys/role/1', '2018-05-29 16:20:30', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 55, 'org.springframework.dao.InvalidDataAccessResourceUsageException: could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet');
INSERT INTO `sys_log` VALUES ('df61048eb025460389c41c614f4d24d4', 'GET', '/api/sys/menu/tree', '2018-05-29 16:20:30', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 22, '');
INSERT INTO `sys_log` VALUES ('890215c5064e4fafbb46b1495cd78c02', 'GET', '/api/sys/homeComponent', '2018-05-29 16:20:30', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 53, 'org.springframework.dao.InvalidDataAccessResourceUsageException: could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet');
INSERT INTO `sys_log` VALUES ('285947d42e204822a059dfeda9e94c05', 'GET', '/api/sys/role', '2018-05-29 16:20:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, roleName=, pageSize=10}', 1370, '');
INSERT INTO `sys_log` VALUES ('0a7d44e62a0546848f2fbb49d8033ead', 'GET', '/api/msg/message', '2018-05-29 16:20:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 1946, '');
INSERT INTO `sys_log` VALUES ('a296da80f3a14caf9cc8058347740ab7', 'GET', '/api/isLogin', '2018-05-29 16:21:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 14, '');
INSERT INTO `sys_log` VALUES ('781c8d3e21624e798f1607c0c04fae66', 'GET', '/api/msg/message', '2018-05-29 16:21:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 26, '');
INSERT INTO `sys_log` VALUES ('ec1b58b196084840b47ee2afd96e6356', 'GET', '/api/isLogin', '2018-05-29 16:22:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 12, '');
INSERT INTO `sys_log` VALUES ('1afe1b106bcd4fe187ab4dfcfb1cd715', 'GET', '/api/msg/message', '2018-05-29 16:22:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 35, '');
INSERT INTO `sys_log` VALUES ('d7af7e9b4b314fbeb02fb34ddc0ab1cf', 'GET', '/api/isLogin', '2018-05-29 16:23:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 14, '');
INSERT INTO `sys_log` VALUES ('561aa1c85121478687fdfde59174a947', 'GET', '/api/msg/message', '2018-05-29 16:23:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 6, '');
INSERT INTO `sys_log` VALUES ('b844233146aa4189b39bd2fdc64e4f66', 'GET', '/api/isLogin', '2018-05-29 16:24:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 2, '');
INSERT INTO `sys_log` VALUES ('7437607714e348048198e4dc71c8463b', 'GET', '/api/msg/message', '2018-05-29 16:24:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 6, '');
INSERT INTO `sys_log` VALUES ('84a2afb9ef564827a6a7d37bbeaf8a61', 'GET', '/api/isLogin', '2018-05-29 16:25:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 1, '');
INSERT INTO `sys_log` VALUES ('68dd30475eea463e9191bea12995aa40', 'GET', '/api/msg/message', '2018-05-29 16:25:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 15, '');
INSERT INTO `sys_log` VALUES ('6cefa1f2163845ca9eeaebe775b430aa', 'GET', '/api/isLogin', '2018-05-29 16:26:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 10, '');
INSERT INTO `sys_log` VALUES ('e2050ddc30d24037810919316b105633', 'GET', '/api/msg/message', '2018-05-29 16:26:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 10, '');
INSERT INTO `sys_log` VALUES ('a80dbb59d9f64259a12480565b25baf8', 'GET', '/api/isLogin', '2018-05-29 16:27:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 18, '');
INSERT INTO `sys_log` VALUES ('b97bf8897f9e4f4cbb4c63c7bce51058', 'GET', '/api/msg/message', '2018-05-29 16:27:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 11, '');
INSERT INTO `sys_log` VALUES ('0d44735a00544f128f8212928eda37c2', 'GET', '/api/isLogin', '2018-05-29 16:28:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 1, '');
INSERT INTO `sys_log` VALUES ('f0d12f792b094955b3d052ed5fa4bffd', 'GET', '/api/msg/message', '2018-05-29 16:28:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 6, '');
INSERT INTO `sys_log` VALUES ('6aa4b69fec9b4884a46c3251928dc1e3', 'GET', '/api/isLogin', '2018-05-29 16:29:28', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 10, '');
INSERT INTO `sys_log` VALUES ('53c4d7d6d362419b89530d65cd751db8', 'GET', '/error', '2018-05-29 16:29:29', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 5, '');
INSERT INTO `sys_log` VALUES ('267330e6ad074e5b9f4a9d72a85a6e15', 'GET', '/api/isLogin', '2018-05-29 16:29:31', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 5, '');
INSERT INTO `sys_log` VALUES ('52156f42e4f344afac6bb1cd06e28e9c', 'GET', '/error', '2018-05-29 16:29:31', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 0, '');
INSERT INTO `sys_log` VALUES ('fc93e6c26a9642fcaf561e4ef701a7a1', 'GET', '/api/login', '2018-05-29 16:39:59', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{password=admin, verifyCode=, isRememberMe=false, username=admin}', 203, '');
INSERT INTO `sys_log` VALUES ('d8f59d33763a4f9899b90beb546fb88d', 'GET', '/error', '2018-05-29 16:40:01', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 1, '');
INSERT INTO `sys_log` VALUES ('aaab64865bc34542bb51542e59b48ee0', 'GET', '/api/initData', '2018-05-29 16:40:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 105, '');
INSERT INTO `sys_log` VALUES ('818a4000ee3349fc8fa0377ad37c512f', 'GET', '/error', '2018-05-29 16:40:05', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 17, '');
INSERT INTO `sys_log` VALUES ('3341ba0cd2c54ff1b93e452a0b5a16b5', 'GET', '/api/msg/message', '2018-05-29 16:40:06', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 88, '');
INSERT INTO `sys_log` VALUES ('8f029be5b2c84d20a91211cf3524f2f3', 'GET', '/error', '2018-05-29 16:40:06', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 1, '');
INSERT INTO `sys_log` VALUES ('e47f3b14692a41cb978c9895a8e71803', 'GET', '/error', '2018-05-29 16:40:10', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 1, '');
INSERT INTO `sys_log` VALUES ('0614ffdff29c43bcb9d3247b39924f7f', 'GET', '/error', '2018-05-29 16:40:12', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 2, '');
INSERT INTO `sys_log` VALUES ('bea56b8823f2426d83bab0812dd6327e', 'GET', '/api/sys/dict/type', '2018-05-29 16:40:22', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 12, '');
INSERT INTO `sys_log` VALUES ('d28831e8c68b4a9497c8b9293b000765', 'GET', '/api/sys/dict', '2018-05-29 16:40:22', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, description=, pageSize=10, type=}', 14, '');
INSERT INTO `sys_log` VALUES ('71204717f5fa49b88bc82de3596d324f', 'GET', '/api/sys/dict/50', '2018-05-29 16:40:24', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 22, '');
INSERT INTO `sys_log` VALUES ('7aece4edfebd43179548cd579372cdbd', 'GET', '/api/sys/dict/type', '2018-05-29 16:40:25', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 4, '');
INSERT INTO `sys_log` VALUES ('11c96db1092847089ab7bde7bd1edfe2', 'GET', '/api/sys/dict', '2018-05-29 16:40:25', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, description=, pageSize=10, type=}', 8, '');
INSERT INTO `sys_log` VALUES ('abe0127bef84431581cda507ac960669', 'GET', '/api/sys/area/tree', '2018-05-29 16:40:27', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 30, '');
INSERT INTO `sys_log` VALUES ('22a3a08f6b2b464196be11fba9c5342a', 'GET', '/api/sys/area/tree', '2018-05-29 16:40:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 8, '');
INSERT INTO `sys_log` VALUES ('827d14a5978048dd8a94d7b8d5970445', 'GET', '/api/sys/area/3', '2018-05-29 16:40:28', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 8, '');
INSERT INTO `sys_log` VALUES ('b04a75a5b86844af9446b2dafde02387', 'GET', '/api/sys/area/tree', '2018-05-29 16:40:29', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 11, '');
INSERT INTO `sys_log` VALUES ('f070a0a5aec6415ba7d9d45e3003625a', 'GET', '/api/sys/office/tree', '2018-05-29 16:40:36', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 197, '');
INSERT INTO `sys_log` VALUES ('3be691d87b0b487fb7597fde85fcf6ef', 'GET', '/api/sys/area/tree', '2018-05-29 16:40:37', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 11, '');
INSERT INTO `sys_log` VALUES ('24a9b573c56a4f56930036f2d300fff1', 'GET', '/api/sys/office/tree', '2018-05-29 16:40:37', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 32, '');
INSERT INTO `sys_log` VALUES ('2d7c94858fc846b885304b9298945ed8', 'GET', '/api/sys/office/2', '2018-05-29 16:40:37', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 23, '');
INSERT INTO `sys_log` VALUES ('8642f745ba5c4125aa28608a0d327534', 'GET', '/api/user/manager', '2018-05-29 16:40:38', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, pageSize=10}', 187, '');
INSERT INTO `sys_log` VALUES ('61e6163a064443c89857df4bd73aa2b7', 'GET', '/api/user/manager', '2018-05-29 16:40:52', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, pageSize=10}', 11, '');
INSERT INTO `sys_log` VALUES ('b658854f072e45348d7e5afe82e6776b', 'GET', '/api/sys/role', '2018-05-29 16:40:54', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=100}', 5, '');
INSERT INTO `sys_log` VALUES ('4afde85659654e81afe78714b1276ea9', 'GET', '/api/sys/office/tree', '2018-05-29 16:40:54', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 16, '');
INSERT INTO `sys_log` VALUES ('b27a435ca7064eefb916062df71def91', 'GET', '/api/user/manager/1', '2018-05-29 16:40:54', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 16, '');
INSERT INTO `sys_log` VALUES ('ea66d872471a4d07a0df7c81360b49f3', 'GET', '/api/isLogin', '2018-05-29 16:41:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 3, '');
INSERT INTO `sys_log` VALUES ('247731d93ed343c4a048cabae4f6f3ed', 'GET', '/api/user/manager', '2018-05-29 16:41:05', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, pageSize=10}', 23, '');
INSERT INTO `sys_log` VALUES ('6afb9870afa44be1a99c9d446418b11c', 'GET', '/api/msg/message', '2018-05-29 16:41:05', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 11, '');
INSERT INTO `sys_log` VALUES ('a9bdf48d54e940be8b862ce49b0db303', 'GET', '/api/msg/message', '2018-05-29 16:41:20', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 8, '');
INSERT INTO `sys_log` VALUES ('b4413fb0f72b4af5b9ed217beb023c79', 'GET', '/api/sys/dict/type', '2018-05-29 16:41:22', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 9, '');
INSERT INTO `sys_log` VALUES ('95246af252354b04a2048a88737a47d8', 'GET', '/api/sys/dict', '2018-05-29 16:41:22', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, description=, pageSize=10, type=}', 21, '');
INSERT INTO `sys_log` VALUES ('50694eaa60b344b8b5396a8ea42e30b1', 'GET', '/api/sys/role', '2018-05-29 16:41:23', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, roleName=, pageSize=10}', 11, '');
INSERT INTO `sys_log` VALUES ('c83d749954fd4e8e9cc413fb8dfb24f5', 'GET', '/api/sys/homeComponent', '2018-05-29 16:41:26', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 15, 'org.springframework.dao.InvalidDataAccessResourceUsageException: could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet');
INSERT INTO `sys_log` VALUES ('9f6f1e4177e248aebac1fdff6b75f7da', 'GET', '/api/sys/menu/tree', '2018-05-29 16:41:26', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 18, '');
INSERT INTO `sys_log` VALUES ('30060ef603ba4174871f084e91aa7c8d', 'GET', '/api/sys/role/1', '2018-05-29 16:41:26', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 52, 'org.springframework.dao.InvalidDataAccessResourceUsageException: could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet');
INSERT INTO `sys_log` VALUES ('ad336aa5dcba4761827c7e126e65e0ea', 'GET', '/api/sys/role', '2018-05-29 16:41:30', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, roleName=, pageSize=10}', 5, '');
INSERT INTO `sys_log` VALUES ('3320dd7dd04d432286c04df7f19c18f2', 'GET', '/api/isLogin', '2018-05-29 16:42:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 14, '');
INSERT INTO `sys_log` VALUES ('26e5a1e2bfbb429ea7dcb552105998fc', 'GET', '/api/msg/message', '2018-05-29 16:42:20', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 56, '');
INSERT INTO `sys_log` VALUES ('be2b3f92d10b47bd9f09f0849abc07d1', 'GET', '/api/isLogin', '2018-05-29 16:43:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 12, '');
INSERT INTO `sys_log` VALUES ('76b0dc29ddd74cf2951895b275972a9b', 'GET', '/api/msg/message', '2018-05-29 16:43:20', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 48, '');
INSERT INTO `sys_log` VALUES ('33809ce702954e5a84e98bfc64160db5', 'GET', '/api/sys/menu/tree', '2018-05-29 16:43:38', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 16, '');
INSERT INTO `sys_log` VALUES ('c6187b8e508e46e09048906afa63050f', 'GET', '/api/sys/role/1', '2018-05-29 16:43:38', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 24, 'org.springframework.dao.InvalidDataAccessResourceUsageException: could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet');
INSERT INTO `sys_log` VALUES ('2240e4d97305442b962c3bc0af755a61', 'GET', '/api/sys/homeComponent', '2018-05-29 16:43:38', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 13, 'org.springframework.dao.InvalidDataAccessResourceUsageException: could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet');
INSERT INTO `sys_log` VALUES ('e05096d9a45e4895a9c6a50bbdea2144', 'GET', '/api/isLogin', '2018-05-29 16:44:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 4, '');
INSERT INTO `sys_log` VALUES ('fc420eb5786f4a3985e44425b750db0b', 'GET', '/api/msg/message', '2018-05-29 16:44:20', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 6, '');
INSERT INTO `sys_log` VALUES ('b770677113824511be85ac7826b747b0', 'GET', '/api/isLogin', '2018-05-29 16:45:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 49, '');
INSERT INTO `sys_log` VALUES ('e64cb96d421542cda923924c41eebd72', 'GET', '/api/msg/message', '2018-05-29 16:45:20', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 13, '');
INSERT INTO `sys_log` VALUES ('a554e52fa6dc4143b18afd070afefd0e', 'GET', '/api/isLogin', '2018-05-29 16:46:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 18, '');
INSERT INTO `sys_log` VALUES ('8c9ea5ee2e804d7685a8b72d4bf5a985', 'GET', '/api/msg/message', '2018-05-29 16:46:20', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 10, '');
INSERT INTO `sys_log` VALUES ('23933c1eff0f4706a0dc552e60a4b9ea', 'GET', '/api/isLogin', '2018-05-29 16:47:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 25, '');
INSERT INTO `sys_log` VALUES ('effce2b78000483da055e4e3aa6bd1e1', 'GET', '/api/msg/message', '2018-05-29 16:47:21', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 26, '');
INSERT INTO `sys_log` VALUES ('d13fc88200fa41daa8ead2816523d6ad', 'GET', '/api/isLogin', '2018-05-29 16:48:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 15, '');
INSERT INTO `sys_log` VALUES ('12883815ce6c49df957cf01079407c8f', 'GET', '/api/msg/message', '2018-05-29 16:48:21', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 13, '');
INSERT INTO `sys_log` VALUES ('8e5736f6b7d24cd39bbe5b44049244ee', 'GET', '/api/isLogin', '2018-05-29 16:49:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 10, '');
INSERT INTO `sys_log` VALUES ('a073b77a5802426798f4eb3eeebb76b5', 'GET', '/api/msg/message', '2018-05-29 16:49:21', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 28, '');
INSERT INTO `sys_log` VALUES ('cb04dd0425534cb9a2da0ee6af6f6412', 'GET', '/api/isLogin', '2018-05-29 16:50:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 37, '');
INSERT INTO `sys_log` VALUES ('4270cf1b9d50492c8a85590cbe201ea1', 'GET', '/api/msg/message', '2018-05-29 16:50:21', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 10, '');
INSERT INTO `sys_log` VALUES ('2a369e63ee684dc185c6f2a628b30082', 'GET', '/api/isLogin', '2018-05-29 16:51:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 21, '');
INSERT INTO `sys_log` VALUES ('6cd7c3ed29f2453b96118ae3b89e3418', 'GET', '/api/msg/message', '2018-05-29 16:51:21', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 19, '');
INSERT INTO `sys_log` VALUES ('32823b7d565843048059f305ab223a08', 'GET', '/api/isLogin', '2018-05-29 16:52:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 13, '');
INSERT INTO `sys_log` VALUES ('2f52f641206c415198d2cd302f0c4bf9', 'GET', '/api/msg/message', '2018-05-29 16:52:21', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 11, '');
INSERT INTO `sys_log` VALUES ('0d47b13054dc43808debb59f9b7ab813', 'GET', '/api/isLogin', '2018-05-29 16:53:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 13, '');
INSERT INTO `sys_log` VALUES ('cbdecc7b0ab342989095caabdfe3f2da', 'GET', '/api/msg/message', '2018-05-29 16:53:21', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 29, '');
INSERT INTO `sys_log` VALUES ('045305b295ee487591c6c005b8090281', 'GET', '/api/isLogin', '2018-05-29 16:54:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 4, '');
INSERT INTO `sys_log` VALUES ('0f9eba657f9041ffb4064ecd2d50d866', 'GET', '/api/msg/message', '2018-05-29 16:54:21', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 18, '');
INSERT INTO `sys_log` VALUES ('d39bef7d9d114a168091a202d098cd42', 'GET', '/api/isLogin', '2018-05-29 16:55:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 10, '');
INSERT INTO `sys_log` VALUES ('14648cc8d703478c9e4d57abed3f4fe0', 'GET', '/api/msg/message', '2018-05-29 16:55:21', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 7, '');
INSERT INTO `sys_log` VALUES ('99b032ecc70946e8ba52c1762c5cddf3', 'GET', '/api/isLogin', '2018-05-29 16:56:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 13, '');
INSERT INTO `sys_log` VALUES ('27345a138d524d82af4c73bdfcb3b68e', 'GET', '/api/msg/message', '2018-05-29 16:56:20', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 17, '');
INSERT INTO `sys_log` VALUES ('60eee1aaf60247bab41b7164d19e6dc2', 'GET', '/api/isLogin', '2018-05-29 16:57:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 15, '');
INSERT INTO `sys_log` VALUES ('bc2972bd3eea4741b74ac37679b1a400', 'GET', '/api/msg/message', '2018-05-29 16:57:21', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 13, '');
INSERT INTO `sys_log` VALUES ('42a6a5b0b3914cabb33e00d8a640bc4c', 'GET', '/api/sys/role', '2018-05-29 16:57:53', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, roleName=, pageSize=10}', 59, '');
INSERT INTO `sys_log` VALUES ('3de39eece32f436ebe4dc25ac38dbcad', 'GET', '/api/sys/role/1', '2018-05-29 16:57:55', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 54, '');
INSERT INTO `sys_log` VALUES ('51411f2d316948cc99d9e305fddcebb2', 'GET', '/api/sys/homeComponent', '2018-05-29 16:57:55', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 27, 'org.springframework.dao.InvalidDataAccessResourceUsageException: could not extract ResultSet; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: could not extract ResultSet');
INSERT INTO `sys_log` VALUES ('b1016f02cbff4866a37fe9dfc9472ac8', 'GET', '/api/sys/menu/tree', '2018-05-29 16:57:55', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 69, '');
INSERT INTO `sys_log` VALUES ('2796b6e29ecf475d97d0468bf23a6470', 'GET', '/api/isLogin', '2018-05-29 16:58:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 3, '');
INSERT INTO `sys_log` VALUES ('d87adbbac86749f8adce6d32cf1e9cb7', 'GET', '/api/msg/message', '2018-05-29 16:58:20', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 10, '');
INSERT INTO `sys_log` VALUES ('f3052c450b484974b228970a88e60dc2', 'GET', '/api/isLogin', '2018-05-29 16:59:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 2, '');
INSERT INTO `sys_log` VALUES ('967f646c077e463481f8d46a4bc57b2d', 'GET', '/api/msg/message', '2018-05-29 16:59:20', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 11, '');
INSERT INTO `sys_log` VALUES ('920ed2a003c54fd99b0c4f29df7d8806', 'GET', '/api/isLogin', '2018-05-29 17:00:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 4, '');
INSERT INTO `sys_log` VALUES ('01c4a68c8eaf497a8612e6b302375dd2', 'GET', '/api/msg/message', '2018-05-29 17:00:20', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 17, '');
INSERT INTO `sys_log` VALUES ('ea77952ed9b24721b576c83fd3e9f9c5', 'GET', '/api/isLogin', '2018-05-29 17:01:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 29, '');
INSERT INTO `sys_log` VALUES ('77d12aab22214023a4b76f11a3b1e155', 'GET', '/api/msg/message', '2018-05-29 17:01:20', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 10, '');
INSERT INTO `sys_log` VALUES ('7931ac64259e4907bdb82a6688fe2d1e', 'GET', '/api/isLogin', '2018-05-29 17:02:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 2, '');
INSERT INTO `sys_log` VALUES ('f4dd8d805b154c2593390fadc82a49b0', 'GET', '/api/msg/message', '2018-05-29 17:02:20', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 9, '');
INSERT INTO `sys_log` VALUES ('9538eb7a945c408bad1d760fad59f569', 'GET', '/api/isLogin', '2018-05-29 17:03:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 1, '');
INSERT INTO `sys_log` VALUES ('e821a121db7c499fa3b92e8de0cca40c', 'GET', '/api/msg/message', '2018-05-29 17:03:20', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 8, '');
INSERT INTO `sys_log` VALUES ('51f9ce4901be420dab84d8ce03ea5ad6', 'GET', '/api/isLogin', '2018-05-29 17:04:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 18, '');
INSERT INTO `sys_log` VALUES ('5ebaa02ba1664e5e837cd00fe26706eb', 'GET', '/api/msg/message', '2018-05-29 17:04:20', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 12, '');
INSERT INTO `sys_log` VALUES ('fc4b2839803046cf86d464775326d413', 'GET', '/api/isLogin', '2018-05-29 17:05:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 1, '');
INSERT INTO `sys_log` VALUES ('7fad5c3d4f704c1c9e6b750d4cacb3d5', 'GET', '/api/msg/message', '2018-05-29 17:05:20', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 10, '');
INSERT INTO `sys_log` VALUES ('4a0bcec689354113b5cc9f6f1fcbef80', 'GET', '/api/isLogin', '2018-05-29 17:06:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 3, '');
INSERT INTO `sys_log` VALUES ('7714e73484f14cc69d2bfbd2838de480', 'GET', '/api/msg/message', '2018-05-29 17:06:20', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 13, '');
INSERT INTO `sys_log` VALUES ('b552e090c5fb4e89a26248c40434258c', 'GET', '/api/isLogin', '2018-05-29 17:07:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 20, '');
INSERT INTO `sys_log` VALUES ('b3406b6c1f924069ac28e745987e5ce6', 'GET', '/api/msg/message', '2018-05-29 17:07:20', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 21, '');
INSERT INTO `sys_log` VALUES ('9d97dfc3fdd94424b361010cb39e5cd5', 'GET', '/api/isLogin', '2018-05-29 17:08:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 1, '');
INSERT INTO `sys_log` VALUES ('0fc2f1d4abd049a9b066cf4a1aa59a68', 'GET', '/api/msg/message', '2018-05-29 17:08:20', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 9, '');
INSERT INTO `sys_log` VALUES ('6fc5aa75dd644bb0801079eeebca339d', 'GET', '/api/isLogin', '2018-05-29 17:09:03', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 15, '');
INSERT INTO `sys_log` VALUES ('ae85a9b605b44344a56b897333579597', 'GET', '/api/msg/message', '2018-05-29 17:09:20', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 15, '');
INSERT INTO `sys_log` VALUES ('d28ca90a2cf44e7196bebd47e9f8d6ef', 'GET', '/api/isLogin', '2018-05-29 17:10:03', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 2, '');
INSERT INTO `sys_log` VALUES ('fc3f977efcb449e8b32c14ccc03d81cd', 'GET', '/error', '2018-05-29 17:10:04', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 1, '');
INSERT INTO `sys_log` VALUES ('33d3ffcddcbb410593b0cc02e07bd954', 'GET', '/api/isLogin', '2018-05-29 17:10:06', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 1, '');
INSERT INTO `sys_log` VALUES ('8d63c138913043edb6782e9173ef132e', 'GET', '/error', '2018-05-29 17:10:06', NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 1, '');
INSERT INTO `sys_log` VALUES ('03ebccb83ad145a5917017b552f91517', 'GET', '/api/login', '2018-05-29 17:35:15', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{password=admin, verifyCode=, isRememberMe=false, username=admin}', 2190, '');
INSERT INTO `sys_log` VALUES ('6f2da765e60740cc99a2c65a5272f705', 'GET', '/error', '2018-05-29 17:35:16', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 41, '');
INSERT INTO `sys_log` VALUES ('d196012deeac4b0699bfe9cd6a6173a4', 'GET', '/api/initData', '2018-05-29 17:35:21', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 1172, '');
INSERT INTO `sys_log` VALUES ('bbf676dcabba4b5f8fb752073c1b33aa', 'GET', '/error', '2018-05-29 17:35:21', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 4, '');
INSERT INTO `sys_log` VALUES ('f068d52b76744065803d9d116e441418', 'GET', '/error', '2018-05-29 17:35:21', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 12, '');
INSERT INTO `sys_log` VALUES ('94a90b3105584e60b19cc47471db322c', 'GET', '/api/msg/message', '2018-05-29 17:35:21', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 526, '');
INSERT INTO `sys_log` VALUES ('dd434817887b425880ad207d788a89fc', 'GET', '/error', '2018-05-29 17:35:25', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 3, '');
INSERT INTO `sys_log` VALUES ('76e7028de71a428a9d31beda9f7b49ff', 'GET', '/api/msg/message', '2018-05-29 17:35:36', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 72, '');
INSERT INTO `sys_log` VALUES ('2a2d2a9e30134264abe6388c5baa1fc5', 'PUT', '/api/updateUserInfo', '2018-05-29 17:36:02', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 122, '');
INSERT INTO `sys_log` VALUES ('b6767106571841c0a838d0c3ef8d6150', 'PUT', '/api/updatePassword', '2018-05-29 17:36:12', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{oldPassword=admin, newPassword=abc123}', 159, '');
INSERT INTO `sys_log` VALUES ('d6983c05cae44143959a3acb99eb3ed1', 'GET', '/api/sys/role', '2018-05-29 17:36:18', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, roleName=, pageSize=10}', 87, '');
INSERT INTO `sys_log` VALUES ('13c10cb1716a4dc2b8f417f2e5ecef8e', 'GET', '/api/isLogin', '2018-05-29 17:36:19', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 4, '');
INSERT INTO `sys_log` VALUES ('366ec6b4e74246619fa240b8b046ac57', 'GET', '/api/msg/message', '2018-05-29 17:36:21', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 22, '');
INSERT INTO `sys_log` VALUES ('efd8eda2c41e4e15b768225788265494', 'GET', '/api/sys/menu/tree', '2018-05-29 17:36:22', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 355, '');
INSERT INTO `sys_log` VALUES ('f21cc558d7ec4dd5991a3393db2f6e1f', 'GET', '/api/sys/role/1', '2018-05-29 17:36:22', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 469, '');
INSERT INTO `sys_log` VALUES ('7cfb6d6a009b4dfb8b058abfa07dbe79', 'GET', '/api/sys/homeComponent', '2018-05-29 17:36:23', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 363, '');
INSERT INTO `sys_log` VALUES ('28900d9549c94b4fb8e10a3419c66a51', 'PUT', '/api/sys/role', '2018-05-29 17:36:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 598, '');
INSERT INTO `sys_log` VALUES ('e155e98fe6be4440af758b9e411b8db2', 'GET', '/api/sys/role', '2018-05-29 17:36:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, roleName=, pageSize=10}', 7, '');
INSERT INTO `sys_log` VALUES ('7acbd97d53454ca9b4ca523aee5d9ae9', 'GET', '/api/sys/homeComponent', '2018-05-29 17:36:39', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 18, '');
INSERT INTO `sys_log` VALUES ('b3f2e0ba0e444414a087e483d8a150bd', 'GET', '/api/sys/role/20', '2018-05-29 17:36:39', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 26, '');
INSERT INTO `sys_log` VALUES ('c1ad3bdf6da2493a8d873ec596e1d458', 'GET', '/api/sys/menu/tree', '2018-05-29 17:36:39', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 36, '');
INSERT INTO `sys_log` VALUES ('6a2f962354004ec781e6aa41b4104434', 'GET', '/api/isLogin', '2018-05-29 17:37:19', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 13, '');
INSERT INTO `sys_log` VALUES ('0c1c0480804144fbbfb320c741ac2715', 'GET', '/api/msg/message', '2018-05-29 17:37:21', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 13, '');
INSERT INTO `sys_log` VALUES ('7887f65742354195ba6ee38000caf54b', 'PUT', '/api/sys/role', '2018-05-29 17:37:23', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 42, '');
INSERT INTO `sys_log` VALUES ('511c93f70c56421b9acda8eed86fe493', 'GET', '/api/sys/role', '2018-05-29 17:37:23', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, roleName=, pageSize=10}', 8, '');
INSERT INTO `sys_log` VALUES ('b9587a87401b41a2bb5dd8594cb82d21', 'GET', '/api/sys/role/30', '2018-05-29 17:37:27', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 23, '');
INSERT INTO `sys_log` VALUES ('8bd89729fbbf433eb0ba22d8b4fcc72c', 'GET', '/api/sys/menu/tree', '2018-05-29 17:37:27', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 25, '');
INSERT INTO `sys_log` VALUES ('2f93dc1941f24147a7b5c9ceb9152ff3', 'GET', '/api/sys/homeComponent', '2018-05-29 17:37:27', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 13, '');
INSERT INTO `sys_log` VALUES ('0ce8bca03f954933a77e0f195f113cb0', 'PUT', '/api/sys/role', '2018-05-29 17:37:38', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 25, '');
INSERT INTO `sys_log` VALUES ('afae1eef4c0b4292adeef6f4a5951066', 'GET', '/api/sys/role', '2018-05-29 17:37:38', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, roleName=, pageSize=10}', 14, '');
INSERT INTO `sys_log` VALUES ('d775efd63af0494d983b227c00e79c8c', 'GET', '/api/sys/homeComponent', '2018-05-29 17:37:45', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 8, '');
INSERT INTO `sys_log` VALUES ('103b4b2aa747457eb6607ec2e9f22a5b', 'GET', '/api/sys/role/20', '2018-05-29 17:37:45', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 27, '');
INSERT INTO `sys_log` VALUES ('ee8d967ef9064dd98a05733e0a6f6a8b', 'GET', '/api/sys/menu/tree', '2018-05-29 17:37:45', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 31, '');
INSERT INTO `sys_log` VALUES ('5cd9002526284db398a68411940ba290', 'PUT', '/api/sys/role', '2018-05-29 17:37:51', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 25, '');
INSERT INTO `sys_log` VALUES ('0725450cb3164f21b8633811e5a120e2', 'GET', '/api/sys/role', '2018-05-29 17:37:51', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, roleName=, pageSize=10}', 13, '');
INSERT INTO `sys_log` VALUES ('273b51c21a2f464d88f52aaaa8fa6025', 'GET', '/api/sys/office/tree', '2018-05-29 17:37:55', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 272, '');
INSERT INTO `sys_log` VALUES ('b1c58f38a2734307b4175c9222d17e12', 'GET', '/api/sys/office/tree', '2018-05-29 17:38:10', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 66, '');
INSERT INTO `sys_log` VALUES ('4fd1b24de5204f94bf642a7834643541', 'GET', '/api/sys/office/17', '2018-05-29 17:38:10', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 8, '');
INSERT INTO `sys_log` VALUES ('38772c7ac8bb4e6d89dbbc67fa47fca0', 'GET', '/api/sys/area/tree', '2018-05-29 17:38:10', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 53, '');
INSERT INTO `sys_log` VALUES ('13df0abafdc94950a6b59527286d0a2f', 'GET', '/api/user/manager', '2018-05-29 17:38:10', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, pageSize=10}', 76, '');
INSERT INTO `sys_log` VALUES ('9c9479b366c547daa0045a245208db45', 'GET', '/api/isLogin', '2018-05-29 17:38:19', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 3, '');
INSERT INTO `sys_log` VALUES ('9470ee9e4c63471494c4077e94a35c19', 'GET', '/api/msg/message', '2018-05-29 17:38:21', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 12, '');
INSERT INTO `sys_log` VALUES ('96312913b0084528969612c1960f50c4', 'PUT', '/api/sys/office', '2018-05-29 17:38:39', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 108, '');
INSERT INTO `sys_log` VALUES ('1582e841e59b4c3a8be1b39d512f28c8', 'GET', '/api/sys/office/tree', '2018-05-29 17:38:39', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 35, '');
INSERT INTO `sys_log` VALUES ('6a5a42ed57624926865cbb036c7a2b86', 'GET', '/api/sys/dict/type', '2018-05-29 17:39:02', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 61, '');
INSERT INTO `sys_log` VALUES ('65f14641704948339011557bbabf7a34', 'GET', '/api/sys/dict', '2018-05-29 17:39:02', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, description=, pageSize=10, type=}', 68, '');
INSERT INTO `sys_log` VALUES ('d8309aa59402494e96a6e279610ccf27', 'GET', '/api/sys/area/tree', '2018-05-29 17:39:04', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 15, '');
INSERT INTO `sys_log` VALUES ('8fc8016ceaf04f338e3132004a723c77', 'GET', '/api/isLogin', '2018-05-29 17:39:19', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 8, '');
INSERT INTO `sys_log` VALUES ('af0f112c205b442f98f4da89cec272ee', 'GET', '/api/msg/message', '2018-05-29 17:39:21', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 10, '');
INSERT INTO `sys_log` VALUES ('c4b4ec7f2fe740eab5bf7b1be869fc75', 'GET', '/api/sys/office/tree', '2018-05-29 17:39:47', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 38, '');
INSERT INTO `sys_log` VALUES ('19c1a8380928476d90b4325966072743', 'GET', '/api/user/manager', '2018-05-29 17:39:52', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, pageSize=10}', 55, '');
INSERT INTO `sys_log` VALUES ('c23725ddbd914760943537605cde9e4d', 'GET', '/api/user/manager', '2018-05-29 17:40:08', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, pageSize=10}', 20, '');
INSERT INTO `sys_log` VALUES ('ea82a2bf2a7d42058a95640bcd4b30c5', 'GET', '/api/sys/office/tree', '2018-05-29 17:40:09', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 53, '');
INSERT INTO `sys_log` VALUES ('426d917fed9c4be1a60bd2905cc2db61', 'GET', '/api/sys/role', '2018-05-29 17:40:10', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageNo=1, roleName=, pageSize=10}', 5, '');
INSERT INTO `sys_log` VALUES ('0592e49d1a3944b38aa6e4261933d8f4', 'GET', '/api/sys/menu/tree', '2018-05-29 17:40:11', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 32, '');
INSERT INTO `sys_log` VALUES ('656f8450f1d64124ab8aad70a61b1147', 'GET', '/api/sys/area/tree', '2018-05-29 17:40:11', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 10, '');
INSERT INTO `sys_log` VALUES ('9d4f6895147a41c08490b2f98969e62f', 'GET', '/api/sys/menu/tree', '2018-05-29 17:40:13', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 14, '');
INSERT INTO `sys_log` VALUES ('32f1ae6d96044453828dadcfd74fdd27', 'GET', '/api/isLogin', '2018-05-29 17:40:19', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 3, '');
INSERT INTO `sys_log` VALUES ('8cde09b2a9d4405d96d07c5386d152be', 'GET', '/api/msg/message', '2018-05-29 17:40:21', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 12, '');
INSERT INTO `sys_log` VALUES ('93c226b22eab4285b400ac07e8bbcdd3', 'POST', '/api/sys/menu/27/sort', '2018-05-29 17:40:30', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{sort=1}', 26, '');
INSERT INTO `sys_log` VALUES ('ae62dbceb8d4460fae84b94cde9c0fbd', 'GET', '/api/sys/menu/24', '2018-05-29 17:40:30', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 4, '');
INSERT INTO `sys_log` VALUES ('be88f8aa54244f10b64be015a0cb0e0b', 'GET', '/api/sys/menu/tree', '2018-05-29 17:40:30', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 18, '');
INSERT INTO `sys_log` VALUES ('08c1f0ebba5f49469d21ec78808513d8', 'PUT', '/api/sys/menu', '2018-05-29 17:40:37', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 42, '');
INSERT INTO `sys_log` VALUES ('c376f6cfa7ab4f53bb9534d19addbd65', 'GET', '/api/sys/menu/tree', '2018-05-29 17:40:37', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 22, '');
INSERT INTO `sys_log` VALUES ('23c2b5253da6437f8b4fe38c8b56e2b8', 'GET', '/api/msg/message', '2018-05-29 17:40:49', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 23, '');
INSERT INTO `sys_log` VALUES ('a1a4a5be75104dc39d9d269a29ddb47e', 'GET', '/api/sys/menu/tree', '2018-05-29 17:40:49', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 11, '');
INSERT INTO `sys_log` VALUES ('e97cd88fd09d4e8f94668cea0ef4e1e7', 'GET', '/api/isLogin', '2018-05-29 17:41:19', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36', '127.0.0.1', '{}', 6, '');
INSERT INTO `sys_log` VALUES ('af054bb6def4480a84a07b356d44c8f4', 'GET', '/api/login', '2018-06-01 11:27:22', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{password=abc123, verifyCode=, isRememberMe=false, username=admin}', 4322, '');
INSERT INTO `sys_log` VALUES ('3aadfb244b164ccdbf22314f74fd00e0', 'GET', '/error', '2018-06-01 11:27:25', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 99, '');
INSERT INTO `sys_log` VALUES ('555337bb0bf04792b1ee835afb485dbe', 'GET', '/api/initData', '2018-06-01 11:27:35', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 3473, '');
INSERT INTO `sys_log` VALUES ('84ec58d3918c48aeb79bf45af7375ead', 'GET', '/error', '2018-06-01 11:27:42', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 8, '');
INSERT INTO `sys_log` VALUES ('4f6fcdb1415b4565beef89c91a54daf3', 'GET', '/api/msg/message', '2018-06-01 11:27:43', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 1215, '');
INSERT INTO `sys_log` VALUES ('033734c99d2b40e289bbe23786d9f35c', 'GET', '/error', '2018-06-01 11:27:45', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 8, '');
INSERT INTO `sys_log` VALUES ('737796d5656c448aaebc1e57a15d50a9', 'GET', '/error', '2018-06-01 11:27:51', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 16, '');
INSERT INTO `sys_log` VALUES ('144863ee8c664cd9b0c944695c0f17ea', 'GET', '/error', '2018-06-01 11:27:55', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 2, '');
INSERT INTO `sys_log` VALUES ('687f02cf984b4751b4eb7d12976ebea1', 'GET', '/api/isLogin', '2018-06-01 11:28:32', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 304, '');
INSERT INTO `sys_log` VALUES ('ebaf5a2d43764b38ba1997c39fa57bbb', 'GET', '/api/msg/message', '2018-06-01 11:28:41', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 68, '');
INSERT INTO `sys_log` VALUES ('b9a444bcc32547c1b1a4ce71bf25298e', 'GET', '/api/isLogin', '2018-06-01 11:29:32', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 43, '');
INSERT INTO `sys_log` VALUES ('2146f6f1aab1456f82e9e3a0bb910f48', 'GET', '/api/msg/message', '2018-06-01 11:29:42', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 19, '');
INSERT INTO `sys_log` VALUES ('7b2625d201f642b8a8b67b286ba36ebb', 'GET', '/api/isLogin', '2018-06-01 11:30:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 10, '');
INSERT INTO `sys_log` VALUES ('983f89d4987b48efbc2ab03ff2431fbe', 'GET', '/api/msg/message', '2018-06-01 11:30:42', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 18, '');
INSERT INTO `sys_log` VALUES ('2f3e64a5c4f646259626a6bbd3961132', 'GET', '/api/isLogin', '2018-06-01 11:31:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 12, '');
INSERT INTO `sys_log` VALUES ('e6d0bb41921b4249a5390771720c3772', 'GET', '/api/msg/message', '2018-06-01 11:31:42', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 14, '');
INSERT INTO `sys_log` VALUES ('aac9064b8f4448519b0c358f1d545989', 'GET', '/api/isLogin', '2018-06-01 11:32:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 3, '');
INSERT INTO `sys_log` VALUES ('ab22487ac29b4e01ac68dd1e137b7ffa', 'GET', '/api/msg/message', '2018-06-01 11:32:42', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 14, '');
INSERT INTO `sys_log` VALUES ('889f7630ab3f4295b534ef8ac17ceab6', 'GET', '/api/isLogin', '2018-06-01 11:33:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 25, '');
INSERT INTO `sys_log` VALUES ('c41de7c401b74e12a71864ebf4eadd59', 'GET', '/api/msg/message', '2018-06-01 11:33:42', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 21, '');
INSERT INTO `sys_log` VALUES ('5ff113ea8351445ab3300368eac844e0', 'GET', '/api/isLogin', '2018-06-01 11:34:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 17, '');
INSERT INTO `sys_log` VALUES ('ac871620133b4359a866b67bd5d96ef4', 'GET', '/api/msg/message', '2018-06-01 11:34:42', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 21, '');
INSERT INTO `sys_log` VALUES ('1ffdcd62371740ffb910e1a8b92a268d', 'GET', '/api/isLogin', '2018-06-01 11:35:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 4, '');
INSERT INTO `sys_log` VALUES ('795d50dab3ad4cd593bfe546d2d22f22', 'GET', '/api/msg/message', '2018-06-01 11:35:42', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 12, '');
INSERT INTO `sys_log` VALUES ('eaebf2a7b2694a7ba8bb4cfba5a4c356', 'GET', '/api/isLogin', '2018-06-01 11:36:32', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 31, '');
INSERT INTO `sys_log` VALUES ('98627e12838b4b7397adde4241b6a2aa', 'GET', '/api/msg/message', '2018-06-01 11:36:42', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 22, '');
INSERT INTO `sys_log` VALUES ('2ff4c86447514c78a30399ebd17fae11', 'GET', '/api/isLogin', '2018-06-01 11:37:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 15, '');
INSERT INTO `sys_log` VALUES ('cbf3b2a59ced486897b5dee8b856326c', 'GET', '/api/msg/message', '2018-06-01 11:37:42', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 41, '');
INSERT INTO `sys_log` VALUES ('ab8925b2f8f241af8d49737d58f6c6ef', 'GET', '/api/isLogin', '2018-06-01 11:38:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 14, '');
INSERT INTO `sys_log` VALUES ('251016fb642a4d55b4e421dad90c3a53', 'GET', '/api/msg/message', '2018-06-01 11:38:42', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 16, '');
INSERT INTO `sys_log` VALUES ('bc9e1ae1f2424b02a1c664fe5579e9d2', 'GET', '/api/isLogin', '2018-06-01 11:39:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 24, '');
INSERT INTO `sys_log` VALUES ('2310739d3dc842ddabbc8fa6272b097d', 'GET', '/api/msg/message', '2018-06-01 11:39:42', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 19, '');
INSERT INTO `sys_log` VALUES ('4316e5a1a27b41f1bb016900ef0082ee', 'GET', '/api/isLogin', '2018-06-01 11:40:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 44, '');
INSERT INTO `sys_log` VALUES ('e1d8c3c5832948fda5e4d8f2ee22417e', 'GET', '/api/msg/message', '2018-06-01 11:40:42', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 23, '');
INSERT INTO `sys_log` VALUES ('01ca48583d9a4871bad6a35e0469caf5', 'GET', '/api/isLogin', '2018-06-01 11:41:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 13, '');
INSERT INTO `sys_log` VALUES ('62499d80feb84e16b8c8d7307baf25f0', 'GET', '/api/msg/message', '2018-06-01 11:41:42', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 15, '');
INSERT INTO `sys_log` VALUES ('4f9ffa2644d544cba4236ff60fa48401', 'GET', '/api/isLogin', '2018-06-01 11:42:33', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 22, '');
INSERT INTO `sys_log` VALUES ('bfaf7e4c46464f1b851b809867c45ac0', 'GET', '/api/msg/message', '2018-06-01 11:42:42', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 19, '');
INSERT INTO `sys_log` VALUES ('870f163c6d3e435eb4915d387d6d7fba', 'GET', '/api/isLogin', '2018-06-01 11:44:18', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 29, '');
INSERT INTO `sys_log` VALUES ('d1274fbd370642068a91d7c5056d74d0', 'GET', '/api/msg/message', '2018-06-01 11:44:25', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 46, '');
INSERT INTO `sys_log` VALUES ('e40a1307eb8b45ac89d565f1a291bfbe', 'GET', '/api/isLogin', '2018-06-01 11:45:04', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{}', 38, '');
INSERT INTO `sys_log` VALUES ('e77ba5546e5646d984edd8d0a1b0c7a4', 'GET', '/api/msg/message', '2018-06-01 11:45:04', '2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', '127.0.0.1', '{pageSize=5, status=0}', 80, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL,
  `parent_id` varchar(64) DEFAULT NULL,
  `parent_ids` varchar(2000) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `is_show` int(11) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('03543b49ebbe4fccb5b1e55298027ec2', 'f9f13acd9c6247788520a512f6d5b147', '0,1,60076411112b4dbe93d126ed9865621f,f9f13acd9c6247788520a512f6d5b147,', '电子印章管理', '/esign/seal/list', '', 30, 1, 'esign:seal:view', 1, '');
INSERT INTO `sys_menu` VALUES ('0f1bf417ebb34a88802319c379152622', '60076411112b4dbe93d126ed9865621f', '0,1,60076411112b4dbe93d126ed9865621f,', '123123', '123123', 'fa fa-american-sign-language-interpreting', 11, 1, '1233', 1, '');
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '顶级菜单', '', '', 0, 1, '', 0, '');
INSERT INTO `sys_menu` VALUES ('10', '3', '0,1,2,3,', '字典管理', '/system/dict', 'fa fa-book', 1, 1, '', 0, '');
INSERT INTO `sys_menu` VALUES ('11', '10', '0,1,2,3,10,', '查看', '', '', 30, 0, 'sys:dict:view', 0, '');
INSERT INTO `sys_menu` VALUES ('12', '10', '0,1,2,3,10,', '修改', '', '', 30, 0, 'sys:dict:edit', 0, '');
INSERT INTO `sys_menu` VALUES ('13', '2', '0,1,2,', '机构用户', '', 'fa fa-user', 2, 1, '', 0, '');
INSERT INTO `sys_menu` VALUES ('13d3119a9d', '6cff3118a9', '0,1,7c5e610086,6cff3118a9,', '供应商黑名单', '/user/supplier/blacklist', '', 0, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('14', '3', '0,1,2,3,', '区域管理', '/system/area/', 'fa fa-globe', 2, 1, '', 0, '');
INSERT INTO `sys_menu` VALUES ('15', '14', '0,1,2,3,14,', '查看', '', '', 30, 0, 'sys:area:view', 0, '');
INSERT INTO `sys_menu` VALUES ('16', '14', '0,1,2,3,14,', '修改', '', '', 30, 0, 'sys:area:edit', 0, '');
INSERT INTO `sys_menu` VALUES ('17', '13', '0,1,2,13,', '机构管理', '/system/office/', 'fa fa-users', 1, 1, '', 0, '');
INSERT INTO `sys_menu` VALUES ('18', '17', '0,1,2,13,17,', '查看', '', '', 30, 0, 'sys:office:view', 0, '');
INSERT INTO `sys_menu` VALUES ('19', '17', '0,1,2,13,17,', '修改', '', '', 30, 0, 'sys:office:edit', 0, '');
INSERT INTO `sys_menu` VALUES ('1c3987d505', '27', '0,1,27,', '我的任务', '', '', 1, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('1c61dc1fa7', '3', '0,1,2,3,', '须知文件管理', '/system/notice', 'fa fa-map-o', 3, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('2', '1', '0,1,', '系统设置', '', 'fa fa-gear', 2, 1, '', 0, '');
INSERT INTO `sys_menu` VALUES ('20', '13', '0,1,2,13,', '用户管理', '/system/user/', 'fa fa-user', 2, 1, '', 0, '');
INSERT INTO `sys_menu` VALUES ('21', '20', '0,1,2,13,20,', '查看', '', '', 30, 0, 'sys:user:view', 0, '');
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,2,13,20,', '修改', '', '', 30, 0, 'sys:user:edit', 0, '');
INSERT INTO `sys_menu` VALUES ('23', '2', '0,1,2,', '关于帮助', '', 'fa fa-question-circle-o', 4, 1, '', 0, '');
INSERT INTO `sys_menu` VALUES ('24', '23', '0,1,2,23,', '项目首页', 'https://github.com/', '', 1, 1, '', 0, '333');
INSERT INTO `sys_menu` VALUES ('25', '23', '0,1,2,23,', '项目支持', 'http://jeesite.com/donation.html', '', 50, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('252ecfdfba', '78', '0,1,76,77,78,', '1', '1', '', 0, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('26', '23', '0,1,2,23,', '论坛交流', 'http://bbs.jeesite.com', '', 80, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '我的面板', '', '', 1, 1, '', 0, '');
INSERT INTO `sys_menu` VALUES ('28', '27', '0,1,27,', '个人信息', '', '', 1, 1, '', 0, '');
INSERT INTO `sys_menu` VALUES ('286aa89bd5ac4f82a1d4035566a3316d', '60076411112b4dbe93d126ed9865621f', '0,1,60076411112b4dbe93d126ed9865621f,', 'ce', 'ce', '', 1, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('29', '28', '0,1,27,28,', '个人信息', '/personal/user-info', 'fa fa-user', 1, 1, '', 0, '');
INSERT INTO `sys_menu` VALUES ('2a41260e4a', '68fc127343', '0,1,7c5e610086,68fc127343,', '评标专家管理', '/user/expert/manage', '', 0, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('2bf25dcf7dd6455ea4af547b015f7784', '1', '0,1,', 'test', 'test', 'test', 1, 1, 'test', 1, '');
INSERT INTO `sys_menu` VALUES ('3', '2', '0,1,2,', '系统设置', '', 'fa fa-cog', 1, 1, '', 0, '');
INSERT INTO `sys_menu` VALUES ('30', '28', '0,1,27,28,', '修改密码', '/personal/password', 'fa fa-asterisk', 2, 1, '', 0, '');
INSERT INTO `sys_menu` VALUES ('31', '1', '0,1,', '内容管理', '', '', 500, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('318c049c8ba0415194623c851bebd612', '27', '0,1,27,', 'test', 'test', 'test', 1, 1, 'test', 1, '');
INSERT INTO `sys_menu` VALUES ('32', '31', '0,1,31,', '栏目设置', '', '', 990, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('32df3d86a3', '3', '0,1,2,3,', '采购类别管理', '/system/purchaseType', 'fa fa-cog', 1, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('33', '32', '0,1,31,32,', '栏目管理', '/cms/category/', 'align-justify', 30, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('34', '33', '0,1,31,32,33,', '查看', '', '', 30, 0, 'cms:category:view', 1, '');
INSERT INTO `sys_menu` VALUES ('341c52aacbb446189475da029dff106f', '60076411112b4dbe93d126ed9865621f', '0,1,60076411112b4dbe93d126ed9865621f,', '123', '123', '', 123, 1, '123', 1, '');
INSERT INTO `sys_menu` VALUES ('35', '33', '0,1,31,32,33,', '修改', '', '', 30, 0, 'cms:category:edit', 1, '');
INSERT INTO `sys_menu` VALUES ('36', '32', '0,1,31,32,', '站点设置', '/cms/site/', 'certificate', 40, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('37', '36', '0,1,31,32,36,', '查看', '', '', 30, 0, 'cms:site:view', 1, '');
INSERT INTO `sys_menu` VALUES ('38', '36', '0,1,31,32,36,', '修改', '', '', 30, 0, 'cms:site:edit', 1, '');
INSERT INTO `sys_menu` VALUES ('39', '32', '0,1,31,32,', '切换站点', '/cms/site/select', 'retweet', 50, 1, 'cms:site:select', 1, '');
INSERT INTO `sys_menu` VALUES ('3d33c15c65', '78', '0,1,76,77,78,', '3', '3', '', 2, 1, '3', 1, '3');
INSERT INTO `sys_menu` VALUES ('3f4102309ffb4b21b8819bb68411ea29', '56d07f16fc324de98cb6dbe7e3fa1b41', '0,1,60076411112b4dbe93d126ed9865621f,f9f13acd9c6247788520a512f6d5b147,56d07f16fc324de98cb6dbe7e3fa1b41,', '修改', '123', '123', 31, 0, 'esign:seal:edit', 1, '');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,2,3,', '菜单管理', '/system/menu', 'fa fa-reorder', 3, 1, '', 0, '');
INSERT INTO `sys_menu` VALUES ('40', '31', '0,1,31,', '内容管理', '', '', 500, 1, 'cms:view', 1, '');
INSERT INTO `sys_menu` VALUES ('41', '40', '0,1,31,40,', '内容发布', '/cms/', 'briefcase', 30, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('42', '41', '0,1,31,40,41,', '文章模型', '/cms/article/', 'file', 40, 0, '', 1, '');
INSERT INTO `sys_menu` VALUES ('43', '42', '0,1,31,40,41,42,', '查看', '', '', 30, 0, 'cms:article:view', 1, '');
INSERT INTO `sys_menu` VALUES ('44', '42', '0,1,31,40,41,42,', '修改', '', '', 30, 0, 'cms:article:edit', 1, '');
INSERT INTO `sys_menu` VALUES ('447324563e3b42909b55c7ef09ade6e6', 'f3a5bd24a58a4d6c88fab8d777f30775', '0,1,60076411112b4dbe93d126ed9865621f,f3a5bd24a58a4d6c88fab8d777f30775,', '123', '123', '', 1, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('44b175530d', '1c3987d505', '0,1,27,1c3987d505,', '待办任务', '/task/todo', '', 1, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('45', '42', '0,1,31,40,41,42,', '审核', '', '', 30, 0, 'cms:article:audit', 1, '');
INSERT INTO `sys_menu` VALUES ('46', '41', '0,1,31,40,41,', '链接模型', '/cms/link/', 'random', 60, 0, '', 1, '');
INSERT INTO `sys_menu` VALUES ('47', '46', '0,1,31,40,41,46,', '查看', '', '', 30, 0, 'cms:link:view', 1, '');
INSERT INTO `sys_menu` VALUES ('48', '46', '0,1,31,40,41,46,', '修改', '', '', 30, 0, 'cms:link:edit', 1, '');
INSERT INTO `sys_menu` VALUES ('482c5bef18', '3', '0,1,2,3,', '银行账户配置', '/system/setting', 'fa fa-credit-card-alt', 5, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('49', '46', '0,1,31,40,41,46,', '审核', '', '', 30, 0, 'cms:link:audit', 1, '');
INSERT INTO `sys_menu` VALUES ('4a6856890a0c49b7ac197561668b951a', '341c52aacbb446189475da029dff106f', '0,1,60076411112b4dbe93d126ed9865621f,341c52aacbb446189475da029dff106f,', '12344', '12344', '', 12344, 1, '12344', 1, '');
INSERT INTO `sys_menu` VALUES ('5', '4', '0,1,2,3,4,', '查看', '', '', 30, 0, 'sys:menu:view', 0, '');
INSERT INTO `sys_menu` VALUES ('50', '40', '0,1,31,40,', '评论管理', '/cms/comment/?status=2', 'comment', 40, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('51', '50', '0,1,31,40,50,', '查看', '', '', 30, 0, 'cms:comment:view', 1, '');
INSERT INTO `sys_menu` VALUES ('51bf175043c5439b93d242090712742e', '4a6856890a0c49b7ac197561668b951a', '0,1,60076411112b4dbe93d126ed9865621f,341c52aacbb446189475da029dff106f,4a6856890a0c49b7ac197561668b951a,', '1', '1', '', 1, 1, '1', 1, '');
INSERT INTO `sys_menu` VALUES ('52', '50', '0,1,31,40,50,', '审核', '', '', 30, 0, 'cms:comment:edit', 1, '');
INSERT INTO `sys_menu` VALUES ('53', '40', '0,1,31,40,', '公共留言', '/cms/guestbook/?status=2', 'glass', 80, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('54', '53', '0,1,31,40,53,', '查看', '', '', 30, 0, 'cms:guestbook:view', 1, '');
INSERT INTO `sys_menu` VALUES ('55', '53', '0,1,31,40,53,', '审核', '', '', 30, 0, 'cms:guestbook:edit', 1, '');
INSERT INTO `sys_menu` VALUES ('56', '40', '0,1,31,40,', '文件管理', '/../static/ckfinder/ckfinder.html', 'folder-open', 90, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('56d07f16fc324de98cb6dbe7e3fa1b41', 'f9f13acd9c6247788520a512f6d5b147', '0,1,60076411112b4dbe93d126ed9865621f,f9f13acd9c6247788520a512f6d5b147,', '电子印章制作', '/esign/seal/form', '', 30, 1, 'esign:seal:edit', 1, '');
INSERT INTO `sys_menu` VALUES ('57', '56', '0,1,31,40,56,', '查看', '', '', 30, 0, 'cms:ckfinder:view', 1, '');
INSERT INTO `sys_menu` VALUES ('58', '56', '0,1,31,40,56,', '上传', '', '', 30, 0, 'cms:ckfinder:upload', 1, '');
INSERT INTO `sys_menu` VALUES ('59', '56', '0,1,31,40,56,', '修改', '', '', 30, 0, 'cms:ckfinder:edit', 1, '');
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,2,3,4,', '修改', '', '', 30, 0, 'sys:menu:edit', 0, '');
INSERT INTO `sys_menu` VALUES ('60', '31', '0,1,31,', '统计分析', '', '', 600, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('60076411112b4dbe93d126ed9865621f', '1', '0,1,', '电子签章系统', '', '', 30, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('60c42688c0d44dfa9817cbec2ee9695d', '60076411112b4dbe93d126ed9865621f', '0,1,60076411112b4dbe93d126ed9865621f,', '12345', '', '', 30, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('61', '60', '0,1,31,60,', '信息量统计', '/cms/stats/article', 'tasks', 30, 1, 'cms:stats:article', 1, '');
INSERT INTO `sys_menu` VALUES ('62', '1', '0,1,', '在线办公', '', '', 200, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('63', '62', '0,1,62,', '个人办公', '', '', 30, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('64', '63', '0,1,62,63,', '请假办理', '/oa/leave', 'leaf', 30, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('65', '64', '0,1,62,63,64,', '查看', '', '', 30, 0, 'oa:leave:view', 1, '');
INSERT INTO `sys_menu` VALUES ('66', '64', '0,1,62,63,64,', '修改', '', '', 40, 0, 'oa:leave:edit', 1, '');
INSERT INTO `sys_menu` VALUES ('664aabf317', '28', '0,1,27,28,', '机构信息', '/personal/office-info', '', 1, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('67', '2', '0,1,2,', '日志查询', '', 'fa fa-newspaper-o', 3, 1, '', 0, '');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,1,2,67,', '日志查询', '/system/log', 'fa fa-newspaper-o', 1, 1, 'sys:log:view', 0, '');
INSERT INTO `sys_menu` VALUES ('68ece5978986451cabde1013b9ddad30', '27', '0,1,27,', 'test', 'test', 'test', 1, 1, 'test', 1, '');
INSERT INTO `sys_menu` VALUES ('68fc127343', '7c5e610086', '0,1,7c5e610086,', '专家管理', '', '', 0, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('69', '2', '0,1,2,', '流程管理', '', '', 983, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('69d3b2438c79417c8679578c958ed508', '27', '0,1,27,', 'test', 'test', 'test', 1, 1, 'test', 1, '');
INSERT INTO `sys_menu` VALUES ('6a06cc8656', '6cff3118a9', '0,1,7c5e610086,6cff3118a9,', '供应商投标类别审核', '/user/supplier/purchase-audit', '', 0, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('6cff3118a9', '7c5e610086', '0,1,7c5e610086,', '供应商管理', '', '', 0, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('6efa109c17db4314b80c7adf26d2f13b', 'f3a5bd24a58a4d6c88fab8d777f30775', '0,1,60076411112b4dbe93d126ed9865621f,f3a5bd24a58a4d6c88fab8d777f30775,', '签章日志审计', '/esign/signlog/list', '', 30, 1, 'esign:signlog:view', 1, '');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,2,3,', '角色管理', '/system/role', 'fa fa-child', 4, 1, '', 0, '');
INSERT INTO `sys_menu` VALUES ('70', '69', '0,1,2,69,', '流程管理', '/sys/workflow/processList', 'road', 300, 1, 'sys:workflow:edit', 1, '');
INSERT INTO `sys_menu` VALUES ('71', '64', '0,1,62,63,64,', '部门领导审批', '', '', 50, 0, 'oa:leave:deptLeaderAudit', 1, '');
INSERT INTO `sys_menu` VALUES ('72', '64', '0,1,62,63,64,', '人事审批', '', '', 60, 0, 'oa:leave:hrAudit', 1, '');
INSERT INTO `sys_menu` VALUES ('72bccbf103bd48e3ab4a1fbd3136e984', '03543b49ebbe4fccb5b1e55298027ec2', '0,1,60076411112b4dbe93d126ed9865621f,f9f13acd9c6247788520a512f6d5b147,03543b49ebbe4fccb5b1e55298027ec2,', '修改', '', '', 30, 0, '', 1, '');
INSERT INTO `sys_menu` VALUES ('73', '32', '0,1,31,32', '模板管理', '/cms/template', 'pencil', 40, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('74', '73', '0,1,31,32,73,', '查看', '', '', 30, 0, 'cms:template:view', 1, '');
INSERT INTO `sys_menu` VALUES ('75', '73', '0,1,31,32,73,', '修改', '', '', 30, 0, 'cms:template:edit', 1, '');
INSERT INTO `sys_menu` VALUES ('76', '1', '0,1,', '项目管理', '', '', 1000, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('77', '76', '0,1,76,', '项目数据', '', '', 30, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('78', '77', '0,1,76,77,', '项目管理', '/prj/project/', 'globe', 30, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('79', '78', '0,1,76,77,78,', '查看', '', '', 30, 0, 'prj:project:view', 1, '');
INSERT INTO `sys_menu` VALUES ('7c5e610086', '1', '0,1,', '用户管理', '', '', 3, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('7dfbfee854', '3', '0,1,2,3,', '专业类别管理', '/system/professionType', 'fa fa-cog', 2, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('8', '7', '0,1,2,3,7,', '查看', '', '', 30, 0, 'sys:role:view', 0, '');
INSERT INTO `sys_menu` VALUES ('80', '78', '0,1,76,77,78,', '修改', '', '', 40, 0, 'prj:project:edit', 1, '');
INSERT INTO `sys_menu` VALUES ('85bc175aac5a4b68b67e441a3839f7b9', '60076411112b4dbe93d126ed9865621f', '0,1,60076411112b4dbe93d126ed9865621f,', '2', '2', '2', 2, 1, '2', 1, '');
INSERT INTO `sys_menu` VALUES ('892986a2c5c342039b0b951dc2504015', 'f3a5bd24a58a4d6c88fab8d777f30775', '0,1,60076411112b4dbe93d126ed9865621f,f3a5bd24a58a4d6c88fab8d777f30775,', '234', '234', '', 22, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('9', '7', '0,1,2,3,7,', '修改', '', '', 30, 0, 'sys:role:edit', 0, '');
INSERT INTO `sys_menu` VALUES ('91e8eaf6-c6b1-4f1c-995d-7c1295f18527', '1', '0,1,', 'Swagger', '/swagger-ui.html', '', 3, 1, '', 0, 'Swagger 文档');
INSERT INTO `sys_menu` VALUES ('98ef6af5b6', '6cff3118a9', '0,1,7c5e610086,6cff3118a9,', '供应商管理', '/user/supplier/manage', '', 0, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('99137a21-9bc9-4808-a137-0cdca9697441', '1', '0,1,', '12322222', '12322222', '', 0, 1, '12322222', 1, '12322222');
INSERT INTO `sys_menu` VALUES ('9ab49ea28af04689aeb0018397a74650', '60076411112b4dbe93d126ed9865621f', '0,1,60076411112b4dbe93d126ed9865621f,', '123', '123', '123', 123, 0, '123', 1, '');
INSERT INTO `sys_menu` VALUES ('a2e8c9e87a444be9b00238e5fdb317f8', '17', '0,1,2,13,17,', '删除', '', '', 30, 0, 'sys:office:delete', 0, '');
INSERT INTO `sys_menu` VALUES ('ad7a8ca34e', '1c3987d505', '0,1,27,1c3987d505,', '已办任务', '/task/done', '', 2, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('adc17a5d16', '6cff3118a9', '0,1,7c5e610086,6cff3118a9,', '供应商审核', '/user/supplier/audit', '', 0, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('b08cf3b87d794b49907357e8783f56fc', '60076411112b4dbe93d126ed9865621f', '0,1,60076411112b4dbe93d126ed9865621f,', '123', '123', '123', 123, 0, '123', 1, '');
INSERT INTO `sys_menu` VALUES ('b7f383368de742ae883d296e1533084d', '60076411112b4dbe93d126ed9865621f', '0,1,60076411112b4dbe93d126ed9865621f,', '123', '123', '123', 123, 0, '123', 1, '');
INSERT INTO `sys_menu` VALUES ('c4644eba6c', '3', '0,1,2,3,', '评标室管理', '/system/room', 'fa fa-bank', 4, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('c90b9d3a9eb449c7a81fa7dbb80a6b8f', NULL, 'nullnull,', '', '', '', 1, 1, '', 0, '');
INSERT INTO `sys_menu` VALUES ('d697a8cb6b8c4e15a1d095ac3df4f299', '27', '0,1,27,', 'test', 'test', 'test', 1, 1, 'test', 1, '');
INSERT INTO `sys_menu` VALUES ('d9c1dd3d2f874205b0e9e67e3014ecee', '60076411112b4dbe93d126ed9865621f', '0,1,60076411112b4dbe93d126ed9865621f,', '测试1', '', '', 30, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('de586f6b4f584045820262c4b2eb4519', '341c52aacbb446189475da029dff106f', '0,1,60076411112b4dbe93d126ed9865621f,341c52aacbb446189475da029dff106f,', '1234', '1234', '', 1234, 1, '1234', 1, '');
INSERT INTO `sys_menu` VALUES ('dfc523e954', '6cff3118a9', '0,1,7c5e610086,6cff3118a9,', '供应商调查', '/user/supplier/questionnaire', '', 0, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('e29fdbff526d45dcaecab4489a79264b', '14', '0,1,2,3,14,', '删除', '', '', 3, 0, 'sys:area:delete', 0, '');
INSERT INTO `sys_menu` VALUES ('ec347ab221', '6cff3118a9', '0,1,7c5e610086,6cff3118a9,', '供应商等级管理', '/user/supplier/level', '', 0, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('ef2331fc79', '78', '0,1,76,77,78,', '2', '2', '', 1, 1, '2', 1, '2');
INSERT INTO `sys_menu` VALUES ('f13419c5ab3848bab83e69fba5aa264b', '20', '0,1,2,13,20,', '删除', '', '', 30, 1, 'sys:user:delete', 0, '');
INSERT INTO `sys_menu` VALUES ('f3a5bd24a58a4d6c88fab8d777f30775', '60076411112b4dbe93d126ed9865621f', '0,1,60076411112b4dbe93d126ed9865621f,', '日志审计', '', '', 30, 1, '', 1, '');
INSERT INTO `sys_menu` VALUES ('f9f13acd9c6247788520a512f6d5b147', '60076411112b4dbe93d126ed9865621f', '0,1,60076411112b4dbe93d126ed9865621f,', '印章管理', '', '', 30, 1, '', 1, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL,
  `area_id` varchar(10) DEFAULT NULL,
  `parent_id` varchar(64) DEFAULT NULL,
  `parent_ids` varchar(2000) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `master_id` varchar(10) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_office
-- ----------------------------
BEGIN;
INSERT INTO `sys_office` VALUES ('1', '2', '0', '0,', '100000', '北京市总公司', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('10', '8', '7', '0,1,7,', '200003', '市场部', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('11', '8', '7', '0,1,7,', '200004', '技术部', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('12', '9', '7', '0,1,7,', '201000', '济南市分公司', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('13', '9', '12', '0,1,7,12,', '201001', '公司领导', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('14', '9', '12', '0,1,7,12,', '201002', '综合部', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('15', '9', '12', '0,1,7,12,', '201003', '市场部', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('16', '9', '12', '0,1,7,12,', '201004', '技术部', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('17', '11', '12', '0,1,7,12,', '2010101', '济南市历城区分公司1', 1, 0, '11', '22', '2', NULL, '18666666666', '54', 'sunyu.zhcn@gmail.com', '76');
INSERT INTO `sys_office` VALUES ('18', '11', '17', '0,1,7,12,17,', '201011', '公司领导', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('19', '11', '17', '0,1,7,12,17,', '201012', '综合部', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('2', '2', '1', '0,1,', '100001', '公司领导', 1, 0, '1', '2', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('20', '11', '17', '0,1,7,12,17,', '201013', '市场部', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('21', '11', '17', '0,1,7,12,17,', '201014', '技术部', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('22', '12', '12', '0,1,7,12,', '201020', '济南市历下区分公司', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('23', '12', '22', '0,1,7,12,22,', '201021', '公司领导', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('24', '12', '22', '0,1,7,12,22,', '201022', '综合部', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('25', '12', '22', '0,1,7,12,22,', '201023', '市场部', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('26', '12', '22', '0,1,7,12,22,', '201024', '技术部', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('3', '2', '1', '0,1,', '100002', '人力部', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('4', '2', '1', '0,1,', '100003', '市场部', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('5', '2', '1', '0,1,', '100004', '技术部', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('5a45032753', '7', '9', '0,1,7,9,', '111111', '综合部1', 1, 0, '1', '2', NULL, NULL, '3', '4', '5', '6');
INSERT INTO `sys_office` VALUES ('6', '2', '1', '0,1,', '100005', '研发部', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('6671f053-4', NULL, '9', '0,1,7,9,', '1111111111', '综合部111', 1, 1, '1', '2', NULL, NULL, '3', '4', '5', '6');
INSERT INTO `sys_office` VALUES ('7', '8', '1', '0,1,', '200000', '山东省分公司', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('7dc2461f0f9b4e4bb37824ca331b0b9a', '3', '12', '0,1,7,12,', '123', '123', 2, 1, '123', '123', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('8', '8', '7', '0,1,7,', '200001', '公司领导', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('9', '8', '7', '0,1,7,', '200002', '综合部', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_office` VALUES ('96f63ff396cf4e1cb3a98c4e1faa5149', '2', '1', '0,1,', '1234', '1234', 1, 1, '12314', '12312', NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_org_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_org_role`;
CREATE TABLE `sys_org_role` (
  `office_id` varchar(64) NOT NULL,
  `role_id` varchar(64) NOT NULL,
  PRIMARY KEY (`office_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `data_scope` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `is_default` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 1, 'superadmin', 0, 1);
INSERT INTO `sys_role` VALUES ('20', '主治医师', 5, '主治医师', 0, 1);
INSERT INTO `sys_role` VALUES ('30', '住院医师', 8, '住院医师', 0, 1);
INSERT INTO `sys_role` VALUES ('PEN6WCTJJE', '测试角色', 1, '测试', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_component
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_component`;
CREATE TABLE `sys_role_component` (
  `role_id` varchar(40) NOT NULL COMMENT '角色ID',
  `component_id` varchar(40) NOT NULL COMMENT '组件编号',
  PRIMARY KEY (`role_id`,`component_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色组件关联';

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `menu_id` varchar(64) NOT NULL,
  `role_id` varchar(64) NOT NULL,
  PRIMARY KEY (`menu_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('10', '1');
INSERT INTO `sys_role_menu` VALUES ('10', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('11', '1');
INSERT INTO `sys_role_menu` VALUES ('11', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('12', '1');
INSERT INTO `sys_role_menu` VALUES ('12', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('13', '1');
INSERT INTO `sys_role_menu` VALUES ('13', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('13d3119a9d', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('14', '1');
INSERT INTO `sys_role_menu` VALUES ('14', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('15', '1');
INSERT INTO `sys_role_menu` VALUES ('15', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('16', '1');
INSERT INTO `sys_role_menu` VALUES ('16', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('17', '1');
INSERT INTO `sys_role_menu` VALUES ('17', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('18', '1');
INSERT INTO `sys_role_menu` VALUES ('18', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('19', '1');
INSERT INTO `sys_role_menu` VALUES ('19', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('1c3987d505', '1');
INSERT INTO `sys_role_menu` VALUES ('1c61dc1fa7', '1');
INSERT INTO `sys_role_menu` VALUES ('1c61dc1fa7', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '20');
INSERT INTO `sys_role_menu` VALUES ('2', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('20', '1');
INSERT INTO `sys_role_menu` VALUES ('20', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('21', '1');
INSERT INTO `sys_role_menu` VALUES ('21', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('22', '1');
INSERT INTO `sys_role_menu` VALUES ('22', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('23', '1');
INSERT INTO `sys_role_menu` VALUES ('23', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('24', '1');
INSERT INTO `sys_role_menu` VALUES ('24', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('25', '1');
INSERT INTO `sys_role_menu` VALUES ('25', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('252ecfdfba', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('26', '1');
INSERT INTO `sys_role_menu` VALUES ('26', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('27', '1');
INSERT INTO `sys_role_menu` VALUES ('27', '20');
INSERT INTO `sys_role_menu` VALUES ('27', '30');
INSERT INTO `sys_role_menu` VALUES ('27', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('28', '1');
INSERT INTO `sys_role_menu` VALUES ('28', '20');
INSERT INTO `sys_role_menu` VALUES ('28', '30');
INSERT INTO `sys_role_menu` VALUES ('28', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('29', '1');
INSERT INTO `sys_role_menu` VALUES ('29', '20');
INSERT INTO `sys_role_menu` VALUES ('29', '30');
INSERT INTO `sys_role_menu` VALUES ('29', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('2a41260e4a', '1');
INSERT INTO `sys_role_menu` VALUES ('2a41260e4a', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('3', '1');
INSERT INTO `sys_role_menu` VALUES ('3', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('30', '1');
INSERT INTO `sys_role_menu` VALUES ('30', '20');
INSERT INTO `sys_role_menu` VALUES ('30', '30');
INSERT INTO `sys_role_menu` VALUES ('30', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('32df3d86a3', '1');
INSERT INTO `sys_role_menu` VALUES ('32df3d86a3', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('3d33c15c65', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('4', '1');
INSERT INTO `sys_role_menu` VALUES ('4', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('44b175530d', '1');
INSERT INTO `sys_role_menu` VALUES ('482c5bef18', '1');
INSERT INTO `sys_role_menu` VALUES ('482c5bef18', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('5', '1');
INSERT INTO `sys_role_menu` VALUES ('5', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('6', '1');
INSERT INTO `sys_role_menu` VALUES ('6', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('664aabf317', '30');
INSERT INTO `sys_role_menu` VALUES ('67', '1');
INSERT INTO `sys_role_menu` VALUES ('67', '20');
INSERT INTO `sys_role_menu` VALUES ('67', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('68', '1');
INSERT INTO `sys_role_menu` VALUES ('68', '20');
INSERT INTO `sys_role_menu` VALUES ('68', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('68fc127343', '1');
INSERT INTO `sys_role_menu` VALUES ('68fc127343', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('6a06cc8656', '1');
INSERT INTO `sys_role_menu` VALUES ('6a06cc8656', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('6cff3118a9', '1');
INSERT INTO `sys_role_menu` VALUES ('6cff3118a9', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('7', '1');
INSERT INTO `sys_role_menu` VALUES ('7', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('76', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('77', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('78', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('79', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('7c5e610086', '1');
INSERT INTO `sys_role_menu` VALUES ('7c5e610086', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('7dfbfee854', '1');
INSERT INTO `sys_role_menu` VALUES ('7dfbfee854', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('8', '1');
INSERT INTO `sys_role_menu` VALUES ('8', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('80', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('9', '1');
INSERT INTO `sys_role_menu` VALUES ('9', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('91e8eaf6-c6b1-4f1c-995d-7c1295f18527', '1');
INSERT INTO `sys_role_menu` VALUES ('91e8eaf6-c6b1-4f1c-995d-7c1295f18527', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('98ef6af5b6', '1');
INSERT INTO `sys_role_menu` VALUES ('98ef6af5b6', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('a2e8c9e87a444be9b00238e5fdb317f8', '1');
INSERT INTO `sys_role_menu` VALUES ('a2e8c9e87a444be9b00238e5fdb317f8', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('ad7a8ca34e', '1');
INSERT INTO `sys_role_menu` VALUES ('adc17a5d16', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('c4644eba6c', '1');
INSERT INTO `sys_role_menu` VALUES ('c4644eba6c', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('dfc523e954', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('e29fdbff526d45dcaecab4489a79264b', '1');
INSERT INTO `sys_role_menu` VALUES ('e29fdbff526d45dcaecab4489a79264b', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('ec347ab221', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('ef2331fc79', 'PEN6WCTJJE');
INSERT INTO `sys_role_menu` VALUES ('f13419c5ab3848bab83e69fba5aa264b', '1');
INSERT INTO `sys_role_menu` VALUES ('f13419c5ab3848bab83e69fba5aa264b', 'PEN6WCTJJE');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(10) NOT NULL,
  `role_id` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '1');
INSERT INTO `sys_user_role` VALUES ('5749500575', '30');
INSERT INTO `sys_user_role` VALUES ('9772282019', '30');
COMMIT;

-- ----------------------------
-- Table structure for user_base_info
-- ----------------------------
DROP TABLE IF EXISTS `user_base_info`;
CREATE TABLE `user_base_info` (
  `user_id` varchar(10) NOT NULL COMMENT '用户ID',
  `gender` int(11) DEFAULT NULL COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '出生年月',
  `identity_number` varchar(10) DEFAULT NULL COMMENT '身份证号码',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基础信息';

-- ----------------------------
-- Records of user_base_info
-- ----------------------------
BEGIN;
INSERT INTO `user_base_info` VALUES ('1', 1, '2017-04-30', '1');
COMMIT;

-- ----------------------------
-- Table structure for user_contact_info
-- ----------------------------
DROP TABLE IF EXISTS `user_contact_info`;
CREATE TABLE `user_contact_info` (
  `user_id` varchar(10) NOT NULL COMMENT '用户ID',
  `area_code` varchar(10) DEFAULT NULL COMMENT '区域编码',
  `mobile` varchar(15) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `phone` varchar(20) DEFAULT NULL COMMENT '座机号码',
  `wechat_id` varchar(50) DEFAULT NULL COMMENT '微信OpenID',
  `address` varchar(200) DEFAULT NULL COMMENT '用户地址',
  `zip_code` varchar(10) DEFAULT NULL COMMENT '邮政编码',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户联系方式';

-- ----------------------------
-- Records of user_contact_info
-- ----------------------------
BEGIN;
INSERT INTO `user_contact_info` VALUES ('0607154600', NULL, '5', '5@qq.com', NULL, NULL, NULL, NULL);
INSERT INTO `user_contact_info` VALUES ('0884034869', NULL, '18229779123', 'lcw2004@163.com', '21', NULL, NULL, NULL);
INSERT INTO `user_contact_info` VALUES ('1', '1', '18229779123', 'lcw2004@163.com', '0731-00000000', '1', '1', '1');
INSERT INTO `user_contact_info` VALUES ('1286461960', NULL, '6', '5@qq.com', NULL, NULL, NULL, NULL);
INSERT INTO `user_contact_info` VALUES ('1292028639', NULL, '4', '5@qq.com', NULL, NULL, NULL, NULL);
INSERT INTO `user_contact_info` VALUES ('1389657075', NULL, '13908888888', '888888888@88.com', '888888888888', NULL, NULL, NULL);
INSERT INTO `user_contact_info` VALUES ('1568196648', NULL, '18229779123', 'lcw@qq.com', '1234567890', NULL, NULL, NULL);
INSERT INTO `user_contact_info` VALUES ('2', NULL, '15604517887', NULL, '86109955', NULL, 'abc123', NULL);
INSERT INTO `user_contact_info` VALUES ('4750583434', NULL, '18229779123', 'lcw2004@163.com', '18229779123', NULL, NULL, NULL);
INSERT INTO `user_contact_info` VALUES ('5024478887', NULL, '4', '5@qq.com', NULL, NULL, NULL, NULL);
INSERT INTO `user_contact_info` VALUES ('5483409971', NULL, '1', '292232611@qq.com', '', NULL, NULL, NULL);
INSERT INTO `user_contact_info` VALUES ('5577778120', NULL, '4', '5@qq.com', NULL, NULL, NULL, NULL);
INSERT INTO `user_contact_info` VALUES ('5749500575', NULL, '66666666677', '6666@66.com', '666666666667', NULL, '2222', NULL);
INSERT INTO `user_contact_info` VALUES ('6674408480', NULL, '12311', '123@qq.com', '123456111', NULL, NULL, NULL);
INSERT INTO `user_contact_info` VALUES ('8791146057', NULL, '4', '4@qq.com', NULL, NULL, NULL, NULL);
INSERT INTO `user_contact_info` VALUES ('9266848058', NULL, '77777777777', '7777@77.com', '777777777777', NULL, NULL, NULL);
INSERT INTO `user_contact_info` VALUES ('9772282019', NULL, '88888888888', '88@88.com', '888888888888', NULL, '8888888888888888', NULL);
COMMIT;

-- ----------------------------
-- Table structure for user_education_info
-- ----------------------------
DROP TABLE IF EXISTS `user_education_info`;
CREATE TABLE `user_education_info` (
  `user_id` varchar(10) NOT NULL COMMENT '用户ID',
  `last_education` varchar(50) DEFAULT NULL COMMENT '最高学历',
  `last_school` varchar(50) DEFAULT NULL COMMENT '最后毕业院校',
  `study_profession` varchar(50) DEFAULT NULL COMMENT '学校专业',
  `graduation_time` date DEFAULT NULL COMMENT '毕业时间',
  `work_start_time` date DEFAULT NULL COMMENT '开始工作时间',
  `work_profession` varchar(50) DEFAULT NULL COMMENT '从事专业',
  `work_resume` blob DEFAULT NULL COMMENT '工作简历',
  `graduation_certificate` blob DEFAULT NULL COMMENT '毕业证书影印件',
  `political_status` int(11) DEFAULT NULL COMMENT '政治面貌',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学历信息';

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` varchar(10) NOT NULL COMMENT '用户ID',
  `account` varchar(50) DEFAULT NULL COMMENT '用户帐号',
  `name` varchar(100) DEFAULT NULL COMMENT '用户姓名',
  `password` varchar(100) DEFAULT NULL COMMENT '用户密码',
  `type` int(11) DEFAULT NULL COMMENT '用户类型',
  `create_ip` varchar(15) DEFAULT NULL COMMENT '注册IP',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '注册时间',
  `last_login_ip` varchar(15) DEFAULT NULL COMMENT '最后登录IP',
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `status` int(11) DEFAULT NULL COMMENT '用户状态',
  `gender` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `identity_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础用户表';

-- ----------------------------
-- Records of user_info
-- ----------------------------
BEGIN;
INSERT INTO `user_info` VALUES ('1', 'superadmin', '超级管理员', '998d7349b60628a06c6445d655e8bc50632a4fdd616733750b2c083e', 1, NULL, '2017-04-21 22:15:02', '127.0.0.1', '2017-05-12 15:33:13', 1, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES ('2', 'admin', '管理员', '978500b278a7e3ba9a2fd5e6e6b5ca79961ff07297006f92e7c5faf3', 1, NULL, '2017-04-17 21:04:43', '127.0.0.1', '2018-06-01 11:27:20', 1, NULL, NULL, '232301198403260000');
COMMIT;

-- ----------------------------
-- Table structure for user_manager
-- ----------------------------
DROP TABLE IF EXISTS `user_manager`;
CREATE TABLE `user_manager` (
  `user_id` varchar(10) NOT NULL COMMENT '用户ID',
  `office_id` varchar(10) DEFAULT NULL COMMENT '所属机构ID',
  `remark` varchar(255) DEFAULT NULL,
  `work_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理用户表';

-- ----------------------------
-- Records of user_manager
-- ----------------------------
BEGIN;
INSERT INTO `user_manager` VALUES ('1', '1', '222222222222222', '11111111111111');
INSERT INTO `user_manager` VALUES ('2', '2', '', '');
COMMIT;

-- ----------------------------
-- Table structure for user_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_log`;
CREATE TABLE `user_operation_log` (
  `user_id` varchar(10) NOT NULL COMMENT '用户ID',
  `operate_time` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `result` int(11) DEFAULT NULL COMMENT '操作结果',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `log_id` varchar(64) NOT NULL COMMENT '日志ID',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `operate_code` varchar(10) NOT NULL COMMENT '类型编码',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户操作日志表';

SET FOREIGN_KEY_CHECKS = 1;
