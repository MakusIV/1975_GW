-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: 1975_gw_db
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `airbase`
--

DROP TABLE IF EXISTS `airbase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airbase` (
  `idAirbase` varchar(50) NOT NULL,
  `Side` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`idAirbase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airbase`
--

LOCK TABLES `airbase` WRITE;
/*!40000 ALTER TABLE `airbase` DISABLE KEYS */;
INSERT INTO `airbase` VALUES ('Batumi','Blue'),('Beslan','Red'),('Kutaisi','Blue'),('Kvitiri','Blue'),('Kvitiri HELO','Blue'),('Mineralnye','Red'),('Mozdok','Red'),('Nalchik','Red'),('Soganlug','Blue'),('Tbilisi','Blue'),('Vaziani','Blue');
/*!40000 ALTER TABLE `airbase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aircraft` (
  `idAircraft` varchar(30) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idAircraft`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES ('An-26',NULL),('B-1B',NULL),('B-52H',NULL),('C-130',NULL),('F-14A',NULL),('F-4',NULL),('F-5',NULL),('L-39C',NULL),('L-39ZA',NULL),('Mig-19',NULL),('Mig-21Bis',NULL),('Mig-23MLD',NULL),('Mig-25PD',NULL),('Mig-25RTB',NULL),('Mig-27K',NULL),('Su-17M4',NULL),('Su-24M',NULL),('Su-24MR',NULL),('Tu-22',NULL),('Yak-40',NULL);
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `aircraft difference by role`
--

DROP TABLE IF EXISTS `aircraft difference by role`;
/*!50001 DROP VIEW IF EXISTS `aircraft difference by role`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `aircraft difference by role` AS SELECT 
 1 AS `Blue_Role`,
 1 AS `difference: blue-red`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `assigned`
--

DROP TABLE IF EXISTS `assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assigned` (
  `quantity` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `Aircraft_idAircraft` varchar(30) NOT NULL,
  `Airbase_idAirbase` varchar(50) NOT NULL,
  `Role_idRole` varchar(5) NOT NULL,
  PRIMARY KEY (`Aircraft_idAircraft`,`Airbase_idAirbase`,`Role_idRole`),
  KEY `fk_Assigned_Aircraft_idx` (`Aircraft_idAircraft`),
  KEY `fk_Assigned_Airbase1_idx` (`Airbase_idAirbase`),
  KEY `fk_Assigned_Role1_idx` (`Role_idRole`),
  CONSTRAINT `fk_Assigned_Airbase1` FOREIGN KEY (`Airbase_idAirbase`) REFERENCES `airbase` (`idAirbase`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Assigned_Aircraft` FOREIGN KEY (`Aircraft_idAircraft`) REFERENCES `aircraft` (`idAircraft`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Assigned_Role1` FOREIGN KEY (`Role_idRole`) REFERENCES `role` (`idRole`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assigned`
--

LOCK TABLES `assigned` WRITE;
/*!40000 ALTER TABLE `assigned` DISABLE KEYS */;
INSERT INTO `assigned` VALUES (2,'','An-26','Batumi','TRA'),(2,'','An-26','Beslan','TRA'),(2,'','An-26','Kutaisi','TRA'),(10,'','An-26','Mineralnye','TRA'),(2,'','An-26','Mozdok','TRA'),(2,'','An-26','Nalchik','TRA'),(1,'','An-26','Soganlug','TRA'),(4,'','An-26','Tbilisi','TRA'),(7,'','B-1B','Batumi','BAI'),(3,'','B-1B','Batumi','EWR'),(10,'','B-1B','Tbilisi','BAI'),(1,'','B-1B','Tbilisi','EWR'),(5,'','B-52H','Batumi','BAI'),(5,'','B-52H','Tbilisi','BAI'),(15,NULL,'C-130','Batumi','TRA'),(1,'','F-14A','Batumi','EWR'),(3,'','F-14A','Batumi','REC'),(5,'','F-4','Batumi','GCI'),(5,'','F-4','Batumi','REC'),(7,'','F-4','Kutaisi','GA'),(5,'','F-4','Kutaisi','GCI'),(3,'','F-4','Kutaisi','REC'),(7,'','F-4','Soganlug','GA'),(5,'','F-4','Soganlug','GCI'),(3,'','F-4','Soganlug','REC'),(2,'','F-4','Tbilisi','EWR'),(7,'','F-4','Tbilisi','GA'),(5,'','F-4','Tbilisi','GCI'),(3,'','F-4','Tbilisi','REC'),(7,'','F-4','Vaziani','GA'),(5,'','F-4','Vaziani','GCI'),(3,'','F-4','Vaziani','REC'),(10,'','F-5','Batumi','CAP'),(10,'','F-5','Batumi','CAS'),(10,'','F-5','Kutaisi','CAP'),(7,'','F-5','Kutaisi','CAS'),(10,'','F-5','Soganlug','CAP'),(7,'','F-5','Soganlug','CAS'),(10,'','F-5','Tbilisi','CAP'),(10,'','F-5','Tbilisi','CAS'),(10,'','F-5','Vaziani','CAP'),(7,'','F-5','Vaziani','CAS'),(10,'','L-39C','Batumi','CAP'),(7,'','L-39C','Kutaisi','CAS'),(7,'','L-39C','Soganlug','CAS'),(10,'','L-39C','Tbilisi','CAS'),(7,'','L-39C','Vaziani','CAS'),(7,'','L-39ZA','Kutaisi','GA'),(7,'','L-39ZA','Soganlug','GA'),(7,'','L-39ZA','Tbilisi','GA'),(7,'','L-39ZA','Vaziani','GA'),(10,NULL,'Mig-19','Beslan','CAP'),(5,NULL,'Mig-19','Beslan','GCI'),(10,'','Mig-19','Kutaisi','CAP'),(5,'','Mig-19','Kutaisi','GCI'),(5,'','Mig-19','Nalchik','CAP'),(2,'','Mig-19','Nalchik','GCI'),(10,'','Mig-19','Soganlug','CAP'),(5,'','Mig-19','Soganlug','GCI'),(10,'','Mig-19','Vaziani','CAP'),(5,'','Mig-19','Vaziani','GCI'),(5,'','Mig-21Bis','Batumi','GCI'),(5,NULL,'Mig-21Bis','Beslan','CAP'),(10,NULL,'Mig-21Bis','Beslan','CAS'),(5,NULL,'Mig-21Bis','Beslan','GA'),(5,NULL,'Mig-21Bis','Beslan','GCI'),(3,NULL,'Mig-21Bis','Beslan','REC'),(7,'','Mig-21Bis','Kutaisi','CAP'),(3,'','Mig-21Bis','Kutaisi','CAS'),(3,'','Mig-21Bis','Kutaisi','GA'),(5,'','Mig-21Bis','Kutaisi','GCI'),(3,'','Mig-21Bis','Kutaisi','REC'),(7,'','Mig-21Bis','Mineralnye','BAI'),(10,'','Mig-21Bis','Mineralnye','CAP'),(7,'','Mig-21Bis','Mineralnye','GA'),(7,'','Mig-21Bis','Mozdok','BAI'),(10,'','Mig-21Bis','Mozdok','CAP'),(7,'','Mig-21Bis','Mozdok','GA'),(10,'','Mig-21Bis','Nalchik','CAP'),(7,'','Mig-21Bis','Nalchik','CAS'),(7,'','Mig-21Bis','Nalchik','GA'),(5,'','Mig-21Bis','Nalchik','GCI'),(3,'','Mig-21Bis','Nalchik','REC'),(7,'','Mig-21Bis','Soganlug','CAP'),(3,'','Mig-21Bis','Soganlug','CAS'),(3,'','Mig-21Bis','Soganlug','GA'),(5,'','Mig-21Bis','Soganlug','GCI'),(3,'','Mig-21Bis','Soganlug','REC'),(7,'','Mig-21Bis','Tbilisi','CAP'),(3,'','Mig-21Bis','Tbilisi','CAS'),(3,'','Mig-21Bis','Tbilisi','GA'),(5,'','Mig-21Bis','Tbilisi','GCI'),(3,'','Mig-21Bis','Tbilisi','REC'),(7,'','Mig-21Bis','Vaziani','CAP'),(3,'','Mig-21Bis','Vaziani','CAS'),(3,'','Mig-21Bis','Vaziani','GA'),(5,'','Mig-21Bis','Vaziani','GCI'),(3,'','Mig-21Bis','Vaziani','REC'),(15,NULL,'Mig-23MLD','Beslan','CAP'),(15,'','Mig-23MLD','Mineralnye','CAP'),(15,'','Mig-23MLD','Mozdok','CAP'),(15,'','Mig-23MLD','Nalchik','CAP'),(5,NULL,'Mig-25PD','Beslan','GCI'),(7,'','Mig-25PD','Mineralnye','CAP'),(7,'','Mig-25PD','Mozdok','CAP'),(5,'','Mig-25PD','Nalchik','GCI'),(3,'','Mig-25RTB','Mineralnye','EWR'),(3,'','Mig-25RTB','Mineralnye','REC'),(2,'','Mig-25RTB','Mozdok','EWR'),(3,'','Mig-25RTB','Mozdok','REC'),(7,'','Mig-27K','Beslan','GA'),(7,'','Mig-27K','Mozdok','GA'),(7,'','Mig-27K','Nalchik','GA'),(5,NULL,'Su-17M4','Beslan','CAS'),(7,'','Su-17M4','Kutaisi','CAS'),(10,'','Su-17M4','Nalchik','CAS'),(7,'','Su-17M4','Soganlug','CAS'),(7,'','Su-17M4','Vaziani','CAS'),(5,NULL,'Su-24M','Beslan','GA'),(7,'','Su-24M','Mineralnye','GA'),(7,'','Su-24M','Mozdok','GA'),(7,'','Su-24M','Nalchik','GA'),(5,'','Su-24MR','Batumi','BAI'),(3,NULL,'Su-24MR','Beslan','REC'),(7,'','Su-24MR','Mineralnye','BAI'),(7,'','Su-24MR','Mozdok','BAI'),(3,'','Su-24MR','Nalchik','REC'),(5,'','Su-24MR','Tbilisi','BAI'),(15,'','Tu-22','Mineralnye','BAI'),(3,'','Tu-22','Mineralnye','EWR'),(7,'','Tu-22','Mozdok','BAI'),(2,'','Tu-22','Mozdok','EWR'),(3,'','Yak-40','Batumi','TRA'),(2,'','Yak-40','Mineralnye','TRA'),(1,'','Yak-40','Mozdok','TRA'),(3,'','Yak-40','Tbilisi','TRA');
/*!40000 ALTER TABLE `assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `blue_aircraft_for_role`
--

DROP TABLE IF EXISTS `blue_aircraft_for_role`;
/*!50001 DROP VIEW IF EXISTS `blue_aircraft_for_role`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `blue_aircraft_for_role` AS SELECT 
 1 AS `Role_idRole`,
 1 AS `sum(quantity)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `blue_red_aircraft_for_role`
--

DROP TABLE IF EXISTS `blue_red_aircraft_for_role`;
/*!50001 DROP VIEW IF EXISTS `blue_red_aircraft_for_role`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `blue_red_aircraft_for_role` AS SELECT 
 1 AS `Side`,
 1 AS `Role_idRole`,
 1 AS `sum(quantity)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `red_aircraft_for_role`
--

DROP TABLE IF EXISTS `red_aircraft_for_role`;
/*!50001 DROP VIEW IF EXISTS `red_aircraft_for_role`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `red_aircraft_for_role` AS SELECT 
 1 AS `Role_idRole`,
 1 AS `sum(quantity)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `idRole` varchar(5) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('BAI','Interdiction, Bombing, Pin Point Strike'),('CAP','Combat Air Patrol, Fighter Sweep'),('CAS','Close Air Support'),('EWR','Early Warning Radar'),('GA','Ground Attack'),('GCI','Intercept'),('REC','Recongition'),('SEAD',' Suppression of Enemy Air Defences'),('TRA','Transport');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database '1975_gw_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `aircraft by airbase-role-side` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`marco`@`%` PROCEDURE `aircraft by airbase-role-side`(IN role varchar(4), IN side varchar(4))
BEGIN

/*blue by Airbase, aircraft and quantity (uguale a quello sopra però più compatto) */
select idAirbase, Assigned.Aircraft_idAircraft, quantity
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = role and Airbase.side = side 
	group by Airbase_idAirbase, Aircraft_idAircraft;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `aircraft difference blue - red by role` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`marco`@`%` PROCEDURE `aircraft difference blue - red by role`()
BEGIN

SELECT `t1`.`Blue_Role` AS `Blue_Role`, (`t1`.`Blue_quantity` - `t2`.`Red_quantity`) AS `difference: blue - red`

FROM ( 
 
	(SELECT `a1`.`Role_idRole` AS `Blue_Role`, SUM(`a1`.`quantity`) AS `Blue_quantity`
	FROM (`1975_gw_db`.`assigned` AS `a1` JOIN `1975_gw_db`.`airbase` ON (`1975_gw_db`.`airbase`.`idAirbase` = `a1`.`Airbase_idAirbase`))
    WHERE (`1975_gw_db`.`airbase`.`Side` = 'Blue')
    GROUP BY `Blue_Role` ) AS t1,
		
	(SELECT  `a2`.`Role_idRole` AS `Red_Role`, SUM(`a2`.`quantity`) AS `Red_quantity`
	FROM (`1975_gw_db`.`assigned` AS `a2` JOIN `1975_gw_db`.`airbase` ON (`1975_gw_db`.`airbase`.`idAirbase` = `a2`.`Airbase_idAirbase`))
    WHERE (`1975_gw_db`.`airbase`.`Side` = 'Red') 
    GROUP BY `Red_Role`) AS t2
    
  )      

WHERE (`Blue_Role` = `Red_Role`);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `blue aircraft by role` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`marco`@`%` PROCEDURE `blue aircraft by role`()
BEGIN

SET @tot = 0;

CALL `total aircraft by role-side with total`('Blue', @tot);

SELECT @tot;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `red aircraft by role` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`marco`@`%` PROCEDURE `red aircraft by role`()
BEGIN

SET @tot = 0;

CALL `total aircraft by role-side with total`('Red', @tot);

SELECT @tot;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `total aircraft by airbase-role-side` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`marco`@`%` PROCEDURE `total aircraft by airbase-role-side`(IN role varchar(4), IN side varchar(4) )
BEGIN
/*blue by Airbase and quantity*/
select idAirbase, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = role and Airbase.side = side 
	group by Airbase_idAirbase;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `total aircraft by role-side` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`marco`@`%` PROCEDURE `total aircraft by role-side`( IN role varchar(4), IN side varchar(4) )
BEGIN
/*blue by Airbase and quantity*/
select sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Role_idRole = role and Airbase.side = side;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `total aircraft by role-side with total` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`marco`@`%` PROCEDURE `total aircraft by role-side with total`(IN side varchar(4), OUT tot integer)
BEGIN

/*blue by Airbase and quantity*/
select Role_idRole, sum(quantity)
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Airbase.side = side
 group by Role_idRole;    
 
 select sum(quantity) into tot
 from Assigned join Airbase on idAirbase = Airbase_idAirbase 
 where Airbase.side = side;
 
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `aircraft difference by role`
--

/*!50001 DROP VIEW IF EXISTS `aircraft difference by role`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`marco`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `aircraft difference by role` AS select `t1`.`Blue_Role` AS `Blue_Role`,(`t1`.`Blue_quantity` - `t2`.`Red_quantity`) AS `difference: blue-red` from (((select `a1`.`Role_idRole` AS `Blue_Role`,sum(`a1`.`quantity`) AS `Blue_quantity` from (`1975_gw_db`.`assigned` `a1` join `1975_gw_db`.`airbase` on((`1975_gw_db`.`airbase`.`idAirbase` = `a1`.`Airbase_idAirbase`))) where (`1975_gw_db`.`airbase`.`Side` = 'Blue') group by `Blue_Role`)) `t1` join (select `a2`.`Role_idRole` AS `Red_Role`,sum(`a2`.`quantity`) AS `Red_quantity` from (`1975_gw_db`.`assigned` `a2` join `1975_gw_db`.`airbase` on((`1975_gw_db`.`airbase`.`idAirbase` = `a2`.`Airbase_idAirbase`))) where (`1975_gw_db`.`airbase`.`Side` = 'Red') group by `Red_Role`) `t2`) where (`t1`.`Blue_Role` = `t2`.`Red_Role`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `blue_aircraft_for_role`
--

/*!50001 DROP VIEW IF EXISTS `blue_aircraft_for_role`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`marco`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `blue_aircraft_for_role` AS select `assigned`.`Role_idRole` AS `Role_idRole`,sum(`assigned`.`quantity`) AS `sum(quantity)` from (`assigned` join `airbase` on((`airbase`.`idAirbase` = `assigned`.`Airbase_idAirbase`))) where (`airbase`.`Side` = 'Blue') group by `assigned`.`Role_idRole` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `blue_red_aircraft_for_role`
--

/*!50001 DROP VIEW IF EXISTS `blue_red_aircraft_for_role`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`marco`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `blue_red_aircraft_for_role` AS select `airbase`.`Side` AS `Side`,`assigned`.`Role_idRole` AS `Role_idRole`,sum(`assigned`.`quantity`) AS `sum(quantity)` from (`assigned` join `airbase` on((`airbase`.`idAirbase` = `assigned`.`Airbase_idAirbase`))) where (`airbase`.`Side` = 'Blue') group by `assigned`.`Role_idRole` union select `airbase`.`Side` AS `Side`,`assigned`.`Role_idRole` AS `Role_idRole`,sum(`assigned`.`quantity`) AS `sum(quantity)` from (`assigned` join `airbase` on((`airbase`.`idAirbase` = `assigned`.`Airbase_idAirbase`))) where (`airbase`.`Side` = 'Red') group by `assigned`.`Role_idRole` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `red_aircraft_for_role`
--

/*!50001 DROP VIEW IF EXISTS `red_aircraft_for_role`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`marco`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `red_aircraft_for_role` AS select `assigned`.`Role_idRole` AS `Role_idRole`,sum(`assigned`.`quantity`) AS `sum(quantity)` from (`assigned` join `airbase` on((`airbase`.`idAirbase` = `assigned`.`Airbase_idAirbase`))) where (`airbase`.`Side` = 'Red') group by `assigned`.`Role_idRole` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-30 18:01:05
