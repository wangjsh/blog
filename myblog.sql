/*
SQLyog Enterprise - MySQL GUI v8.14 
MySQL - 5.5.15 : Database - myblog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`myblog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `myblog`;

/*Table structure for table `articles` */

DROP TABLE IF EXISTS `articles`;

CREATE TABLE `articles` (
  `articleId` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `contents` text,
  `pubDate` datetime DEFAULT NULL,
  `clicks` int(11) DEFAULT NULL,
  PRIMARY KEY (`articleId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `articles` */

insert  into `articles`(`articleId`,`authorId`,`title`,`contents`,`pubDate`,`clicks`) values (4,5,'车展','<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 车展中，豪车与首发车无疑是最引人注目的焦点，但自主品牌的表现也引发关注。近两年，面对着市场经济疲软与合资品牌价格下探，自主品牌可谓是与危机并肩前行。但是，在危机与挑战的包围中，机遇同样存在。本届广州车展，我们能够看到自主品牌在亦步亦趋之间所取得的突破与成绩。这其中，作为自主品牌旗帜之一的一汽奔腾，更将自主品牌如何在合资品牌合围下生存与发展，确立未来的道路与方向，做出了全新的阐释。<br />\r\n	<br />\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 本次广州车展，一汽奔腾大家族全系参展，从奔腾品牌全新中高级旗舰奔腾B90，到采用1.8L全新动力组合的全新奔腾B70、以及2012款奔腾B50和今年一汽轿车家族的新成员欧朗都有亮相。一汽奔腾此次全系车型亮相，可以看到奔腾6年来的发展历史与成绩，更展现了一汽奔腾作为自主品牌领航者从厚积薄发到傲视群雄的锤炼与沉淀。<br />\r\n	<br />\r\n	<br />\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 　　犹记得在2006年一汽奔腾刚刚迈入市场的时候，自主品牌正深陷&quot;两低&quot;&mdash;&mdash;价格低、品质技术含量低的怪圈之中。当时，对于自主品牌来说，起步晚缺乏足够的技术实力，为了获得市场份额，自然只能采取低价格。虽然看来合情合理，但却引导大部分自主品牌车企走入了一个恶性循环的怪圈。低价格必然压缩了利润，从而影响到研发的投入，最终导致品质和技术的提升缓慢，于是更新的产品仍然只能靠更低的价格取胜，如此往复，最终使自主品牌的道路越走越窄。<br />\r\n	<br />\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n	<br />\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 　　但一汽奔腾从面市之日起，便选择了一条与诸多自主厂商不一样的道路。它没有采取众多竞争对手低质低价的常规道路，而是率先举起了技术和品质的大旗。面对市场对于&quot;自主品牌是否能够拥有高品质&quot;的质疑，一汽奔腾用自信与实力做出有力的回击，凭借真人实车侧翻、极限静压实验等一系列令人震撼的惊世之举，一汽奔腾的首款车型奔腾B70面世之初，就以高安全性赢得了良好的市场口碑，为奔腾家族取得今日的地位立下汗马功劳。从奔腾B70 2006年上市开始，到2012年全新1.8L奔腾B70的推出，彻底刷新了传统中高级轿车的价值标准。6年来，奔腾B70以超高的性价比、卓越的动力和行驶表现取得了累计销量22万台的优异成绩。<br />\r\n	<br />\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n	<br />\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 在奔腾B70赢得了市场的广泛认可之后，2009年一汽奔腾推出了1.6L奔腾B50。虽然价格、定位不同，但奔腾B50在设计制造理念上延续了一汽奔腾的一贯做法，采用高技术含量、高安全配置的策略。自2009年上市伊始，奔腾B50凭借完美的操控，丰富的配置，卓越的品质，在多方面超越了人们对传统A级车的期待，完美的展现了其&quot;1.6L之王&quot;、&quot;全面越级车&quot;的商品魅力。凭借卓越的品质、超高性价比优势，短短的3年时间，奔腾B50赢得了近25万用户的青睐，更获得了广泛的市场好评！<br />\r\n	<br />\r\n	<br />\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 　　在2011年上海车展上，一汽奔腾有三款概念车B9、GO、X闪亮登场。三款概念车的登场不仅预示着奔腾产品线序列的扩军与升级，同时也宣誓了一汽奔腾对未来的长远规划及战略布局。上海车展时隔一年之后，以概念车GO为蓝本，一汽欧朗在今年4月耀目上市。一汽欧朗在融入奔腾家族卓越品质优势的同时，更增添了充满活力的青春面庞。动感激情而不失实用，个性鲜明又凸显时尚。上市伊始，就成为A0级车中耀眼的新星。<br />\r\n	<br />\r\n	<br />\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 而在2012年的北京车展上，在概念车B9基础之上，万众瞩目的奔腾B90正式亮相。作为一款潜心研发数载的优秀旗舰产品，奔腾B90融合一汽轿车几十年的技术积淀，代表了目前国内最为领先的制造工艺和科技水平，拥有平台科技、轻量化科技、安全科技、舒适科技以及智能科技五大领先科技优势。在继承和发扬奔腾品牌长期积累的&quot;品质&quot;、&quot;安全&quot; 等优良品牌资产的基础之上，奔腾B90为奔腾品牌注入了&quot;科技&quot;的DNA。 作为奔腾品牌全新中高级旗舰车型，奔腾B90是奔腾品牌六年历史的巅峰之作，融合了一汽五十年的技术积淀，代表了目前国内最为领先的制造工艺和科技水平，堪称&quot;史上最强奔腾&quot;。</p>\r\n','2013-04-01 11:23:29',15),(5,2,'呵呵呵','<p>\r\n	　在2011年上海车展上，一汽奔腾有三款概念车B9、GO、X闪亮登场。三款概念车的登场不仅预示着奔腾产品线序列的扩军与升级，同时也宣誓了一汽奔腾 对未来的长远规划及战略布局。上海车展时隔一年之后，以概念车GO为蓝本，一汽欧朗在今年4月耀目上市。一汽欧朗在融入奔腾家族卓越品质优势的同时，更增 添了充满活力的青春面庞。动感激情而不失实用，个性鲜明又凸显时尚。上市伊始，就成为A0级车中耀眼的新星。 而在2012年的北京车展上，在概念车B9基础之上，万众瞩目的奔腾B90正式亮相。作为一款潜心研发数载的优秀旗舰产品，奔腾B90融合一汽轿车几十年 的技术积淀，代表了目前国内最为领先的制造工艺和科技水平，拥有平台科技、轻量化科技、安全科技、舒适科技以及智能科技五大领先科技优势。在继承和发扬奔 腾品牌长期积累的&quot;品质&quot;、&quot;安全&quot; 等优良品牌资产的基础之上，奔腾B90为奔腾品牌注入了&quot;科技&quot;的DNA。 作为奔腾品牌全新中高级旗舰车型，奔腾B90是奔腾品牌六年历史的巅峰之作，融合了一汽五十年的技术积淀，代表了目前国内最为领先的制造工艺和科技水平， 堪称&quot;史上最强奔腾&quot;。 随着奔腾B90的上市，在不远的将来，以概念车X为蓝本的奔腾SUV也将面世。最晚在2014年，一汽轿车自主产品线以现有产品为基础，加入奔腾SUV、 MPV，从而全面覆盖包括小型车、家庭车、中高级车、高级车、SUV和MPV在内的不同细分市场。</p>\r\n','2013-04-01 10:00:36',18),(14,3,'拜拜','<p>\r\n	歌要走了</p>\r\n','2013-04-07 10:40:17',0),(15,5,'你好','<p>\r\n	谢谢，再见。。。</p>\r\n','2013-04-07 10:42:57',0),(16,6,'见到你很高兴','<p>\r\n	。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。</p>\r\n','2013-04-07 10:43:57',0);

/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `articleId` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `comment` text,
  `commentPubDate` datetime DEFAULT NULL,
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `comments` */

insert  into `comments`(`commentId`,`articleId`,`userid`,`comment`,`commentPubDate`) values (1,4,1,'good ,ggood ,ggood ,ggood ,ggood ,ggood ,ggood ,g','2013-04-01 00:00:00'),(2,4,1,'zxcvzxcvzxcvzxcvzxcv','2013-04-01 00:00:00'),(3,5,1,'asdfadsfasdfasdfasdfasd','2013-04-01 00:00:00'),(4,5,2,'嗯哼？','2013-04-01 13:40:48'),(5,6,6,'顶！好帖子o(∩_∩)o ','2013-04-01 13:44:06'),(9,11,1,'hahahaha ','2013-04-02 14:54:39'),(10,13,7,'没看懂','2013-04-02 16:41:55');

/*Table structure for table `userdetails` */

DROP TABLE IF EXISTS `userdetails`;

CREATE TABLE `userdetails` (
  `userid` int(11) NOT NULL,
  `trueName` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `mail` varchar(20) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `headerimg` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  CONSTRAINT `userdetails_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `userdetails` */

insert  into `userdetails`(`userid`,`trueName`,`gender`,`age`,`mail`,`qq`,`headerimg`) values (1,'林冲','女',48,'78654321@qq.com','111111','headerimg/linchong.jpg'),(2,'宋江','男',20,'songjiang@haha.com','12346','headerimg/songjiang.jpg'),(3,'武松','男',35,'wusong@haha.com','12347','headerimg/wusong.jpg'),(4,'西门庆','男',25,'ximenqing@haha.com','12348','headerimg/ximenqing.jpg'),(5,'卢俊义','男',36,'lujunyi@haha.com','12349','headerimg/lujunyi.jpg'),(6,'潘金莲','女',18,'panjinlian@haha.com','12340','headerimg/panjinlian.jpg');

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `loginId` varchar(50) DEFAULT NULL,
  `loginPwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `userinfo` */

insert  into `userinfo`(`userid`,`loginId`,`loginPwd`) values (1,'linchong','123'),(2,'songjiang','123'),(3,'wusong','123'),(4,'ximenqing','123'),(5,'lujunyi','123'),(6,'panjinlian','123');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
