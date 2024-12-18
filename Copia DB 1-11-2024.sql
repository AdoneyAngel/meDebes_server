-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: medebes-adoneyangeltj-9741.g.aivencloud.com    Database: defaultdb
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '1a314a31-38b8-11ef-85ff-32d2df1c4d1e:1-32,
bc17d661-8e2b-11ef-b59b-dedc524be214:1-814';

--
-- Table structure for table `contact_requests`
--

DROP TABLE IF EXISTS `contact_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_from` int NOT NULL,
  `user_to` int NOT NULL,
  `accepted` int DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `nickname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_contact_request_from` (`user_from`),
  KEY `FK_contact_request_to` (`user_to`),
  CONSTRAINT `FK_contact_request_from` FOREIGN KEY (`user_from`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_contact_request_to` FOREIGN KEY (`user_to`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_requests`
--

/*!40000 ALTER TABLE `contact_requests` DISABLE KEYS */;
INSERT INTO `contact_requests` VALUES (8,4,5,0,'2024-08-29 18:06:37','prueba55'),(9,5,10,1,'2024-08-29 18:17:53','Kilian'),(10,10,1,0,'2024-08-29 18:17:18','Prueba1'),(11,12,11,1,'2024-08-30 16:27:56','Adoney'),(12,11,10,1,'2024-08-30 21:39:02','Kilian'),(13,10,12,1,'2024-09-08 11:59:37','Mer');
/*!40000 ALTER TABLE `contact_requests` ENABLE KEYS */;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_from` int DEFAULT NULL,
  `user_to` int DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_contacts_from` (`user_from`),
  KEY `FK_contacts_to` (`user_to`),
  CONSTRAINT `FK_contacts_from` FOREIGN KEY (`user_from`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_contacts_to` FOREIGN KEY (`user_to`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (9,1,4,'contacto 4'),(15,1,2,'contacto2'),(17,1,3,'3er contacto'),(18,2,3,'Prueba dinero'),(19,3,2,'le debo a este'),(20,3,4,'prueba4 tambien'),(21,4,3,'pr3 me debe'),(22,4,2,'compa2'),(24,2,4,'pr4'),(25,2,1,'pr1'),(26,4,1,'pr1'),(33,5,10,'Kilian'),(34,10,5,'Prueba 5.'),(35,12,11,'Adoney'),(36,11,12,'Mercy'),(37,11,10,'Kilian'),(38,10,11,'Adoney'),(39,10,12,'Mer'),(40,12,10,'Kilian');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;

--
-- Table structure for table `create_return_requests`
--

DROP TABLE IF EXISTS `create_return_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `create_return_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `user_from` int NOT NULL,
  `user_to` int NOT NULL,
  `accepted` tinyint DEFAULT '0',
  `concept` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `money` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_create_return_from` (`user_from`),
  KEY `FK_create_return_to` (`user_to`),
  CONSTRAINT `FK_create_return_from` FOREIGN KEY (`user_from`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_create_return_to` FOREIGN KEY (`user_to`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `create_return_requests`
--

/*!40000 ALTER TABLE `create_return_requests` DISABLE KEYS */;
INSERT INTO `create_return_requests` VALUES (1,'2024-06-16 00:00:00',2,3,1,'Prueba2-3',150.00),(2,'2024-06-16 12:21:51',2,4,1,'Prueba2-4',15.00),(3,'2024-06-18 16:42:55',4,3,1,'reparacion',34.30),(4,'2024-06-18 22:29:46',5,4,-1,'prueba5-4',25.20),(5,'2024-06-19 09:20:58',2,4,1,'prueba2(2)-4',5.00),(6,'2024-06-19 11:40:29',1,2,-1,'prueba1-4',13.00),(7,'2024-06-19 18:00:00',2,1,1,'Prueba de menu devolucion',22.40),(8,'2024-06-20 10:49:53',2,1,1,'porque si',15.00),(9,'2024-08-29 18:18:56',10,5,1,'卐\n',848.99),(10,'2024-08-30 16:30:56',11,12,1,'Prueba',10.00),(11,'2024-08-30 16:33:40',11,12,-1,'comision',10.00),(12,'2024-08-31 13:59:05',11,10,-1,'prueba',111.00),(13,'2024-08-31 14:06:07',11,10,-1,'ffasa',5555.00),(14,'2024-08-31 14:07:51',10,11,1,'PRUEBA YO DEBO',3213.00),(15,'2024-09-06 11:48:27',11,12,1,'Tendedero',50.00),(16,'2024-09-08 11:55:58',11,12,1,'Mochilas',50.00),(17,'2024-09-08 12:00:01',10,12,1,'Peluquería ',50.00),(18,'2024-09-10 17:11:52',11,10,1,'Libros',150.00),(19,'2024-09-16 11:19:43',11,12,1,'Gasolina y papas',50.00),(20,'2024-10-03 12:10:51',11,12,1,'Gasolina',10.00),(21,'2024-10-09 08:39:30',11,12,1,'no se de que',50.00),(22,'2024-10-14 07:56:58',11,12,1,'Leche',50.00),(23,'2024-10-20 19:13:24',11,12,1,'Por si acaso',50.00);
/*!40000 ALTER TABLE `create_return_requests` ENABLE KEYS */;

--
-- Table structure for table `finish_return_requests`
--

DROP TABLE IF EXISTS `finish_return_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finish_return_requests` (
  `id` int NOT NULL,
  `date` datetime NOT NULL,
  `accepted` tinyint(1) DEFAULT '0',
  `user_from` int DEFAULT NULL,
  `user_to` int DEFAULT NULL,
  `pk` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pk`),
  KEY `PK_finish_return` (`id`),
  KEY `FK_finish_return_from` (`user_from`),
  KEY `FK_finish_return_to` (`user_to`),
  CONSTRAINT `FK_finish_return` FOREIGN KEY (`id`) REFERENCES `returns` (`id`),
  CONSTRAINT `FK_finish_return_from` FOREIGN KEY (`user_from`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_finish_return_to` FOREIGN KEY (`user_to`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finish_return_requests`
--

/*!40000 ALTER TABLE `finish_return_requests` DISABLE KEYS */;
INSERT INTO `finish_return_requests` VALUES (10,'2024-08-30 16:32:41',1,12,11,1),(9,'2024-08-31 14:44:38',1,10,5,2),(9,'2024-08-31 14:44:38',1,10,5,3),(9,'2024-08-31 14:44:38',1,10,5,4),(9,'2024-08-31 14:44:38',1,10,5,5),(14,'2024-08-31 14:43:58',1,11,10,6),(14,'2024-08-31 14:43:58',1,10,11,7),(14,'2024-08-31 14:43:58',1,10,11,8),(9,'2024-08-31 14:44:38',1,10,5,9),(9,'2024-08-31 14:44:38',1,10,5,10),(9,'2024-08-31 14:44:38',1,10,5,11),(9,'2024-08-31 14:44:38',1,10,5,12),(14,'2024-08-31 14:43:58',1,10,11,13),(17,'2024-09-24 06:36:05',1,10,12,14),(17,'2024-09-24 06:36:05',1,10,12,15),(15,'2024-09-24 10:44:33',1,11,12,16),(16,'2024-09-24 10:44:41',1,11,12,17),(18,'2024-09-24 13:37:50',1,11,10,18),(19,'2024-09-24 10:44:54',1,11,12,19),(22,'2024-10-24 09:35:02',1,11,12,20),(22,'2024-10-24 09:35:02',1,11,12,21),(21,'2024-10-25 08:06:29',1,11,12,22);
/*!40000 ALTER TABLE `finish_return_requests` ENABLE KEYS */;

--
-- Table structure for table `payment_history`
--

DROP TABLE IF EXISTS `payment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_return` int NOT NULL,
  `accepted` tinyint(1) DEFAULT '0',
  `date` datetime NOT NULL,
  `amount` decimal(6,2) NOT NULL,
  `user_from` int NOT NULL,
  `user_to` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_payment_history` (`id_return`),
  KEY `FK_payment_history_from` (`user_from`),
  KEY `FK_payment_history_to` (`user_to`),
  CONSTRAINT `FK_payment_history` FOREIGN KEY (`id_return`) REFERENCES `returns` (`id`),
  CONSTRAINT `FK_payment_history_from` FOREIGN KEY (`user_from`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_payment_history_to` FOREIGN KEY (`user_to`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_history`
--

/*!40000 ALTER TABLE `payment_history` DISABLE KEYS */;
INSERT INTO `payment_history` VALUES (1,1,1,'2024-06-16 00:00:00',-50.00,3,2),(2,1,1,'2024-06-20 10:01:42',-20.00,2,3),(3,1,0,'2024-06-18 13:43:42',5.00,3,2),(4,5,0,'2024-06-19 09:40:11',-30.00,4,2),(5,5,1,'2024-06-20 14:27:20',5.00,2,4),(6,5,1,'2024-06-20 14:27:56',-2.00,2,4),(7,9,1,'2024-08-29 18:37:28',-400.00,5,10),(8,9,1,'2024-08-29 18:48:06',-100.00,10,5),(9,10,1,'2024-08-30 16:32:04',-5.00,12,11);
/*!40000 ALTER TABLE `payment_history` ENABLE KEYS */;

--
-- Table structure for table `returns`
--

DROP TABLE IF EXISTS `returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `finished` tinyint(1) DEFAULT '0',
  `user_from` int NOT NULL,
  `user_to` int NOT NULL,
  `concept` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `money` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_return_from` (`user_from`),
  KEY `FK_return_to` (`user_to`),
  CONSTRAINT `FK_return_from` FOREIGN KEY (`user_from`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_return_to` FOREIGN KEY (`user_to`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_returns_id` FOREIGN KEY (`id`) REFERENCES `create_return_requests` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returns`
--

/*!40000 ALTER TABLE `returns` DISABLE KEYS */;
INSERT INTO `returns` VALUES (1,'2024-06-18 16:00:09',0,2,3,'Prueba2-3',150.00),(2,'2024-06-19 09:09:28',1,2,4,'Prueba2-4',15.00),(5,'2024-06-19 09:28:57',1,2,4,'prueba2(2)-4',5.00),(7,'2024-06-19 18:16:08',0,2,1,'Prueba de menu devolucion',22.40),(8,'2024-06-20 10:50:19',0,2,1,'porque si',15.00),(9,'2024-08-29 18:21:01',1,10,5,'卐\n',848.99),(10,'2024-08-30 16:31:34',1,11,12,'Prueba',10.00),(14,'2024-08-31 14:10:24',1,10,11,'PRUEBA YO DEBO',3213.00),(15,'2024-09-06 11:49:10',1,11,12,'Tendedero',50.00),(16,'2024-09-08 11:57:06',1,11,12,'Mochilas',50.00),(17,'2024-09-08 12:00:07',1,10,12,'Peluquería ',50.00),(18,'2024-09-10 17:13:44',1,11,10,'Libros',150.00),(19,'2024-09-16 11:20:09',1,11,12,'Gasolina y papas',50.00),(20,'2024-10-03 12:11:47',0,11,12,'Gasolina',10.00),(21,'2024-10-09 08:42:24',1,11,12,'no se de que',50.00),(22,'2024-10-14 08:00:00',1,11,12,'Leche',50.00),(23,'2024-10-20 19:17:51',0,11,12,'Por si acaso',50.00);
/*!40000 ALTER TABLE `returns` ENABLE KEYS */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mail` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'prueba1','prueba1@gmail.com','$2b$10$cQeT3m/hehrBCLhm4LzZfeJ4jSONxILp/lDwRZLgRpjzhoGFK14N6'),(2,'prueba2','prueba2@gmail.com','$2b$10$cQeT3m/hehrBCLhm4LzZfeJ4jSONxILp/lDwRZLgRpjzhoGFK14N6'),(3,'prueba3','prueba3@gmail.com','$2b$10$cQeT3m/hehrBCLhm4LzZfeJ4jSONxILp/lDwRZLgRpjzhoGFK14N6'),(4,'prueba4','prueba4@gmail.com','$2b$10$cQeT3m/hehrBCLhm4LzZfeJ4jSONxILp/lDwRZLgRpjzhoGFK14N6'),(5,'prueba5','prueba5@gmail.com','$2b$10$cQeT3m/hehrBCLhm4LzZfeJ4jSONxILp/lDwRZLgRpjzhoGFK14N6'),(6,'pruebaInsert','pruebaInsert@gmail.com','$2b$10$cQeT3m/hehrBCLhm4LzZfeJ4jSONxILp/lDwRZLgRpjzhoGFK14N6'),(7,'hash','hash@gmail.com','$2b$10$cQeT3m/hehrBCLhm4LzZfeJ4jSONxILp/lDwRZLgRpjzhoGFK14N6'),(8,'prueba0','prueba0@gmail.com','$2b$10$Jm2vnTGtBSSqCXrA8fkdxeb.ZbwdKHCErljdFcRCbvDOkedFE0e7i'),(9,'prueba11','prueba11@gmail.com','$2b$10$xtXkTq7z//2WMvVMUFvWeuySBHSI0bAooY/B/gR.Ooaw/FOlATIDu'),(10,'KilianTS','Kilianjosets@gmail.com','$2b$10$lyDkdEBOMfPOqJDaWFA2belVb6T0envvzOXadAI.6OZHaJj/5PeyW'),(11,'Adoney','Adoneyangeltj@gmail.com','$2b$10$jncjhew8U.KC5/OfaAcoW.wlRVXvvz6RG1VMNA4EKaEc4tduLG/hS'),(12,'Mercy','Mercedessantanaleon@gmail.com','$2b$10$uqwk4pR3kTAMFJers8IxFO6A7qozYuvhBk2bH0B3U/5s1qB1uZyT.');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

--
-- Dumping routines for database 'defaultdb'
--
/*!50003 DROP FUNCTION IF EXISTS `sp_medebes_contacts_aggregates` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` FUNCTION `sp_medebes_contacts_aggregates`(v_user_a VARCHAR(255) , v_user_b VARCHAR(255)) RETURNS tinyint(1)
BEGIN
	
    DECLARE a_b INT DEFAULT 0;
    DECLARE b_a INT DEFAULT 0;
    
    SELECT id INTO a_b FROM contacts WHERE user_from = (
		SELECT id FROM users WHERE mail = v_user_a) 
		AND user_to = (
        SELECT id FROM users WHERE mail = v_user_b);
        
	SELECT id INTO b_a FROM contacts WHERE user_from = (
		SELECT id FROM users WHERE mail = v_user_b)
        AND user_to = (
        SELECT id FROM users WHERE mail = v_user_a);
        
	IF (a_b > 0 AND b_a > 0) 
    THEN
		RETURN 1;
        
	ELSE
		RETURN 0;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sp_medebes_contacts_exist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` FUNCTION `sp_medebes_contacts_exist`(v_user_from INT, v_user_to INT) RETURNS tinyint(1)
BEGIN

	DECLARE contactId INT DEFAULT -1;

	SELECT contacts.id INTO contactId FROM users, contacts contacts WHERE
    users.id = v_user_to 
    AND contacts.user_from = v_user_from 
    AND contacts.user_to = users.id;
    
    IF (contactId = -1) THEN
		RETURN FALSE;
	ELSE 
		RETURN TRUE;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sp_medebes_contacts_has_added` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` FUNCTION `sp_medebes_contacts_has_added`(v_user_a VARCHAR(255) , v_user_b VARCHAR(255)) RETURNS tinyint(1)
BEGIN
	
    DECLARE a_b INT DEFAULT 0;
    
    SELECT id INTO a_b FROM contacts WHERE user_from = (
		SELECT id FROM users WHERE mail = v_user_a) 
		AND user_to = (
        SELECT id FROM users WHERE mail = v_user_b);
        
	IF (a_b > 0) 
    THEN
		RETURN 1;
        
	ELSE
		RETURN 0;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sp_medebes_returns_select_total_byId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` FUNCTION `sp_medebes_returns_select_total_byId`(v_id INT) RETURNS decimal(7,2)
BEGIN

	DECLARE totalMoney DECIMAL(7,2) DEFAULT 0;
    DECLARE totalHistory DECIMAL(7,2) DEFAULT 0;
    
    SELECT SUM(money) INTO totalMoney FROM returns WHERE id = v_id;
    
	SELECT SUM(amount) INTO totalHistory FROM payment_history WHERE id_return = v_id AND accepted = 1;
    
    IF (totalHistory)THEN
		RETURN (totalMoney + totalHistory); 
        
        ELSE 
			RETURN totalMoney;
        
    END IF;

RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sp_medebes_users_haveNotifications` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` FUNCTION `sp_medebes_users_haveNotifications`(v_id INT) RETURNS tinyint(1)
BEGIN

	DECLARE haveCreationRequest INT DEFAULT 0;
    DECLARE haveHistoryRequest INT DEFAULT 0;
    DECLARE haveFinishRequest INT DEFAULT 0;
    DECLARE haveContactRequest INT DEFAULT 0;
    
    SELECT SUM(id) INTO haveContactRequest FROM contact_requests WHERE user_to = v_id AND accepted = 0;
    
    SELECT SUM(id) INTO haveCreationRequest FROM create_return_requests WHERE user_to = v_id AND accepted = 0;
    
    SELECT SUM(id) INTO haveHistoryRequest FROM payment_history WHERE 
    id_return IN (
					SELECT id FROM returns WHERE user_to = v_id AND finished = 0 OR user_from = v_id AND finished = 0
				)
		AND accepted = 0
        AND user_to = v_id;
        
    SELECT SUM(id) INTO haveFinishRequest FROM finish_return_requests WHERE id IN (
					SELECT id FROM returns WHERE user_to = v_id AND finished = 0 OR user_from = v_id AND finished = 0
				)
		AND accepted = 0
        AND user_to = v_id;
        
	IF (haveCreationRequest > 0 OR haveHistoryRequest > 0 OR haveFinishRequest > 0 OR haveContactRequest > 0)THEN
		RETURN TRUE;
        
	ELSE 
		RETURN FALSE;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sp_medebes_users_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` FUNCTION `sp_medebes_users_login`(v_mail VARCHAR(255), v_password VARCHAR(255)) RETURNS tinyint(1)
BEGIN
	DECLARE idFound INT DEFAULT -1;
    
    SELECT id INTO idFound FROM users WHERE mail = v_mail AND password = v_password;
    
    IF (NOT idFound = -1) THEN
		RETURN TRUE;
    ELSE
		RETURN FALSE;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `sp_medebes_users_select_id_mail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` FUNCTION `sp_medebes_users_select_id_mail`(v_mail VARCHAR(255)) RETURNS int
BEGIN

	DECLARE idFound INT DEFAULT -1;
    
    SELECT id INTO idFound FROM users WHERE mail = v_mail;
    
    RETURN idFound;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_contacts_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_contacts_delete`(IN v_user_from INT, IN v_user_to INT)
BEGIN

	DELETE FROM contacts WHERE user_from = v_user_from AND user_to = v_user_to;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_contacts_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_contacts_insert`(IN v_user_from INT, IN v_user_to INT, IN v_nickname VARCHAR(255) )
BEGIN

	DECLARE userFromExist INT DEFAULT -1;
    DECLARE userToExist INT DEFAULT -1;
    DECLARE contactExist INT DEFAULT -1;
    
    IF (NOT v_user_from = v_user_to)THEN
    
		SELECT id INTO userFromExist FROM users WHERE id = v_user_from;
		SELECT id INTO userToExist FROM users WHERE id = v_user_to;
        
        SELECT sp_medebes_contacts_exist(v_user_from, v_user_to) INTO contactExist;
		
		IF (NOT userFromExist = -1 AND NOT userToExist = -1 AND NOT contactExist)THEN
			INSERT INTO contacts (user_from, user_to, nickname) VALUES (v_user_from, v_user_to, v_nickname);
		END IF; 
        
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_contacts_rename` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_contacts_rename`(IN v_user_from INT, IN v_user_to INT, IN v_nickname VARCHAR(255))
BEGIN
	
    UPDATE contacts SET nickname = v_nickname WHERE user_from = v_user_from AND user_to = v_user_to;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_contacts_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_contacts_select`()
BEGIN

	SELECT * FROM contacts;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_contacts_select_user_from` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_contacts_select_user_from`(IN v_user_from INT)
BEGIN

	SELECT * FROM contacts WHERE user_from = v_user_from;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_contacts_select_user_from_profiles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_contacts_select_user_from_profiles`(IN v_user_from INT)
BEGIN

	SELECT users.id, users.name, users.mail, contacts.nickname FROM contacts, users WHERE contacts.user_from = v_user_from AND users.id = contacts.user_to;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_contacts_select_user_to_profile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_contacts_select_user_to_profile`(IN v_user_from INT, IN v_user_to INT)
BEGIN

	SELECT users.id, users.name, users.mail, contacts.nickname FROM users, contacts contacts WHERE
    users.id = v_user_to 
    AND contacts.user_from = v_user_from 
    AND contacts.user_to = users.id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_contact_requests_accept` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_contact_requests_accept`(v_id INT, v_nickname VARCHAR(255))
BEGIN

	DECLARE v_user_from INT;
    DECLARE v_user_to INT;
    DECLARE v_user_to_nickname VARCHAR(255);
	
    UPDATE contact_requests SET accepted = 1, date = NOW() WHERE id = v_id;
    
    SELECT user_from, user_to, nickname INTO v_user_from, v_user_to, v_user_to_nickname FROM contact_requests WHERE id = v_id;
    
    CALL sp_medebes_contacts_insert(v_user_from, v_user_to, v_user_to_nickname);
    CALL sp_medebes_contacts_insert(v_user_to, v_user_from, v_nickname);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_contact_requests_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_contact_requests_insert`(v_user_from INT, v_user_to INT, v_nickname VARCHAR(255))
BEGIN
	
	INSERT INTO contact_requests(user_from, user_to, date, nickname) VALUES (v_user_from, v_user_to, NOW(), v_nickname);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_contact_requests_reject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_contact_requests_reject`(v_id INT)
BEGIN
	
    UPDATE contact_requests SET accepted = -1, date = NOW() WHERE id = v_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_contact_requests_select_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_contact_requests_select_user`(v_user_id INT)
BEGIN

	SELECT contact_requests.*, users.name, users.mail FROM contact_requests, users WHERE 
    contact_requests.user_from = v_user_id AND users.id = user_to OR contact_requests.user_to = v_user_id  AND users.id = user_from;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_contact_requests_select_user_to` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_contact_requests_select_user_to`(v_user_to INT)
BEGIN

	SELECT * FROM contact_requests WHERE user_to = v_user_to;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_contact_requests_select_waiting_user_to` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_contact_requests_select_waiting_user_to`(v_user_to INT)
BEGIN

	SELECT contact_requests.*, users.mail, users.name FROM contact_requests, users WHERE user_to = v_user_to AND accepted = 0 AND users.id = contact_requests.user_from;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_create_return_requests_accept` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_create_return_requests_accept`(IN v_id INT)
BEGIN

	UPDATE create_return_requests SET accepted = 1 WHERE id = v_id;
    CALL sp_medebes_returns_insert(v_id);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_create_return_requests_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_create_return_requests_insert`(IN v_user_from INT, IN v_user_to INT, IN v_money DECIMAL(7,2), IN v_concept VARCHAR(255))
BEGIN

	INSERT INTO create_return_requests (user_from, user_to, money, concept, date) VALUES (v_user_from, v_user_to, v_money, v_concept, NOW());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_create_return_requests_reject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_create_return_requests_reject`(IN v_id INT)
BEGIN

	UPDATE create_return_requests SET accepted = -1 WHERE id = v_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_create_return_requests_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_create_return_requests_select`()
BEGIN

	SELECT * FROM create_return_requests;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_create_return_requests_select_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_create_return_requests_select_user`(v_user_id INT)
BEGIN

	SELECT create_return_requests.*, users.name, users.mail FROM create_return_requests, users WHERE 
    create_return_requests.user_from = v_user_id AND users.id = user_to OR create_return_requests.user_to = v_user_id AND users.id = user_from;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_create_return_request_select_waiting_user_from` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_create_return_request_select_waiting_user_from`(IN v_id INT)
BEGIN

	SELECT * FROM create_return_requests WHERE user_from = v_id AND accepted = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_create_return_request_select_waiting_user_to` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_create_return_request_select_waiting_user_to`(IN v_id INT)
BEGIN

	SELECT create_return_requests.*, contacts.nickname FROM create_return_requests, contacts WHERE
    create_return_requests.user_to = v_id AND create_return_requests.accepted = 0
    AND contacts.user_from = v_id
    AND contacts.user_to = create_return_requests.user_from;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_finish_return_requests_accept` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_finish_return_requests_accept`(IN v_id INT)
BEGIN
	
UPDATE finish_return_requests SET accepted = 1, date = NOW() WHERE id = v_id;
UPDATE returns SET finished = 1 WHERE id = v_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_finish_return_requests_reject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_finish_return_requests_reject`(IN v_id INT)
BEGIN
	
UPDATE finish_return_requests SET accepted = -1, date = NOW() WHERE id = v_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_finish_return_requests_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_finish_return_requests_select`()
BEGIN

	SELECT * FROM finish_return_requests;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_finish_return_requests_select_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_finish_return_requests_select_user`(v_user_id INT)
BEGIN

	SELECT finish_return_requests.*, users.name, users.mail, returns.concept FROM finish_return_requests, users, returns WHERE 
    finish_return_requests.user_from = v_user_id AND users.id = finish_return_requests.user_to AND returns.id = finish_return_requests.id
    OR finish_return_requests.user_to = v_user_id AND users.id = finish_return_requests.user_from AND returns.id = finish_return_requests.id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_finish_return_request_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_finish_return_request_insert`(IN v_id_return INT, IN v_user_from INT)
BEGIN
	
	DECLARE return_user_from INT DEFAULT 0;
	DECLARE return_user_to INT DEFAULT 0;
    
    DECLARE v_user_to INT DEFAULT 0;
    
    SELECT user_from, user_to INTO return_user_from, return_user_to FROM returns WHERE id=v_id_return;
    
    IF (return_user_from = v_user_from) THEN
		SET v_user_to = return_user_to;
	ELSE 
		SET v_user_to = return_user_from;
    END IF;
    
	INSERT INTO finish_return_requests (id, user_from, user_to, date, accepted) VALUES (v_id_return, v_user_from, v_user_to, NOW(), 0);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_finish_return_request_select_waiting_user_from` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_finish_return_request_select_waiting_user_from`(IN v_id INT)
BEGIN

	SELECT * FROM finish_return_requests WHERE user_from = v_id AND accepted = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_finish_return_request_select_waiting_user_to` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_finish_return_request_select_waiting_user_to`(IN v_id INT)
BEGIN

	SELECT finish_return_requests.*, contacts.nickname, returns.concept FROM finish_return_requests, contacts, returns WHERE
    finish_return_requests.user_to = v_id 
    AND finish_return_requests.accepted = 0
    AND contacts.user_from = v_id
    AND contacts.user_to = finish_return_requests.user_from
    AND returns.id = finish_return_requests.id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_payment_history_accept` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_payment_history_accept`(IN v_id_payment INT)
BEGIN

	UPDATE payment_history SET accepted = 1, date = NOW() WHERE id = v_id_payment;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_payment_history_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_payment_history_insert`(IN v_id_return INT, IN v_user_from INT, IN v_amount DECIMAL(7,2))
BEGIN

	DECLARE return_user_from INT DEFAULT 0;
	DECLARE return_user_to INT DEFAULT 0;
    
    DECLARE v_user_to INT DEFAULT 0;
    
    SELECT user_from, user_to INTO return_user_from, return_user_to FROM returns WHERE id=v_id_return;
    
    IF (return_user_from = v_user_from) THEN
		SET v_user_to = return_user_to;
	ELSE 
		SET v_user_to = return_user_from;
    END IF;

	INSERT INTO payment_history (id_return, user_from, user_to, amount, date) VALUES (v_id_return, v_user_from, v_user_to, v_amount, NOW());

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_payment_history_reject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_payment_history_reject`(IN v_id_payment INT)
BEGIN

	UPDATE payment_history SET accepted = -1, date = NOW() WHERE id = v_id_payment;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_payment_history_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_payment_history_select`()
BEGIN

	SELECT * FROM payment_history;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_payment_history_select_id_return` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_payment_history_select_id_return`(IN v_id_return INT)
BEGIN

	SELECT * FROM payment_history WHERE id_return = v_id_return;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_payment_history_select_return` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_payment_history_select_return`(IN v_id INT)
BEGIN

	SELECT * FROM payment_history WHERE id_return = v_id AND accepted = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_payment_history_select_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_payment_history_select_user`(v_user_id INT)
BEGIN

	SELECT payment_history.*, users.name, users.mail, returns.concept FROM payment_history, users, returns WHERE 
    payment_history.user_from = v_user_id AND users.id = payment_history.user_to AND returns.id = payment_history.id_return
    OR payment_history.user_to = v_user_id AND users.id = payment_history.user_from AND returns.id = payment_history.id_return;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_payment_history_select_waiting_user_to` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_payment_history_select_waiting_user_to`(IN v_user_id INT)
BEGIN

	SELECT payment_history.*, contacts.nickname, returns.concept FROM payment_history, contacts, returns WHERE 
    payment_history.user_to = v_user_id 
    AND payment_history.accepted = 0
    AND contacts.user_to = v_user_id
    AND contacts.user_from = payment_history.user_from
    AND returns.id = payment_history.id_return;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_returns_getTotalReturn_from` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_returns_getTotalReturn_from`(IN v_id INT)
BEGIN
	
	DECLARE totalCost DECIMAL(7,2) DEFAULT 0;
    DECLARE totalHistory DECIMAL(7,2) DEFAULT 0;
    
    SELECT SUM(money) INTO totalCost FROM returns WHERE user_from = v_id AND finished = 0;
    
    SELECT SUM(amount) INTO totalHistory FROM payment_history WHERE 
		accepted = 1
		AND id_return IN (
			SELECT id FROM returns WHERE user_from = v_id AND finished = 0
        );
        
	IF (totalHistory)THEN
		SELECT (totalCost + totalHistory) AS total;
        
        ELSE 
			SELECT totalCost AS total;
    END IF;
        
	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_returns_getTotalReturn_to` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_returns_getTotalReturn_to`(IN v_id INT)
BEGIN
	
	DECLARE totalCost DECIMAL(7,2) DEFAULT 0;
    DECLARE totalHistory DECIMAL(7,2) DEFAULT 0;
    
    SELECT SUM(money) INTO totalCost FROM returns WHERE user_to = v_id AND finished = 0;
    
    SELECT SUM(amount) INTO totalHistory FROM payment_history WHERE 
		accepted = 1
		AND id_return IN (
			SELECT id FROM returns WHERE user_to = v_id AND finished = 0
        );
        
	IF (totalHistory)THEN
		SELECT (totalCost + totalHistory) AS total;
        
        ELSE 
			SELECT totalCost AS total;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_returns_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_returns_insert`(IN v_id INT)
BEGIN

	DECLARE userFrom INT DEFAULT -1;
	DECLARE userTo INT DEFAULT -1;
	DECLARE conceptFound VARCHAR(255) DEFAULT "";
	DECLARE moneyFound DECIMAL(7,2) DEFAULT -1;
    
    SELECT user_from, user_to, concept, money INTO userFrom, userTo, conceptFound, moneyFound FROM create_return_requests WHERE id = v_id;

	INSERT INTO returns (id, user_from, user_to, money, concept, date) VALUES (
		v_id,
        userFrom,
        userTo,
        moneyFound,
        conceptFound,
        NOW()
    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_returns_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_returns_select`()
BEGIN

	SELECT * FROM returns;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_returns_select_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_returns_select_data`(IN v_id INT)
BEGIN

	SELECT returns.*, sp_medebes_returns_select_total_byId(v_id) AS total FROM returns WHERE id = v_id; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_returns_select_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_returns_select_id`(IN v_id INT)
BEGIN

	SELECT * FROM returns WHERE id = v_id; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_returns_select_returned_user_from` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_returns_select_returned_user_from`(IN v_id INT)
BEGIN

	SELECT * FROM returns WHERE user_from = v_id AND finished = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_returns_select_returned_user_to` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_returns_select_returned_user_to`(IN v_id INT)
BEGIN

	SELECT * FROM returns WHERE user_to = v_id AND finished = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_returns_select_returnsData_from` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_returns_select_returnsData_from`(IN v_id INT)
BEGIN
	
	SELECT returns.id, date, returns.user_from, returns.user_to, concept, money, sp_medebes_returns_select_total_byId(returns.id) AS total, contacts.nickname, users.name
		FROM returns, contacts, users
        WHERE 
			returns.user_from = v_id
			AND contacts.user_from = v_id
            AND users.id = returns.user_to
            and contacts.user_to = returns.user_to
            AND finished = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_returns_select_returnsData_to` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_returns_select_returnsData_to`(IN v_id INT)
BEGIN
	
	SELECT returns.id, date, returns.user_from, returns.user_to, concept, money, sp_medebes_returns_select_total_byId(returns.id) AS total, contacts.nickname, users.name
		FROM returns, contacts, users
        WHERE 
			returns.user_to = v_id
			AND contacts.user_from = v_id
			AND contacts.user_to = returns.user_from
			AND users.id = returns.user_from
			AND finished = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_returns_select_unreturned_user_from` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_returns_select_unreturned_user_from`(IN v_id INT)
BEGIN

	SELECT * FROM returns WHERE user_from = v_id AND finished = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_returns_select_unreturned_user_to` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_returns_select_unreturned_user_to`(IN v_id INT)
BEGIN

	SELECT * FROM returns WHERE user_to = v_id AND finished = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_returns_select_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_returns_select_user`(v_user_id INT)
BEGIN

	SELECT returns.*, users.name, users.mail FROM returns, users WHERE 
    user_from = v_user_id AND users.id = user_to 
    OR user_to = v_user_id AND users.id = user_from;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_returns_select_user_from` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_returns_select_user_from`(IN v_id INT)
BEGIN

	SELECT * FROM returns WHERE user_from = v_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_returns_select_user_to` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_returns_select_user_to`(IN v_id INT)
BEGIN

	SELECT * FROM returns WHERE user_to = v_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_users_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_users_insert`(IN v_name VARCHAR(255), IN v_mail VARCHAR(255), IN v_password VARCHAR (255))
BEGIN
	
    DECLARE nameExist INT DEFAULT -1;
    DECLARE mailExist INT DEFAULT -1;
    
    SELECT id INTO nameExist FROM users WHERE name = v_name;
    SELECT id INTO mailExist FROM users WHERE mail = v_mail;
	
    if (nameExist = -1 AND mailExist = -1) THEN
		INSERT INTO users (name, mail, password) VALUES (v_name, v_mail, v_password);
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_users_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_users_select`()
BEGIN

	SELECT * FROM users;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_users_select_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_users_select_id`(IN v_id VARCHAR(255))
BEGIN

	SELECT * FROM users WHERE id = v_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_users_select_mail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_users_select_mail`(IN v_mail VARCHAR(255))
BEGIN

	SELECT * FROM users WHERE mail = v_mail;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_users_select_mail_or_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_users_select_mail_or_name`(IN v_info VARCHAR(255))
BEGIN

	SELECT * FROM users WHERE mail = v_info OR name = v_info;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medebes_users_select_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`avnadmin`@`%` PROCEDURE `sp_medebes_users_select_name`(IN v_name VARCHAR(255))
BEGIN

	SELECT * FROM users WHERE name = v_name;

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

-- Dump completed on 2024-11-01 11:17:20
