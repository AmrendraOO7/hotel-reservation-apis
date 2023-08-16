/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.5.21-MariaDB-cll-lve : Database - numanchi_surajhotel_reservetion_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`numanchi_surajhotel_reservetion_db` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;

USE `numanchi_surajhotel_reservetion_db`;

/*Table structure for table `about` */

DROP TABLE IF EXISTS `about`;

CREATE TABLE `about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `about` */

insert  into `about`(`id`,`content`) values 
(1,'Hotel reservation application is the place where you can\n1. Engage your hotel room by your system.\n2. Create room service bill anong with  facility of printing KOT directly in kitchen.\n3. Engage the table by system\n4. creating order bill on the basis of table along facility of printing KOT directly in kitchen.\n5. Any order ticket KOT/BOT can be printed directly at the service.\n6. And many more.....');

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
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `booking` */

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
(1,'Hotel Suraj Pvt. Ltd.','VAT:- XXXXXXXXXXXXX','MainRoad, Adarshnagar, Birgunj, Parsa-Nepal','+9779876543210, +977-012-12-1234','XXX-XXXXXXX-xxxxxx-xxxxxxx','2023-07-21','2024-07-20','2023-07-21 13:43:23',NULL,5);

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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `room_item_bill_master` */

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
(5,'ROOM-',501,5),
(6,'ROOM-',601,6),
(7,'ROOM-',701,7),
(8,'ROOM-',801,8),
(9,'ROOM-',901,9),
(10,'ROOM-',1001,10);

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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `table_booking` */

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `table_item_bill_master` */

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
(2,'NON-AC',1);

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
(1,'Bishal','admin','$2b$05$oua6/Y.GtCyumclSORXpUeVBnRCwUqHCgwTUQ90Xzkm7UJcSmdoBC','9804275924','info@hotelsuraj.com','Birgunj',1,1,'2023-08-08 16:36:04','2023-07-27 19:11:50');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
