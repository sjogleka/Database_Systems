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
-- Dumping data for table `Ticket`
--

LOCK TABLES `Ticket` WRITE;
/*!40000 ALTER TABLE `Ticket` DISABLE KEYS */;
INSERT INTO `Ticket` VALUES ('26BE7mFEZu',12345,'Monay',2,'Confirm','Charlotte Station','Union Station'),('AA090G3S744',12345,'Monday',4,'Cacnel','Tempa','New York'),('AA090G3S836',12345,'Monday',4,'Cancel','Tempa','New York'),('AA090G3SSS',12345,'Monday',4,'Confirm','Tempa','New York'),('EvJ0MJOLYa',12345,'Monday',2,'Cancel','Charlotte','New York'),('F90G009',12345,'Monday',3,'Confirm','Tempa','New York'),('FVkwCabXRX',23456,'Monday',5,'Cancel','Tempa','New York'),('G1mT5wwY7j',12345,'Monday',2,'Cancel','Charlotte','New York'),('GG090G3SP',12345,'Monday',4,'Confirm','Charlotte','New York'),('GG99090G3SP',12345,'Wednesday',2,'Confirm','Charlotte','Cary'),('GG99090G4SP',12345,'Monday',2,'Confirm','Charlotte','Tampa'),('jTLf6Hx4qY',12345,'Monday',3,'Cancel','Tempa','New York'),('k1ShttJS4z',12345,'Monay',2,'Cancel','Charlotte','New York'),('OAB990989',23456,'Monday',2,'Cancel','Chicago','New York'),('om8Xvkpj8p',12345,'Monay',2,'Confirm','Charlotte Station','Union Station'),('QihhYhun4G',12345,'Monay',2,'Confirm','Charlotte Station','Union Station'),('rLDSypulzi',12345,'Monday',3,'Cancel','Union Station','New York'),('twiREgqYdr',12345,'Monday',2,'Confirm','Tempa','New York'),('VMVo4cruXa',23456,'Monday',5,'Cancel','Temps','Charlotte Station'),('VVqTvYw3GV',23456,'Monday',5,'Confirm','Charlotte','New York'),('x0ZQ2u8sOh',12345,'Monay',2,'Confirm','Charlotte Station','Union Station');
/*!40000 ALTER TABLE `Ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sumedh`@`%`*/ /*!50003 TRIGGER after_cacnel 
    After UPDATE ON Ticket
    FOR EACH ROW 
BEGIN
IF exists(select ticket_no from Ticket where ticket_no = new.ticket_no)  Then
call availabilitycancel(new.ticket_no);
END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-02 16:32:17
