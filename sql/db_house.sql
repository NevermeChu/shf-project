/*
 Navicat Premium Data Transfer

 Source Server         : MySQL57
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : localhost:3306
 Source Schema         : db_house

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 01/02/2023 14:10:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acl_admin
-- ----------------------------
DROP TABLE IF EXISTS `acl_admin`;
CREATE TABLE `acl_admin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `head_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:不可用 1:可用）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_admin
-- ----------------------------
INSERT INTO `acl_admin` VALUES (1, 'admin', '$2a$10$pK6CFWA.UWlDQyX4oR4gx.nVmafK9OjevKIu2VX0cDaJUQ8gpYhz.', 'admin', '15099909888', 'http://rozti2kdd.hn-bkt.clouddn.com/cd62e381-b399-4da4-b07a-7edda34b9fb4', NULL, '2021-05-31 18:08:43', '2023-01-27 17:43:19', 0);
INSERT INTO `acl_admin` VALUES (2, 'user1', '$2a$10$pK6CFWA.UWlDQyX4oR4gx.nVmafK9OjevKIu2VX0cDaJUQ8gpYhz.', 'user1', '13444654654', 'http://r61cnlsfq.hn-bkt.clouddn.com/fc277aec-0007-4aac-89e2-ced86b131f6b', NULL, '2021-06-01 08:46:22', '2022-02-09 15:46:34', 0);
INSERT INTO `acl_admin` VALUES (3, 'user2', '$2a$10$pK6CFWA.UWlDQyX4oR4gx.nVmafK9OjevKIu2VX0cDaJUQ8gpYhz.', 'user2', '17434343433', 'http://47.93.148.192:8080/group1/M00/03/F0/rBHu8mHqbpSAU0jVAAAgiJmKg0o148.jpg', NULL, '2021-06-18 17:18:29', '2022-02-15 09:34:32', 0);
INSERT INTO `acl_admin` VALUES (6, 'house1', '$2a$10$pK6CFWA.UWlDQyX4oR4gx.nVmafK9OjevKIu2VX0cDaJUQ8gpYhz.', 'house1', '18745354545', 'http://r61cnlsfq.hn-bkt.clouddn.com/23ebd355-1e6a-4eea-b5a8-f9b112971e5c', NULL, '2022-01-20 20:43:01', '2022-02-15 09:34:32', 0);
INSERT INTO `acl_admin` VALUES (7, 'house2', '$2a$10$pK6CFWA.UWlDQyX4oR4gx.nVmafK9OjevKIu2VX0cDaJUQ8gpYhz.', 'house2', '18034545345', 'http://r61cnlsfq.hn-bkt.clouddn.com/b681bc79-b5c1-4acf-9982-0fc68bc7e61f', NULL, '2022-01-20 20:43:07', '2022-02-15 09:34:33', 0);
INSERT INTO `acl_admin` VALUES (8, 'user', '$2a$10$CUQYEOr7eU4O.aDkZ0Iv0OF/is8sACu0nxOn3NsJ/OppPbWC0qz.u', 'user', '15010546381', 'http://rozti2kdd.hn-bkt.clouddn.com/89d7937f-e9a1-463d-a0f2-394d7e6c75db', NULL, '2022-02-08 10:35:38', '2023-01-25 01:03:16', 0);
INSERT INTO `acl_admin` VALUES (9, '美丽心灵', '$2a$10$pYYSf.AWOxvg0E33VQdyMOjGDf79rGPkNUwgRx87MU8X6PbGKcQBm', '木化十', '15010546381', 'http://rozti2kdd.hn-bkt.clouddn.com/60c0d29b-891a-404f-9325-87bde774e36b', NULL, '2023-01-20 14:33:25', '2023-01-29 13:50:41', 0);
INSERT INTO `acl_admin` VALUES (10, '辛德勒的名单', '$2a$10$pYYSf.AWOxvg0E33VQdyMOjGDf79rGPkNUwgRx87MU8X6PbGKcQBm', '小木', '15010546381', 'http://rozti2kdd.hn-bkt.clouddn.com/ac80fec0-e2fb-41e4-b5f3-d86cde2f1228', NULL, '2023-01-20 14:35:45', '2023-01-29 13:50:41', 0);
INSERT INTO `acl_admin` VALUES (11, '测试cs', '$2a$10$pYYSf.AWOxvg0E33VQdyMOjGDf79rGPkNUwgRx87MU8X6PbGKcQBm', '测试', '15010546381', NULL, NULL, '2023-01-20 14:54:31', '2023-01-29 13:50:41', 1);
INSERT INTO `acl_admin` VALUES (12, 'app牛马', '$2a$10$pYYSf.AWOxvg0E33VQdyMOjGDf79rGPkNUwgRx87MU8X6PbGKcQBm', '蝙蝠侠', '15010546381', 'http://rozti2kdd.hn-bkt.clouddn.com/889a51de-d5d4-4d28-9bac-3ffc15f5c458', NULL, '2023-01-29 13:49:24', '2023-01-29 23:35:26', 0);

-- ----------------------------
-- Table structure for acl_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_admin_role`;
CREATE TABLE `acl_admin_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '角色id',
  `admin_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:不可用 1:可用）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_admin_id`(`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_admin_role
-- ----------------------------
INSERT INTO `acl_admin_role` VALUES (1, 1, 1, '2021-05-31 18:09:02', '2022-01-23 15:58:57', 0);
INSERT INTO `acl_admin_role` VALUES (2, 3, 2, '2022-01-20 20:49:37', '2022-01-20 20:49:37', 0);
INSERT INTO `acl_admin_role` VALUES (3, 2, 3, '2022-01-20 20:49:46', '2022-01-20 20:49:46', 0);
INSERT INTO `acl_admin_role` VALUES (4, 5, 6, '2022-01-20 20:49:54', '2022-01-20 20:49:54', 0);
INSERT INTO `acl_admin_role` VALUES (5, 4, 7, '2022-01-20 20:50:01', '2022-01-20 20:50:01', 0);
INSERT INTO `acl_admin_role` VALUES (6, 8, 8, '2022-02-08 10:48:44', '2022-02-09 20:16:13', 1);
INSERT INTO `acl_admin_role` VALUES (7, 8, 8, '2022-02-09 19:48:22', '2022-02-09 20:16:13', 1);
INSERT INTO `acl_admin_role` VALUES (8, 1, 8, '2022-02-09 19:48:22', '2022-02-09 20:16:13', 1);
INSERT INTO `acl_admin_role` VALUES (9, 1, 8, '2022-02-09 19:48:56', '2022-02-09 20:16:13', 1);
INSERT INTO `acl_admin_role` VALUES (10, 8, 8, '2022-02-09 20:16:13', '2022-02-09 20:16:13', 0);
INSERT INTO `acl_admin_role` VALUES (11, 3, 10, '2023-01-28 11:24:49', '2023-01-28 11:25:28', 1);
INSERT INTO `acl_admin_role` VALUES (12, 4, 10, '2023-01-28 11:24:50', '2023-01-28 11:25:28', 1);
INSERT INTO `acl_admin_role` VALUES (13, 3, 10, '2023-01-28 11:25:29', '2023-01-28 11:25:37', 1);
INSERT INTO `acl_admin_role` VALUES (14, 4, 10, '2023-01-28 11:25:30', '2023-01-28 11:25:37', 1);
INSERT INTO `acl_admin_role` VALUES (15, 8, 10, '2023-01-28 11:25:30', '2023-01-28 11:25:37', 1);
INSERT INTO `acl_admin_role` VALUES (16, 3, 10, '2023-01-28 11:25:37', '2023-01-28 11:25:37', 0);
INSERT INTO `acl_admin_role` VALUES (17, 4, 10, '2023-01-28 11:25:38', '2023-01-28 11:25:38', 0);
INSERT INTO `acl_admin_role` VALUES (18, 8, 10, '2023-01-28 11:25:39', '2023-01-28 11:25:39', 0);
INSERT INTO `acl_admin_role` VALUES (19, 2, 12, '2023-01-29 13:49:43', '2023-01-29 17:28:17', 1);
INSERT INTO `acl_admin_role` VALUES (20, 2, 12, '2023-01-29 17:28:17', '2023-01-30 00:35:36', 1);
INSERT INTO `acl_admin_role` VALUES (21, 32, 12, '2023-01-30 00:35:36', '2023-01-30 00:35:36', 0);

-- ----------------------------
-- Table structure for acl_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_permission`;
CREATE TABLE `acl_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '所属上级',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限名称',
  `url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单路径',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '类型(1:菜单,2:按钮)',
  `sort` tinyint(3) NULL DEFAULT NULL COMMENT '排序',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:不可用 1:可用）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_permission
-- ----------------------------
INSERT INTO `acl_permission` VALUES (2, 0, '权限管理', '', NULL, 1, 1, '2021-05-31 18:05:37', '2022-01-20 15:01:10', 0);
INSERT INTO `acl_permission` VALUES (3, 2, '用户管理', '/admin', NULL, 1, 1, '2021-05-31 18:05:37', '2022-01-20 20:18:06', 0);
INSERT INTO `acl_permission` VALUES (4, 2, '角色管理', '/role', NULL, 1, 2, '2021-05-31 18:05:37', '2022-01-20 20:18:07', 0);
INSERT INTO `acl_permission` VALUES (5, 2, '菜单管理', '/permission', NULL, 1, 3, '2021-05-31 18:05:37', '2022-01-20 20:18:10', 0);
INSERT INTO `acl_permission` VALUES (6, 3, '分配角色', '', 'admin.assgin', 2, 5, '2021-05-31 18:05:37', '2022-01-20 15:32:15', 0);
INSERT INTO `acl_permission` VALUES (7, 3, '添加', '', 'admin.create', 2, 2, '2021-05-31 18:05:37', '2022-01-20 15:27:42', 0);
INSERT INTO `acl_permission` VALUES (8, 3, '修改', '', 'admin.edit', 2, 3, '2021-05-31 18:05:37', '2022-01-20 20:31:29', 0);
INSERT INTO `acl_permission` VALUES (9, 4, '查看', '', 'role.show', 2, 1, '2021-05-31 18:05:37', '2022-01-20 15:01:13', 0);
INSERT INTO `acl_permission` VALUES (10, 4, '修改', '', 'role.edit', 2, 3, '2021-05-31 18:05:37', '2022-01-20 15:18:40', 0);
INSERT INTO `acl_permission` VALUES (11, 4, '分配权限', '', 'role.assgin', 2, 5, '2021-05-31 18:05:37', '2022-01-20 15:33:41', 0);
INSERT INTO `acl_permission` VALUES (12, 4, '添加', '', 'role.create', 2, 2, '2021-05-31 18:05:37', '2022-01-20 15:18:36', 0);
INSERT INTO `acl_permission` VALUES (13, 4, '删除', '', 'role.delete', 2, 4, '2021-05-31 18:05:37', '2022-01-20 15:18:43', 0);
INSERT INTO `acl_permission` VALUES (14, 4, '分配权限', '', 'role.assgin', 2, 5, '2021-05-31 18:05:37', '2023-01-29 17:22:01', 0);
INSERT INTO `acl_permission` VALUES (15, 5, '查看', '', 'permission.show', 2, 1, '2021-05-31 18:05:37', '2022-01-20 15:18:29', 0);
INSERT INTO `acl_permission` VALUES (16, 5, '添加', '', 'permission.create', 2, 2, '2021-05-31 18:05:37', '2022-01-20 20:31:15', 0);
INSERT INTO `acl_permission` VALUES (17, 5, '修改', '', 'permission.edit', 2, 3, '2021-05-31 18:05:37', '2022-01-20 20:31:20', 0);
INSERT INTO `acl_permission` VALUES (18, 5, '删除', '', 'permission.delete', 2, 4, '2021-05-31 18:05:37', '2022-01-20 15:18:55', 0);
INSERT INTO `acl_permission` VALUES (23, 0, '二手房管理', ' ', NULL, 1, 2, '2022-01-13 18:36:35', '2022-01-20 20:18:16', 0);
INSERT INTO `acl_permission` VALUES (24, 23, '小区管理', '/community?areaId=', NULL, 1, 2, '2022-01-13 18:37:26', '2022-01-21 14:01:24', 0);
INSERT INTO `acl_permission` VALUES (26, 23, '房源管理', '/house', NULL, 1, 3, '2022-01-13 18:41:16', '2022-01-20 20:18:27', 0);
INSERT INTO `acl_permission` VALUES (28, 23, '数据字典', '/dict', NULL, 1, 1, '2022-01-20 12:00:19', '2022-01-20 20:18:25', 0);
INSERT INTO `acl_permission` VALUES (29, 28, '查看', NULL, 'dict.show', 2, 1, '2022-01-20 12:00:38', '2022-01-20 15:19:15', 0);
INSERT INTO `acl_permission` VALUES (30, 3, '查看', NULL, 'admin.show', 2, 1, '2022-01-20 14:35:09', '2022-01-20 15:01:23', 0);
INSERT INTO `acl_permission` VALUES (31, 3, '删除', NULL, 'admin.delete', 2, 4, '2022-01-20 15:32:34', '2022-01-20 15:32:34', 0);
INSERT INTO `acl_permission` VALUES (32, 24, '查看', '', 'community.show', 2, 1, '2021-05-31 18:05:37', '2022-01-20 15:18:29', 0);
INSERT INTO `acl_permission` VALUES (33, 24, '添加', '', 'community.create', 2, 2, '2021-05-31 18:05:37', '2022-01-20 15:27:52', 0);
INSERT INTO `acl_permission` VALUES (34, 24, '修改', '', 'community.edit', 2, 3, '2021-05-31 18:05:37', '2022-01-20 20:31:36', 0);
INSERT INTO `acl_permission` VALUES (35, 24, '删除', '', 'community.delete', 2, 4, '2021-05-31 18:05:37', '2022-01-20 15:18:55', 0);
INSERT INTO `acl_permission` VALUES (36, 26, '查看', '', 'house.show', 2, 1, '2021-05-31 18:05:37', '2022-01-20 15:18:29', 0);
INSERT INTO `acl_permission` VALUES (37, 26, '添加', '', 'house.create', 2, 2, '2021-05-31 18:05:37', '2022-01-20 15:27:52', 0);
INSERT INTO `acl_permission` VALUES (38, 26, '修改', '', 'house.edit', 2, 3, '2021-05-31 18:05:37', '2022-01-20 20:31:39', 0);
INSERT INTO `acl_permission` VALUES (39, 26, '删除', '', 'house.delete', 2, 4, '2021-05-31 18:05:37', '2022-01-20 15:18:55', 0);
INSERT INTO `acl_permission` VALUES (40, 26, '编辑图片', NULL, 'house.editImage', 2, 6, '2022-01-20 20:16:04', '2022-01-20 20:21:54', 0);
INSERT INTO `acl_permission` VALUES (41, 26, '编辑经纪人', NULL, 'house.editBroker', 2, 7, '2022-01-20 20:16:56', '2022-01-20 20:21:55', 0);
INSERT INTO `acl_permission` VALUES (42, 26, '编辑房东', NULL, 'house.editUser', 2, 8, '2022-01-20 20:17:31', '2022-01-20 20:21:56', 0);
INSERT INTO `acl_permission` VALUES (43, 26, '审核发布', NULL, 'house.publish', 2, 5, '2022-01-20 20:21:40', '2022-01-20 20:21:40', 0);
INSERT INTO `acl_permission` VALUES (44, 0, '会员管理', NULL, NULL, 1, 3, '2022-01-21 11:33:54', '2023-01-29 23:29:01', 1);
INSERT INTO `acl_permission` VALUES (45, 44, '会员列表', '/userInfo', NULL, 1, 1, '2022-01-21 11:34:27', '2022-01-21 11:34:27', 0);
INSERT INTO `acl_permission` VALUES (46, 45, '查看', NULL, 'userInfo.show', 2, 1, '2022-01-21 11:35:04', '2022-01-21 11:38:49', 0);
INSERT INTO `acl_permission` VALUES (47, 45, '锁定', NULL, 'userInfo.lock', 2, 2, '2022-01-21 11:35:29', '2022-01-21 11:35:46', 0);
INSERT INTO `acl_permission` VALUES (48, 0, '测试', '/test', NULL, 1, 1, '2023-01-28 19:22:08', '2023-01-28 19:25:42', 1);
INSERT INTO `acl_permission` VALUES (49, 48, '测试2', 'test.edit', NULL, 1, 1, '2023-01-28 19:22:49', '2023-01-28 19:25:38', 1);
INSERT INTO `acl_permission` VALUES (50, 3, '上传图片', NULL, 'admin.upload', 2, 3, '2023-01-29 23:36:45', '2023-01-29 23:36:45', 0);
INSERT INTO `acl_permission` VALUES (51, 26, '首页默认图片', NULL, 'house.upload', 2, 1, '2023-01-30 00:28:35', '2023-01-30 00:28:35', 0);

-- ----------------------------
-- Table structure for acl_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_role`;
CREATE TABLE `acl_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:不可用 1:可用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_role
-- ----------------------------
INSERT INTO `acl_role` VALUES (1, '系统管理员', 'SYSTEM', '系统管理员', '2021-05-31 18:09:18', '2022-01-20 20:37:52', 0);
INSERT INTO `acl_role` VALUES (2, '权限浏览', '', '权限浏览', '2021-06-01 08:38:40', '2022-01-20 20:40:09', 0);
INSERT INTO `acl_role` VALUES (3, '权限编辑', NULL, '权限编辑', '2021-06-18 17:12:21', '2022-01-20 20:40:27', 0);
INSERT INTO `acl_role` VALUES (4, '房源浏览', NULL, '房源浏览', '2021-09-27 09:37:13', '2022-01-21 15:34:38', 0);
INSERT INTO `acl_role` VALUES (5, '房源编辑', NULL, '房源编辑', '2022-01-10 21:57:32', '2022-01-21 15:40:45', 0);
INSERT INTO `acl_role` VALUES (8, '普通管理员', '', '普通管理员', '2022-02-08 10:46:29', '2022-02-11 14:41:54', 0);
INSERT INTO `acl_role` VALUES (21, '测试', 'test', '测试', '2023-01-19 19:07:52', '2023-01-19 22:07:02', 1);
INSERT INTO `acl_role` VALUES (27, '测试', 'test', '测试', '2023-01-19 22:43:33', '2023-01-20 15:01:15', 1);
INSERT INTO `acl_role` VALUES (28, '测试1', 'test', '测试', '2023-01-19 22:43:44', '2023-01-20 15:01:06', 1);
INSERT INTO `acl_role` VALUES (29, '测试', 'test', '测试', '2023-01-19 22:43:53', '2023-01-19 23:15:02', 1);
INSERT INTO `acl_role` VALUES (30, '测试', 'test', '测试', '2023-01-19 22:44:03', '2023-01-19 23:14:58', 1);
INSERT INTO `acl_role` VALUES (31, '超级管理员', 'SUPER', '无所不能', '2023-01-19 22:44:17', '2023-01-19 22:44:17', 0);
INSERT INTO `acl_role` VALUES (32, '葫芦大金刚', 'DJG', '金刚葫芦娃\r\n', '2023-01-20 12:48:37', '2023-01-20 12:48:37', 0);

-- ----------------------------
-- Table structure for acl_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_role_permission`;
CREATE TABLE `acl_role_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL DEFAULT 0,
  `permission_id` bigint(11) NOT NULL DEFAULT 0,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:不可用 1:可用）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_permission_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 170 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_role_permission
-- ----------------------------
INSERT INTO `acl_role_permission` VALUES (1, 2, 2, '2022-01-20 20:52:44', '2022-01-20 20:52:44', 0);
INSERT INTO `acl_role_permission` VALUES (2, 2, 3, '2022-01-20 20:52:44', '2022-01-20 20:52:44', 0);
INSERT INTO `acl_role_permission` VALUES (3, 2, 30, '2022-01-20 20:52:44', '2022-01-20 20:52:44', 0);
INSERT INTO `acl_role_permission` VALUES (4, 2, 4, '2022-01-20 20:52:44', '2022-01-20 20:52:44', 0);
INSERT INTO `acl_role_permission` VALUES (5, 2, 9, '2022-01-20 20:52:44', '2022-01-20 20:52:44', 0);
INSERT INTO `acl_role_permission` VALUES (6, 2, 5, '2022-01-20 20:52:44', '2022-01-20 20:52:44', 0);
INSERT INTO `acl_role_permission` VALUES (7, 2, 15, '2022-01-20 20:52:44', '2022-01-20 20:52:44', 0);
INSERT INTO `acl_role_permission` VALUES (8, 3, 2, '2022-01-20 20:52:54', '2022-01-20 20:52:54', 0);
INSERT INTO `acl_role_permission` VALUES (9, 3, 3, '2022-01-20 20:52:54', '2022-01-20 20:52:54', 0);
INSERT INTO `acl_role_permission` VALUES (10, 3, 30, '2022-01-20 20:52:54', '2022-01-20 20:52:54', 0);
INSERT INTO `acl_role_permission` VALUES (11, 3, 7, '2022-01-20 20:52:54', '2022-01-20 20:52:54', 0);
INSERT INTO `acl_role_permission` VALUES (12, 3, 8, '2022-01-20 20:52:54', '2022-01-20 20:52:54', 0);
INSERT INTO `acl_role_permission` VALUES (13, 3, 31, '2022-01-20 20:52:54', '2022-01-20 20:52:54', 0);
INSERT INTO `acl_role_permission` VALUES (14, 3, 6, '2022-01-20 20:52:54', '2022-01-20 20:52:54', 0);
INSERT INTO `acl_role_permission` VALUES (15, 3, 4, '2022-01-20 20:52:54', '2022-01-20 20:52:54', 0);
INSERT INTO `acl_role_permission` VALUES (16, 3, 9, '2022-01-20 20:52:54', '2022-01-20 20:52:54', 0);
INSERT INTO `acl_role_permission` VALUES (17, 3, 12, '2022-01-20 20:52:54', '2022-01-20 20:52:54', 0);
INSERT INTO `acl_role_permission` VALUES (18, 3, 10, '2022-01-20 20:52:54', '2022-01-20 20:52:54', 0);
INSERT INTO `acl_role_permission` VALUES (19, 3, 13, '2022-01-20 20:52:54', '2022-01-20 20:52:54', 0);
INSERT INTO `acl_role_permission` VALUES (20, 3, 11, '2022-01-20 20:52:54', '2022-01-20 20:52:54', 0);
INSERT INTO `acl_role_permission` VALUES (21, 3, 5, '2022-01-20 20:52:54', '2022-01-20 20:52:54', 0);
INSERT INTO `acl_role_permission` VALUES (22, 3, 15, '2022-01-20 20:52:54', '2022-01-20 20:52:54', 0);
INSERT INTO `acl_role_permission` VALUES (23, 3, 16, '2022-01-20 20:52:54', '2022-01-20 20:52:54', 0);
INSERT INTO `acl_role_permission` VALUES (24, 3, 17, '2022-01-20 20:52:54', '2022-01-20 20:52:54', 0);
INSERT INTO `acl_role_permission` VALUES (25, 3, 18, '2022-01-20 20:52:54', '2022-01-20 20:52:54', 0);
INSERT INTO `acl_role_permission` VALUES (26, 4, 23, '2022-01-20 20:53:05', '2022-01-20 20:53:05', 0);
INSERT INTO `acl_role_permission` VALUES (27, 4, 28, '2022-01-20 20:53:05', '2022-01-20 20:53:05', 0);
INSERT INTO `acl_role_permission` VALUES (28, 4, 29, '2022-01-20 20:53:05', '2022-01-20 20:53:05', 0);
INSERT INTO `acl_role_permission` VALUES (29, 4, 24, '2022-01-20 20:53:05', '2022-01-20 20:53:05', 0);
INSERT INTO `acl_role_permission` VALUES (30, 4, 32, '2022-01-20 20:53:05', '2022-01-20 20:53:05', 0);
INSERT INTO `acl_role_permission` VALUES (31, 4, 26, '2022-01-20 20:53:05', '2022-01-20 20:53:05', 0);
INSERT INTO `acl_role_permission` VALUES (32, 4, 36, '2022-01-20 20:53:05', '2022-01-20 20:53:05', 0);
INSERT INTO `acl_role_permission` VALUES (33, 5, 23, '2022-01-20 20:53:13', '2022-01-20 20:53:13', 0);
INSERT INTO `acl_role_permission` VALUES (34, 5, 28, '2022-01-20 20:53:13', '2022-01-20 20:53:13', 0);
INSERT INTO `acl_role_permission` VALUES (35, 5, 29, '2022-01-20 20:53:13', '2022-01-20 20:53:13', 0);
INSERT INTO `acl_role_permission` VALUES (36, 5, 24, '2022-01-20 20:53:13', '2022-01-20 20:53:13', 0);
INSERT INTO `acl_role_permission` VALUES (37, 5, 32, '2022-01-20 20:53:13', '2022-01-20 20:53:13', 0);
INSERT INTO `acl_role_permission` VALUES (38, 5, 33, '2022-01-20 20:53:13', '2022-01-20 20:53:13', 0);
INSERT INTO `acl_role_permission` VALUES (39, 5, 34, '2022-01-20 20:53:13', '2022-01-20 20:53:13', 0);
INSERT INTO `acl_role_permission` VALUES (40, 5, 35, '2022-01-20 20:53:13', '2022-01-20 20:53:13', 0);
INSERT INTO `acl_role_permission` VALUES (41, 5, 26, '2022-01-20 20:53:13', '2022-01-20 20:53:13', 0);
INSERT INTO `acl_role_permission` VALUES (42, 5, 36, '2022-01-20 20:53:13', '2022-01-20 20:53:13', 0);
INSERT INTO `acl_role_permission` VALUES (43, 5, 37, '2022-01-20 20:53:13', '2022-01-20 20:53:13', 0);
INSERT INTO `acl_role_permission` VALUES (44, 5, 38, '2022-01-20 20:53:13', '2022-01-20 20:53:13', 0);
INSERT INTO `acl_role_permission` VALUES (45, 5, 39, '2022-01-20 20:53:13', '2022-01-20 20:53:13', 0);
INSERT INTO `acl_role_permission` VALUES (46, 5, 43, '2022-01-20 20:53:13', '2022-01-20 20:53:13', 0);
INSERT INTO `acl_role_permission` VALUES (47, 5, 40, '2022-01-20 20:53:13', '2022-01-20 20:53:13', 0);
INSERT INTO `acl_role_permission` VALUES (48, 5, 41, '2022-01-20 20:53:13', '2022-01-20 20:53:13', 0);
INSERT INTO `acl_role_permission` VALUES (49, 5, 42, '2022-01-20 20:53:13', '2022-01-20 20:53:13', 0);
INSERT INTO `acl_role_permission` VALUES (50, 8, 2, '2022-02-08 10:48:19', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (51, 8, 3, '2022-02-08 10:48:19', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (52, 8, 30, '2022-02-08 10:48:19', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (53, 8, 4, '2022-02-08 10:48:19', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (54, 8, 9, '2022-02-08 10:48:19', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (55, 8, 5, '2022-02-08 10:48:19', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (56, 8, 15, '2022-02-08 10:48:19', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (57, 8, 23, '2022-02-08 10:48:19', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (58, 8, 28, '2022-02-08 10:48:19', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (59, 8, 29, '2022-02-08 10:48:19', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (60, 8, 24, '2022-02-08 10:48:19', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (61, 8, 32, '2022-02-08 10:48:19', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (62, 8, 26, '2022-02-08 10:48:19', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (63, 8, 36, '2022-02-08 10:48:19', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (64, 8, 44, '2022-02-08 10:48:19', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (65, 8, 45, '2022-02-08 10:48:19', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (66, 8, 46, '2022-02-08 10:48:19', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (67, 8, 2, '2022-02-09 20:16:48', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (68, 8, 3, '2022-02-09 20:16:48', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (69, 8, 30, '2022-02-09 20:16:48', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (70, 8, 4, '2022-02-09 20:16:48', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (71, 8, 9, '2022-02-09 20:16:48', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (72, 8, 5, '2022-02-09 20:16:48', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (73, 8, 15, '2022-02-09 20:16:48', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (74, 8, 23, '2022-02-09 20:16:48', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (75, 8, 28, '2022-02-09 20:16:48', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (76, 8, 29, '2022-02-09 20:16:48', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (77, 8, 24, '2022-02-09 20:16:48', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (78, 8, 32, '2022-02-09 20:16:48', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (79, 8, 26, '2022-02-09 20:16:48', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (80, 8, 36, '2022-02-09 20:16:48', '2022-02-09 20:18:36', 1);
INSERT INTO `acl_role_permission` VALUES (81, 8, 2, '2022-02-09 20:18:36', '2022-02-09 20:18:36', 0);
INSERT INTO `acl_role_permission` VALUES (82, 8, 3, '2022-02-09 20:18:36', '2022-02-09 20:18:36', 0);
INSERT INTO `acl_role_permission` VALUES (83, 8, 30, '2022-02-09 20:18:36', '2022-02-09 20:18:36', 0);
INSERT INTO `acl_role_permission` VALUES (84, 8, 7, '2022-02-09 20:18:36', '2022-02-09 20:18:36', 0);
INSERT INTO `acl_role_permission` VALUES (85, 8, 31, '2022-02-09 20:18:36', '2022-02-09 20:18:36', 0);
INSERT INTO `acl_role_permission` VALUES (86, 8, 4, '2022-02-09 20:18:36', '2022-02-09 20:18:36', 0);
INSERT INTO `acl_role_permission` VALUES (87, 8, 9, '2022-02-09 20:18:36', '2022-02-09 20:18:36', 0);
INSERT INTO `acl_role_permission` VALUES (88, 8, 12, '2022-02-09 20:18:36', '2022-02-09 20:18:36', 0);
INSERT INTO `acl_role_permission` VALUES (89, 8, 5, '2022-02-09 20:18:36', '2022-02-09 20:18:36', 0);
INSERT INTO `acl_role_permission` VALUES (90, 8, 15, '2022-02-09 20:18:36', '2022-02-09 20:18:36', 0);
INSERT INTO `acl_role_permission` VALUES (91, 8, 23, '2022-02-09 20:18:36', '2022-02-09 20:18:36', 0);
INSERT INTO `acl_role_permission` VALUES (92, 8, 28, '2022-02-09 20:18:36', '2022-02-09 20:18:36', 0);
INSERT INTO `acl_role_permission` VALUES (93, 8, 29, '2022-02-09 20:18:36', '2022-02-09 20:18:36', 0);
INSERT INTO `acl_role_permission` VALUES (94, 8, 24, '2022-02-09 20:18:36', '2022-02-09 20:18:36', 0);
INSERT INTO `acl_role_permission` VALUES (95, 8, 32, '2022-02-09 20:18:36', '2022-02-09 20:18:36', 0);
INSERT INTO `acl_role_permission` VALUES (96, 8, 26, '2022-02-09 20:18:36', '2022-02-09 20:18:36', 0);
INSERT INTO `acl_role_permission` VALUES (97, 8, 36, '2022-02-09 20:18:36', '2022-02-09 20:18:36', 0);
INSERT INTO `acl_role_permission` VALUES (98, 32, 2, '2023-01-28 13:23:14', '2023-01-28 13:24:41', 1);
INSERT INTO `acl_role_permission` VALUES (99, 32, 3, '2023-01-28 13:23:15', '2023-01-28 13:24:41', 1);
INSERT INTO `acl_role_permission` VALUES (100, 32, 6, '2023-01-28 13:23:17', '2023-01-28 13:24:41', 1);
INSERT INTO `acl_role_permission` VALUES (101, 32, 7, '2023-01-28 13:23:18', '2023-01-28 13:24:41', 1);
INSERT INTO `acl_role_permission` VALUES (102, 32, 8, '2023-01-28 13:23:20', '2023-01-28 13:24:41', 1);
INSERT INTO `acl_role_permission` VALUES (103, 32, 30, '2023-01-28 13:23:21', '2023-01-28 13:24:41', 1);
INSERT INTO `acl_role_permission` VALUES (104, 32, 31, '2023-01-28 13:23:23', '2023-01-28 13:24:41', 1);
INSERT INTO `acl_role_permission` VALUES (105, 32, 2, '2023-01-28 13:24:42', '2023-01-29 23:33:47', 1);
INSERT INTO `acl_role_permission` VALUES (106, 32, 3, '2023-01-28 13:24:42', '2023-01-29 23:33:47', 1);
INSERT INTO `acl_role_permission` VALUES (107, 32, 6, '2023-01-28 13:24:43', '2023-01-29 23:33:47', 1);
INSERT INTO `acl_role_permission` VALUES (108, 32, 7, '2023-01-28 13:24:44', '2023-01-29 23:33:47', 1);
INSERT INTO `acl_role_permission` VALUES (109, 32, 8, '2023-01-28 13:24:44', '2023-01-29 23:33:47', 1);
INSERT INTO `acl_role_permission` VALUES (110, 32, 30, '2023-01-28 13:24:45', '2023-01-29 23:33:47', 1);
INSERT INTO `acl_role_permission` VALUES (111, 1, 2, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (112, 1, 3, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (113, 1, 6, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (114, 1, 7, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (115, 1, 8, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (116, 1, 30, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (117, 1, 31, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (118, 1, 4, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (119, 1, 9, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (120, 1, 10, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (121, 1, 11, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (122, 1, 12, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (123, 1, 13, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (124, 1, 5, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (125, 1, 15, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (126, 1, 16, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (127, 1, 17, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (128, 1, 18, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (129, 1, 23, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (130, 1, 24, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (131, 1, 32, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (132, 1, 33, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (133, 1, 34, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (134, 1, 35, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (135, 1, 26, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (136, 1, 36, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (137, 1, 37, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (138, 1, 38, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (139, 1, 39, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (140, 1, 40, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (141, 1, 41, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (142, 1, 42, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (143, 1, 43, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (144, 1, 28, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (145, 1, 29, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (146, 1, 44, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (147, 1, 45, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (148, 1, 46, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (149, 1, 47, '2023-01-28 16:55:26', '2023-01-28 16:55:26', 0);
INSERT INTO `acl_role_permission` VALUES (150, 32, 2, '2023-01-29 23:33:47', '2023-01-30 00:36:13', 1);
INSERT INTO `acl_role_permission` VALUES (151, 32, 3, '2023-01-29 23:33:47', '2023-01-30 00:36:13', 1);
INSERT INTO `acl_role_permission` VALUES (152, 32, 6, '2023-01-29 23:33:47', '2023-01-30 00:36:13', 1);
INSERT INTO `acl_role_permission` VALUES (153, 32, 7, '2023-01-29 23:33:47', '2023-01-30 00:36:13', 1);
INSERT INTO `acl_role_permission` VALUES (154, 32, 8, '2023-01-29 23:33:47', '2023-01-30 00:36:13', 1);
INSERT INTO `acl_role_permission` VALUES (155, 32, 30, '2023-01-29 23:33:47', '2023-01-30 00:36:13', 1);
INSERT INTO `acl_role_permission` VALUES (156, 32, 2, '2023-01-30 00:36:13', '2023-01-30 00:36:13', 0);
INSERT INTO `acl_role_permission` VALUES (157, 32, 3, '2023-01-30 00:36:13', '2023-01-30 00:36:13', 0);
INSERT INTO `acl_role_permission` VALUES (158, 32, 30, '2023-01-30 00:36:13', '2023-01-30 00:36:13', 0);
INSERT INTO `acl_role_permission` VALUES (159, 32, 4, '2023-01-30 00:36:13', '2023-01-30 00:36:13', 0);
INSERT INTO `acl_role_permission` VALUES (160, 32, 9, '2023-01-30 00:36:13', '2023-01-30 00:36:13', 0);
INSERT INTO `acl_role_permission` VALUES (161, 32, 5, '2023-01-30 00:36:13', '2023-01-30 00:36:13', 0);
INSERT INTO `acl_role_permission` VALUES (162, 32, 15, '2023-01-30 00:36:13', '2023-01-30 00:36:13', 0);
INSERT INTO `acl_role_permission` VALUES (163, 32, 23, '2023-01-30 00:36:13', '2023-01-30 00:36:13', 0);
INSERT INTO `acl_role_permission` VALUES (164, 32, 28, '2023-01-30 00:36:13', '2023-01-30 00:36:13', 0);
INSERT INTO `acl_role_permission` VALUES (165, 32, 29, '2023-01-30 00:36:13', '2023-01-30 00:36:13', 0);
INSERT INTO `acl_role_permission` VALUES (166, 32, 24, '2023-01-30 00:36:13', '2023-01-30 00:36:13', 0);
INSERT INTO `acl_role_permission` VALUES (167, 32, 32, '2023-01-30 00:36:13', '2023-01-30 00:36:13', 0);
INSERT INTO `acl_role_permission` VALUES (168, 32, 26, '2023-01-30 00:36:13', '2023-01-30 00:36:13', 0);
INSERT INTO `acl_role_permission` VALUES (169, 32, 36, '2023-01-30 00:36:13', '2023-01-30 00:36:13', 0);

-- ----------------------------
-- Table structure for hse_community
-- ----------------------------
DROP TABLE IF EXISTS `hse_community`;
CREATE TABLE `hse_community`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '小区名称',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `province_id` bigint(20) NULL DEFAULT NULL COMMENT '省id：（字典id） 预留字段',
  `city_id` bigint(20) NULL DEFAULT NULL COMMENT '城市id：（字典id）预留字段',
  `area_id` bigint(20) NULL DEFAULT NULL COMMENT '区域id：（字典id）',
  `plate_id` bigint(20) NULL DEFAULT NULL COMMENT '板块id：（字典id）',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `longitude` decimal(10, 2) NULL DEFAULT NULL COMMENT '经度（预留字段）',
  `latitude` decimal(10, 2) NULL DEFAULT NULL COMMENT '纬度（预留字段）',
  `build_years` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '建筑年代',
  `property_price` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物业价格',
  `property_company` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物业公司',
  `developer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开发商',
  `build_num` int(11) NULL DEFAULT NULL COMMENT '楼栋数',
  `house_num` int(11) NULL DEFAULT NULL COMMENT '房屋数',
  `average_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '均价',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:不可用 1:可用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小区信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hse_community
-- ----------------------------
INSERT INTO `hse_community` VALUES (1, '奥北南区', '奥北南区', NULL, NULL, 110234, 110243, '立水桥奥北南区', NULL, NULL, '2005年', '2.3', '奥北物业', '奥北建筑公司', 5, 3000, 1.60, '2022-01-12 14:26:55', '2022-02-08 14:37:16', 0);
INSERT INTO `hse_community` VALUES (2, '小白云区', '生活越来越好', NULL, NULL, 110056, 110057, '广东省广州市珠江新城', NULL, NULL, '2023年', '10000', '三无产品公司', '三无产品集团', 20, 100, 15000.00, '2023-01-23 18:48:49', '2023-01-23 21:14:43', 0);

-- ----------------------------
-- Table structure for hse_dict
-- ----------------------------
DROP TABLE IF EXISTS `hse_dict`;
CREATE TABLE `hse_dict`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '上级id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `dict_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:不可用 1:可用）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `dict_code`(`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110338 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织架构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hse_dict
-- ----------------------------
INSERT INTO `hse_dict` VALUES (1, 0, '全部分类', 'ROOT', '2019-06-10 10:43:31', '2022-01-12 14:56:13', 0);
INSERT INTO `hse_dict` VALUES (10000, 1, '户型', 'houseType', '2022-01-20 13:46:55', '2022-01-20 13:47:57', 0);
INSERT INTO `hse_dict` VALUES (10001, 10000, '一室', '', '2022-01-20 13:46:55', '2022-01-20 13:50:51', 0);
INSERT INTO `hse_dict` VALUES (10002, 10000, '两室', '', '2022-01-20 13:46:55', '2022-01-20 13:50:56', 0);
INSERT INTO `hse_dict` VALUES (10003, 10000, '三室', '', '2022-01-20 13:46:55', '2022-01-20 13:50:59', 0);
INSERT INTO `hse_dict` VALUES (10004, 10000, '四室', '', '2022-01-20 13:46:55', '2022-01-20 13:51:11', 0);
INSERT INTO `hse_dict` VALUES (10005, 10000, '四室以上', '', '2022-01-20 13:46:55', '2022-01-20 13:51:20', 0);
INSERT INTO `hse_dict` VALUES (20000, 1, '楼层', 'floor', '2022-01-20 13:46:55', '2022-01-20 13:48:19', 0);
INSERT INTO `hse_dict` VALUES (20001, 20000, '低楼层', '', '2022-01-20 13:46:55', '2022-01-20 13:51:45', 0);
INSERT INTO `hse_dict` VALUES (20002, 20000, '中楼层', '', '2022-01-20 13:46:55', '2022-01-20 13:51:50', 0);
INSERT INTO `hse_dict` VALUES (20003, 20000, '高楼层', '', '2022-01-20 13:46:55', '2022-01-20 13:51:51', 0);
INSERT INTO `hse_dict` VALUES (30000, 1, '建筑结构', 'buildStructure', '2022-01-20 13:46:55', '2022-01-20 13:49:44', 0);
INSERT INTO `hse_dict` VALUES (30001, 30000, '塔楼', '', '2022-01-20 13:46:55', '2022-01-20 13:52:09', 0);
INSERT INTO `hse_dict` VALUES (30002, 30000, '板楼', '', '2022-01-20 13:46:55', '2022-01-20 13:52:16', 0);
INSERT INTO `hse_dict` VALUES (30003, 30000, '板塔结合', '', '2022-01-20 13:46:55', '2022-01-20 13:52:17', 0);
INSERT INTO `hse_dict` VALUES (40000, 1, '装修情况', 'decoration', '2022-01-20 13:46:55', '2022-01-20 13:49:59', 0);
INSERT INTO `hse_dict` VALUES (40001, 40000, '精装修', '', '2022-01-20 13:46:55', '2022-01-20 13:52:36', 0);
INSERT INTO `hse_dict` VALUES (40002, 40000, '普通装修', '', '2022-01-20 13:46:55', '2022-01-20 13:52:43', 0);
INSERT INTO `hse_dict` VALUES (40003, 40000, '毛坯房', '', '2022-01-20 13:46:55', '2022-01-20 13:52:49', 0);
INSERT INTO `hse_dict` VALUES (40004, 40000, '豪华装修', '', '2022-01-20 13:46:55', '2022-01-20 13:53:01', 0);
INSERT INTO `hse_dict` VALUES (50000, 1, '朝向', 'direction', '2022-01-20 13:46:55', '2022-01-20 13:50:06', 0);
INSERT INTO `hse_dict` VALUES (50001, 50000, '南北', '', '2022-01-20 13:46:55', '2022-01-20 13:53:14', 0);
INSERT INTO `hse_dict` VALUES (50002, 50000, '朝南', '', '2022-01-20 13:46:55', '2022-01-20 13:53:19', 0);
INSERT INTO `hse_dict` VALUES (50003, 50000, '朝东', '', '2022-01-20 13:46:55', '2022-01-20 13:53:21', 0);
INSERT INTO `hse_dict` VALUES (50004, 50000, '朝北', NULL, '2022-01-20 13:53:34', '2022-01-20 13:54:05', 0);
INSERT INTO `hse_dict` VALUES (50005, 50000, '朝西', NULL, '2022-01-20 13:53:41', '2022-01-20 13:54:07', 0);
INSERT INTO `hse_dict` VALUES (60000, 1, '房屋用途', 'houseUse', '2022-01-20 13:46:55', '2022-01-20 13:50:37', 0);
INSERT INTO `hse_dict` VALUES (60001, 60000, '普通住宅', '', '2022-01-20 13:46:55', '2022-01-20 13:54:22', 0);
INSERT INTO `hse_dict` VALUES (60002, 60000, '商业类', '', '2022-01-20 13:46:55', '2022-01-20 13:54:28', 0);
INSERT INTO `hse_dict` VALUES (60003, 60000, '别墅', '', '2022-01-20 13:46:55', '2022-01-20 13:54:34', 0);
INSERT INTO `hse_dict` VALUES (60004, 60000, '四合院', '', '2022-01-20 13:46:55', '2022-01-20 13:54:41', 0);
INSERT INTO `hse_dict` VALUES (60005, 60000, '公寓', NULL, '2022-01-20 13:54:45', '2022-01-20 13:55:32', 0);
INSERT INTO `hse_dict` VALUES (60006, 60000, '其他', NULL, '2022-01-20 13:55:15', '2022-01-20 13:55:27', 0);
INSERT INTO `hse_dict` VALUES (100000, 1, '省', 'province', '2019-06-10 10:43:35', '2022-01-12 14:56:59', 0);
INSERT INTO `hse_dict` VALUES (110000, 100000, '北京', 'beijing', '2019-06-10 10:43:35', '2022-02-08 14:32:38', 0);
INSERT INTO `hse_dict` VALUES (110001, 110000, '东城', NULL, '2022-01-20 20:10:41', '2022-01-20 20:10:41', 0);
INSERT INTO `hse_dict` VALUES (110002, 110001, '安定门', NULL, '2022-01-20 20:11:04', '2022-01-20 20:11:04', 0);
INSERT INTO `hse_dict` VALUES (110003, 110001, '安贞', NULL, '2022-01-20 20:11:04', '2022-01-20 20:11:04', 0);
INSERT INTO `hse_dict` VALUES (110004, 110001, '朝阳门内', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110005, 110001, '朝阳门外', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110006, 110001, '崇文门', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110007, 110001, '灯市口', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110008, 110001, '地安门', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110009, 110001, '东单', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110010, 110001, '东花市', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110011, 110001, '东四', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110012, 110001, '东直门', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110013, 110001, '工体', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110014, 110001, '广渠门', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110015, 110001, '和平里', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110016, 110001, '建国门内', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110017, 110001, '建国门外', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110018, 110001, '交道口', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110019, 110001, '金宝街', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110020, 110001, '六铺炕', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110021, 110001, '蒲黄榆', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110022, 110001, '前门', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110023, 110001, '陶然亭', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110024, 110001, '天坛', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110025, 110001, '西单', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110026, 110001, '西罗园', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110027, 110001, '洋桥', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110028, 110001, '永定门', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110029, 110001, '左安门', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110030, 110000, '西城', NULL, '2022-01-20 20:11:05', '2022-01-20 20:11:05', 0);
INSERT INTO `hse_dict` VALUES (110031, 110030, '白纸坊', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110032, 110030, '菜户营', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110033, 110030, '长椿街', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110034, 110030, '车公庄', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110035, 110030, '德胜门', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110036, 110030, '地安门', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110037, 110030, '阜成门', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110038, 110030, '广安门', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110039, 110030, '官园', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110040, 110030, '金融街', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110041, 110030, '六铺炕', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110042, 110030, '马甸', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110043, 110030, '马连道', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110044, 110030, '木樨地', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110045, 110030, '牛街', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110046, 110030, '太平桥', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110047, 110030, '陶然亭', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110048, 110030, '天宁寺', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110049, 110030, '西单', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110050, 110030, '新街口', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110051, 110030, '西四', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110052, 110030, '西直门', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110053, 110030, '宣武门', NULL, '2022-01-20 20:11:08', '2022-01-20 20:11:08', 0);
INSERT INTO `hse_dict` VALUES (110054, 110030, '右安门', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110055, 110030, '内月坛', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110056, 110000, '朝阳', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110057, 110056, '安定门', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110058, 110056, '安贞', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110059, 110056, '奥林匹克公园', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110060, 110056, '百子湾', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110061, 110056, '北工大', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110062, 110056, '北苑CCBD', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110063, 110056, '常营', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110064, 110056, '朝青', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110065, 110056, '朝阳公园', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110066, 110056, '朝阳门外', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110067, 110056, '成寿寺', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110068, 110056, '大山子', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110069, 110056, '大望路', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110070, 110056, '定福庄', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110071, 110056, '东坝', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110072, 110056, '东大桥', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110073, 110056, '东直门', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110074, 110056, '豆各庄', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110075, 110056, '方庄垡头', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110076, 110056, '甘露园', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110077, 110056, '高碑店', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110078, 110056, '工体', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110079, 110056, '广渠门', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110080, 110056, '管庄', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110081, 110056, '国展', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110082, 110056, '和平里', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110083, 110056, '红庙', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110084, 110056, '欢乐谷', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110085, 110056, '华威桥', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110086, 110056, '惠新西街', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110087, 110056, '建国门外', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110088, 110056, '健翔桥', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110089, 110056, '劲松', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110090, 110056, '酒仙桥', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110091, 110056, '亮马桥', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110092, 110056, '立水桥', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110093, 110056, '马甸', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110094, 110056, '牡丹园', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110095, 110056, '南沙滩', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110096, 110056, '农展馆', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110097, 110056, '潘家园', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110098, 110056, '三里屯', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110099, 110056, '三元桥', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110100, 110056, '芍药居', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110101, 110056, '十八里店', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110102, 110056, '石佛营', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110103, 110056, '十里堡', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110104, 110056, '十里河', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110105, 110056, '首都机场', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110106, 110056, '双井', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110107, 110056, '双桥', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110108, 110056, '四惠', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110109, 110056, '宋家庄', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110110, 110056, '太阳宫', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110111, 110056, '甜水园', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110112, 110056, '通州北苑', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110113, 110056, '团结湖', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110114, 110056, '望京', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110115, 110056, '西坝河', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110116, 110056, '燕莎', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110117, 110056, '亚运村', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110118, 110056, '亚运村', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110119, 110056, '小营', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110120, 110056, '朝阳其它', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110121, 110056, '中央别墅区', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110122, 110000, '海淀', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110123, 110122, '安宁庄', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110124, 110122, '奥林匹克公园', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110125, 110122, '白石桥', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110126, 110122, '北太平庄', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110127, 110122, '厂洼', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110128, 110122, '定慧寺', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110129, 110122, '二里庄', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110130, 110122, '甘家口', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110131, 110122, '公主坟', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110132, 110122, '海淀北部新区', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110133, 110122, '海淀其它', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110134, 110122, '军博', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110135, 110122, '六里桥', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110136, 110122, '马甸', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110137, 110122, '马连洼', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110138, 110122, '牡丹园', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110139, 110122, '清河', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110140, 110122, '上地', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110141, 110122, '世纪城', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110142, 110122, '双榆树', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110143, 110122, '四季青', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110144, 110122, '苏州桥', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110145, 110122, '田村', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110146, 110122, '万柳', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110147, 110122, '万寿路', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110148, 110122, '魏公村', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110149, 110122, '五道口', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110150, 110122, '五棵松', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110151, 110122, '小西天', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110152, 110122, '西北旺', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110153, 110122, '西二旗', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110154, 110122, '新街口', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110155, 110122, '西三旗', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110156, 110122, '西山', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110157, 110122, '西直门', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110158, 110122, '学院路', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110159, 110122, '颐和园', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110160, 110122, '圆明园', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110161, 110122, '玉泉路', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110162, 110122, '皂君庙', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110163, 110122, '知春路', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110164, 110122, '中关村', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110165, 110122, '紫竹桥', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110166, 110000, '丰台', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110167, 110166, '北大地', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110168, 110166, '北京南站', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110169, 110166, '菜户营', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110170, 110166, '草桥', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110171, 110166, '成寿寺', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110172, 110166, '大红门', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110173, 110166, '方庄', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110174, 110166, '丰台其它', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110175, 110166, '广安门', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110176, 110166, '和义', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110177, 110166, '花乡', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110178, 110166, '角门', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110179, 110166, '旧宫', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110180, 110166, '看丹桥科技园区', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110181, 110166, '刘家窑', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110182, 110166, '六里桥', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110183, 110166, '丽泽', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110184, 110166, '卢沟桥', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110185, 110166, '马家堡', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110186, 110166, '马连道', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110187, 110166, '木樨园', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110188, 110166, '蒲黄榆', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110189, 110166, '七里庄', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110190, 110166, '青塔', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110191, 110166, '十里河', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110192, 110166, '宋家庄', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110193, 110166, '太平桥', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110194, 110166, '陶然亭', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110195, 110166, '万源', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110196, 110166, '五棵松', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110197, 110166, '五里店', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110198, 110166, '西红门', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110199, 110166, '西罗园', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110200, 110166, '新宫', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110201, 110166, '洋桥', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110202, 110166, '永定门', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110203, 110166, '右安门外', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110204, 110166, '岳各庄', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110205, 110166, '玉泉营', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110206, 110166, '赵公口', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110207, 110000, '石景山', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110208, 110207, '八角', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110209, 110207, '城子', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110210, 110207, '古城', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110211, 110207, '老山', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110212, 110207, '鲁谷', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110213, 110207, '苹果园', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110214, 110207, '石景山其它', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110215, 110207, '杨庄', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110216, 110207, '玉泉路', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110217, 110000, '通州', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110218, 110217, '北关', NULL, '2022-01-20 20:11:09', '2022-01-20 20:11:09', 0);
INSERT INTO `hse_dict` VALUES (110219, 110217, '大兴新机场洋房别墅区', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110220, 110217, '果园', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110221, 110217, '九棵树(家乐福)', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110222, 110217, '临河里', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110223, 110217, '梨园', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110224, 110217, '潞苑', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110225, 110217, '马驹桥', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110226, 110217, '乔庄', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110227, 110217, '首都机场', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110228, 110217, '通州北苑', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110229, 110217, '通州其它', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110230, 110217, '万达', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110231, 110217, '武夷花园', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110232, 110217, '亦庄', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110233, 110217, '玉桥', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110234, 110000, '昌平', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110235, 110234, '奥林匹克公园', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110236, 110234, '百善镇', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110237, 110234, '北七家', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110238, 110234, '昌平其它', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110239, 110234, '东关', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110240, 110234, '鼓楼大街', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110241, 110234, '回龙观', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110242, 110234, '霍营', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110243, 110234, '立水桥', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110244, 110234, '南口南邵', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110245, 110234, '沙河', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110246, 110234, '天通苑', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110247, 110234, '小汤山', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110248, 110234, '西关环岛', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110249, 110234, '西三旗', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110250, 110000, '大兴', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110251, 110250, '大兴其它', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110252, 110250, '大兴新机场', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110253, 110250, '大兴新机场洋房别墅区', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110254, 110250, '高米店', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110255, 110250, '观音寺', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110256, 110250, '和义', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110257, 110250, '黄村火车站', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110258, 110250, '黄村中', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110259, 110250, '旧宫', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110260, 110250, '科技园区', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110261, 110250, '马驹桥', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110262, 110250, '南中轴机场商务区', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110263, 110250, '天宫院', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110264, 110250, '天宫院南', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110265, 110250, '通州其它', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110266, 110250, '万源', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110267, 110250, '西红门', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110268, 110250, '义和庄', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110269, 110250, '瀛海', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110270, 110250, '亦庄', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110271, 110250, '亦庄开发区其它', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110272, 110250, '枣园', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110273, 110000, '亦庄开发区', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110274, 110273, '马驹桥', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110275, 110273, '通州其它', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110276, 110273, '亦庄', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110277, 110273, '亦庄开发区', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110278, 110273, '其它', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110279, 110000, '顺义', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110280, 110279, '后沙峪', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110281, 110279, '李桥', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110282, 110279, '马坡', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110283, 110279, '首都机场', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110284, 110279, '顺义城', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110285, 110279, '顺义其它', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110286, 110279, '天竺', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110287, 110279, '杨镇', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110288, 110279, '中央别墅区', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110289, 110000, '房山', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110290, 110289, '长阳', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110291, 110289, '城关', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110292, 110289, '窦店', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110293, 110289, '房山其它', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110294, 110289, '韩村河', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110295, 110289, '良乡', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110296, 110289, '琉璃河', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110297, 110289, '阎村', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110298, 110289, '燕山', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110299, 110000, '门头沟', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110300, 110299, '滨河西区', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110301, 110299, '城子', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110302, 110299, '大峪', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110303, 110299, '冯村', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110304, 110299, '门头沟其它', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110305, 110299, '上岸地铁', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110306, 110299, '石门营', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110307, 110000, '平谷', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110308, 110307, '平谷', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110309, 110307, '平谷其它', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110310, 110000, '怀柔', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110311, 110310, '怀柔', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110312, 110310, '怀柔其它', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110313, 110000, '密云', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110314, 110313, '北庄镇', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110315, 110313, '不老屯镇', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110316, 110313, '大城子镇', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110317, 110313, '东邵渠镇', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110318, 110313, '冯家峪镇', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110319, 110313, '高岭镇', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110320, 110313, '古北口镇', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110321, 110313, '鼓楼街道', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110322, 110313, '果园街道', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110323, 110313, '河南寨镇', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110324, 110313, '巨各庄镇', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110325, 110313, '密云其它', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110326, 110313, '密云镇', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110327, 110313, '穆家峪镇', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110328, 110313, '石城镇', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110329, 110313, '十里堡镇', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110330, 110313, '太师屯镇', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110331, 110313, '檀营', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110332, 110313, '新城子镇', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110333, 110313, '西田各庄镇', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110334, 110313, '溪翁庄镇', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110335, 110000, '延庆', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110336, 110335, '延庆', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);
INSERT INTO `hse_dict` VALUES (110337, 110335, '延庆其它', NULL, '2022-01-20 20:11:10', '2022-01-20 20:11:10', 0);

-- ----------------------------
-- Table structure for hse_house
-- ----------------------------
DROP TABLE IF EXISTS `hse_house`;
CREATE TABLE `hse_house`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `community_id` bigint(20) NULL DEFAULT NULL COMMENT '小区id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '房源名称',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价：万元',
  `unit_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单位价格',
  `build_area` decimal(10, 2) NULL DEFAULT NULL COMMENT '建筑面积',
  `inside_area` decimal(10, 2) NULL DEFAULT NULL COMMENT '套内面积',
  `house_type_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '户型：（字典id）',
  `floor_id` bigint(20) NULL DEFAULT NULL COMMENT '楼层（字典id）',
  `build_structure_id` bigint(20) NULL DEFAULT NULL COMMENT '建筑结构：（字典id）',
  `direction_id` bigint(20) NULL DEFAULT NULL COMMENT '朝向：（字典id）',
  `decoration_id` bigint(20) NULL DEFAULT NULL COMMENT '装修情况：（字典id）',
  `house_use_id` bigint(20) NULL DEFAULT NULL COMMENT '房屋用途：（字典id）',
  `elevator_ratio` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电梯比例',
  `listing_date` date NULL DEFAULT NULL COMMENT '挂牌日期',
  `last_trade_date` date NULL DEFAULT NULL COMMENT '上次交易日期',
  `default_image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认图片',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:不可用 1:可用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hse_house
-- ----------------------------
INSERT INTO `hse_house` VALUES (1, 1, ' 仁恒滨河湾 4室2厅 东南', '房子是套四改成了套三带书房，，客厅正带阳台，位置安静不临.', 250.00, 25000.00, 100.00, 98.00, '10004', 20001, 30002, 50001, 40002, 60002, '2梯5户', '2022-01-21', '2022-01-03', 'http://139.198.127.41:9000/sph/20220117/pc1_HOkXp6Dq7_1.jpg', 1, '2022-01-12 18:46:12', '2022-02-09 14:02:40', 0);
INSERT INTO `hse_house` VALUES (2, 1, ' 中粮鸿云 2室1厅 南', '总价低，位置安静，屋内干净整洁，标准套二，户型方正', 150.00, 21000.00, 100.00, 60.00, '10002', 20003, 30002, 50002, 40001, 60001, '2梯5户', '2022-01-20', '2022-01-21', 'http://139.198.127.41:9000/sph/20220117/apc_9FMIBMHM9_1.jpg', 1, '2022-01-17 11:18:56', '2022-02-09 14:02:42', 0);
INSERT INTO `hse_house` VALUES (3, 1, ' 奥北南区 2室1厅 南', '总价低，位置安静，屋内干净整洁，标准套二，户型方正', 190.00, 21000.00, 100.00, 60.00, '10002', 20003, 30002, 50002, 40001, 60001, '2梯5户', '2022-01-20', '2022-01-21', 'http://139.198.127.41:9000/sph/20220117/apc_9FMIBMHM9_1.jpg', 1, '2022-01-22 15:36:43', '2022-02-09 15:54:21', 0);
INSERT INTO `hse_house` VALUES (4, 2, '农村自建房', '清新的空气，大自然的向往', 100.00, 2000.00, 800.00, 750.00, '10005', 20003, 30001, 50001, 40003, 60001, '1', '2023-01-23', '2023-01-23', 'http://rozti2kdd.hn-bkt.clouddn.com/05f2364a45214e9bae25dd3bbd1761f3', 1, '2023-01-23 22:09:10', '2023-01-25 14:45:17', 0);
INSERT INTO `hse_house` VALUES (5, 2, '养猪房', '猪大户', 20.00, 200.00, 100.00, 80.00, '10001', 20001, 30001, 50002, 40002, 60006, '0', '2023-01-27', '2023-01-28', 'http://rozti2kdd.hn-bkt.clouddn.com/8974d72f24b54c89b183ea6bea41d14b.jfif', 0, '2023-01-27 18:51:56', '2023-01-27 19:38:15', 0);

-- ----------------------------
-- Table structure for hse_house_broker
-- ----------------------------
DROP TABLE IF EXISTS `hse_house_broker`;
CREATE TABLE `hse_house_broker`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `house_id` bigint(20) NULL DEFAULT NULL COMMENT '房源id',
  `broker_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '经纪人id',
  `broker_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经纪人名称',
  `broker_head_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经纪人头像',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:不可用 1:可用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房源经纪人' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hse_house_broker
-- ----------------------------
INSERT INTO `hse_house_broker` VALUES (1, 1, 1, '张丽丽', 'http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc', '2022-01-13 10:54:46', '2022-02-09 15:50:25', 0);
INSERT INTO `hse_house_broker` VALUES (4, 2, 1, '张滴滴', 'http://r61cnlsfq.hn-bkt.clouddn.com/23ebd355-1e6a-4eea-b5a8-f9b112971e5c', '2022-01-17 11:20:53', '2022-02-09 15:50:46', 1);
INSERT INTO `hse_house_broker` VALUES (5, 2, 6, '王倩倩', 'http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc', '2022-01-21 16:22:35', '2022-02-09 15:50:34', 0);
INSERT INTO `hse_house_broker` VALUES (6, 3, 3, '李遇华', 'http://r61cnlsfq.hn-bkt.clouddn.com/23ebd355-1e6a-4eea-b5a8-f9b112971e5c', '2022-02-08 14:40:07', '2022-02-09 15:50:56', 0);
INSERT INTO `hse_house_broker` VALUES (7, 1, 9, '木化十', NULL, '2023-01-24 19:09:33', '2023-01-24 19:48:32', 0);
INSERT INTO `hse_house_broker` VALUES (8, 4, 9, '木化十', 'http://rozti2kdd.hn-bkt.clouddn.com/60c0d29b-891a-404f-9325-87bde774e36b', '2023-01-24 19:12:27', '2023-01-25 01:04:29', 0);

-- ----------------------------
-- Table structure for hse_house_image
-- ----------------------------
DROP TABLE IF EXISTS `hse_house_image`;
CREATE TABLE `hse_house_image`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `house_id` bigint(20) NULL DEFAULT NULL COMMENT '房源id',
  `image_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片名称',
  `image_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `type` tinyint(3) NULL DEFAULT NULL COMMENT '1：普通图片 2：房产图片',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:不可用 1:可用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房源图片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hse_house_image
-- ----------------------------
INSERT INTO `hse_house_image` VALUES (5, 2, 'pc1_HOkXp6Dq7_1.jpg', 'http://139.198.127.41:9000/sph/20220117/pc1_HOkXp6Dq7_1.jpg', 1, '2022-01-17 11:20:13', '2022-01-17 11:20:13', 0);
INSERT INTO `hse_house_image` VALUES (6, 2, 'apc_EgwS9InnI_1.jpg', 'http://139.198.127.41:9000/sph/20220117/apc_EgwS9InnI_1.jpg', 1, '2022-01-17 11:20:13', '2022-01-17 11:20:13', 0);
INSERT INTO `hse_house_image` VALUES (7, 2, 'standard_4b284f6e-04ca-4540-a26e-5305743b68d8.jpg', 'http://139.198.127.41:9000/sph/20220117/standard_4b284f6e-04ca-4540-a26e-5305743b68d8.jpg', 1, '2022-01-17 11:20:13', '2022-01-17 11:20:13', 0);
INSERT INTO `hse_house_image` VALUES (8, 2, 'apc_HbdX4RkOV_1.jpg', 'http://139.198.127.41:9000/sph/20220117/apc_HbdX4RkOV_1.jpg', 1, '2022-01-17 11:20:13', '2022-01-17 11:20:13', 0);
INSERT INTO `hse_house_image` VALUES (9, 1, 'apc_9FMIBMHM9_1.jpg', 'http://139.198.127.41:9000/sph/20220117/apc_9FMIBMHM9_1.jpg', 1, '2022-01-17 11:23:00', '2022-01-17 11:23:00', 0);
INSERT INTO `hse_house_image` VALUES (10, 1, 'apc_HIBLQpuMf_1.jpg', 'http://139.198.127.41:9000/sph/20220117/apc_HIBLQpuMf_1.jpg', 1, '2022-01-17 11:23:00', '2022-01-17 11:23:00', 0);
INSERT INTO `hse_house_image` VALUES (11, 1, 'apc_4NhFJIj5T_1.jpg', 'http://139.198.127.41:9000/sph/20220117/apc_4NhFJIj5T_1.jpg', 1, '2022-01-17 11:23:00', '2022-01-17 11:23:00', 0);
INSERT INTO `hse_house_image` VALUES (12, 1, 'apc_ODc6saIRi_1.jpg', 'http://139.198.127.41:9000/sph/20220117/apc_ODc6saIRi_1.jpg', 1, '2022-01-17 11:23:01', '2022-01-17 11:23:01', 0);
INSERT INTO `hse_house_image` VALUES (13, 1, 'apc_ymzbHkvAU_1.jpg', 'http://139.198.127.41:9000/sph/20220117/apc_ymzbHkvAU_1.jpg', 1, '2022-01-17 11:23:01', '2022-01-17 11:23:01', 0);
INSERT INTO `hse_house_image` VALUES (14, 1, 'pc1_4MHQXcI32_1.jpg', 'http://139.198.127.41:9000/sph/20220117/pc1_4MHQXcI32_1.jpg', 1, '2022-01-17 11:23:01', '2022-01-17 11:23:01', 0);
INSERT INTO `hse_house_image` VALUES (15, 1, 'standard_9ab173da-bd9b-4f18-8094-5258601610de.jpg', 'http://139.198.127.41:9000/sph/20220117/standard_9ab173da-bd9b-4f18-8094-5258601610de.jpg', 1, '2022-01-17 11:23:01', '2022-01-20 11:16:53', 1);
INSERT INTO `hse_house_image` VALUES (16, 1, 'dcddb77d336fb01334e87bcb1054b082_23201.jpg', 'http://139.198.127.41:9000/sph/20220120/dcddb77d336fb01334e87bcb1054b082_23201.jpg', 2, '2022-01-20 10:48:29', '2022-01-20 10:48:29', 0);
INSERT INTO `hse_house_image` VALUES (17, 1, 'a482f61378e3ca735f257d89ff9a687f_63413.png', 'http://139.198.127.41:9000/sph/20220120/a482f61378e3ca735f257d89ff9a687f_63413.png', 2, '2022-01-20 10:48:29', '2022-01-20 10:48:29', 0);
INSERT INTO `hse_house_image` VALUES (18, 2, '8cd7fe193a7c39ad47173b5c250bb81d_74680.png', 'http://139.198.127.41:9000/sph/20220120/8cd7fe193a7c39ad47173b5c250bb81d_74680.png', 2, '2022-01-20 11:22:04', '2022-01-20 11:22:04', 0);
INSERT INTO `hse_house_image` VALUES (19, 2, 'a482f61378e3ca735f257d89ff9a687f_63413.png', 'http://139.198.127.41:9000/sph/20220120/a482f61378e3ca735f257d89ff9a687f_63413.png', 2, '2022-01-20 11:22:04', '2022-01-20 11:22:04', 0);
INSERT INTO `hse_house_image` VALUES (20, 2, 'f12c6915a1dfd666d8bb44a83b0dd6cc_24510.png', 'http://139.198.127.41:9000/sph/20220120/f12c6915a1dfd666d8bb44a83b0dd6cc_24510.png', 2, '2022-01-20 11:22:05', '2022-01-20 11:22:05', 0);
INSERT INTO `hse_house_image` VALUES (21, 2, '2b1b68e18a5e9530e4cb952c6407efa1_28715.png', 'http://139.198.127.41:9000/sph/20220120/2b1b68e18a5e9530e4cb952c6407efa1_28715.png', 2, '2022-01-20 11:22:05', '2022-01-20 11:22:28', 1);
INSERT INTO `hse_house_image` VALUES (22, 1, '8cd7fe193a7c39ad47173b5c250bb81d_74680.png', 'http://r37k428df.hn-bkt.clouddn.com/c5e3e5d1-8dc5-4783-9b80-5c9c74ea7d16', 2, '2022-01-21 08:53:56', '2022-01-21 09:11:09', 1);
INSERT INTO `hse_house_image` VALUES (23, 1, 'a482f61378e3ca735f257d89ff9a687f_63413.png', 'http://r37k428df.hn-bkt.clouddn.com/71fbbd2a-bb95-4e9f-8fba-39d1dc37d191', 2, '2022-01-21 08:55:06', '2022-01-21 09:11:13', 1);
INSERT INTO `hse_house_image` VALUES (24, 1, 'dcddb77d336fb01334e87bcb1054b082_23201.jpg', 'http://r61cnlsfq.hn-bkt.clouddn.com/0a3e9749-6e2f-4344-b62f-1f2c3037eda2', 2, '2022-01-21 09:11:50', '2022-01-21 09:11:50', 0);
INSERT INTO `hse_house_image` VALUES (25, 2, 'f12c6915a1dfd666d8bb44a83b0dd6cc_24510.png', 'http://r61cnlsfq.hn-bkt.clouddn.com/cb530b79-b7aa-48df-b348-f9420f6bdb3b', 2, '2022-01-21 09:28:16', '2022-01-21 09:28:16', 0);
INSERT INTO `hse_house_image` VALUES (26, 2, '2b1b68e18a5e9530e4cb952c6407efa1_28715.png', 'http://r61cnlsfq.hn-bkt.clouddn.com/d980bd1d-aadc-44a6-81a2-d30d8d6224a7', 2, '2022-01-21 09:28:47', '2022-01-21 09:28:47', 0);
INSERT INTO `hse_house_image` VALUES (27, 3, 'apc_o66IlLFre_1.jpg', 'http://r61cnlsfq.hn-bkt.clouddn.com/c4e911f2-cf57-40f6-b7d7-c1906dee52a7', 1, '2022-02-08 14:39:29', '2022-02-08 14:39:29', 0);
INSERT INTO `hse_house_image` VALUES (28, 3, 'apc_dxN7NHSji_1.jpg', 'http://r61cnlsfq.hn-bkt.clouddn.com/8eb11585-4d02-4dff-b060-ff7739394bb2', 1, '2022-02-08 14:39:29', '2022-02-08 14:39:29', 0);
INSERT INTO `hse_house_image` VALUES (29, 3, 'pc1_lqaPviRok_1.jpg', 'http://r61cnlsfq.hn-bkt.clouddn.com/d7acc92f-c13a-41bf-b539-5a873f09e999', 1, '2022-02-08 14:39:29', '2022-02-08 14:39:29', 0);
INSERT INTO `hse_house_image` VALUES (30, 3, 'standard_2f9b5fb5-e16e-44a8-ae39-5ea34a82b4d5.jpg', 'http://r61cnlsfq.hn-bkt.clouddn.com/48f1ec44-6035-44ac-b145-ae08e2c14c49', 1, '2022-02-08 14:39:29', '2022-02-08 14:39:29', 0);
INSERT INTO `hse_house_image` VALUES (31, 3, 'apc_dxN7NHSji_1.jpg', 'http://r61cnlsfq.hn-bkt.clouddn.com/f0120dce-6b88-4fa2-a5eb-1d1ddea76226', 2, '2022-02-08 14:39:51', '2022-02-08 14:39:51', 0);
INSERT INTO `hse_house_image` VALUES (32, 3, 'apc_o66IlLFre_1.jpg', 'http://r61cnlsfq.hn-bkt.clouddn.com/73236d3c-340c-45bb-8c35-cbc7c2df9c2c', 2, '2022-02-08 14:39:51', '2022-02-08 14:39:51', 0);
INSERT INTO `hse_house_image` VALUES (33, 3, 'pc1_lqaPviRok_1.jpg', 'http://r61cnlsfq.hn-bkt.clouddn.com/f7730961-618e-49e1-be72-180efac8cb26', 2, '2022-02-08 14:39:51', '2022-02-08 14:39:51', 0);
INSERT INTO `hse_house_image` VALUES (34, 3, 'standard_2f9b5fb5-e16e-44a8-ae39-5ea34a82b4d5.jpg', 'http://r61cnlsfq.hn-bkt.clouddn.com/174a528b-80f1-43b2-9be4-9f10838e787c', 2, '2022-02-08 14:39:51', '2022-02-08 14:39:51', 0);
INSERT INTO `hse_house_image` VALUES (35, 3, 'pc1_J6RXLclrT_1.jpg', 'http://r61cnlsfq.hn-bkt.clouddn.com/18c167ea-b158-4566-b5d2-1d1b97d7a255', 1, '2022-02-09 20:12:38', '2022-02-09 20:12:38', 0);
INSERT INTO `hse_house_image` VALUES (36, 3, 'pc0_2YP2k5bsv_1.jpg', 'http://r61cnlsfq.hn-bkt.clouddn.com/e1dc7a3a-bf98-4338-aca7-5dcc4f8b1e8c', 1, '2022-02-09 20:12:38', '2022-02-09 20:12:51', 1);
INSERT INTO `hse_house_image` VALUES (47, 4, 'OIP-C (2).jfif', 'http://rozti2kdd.hn-bkt.clouddn.com/5c68b4194ae042eead8f19c8bad15516', 1, '2023-01-25 00:24:48', '2023-01-25 00:24:48', 0);
INSERT INTO `hse_house_image` VALUES (48, 4, 'OIP-C (3).jfif', 'http://rozti2kdd.hn-bkt.clouddn.com/6c0229b0a985438eaaa5e2b35dc7f256', 1, '2023-01-25 00:24:48', '2023-01-25 00:40:25', 1);
INSERT INTO `hse_house_image` VALUES (49, 4, 'OIP-C (4).jfif', 'http://rozti2kdd.hn-bkt.clouddn.com/f6da906d7287434f936a037ea3145871', 1, '2023-01-25 00:24:48', '2023-01-25 00:40:32', 1);
INSERT INTO `hse_house_image` VALUES (50, 4, 'R-C (1).jfif', 'http://rozti2kdd.hn-bkt.clouddn.com/05f2364a45214e9bae25dd3bbd1761f3', 1, '2023-01-25 00:24:49', '2023-01-25 00:24:49', 0);
INSERT INTO `hse_house_image` VALUES (51, 4, 'R-C.jfif', 'http://rozti2kdd.hn-bkt.clouddn.com/4923455270884e548ada551539e13e70', 1, '2023-01-25 00:24:49', '2023-01-25 00:24:49', 0);
INSERT INTO `hse_house_image` VALUES (52, 4, 'OIP-C (6).jfif', 'http://rozti2kdd.hn-bkt.clouddn.com/e2c45c8524de43e1afa05474e6843f73', 2, '2023-01-25 00:32:57', '2023-01-25 00:32:57', 0);
INSERT INTO `hse_house_image` VALUES (53, 4, 'OIP-C (7).jfif', 'http://rozti2kdd.hn-bkt.clouddn.com/fce279f1a5bf42cc9e69a7c2dda779a2', 2, '2023-01-25 00:32:57', '2023-01-25 00:32:57', 0);
INSERT INTO `hse_house_image` VALUES (54, 4, 'OIP-C (5).jfif', 'http://rozti2kdd.hn-bkt.clouddn.com/66b9c911260d48f4afd1cb9fcdbfb979', 2, '2023-01-25 00:32:57', '2023-01-25 00:32:57', 0);

-- ----------------------------
-- Table structure for hse_house_user
-- ----------------------------
DROP TABLE IF EXISTS `hse_house_user`;
CREATE TABLE `hse_house_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `house_id` bigint(20) NULL DEFAULT NULL COMMENT '房源id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '房东姓名',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `sex` tinyint(3) NULL DEFAULT 1 COMMENT '性别 1:男 2：女',
  `id_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除标记（0:不可用 1:可用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '房东信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hse_house_user
-- ----------------------------
INSERT INTO `hse_house_user` VALUES (1, 1, 'test', '111', 1, '1111111111', '2022-01-13 11:00:16', '2022-01-13 11:00:16', 0);
INSERT INTO `hse_house_user` VALUES (2, 1, '3', '3', 1, '1', '2022-01-13 17:57:53', '2022-01-13 17:58:08', 1);
INSERT INTO `hse_house_user` VALUES (3, 2, '麻子', '15010445566', 2, '5325555555555555555', '2022-01-17 11:21:22', '2022-01-17 11:21:22', 0);
INSERT INTO `hse_house_user` VALUES (4, 3, '张三', '15010445566', 1, '5325555555555555555', '2022-02-08 14:40:29', '2022-02-08 14:40:29', 0);
INSERT INTO `hse_house_user` VALUES (5, 3, '李四', '15010445566', 2, '5325555555555555555', '2022-02-08 14:49:25', '2022-02-08 14:49:25', 0);
INSERT INTO `hse_house_user` VALUES (6, 4, '马房东', '15010546381', 1, '440851200102141459', '2023-01-24 20:29:36', '2023-01-24 21:01:04', 0);

-- ----------------------------
-- Table structure for user_follow
-- ----------------------------
DROP TABLE IF EXISTS `user_follow`;
CREATE TABLE `user_follow`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `house_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '房源id',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户关注表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_follow
-- ----------------------------
INSERT INTO `user_follow` VALUES (1, 1, 1, '2022-01-21 11:17:57', '2022-02-08 10:10:58', 1);
INSERT INTO `user_follow` VALUES (2, 1, 1, '2022-02-08 10:11:08', '2022-02-10 10:07:14', 1);
INSERT INTO `user_follow` VALUES (3, 1, 3, '2022-02-09 20:27:22', '2022-02-10 09:26:15', 1);
INSERT INTO `user_follow` VALUES (4, 1, 3, '2022-02-10 10:01:17', '2022-02-10 10:01:57', 1);
INSERT INTO `user_follow` VALUES (5, 1, 3, '2022-02-10 10:06:03', '2022-02-10 10:07:12', 1);
INSERT INTO `user_follow` VALUES (6, 1, 3, '2022-02-10 10:20:48', '2022-02-10 10:23:31', 1);
INSERT INTO `user_follow` VALUES (7, 1, 2, '2022-02-10 10:23:24', '2022-02-10 10:23:29', 1);
INSERT INTO `user_follow` VALUES (8, 1, 3, '2022-02-10 10:23:38', '2023-01-27 17:34:33', 1);
INSERT INTO `user_follow` VALUES (9, 1, 4, '2023-01-27 13:51:05', '2023-01-27 17:34:29', 1);
INSERT INTO `user_follow` VALUES (10, 1, 3, '2023-01-27 13:51:23', '2023-01-27 13:51:23', 0);
INSERT INTO `user_follow` VALUES (11, 1, 4, '2023-01-27 13:51:38', '2023-01-27 13:51:38', 0);
INSERT INTO `user_follow` VALUES (12, 1, 4, '2023-01-27 13:51:40', '2023-01-27 17:40:08', 1);
INSERT INTO `user_follow` VALUES (13, 2, 4, '2023-01-27 14:29:35', '2023-01-27 14:29:35', 0);
INSERT INTO `user_follow` VALUES (14, 2, 3, '2023-01-27 14:30:27', '2023-01-27 14:30:27', 0);
INSERT INTO `user_follow` VALUES (15, 3, 4, '2023-01-27 19:44:25', '2023-01-27 19:44:25', 0);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `nick_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `status` tinyint(3) NOT NULL DEFAULT 1 COMMENT '状态（0：锁定 1：正常）',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_mobile`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, '15099999999', '96e79218965eb72c92a549dd5a330112', '晴天', 1, '2022-01-19 13:59:14', '2022-01-19 14:17:35', 0);
INSERT INTO `user_info` VALUES (2, '14577163444', 'e10adc3949ba59abbe56e057f20f883e', '看看', 1, '2023-01-25 17:13:44', '2023-01-25 17:13:44', 0);
INSERT INTO `user_info` VALUES (3, '17514241365', 'e10adc3949ba59abbe56e057f20f883e', '牛马', 1, '2023-01-27 19:43:43', '2023-01-27 19:43:43', 0);

SET FOREIGN_KEY_CHECKS = 1;
