-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema wfms
--

CREATE DATABASE IF NOT EXISTS wfms;
USE wfms;

--
-- Definition of table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `CITY_ID` bigint(20) NOT NULL auto_increment,
  `CITY_NAME` varchar(255) default NULL,
  `STATUS` int(11) default NULL,
  `STATE_ID` bigint(20) default NULL,
  PRIMARY KEY  (`CITY_ID`),
  KEY `FK1F916B764E7A09` (`STATE_ID`),
  CONSTRAINT `FK1F916B764E7A09` FOREIGN KEY (`STATE_ID`) REFERENCES `state` (`STATE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`CITY_ID`,`CITY_NAME`,`STATUS`,`STATE_ID`) VALUES 
 (1,'Ahmedabad',1,1),
 (2,'Baroda',1,1),
 (3,'Surat',1,1),
 (4,'Bharuch',1,1);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;


--
-- Definition of table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `COMPANY_ID` bigint(20) NOT NULL auto_increment,
  `ADDED_BY` varchar(255) default NULL,
  `ADDED_ON` datetime default NULL,
  `ADDRESS_CITY` varchar(255) default NULL,
  `ADDRESS_COUNTRY` varchar(255) default NULL,
  `ADDRESS_STATE` varchar(255) default NULL,
  `ADDRESS_STREET` varchar(255) default NULL,
  `ADDRESS_ZIPCODE` varchar(255) default NULL,
  `COMPANY_NAME` varchar(255) default NULL,
  `CONTACT_EMERGENCY_NAME` varchar(255) default NULL,
  `CONTACT_EMERGENCY_NUMBER` varchar(255) default NULL,
  `CONTACT_HOME_PHONE` varchar(255) default NULL,
  `CONTACT_MOBILE` varchar(255) default NULL,
  `CONTACT_PERSONAL_EMAIL` varchar(255) default NULL,
  `CONTACT_WEBSITE` varchar(255) default NULL,
  `CONTACT_WORK_PHONE` varchar(255) default NULL,
  `STATUS` int(11) default NULL,
  PRIMARY KEY  (`COMPANY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` (`COMPANY_ID`,`ADDED_BY`,`ADDED_ON`,`ADDRESS_CITY`,`ADDRESS_COUNTRY`,`ADDRESS_STATE`,`ADDRESS_STREET`,`ADDRESS_ZIPCODE`,`COMPANY_NAME`,`CONTACT_EMERGENCY_NAME`,`CONTACT_EMERGENCY_NUMBER`,`CONTACT_HOME_PHONE`,`CONTACT_MOBILE`,`CONTACT_PERSONAL_EMAIL`,`CONTACT_WEBSITE`,`CONTACT_WORK_PHONE`,`STATUS`) VALUES 
 (1,'admin','2014-05-05 21:58:44','Ahmedabad','India','Gujarat','Garima SEZ','380101','Tata Consultancy Ltd.','Mr. Ramesh Bihola',NULL,NULL,NULL,'info@tcs.com','http://www.tcs.com','07937896369',1),
 (2,'admin','2014-04-22 22:00:25','Ahmedabad','India','Gujarat','Infocity, Gandhinagar','127836','Elitecore Technologies','Mrs. Parina',NULL,NULL,NULL,'info@elitecore.com','http://www.elitecore.com','07937896369',1),
 (3,'admin','2014-04-30 22:01:30','Baroda','India','Gujarat','Infocity, Gandhinagar','380014','MindTree Pvt. Ltd.','Mr. Nakul Dave',NULL,NULL,NULL,'contact@mindtree.com','http://www.mindtree.com','917937896369',1),
 (4,'admin','2014-05-06 23:24:34','Ahmedabad','India','Gujarat','Garima SEZ','380101','Byte Infotech','Mr. Krunal Shah',NULL,NULL,NULL,'in@byte.co.in','http://www.byte.co.in','917937896369',1);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;


--
-- Definition of table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `COUNTRY_ID` bigint(20) NOT NULL auto_increment,
  `COUNTRY_NAME` varchar(255) default NULL,
  `STATUS` int(11) default NULL,
  PRIMARY KEY  (`COUNTRY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` (`COUNTRY_ID`,`COUNTRY_NAME`,`STATUS`) VALUES 
 (1,'India',1),
 (2,'Australia',1),
 (3,'England',1);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;


--
-- Definition of table `designation`
--

DROP TABLE IF EXISTS `designation`;
CREATE TABLE `designation` (
  `DESIGNATION_ID` bigint(20) NOT NULL auto_increment,
  `DESIGNATION_NAME` varchar(255) default NULL,
  `STATUS` int(11) default NULL,
  PRIMARY KEY  (`DESIGNATION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designation`
--

/*!40000 ALTER TABLE `designation` DISABLE KEYS */;
INSERT INTO `designation` (`DESIGNATION_ID`,`DESIGNATION_NAME`,`STATUS`) VALUES 
 (1,'Delivery Manager',1),
 (2,'Admin',1),
 (3,'Project Manager',1),
 (4,'Project Lead',1),
 (5,'Developer',1);
/*!40000 ALTER TABLE `designation` ENABLE KEYS */;


--
-- Definition of table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `MESSAGE_ID` bigint(20) NOT NULL auto_increment,
  `CONTENT` varchar(255) default NULL,
  `SENT_DATE_TIME` datetime default NULL,
  `FROM_DELETE_STATUS` int(11) default NULL,
  `MSG_FROM` varchar(255) default NULL,
  `MSG_TO` varchar(255) default NULL,
  `READ_STATUS` int(11) default NULL,
  `SUBJECT` varchar(255) default NULL,
  `TO_DELETE_STATUS` int(11) default NULL,
  `TRASH_STATUS` int(11) default NULL,
  PRIMARY KEY  (`MESSAGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` (`MESSAGE_ID`,`CONTENT`,`SENT_DATE_TIME`,`FROM_DELETE_STATUS`,`MSG_FROM`,`MSG_TO`,`READ_STATUS`,`SUBJECT`,`TO_DELETE_STATUS`,`TRASH_STATUS`) VALUES 
 (1,'Hi Hemal,\r\n\r\nThis is a test email.\r\n\r\nThanks,\r\nKrunal','2014-05-05 22:02:30',1,'admin','hemal',1,'Test',1,0),
 (2,'Hi Admin,\r\n\r\nI am not able to update password.\r\n\r\nThanks,\r\nManisha','2014-05-05 22:54:05',1,'jaimini','admin',1,'change password error',1,0),
 (3,'internet is not working','2014-05-06 22:25:26',1,'umang','admin',1,'internet is not working',1,0),
 (4,'Hardware required','2014-05-06 23:00:59',1,'hemangi','admin',1,'Hardware required',1,0),
 (5,'Slow network connection','2014-05-07 07:23:29',1,'sefali','admin',-1,'Slow network connection',1,0);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;


--
-- Definition of table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `PROJECT_ID` bigint(20) NOT NULL auto_increment,
  `EXPECTED_END_DATE` datetime default NULL,
  `EXPECTED_START_DATE` datetime default NULL,
  `PROJECT_DESCRIPTION` varchar(255) default NULL,
  `PROJECT_NAME` varchar(255) default NULL,
  `PROJECT_SHORT_NAME` varchar(255) default NULL,
  `STATUS` int(11) default NULL,
  `COMPANY_ID` bigint(20) default NULL,
  `DM_USER_ID` bigint(20) default NULL,
  `PM_USER_ID` bigint(20) default NULL,
  PRIMARY KEY  (`PROJECT_ID`),
  KEY `FK185BD6F9A162A2C9` (`COMPANY_ID`),
  KEY `FK185BD6F92B81A9C9` (`PM_USER_ID`),
  KEY `FK185BD6F9B8105C55` (`DM_USER_ID`),
  CONSTRAINT `FK185BD6F92B81A9C9` FOREIGN KEY (`PM_USER_ID`) REFERENCES `user` (`USER_ID`),
  CONSTRAINT `FK185BD6F9A162A2C9` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`),
  CONSTRAINT `FK185BD6F9B8105C55` FOREIGN KEY (`DM_USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` (`PROJECT_ID`,`EXPECTED_END_DATE`,`EXPECTED_START_DATE`,`PROJECT_DESCRIPTION`,`PROJECT_NAME`,`PROJECT_SHORT_NAME`,`STATUS`,`COMPANY_ID`,`DM_USER_ID`,`PM_USER_ID`) VALUES 
 (1,'2016-12-31 00:00:00','2014-05-05 00:00:00','Audience Suite Project Description','Audience Suite','AS',1,3,3,5),
 (2,'2015-05-31 00:00:00','2014-05-07 00:00:00','Report Center','Report Center','RC',1,3,3,6),
 (3,'2015-05-31 00:00:00','2014-05-01 00:00:00','Park n Fly','Park n Fly','PnF',1,1,3,6),
 (4,'2017-05-31 00:00:00','2014-01-01 00:00:00','Shortcut','Shortcut','SC',1,2,3,6);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;


--
-- Definition of table `state`
--

DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `STATE_ID` bigint(20) NOT NULL auto_increment,
  `STATE_NAME` varchar(255) default NULL,
  `STATUS` int(11) default NULL,
  `COUNTRY_ID` bigint(20) default NULL,
  PRIMARY KEY  (`STATE_ID`),
  KEY `FK4B8CC7197B42029` (`COUNTRY_ID`),
  CONSTRAINT `FK4B8CC7197B42029` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `country` (`COUNTRY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` (`STATE_ID`,`STATE_NAME`,`STATUS`,`COUNTRY_ID`) VALUES 
 (1,'Gujarat',1,1),
 (2,'Maharastra',1,1),
 (3,'Goa',1,1),
 (4,'Madhya Pradesh',1,1);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;


--
-- Definition of table `story`
--

DROP TABLE IF EXISTS `story`;
CREATE TABLE `story` (
  `STORY_ID` bigint(20) NOT NULL auto_increment,
  `CREATED_BY` varchar(255) default NULL,
  `CREATED_ON` datetime default NULL,
  `DESCRIPTION` varchar(255) default NULL,
  `STATUS` int(11) default NULL,
  `STORY_NAME` varchar(255) default NULL,
  `STORY_SHORT_NAME` varchar(255) default NULL,
  `PROJECT_ID` bigint(20) default NULL,
  PRIMARY KEY  (`STORY_ID`),
  KEY `FK4B900D51366CD49` (`PROJECT_ID`),
  CONSTRAINT `FK4B900D51366CD49` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`PROJECT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `story`
--

/*!40000 ALTER TABLE `story` DISABLE KEYS */;
INSERT INTO `story` (`STORY_ID`,`CREATED_BY`,`CREATED_ON`,`DESCRIPTION`,`STATUS`,`STORY_NAME`,`STORY_SHORT_NAME`,`PROJECT_ID`) VALUES 
 (1,'admin','2014-05-05 22:06:23','Create admin user type',1,'Create admin user type',NULL,1),
 (2,'manisha','2014-05-06 21:16:15','Move to top functionality',1,'Move to top functionality',NULL,1),
 (3,'admin','2014-05-06 21:16:45','Share query functionality',1,'Share query functionality',NULL,1),
 (4,'admin','2014-05-06 22:37:23','Update JSON structure',1,'Update JSON structure',NULL,2),
 (5,'umang','2014-05-06 22:57:39','Browserify issue',1,'Browserify issue',NULL,2),
 (6,'kusum','2014-05-06 22:59:35','Replace css to scss',1,'Replace css to scss',NULL,2),
 (7,'hemal','2014-05-07 07:22:54','Unit test case for back end implementation for admin user type',1,'Unit test case for back end implementation for admin user type',NULL,1),
 (8,'kusum','2014-05-07 07:29:34','Back end implementation for admin user type',1,'Back end implementation for admin user type',NULL,1),
 (9,'umang','2014-05-07 07:30:54','added by pm',1,'added by pm',NULL,2);
/*!40000 ALTER TABLE `story` ENABLE KEYS */;


--
-- Definition of table `task`
--

DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `TASK_ID` bigint(20) NOT NULL auto_increment,
  `CREATED_BY` varchar(255) default NULL,
  `CREATED_ON` datetime default NULL,
  `DESCRIPTION` varchar(255) default NULL,
  `STATUS` int(11) default NULL,
  `TASK_NAME` varchar(255) default NULL,
  `STORY_ID` bigint(20) default NULL,
  `USER_ID` bigint(20) default NULL,
  PRIMARY KEY  (`TASK_ID`),
  KEY `FK272D858E1F6F89` (`STORY_ID`),
  KEY `FK272D859DAD420B` (`USER_ID`),
  CONSTRAINT `FK272D858E1F6F89` FOREIGN KEY (`STORY_ID`) REFERENCES `story` (`STORY_ID`),
  CONSTRAINT `FK272D859DAD420B` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task`
--

/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` (`TASK_ID`,`CREATED_BY`,`CREATED_ON`,`DESCRIPTION`,`STATUS`,`TASK_NAME`,`STORY_ID`,`USER_ID`) VALUES 
 (1,'admin','2014-05-05 22:10:36','Update database script',4,'Update database script',1,4),
 (2,'admin','2014-05-05 22:11:47','Front end to create user',2,'Front end to create user',1,2),
 (3,'admin','2014-05-06 21:26:53','Create front end',1,'Create front end',3,NULL),
 (4,'admin','2014-05-06 21:27:55','Create front end',1,'Create front end',2,4),
 (5,'admin','2014-05-11 08:05:00','Back end implementation for create user',3,'Back end implementation for create user',1,NULL),
 (6,'admin','2014-05-11 08:05:48','Unit test case for back end implementation',1,'Unit test case for back end implementation',1,NULL);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `USER_ID` bigint(20) NOT NULL auto_increment,
  `ADDRESS_CITY` varchar(255) default NULL,
  `ADDRESS_COUNTRY` varchar(255) default NULL,
  `ADDRESS_STATE` varchar(255) default NULL,
  `ADDRESS_STREET` varchar(255) default NULL,
  `ADDRESS_ZIPCODE` varchar(255) default NULL,
  `BIRTH_DATE` datetime default NULL,
  `CONTACT_EMERGENCY_NAME` varchar(255) default NULL,
  `CONTACT_EMERGENCY_NUMBER` varchar(255) default NULL,
  `CONTACT_HOME_PHONE` varchar(255) default NULL,
  `CONTACT_MOBILE` varchar(255) default NULL,
  `CONTACT_PERSONAL_EMAIL` varchar(255) default NULL,
  `CONTACT_WEBSITE` varchar(255) default NULL,
  `CONTACT_WORK_PHONE` varchar(255) default NULL,
  `EMAIL` varchar(255) NOT NULL,
  `FIRST_NAME` varchar(255) default NULL,
  `GENDER` varchar(255) default NULL,
  `LAST_LOGIN_DATETIME` datetime default NULL,
  `LAST_NAME` varchar(255) default NULL,
  `PASSWORD` varchar(255) default NULL,
  `REGISTRATION_DATE` datetime default NULL,
  `STATUS` int(11) default NULL,
  `USER_TYPE` varchar(255) default NULL,
  `USER_NAME` varchar(255) NOT NULL,
  `DESIGNATION_ID` bigint(20) default NULL,
  `PROJECT_ID` bigint(20) default NULL,
  PRIMARY KEY  (`USER_ID`),
  UNIQUE KEY `USER_ID` (`USER_ID`),
  UNIQUE KEY `EMAIL` (`EMAIL`),
  UNIQUE KEY `USER_NAME` (`USER_NAME`),
  UNIQUE KEY `EMAIL_2` (`EMAIL`),
  UNIQUE KEY `USER_NAME_2` (`USER_NAME`),
  KEY `FK27E3CB1366CD49` (`PROJECT_ID`),
  KEY `FK27E3CBA8909` (`DESIGNATION_ID`),
  CONSTRAINT `FK27E3CB1366CD49` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`PROJECT_ID`),
  CONSTRAINT `FK27E3CBA8909` FOREIGN KEY (`DESIGNATION_ID`) REFERENCES `designation` (`DESIGNATION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`USER_ID`,`ADDRESS_CITY`,`ADDRESS_COUNTRY`,`ADDRESS_STATE`,`ADDRESS_STREET`,`ADDRESS_ZIPCODE`,`BIRTH_DATE`,`CONTACT_EMERGENCY_NAME`,`CONTACT_EMERGENCY_NUMBER`,`CONTACT_HOME_PHONE`,`CONTACT_MOBILE`,`CONTACT_PERSONAL_EMAIL`,`CONTACT_WEBSITE`,`CONTACT_WORK_PHONE`,`EMAIL`,`FIRST_NAME`,`GENDER`,`LAST_LOGIN_DATETIME`,`LAST_NAME`,`PASSWORD`,`REGISTRATION_DATE`,`STATUS`,`USER_TYPE`,`USER_NAME`,`DESIGNATION_ID`,`PROJECT_ID`) VALUES 
 (1,'Ahmedabad','India','Gujarat','9, Jinendra Apartment, Above UCO Bank, Rambag Road, Sabarmati','380005','1983-07-21 00:00:00','Mrs. Kusumben Shah','9327367001','9327367001','9376197557','shahkrunalm@gmail.com','http://www.admin.com','07927507260','shahkrunalm@gmail.com','Krunal','male','2014-05-11 09:06:52','Shah','wfms@321','2014-04-30 00:00:00',1,'Admin ','admin',2,NULL),
 (2,'Ahmedabad','India','Gujarat','9, Jinendra Apartment','380005','2002-05-01 00:00:00','Mr. Krunal Shah','07927501214','07927501214','9376197557','manisha@gmail.com',NULL,NULL,'sefali@gmail.com','Sefali','female','2014-05-11 09:37:52','Kodala','wfms@123','2014-05-03 20:55:54',1,'Developer','sefali',5,1),
 (3,'Baroda','India','Gujarat','9, Jinendra Apartment','380013','1994-05-25 00:00:00','Mr. Krunal Shah','07927501214','07927501214','9376197557','kusum@gmail.com',NULL,NULL,'kusum@wfms.com','Jaimini','female','2014-05-07 07:29:15','Joshi','wfms@123','2014-05-05 21:46:44',1,'Delivery Manager','jaimini',1,NULL),
 (4,'Bharuch','India','Gujarat','9, Jinendra Apartment','380013','1983-07-21 00:00:00','Mr. Krunal Shah','07927501214','07927501214','9376197557','hemal@gmail.com',NULL,NULL,'hemal@wfms.com','Hemangi','male','2014-05-11 08:58:04','Chaudhari','wfms@321','2014-05-05 21:54:30',1,'Project Lead','hemangi',4,1),
 (5,'Baroda','India','Gujarat','Naranpura','380013','2002-05-05 00:00:00','Mr. Krunal Shah','07927501214','07927501214','9376197557','jinay@gmail.com',NULL,NULL,'jinay@wfms.com','Jinay','male','2014-05-11 09:01:23','Shah','wfms@321','2014-05-05 21:56:19',1,'Project Manager','jinay',3,1),
 (6,'Baroda','India','Gujarat','Paldi','380013','2002-05-01 00:00:00','Mr. Krunal Shah','4225846532','07927501214','9376197557','umang@gmail.com',NULL,NULL,'umang@wfms.com','Umang','male','2014-05-11 08:53:21','Dave','wfms@123','2014-05-06 22:20:42',1,'Project Manager','umang',3,NULL),
 (7,'Bharuch','India','Gujarat','Garima SEZ','380101','2002-05-07 00:00:00','Mr. Krunal Shah','07927501214','917937896369','917937896369','info@tcs.com',NULL,NULL,'riyanci@wfms.com','Neha','female','2014-05-11 08:53:21','Joshi','wfms@123','2014-05-07 08:05:13',1,'Developer','neha',5,NULL),
 (9,'Bharuch','India','Gujarat','Infocity, Gandhinagar','380014','2002-05-05 00:00:00','Mrs. Parina','07927501214','917937896369','917937896369','info@turn.com',NULL,NULL,'sahil@wfms.com','Sahil','male','2014-05-07 23:03:03','Shah','wfms@123','2014-05-07 23:02:38',1,'Developer','sahil',5,NULL),
 (10,'Surat','India','Gujarat','Infocity, Gandhinagar','127836','2002-05-01 00:00:00','Mr. Krunal Shah','07927501214','917937896369','917937896369','info@cybage.com',NULL,NULL,'rahul@wfms.com','Rahul','male','2014-05-08 18:07:42','Chaudhari','wfms@123','2014-05-08 18:07:42',1,'Project Lead','rahul',4,NULL),
 (12,'Ahmedabad','India','Gujarat','Garima SEZ','380101','2002-05-01 00:00:00','Mr. Krunal Shah','07927501214','917937896369','917937896369','info@tcs.com',NULL,NULL,'pavan@wfms.com','Pavan','male','2014-05-09 08:11:02','Bihola','wfms@123','2014-05-09 08:10:37',1,'Developer','pavan',5,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
