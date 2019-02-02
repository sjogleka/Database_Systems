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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED='';

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('gaurav','Gaurav','Mahadik','gmahadik@uncc.edu',9969449896,7049572230,'male','1996-08-20','200 Barton Creek Dr, Apt D','Charlotte','NC','28262','u'),('jinal01','Jinal','Butani','jbutani@uncc.edu',9802262049,9506065760,'female','1996-10-20','10001 c, graduate ln','Charlotte','NC','28262','u'),('Pratik','Praik','Parekh','pparekh@uncc.edu',8097470356,7049572886,'male','1996-12-25','9421,University Bldv','Charlotte','NC','28262','u'),('sakshat','Sakshat','Surve','ssurve@uncc.edu',9969112128,7049578888,'male','1996-01-12','9402 University Terrace Dr, Apt F','Charlotte','NC','28262','u'),('spj','keval','Joshi','xabcv@uncc.edu',9969112128,70495755230,'male','1996-05-30','9421,University Bldv Apt F','Charlotte','NC','28262','a'),('sumedh','Sumedh','Joglekar','sjogleka@uncc.edu',9028251242,7049573530,'male','1994-05-04','516 Barton Creek Dr, Apt C','Charlotte','NC','28262','u');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-02 16:32:15
