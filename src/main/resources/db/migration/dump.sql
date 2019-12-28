-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: polling_app
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `polling_app`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `polling_app` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `polling_app`;

--
-- Table structure for table `choices`
--

DROP TABLE IF EXISTS `choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `choices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text` varchar(40) NOT NULL,
  `poll_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_choices_poll_id` (`poll_id`),
  CONSTRAINT `fk_choices_poll_id` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choices`
--

LOCK TABLES `choices` WRITE;
/*!40000 ALTER TABLE `choices` DISABLE KEYS */;
INSERT INTO `choices` VALUES (1,'choice text',1),(2,'blue',2),(3,'black',2);
/*!40000 ALTER TABLE `choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls`
--

DROP TABLE IF EXISTS `polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `polls` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `question` varchar(140) NOT NULL,
  `expiration_date_time` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls`
--

LOCK TABLES `polls` WRITE;
/*!40000 ALTER TABLE `polls` DISABLE KEYS */;
INSERT INTO `polls` VALUES (1,'did it run?','2019-10-16 00:00:00','2019-10-16 20:49:59','2019-10-16 20:49:59',1,1),(2,'favorite color','2019-10-20 21:49:18','2019-10-21 01:49:18','2019-10-21 01:49:18',2,2);
/*!40000 ALTER TABLE `polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_roles_name` (`name`),
  UNIQUE KEY `UK_nb4h0p6txrmfc0xbrd1kglp9t` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (5,'ROLE_ADMIN'),(4,'ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_user_roles_role_id` (`role_id`),
  CONSTRAINT `fk_user_roles_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `fk_user_roles_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (2,4),(4,4),(5,4),(1,5);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `username` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_users_username` (`username`),
  UNIQUE KEY `uk_users_email` (`email`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Sasi','sasiYoyo','sasibro@yoyo.com','$2a$10$Eh6E1LFeAX5Yw2Nlq285C./FE21Z7S4d4KIkUbVy/8urkTAjAQXPK','2019-10-17 08:07:19','2019-10-17 08:07:19'),(2,'karthik reddy kurella','kk109075','kkurella89@gmail.com','$2a$10$rX8sKLusX89J/l.FDlSTSeQ038SxTQSd3aqvPxQG5dwqRFsJAvwyi','2019-10-21 01:33:28','2019-10-21 01:33:28'),(3,'samya','kk521','kk@mail.com','kk521','2019-10-22 00:04:18','2019-10-22 00:04:18'),(4,'samya','sam','sam@mail.com','$2a$10$OxVuaRDlOfnlnsdeUgaRB.zyDXYlz50Y1KUHIx82IqKPwGvAVmNxG','2019-10-22 04:24:11','2019-10-22 04:24:11'),(5,'sudheer','sudheer123','selluri@ln.com','$2a$10$TbhjnqYw7z7czKnKmldbQua/4FGXvh2SX3xKFEHOxGO53r7VVu9xi','2019-10-23 18:56:23','2019-10-23 18:56:23');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `votes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `poll_id` bigint(20) NOT NULL,
  `choice_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK8um9h2wxsdjrgx3rjjwvny676` (`poll_id`,`user_id`),
  KEY `fk_votes_user_id` (`user_id`),
  KEY `fk_votes_poll_id` (`poll_id`),
  KEY `fk_votes_choice_id` (`choice_id`),
  CONSTRAINT `fk_votes_choice_id` FOREIGN KEY (`choice_id`) REFERENCES `choices` (`id`),
  CONSTRAINT `fk_votes_poll_id` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`),
  CONSTRAINT `fk_votes_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
INSERT INTO `votes` VALUES (1,1,1,1,'2019-10-21 01:23:39','2019-10-21 01:23:39');
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-27 22:12:48
