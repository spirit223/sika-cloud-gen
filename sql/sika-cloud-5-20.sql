/*
 Navicat Premium Data Transfer

 Source Server         : MySQL8
 Source Server Type    : MySQL
 Source Server Version : 80026 (8.0.26)
 Source Host           : localhost:3306
 Source Schema         : sika-cloud

 Target Server Type    : MySQL
 Target Server Version : 80026 (8.0.26)
 File Encoding         : 65001

 Date: 21/05/2023 01:46:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (4, 'task_submit', '提交记录表', NULL, NULL, 'TaskSubmit', 'crud', 'com.sika.task', 'task', 'submit', '提交记录', '小吴来哩', '0', '/', '{\"parentMenuId\":\"\"}', 'admin', '2023-05-15 10:24:12', '', '2023-05-15 11:20:13', NULL);
INSERT INTO `gen_table` VALUES (5, 'task_task', '任务表', NULL, NULL, 'TaskTask', 'crud', 'com.sika.task', 'task', 'task', '教学任务', '小吴来哩', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-05-15 10:24:12', '', '2023-05-15 11:14:21', NULL);
INSERT INTO `gen_table` VALUES (6, 'submit_record', '提交记录', NULL, NULL, 'SubmitRecord', 'crud', 'com.sika.task', 'task', 'record', '提交记录', '小吴来哩', '0', '/', '{\"parentMenuId\":2038}', 'admin', '2023-05-15 16:13:19', '', '2023-05-15 16:14:23', NULL);
INSERT INTO `gen_table` VALUES (7, 'task_correction', '任务批改表', NULL, NULL, 'TaskCorrection', 'crud', 'com.sika.task', 'task', 'correction', '任务批改', '小吴来哩', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2023-05-15 21:14:19', '', '2023-05-15 21:21:54', NULL);
INSERT INTO `gen_table` VALUES (8, 'media_video', '视频资源表', NULL, NULL, 'MediaVideo', 'crud', 'com.sika.media', 'media', 'video', '视频资源', '小吴来哩', '0', '/', '{\"parentMenuId\":\"2050\"}', 'admin', '2023-05-16 13:01:49', '', '2023-05-16 13:05:19', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (24, '4', 'id', '提交id', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-05-15 10:24:12', '', '2023-05-15 11:20:13');
INSERT INTO `gen_table_column` VALUES (25, '4', 'user_id', '提交用户', 'bigint', 'Long', 'userId', '0', '0', NULL, '1', '1', '0', '1', 'EQ', 'input', '', 2, 'admin', '2023-05-15 10:24:12', '', '2023-05-15 11:20:13');
INSERT INTO `gen_table_column` VALUES (26, '4', 'submit_content', '提交内容', 'text', 'String', 'submitContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 3, 'admin', '2023-05-15 10:24:12', '', '2023-05-15 11:20:13');
INSERT INTO `gen_table_column` VALUES (27, '4', 'task_id', '任务id', 'bigint', 'Long', 'taskId', '0', '0', NULL, '1', '0', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-05-15 10:24:12', '', '2023-05-15 11:20:13');
INSERT INTO `gen_table_column` VALUES (28, '4', 'correct_result', '批改结果', 'tinyint', 'Long', 'correctResult', '0', '0', NULL, '1', '0', '0', '1', 'EQ', 'radio', 'task_correct', 5, 'admin', '2023-05-15 10:24:12', '', '2023-05-15 11:20:14');
INSERT INTO `gen_table_column` VALUES (29, '4', 'correct_remark', '批改备注', 'text', 'String', 'correctRemark', '0', '0', NULL, '1', '0', '0', '0', 'EQ', 'textarea', '', 6, 'admin', '2023-05-15 10:24:12', '', '2023-05-15 11:20:14');
INSERT INTO `gen_table_column` VALUES (30, '5', 'id', '任务id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-05-15 10:24:12', '', '2023-05-15 11:14:21');
INSERT INTO `gen_table_column` VALUES (31, '5', 'task_content', '任务内容', 'text', 'String', 'taskContent', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'editor', '', 2, 'admin', '2023-05-15 10:24:13', '', '2023-05-15 11:14:21');
INSERT INTO `gen_table_column` VALUES (32, '5', 'task_answer', '任务答案', 'text', 'String', 'taskAnswer', '0', '0', NULL, '1', '1', '0', '0', 'EQ', 'editor', '', 3, 'admin', '2023-05-15 10:24:13', '', '2023-05-15 11:14:21');
INSERT INTO `gen_table_column` VALUES (33, '5', 'task_dept', '从属部门', 'bigint', 'Long', 'taskDept', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_dept', 4, 'admin', '2023-05-15 10:24:13', '', '2023-05-15 11:14:21');
INSERT INTO `gen_table_column` VALUES (34, '5', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-05-15 10:24:13', '', '2023-05-15 11:14:22');
INSERT INTO `gen_table_column` VALUES (35, '5', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', '1', 'BETWEEN', 'datetime', '', 6, 'admin', '2023-05-15 10:24:13', '', '2023-05-15 11:14:22');
INSERT INTO `gen_table_column` VALUES (36, '5', 'update_by', '更新人', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '0', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2023-05-15 10:24:13', '', '2023-05-15 11:14:22');
INSERT INTO `gen_table_column` VALUES (37, '5', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '0', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2023-05-15 10:24:13', '', '2023-05-15 11:14:22');
INSERT INTO `gen_table_column` VALUES (38, '5', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 9, 'admin', '2023-05-15 10:24:13', '', '2023-05-15 11:14:22');
INSERT INTO `gen_table_column` VALUES (39, '6', 'id', '任务id', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-05-15 16:13:19', '', '2023-05-15 16:14:23');
INSERT INTO `gen_table_column` VALUES (40, '6', 'task_content', '任务内容', 'text', 'String', 'taskContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 2, 'admin', '2023-05-15 16:13:19', '', '2023-05-15 16:14:23');
INSERT INTO `gen_table_column` VALUES (41, '6', 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'input', '', 3, 'admin', '2023-05-15 16:13:19', '', '2023-05-15 16:14:23');
INSERT INTO `gen_table_column` VALUES (42, '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', '1', 'BETWEEN', 'datetime', '', 4, 'admin', '2023-05-15 16:13:19', '', '2023-05-15 16:14:23');
INSERT INTO `gen_table_column` VALUES (43, '7', 'id', '批改id', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-05-15 21:14:19', '', '2023-05-15 21:21:54');
INSERT INTO `gen_table_column` VALUES (44, '7', 'task_id', '任务id', 'bigint', 'Long', 'taskId', '0', '0', NULL, '1', '0', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-05-15 21:14:19', '', '2023-05-15 21:21:54');
INSERT INTO `gen_table_column` VALUES (45, '7', 'task_content', '任务内容', 'text', 'String', 'taskContent', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'editor', '', 3, 'admin', '2023-05-15 21:14:19', '', '2023-05-15 21:21:54');
INSERT INTO `gen_table_column` VALUES (46, '7', 'submit_id', '提交id', 'bigint', 'Long', 'submitId', '0', '0', NULL, '0', '0', '0', '1', 'EQ', 'input', '', 5, 'admin', '2023-05-15 21:14:19', '', '2023-05-15 21:21:54');
INSERT INTO `gen_table_column` VALUES (47, '7', 'submit_user', '提交用户', 'varchar(255)', 'String', 'submitUser', '0', '0', NULL, '0', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-05-15 21:14:19', '', '2023-05-15 21:21:54');
INSERT INTO `gen_table_column` VALUES (48, '7', 'submit_content', '提交内容', 'text', 'String', 'submitContent', '0', '0', NULL, '0', '1', '1', '1', 'EQ', 'textarea', '', 7, 'admin', '2023-05-15 21:14:19', '', '2023-05-15 21:21:54');
INSERT INTO `gen_table_column` VALUES (49, '7', 'correct_result', '批改结果', 'tinyint', 'Long', 'correctResult', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'task_correct', 8, 'admin', '2023-05-15 21:14:19', '', '2023-05-15 21:21:54');
INSERT INTO `gen_table_column` VALUES (50, '7', 'create_by', '批改人', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-05-15 21:14:19', '', '2023-05-15 21:21:54');
INSERT INTO `gen_table_column` VALUES (51, '7', 'create_time', '批改时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', '1', 'BETWEEN', 'datetime', '', 10, 'admin', '2023-05-15 21:14:19', '', '2023-05-15 21:21:54');
INSERT INTO `gen_table_column` VALUES (52, '7', 'update_by', '更新人', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2023-05-15 21:14:19', '', '2023-05-15 21:21:54');
INSERT INTO `gen_table_column` VALUES (53, '7', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'BETWEEN', 'datetime', '', 12, 'admin', '2023-05-15 21:14:19', '', '2023-05-15 21:21:54');
INSERT INTO `gen_table_column` VALUES (54, '7', 'remark', '批改备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 13, 'admin', '2023-05-15 21:14:19', '', '2023-05-15 21:21:54');
INSERT INTO `gen_table_column` VALUES (55, '7', 'task_dept', '任务从属部门', 'bigint', 'Long', 'taskDept', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'sys_dept', 4, '', '2023-05-15 21:16:52', '', '2023-05-15 21:21:54');
INSERT INTO `gen_table_column` VALUES (56, '8', 'id', '视频id', 'bigint', 'Long', 'id', '1', '0', NULL, '1', NULL, '1', '1', 'EQ', 'input', '', 1, 'admin', '2023-05-16 13:01:49', '', '2023-05-16 13:05:19');
INSERT INTO `gen_table_column` VALUES (57, '8', 'video_name', '视频标题', 'varchar(255)', 'String', 'videoName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-05-16 13:01:49', '', '2023-05-16 13:05:19');
INSERT INTO `gen_table_column` VALUES (58, '8', 'video_source_id', '云端视频id', 'varchar(100)', 'String', 'videoSourceId', '0', '0', NULL, '1', '0', '0', '0', 'EQ', 'input', '', 3, 'admin', '2023-05-16 13:01:49', '', '2023-05-16 13:05:19');
INSERT INTO `gen_table_column` VALUES (59, '8', 'video_original_name', '原始文件名', 'varchar(100)', 'String', 'videoOriginalName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2023-05-16 13:01:50', '', '2023-05-16 13:05:19');
INSERT INTO `gen_table_column` VALUES (60, '8', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-05-16 13:01:50', '', '2023-05-16 13:05:19');
INSERT INTO `gen_table_column` VALUES (61, '8', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', '1', 'BETWEEN', 'datetime', '', 6, 'admin', '2023-05-16 13:01:50', '', '2023-05-16 13:05:19');
INSERT INTO `gen_table_column` VALUES (62, '8', 'update_by', '更新人', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2023-05-16 13:01:50', '', '2023-05-16 13:05:19');
INSERT INTO `gen_table_column` VALUES (63, '8', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2023-05-16 13:01:50', '', '2023-05-16 13:05:19');
INSERT INTO `gen_table_column` VALUES (64, '8', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 9, 'admin', '2023-05-16 13:01:50', '', '2023-05-16 13:05:19');

-- ----------------------------
-- Table structure for media_video
-- ----------------------------
DROP TABLE IF EXISTS `media_video`;
CREATE TABLE `media_video`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频id',
  `video_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '视频标题',
  `video_source_id` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '云端视频id',
  `video_original_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原始文件名',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频资源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of media_video
-- ----------------------------
INSERT INTO `media_video` VALUES ('03869ba0f4d871ed9fae0764b3ec0102', '绿皮书', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/27662d19-1882ac01a36/27662d19-1882ac01a36.mp4?Expires=1684607868&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=Gh00SS4AkW9%2B8oP%2FXdgy7tS3Q8E%3D', '绿皮书', NULL, '2023-05-18 01:26:52', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('1db84750f39b71ed80810764a0ec0102', '8', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/22548e1f-18822a34820/22548e1f-18822a34820.mp4?Expires=1684607870&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=CH9T3pwHHw7H4g7M%2Fy23G263HWY%3D', '8.mp4', NULL, '2023-05-16 11:38:26', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('236e1210f39b71ed80b80764b3ec0102', '9', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/51ad0e17-18822a36d8c/51ad0e17-18822a36d8c.mp4?Expires=1684607870&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=%2Bp55k2JXbAsqUseOWSQ1hcVXa9w%3D', '9.mp4', NULL, '2023-05-16 11:38:35', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('30694840f39b71ed806f0764a3fd0102', '10', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/1e590689-18822a3c295/1e590689-18822a3c295.mp4?Expires=1684607870&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=paEGtXgtFXaM2WjGgYs%2FIzx88FY%3D', '10.mp4', NULL, '2023-05-16 11:38:57', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('330cc9f0f39b71ed80e80764a0fd0102', '11', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/56d28754-18822a3d3e3/56d28754-18822a3d3e3.mp4?Expires=1684607870&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=eURj4dB2IyplGakAsHYCDqHkh5Y%3D', '11.mp4', NULL, '2023-05-16 11:39:02', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('41c71540f39b71ed80857035d0b20102', '14', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/7db2067-18822a4346a/7db2067-18822a4346a.mp4?Expires=1684607870&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=ewn3Ni56ZOFmS3A6Ac6YgUUOWrY%3D', '14.mp4', NULL, '2023-05-16 11:39:26', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('4ebc3440f48871ed80936733a68f0102', '甘肃省开展十项行动推进青年就业创业', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/36773bb6-18828b5bd54/36773bb6-18828b5bd54.mp4?Expires=1684607869&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=ZH9OkxIMp%2BKZ497Sd%2F%2FVElAXfd0%3D', '甘肃省开展十项行动推进青年就业创业.mp4', NULL, '2023-05-17 15:56:19', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('71099130f48a71ed8af86732b68e0102', '生命之美：延时摄影 席克氏彩草仙人球花开瞬间', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/3bfd0fef-18828c3b977/3bfd0fef-18828c3b977.mp4?Expires=1684607869&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=u0xjRdrBA%2B2VVMy3DJCbJMawh%2F4%3D', '生命之美：延时摄影 席克氏彩草仙人球花开瞬间.mp4', NULL, '2023-05-17 16:11:35', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('710a0660f48a71ed80780764a3fc0102', '陕西汉中：虞美人盛开分外娇', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/2648c76d-18828c3b984/2648c76d-18828c3b984.mp4?Expires=1684607869&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=NEpT9Fc4lCvXQE41NKNYN0qx4w4%3D', '陕西汉中：虞美人盛开分外娇.mp4', NULL, '2023-05-17 16:11:35', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('710d61c0f48a71ed80520764a3fd0102', '“抱怨没有用 一切靠自己” 拄拐前行的外卖小哥加油！', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/2621ec38-18828c3b9bd/2621ec38-18828c3b9bd.mp4?Expires=1684607869&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=68%2FKSL44ehHivZWPiu9lfhZ99yE%3D', '“抱怨没有用 一切靠自己” 拄拐前行的外卖小哥加油！.mp4', NULL, '2023-05-17 16:11:35', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('710e2510f48a71ed95010674a2ce0102', '消防员用一杯奶茶救下轻生女孩。姑娘，一定要好好爱自己！', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/caea9ff-18828c3b9b0/caea9ff-18828c3b9b0.mp4?Expires=1684607869&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=Nh9Pnfor1KUm5J%2FbEDBPPgZLsoM%3D', '消防员用一杯奶茶救下轻生女孩。姑娘，一定要好好爱自己！.mp4', NULL, '2023-05-17 16:11:35', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('71174cd0f48a71ed80520764a3fd0102', '早上6点多，刚下夜班的两位小伙，不经意的一瞥，救了一条命！', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/11a0f5eb-18828c3b9d6/11a0f5eb-18828c3b9d6.mp4?Expires=1684607869&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=Zhj3%2B5KPiZ%2BG7DfDq7eKUaaD9NE%3D', '早上6点多，刚下夜班的两位小伙，不经意的一瞥，救了一条命！.mp4', NULL, '2023-05-17 16:11:35', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('734d66b0f48a71ed80170675b3ed0102', '0：55习近平考察潮州古城：爱这个城市，就要呵护好她、建设好她', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/275f317-18828c3c875/275f317-18828c3c875.mp4?Expires=1684607869&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=4NqCVX9xLfY1%2FK7iArVERBSrHBg%3D', '0：55习近平考察潮州古城：爱这个城市，就要呵护好她、建设好她.mp4', NULL, '2023-05-17 16:11:39', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('735a5f00f48a71ed9da60764b3ec0102', '1：15穿越时空的铭记', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/5dd67039-18828c3c8b2/5dd67039-18828c3c8b2.mp4?Expires=1684607869&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=DoqWr6D4PhtyHLXqxGEcay1aYE0%3D', '1：15穿越时空的铭记.mp4', NULL, '2023-05-17 16:11:39', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('736de700f48a71eda1f76723b78e0102', '1：42广东潮州工夫茶：小杯细品浓浓人情味', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/2c76c291-18828c3c92d/2c76c291-18828c3c92d.mp4?Expires=1684607869&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=TrJIEO2qpfCCEgMoXY07p0tOA90%3D', '1：42广东潮州工夫茶：小杯细品浓浓人情味.mp4', NULL, '2023-05-17 16:11:39', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('737dc580f48a71edaba06723a78f0102', '3：46走遍大湾区-从制造到智造 不一样的东莞', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/5c15b99e-18828c3c983/5c15b99e-18828c3c983.mp4?Expires=1684607869&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=iIHBBHxn1y3Auq5Jd9AcYPhuMEM%3D', '3：46走遍大湾区-从制造到智造 不一样的东莞.mp4', NULL, '2023-05-17 16:11:39', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('73d9a120f48a71ed80520764a3fd0102', '5：11红色影像：杭州市革命烈士纪念馆', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/18164c89-18828c3cbfb/18164c89-18828c3cbfb.mp4?Expires=1684607868&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=K%2F2HxleVxJWHkkEudy8Y%2FkAgfpk%3D', '5：11红色影像：杭州市革命烈士纪念馆.mp4', NULL, '2023-05-17 16:11:40', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('79dc0540f48a71ed94b90764a0fd0102', '报告！我不是一个人 我们是一群人！', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/4ec82075-18828c3f36c/4ec82075-18828c3f36c.mp4?Expires=1684607868&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=c7eJNm%2B1BD6bteAYVUA74NKGkgM%3D', '报告！我不是一个人 我们是一群人！.mp4', NULL, '2023-05-17 16:11:50', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('7a00cb50f48a71ed80597035d0b20102', '福建三明尤溪：桂峰夜景醉游人', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/f4fe781-18828c3f445/f4fe781-18828c3f445.mp4?Expires=1684607868&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=w8aDe6yDrUF%2BLJEl127qnJM20vY%3D', '福建三明尤溪：桂峰夜景醉游人.mp4', NULL, '2023-05-17 16:11:50', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('7a3ff730f48a71ed8d136632b68f0102', '陌生人的默契善意！俩公交司机同时为老人停车挡车流', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/4527524c-18828c3f5ee/4527524c-18828c3f5ee.mp4?Expires=1684607868&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=2wVb1%2B7W%2B%2F91xkOhRXfXcBb9e44%3D', '陌生人的默契善意！俩公交司机同时为老人停车挡车流.mp4', NULL, '2023-05-17 16:11:51', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('7dcd63b0f48a71edbb376633b79f0102', '那年今日｜致敬“最纯真最高尚的爱情”！', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/3bc3f82c-18828c40d3a/3bc3f82c-18828c40d3a.mp4?Expires=1684607868&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=IsV%2FQpGKq175bgApLCkPvyDrj%2Bs%3D', '那年今日｜致敬“最纯真最高尚的爱情”！.mp4', NULL, '2023-05-17 16:11:57', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('a2a947b0f62171edbff36733a68f0102', '02-认识微服务-服务架构演变', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/20af3e5c-18833304f72/20af3e5c-18833304f72.mp4?Expires=1684607868&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=NO66PXzXXe9p%2BVBHzgLw%2BS3cyMU%3D', '02-认识微服务-服务架构演变', NULL, '2023-05-19 16:46:24', NULL, NULL, NULL);
INSERT INTO `media_video` VALUES ('a7474430f38c71ed973b0675a0ec0102', '第15集', 'https://outin-2254ff3df38c11eda2be00163e06123c.oss-cn-shanghai.aliyuncs.com/sv/a62c9d3-18822447f95/a62c9d3-18822447f95.mp4?Expires=1684607870&OSSAccessKeyId=LTAIVVfYx6D0HeL2&Signature=4j0saNqBu040wn7gqqCbIDNeUjQ%3D', '第15集.mp4', NULL, '2023-05-16 09:54:54', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-04-18 01:05:35', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-04-18 01:05:35', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-04-18 01:05:35', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-04-18 01:05:35', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-04-18 01:05:35', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 212 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '广东工商职业技术大学', 0, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-04-18 01:05:27', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '计算机学院', 1, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-04-18 01:05:28', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '艺术学院', 2, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-04-18 01:05:28', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '软件工程', 1, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-04-18 01:05:28', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '网络工程', 2, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-04-18 01:05:28', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '数据科学与大数据', 3, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-04-18 01:05:28', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '人工智能', 4, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-04-18 01:05:28', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '计算机科学与技术', 5, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-04-18 01:05:28', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '舞蹈学', 1, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-04-18 01:05:28', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '服装与服饰设计', 2, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-04-18 01:05:28', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 103, '0,100,101,103', '软件工程1班', 0, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-05-15 11:01:21', '', NULL);
INSERT INTO `sys_dept` VALUES (201, 103, '0,100,101,103', '软件工程2班', 1, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-05-15 11:01:35', '', NULL);
INSERT INTO `sys_dept` VALUES (202, 104, '0,100,101,104', '网络工程1班', 0, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-05-15 11:01:48', '', NULL);
INSERT INTO `sys_dept` VALUES (203, 104, '0,100,101,104', '网络工程2班', 2, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-05-15 11:01:57', '', NULL);
INSERT INTO `sys_dept` VALUES (204, 105, '0,100,101,105', '数据科学与大数据1班', 0, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-05-15 11:02:15', '', NULL);
INSERT INTO `sys_dept` VALUES (205, 105, '0,100,101,105', '数据科学与大数据2班', 1, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-05-15 11:02:25', '', NULL);
INSERT INTO `sys_dept` VALUES (206, 106, '0,100,101,106', '人工智能1班', 0, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-05-15 11:02:39', '', NULL);
INSERT INTO `sys_dept` VALUES (207, 106, '0,100,101,106', '人工智能2班', 1, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-05-15 11:02:50', '', NULL);
INSERT INTO `sys_dept` VALUES (208, 107, '0,100,101,107', '计算机科学与技术1班', 0, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-05-15 11:03:02', '', NULL);
INSERT INTO `sys_dept` VALUES (209, 107, '0,100,101,107', '计算机科学与技术2班', 1, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-05-15 11:03:12', '', NULL);
INSERT INTO `sys_dept` VALUES (210, 108, '0,100,102,108', '舞蹈学1班', 0, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-05-15 11:03:32', '', NULL);
INSERT INTO `sys_dept` VALUES (211, 109, '0,100,102,109', '服装与服装设计1班', 0, '吴畅', '13553727721', '2235569493@qq.com', '0', '0', 'admin', '2023-05-15 11:03:47', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-04-18 01:05:35', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '软件工程1班', '200', 'sys_dept', NULL, 'default', 'N', '0', 'admin', '2023-05-15 11:04:47', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 1, '软件工程2班', '201', 'sys_dept', NULL, 'default', 'N', '0', 'admin', '2023-05-15 11:05:01', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 2, '网络工程1班', '202', 'sys_dept', NULL, 'default', 'N', '0', 'admin', '2023-05-15 11:05:15', 'admin', '2023-05-15 11:05:43', NULL);
INSERT INTO `sys_dict_data` VALUES (103, 3, '网络工程2班', '203', 'sys_dept', NULL, 'default', 'N', '0', 'admin', '2023-05-15 11:05:26', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 4, '数据科学与大数据1班', '204', 'sys_dept', NULL, 'default', 'N', '0', 'admin', '2023-05-15 11:06:07', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 5, '数据科学与大数据2班', '205', 'sys_dept', NULL, 'default', 'N', '0', 'admin', '2023-05-15 11:06:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 6, '人工智能1班', '206', 'sys_dept', NULL, 'default', 'N', '0', 'admin', '2023-05-15 11:06:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 7, '人工智能2班', '207', 'sys_dept', NULL, 'default', 'N', '0', 'admin', '2023-05-15 11:06:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 8, '计算机科学与技术1班', '208', 'sys_dept', NULL, 'default', 'N', '0', 'admin', '2023-05-15 11:07:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 9, '计算机科学与技术2班', '209', 'sys_dept', NULL, 'default', 'N', '0', 'admin', '2023-05-15 11:07:22', 'admin', '2023-05-15 11:07:33', NULL);
INSERT INTO `sys_dict_data` VALUES (110, 10, '舞蹈学1班', '210', 'sys_dept', NULL, 'default', 'N', '0', 'admin', '2023-05-15 11:07:52', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 11, '服装与服装设计1班', '211', 'sys_dept', NULL, 'default', 'N', '0', 'admin', '2023-05-15 11:08:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 0, 'PASS', '1', 'task_correct', NULL, 'success', 'N', '0', 'admin', '2023-05-15 11:17:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 1, 'NO PASS', '0', 'task_correct', NULL, 'danger', 'N', '0', 'admin', '2023-05-15 11:17:35', 'admin', '2023-05-15 11:17:47', NULL);
INSERT INTO `sys_dict_data` VALUES (114, 2, 'TO DO', 'NULL', 'task_correct', NULL, 'primary', 'N', '0', 'admin', '2023-05-15 11:18:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 0, '未提交', 'false', 'task_commit_status', NULL, 'warning', 'N', '0', 'admin', '2023-05-15 16:39:56', 'admin', '2023-05-15 16:40:01', NULL);
INSERT INTO `sys_dict_data` VALUES (116, 1, '已提交', 'true', 'task_commit_status', NULL, 'success', 'N', '0', 'admin', '2023-05-15 16:40:22', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-04-18 01:05:34', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-04-18 01:05:34', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-04-18 01:05:34', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-04-18 01:05:34', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-04-18 01:05:34', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-04-18 01:05:34', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-04-18 01:05:34', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-04-18 01:05:34', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-04-18 01:05:34', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-04-18 01:05:34', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '班级列表', 'sys_dept', '0', 'admin', '2023-05-15 10:25:16', '', NULL, '班级列表');
INSERT INTO `sys_dict_type` VALUES (101, '批改操作', 'task_correct', '0', 'admin', '2023-05-15 11:16:59', '', NULL, '批改操作列表');
INSERT INTO `sys_dict_type` VALUES (102, '提交类型', 'task_commit_status', '0', 'admin', '2023-05-15 16:39:19', 'admin', '2023-05-15 16:39:34', '题目提交类型\n');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-04-18 01:05:37', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-04-18 01:05:37', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-04-18 01:05:37', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`access_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 165 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-18 10:36:10');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '0', '退出成功', '2023-04-18 10:41:57');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-18 13:22:18');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '0', '退出成功', '2023-04-18 13:22:26');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-18 13:22:50');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-18 18:14:05');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-18 20:53:31');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-19 13:35:52');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-21 15:40:47');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-21 18:19:58');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '0', '退出成功', '2023-04-21 23:56:49');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-21 23:56:56');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-22 07:12:44');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-22 08:34:51');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-22 08:38:10');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-22 08:39:57');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-22 08:42:34');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-22 08:51:09');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-22 08:57:18');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-22 09:06:07');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-22 09:30:44');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-22 09:31:53');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-22 09:32:20');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-22 09:33:01');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-22 09:34:53');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-22 09:39:04');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-22 09:39:42');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-22 10:09:09');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '0', '退出成功', '2023-04-22 23:12:20');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-22 23:12:30');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '0', '登录成功', '2023-04-23 21:53:30');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '0', '登录成功', '2023-05-15 10:22:37');
INSERT INTO `sys_logininfor` VALUES (132, 'spirit223', '127.0.0.1', '0', '登录成功', '2023-05-15 15:03:23');
INSERT INTO `sys_logininfor` VALUES (133, 'spirit223', '127.0.0.1', '0', '登录成功', '2023-05-15 18:44:47');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '0', '登录成功', '2023-05-16 07:34:03');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '0', '登录成功', '2023-05-16 13:01:36');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '0', '登录成功', '2023-05-16 18:27:10');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '0', '登录成功', '2023-05-16 19:16:31');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '0', '登录成功', '2023-05-17 10:52:58');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '0', '登录成功', '2023-05-19 16:44:29');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '0', '登录成功', '2023-05-20 17:49:26');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '0', '登录成功', '2023-05-20 21:03:07');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '0', '登录成功', '2023-05-20 21:13:15');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '0', '退出成功', '2023-05-20 21:13:22');
INSERT INTO `sys_logininfor` VALUES (144, 'spitit223', '127.0.0.1', '1', '登录用户不存在', '2023-05-20 21:13:37');
INSERT INTO `sys_logininfor` VALUES (145, 'spirit223', '127.0.0.1', '0', '登录成功', '2023-05-20 21:13:45');
INSERT INTO `sys_logininfor` VALUES (146, 'spirit223', '127.0.0.1', '0', '退出成功', '2023-05-20 21:16:36');
INSERT INTO `sys_logininfor` VALUES (147, 'spirit223', '127.0.0.1', '0', '登录成功', '2023-05-20 21:16:58');
INSERT INTO `sys_logininfor` VALUES (148, 'spirit223', '127.0.0.1', '0', '退出成功', '2023-05-20 21:19:57');
INSERT INTO `sys_logininfor` VALUES (149, 'spirit223', '127.0.0.1', '0', '登录成功', '2023-05-20 21:20:01');
INSERT INTO `sys_logininfor` VALUES (150, 'spirit223', '127.0.0.1', '0', '退出成功', '2023-05-20 21:46:43');
INSERT INTO `sys_logininfor` VALUES (151, 'spirit223', '127.0.0.1', '0', '登录成功', '2023-05-20 21:46:49');
INSERT INTO `sys_logininfor` VALUES (152, 'spirit223', '127.0.0.1', '0', '退出成功', '2023-05-20 21:48:36');
INSERT INTO `sys_logininfor` VALUES (153, 'spirit223', '127.0.0.1', '0', '登录成功', '2023-05-20 21:48:41');
INSERT INTO `sys_logininfor` VALUES (154, 'spirit223', '127.0.0.1', '0', '退出成功', '2023-05-20 21:51:04');
INSERT INTO `sys_logininfor` VALUES (155, 'spirit223', '127.0.0.1', '0', '登录成功', '2023-05-20 21:51:12');
INSERT INTO `sys_logininfor` VALUES (156, 'spirit223', '127.0.0.1', '0', '退出成功', '2023-05-20 21:54:28');
INSERT INTO `sys_logininfor` VALUES (157, 'spirit223', '127.0.0.1', '0', '登录成功', '2023-05-20 21:54:34');
INSERT INTO `sys_logininfor` VALUES (158, 'spirit223', '127.0.0.1', '0', '登录成功', '2023-05-20 21:56:00');
INSERT INTO `sys_logininfor` VALUES (159, 'spirit223', '127.0.0.1', '0', '登录成功', '2023-05-20 21:58:48');
INSERT INTO `sys_logininfor` VALUES (160, 'spirit223', '127.0.0.1', '0', '登录成功', '2023-05-20 22:06:29');
INSERT INTO `sys_logininfor` VALUES (161, 'spirit223', '127.0.0.1', '0', '退出成功', '2023-05-20 22:19:36');
INSERT INTO `sys_logininfor` VALUES (162, 'spirit223', '127.0.0.1', '0', '登录成功', '2023-05-20 22:19:44');
INSERT INTO `sys_logininfor` VALUES (163, 'spirit223', '127.0.0.1', '0', '登录成功', '2023-05-20 22:20:52');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '0', '登录成功', '2023-05-21 01:44:30');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2057 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 2, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-04-18 01:05:30', 'admin', '2023-05-16 14:37:03', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 3, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-04-18 01:05:30', 'admin', '2023-05-16 14:37:06', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 4, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-04-18 01:05:30', 'admin', '2023-05-16 14:37:11', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-04-18 01:05:30', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-04-18 01:05:30', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-04-18 01:05:30', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-04-18 01:05:30', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-04-18 01:05:30', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-04-18 01:05:30', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-04-18 01:05:30', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-04-18 01:05:30', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-04-18 01:05:30', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-04-18 01:05:30', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-04-18 01:05:30', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, 'Sentinel控制台', 2, 3, 'http://localhost:8718', '', '', 0, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', 'admin', '2023-04-18 01:05:30', '', NULL, '流量控制菜单');
INSERT INTO `sys_menu` VALUES (112, 'Nacos控制台', 2, 4, 'http://localhost:8848/nacos', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', 'admin', '2023-04-18 01:05:30', '', NULL, '服务治理菜单');
INSERT INTO `sys_menu` VALUES (113, 'Admin控制台', 2, 5, 'http://localhost:9100/login', '', '', 0, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-04-18 01:05:30', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-04-18 01:05:30', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'http://localhost:8080/swagger-ui/index.html', '', '', 0, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-04-18 01:05:30', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2023-04-18 01:05:30', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2023-04-18 01:05:30', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:unlock', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-04-18 01:05:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '学习管理', 0, 0, 'task', NULL, NULL, 1, 0, 'M', '0', '0', '', 'peoples', 'admin', '2023-04-18 18:38:10', 'admin', '2023-05-15 21:05:30', '');
INSERT INTO `sys_menu` VALUES (2026, '资料管理', 2000, 1, 'data', 'data/data/index', NULL, 1, 0, 'C', '0', '0', 'data:data:list', 'druid', 'admin', '2023-04-21 18:16:00', 'admin', '2023-04-21 18:20:25', '资料菜单');
INSERT INTO `sys_menu` VALUES (2027, '资料查询', 2026, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:data:query', '#', 'admin', '2023-04-21 18:16:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '资料新增', 2026, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:data:add', '#', 'admin', '2023-04-21 18:16:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '资料修改', 2026, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:data:edit', '#', 'admin', '2023-04-21 18:16:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '资料删除', 2026, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:data:remove', '#', 'admin', '2023-04-21 18:16:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '资料导出', 2026, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:data:export', '#', 'admin', '2023-04-21 18:16:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '教学任务', 2000, 1, 'task', 'task/task/index', NULL, 1, 0, 'C', '0', '0', 'task:task:list', 'edit', 'admin', '2023-05-15 11:24:08', 'admin', '2023-05-15 14:33:21', '教学任务菜单');
INSERT INTO `sys_menu` VALUES (2033, '教学任务查询', 2032, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'task:task:query', '#', 'admin', '2023-05-15 11:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '教学任务新增', 2032, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'task:task:add', '#', 'admin', '2023-05-15 11:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '教学任务修改', 2032, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'task:task:edit', '#', 'admin', '2023-05-15 11:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '教学任务删除', 2032, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'task:task:remove', '#', 'admin', '2023-05-15 11:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '教学任务导出', 2032, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'task:task:export', '#', 'admin', '2023-05-15 11:24:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '任务提交', 2000, 1, 'submit', 'task/submit/index', NULL, 1, 0, 'C', '0', '0', 'task:submit:list', 'job', 'admin', '2023-05-15 11:24:13', 'admin', '2023-05-15 21:04:45', '提交记录菜单');
INSERT INTO `sys_menu` VALUES (2039, '提交记录查询', 2038, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'task:submit:query', '#', 'admin', '2023-05-15 11:24:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '提交记录新增', 2038, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'task:submit:add', '#', 'admin', '2023-05-15 11:24:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '提交记录修改', 2038, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'task:submit:edit', '#', 'admin', '2023-05-15 11:24:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '提交记录删除', 2038, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'task:submit:remove', '#', 'admin', '2023-05-15 11:24:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '提交记录导出', 2038, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'task:submit:export', '#', 'admin', '2023-05-15 11:24:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '任务批改', 2000, 1, 'correction', 'task/correction/index', NULL, 1, 0, 'C', '0', '0', 'task:correction:list', 'checkbox', 'admin', '2023-05-15 21:22:56', 'admin', '2023-05-15 21:25:07', '任务批改菜单');
INSERT INTO `sys_menu` VALUES (2045, '任务批改查询', 2044, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'task:correction:query', '#', 'admin', '2023-05-15 21:22:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '任务批改新增', 2044, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'task:correction:add', '#', 'admin', '2023-05-15 21:22:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '任务批改修改', 2044, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'task:correction:edit', '#', 'admin', '2023-05-15 21:22:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '任务批改删除', 2044, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'task:correction:remove', '#', 'admin', '2023-05-15 21:22:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '任务批改导出', 2044, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'task:correction:export', '#', 'admin', '2023-05-15 21:22:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '媒资管理', 0, 1, 'media', NULL, NULL, 1, 0, 'M', '0', '0', '', 'star', 'admin', '2023-05-16 13:03:43', 'admin', '2023-05-16 14:37:18', '');
INSERT INTO `sys_menu` VALUES (2051, '视频资源', 2050, 1, 'video', 'media/video/index', NULL, 1, 0, 'C', '0', '0', 'media:video:list', '#', 'admin', '2023-05-16 13:10:21', '', NULL, '视频资源菜单');
INSERT INTO `sys_menu` VALUES (2052, '视频资源查询', 2051, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'media:video:query', '#', 'admin', '2023-05-16 13:10:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '视频资源新增', 2051, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'media:video:add', '#', 'admin', '2023-05-16 13:10:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '视频资源修改', 2051, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'media:video:edit', '#', 'admin', '2023-05-16 13:10:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '视频资源删除', 2051, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'media:video:remove', '#', 'admin', '2023-05-16 13:10:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '视频资源导出', 2051, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'media:video:export', '#', 'admin', '2023-05-16 13:10:21', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, 'Sika教学系统核心业务功能开发启动', '2', 0x3C703EE696B0E78988E69CACE58685E5AEB93C2F703E, '0', 'admin', '2023-04-18 01:05:38', 'admin', '2023-05-17 00:08:20', '管理员');
INSERT INTO `sys_notice` VALUES (2, '上线通知:截止2023年5月21日基本业务功能上线', '1', 0x3C703EE7BBB4E68AA4E58685E5AEB93C2F703E, '0', 'admin', '2023-04-18 01:05:38', 'admin', '2023-05-17 00:09:11', '管理员');
INSERT INTO `sys_notice` VALUES (10, '2023.5.21后业务功能将陆续灰度发布', '2', 0x3C703E3C62723E3C2F703E, '0', 'admin', '2023-05-17 00:09:44', 'admin', '2023-05-17 00:10:24', NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 269 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.sika.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"任务管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"task\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-18 18:38:10', 121);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 1, 'com.sika.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"作业管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":2000,\"path\":\"task/homework\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-18 18:39:39', 128);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 3, 'com.sika.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2001', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-18 18:40:32', 136);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 6, 'com.sika.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"task_homework,task_answer\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-18 20:57:19', 1063);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 8, 'com.sika.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"task_homework\"}', NULL, 0, NULL, '2023-04-19 13:46:16', 287);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 8, 'com.sika.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"task_homework\"}', NULL, 0, NULL, '2023-04-19 16:49:51', 887);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 8, 'com.sika.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"task_answer\"}', NULL, 0, NULL, '2023-04-19 16:50:10', 155);
INSERT INTO `sys_oper_log` VALUES (107, '题目', 1, 'com.sika.task.controller.TaskHomeworkController.add()', 'POST', 1, 'admin', NULL, '/homework', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-04-19 17:15:27\",\"hContent\":\"给定一个整数数组&nbsp;nums&nbsp;和一个整数目标值&nbsp;target，请你在该数组中找出&nbsp;<strong>和为目标值&nbsp;</strong><em>target</em>&nbsp;的那&nbsp;<strong>两个</strong>&nbsp;整数，并返回它们的数组下标。你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。你可以按任意顺序返回答案。&nbsp;<strong>示例 1：</strong>输入：nums = [2,7,11,15], target = 9\\n输出：[0,1]\\n解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。\\n<strong>示例 2：</strong>输入：nums = [3,2,4], target = 6\\n输出：[1,2]\\n<strong>示例 3：</strong>输入：nums = [3,3], target = 6\\n输出：[0,1]\\n&nbsp;<strong>提示：</strong>2 &lt;= nums.length &lt;= 104-109 &lt;= nums[i] &lt;= 109-109 &lt;= target &lt;= 109<strong>只会存在一个有效答案</strong>&nbsp;<strong>进阶：</strong>你可以想出一个时间复杂度小于&nbsp;O(n2)&nbsp;的算法吗？\",\"hId\":6,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-19 17:15:28', 452);
INSERT INTO `sys_oper_log` VALUES (108, '题目', 3, 'com.sika.task.controller.TaskHomeworkController.remove()', 'DELETE', 1, 'admin', NULL, '/homework/6', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-19 17:16:13', 320);
INSERT INTO `sys_oper_log` VALUES (109, '作业', 1, 'com.sika.task.controller.TaskHomeworkController.add()', 'POST', 1, 'admin', NULL, '/homework', '127.0.0.1', '', '{\"createTime\":\"2023-04-19 17:20:07\",\"hContent\":\"1、Java属于以下哪种语言?﻿A、机器语言B、汇编语言C、高级语言D、以上都不对\",\"hId\":7,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-19 17:20:08', 254);
INSERT INTO `sys_oper_log` VALUES (110, '作业', 3, 'com.sika.task.controller.TaskHomeworkController.remove()', 'DELETE', 1, 'admin', NULL, '/homework/7', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-19 17:27:50', 160);
INSERT INTO `sys_oper_log` VALUES (111, '作业', 1, 'com.sika.task.controller.TaskHomeworkController.add()', 'POST', 1, 'admin', NULL, '/homework', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-04-19 18:37:19\",\"hAnswer\":\"C\",\"hContent\":\"1、Java属于以下哪种语言?A、机器语言B、汇编语言C、高级语言D、以上都不对\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-19 18:37:20', 5588);
INSERT INTO `sys_oper_log` VALUES (112, '作业', 1, 'com.sika.task.controller.TaskHomeworkController.add()', 'POST', 1, 'admin', NULL, '/homework', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-04-19 20:25:45\",\"hAnswer\":\"A\",\"hContent\":\"在JDK安装目录下，用于存放可执行程序的文件夹是？A、binB、jreC、libD、db\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-19 20:25:46', 534);
INSERT INTO `sys_oper_log` VALUES (113, '作业', 1, 'com.sika.task.controller.TaskHomeworkController.add()', 'POST', 1, 'admin', NULL, '/homework', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-04-19 20:27:28\",\"hAnswer\":\"D\",\"hContent\":\"下列Java命令中，哪一个可以编译HelloWorld.java文件?A、javaHelloWorldB、javaHelloWorld.javaC、javacHelloWorldD、javacHelloWorld.java\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-19 20:27:28', 234);
INSERT INTO `sys_oper_log` VALUES (114, '作业', 1, 'com.sika.task.controller.TaskHomeworkController.add()', 'POST', 1, 'admin', NULL, '/homework', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-04-19 20:30:29\",\"hAnswer\":\"A\",\"hContent\":\"以下关于java命令作用的描述中，正确的是?A、它专门负责解析由Java.class文件B、它可以将编写好的Java文件编译成.class文件C、可以把文件压缩D、可以把数据打包\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-19 20:30:30', 250);
INSERT INTO `sys_oper_log` VALUES (115, '作业', 1, 'com.sika.task.controller.TaskHomeworkController.add()', 'POST', 1, 'admin', NULL, '/homework', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-04-19 20:43:25\",\"hAnswer\":\"A\",\"hContent\":\"下面关于配置path环境变量作用的说法中，正确的是A、在任意目录可以使用javac和java命令B、在任意目录下可以使用class文件C、在任意目录可以使用记事本D、在任意目录下可以使用扫雷游戏\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-19 20:43:26', 288);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 2, 'com.sika.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"task/homework/index\",\"createTime\":\"2023-04-19 16:58:52\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"作业管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"homework\",\"perms\":\"task:homework:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-19 20:47:18', 206);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 6, 'com.sika.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"task_data\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-21 17:15:14', 672);
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 8, 'com.sika.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"task_data\"}', NULL, 0, NULL, '2023-04-21 17:16:59', 290);
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 8, 'com.sika.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"task_data\"}', NULL, 0, NULL, '2023-04-21 17:19:14', 78);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 8, 'com.sika.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"task_data\"}', NULL, 0, NULL, '2023-04-21 18:05:10', 168);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 8, 'com.sika.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"task_data\"}', NULL, 0, NULL, '2023-04-21 18:15:17', 78);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 2, 'com.sika.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"data/data/index\",\"createTime\":\"2023-04-21 18:16:00\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2026,\"menuName\":\"资料管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"data\",\"perms\":\"data:data:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-21 18:20:25', 170);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 8, 'com.sika.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"task_data\"}', NULL, 0, NULL, '2023-04-21 18:21:07', 71);
INSERT INTO `sys_oper_log` VALUES (124, '作业', 5, 'com.sika.task.controller.TaskHomeworkController.export()', 'POST', 1, 'admin', NULL, '/homework/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-04-21 20:05:45', 1209);
INSERT INTO `sys_oper_log` VALUES (125, '资料', 5, 'com.sika.data.controller.TaskDataController.export()', 'POST', 1, 'admin', NULL, '/data/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-04-21 20:07:15', 1144);
INSERT INTO `sys_oper_log` VALUES (126, '资料', 1, 'com.sika.data.controller.TaskDataController.add()', 'POST', 1, 'admin', NULL, '/data', '127.0.0.1', '', '{\"createTime\":\"2023-04-22 00:26:37\",\"dId\":1,\"dTitle\":\"1.txt\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 00:26:38', 298);
INSERT INTO `sys_oper_log` VALUES (127, '资料', 1, 'com.sika.data.controller.TaskDataController.add()', 'POST', 1, 'admin', NULL, '/data', '127.0.0.1', '', '{\"createTime\":\"2023-04-22 00:26:59\",\"dId\":2,\"dTitle\":\"2\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 00:27:00', 158);
INSERT INTO `sys_oper_log` VALUES (128, '资料', 1, 'com.sika.data.controller.TaskDataController.add()', 'POST', 1, 'admin', NULL, '/data', '127.0.0.1', '', '{\"createTime\":\"2023-04-22 00:27:51\",\"dId\":3,\"dTitle\":\"1.txt\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 00:27:51', 141);
INSERT INTO `sys_oper_log` VALUES (129, '资料', 1, 'com.sika.data.controller.TaskDataController.add()', 'POST', 1, 'admin', NULL, '/data', '127.0.0.1', '', '{\"createTime\":\"2023-04-22 06:54:16\",\"dId\":4,\"dTitle\":\"a\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 06:54:17', 284);
INSERT INTO `sys_oper_log` VALUES (130, '资料', 1, 'com.sika.data.controller.TaskDataController.add()', 'POST', 1, 'admin', NULL, '/data', '127.0.0.1', '', '{\"createTime\":\"2023-04-22 07:06:47\",\"dId\":5,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 07:06:48', 128);
INSERT INTO `sys_oper_log` VALUES (131, '资料', 1, 'com.sika.data.controller.TaskDataController.add()', 'POST', 1, 'admin', NULL, '/data', '127.0.0.1', '', '{\"createTime\":\"2023-04-22 07:11:34\",\"dId\":6,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 07:11:34', 139);
INSERT INTO `sys_oper_log` VALUES (132, '资料', 1, 'com.sika.data.controller.TaskDataController.add()', 'POST', 1, 'admin', NULL, '/data', '127.0.0.1', '', '{\"createTime\":\"2023-04-22 07:15:25\",\"dId\":7,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 07:15:25', 111);
INSERT INTO `sys_oper_log` VALUES (133, '资料', 1, 'com.sika.data.controller.TaskDataController.add()', 'POST', 1, 'admin', NULL, '/data', '127.0.0.1', '', '{\"createTime\":\"2023-04-22 07:22:50\",\"dId\":8,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 07:22:50', 125);
INSERT INTO `sys_oper_log` VALUES (134, '资料', 5, 'com.sika.data.controller.TaskDataController.export()', 'POST', 1, 'admin', NULL, '/data/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-04-22 10:51:59', 1174);
INSERT INTO `sys_oper_log` VALUES (135, '资料', 1, 'com.sika.data.controller.TaskDataController.add()', 'POST', 1, 'admin', NULL, '/data', '127.0.0.1', '', '{\"createTime\":\"2023-04-22 23:18:45\",\"dId\":6,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 23:18:46', 410);
INSERT INTO `sys_oper_log` VALUES (136, '资料', 1, 'com.sika.data.controller.TaskDataController.add()', 'POST', 1, 'admin', NULL, '/data', '127.0.0.1', '', '{\"createTime\":\"2023-04-22 23:21:36\",\"dId\":7,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 23:21:37', 122);
INSERT INTO `sys_oper_log` VALUES (137, '资料', 1, 'com.sika.data.controller.TaskDataController.add()', 'POST', 1, 'admin', NULL, '/data', '127.0.0.1', '', '{\"createTime\":\"2023-04-22 23:23:43\",\"dId\":8,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-22 23:23:43', 161);
INSERT INTO `sys_oper_log` VALUES (138, '资料', 1, 'com.sika.data.controller.TaskDataController.add()', 'POST', 1, 'admin', NULL, '/data/upload', '127.0.0.1', '', '', NULL, 1, '', '2023-04-23 22:12:17', 34078);
INSERT INTO `sys_oper_log` VALUES (139, '资料', 1, 'com.sika.data.controller.TaskDataController.add()', 'POST', 1, 'admin', NULL, '/data/upload', '127.0.0.1', '', '', NULL, 1, '', '2023-04-23 22:13:00', 7666);
INSERT INTO `sys_oper_log` VALUES (140, '资料', 1, 'com.sika.data.controller.TaskDataController.add()', 'POST', 1, 'admin', NULL, '/data/upload', '127.0.0.1', '', '', NULL, 1, '', '2023-04-23 22:18:12', 254045);
INSERT INTO `sys_oper_log` VALUES (141, '资料', 1, 'com.sika.data.controller.TaskDataController.add()', 'POST', 1, 'admin', NULL, '/data/upload', '127.0.0.1', '', '', NULL, 1, '', '2023-04-23 22:18:48', 18308);
INSERT INTO `sys_oper_log` VALUES (142, '资料', 1, 'com.sika.data.controller.TaskDataController.add()', 'POST', 1, 'admin', NULL, '/data/upload', '127.0.0.1', '', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 22:23:57', 22125);
INSERT INTO `sys_oper_log` VALUES (143, '资料', 1, 'com.sika.data.controller.TaskDataController.add()', 'POST', 1, 'admin', NULL, '/data/upload', '127.0.0.1', '', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 22:27:31', 6751);
INSERT INTO `sys_oper_log` VALUES (144, '资料', 1, 'com.sika.data.controller.TaskDataController.add()', 'POST', 1, 'admin', NULL, '/data/upload', '127.0.0.1', '', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-04-23 22:28:24', 167);
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 3, 'com.sika.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/1,2,3', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 10:23:02', 385);
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 3, 'com.sika.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2009', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 10:23:46', 151);
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 3, 'com.sika.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2010', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 10:23:50', 159);
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 3, 'com.sika.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2011', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 10:23:53', 137);
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 3, 'com.sika.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2012', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 10:23:55', 139);
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 3, 'com.sika.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2013', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 10:23:57', 140);
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 3, 'com.sika.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2008', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 10:24:00', 126);
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 6, 'com.sika.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"task_task,task_submit\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 10:24:13', 946);
INSERT INTO `sys_oper_log` VALUES (153, '字典类型', 1, 'com.sika.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"班级列表\",\"dictType\":\"sys_dept\",\"params\":{},\"remark\":\"班级列表\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 10:25:16', 122);
INSERT INTO `sys_oper_log` VALUES (154, '部门管理', 1, 'com.sika.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,101,103\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"软件工程1班\",\"email\":\"2235569493@qq.com\",\"leader\":\"吴畅\",\"orderNum\":0,\"params\":{},\"parentId\":103,\"phone\":\"13553727721\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:01:21', 358);
INSERT INTO `sys_oper_log` VALUES (155, '部门管理', 1, 'com.sika.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,101,103\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"软件工程2班\",\"email\":\"2235569493@qq.com\",\"leader\":\"吴畅\",\"orderNum\":1,\"params\":{},\"parentId\":103,\"phone\":\"13553727721\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:01:35', 160);
INSERT INTO `sys_oper_log` VALUES (156, '部门管理', 1, 'com.sika.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,101,104\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"网络工程1班\",\"email\":\"2235569493@qq.com\",\"leader\":\"吴畅\",\"orderNum\":0,\"params\":{},\"parentId\":104,\"phone\":\"13553727721\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:01:48', 170);
INSERT INTO `sys_oper_log` VALUES (157, '部门管理', 1, 'com.sika.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,101,104\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"网络工程2班\",\"email\":\"2235569493@qq.com\",\"leader\":\"吴畅\",\"orderNum\":2,\"params\":{},\"parentId\":104,\"phone\":\"13553727721\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:01:57', 153);
INSERT INTO `sys_oper_log` VALUES (158, '部门管理', 1, 'com.sika.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,101,105\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"数据科学与大数据1班\",\"email\":\"2235569493@qq.com\",\"leader\":\"吴畅\",\"orderNum\":0,\"params\":{},\"parentId\":105,\"phone\":\"13553727721\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:02:15', 118);
INSERT INTO `sys_oper_log` VALUES (159, '部门管理', 1, 'com.sika.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,101,105\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"数据科学与大数据2班\",\"email\":\"2235569493@qq.com\",\"leader\":\"吴畅\",\"orderNum\":1,\"params\":{},\"parentId\":105,\"phone\":\"13553727721\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:02:25', 168);
INSERT INTO `sys_oper_log` VALUES (160, '部门管理', 1, 'com.sika.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,101,106\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"人工智能1班\",\"email\":\"2235569493@qq.com\",\"leader\":\"吴畅\",\"orderNum\":0,\"params\":{},\"parentId\":106,\"phone\":\"13553727721\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:02:39', 140);
INSERT INTO `sys_oper_log` VALUES (161, '部门管理', 1, 'com.sika.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,101,106\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"人工智能2班\",\"email\":\"2235569493@qq.com\",\"leader\":\"吴畅\",\"orderNum\":1,\"params\":{},\"parentId\":106,\"phone\":\"13553727721\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:02:50', 135);
INSERT INTO `sys_oper_log` VALUES (162, '部门管理', 1, 'com.sika.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,101,107\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"计算机科学与技术1班\",\"email\":\"2235569493@qq.com\",\"leader\":\"吴畅\",\"orderNum\":0,\"params\":{},\"parentId\":107,\"phone\":\"13553727721\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:03:02', 196);
INSERT INTO `sys_oper_log` VALUES (163, '部门管理', 1, 'com.sika.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,101,107\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"计算机科学与技术2班\",\"email\":\"2235569493@qq.com\",\"leader\":\"吴畅\",\"orderNum\":1,\"params\":{},\"parentId\":107,\"phone\":\"13553727721\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:03:12', 325);
INSERT INTO `sys_oper_log` VALUES (164, '部门管理', 1, 'com.sika.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,102,108\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"舞蹈学1班\",\"email\":\"2235569493@qq.com\",\"leader\":\"吴畅\",\"orderNum\":0,\"params\":{},\"parentId\":108,\"phone\":\"13553727721\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:03:32', 152);
INSERT INTO `sys_oper_log` VALUES (165, '部门管理', 1, 'com.sika.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,102,109\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"服装与服装设计1班\",\"email\":\"2235569493@qq.com\",\"leader\":\"吴畅\",\"orderNum\":0,\"params\":{},\"parentId\":109,\"phone\":\"13553727721\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:03:47', 145);
INSERT INTO `sys_oper_log` VALUES (166, '字典数据', 1, 'com.sika.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"软件工程1班\",\"dictSort\":0,\"dictType\":\"sys_dept\",\"dictValue\":\"200\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:04:47', 158);
INSERT INTO `sys_oper_log` VALUES (167, '字典数据', 1, 'com.sika.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"软件工程2班\",\"dictSort\":1,\"dictType\":\"sys_dept\",\"dictValue\":\"201\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:05:01', 150);
INSERT INTO `sys_oper_log` VALUES (168, '字典数据', 1, 'com.sika.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"网络工程1班\",\"dictSort\":0,\"dictType\":\"sys_dept\",\"dictValue\":\"202\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:05:15', 128);
INSERT INTO `sys_oper_log` VALUES (169, '字典数据', 1, 'com.sika.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"网络工程2班\",\"dictSort\":3,\"dictType\":\"sys_dept\",\"dictValue\":\"203\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:05:26', 137);
INSERT INTO `sys_oper_log` VALUES (170, '字典数据', 2, 'com.sika.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-15 11:05:15\",\"default\":false,\"dictCode\":102,\"dictLabel\":\"网络工程1班\",\"dictSort\":2,\"dictType\":\"sys_dept\",\"dictValue\":\"202\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:05:43', 166);
INSERT INTO `sys_oper_log` VALUES (171, '字典数据', 1, 'com.sika.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"数据科学与大数据1班\",\"dictSort\":4,\"dictType\":\"sys_dept\",\"dictValue\":\"204\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:06:07', 147);
INSERT INTO `sys_oper_log` VALUES (172, '字典数据', 1, 'com.sika.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"数据科学与大数据2班\",\"dictSort\":5,\"dictType\":\"sys_dept\",\"dictValue\":\"205\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:06:21', 165);
INSERT INTO `sys_oper_log` VALUES (173, '字典数据', 1, 'com.sika.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"人工智能1班\",\"dictSort\":6,\"dictType\":\"sys_dept\",\"dictValue\":\"206\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:06:35', 332);
INSERT INTO `sys_oper_log` VALUES (174, '字典数据', 1, 'com.sika.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"人工智能2班\",\"dictSort\":7,\"dictType\":\"sys_dept\",\"dictValue\":\"207\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:06:45', 120);
INSERT INTO `sys_oper_log` VALUES (175, '字典数据', 1, 'com.sika.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"计算机科学与技术1班\",\"dictSort\":8,\"dictType\":\"sys_dept\",\"dictValue\":\"208\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:07:06', 239);
INSERT INTO `sys_oper_log` VALUES (176, '字典数据', 1, 'com.sika.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"计算机科学与技术2班\",\"dictSort\":0,\"dictType\":\"sys_dept\",\"dictValue\":\"209\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:07:22', 159);
INSERT INTO `sys_oper_log` VALUES (177, '字典数据', 2, 'com.sika.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-15 11:07:22\",\"default\":false,\"dictCode\":109,\"dictLabel\":\"计算机科学与技术2班\",\"dictSort\":9,\"dictType\":\"sys_dept\",\"dictValue\":\"209\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:07:33', 184);
INSERT INTO `sys_oper_log` VALUES (178, '字典数据', 1, 'com.sika.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"舞蹈学1班\",\"dictSort\":10,\"dictType\":\"sys_dept\",\"dictValue\":\"210\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:07:52', 220);
INSERT INTO `sys_oper_log` VALUES (179, '字典数据', 1, 'com.sika.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"服装与服装设计1班\",\"dictSort\":11,\"dictType\":\"sys_dept\",\"dictValue\":\"211\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:08:18', 139);
INSERT INTO `sys_oper_log` VALUES (180, '字典类型', 1, 'com.sika.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"批改操作\",\"dictType\":\"task_correct\",\"params\":{},\"remark\":\"批改操作列表\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:16:59', 148);
INSERT INTO `sys_oper_log` VALUES (181, '字典数据', 1, 'com.sika.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"PASS\",\"dictSort\":0,\"dictType\":\"task_correct\",\"dictValue\":\"1\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:17:21', 167);
INSERT INTO `sys_oper_log` VALUES (182, '字典数据', 1, 'com.sika.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"NO PASS\",\"dictSort\":1,\"dictType\":\"task_correct\",\"dictValue\":\"0\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:17:35', 126);
INSERT INTO `sys_oper_log` VALUES (183, '字典数据', 2, 'com.sika.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-15 11:17:35\",\"default\":false,\"dictCode\":113,\"dictLabel\":\"NO PASS\",\"dictSort\":1,\"dictType\":\"task_correct\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:17:47', 129);
INSERT INTO `sys_oper_log` VALUES (184, '字典数据', 1, 'com.sika.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"TO DO\",\"dictSort\":2,\"dictType\":\"task_correct\",\"dictValue\":\"NULL\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 11:18:23', 167);
INSERT INTO `sys_oper_log` VALUES (185, '代码生成', 8, 'com.sika.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"task_submit,task_task\"}', NULL, 0, NULL, '2023-05-15 11:20:43', 140);
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 2, 'com.sika.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"task/submit/index\",\"createTime\":\"2023-05-15 11:24:13\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2038,\"menuName\":\"提交记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"submit\",\"perms\":\"task:submit:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 14:26:34', 137);
INSERT INTO `sys_oper_log` VALUES (187, '菜单管理', 2, 'com.sika.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"task/task/index\",\"createTime\":\"2023-05-15 11:24:08\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2032,\"menuName\":\"教学任务\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"task\",\"perms\":\"task:task:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 14:33:21', 112);
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 2, 'com.sika.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"task/submit/index\",\"createTime\":\"2023-05-15 11:24:13\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2038,\"menuName\":\"提交记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"submit\",\"perms\":\"task:submit:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 14:33:55', 122);
INSERT INTO `sys_oper_log` VALUES (189, '教学任务', 1, 'com.sika.task.controller.TaskTaskController.add()', 'POST', 1, 'admin', NULL, '/task', '127.0.0.1', '', '{\"createTime\":\"2023-05-15 14:37:27\",\"id\":1,\"params\":{},\"taskAnswer\":\"D\",\"taskContent\":\"选择题1: ()\",\"taskDept\":200}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 14:37:28', 166);
INSERT INTO `sys_oper_log` VALUES (190, '教学任务', 1, 'com.sika.task.controller.TaskTaskController.add()', 'POST', 1, 'admin', NULL, '/task', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-15 14:40:42\",\"id\":2,\"params\":{},\"taskAnswer\":\"A\",\"taskContent\":\"选择题2 ()\",\"taskDept\":201}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 14:40:42', 175);
INSERT INTO `sys_oper_log` VALUES (191, '用户管理', 1, 'com.sika.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"deptId\":200,\"email\":\"2235569493@qq.com\",\"nickName\":\"小吴来哩\",\"params\":{},\"phonenumber\":\"13553727721\",\"postIds\":[],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"admin\"}', '{\"msg\":\"新增用户\'admin\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2023-05-15 15:01:40', 30);
INSERT INTO `sys_oper_log` VALUES (192, '用户管理', 1, 'com.sika.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"deptId\":200,\"email\":\"2235569493@qq.com\",\"nickName\":\"小吴来哩\",\"params\":{},\"phonenumber\":\"13553727721\",\"postIds\":[],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"spirit223\"}', '{\"msg\":\"新增用户\'spirit223\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2023-05-15 15:01:56', 50);
INSERT INTO `sys_oper_log` VALUES (193, '用户管理', 1, 'com.sika.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"deptId\":200,\"email\":\"2235569493@qq.com\",\"nickName\":\"小吴来哩\",\"params\":{},\"phonenumber\":\"13727272464\",\"postIds\":[],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userName\":\"spirit223\"}', '{\"msg\":\"新增用户\'spirit223\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2023-05-15 15:02:36', 94);
INSERT INTO `sys_oper_log` VALUES (194, '用户管理', 1, 'com.sika.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":200,\"email\":\"744981991@qq.com\",\"nickName\":\"小吴来哩\",\"params\":{},\"phonenumber\":\"13727272464\",\"postIds\":[],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"spirit223\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 15:02:44', 525);
INSERT INTO `sys_oper_log` VALUES (195, '角色管理', 2, 'com.sika.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-04-18 01:05:29\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2026,2027,2028,2029,2030,2031,2038,2039,2040,2041,2042,2043,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 15:03:19', 352);
INSERT INTO `sys_oper_log` VALUES (196, '角色管理', 2, 'com.sika.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-04-18 01:05:29\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,1,107,2,110,2026,2027,2028,2029,2030,2031,2038,2039,2040,2041,2042,2043,1035,109,1046,1047,1048,1049],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 15:04:16', 338);
INSERT INTO `sys_oper_log` VALUES (197, '代码生成', 6, 'com.sika.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"submit_record\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 16:13:19', 514);
INSERT INTO `sys_oper_log` VALUES (198, '代码生成', 8, 'com.sika.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"submit_record\"}', NULL, 0, NULL, '2023-05-15 16:14:27', 82);
INSERT INTO `sys_oper_log` VALUES (199, '字典类型', 1, 'com.sika.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"提交类型\",\"dictType\":\"task_commit_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 16:39:19', 182);
INSERT INTO `sys_oper_log` VALUES (200, '字典类型', 2, 'com.sika.system.controller.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-15 16:39:19\",\"dictId\":102,\"dictName\":\"提交类型\",\"dictType\":\"task_commit_status\",\"params\":{},\"remark\":\"题目提交类型\\n\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 16:39:34', 276);
INSERT INTO `sys_oper_log` VALUES (201, '字典数据', 1, 'com.sika.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未提交\",\"dictSort\":0,\"dictType\":\"task_commit_status\",\"dictValue\":\"false\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 16:39:57', 144);
INSERT INTO `sys_oper_log` VALUES (202, '字典数据', 2, 'com.sika.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-15 16:39:56\",\"default\":false,\"dictCode\":115,\"dictLabel\":\"未提交\",\"dictSort\":0,\"dictType\":\"task_commit_status\",\"dictValue\":\"false\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 16:40:01', 122);
INSERT INTO `sys_oper_log` VALUES (203, '字典数据', 1, 'com.sika.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已提交\",\"dictSort\":1,\"dictType\":\"task_commit_status\",\"dictValue\":\"true\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 16:40:22', 166);
INSERT INTO `sys_oper_log` VALUES (204, '教学任务', 1, 'com.sika.task.controller.TaskTaskController.add()', 'POST', 1, 'admin', NULL, '/task', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-15 20:17:59\",\"id\":3,\"params\":{},\"taskAnswer\":\"D\",\"taskContent\":\"选择题()\",\"taskDept\":200}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 20:17:59', 179);
INSERT INTO `sys_oper_log` VALUES (205, '资料', 1, 'com.sika.data.controller.TaskDataController.add()', 'POST', 1, 'spirit223', NULL, '/data/upload', '127.0.0.1', '', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 20:29:24', 266);
INSERT INTO `sys_oper_log` VALUES (206, '资料', 5, 'com.sika.data.controller.TaskDataController.export()', 'POST', 1, 'spirit223', NULL, '/data/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-05-15 20:29:33', 1457);
INSERT INTO `sys_oper_log` VALUES (207, '资料', 3, 'com.sika.data.controller.TaskDataController.remove()', 'DELETE', 1, 'spirit223', NULL, '/data/1', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 20:29:51', 133);
INSERT INTO `sys_oper_log` VALUES (208, '教学任务', 1, 'com.sika.task.controller.TaskTaskController.add()', 'POST', 1, 'admin', NULL, '/task', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-15 20:31:41\",\"id\":4,\"params\":{},\"taskAnswer\":\"\",\"taskContent\":\"1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用\",\"taskDept\":200}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 20:31:42', 382);
INSERT INTO `sys_oper_log` VALUES (209, '菜单管理', 2, 'com.sika.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"task/submit/index\",\"createTime\":\"2023-05-15 11:24:13\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2038,\"menuName\":\"任务提交\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"submit\",\"perms\":\"task:submit:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 21:04:45', 171);
INSERT INTO `sys_oper_log` VALUES (210, '菜单管理', 2, 'com.sika.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2023-04-18 18:38:10\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"学习管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"task\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 21:05:06', 237);
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 2, 'com.sika.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2023-04-18 18:38:10\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"学习管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"task\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 21:05:31', 124);
INSERT INTO `sys_oper_log` VALUES (212, '代码生成', 6, 'com.sika.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"task_correction\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 21:14:19', 748);
INSERT INTO `sys_oper_log` VALUES (213, '代码生成', 2, 'com.sika.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/gen/synchDb/task_correction', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 21:16:52', 768);
INSERT INTO `sys_oper_log` VALUES (214, '代码生成', 8, 'com.sika.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"task_correction\"}', NULL, 0, NULL, '2023-05-15 21:22:00', 95);
INSERT INTO `sys_oper_log` VALUES (215, '菜单管理', 2, 'com.sika.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"task/correction/index\",\"createTime\":\"2023-05-15 21:22:56\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2044,\"menuName\":\"任务批改\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"correction\",\"perms\":\"task:correction:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 21:25:07', 124);
INSERT INTO `sys_oper_log` VALUES (216, '岗位管理', 2, 'com.sika.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-04-18 01:05:29\",\"flag\":false,\"params\":{},\"postCode\":\"teacher\",\"postId\":2,\"postName\":\"教师\",\"postSort\":2,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 21:25:41', 157);
INSERT INTO `sys_oper_log` VALUES (217, '岗位管理', 1, 'com.sika.system.controller.SysPostController.add()', 'POST', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"2\",\"postId\":5,\"postName\":\"校长\",\"postSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 21:27:11', 195);
INSERT INTO `sys_oper_log` VALUES (218, '岗位管理', 2, 'com.sika.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-15 21:27:11\",\"flag\":false,\"params\":{},\"postCode\":\"principal\",\"postId\":5,\"postName\":\"校长\",\"postSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 21:27:27', 162);
INSERT INTO `sys_oper_log` VALUES (219, '岗位管理', 2, 'com.sika.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-04-18 01:05:29\",\"flag\":false,\"params\":{},\"postCode\":\"teacher\",\"postId\":2,\"postName\":\"教师\",\"postSort\":5,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 21:27:37', 176);
INSERT INTO `sys_oper_log` VALUES (220, '岗位管理', 2, 'com.sika.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-04-18 01:05:29\",\"flag\":false,\"params\":{},\"postCode\":\"director\",\"postId\":3,\"postName\":\"教导处主任\",\"postSort\":3,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 21:28:42', 168);
INSERT INTO `sys_oper_log` VALUES (221, '岗位管理', 2, 'com.sika.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-04-18 01:05:29\",\"flag\":false,\"params\":{},\"postCode\":\"teacher\",\"postId\":2,\"postName\":\"教师\",\"postSort\":2,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 21:28:53', 201);
INSERT INTO `sys_oper_log` VALUES (222, '岗位管理', 2, 'com.sika.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-15 21:27:11\",\"flag\":false,\"params\":{},\"postCode\":\"principal\",\"postId\":5,\"postName\":\"校长\",\"postSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 21:28:57', 134);
INSERT INTO `sys_oper_log` VALUES (223, '岗位管理', 2, 'com.sika.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-04-18 01:05:29\",\"flag\":false,\"params\":{},\"postCode\":\"principal\",\"postId\":2,\"postName\":\"校长\",\"postSort\":2,\"remark\":\"\",\"status\":\"0\"}', '{\"msg\":\"修改岗位\'校长\'失败，岗位名称已存在\",\"code\":500}', 0, NULL, '2023-05-15 21:29:08', 27);
INSERT INTO `sys_oper_log` VALUES (224, '岗位管理', 2, 'com.sika.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-15 21:27:11\",\"flag\":false,\"params\":{},\"postCode\":\"principala\",\"postId\":5,\"postName\":\"校长a\",\"postSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 21:29:15', 166);
INSERT INTO `sys_oper_log` VALUES (225, '岗位管理', 2, 'com.sika.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-04-18 01:05:29\",\"flag\":false,\"params\":{},\"postCode\":\"principal\",\"postId\":2,\"postName\":\"校长\",\"postSort\":2,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 21:29:26', 175);
INSERT INTO `sys_oper_log` VALUES (226, '岗位管理', 2, 'com.sika.system.controller.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-15 21:27:11\",\"flag\":false,\"params\":{},\"postCode\":\"teacher\",\"postId\":5,\"postName\":\"教师\",\"postSort\":5,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 21:29:33', 373);
INSERT INTO `sys_oper_log` VALUES (227, '岗位管理', 1, 'com.sika.system.controller.SysPostController.add()', 'POST', 1, 'admin', NULL, '/post', '127.0.0.1', '', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"student\",\"postId\":6,\"postName\":\"学生\",\"postSort\":6,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 21:29:47', 151);
INSERT INTO `sys_oper_log` VALUES (228, '用户管理', 1, 'com.sika.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":210,\"email\":\"13131313133@qq.com\",\"nickName\":\"陈泽锋\",\"params\":{},\"phonenumber\":\"13131313133\",\"postIds\":[1],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":101,\"userName\":\"chenzefeng\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 21:40:52', 417);
INSERT INTO `sys_oper_log` VALUES (229, '提交记录', 1, 'com.sika.task.controller.TaskSubmitController.add()', 'POST', 1, 'spirit223', NULL, '/submit', '127.0.0.1', '', '{\"id\":1,\"params\":{},\"submitContent\":\"D\",\"taskId\":4,\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 21:59:41', 325);
INSERT INTO `sys_oper_log` VALUES (230, '提交记录', 1, 'com.sika.task.controller.TaskSubmitController.add()', 'POST', 1, 'spirit223', NULL, '/submit', '127.0.0.1', '', '{\"id\":2,\"params\":{},\"submitContent\":\"A\",\"taskId\":3,\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 22:13:03', 218);
INSERT INTO `sys_oper_log` VALUES (231, '菜单管理', 3, 'com.sika.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/114', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 22:15:20', 206);
INSERT INTO `sys_oper_log` VALUES (232, '提交记录', 1, 'com.sika.task.controller.TaskSubmitController.add()', 'POST', 1, 'spirit223', NULL, '/submit', '127.0.0.1', '', '{\"id\":3,\"params\":{},\"submitContent\":\"D\",\"taskId\":1,\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 22:29:05', 138);
INSERT INTO `sys_oper_log` VALUES (233, '提交记录', 1, 'com.sika.task.controller.TaskSubmitController.add()', 'POST', 1, 'spirit223', NULL, '/submit', '127.0.0.1', '', '{\"id\":4,\"params\":{},\"submitContent\":\"A\",\"taskId\":3,\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-15 22:29:11', 156);
INSERT INTO `sys_oper_log` VALUES (234, '教学任务', 1, 'com.sika.task.controller.TaskTaskController.add()', 'POST', 1, 'admin', NULL, '/task', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-16 00:43:32\",\"id\":5,\"params\":{},\"taskAnswer\":\"AAA\",\"taskContent\":\"1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用\",\"taskDept\":200}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 00:43:32', 219);
INSERT INTO `sys_oper_log` VALUES (235, '提交记录', 1, 'com.sika.task.controller.TaskSubmitController.add()', 'POST', 1, 'spirit223', NULL, '/submit', '127.0.0.1', '', '{\"id\":5,\"params\":{},\"submitContent\":\"aaa\",\"taskId\":5,\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 00:43:42', 114);
INSERT INTO `sys_oper_log` VALUES (236, '任务批改', 1, 'com.sika.task.controller.TaskCorrectionController.add()', 'POST', 1, 'admin', NULL, '/correction', '127.0.0.1', '', '{\"correctResult\":1,\"createBy\":\"admin\",\"createTime\":\"2023-05-16 09:15:57\",\"id\":1,\"params\":{},\"submitContent\":\"A\",\"submitId\":4,\"submitUser\":\"小吴来哩\",\"submitUserId\":100,\"taskContent\":\"选择题()\",\"taskDept\":200,\"taskId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 09:15:57', 10183);
INSERT INTO `sys_oper_log` VALUES (237, '任务批改', 1, 'com.sika.task.controller.TaskCorrectionController.add()', 'POST', 1, 'admin', NULL, '/correction', '127.0.0.1', '', '{\"correctResult\":1,\"createBy\":\"admin\",\"createTime\":\"2023-05-16 09:16:07\",\"id\":2,\"params\":{},\"submitContent\":\"A\",\"submitId\":4,\"submitUser\":\"小吴来哩\",\"submitUserId\":100,\"taskContent\":\"选择题()\",\"taskDept\":200,\"taskId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 09:16:06', 264);
INSERT INTO `sys_oper_log` VALUES (238, '任务批改', 1, 'com.sika.task.controller.TaskCorrectionController.add()', 'POST', 1, 'admin', NULL, '/correction', '127.0.0.1', '', '{\"correctResult\":0,\"createBy\":\"admin\",\"createTime\":\"2023-05-16 09:16:27\",\"id\":3,\"params\":{},\"submitContent\":\"aaa\",\"submitId\":5,\"submitUser\":\"小吴来哩\",\"submitUserId\":100,\"taskContent\":\"1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用\",\"taskDept\":200,\"taskId\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 09:16:26', 241);
INSERT INTO `sys_oper_log` VALUES (239, '代码生成', 6, 'com.sika.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '{\"tables\":\"media_video\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 13:01:51', 1813);
INSERT INTO `sys_oper_log` VALUES (240, '菜单管理', 1, 'com.sika.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"star\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"媒资管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"media\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 13:03:43', 384);
INSERT INTO `sys_oper_log` VALUES (241, '代码生成', 8, 'com.sika.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', '{\"tables\":\"media_video\"}', NULL, 0, NULL, '2023-05-16 13:05:23', 393);
INSERT INTO `sys_oper_log` VALUES (242, '菜单管理', 2, 'com.sika.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2023-04-18 01:05:30\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 14:37:03', 164);
INSERT INTO `sys_oper_log` VALUES (243, '菜单管理', 2, 'com.sika.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2023-04-18 01:05:30\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 14:37:06', 132);
INSERT INTO `sys_oper_log` VALUES (244, '菜单管理', 2, 'com.sika.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2023-04-18 01:05:30\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 14:37:11', 133);
INSERT INTO `sys_oper_log` VALUES (245, '菜单管理', 2, 'com.sika.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2023-05-16 13:03:43\",\"icon\":\"star\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2050,\"menuName\":\"媒资管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"media\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 14:37:18', 131);
INSERT INTO `sys_oper_log` VALUES (246, '通知公告', 2, 'com.sika.system.controller.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/notice', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-04-18 01:05:38\",\"noticeContent\":\"<p>新版本内容</p>\",\"noticeId\":1,\"noticeTitle\":\"Sika教学系统核心业务功能开发启动\",\"noticeType\":\"2\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 00:08:22', 1325);
INSERT INTO `sys_oper_log` VALUES (247, '通知公告', 2, 'com.sika.system.controller.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/notice', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-04-18 01:05:38\",\"noticeContent\":\"<p>维护内容</p>\",\"noticeId\":2,\"noticeTitle\":\"截止2023年5月21日基本业务功能上线\",\"noticeType\":\"1\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 00:09:00', 1289);
INSERT INTO `sys_oper_log` VALUES (248, '通知公告', 2, 'com.sika.system.controller.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/notice', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-04-18 01:05:38\",\"noticeContent\":\"<p>维护内容</p>\",\"noticeId\":2,\"noticeTitle\":\"上线通知:截止2023年5月21日基本业务功能上线\",\"noticeType\":\"1\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-17 00:08:58\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 00:09:12', 1280);
INSERT INTO `sys_oper_log` VALUES (249, '通知公告', 1, 'com.sika.system.controller.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/notice', '127.0.0.1', '', '{\"createBy\":\"admin\",\"noticeContent\":\"<p><br></p>\",\"noticeTitle\":\"2023.5.21后业务功能将进行路线灰度发布\",\"noticeType\":\"2\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 00:09:45', 1580);
INSERT INTO `sys_oper_log` VALUES (250, '通知公告', 2, 'com.sika.system.controller.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/notice', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-17 00:09:44\",\"noticeContent\":\"<p><br></p>\",\"noticeId\":10,\"noticeTitle\":\"2023.5.21后业务功能将进行陆续灰度发布\",\"noticeType\":\"2\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 00:10:08', 2197);
INSERT INTO `sys_oper_log` VALUES (251, '通知公告', 2, 'com.sika.system.controller.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/notice', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-17 00:09:44\",\"noticeContent\":\"<p><br></p>\",\"noticeId\":10,\"noticeTitle\":\"2023.5.21后业务功能将陆续灰度发布\",\"noticeType\":\"2\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-17 00:10:06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 00:10:26', 4664);
INSERT INTO `sys_oper_log` VALUES (252, '通知公告', 2, 'com.sika.system.controller.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/notice', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-17 00:09:44\",\"noticeContent\":\"<p><br></p>\",\"noticeId\":10,\"noticeTitle\":\"2023.5.21后业务功能将陆续灰度发布\",\"noticeType\":\"2\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-17 00:10:06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 00:10:31', 4264);
INSERT INTO `sys_oper_log` VALUES (253, '视频资源', 1, 'com.sika.media.controller.MediaVideoController.add()', 'POST', 1, 'admin', NULL, '/video', '127.0.0.1', '', '{\"createTime\":\"2023-05-17 00:49:00\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\develop\\Java\\graduation\\gen\\Sika-Cloud\\sika-modules\\sika-media\\target\\classes\\mapper\\media\\MediaVideoMapper.xml]\r\n### The error may involve com.sika.media.mapper.MediaVideoMapper.insertMediaVideo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into media_video          ( create_time )           values ( ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2023-05-17 00:49:03', 2636);
INSERT INTO `sys_oper_log` VALUES (254, '视频资源', 1, 'com.sika.media.controller.MediaVideoController.add()', 'POST', 1, 'admin', NULL, '/video', '127.0.0.1', '', '', NULL, 1, '', '2023-05-17 10:53:39', 94);
INSERT INTO `sys_oper_log` VALUES (255, '视频资源', 1, 'com.sika.media.controller.MediaVideoController.add()', 'POST', 1, 'admin', NULL, '/video', '127.0.0.1', '', '', NULL, 1, '', '2023-05-17 10:58:21', 92893);
INSERT INTO `sys_oper_log` VALUES (256, '视频资源', 1, 'com.sika.media.controller.MediaVideoController.add()', 'POST', 1, 'admin', NULL, '/video', '127.0.0.1', '', '', NULL, 1, '', '2023-05-17 11:00:41', 4529);
INSERT INTO `sys_oper_log` VALUES (257, '视频资源', 1, 'com.sika.media.controller.MediaVideoController.add()', 'POST', 1, 'admin', NULL, '/video', '127.0.0.1', '', '', NULL, 1, '', '2023-05-17 11:09:50', 7831);
INSERT INTO `sys_oper_log` VALUES (258, '视频资源', 1, 'com.sika.media.controller.MediaVideoController.add()', 'POST', 1, 'admin', NULL, '/video', '127.0.0.1', '', '', NULL, 1, '', '2023-05-17 11:13:26', 5313);
INSERT INTO `sys_oper_log` VALUES (259, '视频资源', 1, 'com.sika.media.controller.MediaVideoController.add()', 'POST', 1, 'admin', NULL, '/video', '127.0.0.1', '', '', '{\"msg\":\"文件上传成功\",\"code\":200}', 0, NULL, '2023-05-17 11:34:53', 200676);
INSERT INTO `sys_oper_log` VALUES (260, '视频资源', 1, 'com.sika.media.controller.MediaVideoController.add()', 'POST', 1, 'admin', NULL, '/video', '127.0.0.1', '', '', '{\"msg\":\"文件上传成功\",\"code\":200}', 0, NULL, '2023-05-19 16:46:52', 29849);
INSERT INTO `sys_oper_log` VALUES (261, '用户管理', 3, 'com.sika.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/user/2', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-20 21:14:32', 35);
INSERT INTO `sys_oper_log` VALUES (262, '角色管理', 1, 'com.sika.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,2000,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,107,1035,1036,1037,1038,109,1046,1047,1048],\"params\":{},\"roleId\":100,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-20 21:15:18', 23);
INSERT INTO `sys_oper_log` VALUES (263, '角色管理', 1, 'com.sika.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2026,2032,1,107,2027,2028,2030,2033,2038,2039,2040,2041,2042,2043,1035],\"params\":{},\"roleId\":101,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-20 21:16:17', 10);
INSERT INTO `sys_oper_log` VALUES (264, '用户管理', 2, 'com.sika.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-05-15 15:02:44\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101,103\",\"children\":[],\"deptId\":200,\"deptName\":\"软件工程1班\",\"leader\":\"吴畅\",\"orderNum\":0,\"params\":{},\"parentId\":103,\"status\":\"0\"},\"deptId\":200,\"email\":\"744981991@qq.com\",\"loginIp\":\"\",\"nickName\":\"小吴来哩\",\"params\":{},\"phonenumber\":\"13727272464\",\"postIds\":[],\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"spirit223\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-20 21:16:31', 17);
INSERT INTO `sys_oper_log` VALUES (265, '教学任务', 1, 'com.sika.task.controller.TaskTaskController.add()', 'POST', 1, 'admin', NULL, '/task', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-20 21:17:33\",\"id\":6,\"params\":{},\"taskAnswer\":\"A\",\"taskContent\":\"选择题1\",\"taskDept\":200}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-20 21:17:33', 34);
INSERT INTO `sys_oper_log` VALUES (266, '提交记录', 1, 'com.sika.task.controller.TaskSubmitController.add()', 'POST', 1, 'spirit223', NULL, '/submit', '127.0.0.1', '', '{\"id\":6,\"params\":{},\"submitContent\":\"A\",\"taskId\":6,\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-20 21:17:50', 8);
INSERT INTO `sys_oper_log` VALUES (267, '角色管理', 2, 'com.sika.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-05-20 21:16:17\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2026,2032,2050,2051,1,107,2027,2028,2030,2033,2038,2039,2040,2041,2042,2043,2052,2056,1035],\"params\":{},\"roleId\":101,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-20 21:19:20', 14);
INSERT INTO `sys_oper_log` VALUES (268, '角色管理', 2, 'com.sika.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2023-05-20 21:16:17\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2026,2032,1,107,2027,2028,2030,2033,2038,2039,2040,2041,2042,2043,2050,2051,2052,2053,2054,2055,2056,1035],\"params\":{},\"roleId\":101,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-20 21:19:41', 13);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-04-18 01:05:29', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'principal', '校长', 2, '0', 'admin', '2023-04-18 01:05:29', 'admin', '2023-05-15 21:29:26', '');
INSERT INTO `sys_post` VALUES (3, 'director', '教导处主任', 3, '0', 'admin', '2023-04-18 01:05:29', 'admin', '2023-05-15 21:28:42', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-04-18 01:05:29', '', NULL, '');
INSERT INTO `sys_post` VALUES (5, 'teacher', '教师', 5, '0', 'admin', '2023-05-15 21:27:11', 'admin', '2023-05-15 21:29:33', NULL);
INSERT INTO `sys_post` VALUES (6, 'student', '学生', 6, '0', 'admin', '2023-05-15 21:29:47', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-04-18 01:05:29', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-04-18 01:05:29', 'admin', '2023-05-15 15:04:16', '普通角色');
INSERT INTO `sys_role` VALUES (100, '教师', 'teacher', 2, '1', 1, 1, '0', '0', 'admin', '2023-05-20 21:15:18', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (101, '学生', 'student', 3, '1', 1, 1, '0', '0', 'admin', '2023-05-20 21:16:17', 'admin', '2023-05-20 21:19:41', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2026);
INSERT INTO `sys_role_menu` VALUES (2, 2027);
INSERT INTO `sys_role_menu` VALUES (2, 2028);
INSERT INTO `sys_role_menu` VALUES (2, 2029);
INSERT INTO `sys_role_menu` VALUES (2, 2030);
INSERT INTO `sys_role_menu` VALUES (2, 2031);
INSERT INTO `sys_role_menu` VALUES (2, 2038);
INSERT INTO `sys_role_menu` VALUES (2, 2039);
INSERT INTO `sys_role_menu` VALUES (2, 2040);
INSERT INTO `sys_role_menu` VALUES (2, 2041);
INSERT INTO `sys_role_menu` VALUES (2, 2042);
INSERT INTO `sys_role_menu` VALUES (2, 2043);
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 2);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 109);
INSERT INTO `sys_role_menu` VALUES (100, 1035);
INSERT INTO `sys_role_menu` VALUES (100, 1036);
INSERT INTO `sys_role_menu` VALUES (100, 1037);
INSERT INTO `sys_role_menu` VALUES (100, 1038);
INSERT INTO `sys_role_menu` VALUES (100, 1046);
INSERT INTO `sys_role_menu` VALUES (100, 1047);
INSERT INTO `sys_role_menu` VALUES (100, 1048);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2026);
INSERT INTO `sys_role_menu` VALUES (100, 2027);
INSERT INTO `sys_role_menu` VALUES (100, 2028);
INSERT INTO `sys_role_menu` VALUES (100, 2029);
INSERT INTO `sys_role_menu` VALUES (100, 2030);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2033);
INSERT INTO `sys_role_menu` VALUES (100, 2034);
INSERT INTO `sys_role_menu` VALUES (100, 2035);
INSERT INTO `sys_role_menu` VALUES (100, 2036);
INSERT INTO `sys_role_menu` VALUES (100, 2037);
INSERT INTO `sys_role_menu` VALUES (100, 2038);
INSERT INTO `sys_role_menu` VALUES (100, 2039);
INSERT INTO `sys_role_menu` VALUES (100, 2040);
INSERT INTO `sys_role_menu` VALUES (100, 2041);
INSERT INTO `sys_role_menu` VALUES (100, 2042);
INSERT INTO `sys_role_menu` VALUES (100, 2043);
INSERT INTO `sys_role_menu` VALUES (100, 2044);
INSERT INTO `sys_role_menu` VALUES (100, 2045);
INSERT INTO `sys_role_menu` VALUES (100, 2046);
INSERT INTO `sys_role_menu` VALUES (100, 2047);
INSERT INTO `sys_role_menu` VALUES (100, 2048);
INSERT INTO `sys_role_menu` VALUES (100, 2049);
INSERT INTO `sys_role_menu` VALUES (100, 2050);
INSERT INTO `sys_role_menu` VALUES (100, 2051);
INSERT INTO `sys_role_menu` VALUES (100, 2052);
INSERT INTO `sys_role_menu` VALUES (100, 2053);
INSERT INTO `sys_role_menu` VALUES (100, 2054);
INSERT INTO `sys_role_menu` VALUES (100, 2055);
INSERT INTO `sys_role_menu` VALUES (100, 2056);
INSERT INTO `sys_role_menu` VALUES (101, 1);
INSERT INTO `sys_role_menu` VALUES (101, 107);
INSERT INTO `sys_role_menu` VALUES (101, 1035);
INSERT INTO `sys_role_menu` VALUES (101, 2000);
INSERT INTO `sys_role_menu` VALUES (101, 2026);
INSERT INTO `sys_role_menu` VALUES (101, 2027);
INSERT INTO `sys_role_menu` VALUES (101, 2028);
INSERT INTO `sys_role_menu` VALUES (101, 2030);
INSERT INTO `sys_role_menu` VALUES (101, 2032);
INSERT INTO `sys_role_menu` VALUES (101, 2033);
INSERT INTO `sys_role_menu` VALUES (101, 2038);
INSERT INTO `sys_role_menu` VALUES (101, 2039);
INSERT INTO `sys_role_menu` VALUES (101, 2040);
INSERT INTO `sys_role_menu` VALUES (101, 2041);
INSERT INTO `sys_role_menu` VALUES (101, 2042);
INSERT INTO `sys_role_menu` VALUES (101, 2043);
INSERT INTO `sys_role_menu` VALUES (101, 2050);
INSERT INTO `sys_role_menu` VALUES (101, 2051);
INSERT INTO `sys_role_menu` VALUES (101, 2052);
INSERT INTO `sys_role_menu` VALUES (101, 2053);
INSERT INTO `sys_role_menu` VALUES (101, 2054);
INSERT INTO `sys_role_menu` VALUES (101, 2055);
INSERT INTO `sys_role_menu` VALUES (101, 2056);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '吴畅', '00', '2235569493@163.com', '13553727721', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-04-18 01:05:28', 'admin', '2023-04-18 01:05:28', '', NULL, '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'wc', '吴畅', '00', '2235569493@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2023-04-18 01:05:28', 'admin', '2023-04-18 01:05:28', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, 200, 'spirit223', '小吴来哩', '00', '744981991@qq.com', '13727272464', '0', '', '$2a$10$z/Dcd0.z05eAf3FU4x3qseAfH8Cnmtat/KKAw1CbzBrinwAnLkux6', '0', '0', '', NULL, 'admin', '2023-05-15 15:02:44', 'admin', '2023-05-20 21:16:31', NULL);
INSERT INTO `sys_user` VALUES (101, 210, 'chenzefeng', '陈泽锋', '00', '13131313133@qq.com', '13131313133', '0', '', '$2a$10$8DTByU4AN0eyr7qL0mUaVuD.qekV6AsDkexQsIrHm.YieQiKHd66q', '0', '0', '', NULL, 'admin', '2023-05-15 21:40:52', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (101, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (100, 101);
INSERT INTO `sys_user_role` VALUES (101, 2);

-- ----------------------------
-- Table structure for task_correction
-- ----------------------------
DROP TABLE IF EXISTS `task_correction`;
CREATE TABLE `task_correction`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '批改id',
  `task_id` bigint NULL DEFAULT NULL COMMENT '任务id',
  `task_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '任务内容',
  `task_dept` bigint NULL DEFAULT NULL COMMENT '任务从属部门',
  `submit_id` bigint NULL DEFAULT NULL COMMENT '提交id',
  `submit_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '提交用户',
  `submit_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '提交内容',
  `correct_result` tinyint NULL DEFAULT NULL COMMENT '批改结果',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '批改人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '批改时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务批改表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of task_correction
-- ----------------------------
INSERT INTO `task_correction` VALUES (1, 3, '选择题()', 200, 4, '小吴来哩', 'A', 1, 'admin', '2023-05-16 09:15:58', NULL, NULL, NULL);
INSERT INTO `task_correction` VALUES (2, 3, '选择题()', 200, 4, '小吴来哩', 'A', 1, 'admin', '2023-05-16 09:16:07', NULL, NULL, NULL);
INSERT INTO `task_correction` VALUES (3, 5, '1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用', 200, 5, '小吴来哩', 'aaa', 0, 'admin', '2023-05-16 09:16:27', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for task_data
-- ----------------------------
DROP TABLE IF EXISTS `task_data`;
CREATE TABLE `task_data`  (
  `d_id` bigint NOT NULL AUTO_INCREMENT COMMENT '资料编号',
  `d_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '资料名称',
  `d_local` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '资料存储路径',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人信息',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`d_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '资料表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of task_data
-- ----------------------------

-- ----------------------------
-- Table structure for task_submit
-- ----------------------------
DROP TABLE IF EXISTS `task_submit`;
CREATE TABLE `task_submit`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '提交id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '提交用户',
  `submit_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '提交内容',
  `task_id` bigint NULL DEFAULT NULL COMMENT '任务id',
  `correct_result` tinyint NULL DEFAULT NULL COMMENT '批改结果',
  `correct_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '批改备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '提交记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of task_submit
-- ----------------------------
INSERT INTO `task_submit` VALUES (3, 100, 'D', 1, 1, NULL);
INSERT INTO `task_submit` VALUES (4, 100, 'A', 3, 1, NULL);
INSERT INTO `task_submit` VALUES (5, 100, 'aaa', 5, 0, NULL);
INSERT INTO `task_submit` VALUES (6, 100, 'A', 6, NULL, NULL);

-- ----------------------------
-- Table structure for task_task
-- ----------------------------
DROP TABLE IF EXISTS `task_task`;
CREATE TABLE `task_task`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `task_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '任务内容',
  `task_answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '任务答案',
  `task_dept` bigint NULL DEFAULT NULL COMMENT '从属部门',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of task_task
-- ----------------------------
INSERT INTO `task_task` VALUES (1, '选择题1: ()', 'D', 200, 'admin', '2023-05-15 14:37:28', NULL, '2023-05-15 18:27:28', NULL);
INSERT INTO `task_task` VALUES (2, '选择题2 ()', 'A', 201, 'admin', '2023-05-15 14:40:43', NULL, NULL, NULL);
INSERT INTO `task_task` VALUES (3, '选择题()', 'D', 200, 'admin', '2023-05-15 20:17:59', NULL, NULL, NULL);
INSERT INTO `task_task` VALUES (4, '1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用', '', 200, 'admin', '2023-05-15 20:31:42', NULL, NULL, NULL);
INSERT INTO `task_task` VALUES (5, '1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用1:下列概念中不属于面向对象这种编程范畴的是（）？A.对象消息B.继承多态C.类封装D.过程调用', 'AAA', 200, 'admin', '2023-05-16 00:43:32', NULL, NULL, NULL);
INSERT INTO `task_task` VALUES (6, '选择题1', 'A', 200, 'admin', '2023-05-20 21:17:34', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
