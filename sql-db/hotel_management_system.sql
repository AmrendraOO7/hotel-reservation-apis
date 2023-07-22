/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.28-MariaDB : Database - hotel_management
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hotel_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `hotel_management`;

/*Table structure for table `about` */

DROP TABLE IF EXISTS `about`;

CREATE TABLE `about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `about` */

insert  into `about`(`id`,`content`) values 
(1,'Welcome to B&B Hotel and Restaurant. We\'re located very close to Birgunj bus park. The hotel is managed by a very experienced team having experiences in hospitality business since 15 years. We\'ve very modern amenities which include clean and luxurious bed rooms, rooms with private lounges, restaurant with no smoking zone, second restaurant with smoking zone, a bar with all types of drinks, open lobby, private hall for small parties and gatherings and a dragon fountain for a wonderful selfie. It also has parking area. You can enjoy and experience a wonderfull time with our lodging and delicious foods from the restaurants.');

/*Table structure for table `booking` */

DROP TABLE IF EXISTS `booking`;

CREATE TABLE `booking` (
  `id` double NOT NULL AUTO_INCREMENT,
  `user_id` double DEFAULT NULL,
  `book_from` date NOT NULL,
  `book_to` date NOT NULL,
  `booking_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `check_in` datetime DEFAULT NULL,
  `check_out` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  `room_id` varchar(500) NOT NULL,
  `booking_code` double NOT NULL,
  `id_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `id_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `number_of_child` int(11) DEFAULT NULL,
  `number_of_adult` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `noOfRooms` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `disc_pc` double DEFAULT NULL,
  `disc_amt` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `vat_pc` double DEFAULT NULL,
  `vat_amt` double DEFAULT NULL,
  `net_pay` double DEFAULT NULL,
  `service_charge` double DEFAULT NULL,
  `service_charge_amount` double DEFAULT NULL,
  `no_of_days_stayed` int(11) DEFAULT NULL,
  `cost_of_staying` double DEFAULT NULL,
  `room_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `words` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryId` (`categoryId`),
  KEY `typeId` (`typeId`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`typeId`) REFERENCES `type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `booking` */

insert  into `booking`(`id`,`user_id`,`book_from`,`book_to`,`booking_status`,`check_in`,`check_out`,`status`,`created_date`,`updated_date`,`room_id`,`booking_code`,`id_number`,`id_type`,`number_of_child`,`number_of_adult`,`name`,`email`,`address`,`mobile`,`categoryId`,`typeId`,`noOfRooms`,`price`,`disc_pc`,`disc_amt`,`total`,`vat_pc`,`vat_amt`,`net_pay`,`service_charge`,`service_charge_amount`,`no_of_days_stayed`,`cost_of_staying`,`room_status`,`words`) values 
(1,NULL,'2022-09-01','2022-09-01','checked_out','2022-09-01 16:20:14','2022-09-01 00:00:00',0,'2022-09-01 16:20:14','2022-09-01 16:20:39','2',791679,'5475475','Passport',0,1,'Amrendra Chaurasia','er.amrendra007@gmail.com','Dwarkanagara','9874563210',1,1,1,3500,5,175,3325,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,NULL,'2022-09-01','2022-09-01','checked_out','2022-09-01 16:22:31','2022-09-01 00:00:00',0,'2022-09-01 16:22:31','2022-09-01 16:27:42','2',479940,'3432423','Passport',0,6,'Amrendra Chaurasia','er.amrendra007@gmail.com','Dwarkanagara','9874563210',1,1,2,3500,5,175,3325,13,432.25,3807.25,50,NULL,NULL,NULL,NULL,NULL),
(3,NULL,'2022-09-01','2022-09-01','checked_out','2022-09-01 16:22:31','2022-09-01 00:00:00',0,'2022-09-01 16:22:31','2022-09-01 16:23:19','1',733176,'3432423','Passport',0,6,'Amrendra Chaurasia','er.amrendra007@gmail.com','Dwarkanagara','9874563210',1,1,2,3500,5,175,3325,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,NULL,'2022-09-01','2022-09-01','checked_out','2022-09-01 16:37:31','2022-09-01 00:00:00',0,'2022-09-01 16:37:31','2022-09-01 16:40:46','2',223982,'4545','Passport',0,5,'Amrendra Chaurasia','er.amrendra007@gmail.com','Dwarkanagara','9874563210',1,1,2,3500,20,700,2800,13,364,3244,80,NULL,NULL,NULL,NULL,NULL),
(5,NULL,'2022-09-01','2022-09-01','checked_out','2022-09-01 16:37:31','2022-09-01 00:00:00',0,'2022-09-01 16:37:31','2022-09-01 16:39:51','1',354685,'4545','Passport',0,5,'Amrendra Chaurasia','er.amrendra007@gmail.com','Dwarkanagara','9874563210',1,1,2,3500,5,175,3325,13,432.25,3757.25,0,NULL,NULL,NULL,NULL,NULL),
(6,NULL,'2022-09-01','2022-09-01','checked_out','2022-09-01 16:46:20','2022-09-01 00:00:00',0,'2022-09-01 16:46:20','2022-09-01 16:48:12','2',287711,'341002/341','Citizenship',0,2,'Amrendra Chaurasia','er.amrendra007@gmail.com','Brigunj','9821273755',1,1,1,3500,20,700,2800,13,364,3244,80,NULL,NULL,NULL,NULL,NULL),
(7,NULL,'2022-09-01','2022-09-01','checked_out','2022-09-01 16:50:36','2022-09-01 00:00:00',0,'2022-09-01 16:50:36','2022-09-01 16:50:53','2',222155,'341002/341','Citizenship',0,2,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,1,3500,20,700,2800,13,364,3244,80,NULL,NULL,NULL,NULL,NULL),
(8,NULL,'2022-09-01','2022-09-02','checked_out','2022-09-01 16:56:54','2022-09-01 17:02:00',0,'2022-09-01 16:56:54','2022-09-01 17:02:00','2',297395,'341002/341','Citizenship',0,2,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,1,3500,20,700,2800,13,364,3244,80,NULL,NULL,NULL,NULL,NULL),
(9,NULL,'2022-09-01','2022-09-01','checked_out','2022-09-01 17:50:21','2022-09-02 12:02:04',0,'2022-09-01 17:50:21','2022-09-02 12:02:05','2',223279,'147852','Citizenship',0,2,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,1,3500,8,560,6440,13,837.2,7377.2,100,NULL,2,7000,NULL,NULL),
(10,NULL,'2022-09-02','2022-09-02','checked_out','2022-09-02 11:39:16','2022-09-02 11:45:45',0,'2022-09-02 11:39:16','2022-09-02 11:45:45','1',331501,'1111111','Citizenship',1,1,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,1,3500,5,175,3325,13,432.25,3757.25,0,NULL,1,1,NULL,NULL),
(11,NULL,'2022-09-02','2022-09-02','checked_out','2022-09-02 11:46:44','2022-09-02 11:57:24',0,'2022-09-02 11:46:44','2022-09-02 11:57:24','1',153086,'11111','Citizenship',1,1,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,1,3500,10,1750,15750,13,2047.5,17897.5,100,NULL,5,17500,NULL,NULL),
(12,NULL,'2022-09-02','2022-09-02','checked_out','2022-09-02 12:02:56','2022-09-02 13:35:08',0,'2022-09-02 12:02:56','2022-09-02 13:35:09','2',954308,'456321','Citizenship',NULL,10,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,2,3500,10,1750,15750,13,2047.5,17797.5,0,NULL,5,17500,NULL,NULL),
(13,NULL,'2022-09-02','2022-09-02','checked_out','2022-09-02 12:02:56','2022-09-02 13:34:46',0,'2022-09-02 12:02:56','2022-09-02 13:34:47','1',979267,'456321','Citizenship',NULL,10,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,2,3500,10,1750,15750,13,2047.5,17797.5,0,NULL,5,17500,NULL,NULL),
(14,NULL,'2022-09-02','2022-09-02','checked_out','2022-09-02 13:35:43','2022-09-02 17:36:09',0,'2022-09-02 13:35:43','2022-09-02 17:36:10','2',388595,'1254785222','Citizenship',NULL,10,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,2,3500,5,875,16625,13,2161.25,18786.25,0,NULL,5,17500,NULL,NULL),
(15,NULL,'2022-09-02','2022-09-02','checked_out','2022-09-02 13:35:43','2022-09-02 17:35:57',0,'2022-09-02 13:35:43','2022-09-02 17:35:58','1',882441,'1254785222','Citizenship',NULL,10,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,2,3500,5,875,16625,13,2161.25,18786.25,0,NULL,5,17500,NULL,NULL),
(16,NULL,'2022-09-02','2022-09-02','checked_out','2022-09-02 17:36:27','2022-09-06 12:13:34',0,'2022-09-02 17:36:27','2022-09-06 12:13:34','2',523545,'55555555','Passport',NULL,5,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,2,3500,10,1750,15750,13,2047.5,17897.5,100,NULL,5,17500,NULL,NULL),
(17,NULL,'2022-09-02','2022-09-02','checked_out','2022-09-02 17:36:27','2022-09-06 12:13:11',0,'2022-09-02 17:36:27','2022-09-06 12:13:11','1',796647,'55555555','Passport',NULL,5,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,2,3500,10,1750,15750,13,2047.5,17897.5,100,NULL,5,17500,NULL,NULL),
(18,NULL,'2022-09-06','2022-09-06','cancelled','2022-09-06 10:48:19',NULL,0,'2022-09-06 10:48:19','2022-09-06 11:14:04','5',140077,'44444444','Citizenship',NULL,5,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(19,NULL,'2022-09-06','2022-09-06','cancelled','2022-09-06 10:48:19',NULL,0,'2022-09-06 10:48:19','2022-09-06 11:11:57','6',692384,'44444444','Citizenship',NULL,5,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(20,NULL,'2022-09-06','2022-09-06','cancelled','2022-09-06 10:48:19',NULL,0,'2022-09-06 10:48:19','2022-09-06 11:09:59','7',496400,'44444444','Citizenship',NULL,5,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(21,NULL,'2022-09-06','2022-09-06','cancelled','2022-09-06 10:48:19',NULL,0,'2022-09-06 10:48:19','2022-09-06 11:08:51','8',174026,'44444444','Citizenship',NULL,5,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(22,NULL,'2022-09-06','2022-09-06','cancelled','2022-09-06 11:15:14',NULL,0,'2022-09-06 11:15:14','2022-09-06 11:15:57','5',466248,'41654654','Passport',10,5,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(23,NULL,'2022-09-06','2022-09-06','cancelled','2022-09-06 11:15:14',NULL,0,'2022-09-06 11:15:14','2022-09-06 11:15:52','6',101192,'41654654','Passport',10,5,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(24,NULL,'2022-09-06','2022-09-06','cancelled','2022-09-06 11:15:14',NULL,0,'2022-09-06 11:15:14','2022-09-06 11:15:48','7',375048,'41654654','Passport',10,5,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(25,NULL,'2022-09-06','2022-09-06','cancelled','2022-09-06 11:15:14',NULL,0,'2022-09-06 11:15:14','2022-09-06 11:15:25','8',352017,'41654654','Passport',10,5,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(26,NULL,'2022-09-06','2022-09-06','checked_out',NULL,'2022-09-06 12:04:34',0,'2022-09-06 11:18:02','2022-09-06 12:04:34','5',924519,'454','Citizenship',10,1,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,4,2500,5,625,11875,13,1543.75,13423.75,5,NULL,5,12500,NULL,NULL),
(27,NULL,'2022-09-06','2022-09-06','checked_out',NULL,'2022-09-06 11:50:01',0,'2022-09-06 11:18:02','2022-09-06 11:50:02','6',348266,'454','Citizenship',10,1,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,4,2500,3,375,12125,13,1576.25,13801.25,100,NULL,5,12500,NULL,NULL),
(28,NULL,'2022-09-06','2022-09-06','cancelled',NULL,NULL,0,'2022-09-06 11:18:02','2022-09-06 11:33:08','7',523112,'454','Citizenship',10,1,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(29,NULL,'2022-09-06','2022-09-06','checked_out',NULL,'2022-09-06 11:48:27',0,'2022-09-06 11:18:02','2022-09-06 11:48:28','8',941179,'454','Citizenship',10,1,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,4,2500,5,250,4750,13,617.5,5467.5,100,NULL,2,5000,NULL,NULL),
(30,NULL,'2022-09-06','2022-09-06','checked_out','2022-09-06 12:17:47','2022-09-06 12:31:45',0,'2022-09-06 12:17:47','2022-09-06 12:31:45','2',509962,'1111111','Citizenship',NULL,4,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,2,3500,4,140,3360,13,436.8,3846.8,50,NULL,1,3500,NULL,NULL),
(31,NULL,'2022-09-06','2022-09-06','cancelled','2022-09-06 12:17:47',NULL,0,'2022-09-06 12:17:47','2022-09-06 12:30:34','1',595775,'1111111','Citizenship',NULL,4,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(32,NULL,'2022-09-06','2022-09-06','checked_out','2022-09-06 12:43:33','2022-09-06 18:05:20',0,'2022-09-06 12:43:33','2022-09-06 18:05:21','2',397569,'123654777','Citizenship',0,4,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,2,3500,10,700,6300,13,819,7119,0,NULL,2,7000,NULL,'Seven thousand one hundred and nineteen  only.'),
(33,NULL,'2022-09-06','2022-09-06','checked_out','2022-09-06 12:43:33','2022-09-06 17:42:37',0,'2022-09-06 12:43:33','2022-09-06 17:42:38','1',667011,'123654777','Citizenship',0,4,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,2,3500,10,700,6300,13,819,7119,0,NULL,2,7000,NULL,NULL),
(34,NULL,'2022-09-06','2022-09-06','checked_out','2022-09-06 13:58:53','2022-09-06 17:46:51',0,'2022-09-06 13:58:53','2022-09-06 17:46:52','3',166666,'56465','Passport',2,5,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',2,1,2,2500,10,500,4500,13,585,5085,0,NULL,2,5000,NULL,NULL),
(35,NULL,'2022-09-06','2022-09-06','checked_out','2022-09-06 13:58:53','2022-09-06 16:04:41',0,'2022-09-06 13:58:53','2022-09-06 16:04:42','4',647934,'56465','Passport',2,5,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',2,1,2,2500,15,750,4250,13,552.5,4822.5,20,NULL,2,5000,NULL,NULL),
(36,NULL,'2022-09-06','2022-09-06','checked_out','2022-09-06 18:14:49','2022-09-07 11:14:23',0,'2022-09-06 18:14:49','2022-09-07 11:14:24','2',222576,'255255','Citizenship',NULL,5,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,2,3500,10,350,3150,13,419.9,3649.9,80,NULL,1,3500,NULL,'Three thousand six hundred and forty nine  only.'),
(37,NULL,'2022-09-06','2022-09-06','checked_out','2022-09-06 18:14:49','2022-09-06 18:16:29',0,'2022-09-06 18:14:49','2022-09-06 18:16:30','1',620300,'255255','Citizenship',NULL,5,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,2,3500,25,875,2625,13,341.25,3046.25,80,NULL,1,3500,NULL,'Two thousand nine hundred and sixty six  only.'),
(38,NULL,'2022-09-07','2022-09-07','checked_out','2022-09-07 09:54:09','2022-09-07 09:55:46',0,'2022-09-07 09:54:09','2022-09-07 09:55:47','1',910845,'5f4g54df','Driving Licence',NULL,1,'fhghjfdg','hghg@hgh.com','hgghhg','1111111111',1,1,1,3500,5,350,6650,13,864.5,7614.5,100,NULL,2,7000,NULL,'Seven thousand five hundred and fourteen  only.'),
(39,NULL,'2022-09-07','2022-09-07','checked_out','2022-09-07 10:11:36','2022-09-07 10:11:36',0,'2022-09-07 10:10:07','2022-09-07 10:11:36','1',156804,'g5f4h5fg','Driving Licence',NULL,1,'cx cbhcgh','hgfghf@jhg.com','fg ghfgh ','1596324780',1,1,1,3500,2,70,3430,13,445.90000000000003,3975.9,100,NULL,1,3500,NULL,'Three thousand eight hundred and seventy five  only.'),
(40,NULL,'2022-09-07','2022-09-07','checked_out','2022-09-07 10:24:48','2022-09-07 11:05:10',0,'2022-09-07 10:24:48','2022-09-07 11:05:11','1',195522,'45454554','Citizenship',NULL,2,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,1,3500,20,700,2800,13,364,3244,80,NULL,1,3500,NULL,'Three thousand one hundred and sixty four  only.'),
(41,NULL,'2022-09-07','2022-09-07','checked_out','2022-09-07 17:04:00','2022-09-07 17:07:54',0,'2022-09-07 17:04:00','2022-09-07 17:07:54','3',119397,'1111111','Passport',1,1,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',2,1,1,2500,0,0,2500,13,325,2825,0,NULL,1,2500,NULL,'Two thousand eight hundred and twenty five  only.'),
(42,NULL,'2022-09-07','2022-09-07','checked_out','2022-09-07 17:05:12','2022-09-07 17:07:39',0,'2022-09-07 17:05:12','2022-09-07 17:07:39','5',669978,'11111','Passport',NULL,3,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,1,2500,0,0,2500,13,325,2825,0,NULL,1,2500,NULL,'Two thousand eight hundred and twenty five  only.'),
(43,NULL,'2022-09-07','2022-09-07','checked_out','2022-09-07 17:06:19','2022-09-07 17:07:29',0,'2022-09-07 17:06:19','2022-09-07 17:07:29','6',288194,'4646656','Citizenship',NULL,18,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,3,2500,0,0,2500,13,325,2825,0,NULL,1,2500,NULL,'Two thousand eight hundred and twenty five  only.'),
(44,NULL,'2022-09-07','2022-09-07','checked_out','2022-09-07 17:06:19','2022-09-07 17:07:18',0,'2022-09-07 17:06:19','2022-09-07 17:07:19','7',941088,'4646656','Citizenship',NULL,18,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,3,2500,0,0,2500,13,325,2825,0,NULL,1,2500,NULL,'Two thousand eight hundred and twenty five  only.'),
(45,NULL,'2022-09-07','2022-09-07','cancelled','2022-09-07 17:06:19',NULL,0,'2022-09-07 17:06:19','2022-09-07 17:06:30','8',389881,'4646656','Citizenship',NULL,18,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(46,NULL,'2022-09-09','2022-09-09','checked_out','2022-09-09 11:58:08','2022-09-14 10:08:32',0,'2022-09-09 11:58:08','2022-09-14 10:08:33','2',727147,'5555555','Passport',NULL,5,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,2,3500,0,0,7000,13,910,7910,0,NULL,2,7000,NULL,'Seven thousand nine hundred and ten  only.'),
(47,NULL,'2022-09-09','2022-09-09','checked_out','2022-09-09 11:58:08','2022-09-14 10:13:15',0,'2022-09-09 11:58:08','2022-09-14 10:13:16','1',390173,'5555555','Passport',NULL,5,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,2,3500,0,0,7000,13,910,7910,0,NULL,2,7000,NULL,'Seven thousand nine hundred and ten  only.'),
(48,NULL,'2022-09-14','2022-09-14','checked_out','2022-09-14 10:19:47','2022-09-14 10:19:59',0,'2022-09-14 10:19:47','2022-09-14 10:19:59','2',304413,'d5f456df4gfd','Driving Licence',NULL,5,'d fgdfg','ghgf@jhgjg.com','fg fh','1234569870',1,1,1,3500,0,0,3500,13,455,3955,0,NULL,1,3500,NULL,'Three thousand nine hundred and fifty five  only.'),
(49,NULL,'2022-09-14','2022-09-14','checked_out','2022-09-14 10:20:50','2022-09-14 10:52:46',0,'2022-09-14 10:20:50','2022-09-14 10:52:47','2',971622,'D5G4DF56G4FG','Driving Licence',NULL,10,'f gfdgdfg ','dfgfdg@HGHJ.COM','df dfgfd g','1234567890',1,1,2,3500,0,0,17500,13,2275,19775,0,NULL,5,17500,NULL,'Nineteen thousand seven hundred and seventy five  only.'),
(50,NULL,'2022-09-14','2022-09-14','checked_out','2022-09-14 10:20:50','2022-09-14 10:22:13',0,'2022-09-14 10:20:50','2022-09-14 10:22:14','1',945047,'D5G4DF56G4FG','Driving Licence',NULL,10,'f gfdgdfg ','dfgfdg@HGHJ.COM','df dfgfd g','1234567890',1,1,2,3500,0,0,3500,13,455,3955,0,NULL,1,3500,NULL,'Three thousand nine hundred and fifty five  only.'),
(51,NULL,'2022-09-14','2022-09-14','checked_out','2022-09-14 10:32:32','2022-09-14 11:42:55',0,'2022-09-14 10:32:32','2022-09-14 11:42:56','1',465977,'fg65fg6h5g','Driving Licence',NULL,5,'fh gjfdhg ','jhg@fhg.com','hjgd hf','9874546321',1,1,1,3500,0,0,7000,13,910,7910,0,NULL,2,7000,NULL,'Seven thousand nine hundred and ten  only.'),
(52,NULL,'2022-09-14','2022-09-14','checked_out','2022-09-14 10:52:17','2022-09-14 11:42:46',0,'2022-09-14 10:52:17','2022-09-14 11:42:47','3',583543,'5555555','Citizenship',NULL,6,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',2,1,2,2500,0,0,5000,13,650,5650,0,NULL,2,5000,NULL,'Five thousand six hundred and fifty  only.'),
(53,NULL,'2022-09-14','2022-09-14','checked_out','2022-09-14 10:52:17','2022-09-14 11:42:26',0,'2022-09-14 10:52:17','2022-09-14 11:42:27','4',242176,'5555555','Citizenship',NULL,6,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',2,1,2,2500,0,0,5000,13,650,5650,0,NULL,2,5000,NULL,'Five thousand six hundred and fifty  only.'),
(54,NULL,'2022-09-14','2022-09-14','checked_out','2022-09-14 11:18:53','2022-09-14 11:40:25',0,'2022-09-14 11:18:53','2022-09-14 11:40:26','5',758289,'557878786876','Citizenship',NULL,15,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,4,2500,0,0,5000,13,650,5650,0,NULL,2,5000,NULL,'Five thousand six hundred and fifty  only.'),
(55,NULL,'2022-09-14','2022-09-14','checked_out','2022-09-14 11:18:53','2022-09-14 11:37:05',0,'2022-09-14 11:18:53','2022-09-14 11:37:06','6',323365,'557878786876','Citizenship',NULL,15,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,4,2500,0,0,5000,13,650,5650,0,NULL,2,5000,NULL,'Five thousand six hundred and fifty  only.'),
(56,NULL,'2022-09-14','2022-09-14','checked_out','2022-09-14 11:18:53','2022-09-14 11:36:46',0,'2022-09-14 11:18:53','2022-09-14 11:36:47','7',868809,'557878786876','Citizenship',NULL,15,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,4,2500,0,0,5000,13,650,5650,0,NULL,2,5000,NULL,'Five thousand six hundred and fifty  only.'),
(57,NULL,'2022-09-14','2022-09-14','checked_out','2022-09-14 11:18:53','2022-09-14 11:34:29',0,'2022-09-14 11:18:53','2022-09-14 11:34:30','8',668029,'557878786876','Citizenship',NULL,15,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,4,2500,0,0,5000,13,650,5650,0,NULL,2,5000,NULL,'Five thousand six hundred and fifty  only.'),
(58,NULL,'2022-09-14','2022-09-14','checked_out','2022-09-14 16:46:07','2022-09-14 16:47:40',0,'2022-09-14 16:46:07','2022-09-14 16:47:40','2',168759,'5656','Citizenship',NULL,3,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,1,3500,0,0,3500,13,455,3955,0,NULL,1,3500,NULL,'Three thousand nine hundred and fifty five  only.'),
(59,NULL,'2022-09-15','2022-09-15','checked_out','2022-09-15 15:39:25','2022-09-19 14:12:20',0,'2022-09-15 15:39:25','2022-09-19 14:12:21','2',326613,'47542','Citizenship',0,2,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,1,3500,0,0,7000,13,910,7910,0,NULL,2,7000,NULL,'Seven thousand nine hundred and ten  only.'),
(60,NULL,'2022-09-15','2022-09-15','checked_out',NULL,'2022-09-19 14:12:12',0,'2022-09-15 15:40:44','2022-09-19 14:12:13','3',655698,'145784245','Passport',NULL,3,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',2,1,1,2500,0,0,5000,13,650,5650,0,NULL,2,5000,NULL,'Five thousand six hundred and fifty  only.'),
(61,NULL,'2022-09-16','2022-09-16','checked_out','2022-09-16 10:15:11','2022-09-19 14:12:52',0,'2022-09-16 10:15:11','2022-09-19 14:12:53','1',717503,'454565464','Passport',NULL,2,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,1,3500,0,0,7000,13,910,7910,0,NULL,2,7000,NULL,'Seven thousand nine hundred and ten  only.'),
(62,NULL,'2022-09-16','2022-09-16','checked_out','2022-09-16 10:36:36','2022-09-16 10:57:34',0,'2022-09-16 10:36:36','2022-09-16 10:57:34','4',613260,'4535424','Citizenship',NULL,1,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',2,1,1,2500,10,500,4500,13,595.4,5175.4,80,NULL,2,5000,NULL,'Five thousand one hundred and seventy five  only.'),
(63,NULL,'2022-09-16','2022-09-16','cancelled','2022-09-16 11:25:15',NULL,0,'2022-09-16 11:25:15','2022-09-19 14:12:40','5',856124,'54765657875','Driving Licence',2,4,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(64,NULL,'2022-09-16','2022-09-16','cancelled','2022-09-16 11:25:15',NULL,0,'2022-09-16 11:25:15','2022-09-19 14:12:35','6',465596,'54765657875','Driving Licence',2,4,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(65,NULL,'2022-09-16','2022-09-16','checked_out','2022-09-16 11:25:15','2022-09-19 14:12:45',0,'2022-09-16 11:25:15','2022-09-19 14:12:46','7',910772,'54765657875','Driving Licence',2,4,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',3,1,3,2500,0,0,5000,13,650,5650,0,NULL,2,5000,NULL,'Five thousand six hundred and fifty  only.'),
(66,NULL,'2022-09-19','2022-09-19','checked_out','2022-09-19 14:14:26','2023-07-18 01:52:50',0,'2022-09-19 14:14:26','2023-07-18 01:52:50','2',996966,'231654654','Passport',NULL,5,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,2,3500,0,0,17500,13,2275,19775,0,0,5,17500,NULL,'Nineteen thousand seven hundred and seventy five  only.'),
(67,NULL,'2022-09-19','2022-09-19','checked_out','2022-09-19 14:14:26','2023-07-18 01:50:43',0,'2022-09-19 14:14:26','2023-07-18 01:50:43','1',289523,'231654654','Passport',NULL,5,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755',1,1,2,3500,5,875,16625,13,2269.31,19725.56,5,831.25,5,17500,NULL,'Nineteen thousand seven hundred and twenty five  only.'),
(68,NULL,'2023-07-17','2023-07-17','cancelled','2023-07-18 00:23:53',NULL,0,'2023-07-18 00:23:53','2023-07-18 01:42:48','3',378851,'sdfsdfsdfsdfsdf','Citizenship',1,3,'abcjkasd','mail@mail.com','asdfasdf','9874563210',2,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(69,NULL,'2023-07-17','2023-07-17','cancelled','2023-07-18 00:23:53',NULL,0,'2023-07-18 00:23:53','2023-07-18 01:42:44','4',282582,'sdfsdfsdfsdfsdf','Citizenship',1,3,'abcjkasd','mail@mail.com','asdfasdf','9874563210',2,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(70,NULL,'2023-07-17','2023-07-17','cancelled','2023-07-18 00:45:56',NULL,0,'2023-07-18 00:45:56','2023-07-18 01:42:32','5',344486,'sdafsadfasdf','Passport',2,8,'AMrendra','mail@email.com','sdgfasdfgdsg','9874563210',3,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(71,NULL,'2023-07-17','2023-07-17','cancelled','2023-07-18 00:45:56',NULL,0,'2023-07-18 00:45:56','2023-07-18 01:42:27','6',853828,'sdafsadfasdf','Passport',2,8,'AMrendra','mail@email.com','sdgfasdfgdsg','9874563210',3,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(72,NULL,'2023-07-17','2023-07-17','cancelled','2023-07-18 01:41:45',NULL,0,'2023-07-18 01:41:45','2023-07-18 01:42:23','7',492298,'fasdfasd','Passport',3,3,'dfasdfsad','afa@mail.com','asdfasdf','1234554543',3,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(73,NULL,'2023-07-17','2023-07-17','cancelled','2023-07-18 02:05:10',NULL,0,'2023-07-18 02:05:10','2023-07-18 02:09:55','5',590470,'asdfasdf','Passport',3,2,'cvcvsdfsdd','asdf@maiilc.com','sdfsdf','4234343432',3,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(74,NULL,'2023-07-17','2023-07-17','cancelled','2023-07-18 02:05:18',NULL,0,'2023-07-18 02:05:18','2023-07-18 02:09:59','6',868613,'asdfasdf','Passport',3,2,'cvcvsdfsdd','asdf@maiilc.com','sdfsdf','4234343432',3,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(75,NULL,'2023-07-17','2023-07-17','cancelled','2023-07-18 02:07:08',NULL,0,'2023-07-18 02:07:08','2023-07-18 02:10:04','7',644876,'fasdfasd','Passport',3,3,'gsdgdfg','dsfgs@mail.com','sdfgsdf','4334232134',3,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(76,NULL,'2023-07-17','2023-07-17','cancelled','2023-07-18 02:07:19',NULL,0,'2023-07-18 02:07:19','2023-07-18 02:10:08','8',658704,'fasdfasd','Passport',3,3,'gsdgdfg','dsfgs@mail.com','sdfgsdf','4334232134',3,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(77,NULL,'2023-07-17','2023-07-17','cancelled','2023-07-18 02:10:53',NULL,0,'2023-07-18 02:10:53','2023-07-18 02:14:21','5',278947,'34343222','Passport',4,5,'dfsafasdfa','asd@mail.com','sdfasdf','2222222222',3,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(78,NULL,'2023-07-17','2023-07-17','cancelled','2023-07-18 02:11:03',NULL,0,'2023-07-18 02:11:03','2023-07-18 02:14:17','6',581683,'34343222','Passport',4,5,'dfsafasdfa','asd@mail.com','sdfasdf','2222222222',3,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(79,NULL,'2023-07-17','2023-07-17','cancelled','2023-07-18 02:17:11',NULL,0,'2023-07-18 02:17:11','2023-07-18 02:20:35','5',200773,'asdfasd','Passport',4,4,'asfasdf','df@mail.com','asdfas','3434334767',3,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(80,NULL,'2023-07-17','2023-07-17','confirmed','2023-07-18 02:21:22',NULL,1,'2023-07-18 02:21:22','2023-07-18 02:21:22','5',549905,'fasdfasdf','Passport',4,4,'xfgsdfgsd','gdsfg@mail.vom','fgsdfg','2222222222',3,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(81,NULL,'2023-07-17','2023-07-17','confirmed','2023-07-18 02:21:40',NULL,1,'2023-07-18 02:21:40','2023-07-18 02:21:40','6',798842,'fasdfasdf','Passport',4,4,'xfgsdfgsd','gdsfg@mail.vom','fgsdfg','2222222222',3,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(82,NULL,'2023-07-17','2023-07-17','confirmed','2023-07-18 02:21:48',NULL,1,'2023-07-18 02:21:48','2023-07-18 02:21:48','7',536231,'fasdfasdf','Passport',4,4,'xfgsdfgsd','gdsfg@mail.vom','fgsdfg','2222222222',3,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(83,NULL,'2023-07-17','2023-07-17','confirmed','2023-07-18 02:21:54',NULL,1,'2023-07-18 02:21:54','2023-07-18 02:21:54','8',683640,'fasdfasdf','Passport',4,4,'xfgsdfgsd','gdsfg@mail.vom','fgsdfg','2222222222',3,1,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(84,NULL,'2023-07-17','2023-07-17','checked_in','2023-07-18 02:23:47',NULL,1,'2023-07-18 02:23:47','2023-07-21 13:25:50','10',851106,'asdfasd','Driving Licence',1,1,'sdfasdf','fasdf@mail.com','sadfasd','1111111111',4,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `booking_message` */

DROP TABLE IF EXISTS `booking_message`;

CREATE TABLE `booking_message` (
  `id` double NOT NULL AUTO_INCREMENT,
  `from_date` date NOT NULL,
  `to_Date` date NOT NULL,
  `number_of_rooms` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `no_of_adult_guest` int(11) NOT NULL,
  `no_of_child_guest` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `address` varchar(2000) DEFAULT NULL,
  `id_type` varchar(100) NOT NULL,
  `id_number` varchar(50) NOT NULL,
  `unique_msg_code` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_date` date NOT NULL,
  `updated_date` date DEFAULT NULL,
  `delete_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `booking_message_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  CONSTRAINT `booking_message_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `booking_message` */

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `category` */

insert  into `category`(`id`,`title`,`status`) values 
(1,'Sweet Super Premium King Bedroom (with separate living room attached)',1),
(2,'Joiner Sweet (Attached living room)',1),
(3,'Super Premium Triple King Bedroom',1),
(4,'Super Premium Triple (With no attached bathroom)',1),
(5,'Super Premium Triple (With attached bathroom)',1);

/*Table structure for table `companyprofile` */

DROP TABLE IF EXISTS `companyprofile`;

CREATE TABLE `companyprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(500) NOT NULL,
  `registrationNo` varchar(100) NOT NULL,
  `companyAddress` varchar(500) NOT NULL,
  `companyContact` varchar(100) NOT NULL,
  `licenseNo` text NOT NULL,
  `validFrom` date NOT NULL,
  `validUpTo` date NOT NULL,
  `createdDate` datetime NOT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `companyStarRating` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `companyprofile` */

insert  into `companyprofile`(`id`,`companyName`,`registrationNo`,`companyAddress`,`companyContact`,`licenseNo`,`validFrom`,`validUpTo`,`createdDate`,`updatedDate`,`companyStarRating`) values 
(1,'Demo Hotel Pvt. Ltd.','1234567890_Demo','MainRoad, Ghantaghar, Birgunj, Parsa-Nepal','+9779876543210, +977-012-12-1234','XXX-XXXXXXX-xxxxxx-xxxxxxx','2023-07-21','2024-07-20','2023-07-21 13:43:23',NULL,5);

/*Table structure for table `contact_us` */

DROP TABLE IF EXISTS `contact_us`;

CREATE TABLE `contact_us` (
  `id` double NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `message` longtext NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `read_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `contact_us` */

insert  into `contact_us`(`id`,`full_name`,`contact`,`message`,`created_date`,`updated_date`,`status`,`read_status`) values 
(1,'test','9745632100','this is ,essage','2022-09-16 14:28:38','2022-09-16 14:46:43',0,0),
(2,'dfg dfg fgh','3545645646','fd gkjsh dguihdjh fds jhkghdfsjgbdfjkhfslkjk fosedjk ;lasdaj sdf','2022-09-16 14:48:08','2023-07-21 13:24:52',0,1);

/*Table structure for table `floor` */

DROP TABLE IF EXISTS `floor`;

CREATE TABLE `floor` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `floor` */

insert  into `floor`(`id`,`title`,`status`) values 
(0,'Ground Floor',1),
(1,'First Floor',1),
(2,'Second Floor',1),
(3,'Third Floor',1),
(4,'Fourth Floor',1),
(5,'Fifth Floor',1),
(6,'Sixth Floor',1),
(7,'Seventh Floor',1),
(8,'Eighth Floor',1),
(9,'Nineth Floor',1),
(10,'Tenth Floor',1);

/*Table structure for table `food_menu` */

DROP TABLE IF EXISTS `food_menu`;

CREATE TABLE `food_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `food_menu` */

insert  into `food_menu`(`id`,`title`,`type`,`description`,`status`,`created_date`,`updated_date`,`price`) values 
(1,'Veg Sandwich','Sandwich & Burger',NULL,1,'2022-08-19 17:00:29','2022-08-30 10:11:26',250),
(2,'Chicken Sandwich','Sandwich & Burger',NULL,1,'2022-08-19 17:01:52','2022-08-22 12:18:06',250),
(3,'Egg Sandwich','Sandwich & Burger',NULL,1,'2022-08-19 17:02:09','2022-08-19 17:02:09',200),
(4,'Club Sandwich','Sandwich & Burger',NULL,1,'2022-08-19 17:02:31','2022-08-22 12:18:25',330),
(5,'Veg Burger','Sandwich & Burger',NULL,1,'2022-08-19 17:03:40','2022-08-22 12:18:44',190),
(6,'Chicken Burger','Sandwich & Burger',NULL,1,'2022-08-19 17:04:05','2022-08-22 12:19:01',240),
(7,'Cheese Burger','Sandwich & Burger',NULL,1,'2022-08-19 17:12:49','2022-08-19 17:12:49',200),
(8,'Veg Pizza','Pizza',NULL,1,'2022-08-19 17:13:11','2022-08-22 12:17:25',350),
(9,'Cheese Pizza','Pizza',NULL,1,'2022-08-19 17:13:47','2022-08-22 12:17:36',370),
(10,'Chicken Pizza','Pizza',NULL,1,'2022-08-19 17:14:30','2022-08-22 12:19:27',470),
(11,'Mushroom Pizza','Pizza',NULL,1,'2022-08-19 17:14:51','2022-08-22 12:19:49',420),
(12,'Special Hawaiian Pizza','Pizza',NULL,1,'2022-08-19 17:15:47','2022-08-19 17:15:47',500),
(13,'Margarita pizza','Pizza',NULL,1,'2022-08-19 17:16:09','2022-08-19 17:16:09',420),
(14,'Veg Steam','MO:MO:',NULL,1,'2022-08-19 17:16:30','2022-08-19 17:16:30',160),
(15,'Kothey','MO:MO:',NULL,1,'2022-08-19 17:16:50','2022-08-19 17:16:50',170),
(16,'jhol','MO:MO:',NULL,1,'2022-08-19 17:17:10','2022-08-22 12:20:34',190),
(17,'B&B Special','MO:MO:',NULL,1,'2022-08-19 17:17:40','2022-08-19 17:17:40',250),
(18,'Chicken Steam','MO:MO:',NULL,1,'2022-08-19 17:18:02','2022-08-19 17:18:02',190),
(19,'Kothey','MO:MO:',NULL,1,'2022-08-19 17:18:27','2022-08-19 17:18:27',210),
(20,'Jhole','MO:MO:',NULL,0,'2022-08-19 17:18:39','2022-08-19 17:18:39',190),
(21,'B&B Special','MO:MO:',NULL,0,'2022-08-19 17:19:00','2022-08-19 17:19:00',250),
(22,'Fried','MO:MO:',NULL,1,'2022-08-19 17:19:18','2022-08-19 17:19:18',180),
(23,'C.','MO:MO:',NULL,1,'2022-08-19 17:19:29','2022-08-19 17:19:29',190),
(24,'Crunchy','MO:MO:',NULL,1,'2022-08-19 17:19:52','2022-08-22 12:22:22',190),
(25,'Fried','MO:MO:',NULL,1,'2022-08-19 17:20:09','2022-08-22 12:26:27',210),
(26,'C.','MO:MO:',NULL,0,'2022-08-19 17:20:26','2022-08-19 17:20:26',190),
(27,'Cruncy','MO:MO:',NULL,0,'2022-08-19 17:20:42','2022-08-19 17:20:42',190),
(28,'Veg Thukppa','Thukppa',NULL,1,'2022-08-19 17:23:04','2022-08-22 12:37:44',180),
(29,'Chicken Thukppa','Thukppa',NULL,1,'2022-08-19 17:23:41','2022-08-22 12:38:07',230),
(30,'Egg Thukppa','Thukppa',NULL,1,'2022-08-19 17:24:29','2022-08-22 12:38:31',200),
(31,'Mutton Thukppa','Thukppa',NULL,1,'2022-08-19 17:25:04','2022-08-22 12:39:08',270),
(32,'Mixed Thukppa','Thukppa',NULL,1,'2022-08-19 17:25:52','2022-08-22 12:39:48',310),
(33,'Veg Thakali Set','Thakali Khana',NULL,1,'2022-08-19 17:26:57','2022-08-19 17:26:57',380),
(34,'Chicken Thakali Set','Thakali Khana',NULL,1,'2022-08-19 17:27:49','2022-08-19 17:27:49',450),
(35,'Mutton Thakali Set','Thakali Khana',NULL,1,'2022-08-19 17:28:35','2022-08-19 17:28:35',550),
(36,'Cream of Chicken Soup','Soup',NULL,1,'2022-08-19 17:29:35','2022-08-19 17:29:35',190),
(37,'Chicken Mushroom Soup','Soup',NULL,1,'2022-08-19 17:30:59','2022-09-06 15:49:37',210),
(38,'Veg Mushroom Soup','Soup',NULL,1,'2022-08-19 17:31:45','2022-08-19 17:31:45',170),
(39,'Cream of Tomato Soup','Soup',NULL,1,'2022-08-19 17:32:55','2022-08-19 17:32:55',130),
(40,'Sweet Corn Soup','Soup',NULL,1,'2022-08-19 17:34:51','2022-08-19 17:34:51',150),
(41,'Hot Sour Soup Veg/Nonveg','Soup',NULL,1,'2022-08-19 17:35:55','2022-08-19 17:35:55',170),
(42,'Manchow Soup Veg/Nonveg','Soup',NULL,1,'2022-08-19 17:39:27','2022-08-19 17:39:27',150),
(43,'Lung Fung Soup Chicken','Soup',NULL,1,'2022-08-19 17:40:29','2022-08-19 17:40:29',170),
(44,'Veg Wanton Soup','Soup',NULL,1,'2022-08-19 17:41:17','2022-08-19 17:41:17',170),
(45,'Chicken Wanton Soup','Soup',NULL,1,'2022-08-19 17:42:09','2022-08-19 17:42:09',220),
(46,'Plain Rice','Indian Biryani Rice',NULL,1,'2022-08-19 17:42:49','2022-08-19 17:42:49',160),
(47,'Jeera Rice','Indian Biryani Rice',NULL,1,'2022-08-19 17:43:42','2022-08-19 17:43:42',180),
(48,'Veg Briyani','Indian Biryani Rice',NULL,1,'2022-08-19 17:44:28','2022-08-19 17:44:28',300),
(49,'Chicken Biryani','Indian Biryani Rice',NULL,1,'2022-08-19 17:45:22','2022-08-19 17:45:22',400),
(50,'Egg Biryani ','Indian Biryani Rice',NULL,1,'2022-08-19 17:46:46','2022-08-22 12:30:43',350),
(51,'Egg Pulao','Indian Biryani Rice',NULL,1,'2022-08-19 17:47:24','2022-08-19 17:47:24',280),
(52,'Mutton Biryani','Indian Biryani Rice',NULL,1,'2022-08-19 17:48:04','2022-08-19 17:48:04',450),
(53,'Orange/Pineaaple/Guava/Strawberry','Soft & Cold Drinks',NULL,1,'2022-08-19 17:48:36','2022-08-22 12:34:16',100),
(54,'Coke / Fanta / Sprite / Slice / Dew','Soft & Cold Drinks',NULL,1,'2022-08-19 17:49:45','2022-08-22 12:34:33',70),
(55,'Mineral Water','Soft & Cold Drinks',NULL,1,'2022-08-19 17:50:39','2022-08-22 12:35:04',50),
(56,'Masala Drink','Soft & Cold Drinks',NULL,1,'2022-08-19 17:51:28','2022-08-22 12:35:25',50),
(57,'Masala Coke / Dew / Sprite','Soft & Cold Drinks',NULL,1,'2022-08-19 17:53:11','2022-08-22 12:35:43',120),
(58,'Fruit Juice','Soft & Cold Drinks',NULL,1,'2022-08-19 17:53:49','2022-08-22 12:35:54',120),
(59,'Apple/ Pineapple/ Guava/ Strawberry/ Orange/ Mango Juice','Soft & Cold Drinks',NULL,1,'2022-08-19 17:55:56','2022-08-22 12:36:07',100),
(60,'Chicken Meat Ball','Snacks Nonveg',NULL,1,'2022-08-19 17:56:39','2022-08-22 12:57:41',320),
(61,'Chicken Pakauda','Snacks Nonveg',NULL,1,'2022-08-19 17:57:34','2022-08-22 12:58:47',320),
(62,'Chicken Chhoila','Snacks Nonveg',NULL,1,'2022-08-19 17:58:30','2022-08-22 12:59:06',380),
(63,'Chicken Tass','Snacks Nonveg',NULL,1,'2022-08-19 17:59:25','2022-08-22 12:59:28',400),
(64,'Chicken Spring Roll','Snacks Nonveg',NULL,1,'2022-08-19 17:59:59','2022-08-22 12:59:51',220),
(65,'Chicken Finger','Snacks Nonveg',NULL,1,'2022-08-19 18:00:32','2022-08-22 13:00:11',330),
(66,'Mutton Sekuwa/ Chhola/ Tsss','Snacks Nonveg',NULL,1,'2022-08-19 18:02:14','2022-08-22 13:03:13',500),
(67,'Mutton Pani Sekuwa/ Butuwa','Snacks Nonveg',NULL,1,'2022-08-19 18:03:11','2022-08-22 13:03:43',480),
(68,'Bacardi (White/Black)','Rum (60ml)',NULL,1,'2022-08-22 12:04:40','2022-08-22 12:15:17',470),
(69,'Malebu Rum','Rum (60ml)',NULL,1,'2022-08-22 12:05:05','2022-08-22 12:12:18',470),
(70,'Grand Master','Rum (60ml)',NULL,1,'2022-08-22 12:06:16','2022-08-22 12:16:29',210),
(71,'Red Wine','Wine with Bottle',NULL,1,'2022-08-22 12:06:42','2022-08-22 12:06:42',2200),
(72,'Robert Red/White Wine','Wine with Bottle',NULL,1,'2022-08-22 12:07:15','2022-08-22 12:07:15',2100),
(73,'Jacobs Red/White Wine','Wine with Bottle',NULL,1,'2022-08-22 12:07:45','2022-08-22 12:07:45',2100),
(74,'White Wine (180ml)','Wine with Bottle',NULL,1,'2022-08-22 12:08:20','2022-08-22 12:08:20',350),
(75,'Double Apple','Hukka',NULL,1,'2022-08-22 12:08:47','2022-08-22 12:08:47',500),
(76,'Paan Rass','Hukka',NULL,1,'2022-08-22 12:09:09','2022-08-22 12:09:09',550),
(77,'Lemon Mintrus','Hukka',NULL,1,'2022-08-22 12:11:40','2022-08-22 12:11:40',550),
(78,'Khukuri Rum','Rum (60ml)',NULL,1,'2022-08-22 12:16:18','2022-08-22 12:16:18',200),
(79,'Fried','MO:MO:',NULL,1,'2022-08-22 12:25:56','2022-08-22 12:25:56',210),
(80,'Veg Sizzler','Sizzler',NULL,1,'2022-08-22 12:27:43','2022-08-22 12:27:43',350),
(81,'Chicken Sizzler','Sizzler',NULL,1,'2022-08-22 12:28:13','2022-08-22 12:28:13',440),
(82,'Sizzler MO:MO Chicken','Sizzler',NULL,1,'2022-08-22 12:28:42','2022-08-22 12:28:42',320),
(83,'B & B Special Chicken Hot Pan','B&B Special',NULL,1,'2022-08-22 12:45:53','2022-08-22 12:45:53',680),
(84,'B & B Special Vag Hot Pan','B&B Special',NULL,1,'2022-08-22 12:46:23','2022-08-22 12:46:23',580),
(85,'B & B Special Hot Pan Prawans','B&B Special',NULL,1,'2022-08-22 12:46:58','2022-08-22 12:47:42',600),
(86,'Prawans Hot beary or Sechwan sauce','B&B Special',NULL,1,'2022-08-22 12:48:13','2022-08-22 12:48:13',605),
(87,'Chicken Chilli / Manchurian','Main Course',NULL,1,'2022-08-22 12:49:09','2022-08-22 12:49:09',340),
(88,'Rosted Chicken Chilli With bone','Main Course',NULL,1,'2022-08-22 12:49:38','2022-08-22 12:49:38',320),
(89,'Kung Bao Chicken','Main Course',NULL,1,'2022-08-22 12:50:23','2022-08-22 12:50:23',340),
(90,'Mongolian Chicken','Main Course',NULL,1,'2022-08-22 12:50:50','2022-08-22 12:50:50',340),
(91,'Prawns Chilli','Main Course',NULL,1,'2022-08-22 12:51:28','2022-08-22 12:51:28',355),
(92,'Hot Garlic panner','Main Course',NULL,1,'2022-08-22 12:52:06','2022-08-22 12:52:06',350),
(93,'Scheiwan Chicken ','Main Course',NULL,1,'2022-08-22 12:52:46','2022-08-22 12:52:46',300),
(94,'Veg Manchurian ','Main Course',NULL,1,'2022-08-22 12:55:16','2022-08-22 12:55:16',200),
(95,'Tempura Prawns','Main Course',NULL,1,'2022-08-22 12:55:50','2022-08-22 12:55:50',420),
(96,'Veg Tempura','Main Course',NULL,1,'2022-08-22 12:56:12','2022-08-22 12:56:12',150),
(97,'Chicken Popcorn','Snacks Nonveg',NULL,1,'2022-08-22 13:04:08','2022-08-22 13:04:08',350),
(98,'Chicken Lollipop','Snacks Nonveg',NULL,1,'2022-08-22 13:06:34','2022-08-22 13:06:34',380),
(99,'Chicken Drumstick','Snacks Nonveg',NULL,1,'2022-08-22 13:07:10','2022-08-22 13:07:10',390),
(100,'Chicken Wings Fried/Poleko','Snacks Nonveg',NULL,1,'2022-08-22 13:07:51','2022-08-22 13:07:51',350),
(101,'Chicken Butuwa','Snacks Nonveg',NULL,1,'2022-08-22 13:08:18','2022-08-22 13:08:18',360),
(102,'Chicken Fried','Snacks Nonveg',NULL,1,'2022-08-22 13:08:48','2022-08-22 13:08:48',350),
(103,'Schicken Sadneko/Sekuwa/Tawa','Snacks Nonveg',NULL,1,'2022-08-22 13:09:42','2022-08-22 13:09:42',395),
(104,'Drogen Chilli','Snacks Nonveg',NULL,1,'2022-08-22 13:10:18','2022-08-22 13:10:18',0),
(105,'Cheese Corn Fried','Snacks Veg',NULL,1,'2022-08-22 13:11:00','2022-08-22 13:11:00',320),
(106,'Plain Peanuts/Sadheko','Snacks Veg',NULL,1,'2022-08-22 13:11:44','2022-08-22 13:11:44',120),
(107,'Veg Crispy','Snacks Veg',NULL,1,'2022-08-22 13:12:13','2022-08-22 13:12:13',220),
(108,'Mixed Veg Pakauda','Snacks Veg',NULL,1,'2022-08-22 13:12:36','2022-08-22 13:12:36',170),
(109,'Panner Pakauda','Snacks Veg',NULL,1,'2022-08-22 13:13:14','2022-08-22 13:13:14',350),
(110,'Mushroom Pakauda','Snacks Veg',NULL,1,'2022-08-22 13:13:37','2022-08-22 13:13:37',300),
(111,'Dry Papad','Snacks Veg',NULL,1,'2022-08-22 13:14:10','2022-08-22 13:14:10',330),
(112,'Masala Papad','Snacks Veg',NULL,1,'2022-08-22 13:14:39','2022-08-22 13:14:39',50),
(113,'French/Kaju Fried ','Snacks Veg',NULL,1,'2022-08-22 13:15:32','2022-08-22 13:15:32',150),
(114,'Cauliflower Manchurian/Chilli','Snacks Veg',NULL,1,'2022-08-22 13:16:18','2022-08-22 13:16:18',200),
(115,'Mushroom Chilli','Snacks Veg',NULL,1,'2022-08-22 13:21:45','2022-08-22 13:21:45',320),
(116,'Mushroom Jeera Fried','Snacks Veg',NULL,1,'2022-08-22 13:22:26','2022-08-22 13:22:26',320),
(117,'Chips Chilli','Snacks Veg',NULL,1,'2022-08-22 13:23:10','2022-08-22 13:23:10',190),
(118,'Veg Ball Chilli/Manchurian ','Snacks Veg',NULL,1,'2022-08-22 13:23:41','2022-08-22 13:23:41',190),
(119,'Cheese Ball','Snacks Veg',NULL,1,'2022-08-22 13:24:29','2022-08-22 13:24:29',450),
(120,'Paneer Masala','Curry Veg',NULL,1,'2022-08-22 13:25:07','2022-08-22 13:25:07',350),
(121,'Gobi Masala','Curry Veg',NULL,1,'2022-08-22 13:25:29','2022-08-22 13:25:29',180),
(122,'Aloo Matar','Curry Veg',NULL,1,'2022-08-22 13:25:47','2022-08-22 13:25:47',180),
(123,'Mixed veg Curry','Curry Veg',NULL,1,'2022-08-22 13:26:18','2022-08-22 13:26:18',220),
(124,'Mushroom Curry','Curry Veg',NULL,1,'2022-08-22 13:26:45','2022-08-22 13:26:45',250),
(125,'Plain Dal','Curry Veg',NULL,1,'2022-08-22 13:27:19','2022-08-22 13:27:19',120),
(126,'Dal Fried ','Curry Veg',NULL,1,'2022-08-22 13:27:47','2022-08-22 13:27:47',180),
(127,'Paneer Butter masala','Curry Veg',NULL,1,'2022-08-22 13:28:28','2022-08-22 13:28:28',370),
(128,'Dal Makhani','Curry Veg',NULL,1,'2022-08-22 13:28:50','2022-08-22 13:28:50',190),
(129,'Sahi Paneer ','Curry Veg',NULL,1,'2022-08-22 13:29:22','2022-08-22 13:29:22',350),
(130,'Chicken Curry','Curry Non-Veg',NULL,1,'2022-08-22 13:31:00','2022-08-22 13:31:00',350),
(131,'Kadai Chicken','Curry Non-Veg',NULL,1,'2022-08-22 13:31:17','2022-08-22 13:31:17',370),
(132,'Chicken Masala','Curry Non-Veg',NULL,1,'2022-08-22 13:32:03','2022-08-22 13:32:03',360),
(133,'Chicken Butter Masala','Curry Non-Veg',NULL,1,'2022-08-22 13:32:29','2022-08-22 13:32:29',380),
(134,'Mutton Curry','Curry Non-Veg',NULL,1,'2022-08-22 13:32:53','2022-08-22 13:32:53',460),
(135,'Dopyaza Chicken','Curry Non-Veg',NULL,1,'2022-08-22 13:33:18','2022-08-22 13:33:18',400),
(136,'Plain Naan','Tandoor',NULL,1,'2022-08-22 13:33:35','2022-08-22 13:33:35',55),
(137,'Butter Naan','Tandoor',NULL,1,'2022-08-22 13:34:01','2022-08-22 13:34:01',65),
(138,'garlic Naan','Tandoor',NULL,1,'2022-08-22 13:34:21','2022-08-22 13:34:21',80),
(139,'Keema Naan','Tandoor',NULL,1,'2022-08-22 13:34:40','2022-08-22 13:34:40',170),
(140,'Plain Roti','Tandoor',NULL,1,'2022-08-22 13:35:00','2022-08-22 13:35:00',25),
(141,'Butter Roti','Tandoor',NULL,1,'2022-08-22 13:35:21','2022-08-22 13:35:21',35),
(142,'Tandoori Chicken Half','Tandoor',NULL,1,'2022-08-22 13:35:43','2022-08-22 13:35:43',400),
(143,'Tandoori chicken Full','Tandoor',NULL,1,'2022-08-22 13:36:11','2022-08-22 13:36:11',700),
(144,'Chicken Tikka','Tandoor',NULL,1,'2022-08-22 13:36:34','2022-08-22 13:36:34',400),
(145,'Green salad','Salad',NULL,1,'2022-08-22 13:38:30','2022-08-22 13:38:30',155),
(146,'Nepali Style Green Salad','Salad',NULL,1,'2022-08-22 13:38:53','2022-08-22 13:38:53',160),
(147,'Chicken Hawaiian Salad','Salad',NULL,1,'2022-08-22 13:39:19','2022-08-22 13:39:19',260),
(148,'Fruit Salad','Salad',NULL,1,'2022-08-22 13:39:36','2022-08-22 13:39:36',250),
(149,'Tuborg Delaxe/Gold','BEERS',NULL,1,'2022-08-22 13:40:39','2022-08-22 13:40:39',620),
(150,'Tuborg Strong','BEERS',NULL,1,'2022-08-22 13:40:59','2022-08-22 13:40:59',550),
(151,'Carlsberg','BEERS',NULL,1,'2022-08-22 13:41:24','2022-08-22 13:41:24',650),
(152,'Warsteiner','BEERS',NULL,1,'2022-08-22 13:41:57','2022-08-22 13:41:57',500),
(153,'Nepal Ice','BEERS',NULL,1,'2022-08-22 13:42:15','2022-08-22 13:42:15',450),
(154,'Namaste Beer','BEERS',NULL,1,'2022-08-22 13:42:34','2022-08-22 13:42:34',450),
(155,'Tensberg','BEERS',NULL,1,'2022-08-22 13:42:58','2022-08-22 13:42:58',450),
(156,'Kingfisher','BEERS',NULL,1,'2022-08-22 13:43:23','2022-08-22 13:43:23',450),
(157,'Tuborg Strong/Small','BEERS',NULL,1,'2022-08-22 13:43:47','2022-08-22 13:43:47',450),
(158,'Budwiser','BEERS',NULL,1,'2022-08-22 13:44:09','2022-08-22 13:44:09',550),
(159,'Apple Cider','BEERS',NULL,1,'2022-08-22 13:44:30','2022-08-22 13:44:30',260),
(160,'Red Bull','BEERS',NULL,1,'2022-08-22 13:45:15','2022-08-22 13:45:15',300),
(161,'Ruslan Vodka','Vodka (60ml)',NULL,1,'2022-08-22 13:45:41','2022-08-22 13:45:41',230),
(162,'MT 8848','Vodka (60ml)',NULL,1,'2022-08-22 13:45:58','2022-08-22 13:45:58',240),
(163,'Absolute Vodka','Vodka (60ml)',NULL,1,'2022-08-22 13:46:21','2022-08-22 13:46:21',540),
(164,'Exe Vodka','Vodka (60ml)',NULL,1,'2022-08-22 13:46:41','2022-08-22 13:46:41',270),
(165,'White Mischeif','Vodka (60ml)',NULL,1,'2022-08-22 13:47:06','2022-08-22 13:47:06',260),
(166,'Towel','Laundry','Room facilities.',1,'2022-09-15 15:37:47','2022-09-15 15:37:47',50),
(167,'Bowl','Damaged Item','Item broken',1,'2022-09-15 15:38:34','2022-09-15 15:38:34',150),
(168,'Ruslan Vodka 90ml','Vodka (60ml)',NULL,1,'2022-09-16 11:36:19','2022-09-16 11:36:19',230),
(169,'Pillow Cover','Laundry',NULL,1,'2022-09-16 11:47:17','2022-09-16 11:47:17',50);

/*Table structure for table `food_type` */

DROP TABLE IF EXISTS `food_type`;

CREATE TABLE `food_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `food_type` */

insert  into `food_type`(`id`,`title`,`status`) values 
(1,'Sandwich & Burger',1),
(2,'Pizza',1),
(3,'MO:MO:',1),
(4,'Thukppa',1),
(5,'Thakali Khana',1),
(6,'Soup',1),
(7,'Indian Biryani Rice',1),
(8,'Soft & Cold Drinks',1),
(9,'Snacks Veg',0),
(10,'Curry Veg',1),
(11,'Curry Non-Veg',1),
(12,'Tandoor',1),
(13,'Salad',1),
(14,'Snacks Veg',1),
(15,'BEERS',1),
(16,'Vodka (60ml)',1),
(17,'Chinese',1),
(18,'Main Course',1),
(19,'Snacks Nonveg',1),
(20,'B&B Special',1),
(21,'Hot Beverage',1),
(22,'Lasi & Milk Shake',1),
(23,'Break Tast',1),
(24,'Sizzler',1),
(25,'Wishkey (60ml)',1),
(26,'Premium & Regular Wiskey (600ml) ',1),
(27,'Rum (60ml)',1),
(28,'Wine with Bottle',1),
(29,'Hukka',1),
(30,'Laundry',1),
(31,'Damaged Item',1);

/*Table structure for table `gallery` */

DROP TABLE IF EXISTS `gallery`;

CREATE TABLE `gallery` (
  `id` double NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `date` date NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `images` varchar(20000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `gallery` */

insert  into `gallery`(`id`,`title`,`description`,`date`,`created_date`,`updated_date`,`status`,`images`) values 
(1,'test images','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.','2022-08-18','2022-08-18 16:06:07','2022-08-18 16:06:07',1,'1660818066552.jpg,1660818066559.jpg,1660818066641.jpg,1660818066665.jpg'),
(2,'this is title','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.','2022-08-18','2022-08-18 16:07:23','2022-08-18 16:07:23',1,'1660818143027.jpg,1660818143037.jpg,1660818143042.png,1660818143102.jpg'),
(3,'this is all images','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.','2022-08-18','2022-08-18 16:07:48','2022-08-18 16:07:48',0,'1660818167382.jpg,1660818167414.jpg,1660818167425.jpg,1660818167433.jpg,1660818167437.jpg'),
(4,'test','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.','2022-08-18','2022-08-18 16:08:28','2022-08-18 16:08:28',1,'1660818208400.jpg,1660818208406.jpg,1660818208418.jpg,1660818208420.jpg'),
(5,'2022 meetup','this is regarding the meetup','2022-08-18','2022-08-18 17:09:47','2022-08-18 17:09:47',1,'1660821886925.jpg,1660821886936.png,1660821886996.jpg,1660821887014.jpg');

/*Table structure for table `resturant_table` */

DROP TABLE IF EXISTS `resturant_table`;

CREATE TABLE `resturant_table` (
  `id` double NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `resturant_table_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `resturant_table` */

insert  into `resturant_table`(`id`,`title`,`type_id`,`status`,`created_date`,`updated_date`) values 
(1,'TABLE-1',1,1,'2022-09-05 10:59:01','2022-09-06 10:19:19'),
(2,'TABLE-2',1,1,'2022-09-05 10:59:01','2022-09-06 10:19:19'),
(3,'TABLE-3',1,1,'2022-09-05 10:59:01','2022-09-06 10:19:19'),
(4,'TABLE-4',1,1,'2022-09-05 10:59:01','2022-09-06 10:19:19'),
(5,'TABLE-5',1,1,'2022-09-05 10:59:01','2022-09-06 10:19:19'),
(6,'TABLE-6',1,1,'2022-09-05 10:59:01','2022-09-06 10:19:19'),
(7,'TABLE-7',1,1,'2022-09-05 10:59:01','2022-09-06 10:19:19'),
(8,'TABLE-8',1,1,'2022-09-05 10:59:01','2022-09-06 10:19:19'),
(9,'TABLE-9',1,1,'2022-09-05 10:59:01','2022-09-06 10:19:19'),
(10,'TABLE-10',1,1,'2022-09-05 10:59:01','2022-09-06 10:19:19'),
(11,'TABLE-11',2,1,'2022-09-05 10:59:01','2022-09-06 10:19:19'),
(12,'TABLE-12',2,1,'2022-09-05 10:59:01','2022-09-06 10:19:19'),
(13,'TABLE-13',2,1,'2022-09-05 10:59:01','2022-09-06 10:19:19'),
(14,'TABLE-14',2,1,'2022-09-05 10:59:01','2022-09-06 10:19:19'),
(15,'TABLE-15',2,1,'2022-09-05 10:59:01','2022-09-06 10:19:19'),
(16,'TABLE-16',2,1,'2022-09-05 10:59:01','2022-09-06 10:19:19'),
(17,'TABLE-17',2,1,'2022-09-05 10:59:01','2022-09-06 10:19:19'),
(18,'TABLE-18',2,1,'2022-09-05 10:59:01','2022-09-06 10:19:19'),
(19,'TABLE-19',2,1,'2022-09-05 10:59:01','2022-09-06 10:19:19'),
(20,'TABLE-20',1,1,'2022-09-08 17:29:43','2022-09-08 17:29:43'),
(21,'TABLE-21',1,1,'2022-09-08 17:29:43','2022-09-08 17:29:43'),
(22,'TABLE-22',1,1,'2022-09-08 17:29:43','2022-09-08 17:29:43'),
(23,'TABLE-23',1,1,'2022-09-08 17:29:43','2022-09-08 17:29:43'),
(24,'TABLE-24',1,1,'2022-09-08 17:29:43','2022-09-08 17:29:43'),
(25,'TABLE-25',1,1,'2022-09-08 17:29:43','2022-09-08 17:29:43'),
(26,'TABLE-26',1,1,'2022-09-08 17:29:43','2022-09-08 17:29:43'),
(27,'TABLE-27',1,1,'2022-09-08 17:29:43','2022-09-08 17:29:43'),
(28,'TABLE-28',1,1,'2022-09-08 17:29:43','2022-09-08 17:29:43'),
(29,'TABLE-29',1,1,'2022-09-08 17:29:43','2022-09-08 17:29:43'),
(30,'TABLE-30',1,1,'2022-09-08 17:39:37','2022-09-08 17:39:37'),
(31,'TABLE-31',1,1,'2022-09-08 17:39:37','2022-09-08 17:39:37'),
(32,'TABLE-32',1,1,'2022-09-08 17:39:37','2022-09-08 17:39:37'),
(33,'TABLE-33',1,1,'2022-09-08 17:39:37','2022-09-08 17:39:37'),
(34,'TABLE-34',1,1,'2022-09-08 17:39:37','2022-09-08 17:39:37'),
(35,'TABLE-35',1,1,'2022-09-08 17:39:37','2022-09-08 17:39:37'),
(36,'TABLE-36',1,1,'2022-09-08 17:39:37','2022-09-08 17:39:37'),
(37,'TABLE-37',1,1,'2022-09-08 17:39:37','2022-09-08 17:39:37'),
(38,'TABLE-38',1,1,'2022-09-08 17:39:37','2022-09-08 17:39:37'),
(39,'TABLE-39',1,1,'2022-09-08 17:39:37','2022-09-08 17:39:37');

/*Table structure for table `resturant_table_setting` */

DROP TABLE IF EXISTS `resturant_table_setting`;

CREATE TABLE `resturant_table_setting` (
  `id` int(11) NOT NULL,
  `prefix` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `start_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `resturant_table_setting` */

insert  into `resturant_table_setting`(`id`,`prefix`,`start_number`) values 
(1,'TABLE-',1);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `role` */

insert  into `role`(`id`,`name`,`status`) values 
(1,'admin',1),
(2,'receiption',1),
(3,'restaurant',1),
(4,'customer',1);

/*Table structure for table `room` */

DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
  `id` double NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `price` double NOT NULL,
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `floor_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `room_status_id` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_status_id` (`room_status_id`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`room_status_id`) REFERENCES `room_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `room` */

insert  into `room`(`id`,`title`,`type_id`,`category_id`,`description`,`price`,`images`,`floor_id`,`created_date`,`updated_date`,`status`,`room_status_id`) values 
(1,'ROOM-401',1,1,'Starting Price',3500,'1661923298794.jpg,1661923298795.jpg',4,'2022-08-31 11:06:39','2022-08-31 11:06:39',1,6),
(2,'ROOM-301',1,1,'Starting Price',3500,'1661923379503.jpg,1661923379505.jpg',3,'2022-08-31 11:08:00','2022-08-31 11:08:00',1,6),
(3,'ROOM-201',1,2,'Starting Price',2500,'1661927578724.jpg,1661927578726.jpg',2,'2022-08-31 12:17:59','2022-08-31 12:17:59',1,6),
(4,'ROOM-302',1,2,'Starting Price',2500,'1661927824584.jpg,1661927824585.jpg',3,'2022-08-31 12:22:05','2022-08-31 12:22:05',1,6),
(5,'ROOM-202',1,3,'Starting Price',2500,'1661928019102.jpg,1661928019104.jpg',2,'2022-08-31 12:25:19','2022-08-31 12:25:19',1,3),
(6,'ROOM-203',1,3,'Starting Price',2500,'1661928019102.jpg,1661928019104.jpg',2,'2022-08-31 12:25:19','2022-08-31 12:25:19',1,3),
(7,'ROOM-303',1,3,'Starting Price',2500,'1661928161626.jpg,1661928161627.jpg',3,'2022-08-31 12:27:42','2022-08-31 12:27:42',1,3),
(8,'ROOM-304',1,3,'Starting Price',2500,'1661928161626.jpg,1661928161627.jpg',3,'2022-08-31 12:27:42','2022-08-31 12:27:42',1,3),
(9,'ROOM-101',1,5,'1 king bedroom & twin 1 bedroom',2500,'1661928332873.jpg,1661928332874.jpg',1,'2022-08-31 12:30:33','2022-08-31 12:30:33',1,6),
(10,'ROOM-102',1,4,'Starting Price',2500,'1661928394879.jpg,1661928394879.jpg',1,'2022-08-31 12:31:35','2022-08-31 12:31:35',1,3);

/*Table structure for table `room_item_bill_details` */

DROP TABLE IF EXISTS `room_item_bill_details`;

CREATE TABLE `room_item_bill_details` (
  `id` double NOT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_price` double DEFAULT NULL,
  `disc_pc` double DEFAULT NULL,
  `disc_amt` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `quantity` double DEFAULT NULL,
  `rate` double DEFAULT NULL,
  KEY `id` (`id`),
  CONSTRAINT `room_item_bill_details_ibfk_1` FOREIGN KEY (`id`) REFERENCES `room_item_bill_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `room_item_bill_details` */

insert  into `room_item_bill_details`(`id`,`item_name`,`item_price`,`disc_pc`,`disc_amt`,`total`,`status`,`quantity`,`rate`) values 
(33,'Veg Sandwich',500,0,0,500,1,2,250),
(33,'Chicken Sandwich',500,0,0,500,1,2,250),
(33,'Veg Burger',380,0,0,380,1,2,190),
(33,'Veg Pizza',700,0,0,700,1,2,350),
(33,'Cream of Tomato Soup',260,0,0,260,1,2,130),
(32,'Chicken Sandwich',5000,10,500,4500,1,20,250),
(32,'Club Sandwich',3300,50,1650,1650,1,10,330),
(32,'Cheese Burger',4000,0,0,4000,1,20,200),
(32,'Veg Pizza',700,2,14,686,1,2,350),
(32,'Fried',360,0,0,360,1,2,180),
(34,'Chicken Sandwich',5000,10,500,4500,1,20,250),
(34,'Veg Burger',9500,10,950,8550,1,50,190),
(35,'Veg Sandwich',750,0,0,750,1,3,250),
(35,'C.',950,0,0,950,1,5,190),
(35,'Veg Pizza',700,0,0,700,1,2,350),
(35,'B&B Special',500,0,0,500,1,2,250),
(36,'Veg Sandwich',500,2,10,490,1,2,250),
(36,'Club Sandwich',660,5,33,627,1,2,330),
(37,'Veg Sandwich',2500,0,0,2500,1,10,250),
(37,'Chicken Sandwich',1250,10,125,1125,1,5,250),
(38,'Veg Sandwich',750,0,0,750,1,3,250),
(38,'Special Hawaiian Pizza',1500,0,0,1500,1,3,500),
(38,'Apple/ Pineapple/ Guava/ Strawberry/ Orange/ Mango Juice',300,0,0,300,1,3,100),
(38,'Prawans Hot beary or Sechwan sauce',1815,0,0,1815,1,3,605),
(39,'Chicken Sandwich',500,0,0,500,1,2,250),
(39,'Egg Sandwich',400,0,0,400,1,2,200),
(39,'Veg Pizza',700,0,0,700,1,2,350),
(39,'Fried',360,0,0,360,1,2,180),
(43,'Mineral Water',100,0,0,100,1,2,50),
(43,'Chicken Sandwich',500,0,0,500,1,2,250),
(43,'Fried',180,0,0,180,1,1,180),
(43,'Veg Mushroom Soup',170,0,0,170,1,1,170),
(43,'Chicken Wanton Soup',440,0,0,440,1,2,220),
(52,'Veg Sandwich',250,0,0,250,1,1,250),
(52,'Chicken Burger',480,0,0,480,1,2,240),
(52,'Veg Pizza',1050,0,0,1050,1,3,350),
(51,'Veg Sandwich',250,0,0,250,1,1,250),
(51,'Chicken Sandwich',500,0,0,500,1,2,250),
(51,'Veg Pizza',350,0,0,350,1,1,350),
(51,'Cheese Burger',400,0,0,400,1,2,200),
(53,'Veg Sandwich',500,2,10,490,1,2,250),
(53,'Veg Burger',570,5,28.5,541.5,1,3,190),
(49,'Egg Sandwich',200,0,0,200,1,1,200),
(54,'Chicken Sandwich',250,0,0,250,1,1,250),
(54,'Veg Pizza',350,0,0,350,1,1,350),
(48,'Egg Sandwich',400,0,0,400,1,2,200),
(55,'Veg Sandwich',500,0,0,500,1,2,250),
(47,'Veg Burger',190,0,0,190,1,1,190),
(47,'Veg Pizza',700,0,0,700,1,2,350),
(56,'Chicken Sandwich',500,0,0,500,1,2,250),
(56,'Veg Pizza',700,0,0,700,1,2,350);

/*Table structure for table `room_item_bill_master` */

DROP TABLE IF EXISTS `room_item_bill_master`;

CREATE TABLE `room_item_bill_master` (
  `id` double NOT NULL AUTO_INCREMENT,
  `room_no` varchar(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `disc_pc` double DEFAULT NULL,
  `disc_amt` double DEFAULT NULL,
  `vat_pc` double DEFAULT NULL,
  `vat_amt` double DEFAULT NULL,
  `payable_amt` double DEFAULT NULL,
  `words` varchar(2000) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `bill_creator` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `gross_total` double DEFAULT NULL,
  `amt_after_disc` double DEFAULT NULL,
  `service_charge` double DEFAULT NULL,
  `delete_status` tinyint(1) DEFAULT NULL,
  `room_booking_id` double DEFAULT NULL,
  `current_room_status` tinyint(1) DEFAULT NULL,
  `service_charge_amount` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_booking_id` (`room_booking_id`),
  CONSTRAINT `room_item_bill_master_ibfk_1` FOREIGN KEY (`room_booking_id`) REFERENCES `booking` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `room_item_bill_master` */

insert  into `room_item_bill_master`(`id`,`room_no`,`name`,`mobile`,`address`,`disc_pc`,`disc_amt`,`vat_pc`,`vat_amt`,`payable_amt`,`words`,`status`,`bill_creator`,`created_date`,`updated_date`,`gross_total`,`amt_after_disc`,`service_charge`,`delete_status`,`room_booking_id`,`current_room_status`,`service_charge_amount`) values 
(24,'ROOM-401','Amrendra Chaurasia','9874563210','Birgunj',5,500,13,13,11300,'Eleven thousend and three hundred',1,'Admin','2022-09-02 15:40:07','2022-09-06 14:21:10',1000,9500,50,0,15,1,NULL),
(28,'ROOM-301','Amrendra Chaurasia','9821273755','Birgunj',0,0,13,0,0,NULL,1,NULL,'2022-09-05 18:13:16',NULL,0,0,0,0,16,1,NULL),
(29,NULL,'Amrendra','9874563210','Birgunj',0,0,13,0,0,NULL,1,'Admin','2022-09-05 18:55:06',NULL,0,0,0,0,1,1,NULL),
(30,'ROOM-401','Amrendra Chaurasia','9821273755','Birgunj',0,0,13,0,0,NULL,1,NULL,'2022-09-06 09:49:44',NULL,0,0,0,0,17,1,NULL),
(31,'ROOM-304','Amrendra Chaurasia','9821273755','Birgunj',0,0,13,0,0,NULL,1,NULL,'2022-09-06 11:23:45',NULL,0,0,0,0,29,1,NULL),
(32,'ROOM-401','Amrendra Chaurasia','9821273755','Birgunj',20,2239.2,13,13,10155.08,'Ten thousand one hundred and fifty five  only.',1,NULL,'2022-09-06 12:43:40','2022-09-06 17:40:13',11196,0,30,0,33,1,NULL),
(33,'ROOM-302','Amrendra Chaurasia','9821273755','Birgunj',20,468,13,13,2228.36,NULL,1,NULL,'2022-09-06 15:43:07','2022-09-06 15:54:28',2340,0,100,0,35,1,NULL),
(34,'ROOM-301','Amrendra Chaurasia','9821273755','Birgunj',10,1305,13,13,13271.85,'Thirteen thousand two hundred and seventy one  only.',1,NULL,'2022-09-06 17:48:26','2022-09-06 17:51:47',13050,0,0,0,32,1,NULL),
(35,'ROOM-401','Amrendra Chaurasia','9821273755','Birgunj',10,290,13,13,3039.7,'Three thousand and thirty nine  only.',1,NULL,'2022-09-06 18:14:58','2022-09-06 18:15:58',2900,0,80,0,37,1,NULL),
(36,'ROOM-401','fhghjfdg','1111111111','hgghhg',10,111.7,13,13,1260.29,'One thousand two hundred and sixty  only.',1,NULL,'2022-09-07 09:54:20','2022-09-07 09:55:32',1117,0,110,0,38,1,NULL),
(37,'ROOM-401','cx cbhcgh','1596324780','fg ghfgh ',362.5,13,13,437.13,3799.63,'Three thousand seven hundred and ninety nine  only.',1,NULL,'2022-09-07 10:10:34','2022-09-07 10:11:20',3625,0,100,0,39,1,NULL),
(38,'ROOM-401','Amrendra Chaurasia','9821273755','Birgunj',349.2,13,13,532.45,4628.25,'Four thousand six hundred and twenty eight  only.',1,NULL,'2022-09-07 10:58:27','2022-09-07 11:04:51',4365,0,80,0,40,1,NULL),
(39,'ROOM-301','Amrendra Chaurasia','9821273755','Birgunj',196,13,13,239.72,2083.72,'Two thousand and eighty three  only.',1,NULL,'2022-09-07 11:09:52','2022-09-07 11:11:06',1960,0,80,0,36,1,NULL),
(40,NULL,'Amrendra Chaurasia','9821273755','Birgunj',0,0,13,0,0,NULL,1,NULL,'2022-09-12 10:04:25',NULL,0,0,0,0,31,1,NULL),
(41,'ROOM-401','Amrendra Chaurasia','9821273755','Birgunj',0,0,13,0,0,NULL,1,NULL,'2022-09-12 10:29:52',NULL,0,0,0,0,47,1,NULL),
(42,'ROOM-301','f gfdgdfg ','1234567890','df dfgfd g',0,0,13,0,0,NULL,1,NULL,'2022-09-14 10:30:59',NULL,0,0,0,0,49,1,NULL),
(43,'ROOM-401','fh gjfdhg ','9874546321','hjgd hf',139,13,13,173.03,1504.03,'One thousand five hundred and four  only.',1,NULL,'2022-09-14 10:32:39','2022-09-16 10:16:34',1390,0,80,0,51,1,NULL),
(44,'ROOM-302','Amrendra Chaurasia','9821273755','Birgunj',0,0,13,0,0,NULL,1,NULL,'2022-09-14 10:52:26',NULL,0,0,0,0,53,1,NULL),
(45,'ROOM-201','Amrendra Chaurasia','9821273755','Birgunj',0,0,13,0,0,NULL,1,NULL,'2022-09-14 10:53:50',NULL,0,0,0,0,52,1,NULL),
(46,'ROOM-304','Amrendra Chaurasia','9821273755','Birgunj',0,0,13,0,0,NULL,1,NULL,'2022-09-14 11:19:03',NULL,0,0,0,0,57,1,NULL),
(47,'ROOM-303','Amrendra Chaurasia','9821273755','Birgunj',10,89,13,114.54,995.64,'Nine hundred and ninety five  only.',1,NULL,'2022-09-14 11:19:17','2022-09-19 16:13:43',890,0,10,0,56,1,80.1),
(48,'ROOM-203','Amrendra Chaurasia','9821273755','Birgunj',0,0,13,52,452,'Four hundred and fifty two  only.',1,NULL,'2022-09-14 11:19:38','2022-09-19 14:14:44',400,0,0,0,55,1,0),
(49,'ROOM-202','Amrendra Chaurasia','9821273755','Birgunj',10,20,13,25.74,223.74,'Two hundred and twenty three  only.',1,NULL,'2022-09-14 11:19:50','2022-09-19 13:53:53',200,0,10,0,54,1,18),
(50,'ROOM-301','Amrendra Chaurasia','9821273755','Birgunj',0,0,13,0,0,NULL,1,NULL,'2022-09-15 15:39:31',NULL,0,0,0,0,59,1,NULL),
(51,'ROOM-401','Amrendra Chaurasia','9821273755','Birgunj',150,13,13,185.9,1615.9,'One thousand six hundred and fifteen  only.',1,NULL,'2022-09-16 10:15:32','2022-09-16 12:31:32',1500,0,80,0,61,1,NULL),
(52,'ROOM-302','Amrendra Chaurasia','9821273755','Birgunj',178,13,13,218.66,1900.66,'One thousand nine hundred  only.',1,NULL,'2022-09-16 10:36:44','2022-09-16 10:56:01',1780,0,80,0,62,1,NULL),
(53,'ROOM-303','Amrendra Chaurasia','9821273755','Birgunj',10,103.15,13,132.75,1153.94,'One thousand one hundred and fifty three  only.',1,NULL,'2022-09-16 11:45:41','2022-09-16 14:04:00',1031.5,0,10,0,65,1,92.84),
(54,'ROOM-201','Amrendra Chaurasia','9821273755','Birgunj',0,0,13,78,678,'Six hundred and seventy eight  only.',1,NULL,'2022-09-19 13:53:32','2022-09-19 13:54:30',600,0,0,0,60,1,0),
(55,'ROOM-401','Amrendra Chaurasia','9821273755','Birgunj',10,50,13,64.35,559.35,'Five hundred and fifty nine  only.',1,NULL,'2022-09-19 14:14:33','2022-09-19 14:15:09',500,0,10,0,67,1,45),
(56,'ROOM-301','Amrendra Chaurasia','9821273755','Birgunj',10,120,13,154.44,1342.44,'One thousand three hundred and forty two  only.',1,NULL,'2022-09-19 16:13:12','2022-09-19 16:15:41',1200,0,10,0,66,1,108),
(57,'ROOM-102','sdfasdf','1111111111','sadfasd',0,0,13,0,0,NULL,1,NULL,'2023-07-21 13:25:55',NULL,0,0,0,0,84,1,0);

/*Table structure for table `room_setting` */

DROP TABLE IF EXISTS `room_setting`;

CREATE TABLE `room_setting` (
  `id` int(11) NOT NULL,
  `room_prefix` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `room_start_number` int(11) NOT NULL,
  `floor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `room_setting` */

insert  into `room_setting`(`id`,`room_prefix`,`room_start_number`,`floor_id`) values 
(0,'ROOM-',1,0),
(1,'ROOM-',101,1),
(2,'ROOM-',201,2),
(3,'ROOM-',301,3),
(4,'ROOM-',401,4),
(5,'ROOM-',501,5);

/*Table structure for table `room_status` */

DROP TABLE IF EXISTS `room_status`;

CREATE TABLE `room_status` (
  `id` double NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `room_status` */

insert  into `room_status`(`id`,`title`,`status`) values 
(1,'cleaning',1),
(2,'dirty',1),
(3,'occupied',1),
(4,'out of service',1),
(5,'out of order',1),
(6,'room ready',1);

/*Table structure for table `table_booking` */

DROP TABLE IF EXISTS `table_booking`;

CREATE TABLE `table_booking` (
  `id` double NOT NULL AUTO_INCREMENT,
  `table_id` double NOT NULL,
  `user_id` double DEFAULT NULL,
  `booking_status` varchar(225) NOT NULL,
  `estimated_time` time DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `arrival_date` date DEFAULT NULL,
  `check_out_date` datetime DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `number_of_tables` int(11) DEFAULT NULL,
  `number_of_child` int(11) DEFAULT NULL,
  `number_of_adult` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) NOT NULL,
  `id_type` varchar(100) DEFAULT NULL,
  `id_number` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_upto` time DEFAULT NULL,
  `booking_code` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `table_id` (`table_id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `table_booking_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `resturant_table` (`id`),
  CONSTRAINT `table_booking_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `table_booking_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `table_booking_ibfk_4` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `table_booking` */

insert  into `table_booking`(`id`,`table_id`,`user_id`,`booking_status`,`estimated_time`,`created_date`,`updated_date`,`arrival_date`,`check_out_date`,`category_id`,`type_id`,`number_of_tables`,`number_of_child`,`number_of_adult`,`name`,`email`,`address`,`mobile`,`id_type`,`id_number`,`status`,`time_from`,`time_upto`,`booking_code`) values 
(51,1,NULL,'checked_out',NULL,'2022-09-12 10:56:33','2022-09-12 10:56:33','2022-09-12','2022-09-13 12:34:43',NULL,1,20,80,40,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','5646548465','Citizenship',0,'06:00:00','09:00:00',326040),
(52,2,NULL,'checked_out',NULL,'2022-09-12 10:56:33','2022-09-12 10:56:33','2022-09-12','2022-09-19 14:06:48',NULL,1,20,80,40,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','5646548465','Citizenship',0,'06:00:00','09:00:00',866001),
(53,3,NULL,'checked_out',NULL,'2022-09-12 10:56:33','2022-09-12 10:56:33','2022-09-12','2022-09-12 12:54:18',NULL,1,20,80,40,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','5646548465','Citizenship',0,'06:00:00','09:00:00',711509),
(54,4,NULL,'checked_out',NULL,'2022-09-12 10:56:33','2022-09-12 10:56:33','2022-09-12','2022-09-19 14:06:30',NULL,1,20,80,40,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','5646548465','Citizenship',0,'06:00:00','09:00:00',475759),
(55,5,NULL,'checked_out',NULL,'2022-09-12 10:56:33','2022-09-12 10:56:33','2022-09-13','2022-09-13 12:33:07',NULL,1,20,80,40,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','5646548465','Citizenship',0,'06:00:00','09:00:00',328139),
(56,6,NULL,'checked_out',NULL,'2022-09-12 10:56:33','2022-09-12 10:56:33','2022-09-19','2022-09-19 14:44:12',NULL,1,20,80,40,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','5646548465','Citizenship',0,'06:00:00','09:00:00',818226),
(57,7,NULL,'checked_out',NULL,'2022-09-12 10:56:33','2022-09-12 10:56:33','2022-09-19','2022-09-19 15:33:39',NULL,1,20,80,40,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','5646548465','Citizenship',0,'06:00:00','09:00:00',925810),
(58,8,NULL,'checked_out',NULL,'2022-09-12 10:56:33','2022-09-12 10:56:33','2022-09-12','2022-09-12 13:30:56',NULL,1,20,80,40,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','5646548465','Citizenship',0,'06:00:00','09:00:00',244538),
(59,9,NULL,'checked_out',NULL,'2022-09-12 10:56:33','2022-09-12 10:56:33','2022-09-12','2022-09-12 13:36:17',NULL,1,20,80,40,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','5646548465','Citizenship',0,'06:00:00','09:00:00',749230),
(60,10,NULL,'checked_out',NULL,'2022-09-12 10:56:33','2022-09-12 10:56:33','2022-09-12','2022-09-13 12:53:16',NULL,1,20,80,40,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','5646548465','Citizenship',0,'06:00:00','09:00:00',262221),
(61,20,NULL,'checked_out',NULL,'2022-09-12 10:56:33','2022-09-12 10:56:33','2022-09-13','2022-09-13 12:54:03',NULL,1,20,80,40,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','5646548465','Citizenship',0,'06:00:00','09:00:00',828358),
(62,21,NULL,'checked_in',NULL,'2022-09-12 10:56:33','2022-09-12 10:56:33','2022-09-13',NULL,NULL,1,20,80,40,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','5646548465','Citizenship',1,'06:00:00','09:00:00',160324),
(63,22,NULL,'checked_out',NULL,'2022-09-12 10:56:33','2022-09-12 10:56:33','2022-09-13','2022-09-13 12:55:30',NULL,1,20,80,40,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','5646548465','Citizenship',0,'06:00:00','09:00:00',600301),
(64,23,NULL,'checked_out',NULL,'2022-09-12 10:56:33','2022-09-12 10:56:33','2022-09-19','2022-09-19 15:33:21',NULL,1,20,80,40,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','5646548465','Citizenship',0,'06:00:00','09:00:00',785509),
(65,24,NULL,'checked_out',NULL,'2022-09-12 10:56:33','2022-09-12 10:56:33','2022-09-19','2022-09-19 15:33:17',NULL,1,20,80,40,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','5646548465','Citizenship',0,'06:00:00','09:00:00',586009),
(66,25,NULL,'checked_out',NULL,'2022-09-12 10:56:33','2022-09-12 10:56:33','2022-09-19','2022-09-19 15:33:13',NULL,1,20,80,40,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','5646548465','Citizenship',0,'06:00:00','09:00:00',102501),
(67,26,NULL,'checked_out',NULL,'2022-09-12 10:56:33','2022-09-12 10:56:33','2022-09-19','2022-09-19 15:33:09',NULL,1,20,80,40,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','5646548465','Citizenship',0,'06:00:00','09:00:00',649039),
(68,27,NULL,'checked_out',NULL,'2022-09-12 10:56:33','2022-09-12 10:56:33','2022-09-19','2022-09-19 15:33:05',NULL,1,20,80,40,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','5646548465','Citizenship',0,'06:00:00','09:00:00',388990),
(69,28,NULL,'checked_out',NULL,'2022-09-12 10:56:33','2022-09-12 10:56:33','2022-09-19','2022-09-19 15:32:55',NULL,1,20,80,40,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','5646548465','Citizenship',0,'06:00:00','09:00:00',936190),
(70,29,NULL,'checked_out',NULL,'2022-09-12 10:56:33','2022-09-12 10:56:33','2022-09-19','2022-09-19 14:05:31',NULL,1,20,80,40,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','5646548465','Citizenship',0,'06:00:00','09:00:00',844593),
(71,1,NULL,'cancelled',NULL,'2022-09-13 13:32:57','2022-09-13 13:32:57','2022-09-14',NULL,NULL,1,1,0,2,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','57567','Passport',1,'06:00:00','09:00:00',903968),
(72,3,NULL,'checked_out',NULL,'2022-09-14 11:15:26','2022-09-14 11:15:26','2022-09-14','2022-09-14 17:04:22',NULL,1,1,0,2,'sdfhdhjfg','hgfhgf@hgfh.com','hgf hgfhg','9874563210','fg546fg54','Passport',0,'06:00:00','09:00:00',725338),
(73,5,NULL,'checked_in',NULL,'2022-09-14 11:18:06','2022-09-14 11:18:06','2022-09-14',NULL,NULL,1,1,NULL,1,' fghfjh ','hjggf@gfhgf.com','jhgsdf jgdsf','9874563210','fgd4h65fg4h','Driving Licence',1,'06:00:00','09:00:00',508870),
(74,8,NULL,'checked_out',NULL,'2022-09-14 11:24:15','2022-09-14 11:24:15','2022-09-14','2022-09-16 11:20:14',NULL,1,1,0,2,'d dfg','fdgf@hghjg.com','fdg fdg','9874562501','df54dfg4','Driving Licence',0,'08:00:00','10:00:00',390632),
(75,9,NULL,'checked_out',NULL,'2022-09-14 11:30:34','2022-09-14 11:30:34','2022-09-14','2022-09-14 11:50:27',NULL,1,1,NULL,2,'fg dfg ','fdgf@fgh.com','fdg dfg','1236547896','fg3fg5','Driving Licence',0,'08:00:00','10:00:00',373557),
(76,1,NULL,'cancelled',NULL,'2022-09-14 17:04:45','2022-09-14 17:04:45','2022-09-14',NULL,NULL,1,1,0,2,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','43563','Passport',1,'06:00:00','09:00:00',716083),
(77,1,NULL,'cancelled',NULL,'2022-09-14 17:05:30','2022-09-14 17:05:30','2022-09-14',NULL,NULL,1,1,0,2,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','5345435','Passport',1,'06:00:00','11:00:00',165701),
(78,1,NULL,'cancelled',NULL,'2022-09-14 17:12:51','2022-09-14 17:12:51','2022-09-14',NULL,NULL,1,1,0,2,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','4234234','Passport',1,'06:00:00','09:00:00',771053),
(79,1,NULL,'checked_out',NULL,'2022-09-14 17:21:38','2022-09-14 17:21:38','2022-09-14','2022-09-16 10:14:16',NULL,1,1,NULL,2,'Amrendra Chaurasia','er.amrendra007@gmail.com','Birgunj','9821273755','234234','Citizenship',0,'06:00:00','09:00:00',799804),
(80,1,NULL,'checked_out',NULL,'2023-07-21 08:58:59','2023-07-21 08:58:59','2023-07-21','2023-07-22 03:22:38',NULL,1,1,0,2,'Amrendra','er.amrendra@mail.com','reshamkothi','9821273755','asdfasdfsd','Citizenship',0,'01:00:00','02:00:00',383742),
(81,3,NULL,'checked_in',NULL,'2023-07-22 03:20:16','2023-07-22 03:20:16','2023-07-22',NULL,NULL,1,5,5,20,'dgadsfasdaf','asdfads@mail.com','asdfasdf','9874563210','3423423423','Passport',1,'02:00:00','03:00:00',526575),
(82,6,NULL,'checked_in',NULL,'2023-07-22 03:20:16','2023-07-22 03:20:16','2023-07-22',NULL,NULL,1,5,5,20,'dgadsfasdaf','asdfads@mail.com','asdfasdf','9874563210','3423423423','Passport',1,'02:00:00','03:00:00',639768),
(83,8,NULL,'checked_in',NULL,'2023-07-22 03:20:16','2023-07-22 03:20:16','2023-07-22',NULL,NULL,1,5,5,20,'dgadsfasdaf','asdfads@mail.com','asdfasdf','9874563210','3423423423','Passport',1,'02:00:00','03:00:00',767565),
(84,9,NULL,'checked_in',NULL,'2023-07-22 03:20:16','2023-07-22 03:20:16','2023-07-22',NULL,NULL,1,5,5,20,'dgadsfasdaf','asdfads@mail.com','asdfasdf','9874563210','3423423423','Passport',1,'02:00:00','03:00:00',117879),
(85,2,NULL,'checked_in',NULL,'2023-07-22 03:20:16','2023-07-22 03:20:16','2023-07-22',NULL,NULL,1,5,5,20,'dgadsfasdaf','asdfads@mail.com','asdfasdf','9874563210','3423423423','Passport',1,'02:00:00','03:00:00',530072);

/*Table structure for table `table_booking_message` */

DROP TABLE IF EXISTS `table_booking_message`;

CREATE TABLE `table_booking_message` (
  `id` double NOT NULL AUTO_INCREMENT,
  `time_from` time NOT NULL,
  `time_upto` time NOT NULL,
  `number_of_table` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `no_of_adult_guest` int(11) NOT NULL,
  `no_of_child_guest` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) NOT NULL,
  `address` varchar(2000) DEFAULT NULL,
  `id_type` varchar(100) NOT NULL,
  `id_number` varchar(50) NOT NULL,
  `unique_msg_code` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_date` date NOT NULL,
  `updated_date` date DEFAULT NULL,
  `arrival_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `table_booking_message_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `table_booking_message` */

insert  into `table_booking_message`(`id`,`time_from`,`time_upto`,`number_of_table`,`type_id`,`category_id`,`no_of_adult_guest`,`no_of_child_guest`,`name`,`email`,`mobile`,`address`,`id_type`,`id_number`,`unique_msg_code`,`status`,`created_date`,`updated_date`,`arrival_date`) values 
(1,'06:00:00','09:00:00',1,1,0,2,1,'Amrendra Chaurasia','er.amrendra007@gmail.com','9821273755','Birgunj','Passport','21321321',NULL,1,'2022-09-15','2022-09-16','2022-09-15'),
(2,'09:00:00','11:00:00',1,1,0,1,0,'fgdf ghj','gjg@hgfhg.com','5465646666','jhgj gjgjh','Driving Licence','fdg54fgh4g',NULL,1,'2022-09-15','2022-09-16','2022-09-15'),
(3,'09:00:00','11:00:00',1,2,0,1,0,'dfgdf','hghj@jhg.com','4566546666','hjgd shjfgjhg','Driving Licence','df3gdf56g',NULL,1,'2022-09-15','2022-09-19','2022-09-16');

/*Table structure for table `table_item_bill_details` */

DROP TABLE IF EXISTS `table_item_bill_details`;

CREATE TABLE `table_item_bill_details` (
  `id` double NOT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_price` double DEFAULT NULL,
  `disc_pc` double DEFAULT NULL,
  `disc_amt` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `rate` double DEFAULT NULL,
  KEY `id` (`id`),
  CONSTRAINT `table_item_bill_details_ibfk_1` FOREIGN KEY (`id`) REFERENCES `table_item_bill_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `table_item_bill_details` */

insert  into `table_item_bill_details`(`id`,`item_name`,`item_price`,`disc_pc`,`disc_amt`,`total`,`status`,`quantity`,`rate`) values 
(6,'Chicken Sandwich',500,NULL,NULL,500,1,2,250),
(6,'Egg Sandwich',200,NULL,NULL,200,1,1,200),
(6,'Chicken Steam',380,NULL,NULL,380,1,2,190),
(6,'C.',380,0,0,380,1,2,190),
(8,'Veg Sandwich',1250,0,0,1250,1,5,250),
(8,'Chicken Sandwich',1250,0,0,1250,1,5,250),
(8,'Egg Sandwich',1000,0,0,1000,1,5,200),
(8,'Club Sandwich',1650,0,0,1650,1,5,330),
(8,'Veg Burger',950,0,0,950,1,5,190),
(8,'Chicken Burger',1200,0,0,1200,1,5,240),
(8,'Cheese Burger',1000,0,0,1000,1,5,200),
(8,'Veg Pizza',1750,0,0,1750,1,5,350),
(8,'Chicken Pizza',2350,0,0,2350,1,5,470),
(8,'Special Hawaiian Pizza',2500,0,0,2500,1,5,500),
(7,'Chicken Sandwich',250,0,0,250,1,1,250),
(7,'B&B Special',250,0,0,250,1,1,250),
(7,'Manchow Soup Veg/Nonveg',150,5,7.5,142.5,1,1,150),
(7,'Sweet Corn Soup',300,0,0,300,1,2,150),
(7,'Veg Pizza',700,5,35,665,1,2,350),
(9,'Veg Sandwich',500,1,5,495,1,2,250),
(9,'Chicken Sandwich',250,2,5,245,1,1,250),
(9,'Egg Sandwich',600,3,18,582,1,3,200),
(9,'Club Sandwich',1980,4,79.2,1900.8,1,6,330),
(9,'Veg Burger',760,5,38,722,1,4,190),
(9,'Mushroom Pizza',2100,6,126,1974,1,5,420),
(9,'Fried',180,7,12.600000000000001,167.4,1,1,180),
(11,'Chicken Sandwich',500,0,0,500,1,2,250),
(11,'Chicken Burger',240,0,0,240,1,1,240),
(12,'Veg Sandwich',500,0,0,500,1,2,250),
(12,'Veg Pizza',350,0,0,350,1,1,350),
(12,'Fried',1080,0,0,1080,1,6,180),
(12,'Chicken Wanton Soup',1540,0,0,1540,1,7,220),
(24,'Chicken Sandwich',500,0,0,500,1,2,250),
(24,'Club Sandwich',330,0,0,330,1,1,330),
(24,'Veg Pizza',350,0,0,350,1,1,350),
(24,'Chicken Steam',570,0,0,570,1,3,190),
(24,'Cheese Burger',1000,0,0,1000,1,5,200),
(18,'Ruslan Vodka 90ml',920,0,0,920,1,4,230),
(25,'Chicken Sandwich',500,0,0,500,1,2,250),
(25,'Chicken Steam',380,0,0,380,1,2,190),
(25,'Chicken Burger',480,0,0,480,1,2,240),
(28,'Egg Sandwich',200,0,0,200,1,1,200),
(28,'Fried',360,0,0,360,1,2,180),
(28,'C.',570,0,0,570,1,3,190),
(28,'Chicken Thakali Set',450,0,0,450,1,1,450),
(28,'Cream of Chicken Soup',950,0,0,950,1,5,190),
(30,'Chicken Sandwich',250,0,0,250,1,1,250),
(30,'C.',380,0,0,380,1,2,190),
(30,'Chicken Steam',950,0,0,950,1,5,190),
(30,'Fried',360,0,0,360,1,2,180),
(30,'Cream of Tomato Soup',130,0,0,130,1,1,130),
(26,'Egg Sandwich',200,0,0,200,1,1,200),
(26,'Veg Pizza',350,0,0,350,1,1,350),
(27,'Veg Sandwich',750,0,0,750,1,3,250),
(27,'Fried',360,0,0,360,1,2,180),
(29,'Chicken Sandwich',250,0,0,250,1,1,250),
(29,'Veg Pizza',350,0,0,350,1,1,350),
(29,'Cheese Burger',600,0,0,600,1,3,200),
(31,'Chicken Sandwich',250,0,0,250,1,1,250),
(31,'Cheese Burger',400,0,0,400,1,2,200),
(31,'Chicken Steam',570,0,0,570,1,3,190),
(32,'Chicken Sandwich',250,0,0,250,1,1,250),
(32,'Chicken Burger',1200,0,0,1200,1,5,240),
(32,'jhol',380,0,0,380,1,2,190),
(32,'Chicken Steam',760,0,0,760,1,4,190),
(35,'Veg Sandwich',250,0,0,250,1,1,250),
(35,'Chicken Sandwich',250,0,0,250,1,1,250),
(35,'Egg Sandwich',200,0,0,200,1,1,200),
(35,'Club Sandwich',660,0,0,660,1,2,330);

/*Table structure for table `table_item_bill_master` */

DROP TABLE IF EXISTS `table_item_bill_master`;

CREATE TABLE `table_item_bill_master` (
  `id` double NOT NULL AUTO_INCREMENT,
  `table_no` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `disc_pc` double DEFAULT NULL,
  `disc_amt` double DEFAULT NULL,
  `vat_pc` double DEFAULT NULL,
  `vat_amt` double DEFAULT NULL,
  `payable_amt` double DEFAULT NULL,
  `words` varchar(2000) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `bill_creator` varbinary(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `gross_total` double DEFAULT NULL,
  `amt_after_disc` double DEFAULT NULL,
  `service_charge` double DEFAULT NULL,
  `delete_status` tinyint(1) DEFAULT NULL,
  `table_booking_id` double DEFAULT NULL,
  `current_table_status` varchar(255) DEFAULT NULL,
  `service_charge_amount` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `table_item_bill_master_ibfk_1` (`table_booking_id`),
  CONSTRAINT `table_item_bill_master_ibfk_1` FOREIGN KEY (`table_booking_id`) REFERENCES `table_booking` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `table_item_bill_master` */

insert  into `table_item_bill_master`(`id`,`table_no`,`name`,`mobile`,`address`,`disc_pc`,`disc_amt`,`vat_pc`,`vat_amt`,`payable_amt`,`words`,`status`,`bill_creator`,`created_date`,`updated_date`,`gross_total`,`amt_after_disc`,`service_charge`,`delete_status`,`table_booking_id`,`current_table_status`,`service_charge_amount`) values 
(5,'TABLE-1','Amrendra Chaurasia','9821273755','Birgunj',10,2180,0,0,19720,'Nineteen thousand seven hundred and twenty  only.',1,NULL,'2022-09-12 10:57:21','2022-09-12 11:08:53',21800,0,100,0,51,'checked_in',NULL),
(6,'TABLE-2','Amrendra Chaurasia','9821273755','Birgunj',10,146,13,183.82,1597.82,'One thousand five hundred and ninety seven  only.',1,NULL,'2022-09-12 11:06:00','2022-09-12 12:26:02',1460,0,100,0,52,'checked_in',NULL),
(7,'TABLE-3','Amrendra Chaurasia','9821273755','Birgunj',0,0,13,208.97,1816.47,'One thousand eight hundred and sixteen  only.',1,NULL,'2022-09-12 12:26:42','2022-09-12 12:44:29',1607.5,0,0,0,53,'checked_in',NULL),
(8,'TABLE-4','Amrendra Chaurasia','9821273755','Birgunj',10,1490,13,1753.7,15243.7,'Fifteen thousand two hundred and forty three  only.',1,NULL,'2022-09-12 12:39:18','2022-09-12 12:40:53',14900,0,80,0,54,'checked_in',NULL),
(9,'TABLE-8','Amrendra Chaurasia','9821273755','Birgunj',10,608.62,13,725.09,6302.67,'Six thousand three hundred and two  only.',1,NULL,'2022-09-12 13:26:43','2022-09-12 13:30:50',6086.2,0,100,0,58,'checked_in',NULL),
(10,'TABLE-10','Amrendra Chaurasia','9821273755','Birgunj',0,0,13,0,0,NULL,1,NULL,'2022-09-12 13:34:26','2022-09-12 13:34:26',0,0,0,0,60,'checked_in',NULL),
(11,'TABLE-9','Amrendra Chaurasia','9821273755','Birgunj',50,370,13,698.1,6068.1,'Six thousand and sixty eight  only.',1,NULL,'2022-09-12 13:35:53','2022-09-12 13:36:13',740,0,5000,0,59,'checked_in',NULL),
(12,'TABLE-5','Amrendra Chaurasia','9821273755','Birgunj',10,347,13,416.39,3619.39,'Three thousand six hundred and nineteen  only.',1,NULL,'2022-09-13 12:18:33','2022-09-13 12:19:20',3470,0,80,0,55,'checked_in',NULL),
(13,'TABLE-20','Amrendra Chaurasia','9821273755','Birgunj',0,0,13,0,0,NULL,1,NULL,'2022-09-13 12:53:51','2022-09-13 12:53:51',0,0,0,0,61,'checked_in',NULL),
(14,'TABLE-21','Amrendra Chaurasia','9821273755','Birgunj',0,0,13,0,0,NULL,1,NULL,'2022-09-13 12:54:44','2022-09-13 12:54:44',0,0,0,0,62,'checked_in',NULL),
(15,'TABLE-22','Amrendra Chaurasia','9821273755','Birgunj',0,0,13,0,0,NULL,1,NULL,'2022-09-13 12:54:48','2022-09-13 12:54:48',0,0,0,0,63,'checked_in',NULL),
(16,'TABLE-3','sdfhdhjfg','9874563210','hgf hgfhg',0,0,13,0,0,NULL,1,NULL,'2022-09-14 11:16:32','2022-09-14 11:16:32',0,0,0,0,72,'checked_in',NULL),
(17,'TABLE-8','d dfg','9874562501','fdg fdg',0,0,13,0,0,NULL,1,NULL,'2022-09-14 11:24:21','2022-09-14 11:24:21',0,0,0,0,74,'checked_in',NULL),
(18,'TABLE-5',' fghfjh ','9874563210','jhgsdf jgdsf',10,92,13,118.04,1026.04,'One thousand and twenty six  only.',1,NULL,'2022-09-14 11:24:59','2022-09-16 11:39:02',920,0,80,0,73,'checked_in',NULL),
(19,'TABLE-9','fg dfg ','1236547896','fdg dfg',0,0,13,0,0,NULL,1,NULL,'2022-09-14 11:30:43','2022-09-14 11:30:43',0,0,0,0,75,'checked_in',NULL),
(20,'TABLE-1','Amrendra Chaurasia','9821273755','Birgunj',0,0,13,0,0,NULL,1,NULL,'2022-09-14 17:03:59','2022-09-14 17:03:59',0,0,0,0,71,'cancelled',NULL),
(21,'TABLE-1','Amrendra Chaurasia','9821273755','Birgunj',0,0,13,0,0,NULL,1,NULL,'2022-09-14 17:04:52','2022-09-14 17:04:52',0,0,0,0,76,'cancelled',NULL),
(22,'TABLE-1','Amrendra Chaurasia','9821273755','Birgunj',0,0,13,0,0,NULL,1,NULL,'2022-09-14 17:05:41','2022-09-14 17:05:41',0,0,0,0,77,'cancelled',NULL),
(23,'TABLE-1','Amrendra Chaurasia','9821273755','Birgunj',0,0,13,0,0,NULL,1,NULL,'2022-09-14 17:20:37','2022-09-14 17:20:37',0,0,0,0,78,'cancelled',NULL),
(24,'TABLE-1','Amrendra Chaurasia','9821273755','Birgunj',10,275,13,334.75,2909.75,'Two thousand nine hundred and nine  only.',1,NULL,'2022-09-14 17:21:45','2022-09-16 10:07:00',2750,0,100,0,79,'checked_in',NULL),
(25,'TABLE-29','Amrendra Chaurasia','9821273755','Birgunj',0,0,13,0,0,NULL,1,NULL,'2022-09-19 14:02:46','2022-09-19 14:02:46',0,0,0,0,70,'checked_in',NULL),
(26,'TABLE-28','Amrendra Chaurasia','9821273755','Birgunj',10,55,13,70.78,615.28,'Six hundred and fifteen  only.',1,NULL,'2022-09-19 14:06:06','2022-09-19 15:28:29',550,55,10,0,69,'checked_in',49.5),
(27,'TABLE-27','Amrendra Chaurasia','9821273755','Birgunj',10,111,13,142.86,1241.76,'One thousand two hundred and forty one  only.',1,NULL,'2022-09-19 14:06:10','2022-09-19 15:29:40',1110,111,10,0,68,'checked_in',99.9),
(28,'TABLE-26','Amrendra Chaurasia','9821273755','Birgunj',10,253,13,325.61,2830.31,'Two thousand eight hundred and thirty  only.',1,'null','2022-09-19 14:06:12','2022-09-19 15:04:22',2530,0,10,0,67,'checked_in',227.7),
(29,'TABLE-25','Amrendra Chaurasia','9821273755','Birgunj',10,120,13,154.44,1342.44,'One thousand three hundred and forty two  only.',1,NULL,'2022-09-19 14:06:15','2022-09-19 15:30:36',1200,120,10,0,66,'checked_in',108),
(30,'TABLE-24','Amrendra Chaurasia','9821273755','Birgunj',10,207,13,266.41,2315.71,'Two thousand three hundred and fifteen  only.',1,'null','2022-09-19 14:06:18','2022-09-19 15:05:34',2070,0,10,0,65,'checked_in',186.3),
(31,'TABLE-23','Amrendra Chaurasia','9821273755','Birgunj',10,122,13,157.01,1364.81,'One thousand three hundred and sixty four  only.',1,NULL,'2022-09-19 14:06:20','2022-09-19 15:31:12',1220,122,10,0,64,'checked_in',109.8),
(32,'TABLE-7','Amrendra Chaurasia','9821273755','Birgunj',10,259,13,333.33,2897.43,'Two thousand eight hundred and ninety seven  only.',1,NULL,'2022-09-19 14:06:24','2022-09-19 15:32:44',2590,259,10,0,57,'checked_in',233.1),
(33,'TABLE-6','Amrendra Chaurasia','9821273755','Birgunj',0,0,13,0,0,NULL,1,NULL,'2022-09-19 14:06:27','2022-09-19 14:06:27',0,0,0,0,56,'checked_in',NULL),
(34,'TABLE-1','Amrendra','9821273755','reshamkothi',0,0,13,0,0,NULL,1,NULL,'2023-07-21 08:59:36','2023-07-21 08:59:36',0,0,0,0,80,'checked_in',NULL),
(35,'TABLE-2','dgadsfasdaf','9874563210','asdfasdf',0,0,13,176.8,1536.8,'One thousand five hundred and thirty six  only.',1,NULL,'2023-07-22 03:22:07','2023-07-22 22:46:34',1360,0,0,0,85,'checked_in',0),
(36,'TABLE-9','dgadsfasdaf','9874563210','asdfasdf',0,0,13,0,0,NULL,1,NULL,'2023-07-22 22:45:02','2023-07-22 22:45:02',0,0,0,0,84,'checked_in',NULL),
(37,'TABLE-8','dgadsfasdaf','9874563210','asdfasdf',0,0,13,0,0,NULL,1,NULL,'2023-07-22 22:45:05','2023-07-22 22:45:05',0,0,0,0,83,'checked_in',NULL),
(38,'TABLE-6','dgadsfasdaf','9874563210','asdfasdf',0,0,13,0,0,NULL,1,NULL,'2023-07-22 22:45:08','2023-07-22 22:45:08',0,0,0,0,82,'checked_in',NULL),
(39,'TABLE-3','dgadsfasdaf','9874563210','asdfasdf',0,0,13,0,0,NULL,1,NULL,'2023-07-22 22:45:11','2023-07-22 22:45:11',0,0,0,0,81,'checked_in',NULL);

/*Table structure for table `type` */

DROP TABLE IF EXISTS `type`;

CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `type` */

insert  into `type`(`id`,`title`,`status`) values 
(1,'AC',1),
(2,'NON-AC',1),
(3,'MEETING-HALL',1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` double NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`username`,`password`,`mobile`,`email`,`address`,`status`,`role_id`,`created_date`,`updated_date`) values 
(1,'Amrendra','amrendra','123456','9852147852','mail@email.com','birgunj',1,1,'2022-08-08 16:36:04','2022-08-08 16:36:09'),
(2,'Amrendra Chaurasia','amrendra007','$2b$05$7ml0zix8tDeAabG2wBNt0.bUD0dyzEWudX6RsQqtRwtG8VeyiWcVG','9874563211','er.amrendra007@gmail.com','Reshamkithi -5, Birgunj',1,4,'2022-08-09 16:27:44','2022-08-10 11:43:58'),
(3,'hgfkgh h fhgfhg','jhgfjhf','$2b$05$K/tbC/5Vzvq2vfhV2t49u.EXP2W8ihgg/5nJ8oUmjrmM42/dIZ4Tm','564654564','jkhgf@hjgf.com','hjgghf hg',0,4,'2022-08-09 16:37:30','2022-08-09 16:37:30'),
(4,'Ayub Alam','alamayub','$2b$05$gKb30C0M7NS/JO9m8E5LzOggJb9ORcVcX527mK73tJuzzkHnmm74y','9874563210','alamayub85@gmail.com','birgunj',1,4,'2022-08-09 17:17:20','2022-08-09 17:17:20'),
(5,'Four Coders','fourcoders','$2b$05$W/MojxBg2zh1w0XJVV7gkuJCcsPMTiFXTsqoCkW/fV89L2jnGNGUG','9874563210','fourcoders@gmail.com','birgunj',1,4,'2022-08-10 12:02:43','2022-08-10 12:02:43'),
(6,'test','test','$2b$05$ZVUEVK704vabuDFm3vU2CuMpXssuHF4vevZBuGlGG9BVfJAFqkpQG','9874563210','test@gmail.com','tester',1,4,'2022-08-15 12:37:29','2022-08-15 12:37:29'),
(7,'name','dfg dfgfg','$2b$05$JRPa0bxZs3MxEdhHPGME1uNP8N.P6qUTLwOvbgJvR1fzJDwKssrRu','5456654654','dfgfd@kjhg.com','sjkf hdfjk gdfgd ',0,2,'2022-09-12 17:04:06','2022-09-12 17:19:21'),
(8,'fgh hgfh','gfhfghgfh','$2b$05$mDP8zBhjWy4xlWF4pGNtSunRlj5U9gRlkC/T8.7ypMuGeJ5fuGRNy','6654646666','dfgf@hghj.com','jhgdfjgdfg dfg',1,2,'2022-09-12 17:07:08','2022-09-12 17:07:08'),
(9,'df g dfg gfh','dfreterter','$2b$05$0XOiNhmkeL2n0DDoS.jK4OHAhO8K3kF1GPTyrc8dBoYh515ERDLAi','3545645646','hnhj@jh.com','dfms ghjsdf gfh sgh',1,2,'2022-09-12 17:08:27','2022-09-12 17:08:27'),
(10,'B&B Hotel','admin','$2b$05$oua6/Y.GtCyumclSORXpUeVBnRCwUqHCgwTUQ90Xzkm7UJcSmdoBC','0000000000','info@bnbhotel.com','Panitanki-10, birgunj, nepal',1,1,'2022-09-16 15:13:25','2022-09-16 15:13:25');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
