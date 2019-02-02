-- MySQL dump 10.13  Distrib 5.7.23, for macos10.13 (x86_64)
--
-- Host: fall2018harshithakv.ceh38pwazkcp.us-east-2.rds.amazonaws.com    Database: RailwayDatabase
-- ------------------------------------------------------
-- Server version	5.7.23-log

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
-- Table structure for table `Train`
--

DROP TABLE IF EXISTS `Train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Train` (
  `train_number` int(11) NOT NULL,
  `train_name` varchar(25) NOT NULL,
  `tsource` varchar(25) NOT NULL,
  `destination` varchar(25) NOT NULL,
  `no_available_seats` int(10) DEFAULT NULL,
  `travel_fare` int(10) NOT NULL,
  PRIMARY KEY (`train_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Train`
--

LOCK TABLES `Train` WRITE;
/*!40000 ALTER TABLE `Train` DISABLE KEYS */;
INSERT INTO `Train` VALUES (12345,'charlotteexp','charlotte','tampa',3,25),(23456,'chicagoexp','chicago','newyork',2,40),(34567,'bostonexp','boston','lafayette',65,17),(45678,'texasexp','dallas','chicago',45,56),(67890,'atlantaexp','atlanta','raleigh',11,70);
/*!40000 ALTER TABLE `Train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `ssn` varchar(12) NOT NULL,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) NOT NULL,
  `email_id` varchar(80) DEFAULT NULL,
  `phone_number1` double NOT NULL,
  `phone_number2` double DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `date_of_birth` date NOT NULL,
  `address_line1` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'100000000','Jinal','Butani','jbutani@uncc.edu',9802262049,9506065760,'female','1996-10-20','10001 c, graduate ln','Charlotte','NC','28262'),(2,'459000000','Sumedh','Joglekar','sjogleka@uncc.edu',9028251242,7049573530,'male','1994-05-04','516 Barton Creek Dr, Apt C','Charlotte','NC','28262'),(3,'56000000','Gaurav','Mahadik','gmahadik@uncc.edu',9969449896,7049572230,'male','1996-08-20','200 Barton Creek Dr, Apt D','Charlotte','NC','28262'),(4,'9786875980','Sakshat','Surve','ssurve@uncc.edu',9969112128,7049578888,'male','1996-01-12','9402 University Terrace Dr, Apt F','Charlotte','NC','28262'),(5,'5198567441','Praik','Parekh','pparekh@uncc.edu',8097470356,7049572886,'male','1996-12-25','9421,University Bldv','Charlotte','NC','28262');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserAccount`
--

DROP TABLE IF EXISTS `UserAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserAccount` (
  `user_id` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `UserAccount_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserAccount`
--

LOCK TABLES `UserAccount` WRITE;
/*!40000 ALTER TABLE `UserAccount` DISABLE KEYS */;
INSERT INTO `UserAccount` VALUES (3,'gaurav','gm007'),(1,'jinal01','jinal01'),(5,'Pratik','pparekh2'),(4,'sakshat','ssurve'),(2,'sumedh','sumjog');
/*!40000 ALTER TABLE `UserAccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `startsAt`
--

DROP TABLE IF EXISTS `startsAt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `startsAt` (
  `station_no` int(10) NOT NULL,
  `train_number` int(10) NOT NULL,
  `arrival_time` time DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  PRIMARY KEY (`station_no`,`train_number`),
  KEY `train_number` (`train_number`),
  CONSTRAINT `startsAt_ibfk_1` FOREIGN KEY (`station_no`) REFERENCES `station` (`station_no`),
  CONSTRAINT `startsAt_ibfk_2` FOREIGN KEY (`train_number`) REFERENCES `Train` (`train_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `startsAt`
--

LOCK TABLES `startsAt` WRITE;
/*!40000 ALTER TABLE `startsAt` DISABLE KEYS */;
INSERT INTO `startsAt` VALUES (125,12345,'09:53:00','11:05:00'),(129,23456,NULL,'17:45:00'),(234,12345,NULL,'01:46:00'),(250,12345,'09:23:00',NULL);
/*!40000 ALTER TABLE `startsAt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `station` (
  `station_no` int(10) NOT NULL,
  `station_name` varchar(50) NOT NULL,
  `address_line1` varchar(100) NOT NULL,
  `city` tinytext NOT NULL,
  `state` tinytext NOT NULL,
  `zip_code` int(10) NOT NULL,
  PRIMARY KEY (`station_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (125,'Cary Station','211 N Academy St','Cary','North Carolina',28262),(129,'Union Station','225 S Canal St','Chicago','Illinois',60001),(225,'Penn Station','IRT Broadway,Seventh Avenue Line,34 St','New York','NY',10119),(234,'Charlotte Station','1914 N Tryon St','Charlotte','North Carolina',28262),(248,'Raleigh Union Station','510 W Martin St','Raleigh','North Carolina',27601),(250,'Union Station','601 N Nebraska Ave','Tampa','Florida',32003),(285,'Back Bay Station','145 Dartmouth St','Boston','Massachusetts',2116),(325,'Washington Union Station','50 Massachusetts Ave NE','Washington','DC',20002),(365,'Peachtree Station','1688 Peachtree St NW','Atlanta','Georgia',31119),(415,'lafayette station','200 N Second St','lafayette','Louisiana',47901),(437,'Union Station','400 S Houston St','Dallas','Texas',75202);
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-23 21:37:10
