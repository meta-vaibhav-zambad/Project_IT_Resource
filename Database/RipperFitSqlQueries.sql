CREATE DATABASE  IF NOT EXISTS `ripper_fit` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ripper_fit`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: ripper_fit
-- ------------------------------------------------------
-- Server version	5.5.23

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
-- Table structure for table `approve_request`
--

DROP TABLE IF EXISTS `approve_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approve_request` (
  `approvee_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `forwardTo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `ApproveRequest_ibfk_2` (`request_id`),
  KEY `ApproveRequest_ibfk_3` (`forwardTo_id`),
  KEY `ApproveRequest_ibfk_1` (`approvee_id`),
  CONSTRAINT `ApproveRequest_ibfk_1` FOREIGN KEY (`approvee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `ApproveRequest_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `resource_request` (`request_id`),
  CONSTRAINT `ApproveRequest_ibfk_3` FOREIGN KEY (`forwardTo_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approve_request`
--

LOCK TABLES `approve_request` WRITE;
/*!40000 ALTER TABLE `approve_request` DISABLE KEYS */;
INSERT INTO `approve_request` VALUES (5,14,3),(4,15,1),(4,16,1),(4,17,1),(4,18,1),(4,19,1),(4,20,1),(1,21,3),(4,22,1);
/*!40000 ALTER TABLE `approve_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(30) NOT NULL,
  `final_approval_level` int(11) NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`resource_id`),
  KEY `resource_ibfk_1` (`organization_id`),
  CONSTRAINT `resource_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` VALUES (1,'Mouse',4,1),(2,'Monitor',3,1),(3,'PC',2,1),(4,'Mac',1,1);
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designation` (
  `designation_id` int(11) NOT NULL AUTO_INCREMENT,
  `designation_name` varchar(30) NOT NULL,
  `designation_level` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`designation_id`),
  KEY `department_ibfk_2` (`department_id`),
  KEY `designation_ibfk_2` (`organization_id`),
  CONSTRAINT `designation_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`),
  CONSTRAINT `designation_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designation`
--

LOCK TABLES `designation` WRITE;
/*!40000 ALTER TABLE `designation` DISABLE KEYS */;
INSERT INTO `designation` VALUES (1,'Admin',0,1,1),(2,'CEO',1,3,1),(3,'Helpdesk',0,2,1),(4,'Manager',2,3,1),(5,'Employee',4,3,1),(6,'Techlead',3,3,1),(7,'Admin',0,5,3),(8,'Manager',1,6,3),(9,'Employee',2,6,3),(10,'Helpdesk',0,8,3);
/*!40000 ALTER TABLE `designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_request`
--

DROP TABLE IF EXISTS `resource_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `requestor_id` int(11) NOT NULL,
  `current_approval_level` int(11) DEFAULT NULL,
  `priority` varchar(30) DEFAULT 'low',
  `status` varchar(30) NOT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `resource_id` (`resource_id`),
  KEY `requestor_id` (`requestor_id`),
  KEY `resource_request_ibfk_3` (`organization_id`),
  CONSTRAINT `resource_request_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`resource_id`),
  CONSTRAINT `resource_request_ibfk_2` FOREIGN KEY (`requestor_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `resource_request_ibfk_3` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_request`
--

LOCK TABLES `resource_request` WRITE;
/*!40000 ALTER TABLE `resource_request` DISABLE KEYS */;
INSERT INTO `resource_request` VALUES (14,1,5,4,'medium','completed','need','2016-10-23',1),(15,4,5,2,'high','completed','need','2016-10-23',1),(16,4,5,2,'medium','completed','sdsa','2016-10-23',1),(17,4,5,2,'medium','completed','sada','2016-10-23',1),(18,4,5,2,'medium','completed','need mac','2016-10-23',1),(19,4,5,2,'medium','completed','dsadasd','2016-10-23',1),(20,4,4,2,'medium','completed','need mac','2016-10-23',1),(21,3,1,0,'medium','completed','need pc','2016-10-23',1),(22,4,5,2,'medium','completed','need mac','2016-10-24',1);
/*!40000 ALTER TABLE `resource_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `commentor_id` int(11) NOT NULL,
  `comments` varchar(500) NOT NULL,
  `request_id` int(11) NOT NULL,
  `comment_date` date NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `comments_ibfk_1` (`commentor_id`),
  KEY `comments_ibfk_2` (`request_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`commentor_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `resource_request` (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(200) NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  KEY `department_ibfk_1` (`organization_id`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Admin',1),(2,'Helpdesk',1),(3,'Technical',1),(4,'HR',1),(5,'Admin',3),(6,'Technical',3),(7,'HR',3),(8,'Helpdesk',3);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_id` int(11) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) DEFAULT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `contact_number` varchar(10) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `reportTo_id` int(11) DEFAULT NULL,
  `profile_picture` varchar(500) DEFAULT NULL,
  `approval_status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `employee_ibfk_3` (`organization_id`),
  KEY `employee_ibfk_4` (`designation_id`),
  KEY `employee_ibfk_6` (`reportTo_id`),
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`),
  CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`designation_id`),
  CONSTRAINT `employee_ibfk_6` FOREIGN KEY (`reportTo_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,1,'vaibhav.zambad@metacube.com','123456','Vaibhav','Pravin Zambad ','Male','7845263652',1,NULL,'https://lh4.googleusercontent.com/-eSDkmWBLaZo/AAAAAAAAAAI/AAAAAAAAAAo/Gb7tIeyh9eA/s96-c/photo.jpg',NULL),(3,1,'amit.kumar@metacube.com','123456','amit','kumar','Male','8957451252',3,NULL,'https://lh6.googleusercontent.com/-pkto2iAvl1A/AAAAAAAAAAI/AAAAAAAAAB8/XHv93lNF7CI/s96-c/photo.jpg',NULL),(4,1,'riya.nuwal@metacube.com','123456','riya','nuwal','Male','2565874552',4,1,'https://lh6.googleusercontent.com/-pkto2iAvl1A/AAAAAAAAAAI/AAAAAAAAAB8/XHv93lNF7CI/s96-c/photo.jpg','true'),(5,1,'amita.sharma@metacube.com','123456','amita','sharma','Female','8452142631',5,4,'https://lh6.googleusercontent.com/-pkto2iAvl1A/AAAAAAAAAAI/AAAAAAAAAB8/XHv93lNF7CI/s96-c/photo.jpg','true'),(6,3,'ajinkya.pande@meatcube.com','123456','ajinkya','pande','Male','5684521455',7,NULL,NULL,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `organization_id` int(11) NOT NULL AUTO_INCREMENT,
  `organization_name` varchar(100) NOT NULL,
  PRIMARY KEY (`organization_id`),
  UNIQUE KEY `organization_name_UNIQUE` (`organization_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (3,'Appririo'),(1,'Metacube');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-24  1:53:39
