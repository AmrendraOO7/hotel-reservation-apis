USE `agraminf_Hotel_Management`;

/*Table structure for table `room_setting` */

CREATE TABLE `room_setting` (
  `id` INT NOT NULL,
  `room_prefix` VARCHAR(20) NOT NULL,
  `room_start_number` INT NOT NULL,
  `floor_id` INT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

/*Data for the table `room_setting` */

INSERT  INTO `room_setting`(`id`,`room_prefix`,`room_start_number`,`floor_id`) VALUES 
(0,'ROOM-',1,0),
(1,'ROOM-',101,1),
(2,'ROOM-',201,2),
(3,'ROOM-',301,3),
(4,'ROOM-',401,4),
(5,'ROOM-',501,5);

/*Table structure for table `resturant_table_setting` */

CREATE TABLE `resturant_table_setting` (
  `id` INT NOT NULL,
  `prefix` VARCHAR(50) NOT NULL,
  `start_number` INT NOT NULL
) ENGINE=INNODB ;

INSERT  INTO `resturant_table_setting`(`id`,`prefix`,`start_number`) VALUES 
(1,'TABLE-',1);

/*Table structure for table `role` */

CREATE TABLE `role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=5 ;

/*Data for the table `role` */

INSERT  INTO `role`(`id`,`name`,`status`) VALUES 
(1,'admin',1),
(2,'receiption',1),
(3,'restaurant',1),
(4,'customer',1);

/*Table structure for table `user` */

CREATE TABLE `user` (
  `id` DOUBLE NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `mobile` VARCHAR(255) DEFAULT NULL,
  `email` VARCHAR(255) DEFAULT NULL,
  `address` VARCHAR(255) DEFAULT NULL,
  `status` TINYINT(1) NOT NULL,
  `role_id` INT NOT NULL,
  `created_date` DATETIME NOT NULL,
  `updated_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=INNODB AUTO_INCREMENT=10;

/*Table structure for table `category` */

CREATE TABLE `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=6;


/*Table structure for table `type` */

CREATE TABLE `type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=4;

/*Data for the table `type` */

INSERT  INTO `type`(`id`,`title`,`status`) VALUES 
(1,'AC',1),
(2,'NON-AC',1);

/*Table structure for table `about` */

CREATE TABLE `about` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

/*Table structure for table `floor` */

CREATE TABLE `floor` (
  `id` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB;

/*Data for the table `floor` */

INSERT  INTO `floor`(`id`,`title`,`status`) VALUES 
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

/*Table structure for table `food_category` */

CREATE TABLE `food_category` (
  `id` INT NOT NULL,
  `title` VARCHAR(225) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB ;

/*Data for the table `food_category` */

INSERT  INTO `food_category`(`id`,`title`,`status`) VALUES 
(1,'VEG',1),
(2,'NON-VEG',1);

/*Table structure for table `room_status` */

CREATE TABLE `room_status` (
  `id` DOUBLE NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `status` TINYINT(1)  NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=7;

/*Data for the table `room_status` */

INSERT  INTO `room_status`(`id`,`title`,`status`) VALUES 
(1,'cleaning',1),
(2,'dirty',1),
(3,'occupied',1),
(4,'out of service',1),
(5,'out of order',1),
(6,'room ready',1);

/*Table structure for table `food_type` */

CREATE TABLE `food_type` (
  `id` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB  ;

/*Data for the table `food_type` */

INSERT  INTO `food_type`(`id`,`title`,`status`) VALUES 
(1,'Sandwich & Burger',1),
(2,'Pizza',1),
(3,'MO:MO:',1),
(4,'Thukppa',1),
(5,'Thakali Khana',1),
(6,'Soup',1),
(7,'Indian Biryani Rice',1),
(8,'Soft & Cold Drinks',1),
(9,'Snacks Veg',1),
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
(29,'Hukka',1);

/*Table structure for table `room` */

CREATE TABLE `room` (
  `id` DOUBLE NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `type_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `price` DOUBLE NOT NULL,
  `images` VARCHAR(255)  NULL,
  `floor_id` INT NOT NULL,
  `created_date` DATETIME NOT NULL,
  `updated_date` DATETIME NOT NULL,
  `status` TINYINT(1) NOT NULL,
  `room_status_id` DOUBLE  NULL,
  PRIMARY KEY (`id`),
  KEY `room_status_id` (`room_status_id`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`room_status_id`) REFERENCES `room_status` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=11 ;

/*Table structure for table `booking` */

CREATE TABLE `booking` (
  `id` DOUBLE NOT NULL AUTO_INCREMENT,
  `user_id` DOUBLE  NULL,
  `book_from` DATE NOT NULL,
  `book_to` DATE NOT NULL,
  `booking_status` VARCHAR(50) NOT NULL,
  `check_in` DATETIME  NULL,
  `check_out` DATETIME  NULL,
  `status` TINYINT(1) NOT NULL,
  `created_date` DATETIME NOT NULL,
  `updated_date` DATETIME NOT NULL,
  `room_id` DOUBLE NOT NULL,
  `booking_code` DOUBLE NOT NULL,
  `id_number` VARCHAR(50) COLLATE utf8_bin  NULL,
  `id_type` VARCHAR(100) COLLATE utf8_bin  NULL,
  `number_of_child` INT  NULL,
  `number_of_adult` INT  NULL,
  `name` VARCHAR(255) COLLATE utf8_bin  NULL,
  `email` VARCHAR(255) COLLATE utf8_bin  NULL,
  `address` VARCHAR(255) COLLATE utf8_bin  NULL,
  `mobile` VARCHAR(20) COLLATE utf8_bin  NULL,
  `categoryId` INT  NULL,
  `typeId` INT  NULL,
  `noOfRooms` INT  NULL,
  `price` DOUBLE  NULL,
  `disc_pc` DOUBLE  NULL,
  `disc_amt` DOUBLE  NULL,
  `total` DOUBLE  NULL,
  `vat_pc` DOUBLE  NULL,
  `vat_amt` DOUBLE  NULL,
  `net_pay` DOUBLE  NULL,
  `service_charge` DOUBLE  NULL,
  `no_of_days_stayed` INT  NULL,
  `cost_of_staying` DOUBLE  NULL,
  `room_status` VARCHAR(255) COLLATE utf8_bin  NULL,
  `words` VARCHAR(2000) COLLATE utf8_bin  NULL,
  PRIMARY KEY (`id`),
  KEY `categoryId` (`categoryId`),
  KEY `typeId` (`typeId`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`typeId`) REFERENCES `type` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=46 ;


/*Table structure for table `booking_message` */

CREATE TABLE `booking_message` (
  `id` DOUBLE NOT NULL AUTO_INCREMENT,
  `from_date` DATE NOT NULL,
  `to_Date` DATE NOT NULL,
  `number_of_rooms` INT NOT NULL,
  `type_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `no_of_adult_guest` INT NOT NULL,
  `no_of_child_guest` INT NOT NULL,
  `full_name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `mobile` VARCHAR(255) NOT NULL,
  `address` VARCHAR(2000)  NULL,
  `id_type` VARCHAR(100) NOT NULL,
  `id_number` VARCHAR(50) NOT NULL,
  `unique_msg_code` VARCHAR(50)  NULL,
  `status` TINYINT(1) NOT NULL,
  `created_date` DATE NOT NULL,
  `updated_date` DATE  NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `booking_message_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  CONSTRAINT `booking_message_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=INNODB;

/*Table structure for table `food_menu` */

CREATE TABLE `food_menu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `type` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255)  NULL,
  `status` TINYINT(1) NOT NULL,
  `created_date` DATETIME NOT NULL,
  `updated_date` DATETIME NOT NULL,
  `price` DOUBLE NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=166 ;

/*Data for the table `food_menu` */

INSERT  INTO `food_menu`(`id`,`title`,`type`,`description`,`status`,`created_date`,`updated_date`,`price`) VALUES 
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
(165,'White Mischeif','Vodka (60ml)',NULL,1,'2022-08-22 13:47:06','2022-08-22 13:47:06',260);

/*Table structure for table `room_item_bill_master` */

CREATE TABLE `room_item_bill_master` (
  `id` DOUBLE NOT NULL AUTO_INCREMENT,
  `room_no` VARCHAR(20)  NULL,
  `name` VARCHAR(255)  NULL,
  `mobile` VARCHAR(20) NOT NULL,
  `address` VARCHAR(255)  NULL,
  `disc_pc` DOUBLE  NULL,
  `disc_amt` DOUBLE  NULL,
  `vat_pc` DOUBLE  NULL,
  `vat_amt` DOUBLE  NULL,
  `payable_amt` DOUBLE  NULL,
  `words` VARCHAR(2000)  NULL,
  `status` TINYINT(1) NOT NULL,
  `bill_creator` VARCHAR(255)  NULL,
  `created_date` DATETIME NOT NULL,
  `updated_date` DATETIME  NULL,
  `gross_total` DOUBLE  NULL,
  `amt_after_disc` DOUBLE  NULL,
  `service_charge` DOUBLE  NULL,
  `delete_status` TINYINT(1)  NULL,
  `room_booking_id` DOUBLE  NULL,
  `current_room_status` TINYINT(1)  NULL,
  PRIMARY KEY (`id`),
  KEY `room_booking_id` (`room_booking_id`),
  CONSTRAINT `room_item_bill_master_ibfk_1` FOREIGN KEY (`room_booking_id`) REFERENCES `booking` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=40 ;

/*Table structure for table `room_item_bill_details` */

CREATE TABLE `room_item_bill_details` (
  `id` DOUBLE NOT NULL,
  `item_name` VARCHAR(255)  NULL,
  `item_price` DOUBLE  NULL,
  `disc_pc` DOUBLE  NULL,
  `disc_amt` DOUBLE  NULL,
  `total` DOUBLE  NULL,
  `status` TINYINT(1) NOT NULL,
  `quantity` DOUBLE  NULL,
  `rate` DOUBLE  NULL,
  KEY `id` (`id`),
  CONSTRAINT `room_item_bill_details_ibfk_1` FOREIGN KEY (`id`) REFERENCES `room_item_bill_master` (`id`)
) ENGINE=INNODB ;

/*Table structure for table `resturant_table` */

CREATE TABLE `resturant_table` (
  `id` DOUBLE NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `type_id` INT NOT NULL,
  `status` TINYINT(1) NOT NULL,
  `created_date` DATETIME NOT NULL,
  `updated_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `resturant_table_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=20 ;

/*Table structure for table `table_booking` */

CREATE TABLE `table_booking` (
  `id` DOUBLE NOT NULL AUTO_INCREMENT,
  `table_id` DOUBLE NOT NULL,
  `user_id` DOUBLE  NULL,
  `booking_status` VARCHAR(225)  NOT NULL,
  `estimated_time` TIME  NULL,
  `created_date` DATETIME NOT NULL,
  `updated_date` DATETIME  NULL,
  `arrival_date` DATETIME  NULL,
  `check_out_date` DATETIME NULL,
  `category_id` INT  NULL,
  `type_id` INT  NULL,
  `number_of_tables` INT  NULL,
  `number_of_child` INT  NULL,
  `number_of_adult` INT  NULL,
  `name` VARCHAR(255)  NULL,
  `email` VARCHAR(255)  NULL,
  `address` VARCHAR(255)  NULL,
  `mobile` VARCHAR(20) NOT NULL,
  `id_type` VARCHAR(100)  NULL,
  `id_number` VARCHAR(100)  NULL,
  `status` TINYINT(1)  NULL,
  `time_from` TIME  NULL,
  `time_upto` TIME  NULL,
  `booking_code` DOUBLE  NULL,
  PRIMARY KEY (`id`),
  KEY `table_id` (`table_id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `table_booking_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `resturant_table` (`id`),
  CONSTRAINT `table_booking_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `table_booking_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `table_booking_ibfk_4` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=5 ;

/*Table structure for table `table_booking_message` */

CREATE TABLE `table_booking_message` (
  `id` DOUBLE NOT NULL AUTO_INCREMENT,
  `time_from` TIME NOT NULL,
  `time_upto` TIME NOT NULL,
  `number_of_table` INT NOT NULL,
  `type_id` INT NOT NULL,
  `category_id` INT  NULL,
  `no_of_adult_guest` INT NOT NULL,
  `no_of_child_guest` INT  NULL,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255)  NULL,
  `mobile` VARCHAR(255) NOT NULL,
  `address` VARCHAR(2000)  NULL,
  `id_type` VARCHAR(100) NOT NULL,
  `id_number` VARCHAR(50) NOT NULL,
  `unique_msg_code` VARCHAR(50)   NULL,
  `status` TINYINT(1)  NULL,
  `created_date` DATE NOT NULL,
  `updated_date` DATE  NULL,
  `arrival_date` DATE  NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `table_booking_message_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`)
) ENGINE=INNODB ;

/*Table structure for table `table_item_bill_master` */

CREATE TABLE `table_item_bill_master` (
  `id` DOUBLE NOT NULL AUTO_INCREMENT,
  `table_no` VARCHAR(255)  NULL,
  `name` VARCHAR(255)  NULL,
  `mobile` VARCHAR(255)  NULL,
  `address` VARCHAR(255)  NULL,
  `disc_pc` DOUBLE  NULL,
  `disc_amt` DOUBLE  NULL,
  `vat_pc` DOUBLE  NULL,
  `vat_amt` DOUBLE  NULL,
  `payable_amt` DOUBLE  NULL,
  `words` VARCHAR(2000)  NULL,
  `status` TINYINT(1)  NULL,
  `bill_creator` VARBINARY(100)  NULL,
  `created_date` DATETIME  NULL,
  `updated_date` DATETIME  NULL,
  `gross_total` DOUBLE  NULL,
  `amt_after_disc` DOUBLE  NULL,
  `service_charge` DOUBLE  NULL,
  `delete_status` TINYINT(1)  NULL,
  `table_booking_id` DOUBLE  NULL,
  `current_table_status` VARCHAR(255)  NULL,
  PRIMARY KEY (`id`),
  KEY `table_item_bill_master_ibfk_1` (`table_booking_id`),
  CONSTRAINT `table_item_bill_master_ibfk_1` FOREIGN KEY (`table_booking_id`) REFERENCES `table_booking` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 ;


/*Table structure for table `table_item_bill_details` */

CREATE TABLE `table_item_bill_details` (
  `id` DOUBLE NOT NULL,
  `item_name` VARCHAR(255) DEFAULT NULL,
  `item_price` DOUBLE DEFAULT NULL,
  `disc_pc` DOUBLE DEFAULT NULL,
  `disc_amt` DOUBLE DEFAULT NULL,
  `total` DOUBLE DEFAULT NULL,
  `status` TINYINT(1) DEFAULT NULL,
  `quantity` DOUBLE DEFAULT NULL,
  `rate` DOUBLE DEFAULT NULL,
  KEY `id` (`id`),
  CONSTRAINT `table_item_bill_details_ibfk_1` FOREIGN KEY (`id`) REFERENCES `table_item_bill_master` (`id`)
) ENGINE=INNODB;

/*Table structure for table `gallery` */

CREATE TABLE `gallery` (
  `id` DOUBLE NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `date` DATE NOT NULL,
  `created_date` DATETIME NOT NULL,
  `updated_date` DATETIME NOT NULL,
  `status` TINYINT(1) NOT NULL,
  `images` VARCHAR(20000)  NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=6;
