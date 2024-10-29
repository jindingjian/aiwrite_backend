/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80037
 Source Host           : localhost:3306
 Source Schema         : aiwrite

 Target Server Type    : MySQL
 Target Server Version : 80037
 File Encoding         : 65001

 Date: 24/10/2024 10:14:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_config
-- ----------------------------
DROP TABLE IF EXISTS `gen_config`;
CREATE TABLE `gen_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '表名',
  `module_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模块名',
  `package_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '包名',
  `business_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务名',
  `entity_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实体类名',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作者',
  `parent_menu_id` bigint NULL DEFAULT NULL COMMENT '上级菜单ID，对应sys_menu的id ',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tablename`(`table_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成基础配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_config
-- ----------------------------
INSERT INTO `gen_config` VALUES (1, 'sys_user', 'system', 'com.youlai.boot', '用户信息', 'User', 'youlaitech', NULL, '2024-10-22 16:36:20', '2024-10-22 16:36:20', b'0');
INSERT INTO `gen_config` VALUES (3, 'tb_user', 'system', 'com.youlai.boot', '普通用户，存储用户的基本信息和父子级关系', 'TbUser', 'tshy', 26, '2024-10-23 02:39:41', '2024-10-23 03:40:04', b'0');
INSERT INTO `gen_config` VALUES (5, 'tb_aigc_oeder', 'system', 'com.youlai.boot', 'aigc文件上传记录', 'AigcOeder', 'tshy', NULL, '2024-10-23 14:28:42', '2024-10-23 16:06:03', b'0');
INSERT INTO `gen_config` VALUES (7, 'tb_aigc_order', 'system', 'com.youlai.boot', 'aigc文件上传记录', 'AigcOrder', 'tshy', 20, '2024-10-23 16:13:32', '2024-10-23 16:13:32', b'0');
INSERT INTO `gen_config` VALUES (10, 'tb_ai_order', 'system', 'com.youlai.boot', '订单提交记录', 'AiOrder', 'tshy', 89, '2024-10-24 09:38:05', '2024-10-24 09:38:05', b'0');

-- ----------------------------
-- Table structure for gen_field_config
-- ----------------------------
DROP TABLE IF EXISTS `gen_field_config`;
CREATE TABLE `gen_field_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `config_id` bigint NOT NULL COMMENT '关联的配置ID',
  `column_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `column_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `column_length` int NULL DEFAULT NULL,
  `field_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字段名称',
  `field_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字段类型',
  `field_sort` int NULL DEFAULT NULL COMMENT '字段排序',
  `field_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字段描述',
  `max_length` int NULL DEFAULT NULL,
  `is_required` tinyint(1) NULL DEFAULT NULL COMMENT '是否必填',
  `is_show_in_list` tinyint(1) NULL DEFAULT 0 COMMENT '是否在列表显示',
  `is_show_in_form` tinyint(1) NULL DEFAULT 0 COMMENT '是否在表单显示',
  `is_show_in_query` tinyint(1) NULL DEFAULT 0 COMMENT '是否在查询条件显示',
  `query_type` tinyint NULL DEFAULT NULL COMMENT '查询方式',
  `form_type` tinyint NULL DEFAULT NULL COMMENT '表单类型',
  `dict_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字典类型',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `config_id`(`config_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成字段配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_field_config
-- ----------------------------
INSERT INTO `gen_field_config` VALUES (1, 1, 'id', 'int', NULL, 'id', 'Integer', 1, '', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-22 16:36:20', '2024-10-22 16:36:20');
INSERT INTO `gen_field_config` VALUES (2, 1, 'username', 'varchar', NULL, 'username', 'String', 2, '用户名', 64, 0, 1, 1, 1, 1, 1, NULL, '2024-10-22 16:36:20', '2024-10-22 16:36:20');
INSERT INTO `gen_field_config` VALUES (3, 1, 'nickname', 'varchar', NULL, 'nickname', 'String', 3, '昵称', 64, 0, 1, 1, 1, 1, 1, NULL, '2024-10-22 16:36:20', '2024-10-22 16:36:20');
INSERT INTO `gen_field_config` VALUES (4, 1, 'gender', 'tinyint', NULL, 'gender', 'Integer', 4, '性别((1-男 2-女 0-保密)', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-22 16:36:20', '2024-10-22 16:36:20');
INSERT INTO `gen_field_config` VALUES (5, 1, 'password', 'varchar', NULL, 'password', 'String', 5, '密码', 100, 0, 1, 1, 1, 1, 1, NULL, '2024-10-22 16:36:20', '2024-10-22 16:36:20');
INSERT INTO `gen_field_config` VALUES (6, 1, 'dept_id', 'int', NULL, 'deptId', 'Integer', 6, '部门ID', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-22 16:36:20', '2024-10-22 16:36:20');
INSERT INTO `gen_field_config` VALUES (7, 1, 'avatar', 'varchar', NULL, 'avatar', 'String', 7, '用户头像', 255, 0, 1, 1, 1, 1, 1, NULL, '2024-10-22 16:36:20', '2024-10-22 16:36:20');
INSERT INTO `gen_field_config` VALUES (8, 1, 'mobile', 'varchar', NULL, 'mobile', 'String', 8, '联系方式', 20, 0, 1, 1, 1, 1, 1, NULL, '2024-10-22 16:36:20', '2024-10-22 16:36:20');
INSERT INTO `gen_field_config` VALUES (9, 1, 'status', 'tinyint', NULL, 'status', 'Integer', 9, '状态((1-正常 0-禁用)', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-22 16:36:20', '2024-10-22 16:36:20');
INSERT INTO `gen_field_config` VALUES (10, 1, 'email', 'varchar', NULL, 'email', 'String', 10, '用户邮箱', 128, 0, 1, 1, 1, 1, 1, NULL, '2024-10-22 16:36:20', '2024-10-22 16:36:20');
INSERT INTO `gen_field_config` VALUES (11, 1, 'create_time', 'datetime', NULL, 'createTime', 'LocalDateTime', 11, '创建时间', NULL, 0, 1, 1, 1, 4, 9, NULL, '2024-10-22 16:36:20', '2024-10-22 16:36:20');
INSERT INTO `gen_field_config` VALUES (12, 1, 'create_by', 'bigint', NULL, 'createBy', 'Long', 12, '创建人ID', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-22 16:36:20', '2024-10-22 16:36:20');
INSERT INTO `gen_field_config` VALUES (13, 1, 'update_time', 'datetime', NULL, 'updateTime', 'LocalDateTime', 13, '更新时间', NULL, 0, 1, 1, 1, 4, 9, NULL, '2024-10-22 16:36:20', '2024-10-22 16:36:20');
INSERT INTO `gen_field_config` VALUES (14, 1, 'update_by', 'bigint', NULL, 'updateBy', 'Long', 14, '修改人ID', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-22 16:36:20', '2024-10-22 16:36:20');
INSERT INTO `gen_field_config` VALUES (15, 1, 'is_deleted', 'tinyint', NULL, 'isDeleted', 'Integer', 15, '逻辑删除标识(0-未删除 1-已删除)', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-22 16:36:20', '2024-10-22 16:36:20');
INSERT INTO `gen_field_config` VALUES (16, 1, 'balance', 'decimal', NULL, 'balance', 'BigDecimal', 16, '用户余额', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-22 16:36:20', '2024-10-22 16:36:20');
INSERT INTO `gen_field_config` VALUES (17, 1, 'parent_id', 'int', NULL, 'parentId', 'Integer', 17, '父级用户ID，用于管理用户层级关系', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-22 16:36:20', '2024-10-22 16:36:20');
INSERT INTO `gen_field_config` VALUES (25, 3, 'id', 'bigint', NULL, 'id', 'Long', 1, '用户ID', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-23 02:39:47', '2024-10-23 03:40:04');
INSERT INTO `gen_field_config` VALUES (26, 3, 'username', 'varchar', NULL, 'username', 'String', 2, '用户名，必须唯一', 50, 0, 1, 1, 1, 1, 1, NULL, '2024-10-23 02:39:47', '2024-10-23 03:40:04');
INSERT INTO `gen_field_config` VALUES (27, 3, 'password', 'varchar', NULL, 'password', 'String', 3, '加密后的用户密码', 100, 0, 1, 1, 1, 1, 1, NULL, '2024-10-23 02:39:47', '2024-10-23 03:40:05');
INSERT INTO `gen_field_config` VALUES (28, 3, 'balance', 'decimal', NULL, 'balance', 'BigDecimal', 4, '用户账户余额', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-23 02:39:47', '2024-10-23 03:40:05');
INSERT INTO `gen_field_config` VALUES (29, 3, 'parent_id', 'bigint', NULL, 'parentId', 'Long', 5, '父用户ID，表示父子级关系', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-23 02:39:47', '2024-10-23 03:40:05');
INSERT INTO `gen_field_config` VALUES (30, 3, 'create_time', 'timestamp', NULL, 'createTime', NULL, 6, '用户创建时间', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-23 02:39:47', '2024-10-23 03:40:06');
INSERT INTO `gen_field_config` VALUES (31, 3, 'update_time', 'timestamp', NULL, 'updateTime', NULL, 7, '用户更新时间', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-23 02:39:47', '2024-10-23 03:40:06');
INSERT INTO `gen_field_config` VALUES (39, 5, 'id', 'bigint', NULL, 'id', 'Long', 1, '主键ID', NULL, 0, 1, 0, 0, 1, 1, NULL, '2024-10-23 14:28:42', '2024-10-23 16:06:03');
INSERT INTO `gen_field_config` VALUES (40, 5, 'user_id', 'bigint', NULL, 'userId', 'Long', 2, '用户ID', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-23 14:28:42', '2024-10-23 16:06:03');
INSERT INTO `gen_field_config` VALUES (41, 5, 'file_name', 'varchar', NULL, 'fileName', 'String', 3, '文件名', 255, 0, 1, 1, 1, 1, 1, NULL, '2024-10-23 14:28:42', '2024-10-23 16:06:03');
INSERT INTO `gen_field_config` VALUES (42, 5, 'file_size', 'bigint', NULL, 'fileSize', 'Long', 4, '文件大小（以字节为单位）', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-23 14:28:42', '2024-10-23 16:06:03');
INSERT INTO `gen_field_config` VALUES (43, 5, 'upload_time', 'datetime', NULL, 'uploadTime', 'LocalDateTime', 5, '上传时间', NULL, 0, 1, 1, 1, 4, 9, NULL, '2024-10-23 14:28:42', '2024-10-23 16:06:03');
INSERT INTO `gen_field_config` VALUES (44, 5, 'total_word_count', 'int', NULL, 'totalWordCount', 'Integer', 6, '总字数', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-23 14:28:42', '2024-10-23 16:06:03');
INSERT INTO `gen_field_config` VALUES (45, 5, 'ai_generated_word_count', 'int', NULL, 'aiGeneratedWordCount', 'Integer', 7, 'AI生成字数', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-23 14:28:42', '2024-10-23 16:06:03');
INSERT INTO `gen_field_config` VALUES (46, 5, 'ai_percentage', 'decimal', NULL, 'aiPercentage', 'BigDecimal', 8, 'AI生成比例（例如：75.00）', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-23 14:28:42', '2024-10-23 16:06:03');
INSERT INTO `gen_field_config` VALUES (47, 5, 'human_percentage', 'decimal', NULL, 'humanPercentage', 'BigDecimal', 9, '人工写作比例（例如：25.00）', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-23 14:28:42', '2024-10-23 16:06:03');
INSERT INTO `gen_field_config` VALUES (48, 5, 'human_written_word_count', 'int', NULL, 'humanWrittenWordCount', 'Integer', 10, '人工写作字数', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-23 14:28:42', '2024-10-23 16:06:03');
INSERT INTO `gen_field_config` VALUES (49, 5, 'analysis', 'text', NULL, 'analysis', 'String', 11, '分析结果', 65535, 0, 1, 1, 1, 1, 1, NULL, '2024-10-23 14:28:42', '2024-10-23 16:06:03');
INSERT INTO `gen_field_config` VALUES (50, 5, 'message', 'text', NULL, 'message', 'String', 12, '其他信息', 65535, 0, 1, 1, 1, 1, 1, NULL, '2024-10-23 14:28:42', '2024-10-23 16:06:03');
INSERT INTO `gen_field_config` VALUES (51, 5, 'created_at', 'datetime', NULL, 'createdAt', 'LocalDateTime', 13, '记录创建时间', NULL, 0, 1, 1, 1, 4, 9, NULL, '2024-10-23 14:28:42', '2024-10-23 14:28:42');
INSERT INTO `gen_field_config` VALUES (52, 5, 'updated_at', 'datetime', NULL, 'updatedAt', 'LocalDateTime', 14, '记录修改时间', NULL, 0, 1, 1, 1, 4, 9, NULL, '2024-10-23 14:28:42', '2024-10-23 14:28:42');
INSERT INTO `gen_field_config` VALUES (67, 5, 'created_time', 'datetime', NULL, 'createdTime', 'LocalDateTime', 15, '记录创建时间', NULL, 0, 1, 1, 1, 4, 9, NULL, '2024-10-23 16:06:03', '2024-10-23 16:06:03');
INSERT INTO `gen_field_config` VALUES (68, 5, 'updated_time', 'datetime', NULL, 'updatedTime', 'LocalDateTime', 16, '记录修改时间', NULL, 0, 1, 1, 1, 4, 9, NULL, '2024-10-23 16:06:03', '2024-10-23 16:06:03');
INSERT INTO `gen_field_config` VALUES (69, 7, 'id', 'bigint', NULL, 'id', 'Long', 1, '主键ID', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-23 16:13:32', '2024-10-23 16:13:32');
INSERT INTO `gen_field_config` VALUES (70, 7, 'user_id', 'bigint', NULL, 'userId', 'Long', 2, '用户ID', NULL, 1, 1, 1, 1, 1, 1, NULL, '2024-10-23 16:13:32', '2024-10-23 16:13:32');
INSERT INTO `gen_field_config` VALUES (71, 7, 'file_name', 'varchar', NULL, 'fileName', 'String', 3, '文件名', 255, 1, 1, 1, 1, 1, 1, NULL, '2024-10-23 16:13:32', '2024-10-23 16:13:32');
INSERT INTO `gen_field_config` VALUES (72, 7, 'file_size', 'bigint', NULL, 'fileSize', 'Long', 4, '文件大小（以字节为单位）', NULL, 1, 1, 1, 1, 1, 1, NULL, '2024-10-23 16:13:32', '2024-10-23 16:13:32');
INSERT INTO `gen_field_config` VALUES (73, 7, 'upload_time', 'datetime', NULL, 'uploadTime', 'LocalDateTime', 5, '上传时间', NULL, 1, 1, 1, 1, 4, 9, NULL, '2024-10-23 16:13:32', '2024-10-23 16:13:32');
INSERT INTO `gen_field_config` VALUES (74, 7, 'total_word_count', 'int', NULL, 'totalWordCount', 'Integer', 6, '总字数', NULL, 1, 1, 1, 1, 1, 1, NULL, '2024-10-23 16:13:32', '2024-10-23 16:13:32');
INSERT INTO `gen_field_config` VALUES (75, 7, 'ai_generated_word_count', 'int', NULL, 'aiGeneratedWordCount', 'Integer', 7, 'AI生成字数', NULL, 1, 1, 1, 1, 1, 1, NULL, '2024-10-23 16:13:32', '2024-10-23 16:13:32');
INSERT INTO `gen_field_config` VALUES (76, 7, 'ai_percentage', 'decimal', NULL, 'aiPercentage', 'BigDecimal', 8, 'AI生成比例（例如：75.00）', NULL, 1, 1, 1, 1, 1, 1, NULL, '2024-10-23 16:13:32', '2024-10-23 16:13:32');
INSERT INTO `gen_field_config` VALUES (77, 7, 'human_percentage', 'decimal', NULL, 'humanPercentage', 'BigDecimal', 9, '人工写作比例（例如：25.00）', NULL, 1, 1, 1, 1, 1, 1, NULL, '2024-10-23 16:13:32', '2024-10-23 16:13:32');
INSERT INTO `gen_field_config` VALUES (78, 7, 'human_written_word_count', 'int', NULL, 'humanWrittenWordCount', 'Integer', 10, '人工写作字数', NULL, 1, 1, 1, 1, 1, 1, NULL, '2024-10-23 16:13:32', '2024-10-23 16:13:32');
INSERT INTO `gen_field_config` VALUES (79, 7, 'analysis', 'text', NULL, 'analysis', 'String', 11, '分析结果', 65535, 1, 1, 1, 1, 1, 1, NULL, '2024-10-23 16:13:32', '2024-10-23 16:13:32');
INSERT INTO `gen_field_config` VALUES (80, 7, 'message', 'text', NULL, 'message', 'String', 12, '其他信息', 65535, 1, 1, 1, 1, 1, 1, NULL, '2024-10-23 16:13:32', '2024-10-23 16:13:32');
INSERT INTO `gen_field_config` VALUES (81, 7, 'created_time', 'datetime', NULL, 'createdTime', 'LocalDateTime', 13, '记录创建时间', NULL, 1, 1, 1, 1, 4, 9, NULL, '2024-10-23 16:13:32', '2024-10-23 16:13:32');
INSERT INTO `gen_field_config` VALUES (82, 7, 'updated_time', 'datetime', NULL, 'updatedTime', 'LocalDateTime', 14, '记录修改时间', NULL, 1, 1, 1, 1, 4, 9, NULL, '2024-10-23 16:13:32', '2024-10-23 16:13:32');
INSERT INTO `gen_field_config` VALUES (112, 10, 'id', 'bigint', NULL, 'id', 'Long', 1, '订单记录唯一标识', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-24 09:38:05', '2024-10-24 09:38:05');
INSERT INTO `gen_field_config` VALUES (113, 10, 'title', 'varchar', NULL, 'title', 'String', 2, '论文标题', 255, 0, 1, 1, 1, 1, 1, NULL, '2024-10-24 09:38:05', '2024-10-24 09:38:05');
INSERT INTO `gen_field_config` VALUES (114, 10, 'major', 'varchar', NULL, 'major', 'String', 3, '论文所属专业', 255, 0, 1, 1, 1, 1, 1, NULL, '2024-10-24 09:38:05', '2024-10-24 09:38:05');
INSERT INTO `gen_field_config` VALUES (115, 10, 'word_count', 'int', NULL, 'wordCount', 'Integer', 4, '论文字数', NULL, 0, 1, 1, 1, 1, 1, NULL, '2024-10-24 09:38:05', '2024-10-24 09:38:05');
INSERT INTO `gen_field_config` VALUES (116, 10, 'create_time', 'datetime', NULL, 'createTime', 'LocalDateTime', 5, '提交时间', NULL, 0, 1, 1, 1, 4, 9, NULL, '2024-10-24 09:38:05', '2024-10-24 09:38:05');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `config_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置名称',
  `config_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置key',
  `config_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置值',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述、备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` bigint NOT NULL COMMENT '创建人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人ID',
  `is_deleted` tinyint(1) NOT NULL COMMENT '逻辑删除标识(0-未删除 1-已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门编号',
  `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '父节点id',
  `tree_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '父节点id路径',
  `sort` smallint NULL DEFAULT 0 COMMENT '显示顺序',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态(1-正常 0-禁用)',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除标识(1-已删除 0-未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_code`(`code` ASC) USING BTREE COMMENT '部门编号唯一索引'
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '有来技术', 'YOULAI', 0, '0', 1, 1, 1, NULL, 1, '2024-06-24 23:48:59', 0);
INSERT INTO `sys_dept` VALUES (2, '研发部门', 'RD001', 1, '0,1', 1, 1, 2, NULL, 2, '2022-04-19 12:46:37', 0);
INSERT INTO `sys_dept` VALUES (3, '测试部门', 'QA001', 1, '0,1', 1, 1, 2, NULL, 2, '2022-04-19 12:46:37', 0);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `dict_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典编码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '类型编码',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态(0：正常，1：禁用)',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint NULL DEFAULT 0 COMMENT '是否删除(0：未删除，1：已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统字典表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, 'gender', '性别', 1, NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', 0);
INSERT INTO `sys_dict` VALUES (2, 'notice_type', '通知类型', 1, NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', 0);
INSERT INTO `sys_dict` VALUES (3, 'notice_level', '通知级别', 1, NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', 0);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dict_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联字典编码，与sys_dict表中的dict_code对应',
  `value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典项值',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典项标签',
  `tag_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签类型，用于前端样式展示（如success、warning等）',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态（1-正常，0-禁用）',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 'gender', '1', '男', 'primary', 1, 1, NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30');
INSERT INTO `sys_dict_data` VALUES (2, 'gender', '2', '女', 'danger', 1, 2, NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30');
INSERT INTO `sys_dict_data` VALUES (3, 'gender', '0', '保密', 'info', 1, 3, NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30');
INSERT INTO `sys_dict_data` VALUES (4, 'notice_type', '1', '系统升级', 'success', 1, 1, '', '2024-10-15 03:47:30', '2024-10-15 03:47:30');
INSERT INTO `sys_dict_data` VALUES (5, 'notice_type', '2', '系统维护', 'primary', 1, 2, '', '2024-10-15 03:47:30', '2024-10-15 03:47:30');
INSERT INTO `sys_dict_data` VALUES (6, 'notice_type', '3', '安全警告', 'danger', 1, 3, '', '2024-10-15 03:47:30', '2024-10-15 03:47:30');
INSERT INTO `sys_dict_data` VALUES (7, 'notice_type', '4', '假期通知', 'success', 1, 4, '', '2024-10-15 03:47:30', '2024-10-15 03:47:30');
INSERT INTO `sys_dict_data` VALUES (8, 'notice_type', '5', '公司新闻', 'primary', 1, 5, '', '2024-10-15 03:47:30', '2024-10-15 03:47:30');
INSERT INTO `sys_dict_data` VALUES (9, 'notice_type', '99', '其他', 'info', 1, 99, '', '2024-10-15 03:47:30', '2024-10-15 03:47:30');
INSERT INTO `sys_dict_data` VALUES (10, 'notice_level', 'L', '低', 'info', 1, 1, '', '2024-10-15 03:47:30', '2024-10-15 03:47:30');
INSERT INTO `sys_dict_data` VALUES (11, 'notice_level', 'M', '中', 'warning', 1, 2, '', '2024-10-15 03:47:30', '2024-10-15 03:47:30');
INSERT INTO `sys_dict_data` VALUES (12, 'notice_level', 'H', '高', 'danger', 1, 3, '', '2024-10-15 03:47:30', '2024-10-15 03:47:30');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `module` enum('LOGIN','USER','ROLE','DEPT','MENU','DICT','OTHER') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志模块',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志内容',
  `request_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求路径',
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `province` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `execution_time` bigint NULL DEFAULT NULL COMMENT '执行时间(ms)',
  `browser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  `browser_version` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器版本',
  `os` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端系统',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除标识(1-已删除 0-未删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'LOGIN', '登录', '/api/v1/auth/login', '198.18.0.1', '0', '内网IP', 205, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-15 05:54:44', 0);
INSERT INTO `sys_log` VALUES (2, 'LOGIN', '登录', '/api/v1/auth/login', '198.18.0.1', '0', '内网IP', 505, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-15 13:19:32', 0);
INSERT INTO `sys_log` VALUES (3, 'LOGIN', '登录', '/api/v1/auth/login', '198.18.0.1', '0', '内网IP', 1206, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-16 02:39:22', 0);
INSERT INTO `sys_log` VALUES (4, 'LOGIN', '登录', '/api/v1/auth/login', '198.18.0.1', '0', '内网IP', 188, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-16 04:42:39', 0);
INSERT INTO `sys_log` VALUES (5, 'LOGIN', '登录', '/api/v1/auth/login', '198.18.0.1', '0', '内网IP', 208, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-16 09:28:38', 0);
INSERT INTO `sys_log` VALUES (6, 'LOGIN', '登录', '/api/v1/auth/login', '198.18.0.1', '0', '内网IP', 412, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-16 09:56:34', 0);
INSERT INTO `sys_log` VALUES (7, 'LOGIN', '登录', '/api/v1/auth/login', '198.18.0.1', '0', '内网IP', 192, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-16 10:37:44', 0);
INSERT INTO `sys_log` VALUES (8, 'LOGIN', '登录', '/api/v1/auth/login', '198.18.0.1', '0', '内网IP', 82, 'MSEdge', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-16 10:42:53', 0);
INSERT INTO `sys_log` VALUES (9, 'LOGIN', '登录', '/api/v1/auth/login', '198.18.0.1', '0', '内网IP', 177, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-16 12:38:58', 0);
INSERT INTO `sys_log` VALUES (10, 'LOGIN', '登录', '/api/v1/auth/login', '198.18.0.1', '0', '内网IP', 178, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-16 14:41:24', 0);
INSERT INTO `sys_log` VALUES (11, 'LOGIN', '登录', '/api/v1/auth/login', '198.18.0.1', '0', '内网IP', 583, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-22 15:22:39', 0);
INSERT INTO `sys_log` VALUES (12, 'LOGIN', '登录', '/api/v1/auth/login', '198.18.0.1', '0', '内网IP', 334, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-22 16:02:17', 0);
INSERT INTO `sys_log` VALUES (13, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '198.18.0.1', '0', '内网IP', 138, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-22 16:02:28', 0);
INSERT INTO `sys_log` VALUES (14, 'LOGIN', '注销', '/api/v1/auth/logout', '198.18.0.1', '0', '内网IP', 108, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-22 16:12:47', 0);
INSERT INTO `sys_log` VALUES (15, 'LOGIN', '注销', '/api/v1/auth/logout', '198.18.0.1', '0', '内网IP', 52, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-22 16:26:48', 0);
INSERT INTO `sys_log` VALUES (16, 'LOGIN', '登录', '/api/v1/auth/login', '198.18.0.1', '0', '内网IP', 241, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-22 16:27:02', 0);
INSERT INTO `sys_log` VALUES (17, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '198.18.0.1', '0', '内网IP', 172, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-22 16:27:03', 0);
INSERT INTO `sys_log` VALUES (18, 'LOGIN', '登录', '/api/v1/auth/login', '198.18.0.1', '0', '内网IP', 317, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-22 16:34:25', 0);
INSERT INTO `sys_log` VALUES (19, 'OTHER', '生成代码', '/api/v1/codegen/sys_user/config', '198.18.0.1', '0', '内网IP', 1661, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-22 16:36:22', 0);
INSERT INTO `sys_log` VALUES (20, 'OTHER', '预览生成代码', '/api/v1/codegen/sys_user/preview', '198.18.0.1', '0', '内网IP', 371, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-22 16:36:23', 0);
INSERT INTO `sys_log` VALUES (21, 'USER', '用户分页列表', '/api/v1/users/page', '198.18.0.1', '0', '内网IP', 953, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-22 17:46:21', 0);
INSERT INTO `sys_log` VALUES (22, 'ROLE', '角色分页列表', '/api/v1/roles/page', '198.18.0.1', '0', '内网IP', 119, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-22 17:46:21', 0);
INSERT INTO `sys_log` VALUES (23, 'LOGIN', '登录', '/api/v1/auth/login', '198.18.0.1', '0', '内网IP', 346, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-22 18:29:15', 0);
INSERT INTO `sys_log` VALUES (24, 'LOGIN', '注销', '/api/v1/auth/logout', '198.18.0.1', '0', '内网IP', 73, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-22 18:39:47', 0);
INSERT INTO `sys_log` VALUES (25, 'LOGIN', '登录', '/api/v1/auth/login', '198.18.0.1', '0', '内网IP', 338, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-22 18:42:43', 0);
INSERT INTO `sys_log` VALUES (26, 'LOGIN', '登录', '/api/v1/auth/login', '198.18.0.1', '0', '内网IP', 545, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-22 19:36:01', 0);
INSERT INTO `sys_log` VALUES (27, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 46240, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-22 23:43:00', 0);
INSERT INTO `sys_log` VALUES (28, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 344, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-22 23:54:15', 0);
INSERT INTO `sys_log` VALUES (29, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 20835, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 00:00:25', 0);
INSERT INTO `sys_log` VALUES (30, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 389, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 00:00:43', 0);
INSERT INTO `sys_log` VALUES (31, 'OTHER', '预览生成代码', '/api/v1/codegen/sys_user/preview', '192.168.244.1', '0', '内网IP', 428, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 00:01:47', 0);
INSERT INTO `sys_log` VALUES (32, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 226, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 00:08:42', 0);
INSERT INTO `sys_log` VALUES (33, 'OTHER', '下载代码', '/api/v1/codegen/sys_user/download', '192.168.244.1', '0', '内网IP', 19677, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 00:08:46', 0);
INSERT INTO `sys_log` VALUES (34, 'OTHER', '生成代码', '/api/v1/codegen/tb_user/config', '192.168.244.1', '0', '内网IP', 1523, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 00:09:19', 0);
INSERT INTO `sys_log` VALUES (35, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_user/preview', '192.168.244.1', '0', '内网IP', 218, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 00:09:20', 0);
INSERT INTO `sys_log` VALUES (36, 'OTHER', '下载代码', '/api/v1/codegen/tb_user/download', '192.168.244.1', '0', '内网IP', 339, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 00:09:25', 0);
INSERT INTO `sys_log` VALUES (37, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 196, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 00:19:13', 0);
INSERT INTO `sys_log` VALUES (38, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 1192, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 00:24:42', 0);
INSERT INTO `sys_log` VALUES (39, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 19550, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 00:24:54', 0);
INSERT INTO `sys_log` VALUES (40, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 74, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 00:34:09', 0);
INSERT INTO `sys_log` VALUES (41, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 1061, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 01:11:31', 0);
INSERT INTO `sys_log` VALUES (42, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 95, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 01:13:10', 0);
INSERT INTO `sys_log` VALUES (43, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 20581, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 01:25:04', 0);
INSERT INTO `sys_log` VALUES (44, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 232, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 01:25:13', 0);
INSERT INTO `sys_log` VALUES (45, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 397, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 01:25:17', 0);
INSERT INTO `sys_log` VALUES (46, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 53, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 01:25:24', 0);
INSERT INTO `sys_log` VALUES (47, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 1125, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 01:50:52', 0);
INSERT INTO `sys_log` VALUES (48, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 19662, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 01:51:04', 0);
INSERT INTO `sys_log` VALUES (49, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 73, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 01:51:20', 0);
INSERT INTO `sys_log` VALUES (50, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 278, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 01:51:25', 0);
INSERT INTO `sys_log` VALUES (51, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 51, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 01:52:09', 0);
INSERT INTO `sys_log` VALUES (52, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 395, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 01:52:13', 0);
INSERT INTO `sys_log` VALUES (53, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 55, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 02:00:54', 0);
INSERT INTO `sys_log` VALUES (54, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 1748, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 02:17:34', 0);
INSERT INTO `sys_log` VALUES (55, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 50822, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 02:18:15', 0);
INSERT INTO `sys_log` VALUES (56, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 3073, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 02:38:46', 0);
INSERT INTO `sys_log` VALUES (57, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 914, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 02:38:50', 0);
INSERT INTO `sys_log` VALUES (58, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 488, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 02:38:58', 0);
INSERT INTO `sys_log` VALUES (59, 'OTHER', '生成代码', '/api/v1/codegen/tb_user/config', '192.168.244.1', '0', '内网IP', 9154, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 02:39:50', 0);
INSERT INTO `sys_log` VALUES (60, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_user/preview', '192.168.244.1', '0', '内网IP', 486, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 02:39:51', 0);
INSERT INTO `sys_log` VALUES (61, 'OTHER', '下载代码', '/api/v1/codegen/tb_user/download', '192.168.244.1', '0', '内网IP', 482, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 02:40:15', 0);
INSERT INTO `sys_log` VALUES (62, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 66, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 03:00:15', 0);
INSERT INTO `sys_log` VALUES (63, 'ROLE', '角色分页列表', '/api/v1/roles/page', '192.168.244.1', '0', '内网IP', 150, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 03:10:06', 0);
INSERT INTO `sys_log` VALUES (64, 'USER', '用户分页列表', '/api/v1/users/page', '192.168.244.1', '0', '内网IP', 250, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 03:10:14', 0);
INSERT INTO `sys_log` VALUES (65, 'ROLE', '角色分页列表', '/api/v1/roles/page', '192.168.244.1', '0', '内网IP', 159, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 03:10:19', 0);
INSERT INTO `sys_log` VALUES (66, 'MENU', '菜单列表', '/api/v1/menus', '192.168.244.1', '0', '内网IP', 80, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 03:10:21', 0);
INSERT INTO `sys_log` VALUES (67, 'USER', '用户分页列表', '/api/v1/users/page', '192.168.244.1', '0', '内网IP', 22211, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 03:10:25', 0);
INSERT INTO `sys_log` VALUES (68, 'ROLE', '角色分页列表', '/api/v1/roles/page', '192.168.244.1', '0', '内网IP', 207, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 03:11:05', 0);
INSERT INTO `sys_log` VALUES (69, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 20543, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 03:28:05', 0);
INSERT INTO `sys_log` VALUES (70, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 65, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 03:28:26', 0);
INSERT INTO `sys_log` VALUES (71, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 303, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 03:29:52', 0);
INSERT INTO `sys_log` VALUES (72, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 60, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 03:30:54', 0);
INSERT INTO `sys_log` VALUES (73, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 20020, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 03:31:38', 0);
INSERT INTO `sys_log` VALUES (74, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 166, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 03:31:46', 0);
INSERT INTO `sys_log` VALUES (75, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_user/preview', '192.168.244.1', '0', '内网IP', 255, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 03:31:54', 0);
INSERT INTO `sys_log` VALUES (76, 'OTHER', '生成代码', '/api/v1/codegen/tb_user/config', '192.168.244.1', '0', '内网IP', 2023, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 03:32:47', 0);
INSERT INTO `sys_log` VALUES (77, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_user/preview', '192.168.244.1', '0', '内网IP', 222, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 03:32:48', 0);
INSERT INTO `sys_log` VALUES (78, 'OTHER', '下载代码', '/api/v1/codegen/tb_user/download', '192.168.244.1', '0', '内网IP', 181, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 03:33:30', 0);
INSERT INTO `sys_log` VALUES (79, 'ROLE', '角色分页列表', '/api/v1/roles/page', '192.168.244.1', '0', '内网IP', 123, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 03:33:35', 0);
INSERT INTO `sys_log` VALUES (80, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_user/preview', '192.168.244.1', '0', '内网IP', 239, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 03:39:55', 0);
INSERT INTO `sys_log` VALUES (81, 'OTHER', '生成代码', '/api/v1/codegen/tb_user/config', '192.168.244.1', '0', '内网IP', 22014, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 03:40:06', 0);
INSERT INTO `sys_log` VALUES (82, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_user/preview', '192.168.244.1', '0', '内网IP', 220, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 03:40:08', 0);
INSERT INTO `sys_log` VALUES (83, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 20376, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 05:26:27', 0);
INSERT INTO `sys_log` VALUES (84, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 1222, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 05:26:27', 0);
INSERT INTO `sys_log` VALUES (85, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 1042, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 06:46:27', 0);
INSERT INTO `sys_log` VALUES (86, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 187, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 06:46:28', 0);
INSERT INTO `sys_log` VALUES (87, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 361, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 08:07:34', 0);
INSERT INTO `sys_log` VALUES (88, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 72, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 08:08:30', 0);
INSERT INTO `sys_log` VALUES (89, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 263, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 08:08:36', 0);
INSERT INTO `sys_log` VALUES (90, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 95, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 08:08:42', 0);
INSERT INTO `sys_log` VALUES (91, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 257, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 08:09:53', 0);
INSERT INTO `sys_log` VALUES (92, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 566, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 08:54:51', 0);
INSERT INTO `sys_log` VALUES (93, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 573, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 08:55:49', 0);
INSERT INTO `sys_log` VALUES (94, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 77, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 09:01:22', 0);
INSERT INTO `sys_log` VALUES (95, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 1203, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 09:11:42', 0);
INSERT INTO `sys_log` VALUES (96, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 20435, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 09:11:42', 0);
INSERT INTO `sys_log` VALUES (97, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 65, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 09:21:44', 0);
INSERT INTO `sys_log` VALUES (98, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 491, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 09:25:30', 0);
INSERT INTO `sys_log` VALUES (99, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 106, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 09:31:29', 0);
INSERT INTO `sys_log` VALUES (100, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 708, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2000, '2024-10-23 09:42:11', 0);
INSERT INTO `sys_log` VALUES (101, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 101, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2000, '2024-10-23 09:43:32', 0);
INSERT INTO `sys_log` VALUES (102, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 574, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2001, '2024-10-23 10:12:33', 0);
INSERT INTO `sys_log` VALUES (103, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 234, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2001, '2024-10-23 10:12:50', 0);
INSERT INTO `sys_log` VALUES (104, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 529, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2001, '2024-10-23 10:14:49', 0);
INSERT INTO `sys_log` VALUES (105, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 302, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2001, '2024-10-23 10:15:21', 0);
INSERT INTO `sys_log` VALUES (106, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 512, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2001, '2024-10-23 10:17:45', 0);
INSERT INTO `sys_log` VALUES (107, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 202, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2001, '2024-10-23 10:17:53', 0);
INSERT INTO `sys_log` VALUES (108, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 365, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 10:19:03', 0);
INSERT INTO `sys_log` VALUES (109, 'ROLE', '角色分页列表', '/api/v1/roles/page', '192.168.244.1', '0', '内网IP', 150, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 10:19:14', 0);
INSERT INTO `sys_log` VALUES (110, 'ROLE', '角色分页列表', '/api/v1/roles/page', '192.168.244.1', '0', '内网IP', 203, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 10:19:18', 0);
INSERT INTO `sys_log` VALUES (111, 'ROLE', '角色分页列表', '/api/v1/roles/page', '192.168.244.1', '0', '内网IP', 184, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 10:19:21', 0);
INSERT INTO `sys_log` VALUES (112, 'USER', '用户分页列表', '/api/v1/users/page', '192.168.244.1', '0', '内网IP', 161, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 10:19:24', 0);
INSERT INTO `sys_log` VALUES (113, 'ROLE', '角色分页列表', '/api/v1/roles/page', '192.168.244.1', '0', '内网IP', 261, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 10:19:37', 0);
INSERT INTO `sys_log` VALUES (114, 'ROLE', '角色分页列表', '/api/v1/roles/page', '192.168.244.1', '0', '内网IP', 139, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 10:19:40', 0);
INSERT INTO `sys_log` VALUES (115, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 455, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 10:20:36', 0);
INSERT INTO `sys_log` VALUES (116, 'ROLE', '角色分页列表', '/api/v1/roles/page', '192.168.244.1', '0', '内网IP', 131, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 10:21:58', 0);
INSERT INTO `sys_log` VALUES (117, 'ROLE', '角色分页列表', '/api/v1/roles/page', '192.168.244.1', '0', '内网IP', 185, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 10:22:00', 0);
INSERT INTO `sys_log` VALUES (118, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 276, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2001, '2024-10-23 10:24:29', 0);
INSERT INTO `sys_log` VALUES (119, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 256, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2001, '2024-10-23 10:24:35', 0);
INSERT INTO `sys_log` VALUES (120, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 216, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2001, '2024-10-23 10:25:08', 0);
INSERT INTO `sys_log` VALUES (121, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 861, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2001, '2024-10-23 10:25:41', 0);
INSERT INTO `sys_log` VALUES (122, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 223, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2001, '2024-10-23 10:26:33', 0);
INSERT INTO `sys_log` VALUES (123, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 826, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2002, '2024-10-23 10:28:14', 0);
INSERT INTO `sys_log` VALUES (124, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 99, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2002, '2024-10-23 10:47:10', 0);
INSERT INTO `sys_log` VALUES (125, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 538, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2006, '2024-10-23 10:54:43', 0);
INSERT INTO `sys_log` VALUES (126, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 232, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2006, '2024-10-23 10:55:23', 0);
INSERT INTO `sys_log` VALUES (127, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 284, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2006, '2024-10-23 10:56:52', 0);
INSERT INTO `sys_log` VALUES (128, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 225, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2006, '2024-10-23 10:57:24', 0);
INSERT INTO `sys_log` VALUES (129, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 570, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2007, '2024-10-23 11:03:46', 0);
INSERT INTO `sys_log` VALUES (130, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 295, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2007, '2024-10-23 11:05:12', 0);
INSERT INTO `sys_log` VALUES (131, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 212, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2007, '2024-10-23 11:05:22', 0);
INSERT INTO `sys_log` VALUES (132, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 606, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2008, '2024-10-23 11:07:31', 0);
INSERT INTO `sys_log` VALUES (133, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 524, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2009, '2024-10-23 11:09:37', 0);
INSERT INTO `sys_log` VALUES (134, 'ROLE', '角色分页列表', '/api/v1/roles/page', '192.168.244.1', '0', '内网IP', 129, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 11:17:57', 0);
INSERT INTO `sys_log` VALUES (135, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 395, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2012, '2024-10-23 11:55:41', 0);
INSERT INTO `sys_log` VALUES (136, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 396, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2015, '2024-10-23 12:06:00', 0);
INSERT INTO `sys_log` VALUES (137, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 206, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 14:21:34', 0);
INSERT INTO `sys_log` VALUES (138, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 182, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 14:24:17', 0);
INSERT INTO `sys_log` VALUES (139, 'ROLE', '角色分页列表', '/api/v1/roles/page', '192.168.244.1', '0', '内网IP', 18, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 14:24:18', 0);
INSERT INTO `sys_log` VALUES (140, 'USER', '用户分页列表', '/api/v1/users/page', '192.168.244.1', '0', '内网IP', 23, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 14:24:23', 0);
INSERT INTO `sys_log` VALUES (141, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 25, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 14:24:30', 0);
INSERT INTO `sys_log` VALUES (142, 'OTHER', '生成代码', '/api/v1/codegen/tb_aigc_records/config', '192.168.244.1', '0', '内网IP', 232, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 14:27:17', 0);
INSERT INTO `sys_log` VALUES (143, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_aigc_records/preview', '192.168.244.1', '0', '内网IP', 209, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 14:27:17', 0);
INSERT INTO `sys_log` VALUES (144, 'OTHER', '下载代码', '/api/v1/codegen/tb_aigc_records/download', '192.168.244.1', '0', '内网IP', 75, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 14:27:21', 0);
INSERT INTO `sys_log` VALUES (145, 'OTHER', '生成代码', '/api/v1/codegen/tb_aigc_oeder/config', '192.168.244.1', '0', '内网IP', 46, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 14:28:42', 0);
INSERT INTO `sys_log` VALUES (146, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_aigc_oeder/preview', '192.168.244.1', '0', '内网IP', 134, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 14:28:42', 0);
INSERT INTO `sys_log` VALUES (147, 'OTHER', '下载代码', '/api/v1/codegen/tb_aigc_oeder/download', '192.168.244.1', '0', '内网IP', 71, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 14:28:44', 0);
INSERT INTO `sys_log` VALUES (148, 'OTHER', '生成代码', '/api/v1/codegen/tb_ai_order/config', '192.168.244.1', '0', '内网IP', 192, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 14:30:17', 0);
INSERT INTO `sys_log` VALUES (149, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_ai_order/preview', '192.168.244.1', '0', '内网IP', 64, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 14:30:18', 0);
INSERT INTO `sys_log` VALUES (150, 'OTHER', '下载代码', '/api/v1/codegen/tb_ai_order/download', '192.168.244.1', '0', '内网IP', 69, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 14:30:21', 0);
INSERT INTO `sys_log` VALUES (151, 'OTHER', '下载代码', '/api/v1/codegen/tb_ai_order/download', '192.168.244.1', '0', '内网IP', 341, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 15:21:18', 0);
INSERT INTO `sys_log` VALUES (152, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_aigc_oeder/preview', '192.168.244.1', '0', '内网IP', 176, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 15:21:28', 0);
INSERT INTO `sys_log` VALUES (153, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_aigc_records/preview', '192.168.244.1', '0', '内网IP', 133, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 15:21:40', 0);
INSERT INTO `sys_log` VALUES (154, 'OTHER', '下载代码', '/api/v1/codegen/tb_aigc_records/download', '192.168.244.1', '0', '内网IP', 200, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 15:21:43', 0);
INSERT INTO `sys_log` VALUES (155, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 416, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 15:33:37', 0);
INSERT INTO `sys_log` VALUES (156, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_aigc_records/preview', '192.168.244.1', '0', '内网IP', 120, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 15:51:39', 0);
INSERT INTO `sys_log` VALUES (157, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 26, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 15:51:58', 0);
INSERT INTO `sys_log` VALUES (158, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 12, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 15:52:05', 0);
INSERT INTO `sys_log` VALUES (159, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 11, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:04:20', 0);
INSERT INTO `sys_log` VALUES (160, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_aigc_oeder/preview', '192.168.244.1', '0', '内网IP', 179, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:04:31', 0);
INSERT INTO `sys_log` VALUES (161, 'OTHER', '生成代码', '/api/v1/codegen/tb_aigc_oeder/config', '192.168.244.1', '0', '内网IP', 193, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:06:03', 0);
INSERT INTO `sys_log` VALUES (162, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_aigc_oeder/preview', '192.168.244.1', '0', '内网IP', 157, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:06:03', 0);
INSERT INTO `sys_log` VALUES (163, 'OTHER', '下载代码', '/api/v1/codegen/tb_aigc_oeder/download', '192.168.244.1', '0', '内网IP', 155, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:06:08', 0);
INSERT INTO `sys_log` VALUES (164, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 15, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:13:02', 0);
INSERT INTO `sys_log` VALUES (165, 'OTHER', '生成代码', '/api/v1/codegen/tb_aigc_order/config', '192.168.244.1', '0', '内网IP', 163, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:13:32', 0);
INSERT INTO `sys_log` VALUES (166, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_aigc_order/preview', '192.168.244.1', '0', '内网IP', 88, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:13:32', 0);
INSERT INTO `sys_log` VALUES (167, 'OTHER', '下载代码', '/api/v1/codegen/tb_aigc_order/download', '192.168.244.1', '0', '内网IP', 79, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:13:38', 0);
INSERT INTO `sys_log` VALUES (168, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 14, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:43:24', 0);
INSERT INTO `sys_log` VALUES (169, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 182, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:43:29', 0);
INSERT INTO `sys_log` VALUES (170, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 84, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:43:39', 0);
INSERT INTO `sys_log` VALUES (171, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 0, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:44:02', 0);
INSERT INTO `sys_log` VALUES (172, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 83, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:44:07', 0);
INSERT INTO `sys_log` VALUES (173, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 0, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:45:22', 0);
INSERT INTO `sys_log` VALUES (174, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 83, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:45:34', 0);
INSERT INTO `sys_log` VALUES (175, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 1, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:51:59', 0);
INSERT INTO `sys_log` VALUES (176, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 83, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:52:11', 0);
INSERT INTO `sys_log` VALUES (177, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 0, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:55:04', 0);
INSERT INTO `sys_log` VALUES (178, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 83, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:55:11', 0);
INSERT INTO `sys_log` VALUES (179, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 0, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:56:37', 0);
INSERT INTO `sys_log` VALUES (180, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 80, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 16:56:43', 0);
INSERT INTO `sys_log` VALUES (181, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 1, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 17:03:37', 0);
INSERT INTO `sys_log` VALUES (182, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 82, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 17:03:53', 0);
INSERT INTO `sys_log` VALUES (183, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 0, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 17:04:36', 0);
INSERT INTO `sys_log` VALUES (184, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 81, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 17:04:40', 0);
INSERT INTO `sys_log` VALUES (185, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 81, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 17:05:04', 0);
INSERT INTO `sys_log` VALUES (186, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 1, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 17:06:17', 0);
INSERT INTO `sys_log` VALUES (187, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 83, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 17:06:23', 0);
INSERT INTO `sys_log` VALUES (188, 'LOGIN', '注销', '/api/v1/auth/logout', '192.168.244.1', '0', '内网IP', 1, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 17:29:51', 0);
INSERT INTO `sys_log` VALUES (189, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 85, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 17:29:58', 0);
INSERT INTO `sys_log` VALUES (190, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 174, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 18:14:48', 0);
INSERT INTO `sys_log` VALUES (191, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 87, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 18:15:00', 0);
INSERT INTO `sys_log` VALUES (192, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 242, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 18:17:49', 0);
INSERT INTO `sys_log` VALUES (193, 'ROLE', '角色分页列表', '/api/v1/roles/page', '192.168.244.1', '0', '内网IP', 55, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 18:17:50', 0);
INSERT INTO `sys_log` VALUES (194, 'ROLE', '角色分页列表', '/api/v1/roles/page', '192.168.244.1', '0', '内网IP', 10, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 18:18:09', 0);
INSERT INTO `sys_log` VALUES (195, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 84, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 18:18:18', 0);
INSERT INTO `sys_log` VALUES (196, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 250, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 20:08:05', 0);
INSERT INTO `sys_log` VALUES (197, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 12, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 20:10:40', 0);
INSERT INTO `sys_log` VALUES (198, 'OTHER', '生成代码', '/api/v1/codegen/tb_ai_order/config', '192.168.244.1', '0', '内网IP', 83, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 20:12:27', 0);
INSERT INTO `sys_log` VALUES (199, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_ai_order/preview', '192.168.244.1', '0', '内网IP', 308, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 20:12:27', 0);
INSERT INTO `sys_log` VALUES (200, 'OTHER', '下载代码', '/api/v1/codegen/tb_ai_order/download', '192.168.244.1', '0', '内网IP', 169, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 20:12:31', 0);
INSERT INTO `sys_log` VALUES (201, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 211, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 20:22:42', 0);
INSERT INTO `sys_log` VALUES (202, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 99, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 20:23:37', 0);
INSERT INTO `sys_log` VALUES (203, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 120, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 20:29:52', 0);
INSERT INTO `sys_log` VALUES (204, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 37, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 20:29:53', 0);
INSERT INTO `sys_log` VALUES (205, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_ai_order/preview', '192.168.244.1', '0', '内网IP', 240, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 20:29:59', 0);
INSERT INTO `sys_log` VALUES (206, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 23, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 20:45:34', 0);
INSERT INTO `sys_log` VALUES (207, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 13, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 20:45:36', 0);
INSERT INTO `sys_log` VALUES (208, 'OTHER', '生成代码', '/api/v1/codegen/tb_ai_order/config', '192.168.244.1', '0', '内网IP', 56, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 20:46:32', 0);
INSERT INTO `sys_log` VALUES (209, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_ai_order/preview', '192.168.244.1', '0', '内网IP', 271, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 20:46:33', 0);
INSERT INTO `sys_log` VALUES (210, 'OTHER', '下载代码', '/api/v1/codegen/tb_ai_order/download', '192.168.244.1', '0', '内网IP', 119, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 20:46:35', 0);
INSERT INTO `sys_log` VALUES (211, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_ai_order/preview', '192.168.244.1', '0', '内网IP', 131, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 21:07:54', 0);
INSERT INTO `sys_log` VALUES (212, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 15, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 21:09:05', 0);
INSERT INTO `sys_log` VALUES (213, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_ai_order/preview', '192.168.244.1', '0', '内网IP', 114, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 21:09:08', 0);
INSERT INTO `sys_log` VALUES (214, 'OTHER', '生成代码', '/api/v1/codegen/tb_ai_order/config', '192.168.244.1', '0', '内网IP', 115, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 21:09:20', 0);
INSERT INTO `sys_log` VALUES (215, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_ai_order/preview', '192.168.244.1', '0', '内网IP', 84, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 21:09:20', 0);
INSERT INTO `sys_log` VALUES (216, 'OTHER', '下载代码', '/api/v1/codegen/tb_ai_order/download', '192.168.244.1', '0', '内网IP', 77, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 21:09:55', 0);
INSERT INTO `sys_log` VALUES (217, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 184, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 22:24:20', 0);
INSERT INTO `sys_log` VALUES (218, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 249, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 23:09:44', 0);
INSERT INTO `sys_log` VALUES (219, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 54, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 23:09:45', 0);
INSERT INTO `sys_log` VALUES (220, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_ai_order/preview', '192.168.244.1', '0', '内网IP', 189, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-23 23:10:05', 0);
INSERT INTO `sys_log` VALUES (221, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 193, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-24 00:32:03', 0);
INSERT INTO `sys_log` VALUES (222, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 446, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-24 09:06:13', 0);
INSERT INTO `sys_log` VALUES (223, 'LOGIN', '登录', '/api/v1/auth/login', '192.168.244.1', '0', '内网IP', 179, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-24 09:37:23', 0);
INSERT INTO `sys_log` VALUES (224, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 27, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-24 09:37:24', 0);
INSERT INTO `sys_log` VALUES (225, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 9, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-24 09:37:28', 0);
INSERT INTO `sys_log` VALUES (226, 'OTHER', '代码生成分页列表', '/api/v1/codegen/table/page', '192.168.244.1', '0', '内网IP', 11, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-24 09:37:36', 0);
INSERT INTO `sys_log` VALUES (227, 'OTHER', '生成代码', '/api/v1/codegen/tb_ai_order/config', '192.168.244.1', '0', '内网IP', 44, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-24 09:38:05', 0);
INSERT INTO `sys_log` VALUES (228, 'OTHER', '预览生成代码', '/api/v1/codegen/tb_ai_order/preview', '192.168.244.1', '0', '内网IP', 216, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-24 09:38:06', 0);
INSERT INTO `sys_log` VALUES (229, 'OTHER', '下载代码', '/api/v1/codegen/tb_ai_order/download', '192.168.244.1', '0', '内网IP', 120, 'Chrome', '129.0.0.0', 'Windows 10 or Windows Server 2016', 2, '2024-10-24 09:38:09', 0);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` bigint NOT NULL COMMENT '父菜单ID',
  `tree_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父节点ID路径',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `type` tinyint NOT NULL COMMENT '菜单类型（1-菜单 2-目录 3-外链 4-按钮）',
  `route_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由名称（Vue Router 中用于命名路由）',
  `route_path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由路径（Vue Router 中定义的 URL 路径）',
  `component` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径（组件页面完整路径，相对于 src/views/，缺省后缀 .vue）',
  `perm` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '【按钮】权限标识',
  `always_show` tinyint NULL DEFAULT 0 COMMENT '【目录】只有一个子路由是否始终显示（1-是 0-否）',
  `keep_alive` tinyint NULL DEFAULT 0 COMMENT '【菜单】是否开启页面缓存（1-是 0-否）',
  `visible` tinyint(1) NOT NULL DEFAULT 1 COMMENT '显示状态（1-显示 0-隐藏）',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单图标',
  `redirect` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '跳转路径',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `params` json NULL COMMENT '路由参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 144 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '0', '系统管理', 2, '', '/system', 'Layout', NULL, NULL, NULL, 1, 1, 'system', '/system/user', '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (2, 1, '0,1', '用户管理', 1, 'User', 'user', 'system/user/index', NULL, NULL, 1, 1, 1, 'el-icon-User', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (3, 1, '0,1', '角色管理', 1, 'Role', 'role', 'system/role/index', NULL, NULL, 1, 1, 2, 'role', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (4, 1, '0,1', '菜单管理', 1, 'Menu', 'menu', 'system/menu/index', NULL, NULL, 1, 1, 3, 'menu', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (5, 1, '0,1', '部门管理', 1, 'Dept', 'dept', 'system/dept/index', NULL, NULL, 1, 1, 4, 'tree', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (6, 1, '0,1', '字典管理', 1, 'Dict', 'dict', 'system/dict/index', NULL, NULL, 1, 1, 5, 'dict', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (20, 0, '0', '多级菜单', 2, NULL, '/multi-level', 'Layout', NULL, 1, NULL, 1, 9, 'cascader', '', '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (21, 20, '0,20', '菜单一级', 1, NULL, 'multi-level1', 'demo/multi-level/level1', NULL, 1, NULL, 1, 1, '', '', '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (22, 21, '0,20,21', '菜单二级', 1, NULL, 'multi-level2', 'demo/multi-level/children/level2', NULL, 0, NULL, 1, 1, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (23, 22, '0,20,21,22', '菜单三级-1', 1, NULL, 'multi-level3-1', 'demo/multi-level/children/children/level3-1', NULL, 0, 1, 1, 1, '', '', '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (24, 22, '0,20,21,22', '菜单三级-2', 1, NULL, 'multi-level3-2', 'demo/multi-level/children/children/level3-2', NULL, 0, 1, 1, 2, '', '', '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (26, 0, '0', '平台文档', 2, NULL, '/doc', 'Layout', NULL, NULL, NULL, 1, 8, 'document', 'https://juejin.cn/post/7228990409909108793', '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (30, 26, '0,26', '平台文档(外链)', 3, NULL, 'https://juejin.cn/post/7228990409909108793', '', NULL, NULL, NULL, 1, 2, 'link', '', '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (31, 2, '0,1,2', '用户新增', 4, NULL, '', NULL, 'sys:user:add', NULL, NULL, 1, 1, '', '', '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (32, 2, '0,1,2', '用户编辑', 4, NULL, '', NULL, 'sys:user:edit', NULL, NULL, 1, 2, '', '', '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (33, 2, '0,1,2', '用户删除', 4, NULL, '', NULL, 'sys:user:delete', NULL, NULL, 1, 3, '', '', '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (36, 0, '0', '组件封装', 2, NULL, '/component', 'Layout', NULL, NULL, NULL, 1, 10, 'menu', '', '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (37, 36, '0,36', '富文本编辑器', 1, NULL, 'wang-editor', 'demo/wang-editor', NULL, NULL, 1, 1, 2, '', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (38, 36, '0,36', '图片上传', 1, NULL, 'upload', 'demo/upload', NULL, NULL, 1, 1, 3, '', '', '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (39, 36, '0,36', '图标选择器', 1, NULL, 'icon-selector', 'demo/icon-selector', NULL, NULL, 1, 1, 4, '', '', '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (40, 0, '0', '接口文档', 2, NULL, '/api', 'Layout', NULL, 1, NULL, 1, 7, 'api', '', '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (41, 40, '0,40', 'Apifox', 1, NULL, 'apifox', 'demo/api/apifox', NULL, NULL, 1, 1, 1, 'api', '', '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (70, 3, '0,1,3', '角色新增', 4, NULL, '', NULL, 'sys:role:add', NULL, NULL, 1, 1, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (71, 3, '0,1,3', '角色编辑', 4, NULL, '', NULL, 'sys:role:edit', NULL, NULL, 1, 2, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (72, 3, '0,1,3', '角色删除', 4, NULL, '', NULL, 'sys:role:delete', NULL, NULL, 1, 3, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (73, 4, '0,1,4', '菜单新增', 4, NULL, '', NULL, 'sys:menu:add', NULL, NULL, 1, 1, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (74, 4, '0,1,4', '菜单编辑', 4, NULL, '', NULL, 'sys:menu:edit', NULL, NULL, 1, 3, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (75, 4, '0,1,4', '菜单删除', 4, NULL, '', NULL, 'sys:menu:delete', NULL, NULL, 1, 3, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (76, 5, '0,1,5', '部门新增', 4, NULL, '', NULL, 'sys:dept:add', NULL, NULL, 1, 1, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (77, 5, '0,1,5', '部门编辑', 4, NULL, '', NULL, 'sys:dept:edit', NULL, NULL, 1, 2, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (78, 5, '0,1,5', '部门删除', 4, NULL, '', NULL, 'sys:dept:delete', NULL, NULL, 1, 3, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (79, 6, '0,1,6', '字典新增', 4, NULL, '', NULL, 'sys:dict:add', NULL, NULL, 1, 1, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (81, 6, '0,1,6', '字典编辑', 4, NULL, '', NULL, 'sys:dict:edit', NULL, NULL, 1, 2, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (84, 6, '0,1,6', '字典删除', 4, NULL, '', NULL, 'sys:dict:delete', NULL, NULL, 1, 3, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (88, 2, '0,1,2', '重置密码', 4, NULL, '', NULL, 'sys:user:password:reset', NULL, NULL, 1, 4, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (89, 0, '0', '功能演示', 2, NULL, '/function', 'Layout', NULL, NULL, NULL, 1, 12, 'menu', '', '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (90, 89, '0,89', 'Websocket', 1, NULL, '/function/websocket', 'demo/websocket', NULL, NULL, 1, 1, 3, '', '', '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (91, 89, '0,89', '敬请期待...', 2, NULL, 'other/:id', 'demo/other', NULL, NULL, NULL, 1, 4, '', '', '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (95, 36, '0,36', '字典组件', 1, NULL, 'dict-demo', 'demo/dict', NULL, NULL, 1, 1, 4, '', '', '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (97, 89, '0,89', 'Icons', 1, NULL, 'icon-demo', 'demo/icons', NULL, NULL, 1, 1, 2, 'el-icon-Notification', '', '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (102, 26, '0,26', '平台文档(内嵌)', 3, NULL, 'internal-doc', 'demo/internal-doc', NULL, NULL, NULL, 1, 1, 'document', '', '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (105, 2, '0,1,2', '用户查询', 4, NULL, '', NULL, 'sys:user:query', 0, 0, 1, 0, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (106, 2, '0,1,2', '用户导入', 4, NULL, '', NULL, 'sys:user:import', NULL, NULL, 1, 5, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (107, 2, '0,1,2', '用户导出', 4, NULL, '', NULL, 'sys:user:export', NULL, NULL, 1, 6, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (108, 36, '0,36', '增删改查', 1, NULL, 'curd', 'demo/curd/index', NULL, NULL, 1, 1, 0, '', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (109, 36, '0,36', '列表选择器', 1, NULL, 'table-select', 'demo/table-select/index', NULL, NULL, 1, 1, 1, '', '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (110, 0, '0', '路由参数', 2, NULL, '/route-param', 'Layout', NULL, 1, 1, 1, 11, 'el-icon-ElementPlus', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (111, 110, '0,110', '参数(type=1)', 1, NULL, 'route-param-type1', 'demo/route-param', NULL, 0, 1, 1, 1, 'el-icon-Star', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', '{\"type\": \"1\"}');
INSERT INTO `sys_menu` VALUES (112, 110, '0,110', '参数(type=2)', 1, NULL, 'route-param-type2', 'demo/route-param', NULL, 0, 1, 1, 2, 'el-icon-StarFilled', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', '{\"type\": \"2\"}');
INSERT INTO `sys_menu` VALUES (117, 1, '0,1', '系统日志', 1, 'Log', 'log', 'system/log/index', NULL, 0, 1, 1, 6, 'document', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (118, 0, '0', '系统工具', 2, NULL, '/codegen', 'Layout', NULL, 0, 1, 1, 2, 'menu', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (119, 118, '0,118', '代码生成', 1, 'Codegen', 'codegen', 'codegen/index', NULL, 0, 1, 1, 1, 'code', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (120, 1, '0,1', '系统配置', 1, 'Config', 'config', 'system/config/index', NULL, 0, 1, 1, 7, 'setting', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (121, 120, '0,1,120', '查询系统配置', 4, NULL, '', NULL, 'sys:config:query', 0, 1, 1, 1, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (122, 120, '0,1,120', '新增系统配置', 4, NULL, '', NULL, 'sys:config:add', 0, 1, 1, 2, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (123, 120, '0,1,120', '修改系统配置', 4, NULL, '', NULL, 'sys:config:update', 0, 1, 1, 3, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (124, 120, '0,1,120', '删除系统配置', 4, NULL, '', NULL, 'sys:config:delete', 0, 1, 1, 4, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (125, 120, '0,1,120', '刷新系统配置', 4, NULL, '', NULL, 'sys:config:refresh', 0, 1, 1, 5, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (126, 1, '0,1', '通知公告', 1, 'Notice', 'notice', 'system/notice/index', NULL, NULL, NULL, 1, 9, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (127, 126, '0,1,126', '查询', 4, NULL, '', NULL, 'sys:notice:query', NULL, NULL, 1, 1, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (128, 126, '0,1,126', '新增', 4, NULL, '', NULL, 'sys:notice:add', NULL, NULL, 1, 2, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (129, 126, '0,1,126', '编辑', 4, NULL, '', NULL, 'sys:notice:edit', NULL, NULL, 1, 3, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (130, 126, '0,1,126', '删除', 4, NULL, '', NULL, 'sys:notice:delete', NULL, NULL, 1, 4, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (133, 126, '0,1,126', '发布', 4, NULL, '', NULL, 'sys:notice:publish', 0, 1, 1, 5, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (134, 126, '0,1,126', '撤回', 4, NULL, '', NULL, 'sys:notice:revoke', 0, 1, 1, 6, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (135, 1, '0,1', '字典数据', 1, 'DictData', 'dict-data', 'system/dict/data', NULL, 0, 1, 0, 6, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (136, 135, '0,1,135', '字典数据新增', 4, NULL, '', NULL, 'sys:dict-data:add', NULL, NULL, 1, 4, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (137, 135, '0,1,135', '字典数据编辑', 4, NULL, '', NULL, 'sys:dict-data:edit', NULL, NULL, 1, 5, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (138, 135, '0,1,135', '字典数据删除', 4, NULL, '', NULL, 'sys:dict-data:delete', NULL, NULL, 1, 6, '', NULL, '2024-10-15 03:47:30', '2024-10-15 03:47:30', NULL);
INSERT INTO `sys_menu` VALUES (139, 1, '0,1', '普通用户，存储用户的基本信息和父子级关系', 1, 'TbUser', 'tb-user', 'system/tb-user/index', NULL, 0, 0, 1, 10, '', NULL, '2024-10-23 02:39:43', '2024-10-23 02:39:43', NULL);
INSERT INTO `sys_menu` VALUES (140, 139, '0,1,140', '查询', 4, NULL, '', NULL, NULL, 0, 0, 1, 1, '', NULL, '2024-10-23 02:39:44', '2024-10-23 02:39:44', NULL);
INSERT INTO `sys_menu` VALUES (141, 139, '0,1,141', '新增', 4, NULL, '', NULL, NULL, 0, 0, 1, 2, '', NULL, '2024-10-23 02:39:44', '2024-10-23 02:39:44', NULL);
INSERT INTO `sys_menu` VALUES (142, 139, '0,1,142', '编辑', 4, NULL, '', NULL, NULL, 0, 0, 1, 3, '', NULL, '2024-10-23 02:39:44', '2024-10-23 02:39:44', NULL);
INSERT INTO `sys_menu` VALUES (143, 139, '0,1,143', '删除', 4, NULL, '', NULL, NULL, 0, 0, 1, 4, '', NULL, '2024-10-23 02:39:46', '2024-10-23 02:39:46', NULL);
INSERT INTO `sys_menu` VALUES (144, 20, '0,20', '订单', 1, 'AigcRecords', 'aigc-records', 'system/aigc-records/index', NULL, 0, 0, 1, 2, '', NULL, '2024-10-23 14:27:17', '2024-10-23 14:27:17', NULL);
INSERT INTO `sys_menu` VALUES (145, 144, '0,20,145', '查询', 4, NULL, '', NULL, 'system:aigcRecords:query', 0, 0, 1, 1, '', NULL, '2024-10-23 14:27:17', '2024-10-23 14:27:17', NULL);
INSERT INTO `sys_menu` VALUES (146, 144, '0,20,146', '新增', 4, NULL, '', NULL, 'system:aigcRecords:add', 0, 0, 1, 2, '', NULL, '2024-10-23 14:27:17', '2024-10-23 14:27:17', NULL);
INSERT INTO `sys_menu` VALUES (147, 144, '0,20,147', '编辑', 4, NULL, '', NULL, 'system:aigcRecords:edit', 0, 0, 1, 3, '', NULL, '2024-10-23 14:27:17', '2024-10-23 14:27:17', NULL);
INSERT INTO `sys_menu` VALUES (148, 144, '0,20,148', '删除', 4, NULL, '', NULL, 'system:aigcRecords:delete', 0, 0, 1, 4, '', NULL, '2024-10-23 14:27:17', '2024-10-23 14:27:17', NULL);
INSERT INTO `sys_menu` VALUES (149, 20, '0,20', '订单提交记录', 1, 'AiOrder', 'ai-order', 'system/ai-order/index', NULL, 0, 0, 1, 3, '', NULL, '2024-10-23 14:30:17', '2024-10-23 14:30:17', NULL);
INSERT INTO `sys_menu` VALUES (150, 149, '0,20,150', '查询', 4, NULL, '', NULL, 'system:aiOrder:query', 0, 0, 1, 1, '', NULL, '2024-10-23 14:30:17', '2024-10-23 14:30:17', NULL);
INSERT INTO `sys_menu` VALUES (151, 149, '0,20,151', '新增', 4, NULL, '', NULL, 'system:aiOrder:add', 0, 0, 1, 2, '', NULL, '2024-10-23 14:30:17', '2024-10-23 14:30:17', NULL);
INSERT INTO `sys_menu` VALUES (152, 149, '0,20,152', '编辑', 4, NULL, '', NULL, 'system:aiOrder:edit', 0, 0, 1, 3, '', NULL, '2024-10-23 14:30:17', '2024-10-23 14:30:17', NULL);
INSERT INTO `sys_menu` VALUES (153, 149, '0,20,153', '删除', 4, NULL, '', NULL, 'system:aiOrder:delete', 0, 0, 1, 4, '', NULL, '2024-10-23 14:30:17', '2024-10-23 14:30:17', NULL);
INSERT INTO `sys_menu` VALUES (154, 20, '0,20', 'aigc文件上传记录', 1, 'AigcOrder', 'aigc-order', 'system/aigc-order/index', NULL, 0, 0, 1, 4, '', NULL, '2024-10-23 16:13:32', '2024-10-23 16:13:32', NULL);
INSERT INTO `sys_menu` VALUES (155, 154, '0,20,155', '查询', 4, NULL, '', NULL, 'system:aigcOrder:query', 0, 0, 1, 1, '', NULL, '2024-10-23 16:13:32', '2024-10-23 16:13:32', NULL);
INSERT INTO `sys_menu` VALUES (156, 154, '0,20,156', '新增', 4, NULL, '', NULL, 'system:aigcOrder:add', 0, 0, 1, 2, '', NULL, '2024-10-23 16:13:32', '2024-10-23 16:13:32', NULL);
INSERT INTO `sys_menu` VALUES (157, 154, '0,20,157', '编辑', 4, NULL, '', NULL, 'system:aigcOrder:edit', 0, 0, 1, 3, '', NULL, '2024-10-23 16:13:32', '2024-10-23 16:13:32', NULL);
INSERT INTO `sys_menu` VALUES (158, 154, '0,20,158', '删除', 4, NULL, '', NULL, 'system:aigcOrder:delete', 0, 0, 1, 4, '', NULL, '2024-10-23 16:13:32', '2024-10-23 16:13:32', NULL);

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除标识(1-已删除 0-未删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统消息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_message
-- ----------------------------

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '通知标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '通知内容',
  `type` tinyint NOT NULL COMMENT '通知类型（字典code：notice_type）',
  `level` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通知等级（字典code：notice_level）',
  `target_type` tinyint NOT NULL COMMENT '目标类型（1: 全体, 2: 指定）',
  `target_user_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '目标人ID集合（多个使用英文逗号,分割）',
  `publisher_id` bigint NULL DEFAULT NULL COMMENT '发布人ID',
  `publish_status` tinyint NOT NULL DEFAULT 0 COMMENT '发布状态（0: 未发布, 1: 已发布, -1: 已撤回）',
  `publish_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `revoke_time` datetime NULL DEFAULT NULL COMMENT '撤回时间',
  `create_by` bigint NOT NULL COMMENT '创建人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除（0: 未删除, 1: 已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色编码',
  `sort` int NULL DEFAULT NULL COMMENT '显示顺序',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '角色状态(1-正常 0-停用)',
  `data_scope` tinyint NULL DEFAULT NULL COMMENT '数据权限(0-所有数据 1-部门及子部门数据 2-本部门数据3-本人数据)',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人 ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识(0-未删除 1-已删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name` ASC) USING BTREE COMMENT '角色名称唯一索引',
  UNIQUE INDEX `uk_code`(`code` ASC) USING BTREE COMMENT '角色编码唯一索引'
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'ROOT', 1, 1, 0, NULL, '2021-05-21 14:56:51', NULL, '2018-12-23 16:00:00', 0);
INSERT INTO `sys_role` VALUES (2, '系统管理员', 'ADMIN', 2, 1, 1, NULL, '2021-03-25 12:39:54', NULL, NULL, 0);
INSERT INTO `sys_role` VALUES (3, '访问游客', 'GUEST', 3, 1, 2, NULL, '2021-05-26 15:49:05', NULL, '2019-05-05 16:00:00', 0);
INSERT INTO `sys_role` VALUES (4, '系统管理员1', 'ADMIN1', 4, 1, 1, NULL, '2021-03-25 12:39:54', NULL, NULL, 0);
INSERT INTO `sys_role` VALUES (5, '系统管理员2', 'ADMIN2', 5, 1, 1, NULL, '2021-03-25 12:39:54', NULL, NULL, 0);
INSERT INTO `sys_role` VALUES (6, '系统管理员3', 'ADMIN3', 6, 1, 1, NULL, '2021-03-25 12:39:54', NULL, NULL, 0);
INSERT INTO `sys_role` VALUES (7, '系统管理员4', 'ADMIN4', 7, 1, 1, NULL, '2021-03-25 12:39:54', NULL, NULL, 0);
INSERT INTO `sys_role` VALUES (8, '系统管理员5', 'ADMIN5', 8, 1, 1, NULL, '2021-03-25 12:39:54', NULL, NULL, 0);
INSERT INTO `sys_role` VALUES (9, '系统管理员6', 'ADMIN6', 9, 1, 1, NULL, '2021-03-25 12:39:54', NULL, NULL, 0);
INSERT INTO `sys_role` VALUES (10, '系统管理员7', 'ADMIN7', 10, 1, 1, NULL, '2021-03-25 12:39:54', NULL, NULL, 0);
INSERT INTO `sys_role` VALUES (11, '系统管理员8', 'ADMIN8', 11, 1, 1, NULL, '2021-03-25 12:39:54', NULL, NULL, 0);
INSERT INTO `sys_role` VALUES (12, '系统管理员9', 'ADMIN9', 12, 1, 1, NULL, '2021-03-25 12:39:54', NULL, NULL, 0);
INSERT INTO `sys_role` VALUES (13, 'admin1111', '2001', 1, 1, 0, NULL, '2024-10-23 10:21:57', NULL, '2024-10-23 10:21:57', 0);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  UNIQUE INDEX `uk_roleid_menuid`(`role_id` ASC, `menu_id` ASC) USING BTREE COMMENT '角色菜单唯一索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 5);
INSERT INTO `sys_role_menu` VALUES (2, 6);
INSERT INTO `sys_role_menu` VALUES (2, 20);
INSERT INTO `sys_role_menu` VALUES (2, 21);
INSERT INTO `sys_role_menu` VALUES (2, 22);
INSERT INTO `sys_role_menu` VALUES (2, 23);
INSERT INTO `sys_role_menu` VALUES (2, 24);
INSERT INTO `sys_role_menu` VALUES (2, 26);
INSERT INTO `sys_role_menu` VALUES (2, 30);
INSERT INTO `sys_role_menu` VALUES (2, 31);
INSERT INTO `sys_role_menu` VALUES (2, 32);
INSERT INTO `sys_role_menu` VALUES (2, 33);
INSERT INTO `sys_role_menu` VALUES (2, 36);
INSERT INTO `sys_role_menu` VALUES (2, 37);
INSERT INTO `sys_role_menu` VALUES (2, 38);
INSERT INTO `sys_role_menu` VALUES (2, 39);
INSERT INTO `sys_role_menu` VALUES (2, 40);
INSERT INTO `sys_role_menu` VALUES (2, 41);
INSERT INTO `sys_role_menu` VALUES (2, 70);
INSERT INTO `sys_role_menu` VALUES (2, 71);
INSERT INTO `sys_role_menu` VALUES (2, 72);
INSERT INTO `sys_role_menu` VALUES (2, 73);
INSERT INTO `sys_role_menu` VALUES (2, 74);
INSERT INTO `sys_role_menu` VALUES (2, 75);
INSERT INTO `sys_role_menu` VALUES (2, 76);
INSERT INTO `sys_role_menu` VALUES (2, 77);
INSERT INTO `sys_role_menu` VALUES (2, 78);
INSERT INTO `sys_role_menu` VALUES (2, 79);
INSERT INTO `sys_role_menu` VALUES (2, 81);
INSERT INTO `sys_role_menu` VALUES (2, 84);
INSERT INTO `sys_role_menu` VALUES (2, 88);
INSERT INTO `sys_role_menu` VALUES (2, 89);
INSERT INTO `sys_role_menu` VALUES (2, 90);
INSERT INTO `sys_role_menu` VALUES (2, 91);
INSERT INTO `sys_role_menu` VALUES (2, 95);
INSERT INTO `sys_role_menu` VALUES (2, 97);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 118);
INSERT INTO `sys_role_menu` VALUES (2, 119);
INSERT INTO `sys_role_menu` VALUES (2, 120);
INSERT INTO `sys_role_menu` VALUES (2, 121);
INSERT INTO `sys_role_menu` VALUES (2, 122);
INSERT INTO `sys_role_menu` VALUES (2, 123);
INSERT INTO `sys_role_menu` VALUES (2, 124);
INSERT INTO `sys_role_menu` VALUES (2, 125);
INSERT INTO `sys_role_menu` VALUES (2, 126);
INSERT INTO `sys_role_menu` VALUES (2, 127);
INSERT INTO `sys_role_menu` VALUES (2, 128);
INSERT INTO `sys_role_menu` VALUES (2, 129);
INSERT INTO `sys_role_menu` VALUES (2, 130);
INSERT INTO `sys_role_menu` VALUES (2, 133);
INSERT INTO `sys_role_menu` VALUES (2, 134);
INSERT INTO `sys_role_menu` VALUES (2, 135);
INSERT INTO `sys_role_menu` VALUES (2, 136);
INSERT INTO `sys_role_menu` VALUES (2, 137);
INSERT INTO `sys_role_menu` VALUES (2, 138);
INSERT INTO `sys_role_menu` VALUES (2, 139);
INSERT INTO `sys_role_menu` VALUES (2, 140);
INSERT INTO `sys_role_menu` VALUES (2, 141);
INSERT INTO `sys_role_menu` VALUES (2, 142);
INSERT INTO `sys_role_menu` VALUES (2, 143);
INSERT INTO `sys_role_menu` VALUES (2, 144);
INSERT INTO `sys_role_menu` VALUES (2, 145);
INSERT INTO `sys_role_menu` VALUES (2, 146);
INSERT INTO `sys_role_menu` VALUES (2, 147);
INSERT INTO `sys_role_menu` VALUES (2, 148);
INSERT INTO `sys_role_menu` VALUES (2, 149);
INSERT INTO `sys_role_menu` VALUES (2, 150);
INSERT INTO `sys_role_menu` VALUES (2, 151);
INSERT INTO `sys_role_menu` VALUES (2, 152);
INSERT INTO `sys_role_menu` VALUES (2, 153);
INSERT INTO `sys_role_menu` VALUES (2, 154);
INSERT INTO `sys_role_menu` VALUES (2, 155);
INSERT INTO `sys_role_menu` VALUES (2, 156);
INSERT INTO `sys_role_menu` VALUES (2, 157);
INSERT INTO `sys_role_menu` VALUES (2, 158);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `gender` tinyint(1) NULL DEFAULT 1 COMMENT '性别((1-男 2-女 0-保密)',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `dept_id` int NULL DEFAULT NULL COMMENT '部门ID',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户头像',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态((1-正常 0-禁用)',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人ID',
  `is_deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除标识(0-未删除 1-已删除)',
  `balance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '用户余额',
  `parent_id` int NULL DEFAULT NULL COMMENT '父级用户ID，用于管理用户层级关系',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_name`(`username` ASC) USING BTREE,
  INDEX `fk_parent_id`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2011 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'root', '有来技术', 0, '$2a$10$xVWsNOhHrCxh5UbpCE7/HuJ.PAOKcYAqRxD2CO2nVnJS.IAXkr5aq', NULL, 'https://foruda.gitee.com/images/1723603502796844527/03cdca2a_716974.gif', '18866668888', 1, 'youlaitech@163.com', NULL, NULL, NULL, NULL, 0, 0.00, NULL);
INSERT INTO `sys_user` VALUES (2, 'admin', '系统管理员', 1, '$2a$10$xVWsNOhHrCxh5UbpCE7/HuJ.PAOKcYAqRxD2CO2nVnJS.IAXkr5aq', 1, 'https://foruda.gitee.com/images/1723603502796844527/03cdca2a_716974.gif', '18866668887', 1, '', '2019-10-10 13:41:22', NULL, '2022-07-31 12:39:30', NULL, 0, 10000.00, NULL);
INSERT INTO `sys_user` VALUES (3, 'websocket', '测试小用户', 1, '$2a$10$xVWsNOhHrCxh5UbpCE7/HuJ.PAOKcYAqRxD2CO2nVnJS.IAXkr5aq', 3, 'https://foruda.gitee.com/images/1723603502796844527/03cdca2a_716974.gif', '18866668886', 1, 'youlaitech@163.com', '2021-06-05 01:31:29', NULL, '2021-06-05 01:31:29', NULL, 0, 0.00, NULL);
INSERT INTO `sys_user` VALUES (2015, 'test', NULL, 1, '$2a$10$4.Xg6YQ8TForUDpJMMiv7uhkAsOX1AjGHVXmMzOGBSonAEE3C5Tqu', 3, '', NULL, 1, NULL, '2024-10-23 12:05:29', NULL, '2024-10-23 12:05:29', NULL, 0, 0.00, NULL);

-- ----------------------------
-- Table structure for sys_user_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_notice`;
CREATE TABLE `sys_user_notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `notice_id` bigint NOT NULL COMMENT '公共通知id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `is_read` bigint NOT NULL DEFAULT 0 COMMENT '读取状态（0未读；1已读）',
  `read_time` datetime NULL DEFAULT NULL COMMENT '阅读时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除(1-已删除；0-未删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  UNIQUE INDEX `uk_userid_roleid`(`user_id` ASC, `role_id` ASC) USING BTREE COMMENT '用户角色唯一索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 3);
INSERT INTO `sys_user_role` VALUES (2015, 3);

-- ----------------------------
-- Table structure for tb_ai_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_ai_order`;
CREATE TABLE `tb_ai_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单记录唯一标识',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '论文标题',
  `major` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '论文所属专业',
  `word_count` int NULL DEFAULT NULL COMMENT '论文字数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '订单提交记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_ai_order
-- ----------------------------

-- ----------------------------
-- Table structure for tb_aigc_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_aigc_order`;
CREATE TABLE `tb_aigc_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `file_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `file_size` bigint NULL DEFAULT NULL COMMENT '文件大小（以字节为单位）',
  `upload_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  `total_word_count` int NULL DEFAULT NULL COMMENT '总字数',
  `ai_generated_word_count` int NULL DEFAULT NULL COMMENT 'AI生成字数',
  `ai_percentage` decimal(5, 2) NULL DEFAULT NULL COMMENT 'AI生成比例（例如：75.00）',
  `human_percentage` decimal(5, 2) NULL DEFAULT NULL COMMENT '人工写作比例（例如：25.00）',
  `human_written_word_count` int NULL DEFAULT NULL COMMENT '人工写作字数',
  `analysis` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '分析结果',
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '其他信息',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'aigc文件上传记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_aigc_order
-- ----------------------------
INSERT INTO `tb_aigc_order` VALUES (1, NULL, '2.docx', NULL, '2024-10-23 18:07:44', 17856, 7142, 40.00, 60.00, 10714, '无详细分析', '内容大部分为人工手写', '2024-10-23 18:07:44', '2024-10-23 18:07:44');
INSERT INTO `tb_aigc_order` VALUES (2, NULL, '2.docx', NULL, '2024-10-23 18:21:25', 17856, 7142, 40.00, 60.00, 10714, '无详细分析', '内容大部分为人工手写', '2024-10-23 18:21:25', '2024-10-23 18:21:25');
INSERT INTO `tb_aigc_order` VALUES (3, NULL, '4d723773-0d58-46e5-b7fd-222c5663ddde.doc', 36352, '2024-10-23 23:25:54', 36106, 14442, 40.00, 60.00, 21664, '无详细分析', '内容大部分为人工手写', '2024-10-23 23:25:54', '2024-10-23 23:25:54');
INSERT INTO `tb_aigc_order` VALUES (4, NULL, '广告营销策划在数字化时代的应用研究 (5).docx', NULL, '2024-10-24 00:15:23', 8900, 3560, 40.00, 60.00, 5340, '无详细分析', '内容大部分为人工手写', '2024-10-24 00:15:23', '2024-10-24 00:15:23');

-- ----------------------------
-- Table structure for tb_aigc_records
-- ----------------------------
DROP TABLE IF EXISTS `tb_aigc_records`;
CREATE TABLE `tb_aigc_records`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，自增ID',
  `order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号',
  `payment_status` tinyint NOT NULL COMMENT '支付状态（0：未支付，1：已支付）',
  `payment_amount` decimal(10, 2) NOT NULL COMMENT '支付金额',
  `user_id` int NOT NULL COMMENT '用户ID',
  `created_time` datetime NOT NULL COMMENT '订单创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '订单最后修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_aigc_records
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名，必须唯一',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '加密后的用户密码',
  `balance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '用户账户余额',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父用户ID，表示父子级关系',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '用户更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `uq_username`(`username` ASC) USING BTREE COMMENT '用户名唯一约束'
) ENGINE = InnoDB AUTO_INCREMENT = 2008 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '普通用户表，存储用户的基本信息和父子级关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'admin', '123456', 0.00, NULL, '2024-10-23 05:11:49', '2024-10-23 05:11:49');
INSERT INTO `tb_user` VALUES (2012, 'test', '123456', 0.00, NULL, '2024-10-23 12:05:29', '2024-10-23 12:05:29');

SET FOREIGN_KEY_CHECKS = 1;
