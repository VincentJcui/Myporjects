-- MySQL dump 10.13  Distrib 5.7.12, for Linux (x86_64)
--
-- Host: localhost    Database: oop
-- ------------------------------------------------------
-- Server version	5.7.12-0ubuntu1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `backupServerMonitor`
--

DROP TABLE IF EXISTS `backupServerMonitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backupServerMonitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qufu` varchar(30) DEFAULT NULL COMMENT '区服',
  `hostname` varchar(45) NOT NULL COMMENT '主机名',
  `wan_ip` varchar(15) DEFAULT NULL COMMENT '外网IP',
  `backNum` int(10) DEFAULT NULL COMMENT '备份个数',
  `backName` varchar(45) DEFAULT NULL COMMENT '最新备份文名',
  `backSize` varchar(15) DEFAULT NULL COMMENT '最新备份大小',
  PRIMARY KEY (`id`,`hostname`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 COMMENT='虚拟化的服务器mongo传到backupServer上对其mongo的监控';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_frame_rate`
--

DROP TABLE IF EXISTS `battle_frame_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_frame_rate` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `ptname` varchar(64) NOT NULL COMMENT '平台',
  `date` datetime NOT NULL COMMENT '日期',
  `frame_49` float(5,2) NOT NULL COMMENT '49帧以下',
  `frame_55` float(5,2) NOT NULL COMMENT '49-55帧',
  `frame_60` float(5,2) NOT NULL COMMENT '55帧以上',
  `frame_49_new` float(5,2) NOT NULL COMMENT '新手49帧以下',
  `frame_55_new` float(5,2) NOT NULL COMMENT '新手49-55帧',
  `frame_60_new` float(5,2) NOT NULL COMMENT '新手55帧以上',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=465 DEFAULT CHARSET=utf8 COMMENT='战斗帧率统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cabinet`
--

DROP TABLE IF EXISTS `cabinet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cabinet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `idc_id` int(11) DEFAULT NULL COMMENT '所在机房ID',
  `bandwidth` varchar(50) DEFAULT NULL COMMENT '带宽',
  `money` varchar(50) DEFAULT NULL COMMENT '费用',
  `agreement_date` date DEFAULT NULL COMMENT '协议签署日期',
  `u_num` varchar(10) DEFAULT NULL COMMENT 'U位',
  `switch_num` varchar(10) DEFAULT NULL COMMENT '交换机个数',
  `server_num` int(10) DEFAULT NULL COMMENT '服务器数量',
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='机柜表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `codePublish`
--

DROP TABLE IF EXISTS `codePublish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codePublish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(10) NOT NULL COMMENT '代码版本号',
  `introduction` varchar(100) NOT NULL COMMENT '发布说明',
  `username` varchar(20) NOT NULL COMMENT '发布人',
  `date` varchar(30) NOT NULL COMMENT '发布日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_day`
--

DROP TABLE IF EXISTS `data_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qufu` varchar(30) DEFAULT NULL COMMENT '区服',
  `platform` int(11) DEFAULT NULL COMMENT '平台ID',
  `serverid` int(11) DEFAULT NULL COMMENT 'ServerID',
  `data_date` date DEFAULT NULL COMMENT '日期',
  `new_reg_user_num` int(30) DEFAULT NULL COMMENT '新增注册用户数',
  `login_user_num` int(30) DEFAULT NULL COMMENT '登录用户数',
  `user_login_num` int(30) DEFAULT NULL COMMENT '用户登录次数',
  `pay_user_num` int(30) DEFAULT NULL COMMENT '付费用户数',
  `pay_num` int(30) DEFAULT NULL COMMENT '付费次数',
  `pay_user_ARPU` double DEFAULT NULL COMMENT '付费用户ARPU',
  `avg_online` double DEFAULT NULL COMMENT '平均在线',
  `mountain_online` double DEFAULT NULL COMMENT '峰值在线',
  `avg_online_ARPU` double DEFAULT NULL COMMENT '平均在线ARPU',
  `login_user_pay_trans_rate` double DEFAULT NULL COMMENT '登录用户付费转化率',
  `new_reg_user_pay_transe_rate` double DEFAULT NULL COMMENT '新增注册用户付费转化率',
  `pay_money` int(30) DEFAULT NULL COMMENT '充值金额',
  `new_pay_user_num` int(30) DEFAULT NULL COMMENT '新增付费用户数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3418 DEFAULT CHARSET=utf8 COMMENT='游戏数据日统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_month`
--

DROP TABLE IF EXISTS `data_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_month` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qufu` varchar(30) DEFAULT NULL COMMENT '区服',
  `platform` int(11) DEFAULT NULL COMMENT '平台ID',
  `serverid` int(11) DEFAULT NULL COMMENT 'ServerID',
  `data_date` date DEFAULT NULL COMMENT '日期',
  `new_reg_user_num` int(30) DEFAULT NULL COMMENT '新增注册用户数',
  `login_user_num` int(30) DEFAULT NULL COMMENT '登录用户数',
  `user_login_num` int(30) DEFAULT NULL COMMENT '用户登录次数',
  `pay_user_num` int(30) DEFAULT NULL COMMENT '付费用户数',
  `pay_num` int(30) DEFAULT NULL COMMENT '付费次数',
  `pay_user_ARPU` double DEFAULT NULL COMMENT '付费用户ARPU',
  `avg_online` double DEFAULT NULL COMMENT '平均在线',
  `mountain_online` double DEFAULT NULL COMMENT '峰值在线',
  `avg_online_ARPU` double DEFAULT NULL COMMENT '平均在线ARPU',
  `login_user_pay_trans_rate` double DEFAULT NULL COMMENT '登录用户付费转化率',
  `new_reg_user_pay_transe_rate` double DEFAULT NULL COMMENT '新增注册用户付费转化率',
  `pay_money` int(30) DEFAULT NULL COMMENT '充值金额',
  `new_pay_user_num` int(30) DEFAULT NULL COMMENT '新增付费用户数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3410 DEFAULT CHARSET=utf8 COMMENT='游戏数据月统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_total`
--

DROP TABLE IF EXISTS `data_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_total` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qufu` varchar(30) DEFAULT NULL COMMENT '区服',
  `platform` int(11) DEFAULT NULL COMMENT '平台ID',
  `serverid` int(11) DEFAULT NULL COMMENT 'ServerID',
  `data_date` date DEFAULT NULL COMMENT '日期',
  `new_reg_user_num` int(30) DEFAULT NULL COMMENT '新增注册用户数',
  `login_user_num` int(30) DEFAULT NULL COMMENT '登录用户数',
  `user_login_num` int(30) DEFAULT NULL COMMENT '用户登录次数',
  `pay_user_num` int(30) DEFAULT NULL COMMENT '付费用户数',
  `pay_num` int(30) DEFAULT NULL COMMENT '付费次数',
  `pay_user_ARPU` double DEFAULT NULL COMMENT '付费用户ARPU',
  `mountain_online` double DEFAULT NULL COMMENT '峰值在线',
  `login_user_pay_trans_rate` double DEFAULT NULL COMMENT '登录用户付费转化率',
  `total_reg_user_pay_transe_rate` double DEFAULT NULL COMMENT '总注册用户付费转化率',
  `pay_money` int(30) DEFAULT NULL COMMENT '充值金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3410 DEFAULT CHARSET=utf8 COMMENT='游戏数据累积统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_week`
--

DROP TABLE IF EXISTS `data_week`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_week` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qufu` varchar(30) DEFAULT NULL COMMENT '区服',
  `platform` int(11) DEFAULT NULL COMMENT '平台ID',
  `serverid` int(11) DEFAULT NULL COMMENT 'ServerID',
  `data_date` date DEFAULT NULL COMMENT '日期',
  `new_reg_user_num` int(30) DEFAULT NULL COMMENT '新增注册用户数',
  `login_user_num` int(30) DEFAULT NULL COMMENT '登录用户数',
  `user_login_num` int(30) DEFAULT NULL COMMENT '用户登录次数',
  `pay_user_num` int(30) DEFAULT NULL COMMENT '付费用户数',
  `pay_num` int(30) DEFAULT NULL COMMENT '付费次数',
  `pay_user_ARPU` double DEFAULT NULL COMMENT '付费用户ARPU',
  `avg_online` double DEFAULT NULL COMMENT '平均在线',
  `mountain_online` double DEFAULT NULL COMMENT '峰值在线',
  `avg_online_ARPU` double DEFAULT NULL COMMENT '平均在线ARPU',
  `login_user_pay_trans_rate` double DEFAULT NULL COMMENT '登录用户付费转化率',
  `new_reg_user_pay_transe_rate` double DEFAULT NULL COMMENT '新增注册用户付费转化率',
  `pay_money` int(30) DEFAULT NULL COMMENT '充值金额',
  `new_pay_user_num` int(30) DEFAULT NULL COMMENT '新增付费用户数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3418 DEFAULT CHARSET=utf8 COMMENT='游戏数据周统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enter_battle`
--

DROP TABLE IF EXISTS `enter_battle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enter_battle` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `ptname` varchar(64) NOT NULL COMMENT '平台',
  `date` datetime NOT NULL COMMENT '日期',
  `success` float(5,2) NOT NULL COMMENT '成功率',
  `battle_res_load` float(5,2) NOT NULL COMMENT '战斗资源加载率',
  `army_success` float(5,2) NOT NULL COMMENT '军团成功率',
  `room_success` float(5,2) NOT NULL COMMENT '房间成功率',
  `lobby_success` float(5,2) NOT NULL COMMENT '大厅成功率',
  `frist_root_success` float(5,2) NOT NULL COMMENT '第一次进入房间成功率',
  `frist_lobby_success` float(5,2) NOT NULL COMMENT '第一次进入大厅成功率',
  `frist_battle_success` float(5,2) NOT NULL COMMENT '第一次进入战斗成功率',
  `fighting_drop` float(5,2) NOT NULL COMMENT '战斗内掉线率',
  `frist_fighting_drop` float(5,2) NOT NULL COMMENT '第一次战斗内掉线率',
  `ladder_drop` float(5,2) NOT NULL COMMENT '天梯掉线率',
  `frist_ladder_drop` float(5,2) NOT NULL COMMENT '第一次天梯掉线率',
  `trans_drop` float(5,2) NOT NULL COMMENT 'Trans踢掉率',
  `browser` float(5,2) NOT NULL COMMENT '浏览器加速',
  `ladder_match` float(5,2) NOT NULL COMMENT '天梯匹配',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='进入战斗统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_kadun`
--

DROP TABLE IF EXISTS `game_kadun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_kadun` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `ptname` varchar(64) NOT NULL COMMENT '平台',
  `date` datetime NOT NULL COMMENT '日期',
  `caton_5` float(5,2) NOT NULL COMMENT '小于5%',
  `caton_15` float(5,2) NOT NULL COMMENT '5%-15%',
  `caton_30` float(5,2) NOT NULL COMMENT '15%-30%',
  `caton_50` float(5,2) NOT NULL COMMENT '30%-50%',
  `caton_70` float(5,2) NOT NULL COMMENT '50%-70%',
  `caton_95` float(5,2) NOT NULL COMMENT '70%-95%',
  `caton_100` float(5,2) NOT NULL COMMENT '大于95%',
  `caton_5_new` float(5,2) NOT NULL COMMENT '新手小于5%',
  `caton_15_new` float(5,2) NOT NULL COMMENT '新手5%-15%',
  `caton_30_new` float(5,2) NOT NULL COMMENT '新手15%-30%',
  `caton_50_new` float(5,2) NOT NULL COMMENT '新手30%-50%',
  `caton_70_new` float(5,2) NOT NULL COMMENT '新手50%-70%',
  `caton_95_new` float(5,2) NOT NULL COMMENT '新手70%-95%',
  `caton_100_new` float(5,2) NOT NULL COMMENT '新手大于95%',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=461 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='游戏卡顿统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_load`
--

DROP TABLE IF EXISTS `game_load`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_load` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `ptname` varchar(64) NOT NULL COMMENT '平台',
  `date` datetime NOT NULL COMMENT '日期',
  `load_config` float(5,2) NOT NULL COMMENT '配置文件加载完成率',
  `load_res` float(5,2) NOT NULL COMMENT '资源文件加载完成率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=461 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='游戏加载统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_mem`
--

DROP TABLE IF EXISTS `game_mem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_mem` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `ptname` varchar(64) NOT NULL COMMENT '平台',
  `date` datetime NOT NULL COMMENT '日期',
  `memory_500` float(5,2) NOT NULL COMMENT '0-500M',
  `memory_700` float(5,2) NOT NULL COMMENT '500-700M',
  `memory_900` float(5,2) NOT NULL COMMENT '700-900M',
  `memory_1100` float(5,2) NOT NULL COMMENT '900M以上',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=458 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='游戏内存统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_mouse`
--

DROP TABLE IF EXISTS `game_mouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_mouse` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `ptname` varchar(64) NOT NULL COMMENT '日期',
  `date` datetime NOT NULL COMMENT '平台',
  `mouse_20` float(32,0) NOT NULL COMMENT ' 10-20ms',
  `mouse_30` float(5,2) NOT NULL COMMENT '20-30ms',
  `mouse_50` float(5,2) NOT NULL COMMENT '30-50ms',
  `mouse_75` float(5,2) NOT NULL COMMENT '50ms以上',
  `mouse_20_new` float(5,2) NOT NULL COMMENT '新手10-20ms',
  `mouse_30_new` float(5,2) NOT NULL COMMENT '新手20-30ms',
  `mouse_50_new` float(5,2) NOT NULL COMMENT '新手30-50ms',
  `mouse_75_new` float(5,2) NOT NULL COMMENT '新手50ms以上',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='鼠标移动统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gm_update`
--

DROP TABLE IF EXISTS `gm_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gm_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(50) NOT NULL COMMENT '更新文件名',
  `update_time` varchar(30) NOT NULL COMMENT '更新时间',
  `status` varchar(10) NOT NULL COMMENT '更新状态',
  `username` varchar(20) NOT NULL COMMENT '更新操作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idc`
--

DROP TABLE IF EXISTS `idc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) DEFAULT NULL COMMENT '机房地址',
  `adminer` varchar(45) DEFAULT NULL COMMENT '机房联系人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `cabinet_num` int(11) DEFAULT NULL COMMENT '机柜数量',
  `switch_num` int(11) DEFAULT NULL COMMENT '交换机数量',
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='机房表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idc_bill`
--

DROP TABLE IF EXISTS `idc_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idc_bill` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `date` varchar(128) DEFAULT NULL COMMENT '月份',
  `idcname` varchar(128) DEFAULT NULL COMMENT '机房',
  `cabinet` int(6) DEFAULT NULL COMMENT '机柜数量',
  `cabinet_price` decimal(32,2) DEFAULT NULL COMMENT '机柜单价',
  `host_amount` decimal(32,2) DEFAULT NULL COMMENT '主机租金',
  `bandwidth` decimal(32,2) DEFAULT NULL COMMENT '带宽数量',
  `bandwidth_price` decimal(32,2) DEFAULT NULL COMMENT '带宽单价',
  `bandwidth_amount` decimal(32,2) DEFAULT NULL COMMENT '带宽租金',
  `combined` decimal(10,2) DEFAULT NULL COMMENT '合计租金',
  `status` varchar(256) DEFAULT NULL COMMENT '状态',
  `info` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='IDC月度详单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `op_vertion`
--

DROP TABLE IF EXISTS `op_vertion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `op_vertion` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(48) NOT NULL COMMENT '平台',
  `server` varchar(48) NOT NULL COMMENT '服务器',
  `batt_t` varchar(48) NOT NULL COMMENT 'Battle更新时间',
  `match_t` varchar(48) NOT NULL COMMENT 'Match更新时间',
  `enro_t` varchar(48) NOT NULL COMMENT 'Enroll更新时间',
  `pvr_t` varchar(48) NOT NULL COMMENT 'PVR更新时间',
  `tran_t` varchar(48) NOT NULL COMMENT 'transe更新时间',
  `ext_t` varchar(48) NOT NULL COMMENT 'Ext更新时间',
  `war_t` varchar(48) NOT NULL COMMENT 'War更新时间',
  `conf_t` varchar(48) NOT NULL COMMENT 'Config更新时间',
  `start_batt` varchar(48) NOT NULL COMMENT 'Battle启动时间',
  `start_match` varchar(48) NOT NULL COMMENT 'Match启动时间',
  `start_enro` varchar(48) NOT NULL COMMENT 'Enroll启动时间',
  `start_pvr` varchar(48) NOT NULL COMMENT 'PVR启动时间',
  `start_state` varchar(48) NOT NULL COMMENT 'StateServer启动时间',
  `start_trans` varchar(48) NOT NULL COMMENT 'transe启动时间',
  `match_v` varchar(48) NOT NULL COMMENT 'Match版本号',
  `batt_v` varchar(48) NOT NULL COMMENT 'Battle版本号',
  `pvr_v` varchar(48) NOT NULL COMMENT 'PVR版本号',
  `state_v` varchar(48) NOT NULL COMMENT 'StateServer版本号',
  `trans_v` varchar(48) NOT NULL COMMENT 'transe版本号',
  `billingid` varchar(10) NOT NULL COMMENT '充值ID(ServerID)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='运维监测';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(45) NOT NULL COMMENT '主机名',
  `lan_ip` varchar(15) DEFAULT NULL COMMENT '内网IP',
  `wan_ip` varchar(15) DEFAULT NULL COMMENT '外网IP',
  `cpu` varchar(15) DEFAULT NULL COMMENT 'cpu',
  `mem` varchar(15) DEFAULT NULL COMMENT '内存',
  `disk` varchar(15) DEFAULT NULL COMMENT '硬盘',
  `virtual_nums` varchar(15) DEFAULT NULL COMMENT '虚拟机个数',
  `virtual_names` varchar(15) DEFAULT NULL COMMENT '虚拟机',
  `idc_id` int(11) DEFAULT NULL COMMENT '机房ID',
  `cabinet_id` int(11) DEFAULT NULL COMMENT '机柜ID',
  PRIMARY KEY (`id`,`hostname`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='物理宿主机服务器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '用户名',
  `name_cn` varchar(50) NOT NULL COMMENT '中文名',
  `password` varchar(50) NOT NULL COMMENT '用户密码',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮件',
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `role` varchar(10) NOT NULL COMMENT '1:sa;2:php;3:ios;4:test',
  `status` varchar(4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `virtuals`
--

DROP TABLE IF EXISTS `virtuals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtuals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qufu` varchar(30) DEFAULT NULL COMMENT '区服',
  `platform` int(11) DEFAULT NULL COMMENT '平台ID',
  `serverid` int(11) DEFAULT NULL COMMENT 'ServerID',
  `hostname` varchar(45) NOT NULL COMMENT '主机名',
  `lan_ip` varchar(15) DEFAULT NULL COMMENT '内网IP',
  `wan_ip` varchar(15) DEFAULT NULL COMMENT '外网IP',
  `cpu` varchar(15) DEFAULT NULL COMMENT 'cpu',
  `mem` varchar(15) DEFAULT NULL COMMENT '内存',
  `disk` varchar(15) DEFAULT NULL COMMENT '硬盘',
  `server_id` int(15) DEFAULT NULL COMMENT '宿主机',
  `master_slave` varchar(30) DEFAULT NULL COMMENT 'mongo主人关系',
  `back_num` int(10) DEFAULT NULL COMMENT '备份个数(天数)',
  `back_name` varchar(45) DEFAULT NULL COMMENT '最新备份文件名',
  `back_size` varchar(15) DEFAULT NULL COMMENT '最新备份大小',
  `back_starttime` varchar(15) DEFAULT NULL COMMENT '备份开始时间',
  `back_endtime` varchar(15) DEFAULT NULL COMMENT '备份完成时间',
  `back_used_time` varchar(15) DEFAULT NULL COMMENT '备份用时',
  `refresh_time` datetime DEFAULT NULL COMMENT '数据刷新时间',
  PRIMARY KEY (`id`,`hostname`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='虚拟机服务器表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-14 19:16:53
