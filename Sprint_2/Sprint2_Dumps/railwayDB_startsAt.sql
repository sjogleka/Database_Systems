-- MySQL dump 10.13  Distrib 5.7.23, for Win64 (x86_64)
--
-- Host: fall2018joglekar.ctyaxuwibzdo.us-east-2.rds.amazonaws.com    Database: railwayDB
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
-- Table structure for table `startsAt`
--

DROP TABLE IF EXISTS `startsAt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `startsAt` (
  `station_no` int(10) NOT NULL,
  `train_number` int(10) NOT NULL,
  `arrival_time` time NOT NULL,
  `departure_time` time NOT NULL,
  `hault` int(11) NOT NULL,
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
INSERT INTO `startsAt` VALUES (125,12345,'09:53:00','11:05:00',1),(129,12345,'09:03:00','09:10:00',5),(129,23456,'00:00:00','21:30:00',0),(234,12345,'00:00:00','01:46:00',0),(234,23456,'09:13:00','09:18:00',6),(325,12345,'09:30:00','09:35:00',4),(365,12345,'09:20:00','09:25:00',2),(415,12345,'09:40:00','09:50:00',3);
/*!40000 ALTER TABLE `startsAt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-11 21:12:16
