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
-- Temporary table structure for view `PassengerTicket`
--

DROP TABLE IF EXISTS `PassengerTicket`;
/*!50001 DROP VIEW IF EXISTS `PassengerTicket`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `PassengerTicket` AS SELECT 
 1 AS `ticket_no`,
 1 AS `train_number`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `email_id`,
 1 AS `travel_day`,
 1 AS `ticket_status`,
 1 AS `source`,
 1 AS `destination`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `bookinghistory`
--

DROP TABLE IF EXISTS `bookinghistory`;
/*!50001 DROP VIEW IF EXISTS `bookinghistory`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bookinghistory` AS SELECT 
 1 AS `ticket_no`,
 1 AS `train_name`,
 1 AS `train_number`,
 1 AS `travel_day`,
 1 AS `ticket_status`,
 1 AS `source`,
 1 AS `destination`,
 1 AS `username`,
 1 AS `Booked By`,
 1 AS `Passengers`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `PassengerTicket`
--

/*!50001 DROP VIEW IF EXISTS `PassengerTicket`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sumedh`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `PassengerTicket` AS select `t`.`ticket_no` AS `ticket_no`,`t`.`train_number` AS `train_number`,`p`.`first_name` AS `first_name`,`p`.`last_name` AS `last_name`,`p`.`email_id` AS `email_id`,`t`.`travel_day` AS `travel_day`,`t`.`ticket_status` AS `ticket_status`,`t`.`source` AS `source`,`t`.`destination` AS `destination` from ((`Ticket` `t` join `Passenger_Ticket` `pt` on((`pt`.`ticket_no` = `t`.`ticket_no`))) join `Passenger` `p` on((`p`.`email_id` = `pt`.`email_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bookinghistory`
--

/*!50001 DROP VIEW IF EXISTS `bookinghistory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sumedh`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `bookinghistory` AS select `t`.`ticket_no` AS `ticket_no`,`tn`.`train_name` AS `train_name`,`t`.`train_number` AS `train_number`,`t`.`travel_day` AS `travel_day`,`t`.`ticket_status` AS `ticket_status`,`t`.`source` AS `source`,`t`.`destination` AS `destination`,`u`.`username` AS `username`,concat_ws(' ',`u`.`first_name`,`u`.`last_name`) AS `Booked By`,group_concat(concat_ws(' ',`p`.`first_name`,`p`.`last_name`) separator ',') AS `Passengers` from (((((`Passenger_Ticket` `pt` join `Passenger` `p` on((`p`.`email_id` = `pt`.`email_id`))) join `Ticket` `t` on((`t`.`ticket_no` = `pt`.`ticket_no`))) join `Train` `tn` on((`tn`.`train_number` = `t`.`train_number`))) join `BooksCancels` `b` on((`b`.`ticket_no` = `t`.`ticket_no`))) join `User` `u` on((`b`.`username` = `u`.`username`))) group by `t`.`ticket_no` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'railwayDB'
--

--
-- Dumping routines for database 'railwayDB'
--
/*!50003 DROP PROCEDURE IF EXISTS `availability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sumedh`@`%` PROCEDURE `availability`(IN train_no int(10), IN trl_day
varchar(10),In train_run_day varchar(10))
BEGIN
DECLARE totalcap,no_passengers, finalop INT DEFAULT 0;
select sum(t.no_of_passengers) INTO no_passengers from Ticket t where (t.train_number = train_no  and t.travel_day=trl_day  and t.ticket_status = 'Confirm');
select total_capacity INTO totalcap from Train tr where tr.train_number = train_no;
select no_passengers;
set finalop := totalcap - no_passengers;
#select finalop;
update Availability av set av.no_available_seats=finalop where (av.train_number = train_no and av.train_running_day = train_run_day);
select no_available_seats from Availability where train_number =train_no and train_running_day =train_run_day ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `availabilitycancel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sumedh`@`%` PROCEDURE `availabilitycancel`(IN t_no
varchar(25))
BEGIN
DECLARE totalcap,no_seats,train_no,finalop,no_passengers INT DEFAULT 0;
declare t_day varchar(10);
select no_of_passengers into no_passengers from Ticket where ticket_no = t_no;
select train_number into train_no from Ticket t where ticket_no = t_no;
#select total_capacity INTO totalcap from Train tr where tr.train_number = train_no;
select travel_day INTO t_day from Ticket t where ticket_no = t_no;
select av.no_available_seats into no_seats from Availability av where (av.train_number = train_no and av.train_running_day = t_day);
set finalop = no_seats + no_passengers;
update Availability av set av.no_available_seats=finalop where (av.train_number = train_no and av.train_running_day = t_day);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fare` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sumedh`@`%` PROCEDURE `fare`(IN train_no int(10), IN st_name_src
varchar(50),In st_name_dest varchar(50),OUT tfare INT)
BEGIN
DECLARE hault_src,hault_dest, finalop,b_fare INT DEFAULT 0;
select hault INTO hault_src from startsAt where station_no=(select station_no from station where (station_name=st_name_src and train_number=train_no));
select hault INTO hault_dest from startsAt where station_no=(select station_no from station where (station_name=st_name_dest and train_number=train_no));
set finalop := hault_dest - hault_src;
select base_fare INTO b_fare from Train where train_number = train_no;
set tfare := (finalop*b_fare);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inbetween` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sumedh`@`%` PROCEDURE `inbetween`(IN stn_no varchar(50))
BEGIN
DECLARE totalcap,no_passengers, finalop INT DEFAULT 0;
select train_number from startsAt where station_no = (select station_no from station where station_name = stn_no);
#(select train_number from startsAt where station_no = (select station_no from station where station_name = stn_no));
END ;;
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

-- Dump completed on 2018-12-02 16:32:21
