/*
 Navicat MariaDB Data Transfer

 Source Server         : localhost
 Source Server Type    : MariaDB
 Source Server Version : 100307
 Source Host           : localhost:3306
 Source Schema         : gwola_boot

 Target Server Type    : MariaDB
 Target Server Version : 100307
 File Encoding         : 65001

 Date: 11/06/2018 22:21:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `cost_time` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `ip_info` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `request_param` varchar(255) DEFAULT NULL,
  `request_type` varchar(255) DEFAULT NULL,
  `request_url` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------
BEGIN;
INSERT INTO `t_log` VALUES ('16752943696973824', NULL, '2018-06-06 19:42:34', 0, NULL, '2018-06-06 19:42:34', 312, '127.0.0.1', '本机地址', '登录系统', '{\"password\":\"你是看不见我的\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin');
INSERT INTO `t_log` VALUES ('17853316813819904', NULL, '2018-06-09 20:35:04', 0, NULL, '2018-06-09 20:35:04', 1151, '192.168.0.157', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test');
INSERT INTO `t_log` VALUES ('17854348918788096', NULL, '2018-06-09 20:39:10', 0, NULL, '2018-06-09 20:39:10', 630, '192.168.0.157', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test');
INSERT INTO `t_log` VALUES ('17865506753089536', NULL, '2018-06-09 21:23:30', 0, NULL, '2018-06-09 21:23:30', 892, '192.168.0.157', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test');
INSERT INTO `t_log` VALUES ('17867116241752064', NULL, '2018-06-09 21:29:54', 0, NULL, '2018-06-09 21:29:54', 775, '192.168.0.157', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test');
INSERT INTO `t_log` VALUES ('17867165126365184', NULL, '2018-06-09 21:30:05', 0, NULL, '2018-06-09 21:30:05', 241, '192.168.0.157', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test');
INSERT INTO `t_log` VALUES ('17867210223521792', NULL, '2018-06-09 21:30:16', 0, NULL, '2018-06-09 21:30:16', 304, '192.168.0.157', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test');
INSERT INTO `t_log` VALUES ('17875230932340736', NULL, '2018-06-09 22:02:08', 0, NULL, '2018-06-09 22:02:08', 726, '192.168.0.157', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/gwola/login', 'test');
INSERT INTO `t_log` VALUES ('18114105873272832', NULL, '2018-06-10 13:51:21', 0, NULL, '2018-06-10 13:51:21', 566, '192.168.43.153', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/gwola/login', 'test');
COMMIT;

-- ----------------------------
-- Table structure for t_organization
-- ----------------------------
DROP TABLE IF EXISTS `t_organization`;
CREATE TABLE `t_organization` (
  `id` varchar(50) NOT NULL COMMENT '组织机构ID',
  `parent_id` varchar(50) DEFAULT NULL COMMENT '父节点ID',
  `name` varchar(255) DEFAULT NULL COMMENT '组织机构名称',
  `code` varchar(255) DEFAULT NULL COMMENT '组织机构代码',
  `level` int(11) DEFAULT NULL COMMENT '组织机构层级',
  `type` varchar(50) DEFAULT NULL COMMENT '组织机构类型（属性表）',
  `del_flag` int(11) DEFAULT NULL COMMENT '是否删除：0否，1是',
  `create_by` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `sort_order` decimal(10,2) DEFAULT NULL,
  `component` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `button_type` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
BEGIN;
INSERT INTO `t_permission` VALUES ('5129710648430592', '', '2018-06-04 19:02:29', 0, '', '2018-06-03 18:35:36', '', 'sys', '', 0, 1.00, 'Main', '/form', '系统管理', 'ios-gear', 1, NULL, 0);
INSERT INTO `t_permission` VALUES ('5129710648430593', NULL, '2018-06-04 19:02:32', 0, NULL, '2018-06-04 19:02:43', NULL, 'user-manage', '5129710648430592', 0, 1.10, 'sys/user-manage/userManage', 'user-manage', '用户管理', 'android-person', 2, NULL, 0);
INSERT INTO `t_permission` VALUES ('5129710648430594', NULL, '2018-06-04 19:02:35', 0, NULL, '2018-06-04 19:02:45', NULL, 'role-manage', '5129710648430592', 0, 1.20, 'sys/role-manage/roleManage', 'role-manage', '角色管理', 'android-contacts', 2, NULL, 0);
INSERT INTO `t_permission` VALUES ('5129710648430595', NULL, '2018-06-04 19:02:37', 0, NULL, '2018-06-04 19:02:49', NULL, 'menu-manage', '5129710648430592', 0, 1.30, 'sys/menu-manage/menuManage', 'menu-manage', '菜单权限管理', 'navicon-round', 2, NULL, 0);
INSERT INTO `t_permission` VALUES ('5129710648430596', NULL, '2018-06-04 19:02:40', 0, NULL, '2018-06-04 19:02:53', NULL, 'log-manage', '5129710648430592', 0, 1.40, 'sys/log-manage/logManage', 'log-manage', '日志管理', 'android-list', 2, NULL, 0);
INSERT INTO `t_permission` VALUES ('15701400130424832', '', '2018-06-03 22:04:06', 0, '', '2018-06-06 18:17:20', '', '', '5129710648430593', 1, 1.11, '', '/xboot/user/admin/add', '添加用户', '', 3, 'add', 0);
INSERT INTO `t_permission` VALUES ('15701915807518720', '', '2018-06-03 22:06:09', 0, '', '2018-06-06 14:46:51', '', '', '5129710648430593', 1, 1.13, '', '/xboot/user/admin/disable/**', '禁用用户', '', 3, 'disable', 0);
INSERT INTO `t_permission` VALUES ('15708892205944832', '', '2018-06-03 22:33:52', 0, '', '2018-06-06 14:46:55', '', '', '5129710648430593', 1, 1.14, '', '/xboot/user/admin/enable/**', '启用用户', '', 3, 'undefined', 0);
INSERT INTO `t_permission` VALUES ('16392452747300864', '', '2018-06-05 19:50:06', 0, '', '2018-06-05 23:08:36', '', 'access', '', 0, 2.00, 'Main', '/access', '权限按钮测试页', 'locked', 1, '', 0);
INSERT INTO `t_permission` VALUES ('16392767785668608', '', '2018-06-05 19:51:21', 0, '', '2018-06-05 21:10:15', '', 'access_index', '16392452747300864', 0, 2.10, 'access/access', 'index', '权限按钮测试页', 'locked', 2, '', 0);
INSERT INTO `t_permission` VALUES ('16438800255291392', '', '2018-06-05 22:54:18', 0, '', '2018-06-05 22:54:59', '', '', '16392767785668608', 1, 2.11, '', 'test-add', '添加按钮测试', '', 3, 'add', 0);
INSERT INTO `t_permission` VALUES ('16438962738434048', NULL, '2018-06-05 22:54:55', 0, NULL, '2018-06-05 22:54:55', NULL, NULL, '16392767785668608', 1, 2.12, NULL, 'edit-test', '编辑按钮测试', NULL, 3, 'edit', 0);
INSERT INTO `t_permission` VALUES ('16439068543946752', '', '2018-06-05 22:55:20', 0, '', '2018-06-05 22:55:33', '', '', '16392767785668608', 1, 2.13, '', 'delete-test', '删除按钮测试', '', 3, 'delete', 0);
INSERT INTO `t_permission` VALUES ('16678126574637056', '', '2018-06-06 14:45:16', 0, '', '2018-06-06 14:46:45', '', '', '5129710648430593', 1, 1.12, '', '/xboot/user/admin/edit', '编辑用户', '', 3, 'edit', 0);
INSERT INTO `t_permission` VALUES ('16678447719911424', '', '2018-06-06 14:46:32', 0, '', '2018-06-06 18:49:43', '', '', '5129710648430593', 1, 1.15, '', '/xboot/user/delByIds**', '删除用户', '', 3, 'delete', 0);
INSERT INTO `t_permission` VALUES ('16687383932047360', NULL, '2018-06-06 15:22:03', 0, NULL, '2018-06-06 15:22:03', NULL, NULL, '5129710648430594', 1, 1.21, NULL, '/xboot/role/save', '添加角色', NULL, 3, 'add', 0);
INSERT INTO `t_permission` VALUES ('16689632049631232', NULL, '2018-06-06 15:30:59', 0, NULL, '2018-06-06 15:30:59', NULL, NULL, '5129710648430594', 1, 1.22, NULL, '/xboot/role/edit', '编辑角色', NULL, 3, 'edit', 0);
INSERT INTO `t_permission` VALUES ('16689745006432256', '', '2018-06-06 15:31:26', 0, '', '2018-06-06 18:49:51', '', '', '5129710648430594', 1, 1.23, '', '/xboot/role/delAllByIds**', '删除角色', '', 3, 'delete', 0);
INSERT INTO `t_permission` VALUES ('16689883993083904', NULL, '2018-06-06 15:31:59', 0, NULL, '2018-06-06 15:31:59', NULL, NULL, '5129710648430594', 1, 1.24, NULL, '/xboot/role/editRolePerm/**', '分配权限', NULL, 3, 'editPerm', 0);
INSERT INTO `t_permission` VALUES ('16690313745666048', NULL, '2018-06-06 15:33:41', 0, NULL, '2018-06-06 15:33:41', NULL, NULL, '5129710648430594', 1, 1.25, NULL, '/xboot/role/setDefault', '设为默认角色', NULL, 3, 'setDefault', 0);
INSERT INTO `t_permission` VALUES ('16694861252005888', NULL, '2018-06-06 15:51:46', 0, NULL, '2018-06-06 15:51:46', NULL, NULL, '5129710648430595', 1, 1.31, NULL, '/xboot/permission/add', '添加菜单', NULL, 3, 'add', 0);
INSERT INTO `t_permission` VALUES ('16695107491205120', NULL, '2018-06-06 15:52:44', 0, NULL, '2018-06-06 15:52:44', NULL, NULL, '5129710648430595', 1, 1.32, NULL, '/xboot/permission/edit', '编辑菜单', NULL, 3, 'edit', 0);
INSERT INTO `t_permission` VALUES ('16695243126607872', '', '2018-06-06 15:53:17', 0, '', '2018-06-06 18:49:57', '', '', '5129710648430595', 1, 1.33, '', '/xboot/permission/delByIds**', '删除菜单', '', 3, 'delete', 0);
INSERT INTO `t_permission` VALUES ('16695482789138432', '', '2018-06-06 15:54:14', 0, '', '2018-06-06 18:50:03', '', '', '5129710648430596', 1, 1.41, '', '/xboot/log/delByIds**', '删除日志', '', 3, 'delete', 0);
INSERT INTO `t_permission` VALUES ('16695638456537088', NULL, '2018-06-06 15:54:51', 0, NULL, '2018-06-06 15:54:51', NULL, NULL, '5129710648430596', 1, 1.42, NULL, '/xboot/log/delAll', '清空日志', NULL, 3, 'clearAll', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `default_role` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
BEGIN;
INSERT INTO `t_role` VALUES ('496138616573952', '', '2018-04-22 23:03:49', '', '2018-05-04 12:56:23', 'ROLE_ADMIN', 0, NULL);
INSERT INTO `t_role` VALUES ('496138616573953', '', '2018-05-02 21:40:03', '', '2018-05-08 10:33:32', 'ROLE_USER', 0, b'1');
INSERT INTO `t_role` VALUES ('16457350655250432', NULL, '2018-06-06 00:08:00', NULL, '2018-06-06 00:08:00', 'ROLE_TEST', 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `permission_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
BEGIN;
INSERT INTO `t_role_permission` VALUES ('16736297938849792', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '16439068543946752', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297917878272', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '16438962738434048', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297892712448', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '16438800255291392', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297867546624', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '16392767785668608', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297842380800', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '16392452747300864', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297813020672', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '16695638456537088', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297783660544', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '16695482789138432', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297750106112', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '5129710648430596', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297712357376', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '16695243126607872', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297674608640', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '16695107491205120', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297569751040', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '16694861252005888', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297544585216', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '5129710648430595', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('17875645908389888', NULL, '2018-06-09 22:03:47', 0, NULL, '2018-06-09 22:03:47', '16678126574637056', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('17875645866446848', NULL, '2018-06-09 22:03:47', 0, NULL, '2018-06-09 22:03:47', '15701400130424832', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('17875645719646208', NULL, '2018-06-09 22:03:47', 0, NULL, '2018-06-09 22:03:47', '5129710648430593', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('16717356252270592', NULL, '2018-06-06 17:21:09', 0, NULL, '2018-06-06 17:21:09', '16439068543946752', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('16717356231299072', NULL, '2018-06-06 17:21:09', 0, NULL, '2018-06-06 17:21:09', '16438962738434048', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('16717356218716160', NULL, '2018-06-06 17:21:09', 0, NULL, '2018-06-06 17:21:09', '16438800255291392', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('16717356201938944', NULL, '2018-06-06 17:21:09', 0, NULL, '2018-06-06 17:21:09', '16392767785668608', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('16717356185161728', NULL, '2018-06-06 17:21:09', 0, NULL, '2018-06-06 17:21:09', '16392452747300864', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('16717356159995904', NULL, '2018-06-06 17:21:09', 0, NULL, '2018-06-06 17:21:09', '5129710648430596', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('16717356147412992', NULL, '2018-06-06 17:21:09', 0, NULL, '2018-06-06 17:21:09', '5129710648430595', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('16717356130635776', NULL, '2018-06-06 17:21:09', 0, NULL, '2018-06-06 17:21:09', '5129710648430594', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('16717356097081344', NULL, '2018-06-06 17:21:09', 0, NULL, '2018-06-06 17:21:09', '5129710648430593', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('16736297527808000', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '16690313745666048', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297511030784', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '16689883993083904', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297494253568', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '16689745006432256', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297469087744', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '16689632049631232', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297448116224', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '16687383932047360', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297397784576', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '5129710648430594', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297355841536', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '16678447719911424', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297326481408', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '15708892205944832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297276149760', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '15701915807518720', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297217429504', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '16678126574637056', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297179680768', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '15701400130424832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736297137737728', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '5129710648430593', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16736296999325696', NULL, '2018-06-06 18:36:25', 0, NULL, '2018-06-06 18:36:25', '5129710648430592', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('16717356080304128', NULL, '2018-06-06 17:21:09', 0, NULL, '2018-06-06 17:21:09', '5129710648430592', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('17875645941944320', NULL, '2018-06-09 22:03:47', 0, NULL, '2018-06-09 22:03:47', '15701915807518720', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('17875645983887360', NULL, '2018-06-09 22:03:47', 0, NULL, '2018-06-09 22:03:47', '5129710648430594', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('17875646021636096', NULL, '2018-06-09 22:03:47', 0, NULL, '2018-06-09 22:03:47', '16687383932047360', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('17875646059384832', NULL, '2018-06-09 22:03:47', 0, NULL, '2018-06-09 22:03:47', '5129710648430595', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('17875646113910784', NULL, '2018-06-09 22:03:47', 0, NULL, '2018-06-09 22:03:47', '5129710648430596', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('17875646151659520', NULL, '2018-06-09 22:03:47', 0, NULL, '2018-06-09 22:03:47', '16392452747300864', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('17875646189408256', NULL, '2018-06-09 22:03:47', 0, NULL, '2018-06-09 22:03:47', '16392767785668608', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('17875646231351296', NULL, '2018-06-09 22:03:47', 0, NULL, '2018-06-09 22:03:47', '16439068543946752', '16457350655250432');
COMMIT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(50) NOT NULL,
  `create_by` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(1000) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `organization_id` varchar(50) NOT NULL COMMENT '组织机构ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
BEGIN;
INSERT INTO `t_user` VALUES ('682265633886208', '', '2018-05-01 16:13:51', '', '2018-06-01 19:32:59', '[\"510000\",\"510100\",\"510104\"]', 'http://p77xsahe9.bkt.clouddn.com/788eb3e78206429eb34fc7cd3e1e46f4.jpg', NULL, '1012139570@qq.com', '18782059038', NULL, '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', 1, 0, 1, 'admin', 0, '0');
INSERT INTO `t_user` VALUES ('682265633886209', '', '2018-04-30 23:28:42', '', '2018-06-06 14:30:21', '', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', '', '1012139570@qq.com', '18782059038', '', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', 0, -1, 1, 'Exrick', 0, '0');
INSERT INTO `t_user` VALUES ('16739222421508096', '', '2018-06-06 18:48:02', '', '2018-06-06 18:57:55', '', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', '', '1012139570@qq.com', '18782059038', '', '$2a$10$3VQxPlr8lu9P9kFEIw66y.vCKUO90QDB0gt.4JCB5sZim8yb1jPbK', 1, 0, 0, 'test2', 0, '0');
INSERT INTO `t_user` VALUES ('4363087427670016', '', '2018-05-03 15:09:42', '', '2018-06-06 18:58:25', '[\"510000\",\"510100\",\"510114\"]', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', NULL, '1012139570@qq.com', '18782059038', NULL, '$2a$10$LPNcntYGxcWSngwZJj08D.A2biv.k2sQUsGrxLc2HkvL9DA1LbLaO', 1, 0, 0, 'test', 0, '0');
COMMIT;

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
BEGIN;
INSERT INTO `t_user_role` VALUES ('16457761273417728', NULL, '2018-06-06 00:09:39', 0, NULL, '2018-06-06 00:09:39', '16457350655250432', '16457750745714688');
INSERT INTO `t_user_role` VALUES ('16056421829316608', NULL, '2018-06-04 21:34:50', 0, NULL, '2018-06-04 21:34:50', '496138616573953', '6118792149078016');
INSERT INTO `t_user_role` VALUES ('16674372718694400', NULL, '2018-06-06 14:30:21', 0, NULL, '2018-06-06 14:30:21', '496138616573953', '682265633886209');
INSERT INTO `t_user_role` VALUES ('4365473638518788', NULL, '2018-05-08 11:25:45', 0, NULL, '2018-05-08 11:25:50', '496138616573952', '682265633886208');
INSERT INTO `t_user_role` VALUES ('4365473638518784', NULL, '2018-05-03 15:19:11', 0, NULL, '2018-05-03 15:19:11', '496138616573953', '4363087427670016');
INSERT INTO `t_user_role` VALUES ('15358614818525184', NULL, '2018-06-02 23:22:00', 0, NULL, '2018-06-02 23:22:00', '496138616573952', '15325672666828800');
INSERT INTO `t_user_role` VALUES ('16674372659974144', NULL, '2018-06-06 14:30:21', 0, NULL, '2018-06-06 14:30:21', '496138616573952', '682265633886209');
INSERT INTO `t_user_role` VALUES ('16738254220955648', NULL, '2018-06-06 18:44:11', 0, NULL, '2018-06-06 18:44:11', '16457350655250432', '16738253642141696');
INSERT INTO `t_user_role` VALUES ('16741709752832000', NULL, '2018-06-06 18:57:55', 0, NULL, '2018-06-06 18:57:55', '16457350655250432', '16739222421508096');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
