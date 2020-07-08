/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50715
 Source Host           : localhost:3306
 Source Schema         : renren_fast

 Target Server Type    : MySQL
 Target Server Version : 50715
 File Encoding         : 65001

 Date: 31/05/2020 14:20:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for email_log
-- ----------------------------
DROP TABLE IF EXISTS `email_log`;
CREATE TABLE `email_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `email_user_id` int(11) NOT NULL COMMENT '客户表ID',
  `subject` varchar(255) DEFAULT NULL COMMENT '邮件主题',
  `content` text COMMENT '邮件内容',
  `file` text COMMENT '附件',
  `source_email` varchar(255) NOT NULL COMMENT '发送方邮箱',
  `to_email` varchar(255) NOT NULL COMMENT '接收方邮箱',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `success` int(11) NOT NULL DEFAULT '1' COMMENT '是否非空',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=458 DEFAULT CHARSET=utf8mb4 COMMENT='邮件发送记录表';

-- ----------------------------
-- Records of email_log
-- ----------------------------
BEGIN;
INSERT INTO `email_log` VALUES (1, 1, '1', NULL, NULL, '123', '213', '2020-03-28 14:35:20', 1);
INSERT INTO `email_log` VALUES (2, 2, '123', NULL, NULL, '123', '4354', '2020-03-28 15:10:37', 0);
INSERT INTO `email_log` VALUES (10, 1, '213', '<p style=\"text-align: center;\">12321</p><p style=\"text-align: center;\"><img src=\"http://q7mnmlxrl.bkt.clouddn.com/76f5faa0f8d54bcfbb6750ea51f886e6.jpg\"></p>', '西电logo.jpg', '3335743364@qq.com', 'larry6799@126.com', '2020-03-28 17:00:20', 1);
INSERT INTO `email_log` VALUES (11, 1, '213', '<p style=\"text-align: center;\">12321</p><p style=\"text-align: center;\"><img src=\"http://q7mnmlxrl.bkt.clouddn.com/76f5faa0f8d54bcfbb6750ea51f886e6.jpg\"></p>', '西电logo.jpg', '3335743364@qq.com', 'zhangr@ffalcon.cn', '2020-03-28 17:00:21', 1);
INSERT INTO `email_log` VALUES (12, 1, '测试邮件', '<p style=\"text-align: center;\">12321</p><p style=\"text-align: center;\"><img src=\"http://q7mnmlxrl.bkt.clouddn.com/76f5faa0f8d54bcfbb6750ea51f886e6.jpg\"></p>', '西电logo.jpg', 'larry6799@163.com', 'larry6799@126.com', '2020-03-28 17:05:11', 1);
INSERT INTO `email_log` VALUES (13, 1, '测试邮件', '<p style=\"text-align: center;\">12321</p><p style=\"text-align: center;\"><img src=\"http://q7mnmlxrl.bkt.clouddn.com/76f5faa0f8d54bcfbb6750ea51f886e6.jpg\"></p>', '西电logo.jpg', '3335743364@qq.com', 'zhangr@ffalcon.cn', '2020-03-28 17:05:13', 1);
INSERT INTO `email_log` VALUES (14, 2, '你好', '<p style=\"text-align: center;\"><img src=\"http://q7mnmlxrl.bkt.clouddn.com/1284b12c95ab4a24abd16dcc2d2f7bf1.jpg\">你好</p>', '123.jpg', 'larry6799@163.com', 'larry6799@126.com', '2020-03-28 17:23:14', 1);
INSERT INTO `email_log` VALUES (15, 2, '你好', '<p style=\"text-align: center;\">你好</p>', '123.jpg', '3335743364@qq.com', 'zhangr@ffalcon.cn', '2020-03-28 17:23:15', 1);
INSERT INTO `email_log` VALUES (16, 2, '天天开心', '<p style=\"text-align: center;\">你好</p>', '123.jpg', 'larry6799@163.com', 'larry6799@126.com', '2020-03-28 17:23:41', 1);
INSERT INTO `email_log` VALUES (17, 2, '天天开心', '<p style=\"text-align: center;\">你好</p>', '123.jpg', '3335743364@qq.com', 'zhangr@ffalcon.cn', '2020-03-28 17:23:42', 1);
INSERT INTO `email_log` VALUES (18, 2, '做个好人', '<p style=\"text-align: center;\"><img src=\"http://q7mnmlxrl.bkt.clouddn.com/1284b12c95ab4a24abd16dcc2d2f7bf1.jpg\">你好</p>', '123.jpg', 'larry6799@163.com', 'larry6799@126.com', '2020-03-28 17:24:05', 1);
INSERT INTO `email_log` VALUES (19, 2, '做个好人', '<p style=\"text-align: center;\"><img src=\"http://q7mnmlxrl.bkt.clouddn.com/1284b12c95ab4a24abd16dcc2d2f7bf1.jpg\">你好</p>', '123.jpg', '3335743364@qq.com', 'zhangr@ffalcon.cn', '2020-03-28 17:24:06', 1);
INSERT INTO `email_log` VALUES (20, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', '1246799169@qq.com', '2020-03-28 17:25:03', 1);
INSERT INTO `email_log` VALUES (21, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', '2229220952@qq.com', '2020-03-28 17:25:04', 1);
INSERT INTO `email_log` VALUES (22, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', '1559030915@qq.com', '2020-03-28 17:25:05', 1);
INSERT INTO `email_log` VALUES (23, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', 'taylor74@sina.com', '2020-03-28 17:25:06', 1);
INSERT INTO `email_log` VALUES (24, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', 'bill44@sina.com', '2020-03-28 17:25:07', 1);
INSERT INTO `email_log` VALUES (25, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', 'andy73@126.com', '2020-03-28 17:25:08', 1);
INSERT INTO `email_log` VALUES (26, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', '3694478730@qq.com', '2020-03-28 17:25:08', 1);
INSERT INTO `email_log` VALUES (27, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', 'bill64@sohu.com', '2020-03-28 17:25:09', 1);
INSERT INTO `email_log` VALUES (28, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', '177195365@qq.com', '2020-03-28 17:25:10', 1);
INSERT INTO `email_log` VALUES (29, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', 'marry78@126.com', '2020-03-28 17:25:11', 1);
INSERT INTO `email_log` VALUES (30, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', '378514849@qq.com', '2020-03-28 17:30:38', 1);
INSERT INTO `email_log` VALUES (31, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', 'ben50@sohu.com', '2020-03-28 17:30:40', 1);
INSERT INTO `email_log` VALUES (32, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', '2640268110@qq.com', '2020-03-28 17:30:41', 1);
INSERT INTO `email_log` VALUES (33, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', '130405258@qq.com', '2020-03-28 17:30:42', 1);
INSERT INTO `email_log` VALUES (34, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', '2832087665@qq.com', '2020-03-28 17:30:42', 1);
INSERT INTO `email_log` VALUES (35, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', 'taylor10@163.com', '2020-03-28 17:30:43', 1);
INSERT INTO `email_log` VALUES (36, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', 'edward99@126.com', '2020-03-28 17:30:44', 1);
INSERT INTO `email_log` VALUES (37, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', 'lisa98@sohu.com', '2020-03-28 17:30:45', 1);
INSERT INTO `email_log` VALUES (38, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', 'david74@hotmail.com', '2020-03-28 17:30:46', 1);
INSERT INTO `email_log` VALUES (39, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', 'fiona67@sina.com', '2020-03-28 17:30:47', 1);
INSERT INTO `email_log` VALUES (40, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', '10001@qq.com', '2020-03-28 17:47:34', 1);
INSERT INTO `email_log` VALUES (41, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', '10002@qq.com', '2020-03-28 17:47:35', 1);
INSERT INTO `email_log` VALUES (42, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', '10003@qq.com', '2020-03-28 17:47:36', 1);
INSERT INTO `email_log` VALUES (43, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', '10004@qq.com', '2020-03-28 17:47:37', 1);
INSERT INTO `email_log` VALUES (44, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', 'larry6799@126.com', '2020-03-28 17:47:37', 1);
INSERT INTO `email_log` VALUES (45, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', 'zhangr@ffalcon.cn', '2020-03-28 17:47:38', 1);
INSERT INTO `email_log` VALUES (46, 1, '加油', '<p style=\"text-align: center;\">加油</p>', NULL, 'larry6799@163.com', 'larry6799@126.com', '2020-03-29 21:13:26', 1);
INSERT INTO `email_log` VALUES (47, 1, '加油', '<p style=\"text-align: center;\">加油</p>', NULL, '3335743364@qq.com', 'zhangr@ffalcon.cn', '2020-03-29 21:13:27', 1);
INSERT INTO `email_log` VALUES (48, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, 'larry6799@163.com', 'bill61@yahoo.com', '2020-05-12 16:48:47', 1);
INSERT INTO `email_log` VALUES (49, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, '3335743364@qq.com', '368427853@qq.com', '2020-05-12 16:48:49', 1);
INSERT INTO `email_log` VALUES (50, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, 'larry6799@163.com', '168390632@qq.com', '2020-05-12 16:48:49', 1);
INSERT INTO `email_log` VALUES (51, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, '3335743364@qq.com', '104543563@qq.com', '2020-05-12 16:48:50', 0);
INSERT INTO `email_log` VALUES (52, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, 'larry6799@163.com', 'taylor77@sina.com', '2020-05-12 16:48:50', 1);
INSERT INTO `email_log` VALUES (53, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, '3335743364@qq.com', 'nick22@hotmail.com', '2020-05-12 16:48:51', 1);
INSERT INTO `email_log` VALUES (54, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, 'larry6799@163.com', 'alan97@yahoo.com', '2020-05-12 16:48:52', 1);
INSERT INTO `email_log` VALUES (55, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, '3335743364@qq.com', '75212337@qq.com', '2020-05-12 16:48:53', 0);
INSERT INTO `email_log` VALUES (56, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, 'larry6799@163.com', '35489744@qq.com', '2020-05-12 16:48:53', 1);
INSERT INTO `email_log` VALUES (57, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, '3335743364@qq.com', '272485123@qq.com', '2020-05-12 16:48:54', 1);
INSERT INTO `email_log` VALUES (58, 1, 'ceshi2', '<p>ceshi2</p><p><img src=\"https://oimagea8.ydstatic.com/image?id=-5411507685289819532&amp;product=adpublish&amp;w=520&amp;h=347\"></p>', NULL, 'larry6799@163.com', 'larry6799@126.com', '2020-05-24 17:25:57', 1);
INSERT INTO `email_log` VALUES (59, 1, 'ceshi2', '<p>ceshi2</p><p><img src=\"https://oimagea8.ydstatic.com/image?id=-5411507685289819532&amp;product=adpublish&amp;w=520&amp;h=347\"></p>', NULL, '3335743364@qq.com', 'zhangr@ffalcon.cn', '2020-05-24 17:26:09', 1);
INSERT INTO `email_log` VALUES (232, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', '2640268110@qq.com', '2020-03-27 17:30:41', 1);
INSERT INTO `email_log` VALUES (233, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', '130405258@qq.com', '2020-03-27 17:30:42', 1);
INSERT INTO `email_log` VALUES (234, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', '2832087665@qq.com', '2020-03-27 17:30:42', 1);
INSERT INTO `email_log` VALUES (235, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', 'taylor10@163.com', '2020-03-27 17:30:43', 1);
INSERT INTO `email_log` VALUES (236, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', 'edward99@126.com', '2020-03-27 17:30:44', 1);
INSERT INTO `email_log` VALUES (237, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', 'lisa98@sohu.com', '2020-03-27 17:30:45', 1);
INSERT INTO `email_log` VALUES (238, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', 'david74@hotmail.com', '2020-03-27 17:30:46', 1);
INSERT INTO `email_log` VALUES (239, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', 'fiona67@sina.com', '2020-03-27 17:30:47', 1);
INSERT INTO `email_log` VALUES (240, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', '10001@qq.com', '2020-03-25 17:47:34', 1);
INSERT INTO `email_log` VALUES (241, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', '10002@qq.com', '2020-03-25 17:47:35', 1);
INSERT INTO `email_log` VALUES (242, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', '10003@qq.com', '2020-03-25 17:47:36', 1);
INSERT INTO `email_log` VALUES (243, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', '10004@qq.com', '2020-03-25 17:47:37', 1);
INSERT INTO `email_log` VALUES (244, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', 'larry6799@126.com', '2020-03-26 17:47:37', 1);
INSERT INTO `email_log` VALUES (245, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', 'zhangr@ffalcon.cn', '2020-03-26 17:47:38', 1);
INSERT INTO `email_log` VALUES (246, 1, '加油', '<p style=\"text-align: center;\">加油</p>', NULL, 'larry6799@163.com', 'larry6799@126.com', '2020-03-24 21:13:26', 1);
INSERT INTO `email_log` VALUES (247, 1, '加油', '<p style=\"text-align: center;\">加油</p>', NULL, '3335743364@qq.com', 'zhangr@ffalcon.cn', '2020-03-24 21:13:27', 1);
INSERT INTO `email_log` VALUES (248, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, 'larry6799@163.com', 'bill61@yahoo.com', '2020-05-24 16:48:47', 1);
INSERT INTO `email_log` VALUES (249, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, '3335743364@qq.com', '368427853@qq.com', '2020-05-24 16:48:49', 1);
INSERT INTO `email_log` VALUES (250, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, 'larry6799@163.com', '168390632@qq.com', '2020-05-24 16:48:49', 1);
INSERT INTO `email_log` VALUES (251, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, '3335743364@qq.com', '104543563@qq.com', '2020-05-24 16:48:50', 1);
INSERT INTO `email_log` VALUES (252, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, 'larry6799@163.com', 'taylor77@sina.com', '2020-05-23 16:48:50', 1);
INSERT INTO `email_log` VALUES (253, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, '3335743364@qq.com', 'nick22@hotmail.com', '2020-05-23 16:48:51', 1);
INSERT INTO `email_log` VALUES (254, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, 'larry6799@163.com', 'alan97@yahoo.com', '2020-05-23 16:48:52', 1);
INSERT INTO `email_log` VALUES (332, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', '2640268110@qq.com', '2020-05-25 17:30:41', 1);
INSERT INTO `email_log` VALUES (333, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', '130405258@qq.com', '2020-05-25 17:30:42', 1);
INSERT INTO `email_log` VALUES (334, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', '2832087665@qq.com', '2020-05-25 17:30:42', 1);
INSERT INTO `email_log` VALUES (335, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', 'taylor10@163.com', '2020-05-25 17:30:43', 1);
INSERT INTO `email_log` VALUES (336, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', 'edward99@126.com', '2020-05-25 17:30:44', 1);
INSERT INTO `email_log` VALUES (337, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', 'lisa98@sohu.com', '2020-05-26 17:30:45', 1);
INSERT INTO `email_log` VALUES (338, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', 'david74@hotmail.com', '2020-05-26 17:30:46', 1);
INSERT INTO `email_log` VALUES (339, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', 'fiona67@sina.com', '2020-03-26 17:30:47', 1);
INSERT INTO `email_log` VALUES (340, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', '10001@qq.com', '2020-05-25 17:47:34', 1);
INSERT INTO `email_log` VALUES (341, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', '10002@qq.com', '2020-05-25 17:47:35', 1);
INSERT INTO `email_log` VALUES (342, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', '10003@qq.com', '2020-05-25 17:47:36', 1);
INSERT INTO `email_log` VALUES (343, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', '10004@qq.com', '2020-05-25 17:47:37', 1);
INSERT INTO `email_log` VALUES (344, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', 'larry6799@126.com', '2020-05-26 17:47:37', 1);
INSERT INTO `email_log` VALUES (345, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', 'zhangr@ffalcon.cn', '2020-05-26 17:47:38', 1);
INSERT INTO `email_log` VALUES (346, 1, '加油', '<p style=\"text-align: center;\">加油</p>', NULL, 'larry6799@163.com', 'larry6799@126.com', '2020-05-24 21:13:26', 1);
INSERT INTO `email_log` VALUES (347, 1, '加油', '<p style=\"text-align: center;\">加油</p>', NULL, '3335743364@qq.com', 'zhangr@ffalcon.cn', '2020-05-24 21:13:27', 1);
INSERT INTO `email_log` VALUES (348, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, 'larry6799@163.com', 'bill61@yahoo.com', '2020-05-22 16:48:47', 1);
INSERT INTO `email_log` VALUES (349, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, '3335743364@qq.com', '368427853@qq.com', '2020-05-22 16:48:49', 1);
INSERT INTO `email_log` VALUES (350, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, 'larry6799@163.com', '168390632@qq.com', '2020-05-22 16:48:49', 1);
INSERT INTO `email_log` VALUES (351, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, '3335743364@qq.com', '104543563@qq.com', '2020-05-22 16:48:50', 0);
INSERT INTO `email_log` VALUES (352, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, 'larry6799@163.com', 'taylor77@sina.com', '2020-05-22 16:48:50', 1);
INSERT INTO `email_log` VALUES (353, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, '3335743364@qq.com', 'nick22@hotmail.com', '2020-05-22 16:48:51', 1);
INSERT INTO `email_log` VALUES (354, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, 'larry6799@163.com', 'alan97@yahoo.com', '2020-05-22 16:48:52', 1);
INSERT INTO `email_log` VALUES (355, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, '3335743364@qq.com', '75212337@qq.com', '2020-05-22 16:48:53', 0);
INSERT INTO `email_log` VALUES (356, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, 'larry6799@163.com', '35489744@qq.com', '2020-05-22 16:48:53', 1);
INSERT INTO `email_log` VALUES (357, 1, '测试邮件', '<p style=\"text-align: center;\">西电欢迎您</p><p style=\"text-align: center;\"><img src=\"https://bkimg.cdn.bcebos.com/pic/0b7b02087bf40ad161faed64552c11dfa9ecce1e?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg\"></p><p><br></p>', NULL, '3335743364@qq.com', '272485123@qq.com', '2020-05-22 16:48:54', 1);
INSERT INTO `email_log` VALUES (358, 1, 'ceshi2', '<p>ceshi2</p><p><img src=\"https://oimagea8.ydstatic.com/image?id=-5411507685289819532&amp;product=adpublish&amp;w=520&amp;h=347\"></p>', NULL, 'larry6799@163.com', 'larry6799@126.com', '2020-05-24 17:25:57', 1);
INSERT INTO `email_log` VALUES (359, 1, 'ceshi2', '<p>ceshi2</p><p><img src=\"https://oimagea8.ydstatic.com/image?id=-5411507685289819532&amp;product=adpublish&amp;w=520&amp;h=347\"></p>', NULL, '3335743364@qq.com', 'zhangr@ffalcon.cn', '2020-05-24 17:26:09', 1);
INSERT INTO `email_log` VALUES (360, 1, '测试', '<p>测试</p>', NULL, 'larry6799@163.com', 'larry6799@126.com', '2020-05-27 23:51:28', 1);
INSERT INTO `email_log` VALUES (361, 1, '测试', '<p>测试</p>', NULL, 'larry6799@163.com', 'larry6799@126.com', '2020-05-27 23:51:33', 1);
INSERT INTO `email_log` VALUES (362, 1, '测试', '<p>测试</p>', NULL, '3335743364@qq.com', 'zhangr@ffalcon.cn', '2020-05-27 23:51:54', 1);
INSERT INTO `email_log` VALUES (363, 1, '测试', '<p>测试</p>', NULL, 'larry6799@163.com', 'larry6799@126.com', '2020-05-27 23:52:05', 1);
INSERT INTO `email_log` VALUES (364, 1, '测试', '<p>测试</p>', NULL, '3335743364@qq.com', 'zhangr@ffalcon.cn', '2020-05-27 23:52:06', 1);
INSERT INTO `email_log` VALUES (365, 1, '测试', '<p>测试</p>', NULL, '3335743364@qq.com', 'zhangr@ffalcon.cn', '2020-05-27 23:52:16', 1);
INSERT INTO `email_log` VALUES (432, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', '2640268110@qq.com', '2020-04-25 17:30:41', 1);
INSERT INTO `email_log` VALUES (433, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', '130405258@qq.com', '2020-04-25 17:30:42', 1);
INSERT INTO `email_log` VALUES (434, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', '2832087665@qq.com', '2020-04-25 17:30:42', 1);
INSERT INTO `email_log` VALUES (435, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', 'taylor10@163.com', '2020-04-25 17:30:43', 1);
INSERT INTO `email_log` VALUES (436, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', 'edward99@126.com', '2020-04-25 17:30:44', 1);
INSERT INTO `email_log` VALUES (437, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', 'lisa98@sohu.com', '2020-04-26 17:30:45', 1);
INSERT INTO `email_log` VALUES (438, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', 'david74@hotmail.com', '2020-04-26 17:30:46', 1);
INSERT INTO `email_log` VALUES (439, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', 'fiona67@sina.com', '2020-04-26 17:30:47', 1);
INSERT INTO `email_log` VALUES (440, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', '10001@qq.com', '2020-04-25 17:47:34', 1);
INSERT INTO `email_log` VALUES (441, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', '10002@qq.com', '2020-04-25 17:47:35', 1);
INSERT INTO `email_log` VALUES (442, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', '10003@qq.com', '2020-04-25 17:47:36', 1);
INSERT INTO `email_log` VALUES (443, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', '10004@qq.com', '2020-04-25 17:47:37', 1);
INSERT INTO `email_log` VALUES (444, 2, '测试邮件', '<p>你好</p>', '图片1.png', 'larry6799@163.com', 'larry6799@126.com', '2020-04-24 17:47:37', 1);
INSERT INTO `email_log` VALUES (445, 2, '测试邮件', '<p>你好</p>', '图片1.png', '3335743364@qq.com', 'zhangr@ffalcon.cn', '2020-04-26 17:47:38', 1);
INSERT INTO `email_log` VALUES (446, 1, '加油', '<p style=\"text-align: center;\">加油</p>', NULL, 'larry6799@163.com', 'larry6799@126.com', '2020-04-24 21:13:26', 1);
INSERT INTO `email_log` VALUES (447, 1, '加油', '<p style=\"text-align: center;\">加油</p>', NULL, '3335743364@qq.com', 'zhangr@ffalcon.cn', '2020-04-24 21:13:27', 1);
INSERT INTO `email_log` VALUES (448, 2, 'xidian', '<p style=\"text-align: center;\">西电毕业设计测试</p><p style=\"text-align: center;\"><a href=\"http://cs.xidian.edu.cn\" rel=\"noopener noreferrer\" target=\"_blank\"><img src=\"http://qamgq6pnv.bkt.clouddn.com/139c624a4dbb41d088154ddf1c4896d9.png\"></a></p><p style=\"text-align: center;\">欢迎加入西安电子科技大学！</p>', NULL, 'larry6799@163.com', 'larry6799@126.com', '2020-05-28 00:14:58', 1);
INSERT INTO `email_log` VALUES (449, 2, 'xidian', '<p style=\"text-align: center;\">西电毕业设计测试</p><p style=\"text-align: center;\"><a href=\"http://cs.xidian.edu.cn\" rel=\"noopener noreferrer\" target=\"_blank\"><img src=\"http://qamgq6pnv.bkt.clouddn.com/139c624a4dbb41d088154ddf1c4896d9.png\"></a></p><p style=\"text-align: center;\">欢迎加入西安电子科技大学！</p>', NULL, '3335743364@qq.com', 'zhangr@ffalcon.cn', '2020-05-28 00:15:09', 1);
INSERT INTO `email_log` VALUES (450, 2, 'xidian', '<p style=\"text-align: center;\">西电毕业设计测试</p><p style=\"text-align: center;\"><a href=\"http://cs.xidian.edu.cn\" rel=\"noopener noreferrer\" target=\"_blank\"><img src=\"http://qamgq6pnv.bkt.clouddn.com/139c624a4dbb41d088154ddf1c4896d9.png\"></a></p><p style=\"text-align: center;\">欢迎加入西安电子科技大学！</p>', '测试excel.xlsx', 'larry6799@163.com', 'larry6799@126.com', '2020-05-28 00:15:42', 1);
INSERT INTO `email_log` VALUES (451, 2, 'xidian', '<p style=\"text-align: center;\">西电毕业设计测试</p><p style=\"text-align: center;\"><a href=\"http://cs.xidian.edu.cn\" rel=\"noopener noreferrer\" target=\"_blank\"><img src=\"http://qamgq6pnv.bkt.clouddn.com/139c624a4dbb41d088154ddf1c4896d9.png\"></a></p><p style=\"text-align: center;\">欢迎加入西安电子科技大学！</p>', '测试excel.xlsx', '3335743364@qq.com', 'zhangr@ffalcon.cn', '2020-05-28 00:15:53', 1);
INSERT INTO `email_log` VALUES (452, 1, '测试一下图片', '<p style=\"text-align: center;\"><br></p><p style=\"text-align: center;\">欢迎加入西安电子科技大学</p><p style=\"text-align: center;\"><a href=\"http://cs.xidian.edu.cn\" rel=\"noopener noreferrer\" target=\"_blank\"><img src=\"http://qamgq6pnv.bkt.clouddn.com/4654c294889042a4a5eb7651ee283535.png\"></a></p><p style=\"text-align: center;\">感谢有你</p>', '测试excel.xlsx', 'larry6799@163.com', 'larry6799@126.com', '2020-05-28 08:02:21', 1);
INSERT INTO `email_log` VALUES (453, 1, '测试一下图片', '<p style=\"text-align: center;\"><br></p><p style=\"text-align: center;\">欢迎加入西安电子科技大学</p><p style=\"text-align: center;\"><a href=\"http://cs.xidian.edu.cn\" rel=\"noopener noreferrer\" target=\"_blank\"><img src=\"http://qamgq6pnv.bkt.clouddn.com/4654c294889042a4a5eb7651ee283535.png\"></a></p><p style=\"text-align: center;\">感谢有你</p>', '测试excel.xlsx', '3335743364@qq.com', 'zhangr@ffalcon.cn', '2020-05-28 08:02:35', 1);
INSERT INTO `email_log` VALUES (454, 1, '测试邮件', '<p style=\"text-align: center;\">西电</p><p style=\"text-align: center;\"><a href=\"http://cs.xidian.edu.cn\" rel=\"noopener noreferrer\" target=\"_blank\"><img src=\"http://qamgq6pnv.bkt.clouddn.com/cb48078f46c746d7919aabd6cd23764a.png\"></a></p>', '测试excel.xlsx', 'larry6799@163.com', '1648637120@qq.com', '2020-05-28 09:02:04', 1);
INSERT INTO `email_log` VALUES (455, 1, '测试邮件', '<p style=\"text-align: center;\">西电</p><p style=\"text-align: center;\"><a href=\"http://cs.xidian.edu.cn\" rel=\"noopener noreferrer\" target=\"_blank\"><img src=\"http://qamgq6pnv.bkt.clouddn.com/cb48078f46c746d7919aabd6cd23764a.png\"></a></p>', '测试excel.xlsx', '3335743364@qq.com', 'yubin@mail.xidian.edu.cn', '2020-05-28 09:02:15', 1);
INSERT INTO `email_log` VALUES (456, 1, '测试邮件', '<p style=\"text-align: center;\">西电</p><p style=\"text-align: center;\"><a href=\"http://cs.xidian.edu.cn\" rel=\"noopener noreferrer\" target=\"_blank\"><img src=\"http://qamgq6pnv.bkt.clouddn.com/cb48078f46c746d7919aabd6cd23764a.png\"></a></p>', '测试excel.xlsx', 'larry6799@163.com', 'qyu_ing@163.com', '2020-05-28 09:02:26', 1);
INSERT INTO `email_log` VALUES (457, 1, '测试邮件', '<p style=\"text-align: center;\">西电</p><p style=\"text-align: center;\"><a href=\"http://cs.xidian.edu.cn\" rel=\"noopener noreferrer\" target=\"_blank\"><img src=\"http://qamgq6pnv.bkt.clouddn.com/cb48078f46c746d7919aabd6cd23764a.png\"></a></p>', '测试excel.xlsx', '3335743364@qq.com', 'shuzhenwang@xidian.edu.cn', '2020-05-28 09:02:37', 1);
COMMIT;

-- ----------------------------
-- Table structure for email_user
-- ----------------------------
DROP TABLE IF EXISTS `email_user`;
CREATE TABLE `email_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `group_id` int(11) NOT NULL COMMENT '分组ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `lose_flag` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8mb4 COMMENT='客户表';

-- ----------------------------
-- Records of email_user
-- ----------------------------
BEGIN;
INSERT INTO `email_user` VALUES (175, '10001@qq.com', 'zhao1', 42, '2020-03-11 21:21:43', NULL, 0);
INSERT INTO `email_user` VALUES (176, '10002@qq.com', 'zhao2', 42, '2020-03-11 21:21:43', NULL, 0);
INSERT INTO `email_user` VALUES (177, '10003@qq.com', 'zhao3', 42, '2020-03-11 21:21:43', NULL, 0);
INSERT INTO `email_user` VALUES (178, '10004@qq.com', 'zhao4', 42, '2020-03-11 21:21:43', NULL, 0);
INSERT INTO `email_user` VALUES (179, 'larry6799@126.com', '张三', 43, '2020-03-11 21:22:32', NULL, 0);
INSERT INTO `email_user` VALUES (180, 'zhangr@ffalcon.cn', '张四', 43, '2020-03-11 21:22:32', NULL, 0);
INSERT INTO `email_user` VALUES (181, 'zhao101@qq.com', '赵1', 44, '2020-03-11 21:27:13', NULL, 0);
INSERT INTO `email_user` VALUES (182, 'zhao102@qq.com', '赵2', 44, '2020-03-11 21:27:13', NULL, 0);
INSERT INTO `email_user` VALUES (183, 'zhao103@qq.com', '赵3', 44, '2020-03-11 21:27:13', NULL, 0);
INSERT INTO `email_user` VALUES (184, 'zhao104@qq.com', '赵4', 44, '2020-03-11 21:27:13', NULL, 0);
INSERT INTO `email_user` VALUES (185, 'zhao105@qq.com', '赵5', 44, '2020-03-11 21:27:13', NULL, 0);
INSERT INTO `email_user` VALUES (186, 'zhao106@qq.com', '赵6', 44, '2020-03-11 21:27:13', NULL, 0);
INSERT INTO `email_user` VALUES (187, 'zhao107@qq.com', '赵7', 44, '2020-03-11 21:27:13', NULL, 0);
INSERT INTO `email_user` VALUES (188, 'zhao108@qq.com', '赵8', 44, '2020-03-11 21:27:13', NULL, 0);
INSERT INTO `email_user` VALUES (189, 'zhao109@qq.com', '赵9', 44, '2020-03-11 21:27:13', NULL, 0);
INSERT INTO `email_user` VALUES (190, 'zhao110@qq.com', '赵10', 44, '2020-03-11 21:27:13', NULL, 0);
INSERT INTO `email_user` VALUES (191, 'zhao111@163.com', '赵11', 44, '2020-03-11 21:27:13', NULL, 0);
INSERT INTO `email_user` VALUES (192, 'zhao112@163.com', '赵12', 44, '2020-03-11 21:27:13', NULL, 0);
INSERT INTO `email_user` VALUES (193, 'zhao113@163.com', '赵13', 44, '2020-03-11 21:27:13', NULL, 0);
INSERT INTO `email_user` VALUES (194, 'zhao114@163.com', '赵14', 44, '2020-03-11 21:27:13', NULL, 0);
INSERT INTO `email_user` VALUES (195, 'zhao115@163.com', '赵15', 44, '2020-03-11 21:27:13', NULL, 0);
INSERT INTO `email_user` VALUES (196, 'zhao116@163.com', '赵16', 44, '2020-03-11 21:27:13', NULL, 0);
INSERT INTO `email_user` VALUES (197, 'zhao117@163.com', '赵17', 44, '2020-03-11 21:27:13', NULL, 0);
INSERT INTO `email_user` VALUES (198, 'zhao118@163.com', '赵18', 44, '2020-03-11 21:27:13', NULL, 0);
INSERT INTO `email_user` VALUES (199, 'zhao119@163.com', '赵19', 44, '2020-03-11 21:27:13', NULL, 0);
INSERT INTO `email_user` VALUES (200, 'zhao120@gmail.com', '赵20', 44, '2020-03-11 21:27:13', NULL, 0);
INSERT INTO `email_user` VALUES (201, '1648637120@qq.com', '张瑞QQ邮箱', 45, '2020-03-27 23:14:23', NULL, 0);
INSERT INTO `email_user` VALUES (202, 'yubin@mail.xidian.edu.cn', '鱼老师', 45, '2020-03-27 23:14:23', NULL, 0);
INSERT INTO `email_user` VALUES (203, 'qyu_ing@163.com', '于老师', 45, '2020-03-27 23:14:23', NULL, 0);
INSERT INTO `email_user` VALUES (204, 'shuzhenwang@xidian.edu.cn', '王老师', 45, '2020-03-27 23:14:23', NULL, 0);
INSERT INTO `email_user` VALUES (205, '1648637120@qq.com', '张瑞QQ邮箱', 46, '2020-03-28 08:47:49', NULL, 0);
INSERT INTO `email_user` VALUES (206, 'yubin@mail.xidian.edu.cn', '鱼老师', 46, '2020-03-28 08:47:49', NULL, 0);
INSERT INTO `email_user` VALUES (207, 'qyu_ing@163.com', '于老师', 46, '2020-03-28 08:47:49', NULL, 0);
INSERT INTO `email_user` VALUES (208, 'shuzhenwang@xidian.edu.cn', '王老师', 46, '2020-03-28 08:47:49', NULL, 0);
INSERT INTO `email_user` VALUES (214, '12345678@qq.com', 'mike', 48, '2020-05-28 09:00:41', NULL, 0);
INSERT INTO `email_user` VALUES (215, '12345679@qq.com', 'nike', 48, '2020-05-28 09:00:41', NULL, 0);
INSERT INTO `email_user` VALUES (216, '12345680@qq.com', 'larry', 48, '2020-05-28 09:00:41', NULL, 0);
INSERT INTO `email_user` VALUES (217, '12345681@qq.com', 'lucy', 48, '2020-05-28 09:00:41', NULL, 0);
INSERT INTO `email_user` VALUES (218, '12345682@qq.com', 'lili', 48, '2020-05-28 09:00:41', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
BEGIN;
INSERT INTO `sys_captcha` VALUES ('03f3cfd6-b3ed-44b4-8833-0cd82143a835', 'a676b', '2020-03-12 12:26:28');
INSERT INTO `sys_captcha` VALUES ('04a2d06b-ab4c-4674-879a-e8ec7e80661c', 'mg3ff', '2020-05-28 07:54:28');
INSERT INTO `sys_captcha` VALUES ('07b26a07-8d42-47e2-8b8b-950849b9b4da', 'pm76c', '2020-03-24 19:06:56');
INSERT INTO `sys_captcha` VALUES ('08e30bdf-8174-464a-8211-d3503a206321', 'f585d', '2020-03-19 13:06:59');
INSERT INTO `sys_captcha` VALUES ('09675525-6bd9-4a36-8881-e8152f6aa28b', 'd6a7y', '2020-03-28 08:28:11');
INSERT INTO `sys_captcha` VALUES ('0cf1abae-4bcb-476a-89ed-910cc1ac56b8', '2nx6p', '2020-03-11 12:05:32');
INSERT INTO `sys_captcha` VALUES ('1', '62wyx', '2020-03-19 15:12:48');
INSERT INTO `sys_captcha` VALUES ('195ad9b4-c32a-484a-8136-c18870862758', 'd364f', '2020-03-10 15:21:53');
INSERT INTO `sys_captcha` VALUES ('1a837f29-4bd4-44fe-8a3e-0f047712d5df', 'c4y3a', '2020-03-11 16:47:22');
INSERT INTO `sys_captcha` VALUES ('1c9d86b1-dde8-4bd6-898b-2ea0d1368fde', '5anwb', '2020-03-10 15:21:22');
INSERT INTO `sys_captcha` VALUES ('23a3ac39-49eb-43d4-8a30-57b1cdffcd98', '76wdm', '2020-03-12 12:28:54');
INSERT INTO `sys_captcha` VALUES ('259254eb-e81c-40a7-8ab8-ee21aa677a05', '8w6px', '2020-03-06 20:05:42');
INSERT INTO `sys_captcha` VALUES ('443c0fe5-4135-46e5-864f-6090c9911d73', '3g8cc', '2020-03-11 12:10:39');
INSERT INTO `sys_captcha` VALUES ('458f4af0-d021-4b26-891e-8a3a68ab5e17', 'xfgfc', '2020-05-08 10:43:38');
INSERT INTO `sys_captcha` VALUES ('48437edd-a00f-4e21-8392-614aab27596e', 'n2cfc', '2020-03-11 12:25:49');
INSERT INTO `sys_captcha` VALUES ('4fcf7367-4dd7-48c5-856b-cf83c74cf142', 'wn52e', '2020-03-11 12:08:34');
INSERT INTO `sys_captcha` VALUES ('84e59ec3-5b88-4dd3-8da0-11b6b1926726', '6afef', '2020-03-10 15:19:54');
INSERT INTO `sys_captcha` VALUES ('85fd77f9-3815-4de1-8947-329eff66c000', 'b43en', '2020-03-11 11:42:04');
INSERT INTO `sys_captcha` VALUES ('9693a79d-0f5b-414e-829d-603d0a7f4b3a', 'med66', '2020-05-08 12:13:11');
INSERT INTO `sys_captcha` VALUES ('a488337e-c3a5-40a9-8975-e6580764e840', 'a3w6e', '2020-03-12 12:33:01');
INSERT INTO `sys_captcha` VALUES ('ae127182-23ff-479b-8d8f-a9c6011802e5', 'pdwd7', '2020-03-17 14:36:50');
INSERT INTO `sys_captcha` VALUES ('b5c12a4c-742e-4365-86a0-dcb3d702ba98', '7ppgw', '2020-05-12 16:28:30');
INSERT INTO `sys_captcha` VALUES ('c0ba1402-10fb-4fab-849c-486fa26f1746', '7yx57', '2020-03-25 09:43:36');
INSERT INTO `sys_captcha` VALUES ('c2e839d1-fb98-4563-8091-d37081d630c4', 'fy57a', '2020-03-11 12:19:15');
INSERT INTO `sys_captcha` VALUES ('c9c34dab-6af5-4ba8-8e2c-1511426933e2', 'ypdmb', '2020-03-11 12:28:27');
INSERT INTO `sys_captcha` VALUES ('c9e1459f-3111-4796-80b9-f6cc3bea066d', 'n2afw', '2020-03-20 10:39:30');
INSERT INTO `sys_captcha` VALUES ('ca43e821-aaee-409b-8db0-835899d0f9f1', '5wmfn', '2020-03-11 10:05:50');
INSERT INTO `sys_captcha` VALUES ('d67d0fd7-9fb3-4797-8c8a-50c6c0aff0d9', '2becn', '2020-03-11 22:09:27');
INSERT INTO `sys_captcha` VALUES ('dcb05c3c-03ec-4e63-8d80-f2a3986f20b2', '8a82y', '2020-03-21 21:31:48');
INSERT INTO `sys_captcha` VALUES ('dd793dab-55d9-49c4-88be-1cad67dca20b', 'bwb5n', '2020-03-12 16:43:51');
INSERT INTO `sys_captcha` VALUES ('ef73ba36-2b3c-4809-82ec-1fb2f2cbe9da', 'ym4dn', '2020-03-11 12:24:21');
INSERT INTO `sys_captcha` VALUES ('f38fc950-ce86-45d5-8867-1a41a2e9b67f', 'efnff', '2020-03-27 23:08:23');
INSERT INTO `sys_captcha` VALUES ('fc2dbc60-5036-494b-83b4-d82b5dbbec78', 'xem4w', '2020-03-06 20:05:46');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');
INSERT INTO `sys_config` VALUES (2, '百度', 'baidu.com', 1, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES (1, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[6]', 0, '0:0:0:0:0:0:0:1', '2020-03-06 21:10:54');
INSERT INTO `sys_log` VALUES (2, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[30]', 0, '0:0:0:0:0:0:0:1', '2020-03-06 21:11:06');
INSERT INTO `sys_log` VALUES (3, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[31]', 0, '0:0:0:0:0:0:0:1', '2020-03-06 21:27:52');
INSERT INTO `sys_log` VALUES (4, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"admin\",\"password\":\"9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@163.com\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":1}]', 841, '0:0:0:0:0:0:0:1', '2020-03-06 21:40:18');
INSERT INTO `sys_log` VALUES (5, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"普通用户\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,-666666],\"createTime\":\"Mar 6, 2020 9:47:29 PM\"}]', 2006, '0:0:0:0:0:0:0:1', '2020-03-06 21:47:31');
INSERT INTO `sys_log` VALUES (6, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":2,\"username\":\"zr\",\"password\":\"95f803f676efef1b252a2a030dfc412aba37105e73431c395eb23858272a3cde\",\"salt\":\"mrYHAutjyLv8x4WhGqnu\",\"email\":\"123456@zr.cn\",\"mobile\":\"13822226666\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Mar 6, 2020 9:51:30 PM\"}]', 1944, '0:0:0:0:0:0:0:1', '2020-03-06 21:51:32');
INSERT INTO `sys_log` VALUES (7, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":3,\"username\":\"xixi\",\"password\":\"e15b8d10f6c60fd85df43b0d86b59257e37314e644962bca8da4bf64bc82a3ab\",\"salt\":\"ytMirBGhOX96zM3yiaXQ\",\"email\":\"123456@xx.com\",\"mobile\":\"13688889999\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Mar 6, 2020 9:53:27 PM\"}]', 1823, '0:0:0:0:0:0:0:1', '2020-03-06 21:53:30');
INSERT INTO `sys_log` VALUES (8, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":3,\"parentId\":1,\"name\":\"角色管理\",\"url\":\"sys/role\",\"type\":1,\"icon\":\"geren\",\"orderNum\":2}]', 1840, '0:0:0:0:0:0:0:1', '2020-03-06 22:42:56');
INSERT INTO `sys_log` VALUES (9, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"普通用户\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,-666666]}]', 554, '0:0:0:0:0:0:0:1', '2020-03-10 15:15:46');
INSERT INTO `sys_log` VALUES (10, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":41,\"parentId\":31,\"name\":\"数据可视化\",\"url\":\"user/data\",\"perms\":\"\",\"type\":1,\"icon\":\"zonghe\",\"orderNum\":0}]', 224, '127.0.0.1', '2020-03-24 18:56:08');
INSERT INTO `sys_log` VALUES (11, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":4,\"username\":\"ww\",\"password\":\"e0477b3847cb8933748da143db193a161f16f4f3d09d15184eda30b403e47392\",\"salt\":\"FYmhN69Q8XYjQ6Oot4m3\",\"email\":\"ww@126.com\",\"mobile\":\"13866662222\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Mar 25, 2020 9:41:42 AM\"}]', 461, '127.0.0.1', '2020-03-25 09:41:43');
INSERT INTO `sys_log` VALUES (12, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"普通用户\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,41,-666666]}]', 640, '127.0.0.1', '2020-03-26 18:10:03');
INSERT INTO `sys_log` VALUES (13, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"普通用户\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[32,33,-666666,31]}]', 671, '127.0.0.1', '2020-03-26 18:11:05');
INSERT INTO `sys_log` VALUES (14, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"普通用户\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,41,-666666]}]', 521, '127.0.0.1', '2020-03-26 18:12:06');
INSERT INTO `sys_log` VALUES (15, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"普通用户\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[32,33,34,-666666,31]}]', 236, '127.0.0.1', '2020-03-26 18:12:34');
INSERT INTO `sys_log` VALUES (16, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"普通用户\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[31,32,33,34,41,-666666]}]', 138, '127.0.0.1', '2020-03-26 18:13:04');
INSERT INTO `sys_log` VALUES (17, 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '[{\"id\":2,\"paramKey\":\"百度\",\"paramValue\":\"baidu.com\",\"remark\":\"\"}]', 255, '127.0.0.1', '2020-03-26 20:30:08');
INSERT INTO `sys_log` VALUES (18, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":5,\"username\":\"zhangsan\",\"password\":\"c0349ed756e9fcc2ff389ca5e7945d4cc219e00af4294c2db523764e555148c6\",\"salt\":\"83A11P79aelBT9nxq7mf\",\"email\":\"zhangsan@qq.com\",\"mobile\":\"13526678897\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"May 8, 2020 10:46:37 AM\"}]', 732, '127.0.0.1', '2020-05-08 10:46:38');
INSERT INTO `sys_log` VALUES (19, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":4,\"username\":\"ww\",\"salt\":\"FYmhN69Q8XYjQ6Oot4m3\",\"email\":\"ww@126.com\",\"mobile\":\"13866662222\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', 119, '127.0.0.1', '2020-05-28 07:47:58');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'system', 0);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'geren', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'http://localhost:8080/renren-fast/druid/sql.html', NULL, 1, 'sql', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '接口文档', 'http://localhost:8080/renren-fast/swagger/index.html', NULL, 1, 'bianji', 5);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'sys/log', 'sys:log:list', 1, 'log', 7);
INSERT INTO `sys_menu` VALUES (31, 0, '功能台', '', '', 0, 'role', 0);
INSERT INTO `sys_menu` VALUES (32, 31, '客户管理', 'user/emailUserManage', '', 1, 'geren', 10);
INSERT INTO `sys_menu` VALUES (33, 31, '邮件发送', 'user/send', '', 1, 'daohang', 11);
INSERT INTO `sys_menu` VALUES (34, 31, '邮件日志', 'user/emailLog', '', 1, 'duanxin', 12);
INSERT INTO `sys_menu` VALUES (41, 31, '数据可视化', 'user/data', '', 1, 'zonghe', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '普通用户', '', 1, '2020-03-06 21:47:29');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (32, 1, 31);
INSERT INTO `sys_role_menu` VALUES (33, 1, 32);
INSERT INTO `sys_role_menu` VALUES (34, 1, 33);
INSERT INTO `sys_role_menu` VALUES (35, 1, 34);
INSERT INTO `sys_role_menu` VALUES (36, 1, 41);
INSERT INTO `sys_role_menu` VALUES (37, 1, -666666);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@163.com', '13612345678', 1, 1, '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES (2, 'zr', '95f803f676efef1b252a2a030dfc412aba37105e73431c395eb23858272a3cde', 'mrYHAutjyLv8x4WhGqnu', '123456@zr.cn', '13822226666', 1, 1, '2020-03-06 21:51:30');
INSERT INTO `sys_user` VALUES (3, 'xixi', 'e15b8d10f6c60fd85df43b0d86b59257e37314e644962bca8da4bf64bc82a3ab', 'ytMirBGhOX96zM3yiaXQ', '123456@xx.com', '13688889999', 1, 1, '2020-03-06 21:53:28');
INSERT INTO `sys_user` VALUES (4, 'ww', 'e0477b3847cb8933748da143db193a161f16f4f3d09d15184eda30b403e47392', 'FYmhN69Q8XYjQ6Oot4m3', 'ww@126.com', '13866662222', 1, 1, '2020-03-25 09:41:42');
INSERT INTO `sys_user` VALUES (5, 'zhangsan', 'c0349ed756e9fcc2ff389ca5e7945d4cc219e00af4294c2db523764e555148c6', '83A11P79aelBT9nxq7mf', 'zhangsan@qq.com', '13526678897', 1, 1, '2020-05-08 10:46:38');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 2, 1);
INSERT INTO `sys_user_role` VALUES (2, 3, 1);
INSERT INTO `sys_user_role` VALUES (3, 5, 1);
INSERT INTO `sys_user_role` VALUES (4, 4, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_token` VALUES (1, 'e2afc528135240f94d8141b0be86b742', '2020-05-28 11:41:02', '2020-05-27 23:41:02');
INSERT INTO `sys_user_token` VALUES (2, '83f0b6e02c45ecad497f3512ce6ef93f', '2020-05-28 11:40:22', '2020-05-27 23:40:22');
INSERT INTO `sys_user_token` VALUES (4, 'a44c0c9a084d4f670f8db1663780db95', '2020-05-28 19:47:43', '2020-05-28 07:47:43');
COMMIT;

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `group_name` varchar(100) DEFAULT NULL COMMENT '分组名',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `user_id` bigint(20) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COMMENT='客户分组表';

-- ----------------------------
-- Records of user_group
-- ----------------------------
BEGIN;
INSERT INTO `user_group` VALUES (42, '公共14', '2020-03-11 21:21:43', NULL, 1);
INSERT INTO `user_group` VALUES (43, 'zr分组1', '2020-03-11 21:22:32', NULL, 2);
INSERT INTO `user_group` VALUES (44, '赵二十', '2020-03-11 21:27:13', NULL, 3);
INSERT INTO `user_group` VALUES (45, '公共中期答辩老师分组', '2020-03-27 23:14:23', NULL, 1);
INSERT INTO `user_group` VALUES (46, '公共测试', '2020-03-28 08:47:49', NULL, 1);
INSERT INTO `user_group` VALUES (48, '测试22', '2020-05-28 09:00:41', NULL, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
