-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: teamproject
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contents` (
  `contents_id` int NOT NULL,
  `content_messege` varchar(200) DEFAULT NULL,
  `Time` datetime DEFAULT NULL,
  `User_id` int DEFAULT NULL,
  `support_request_id` int DEFAULT NULL,
  PRIMARY KEY (`contents_id`),
  KEY `User_id_FK_idx` (`User_id`),
  KEY `support_request_id_idx` (`support_request_id`),
  CONSTRAINT `support_request_id` FOREIGN KEY (`support_request_id`) REFERENCES `supports` (`support_id`),
  CONSTRAINT `User_id_FK` FOREIGN KEY (`User_id`) REFERENCES `user` (`Id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` VALUES (1,'a have a problems','2023-10-04 18:27:22',3,1),(2,'can u help me?','2023-10-04 18:30:17',3,1);
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `developer`
--

DROP TABLE IF EXISTS `developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer` (
  `developer_id` int NOT NULL,
  `developer_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`developer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developer`
--

LOCK TABLES `developer` WRITE;
/*!40000 ALTER TABLE `developer` DISABLE KEYS */;
INSERT INTO `developer` VALUES (1,'developer1'),(2,'developer2'),(3,'developer3');
/*!40000 ALTER TABLE `developer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `genre_id` int NOT NULL,
  `genre_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'genre1'),(2,'genre2'),(4,'genre4'),(5,'genre5'),(6,'test_genre');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library`
--

DROP TABLE IF EXISTS `library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library` (
  `library_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `library_status` int DEFAULT NULL,
  PRIMARY KEY (`library_id`),
  KEY `libraty_product_id_FK_idx` (`product_id`),
  KEY `library_status_id_FK_idx` (`library_status`),
  KEY `library_user_id_FK_idx` (`user_id`),
  CONSTRAINT `library_product_id_FK` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `library_status_id_FK` FOREIGN KEY (`library_status`) REFERENCES `status` (`status_id`),
  CONSTRAINT `library_user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`Id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
INSERT INTO `library` VALUES (1,1,3,'1000-01-01 00:00:00',5),(2,2,3,'2023-10-04 16:13:51',6),(3,3,3,'2023-10-04 16:13:57',5);
/*!40000 ALTER TABLE `library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL,
  `product_name` varchar(70) DEFAULT NULL,
  `product_description` varchar(200) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL,
  `product_publisher` int DEFAULT NULL,
  `product_developer` int DEFAULT NULL,
  `product_status` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `publisher_id_FK_idx` (`product_publisher`),
  KEY `developer_id_FK_idx` (`product_developer`),
  KEY `product_status_id_FK_idx` (`product_status`),
  CONSTRAINT `developer_id_FK` FOREIGN KEY (`product_developer`) REFERENCES `developer` (`developer_id`),
  CONSTRAINT `product_status_id_FK` FOREIGN KEY (`product_status`) REFERENCES `status` (`status_id`),
  CONSTRAINT `publisher_id_FK` FOREIGN KEY (`product_publisher`) REFERENCES `publisher` (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'name1','description1',1234.00,1,1,3),(2,'name12','description12',12345.00,2,2,3),(3,'name13','description13',123456.00,3,3,4),(20,'товар','описание',12.00,1,1,3),(123,'string','string',2.00,1,1,5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_genre`
--

DROP TABLE IF EXISTS `product_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_genre` (
  `product_genre_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `genre_id` int DEFAULT NULL,
  PRIMARY KEY (`product_genre_id`),
  KEY `product_id_FK_idx` (`product_id`),
  KEY `genre_id_FK_idx` (`genre_id`),
  CONSTRAINT `genre_id_FK` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`),
  CONSTRAINT `product_id_FK` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_genre`
--

LOCK TABLES `product_genre` WRITE;
/*!40000 ALTER TABLE `product_genre` DISABLE KEYS */;
INSERT INTO `product_genre` VALUES (1,1,1),(2,2,2),(4,1,4);
/*!40000 ALTER TABLE `product_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `product_image_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `product_image_path` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`product_image_id`),
  KEY `product_image_id_FK_idx` (`product_id`),
  CONSTRAINT `product_image_id_FK` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (1,1,'image1.jpg'),(2,2,'image3.jpg'),(3,3,'image4.jpg'),(4,1,'image5.jpg'),(5,1,'image6.jpg'),(21,3,'йцуй'),(22,3,'qweq');
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `publisher_id` int NOT NULL,
  `publisher_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'publisher1'),(2,'publisher2'),(3,'publisher3'),(4,'qerwerwq');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `Role_Id` int NOT NULL,
  `Role_Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Role_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Клиент'),(2,'Куратор контента'),(3,'Сотрудник службы поддержки');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `status_id` int NOT NULL,
  `status_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Оффлайн'),(2,'Онлайн'),(3,'В продаже'),(4,'Не в продаже'),(5,'Куплено'),(6,'В корзине'),(7,'Новый'),(8,'Завершен'),(9,'Принято'),(10,'Отвечен');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_type`
--

DROP TABLE IF EXISTS `support_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_type` (
  `support_type_id` int NOT NULL,
  `support_type_name` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`support_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_type`
--

LOCK TABLES `support_type` WRITE;
/*!40000 ALTER TABLE `support_type` DISABLE KEYS */;
INSERT INTO `support_type` VALUES (1,'support_type1'),(2,'support_type2'),(3,'support_type3'),(4,'support_type4'),(5,'support_type5');
/*!40000 ALTER TABLE `support_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supports`
--

DROP TABLE IF EXISTS `supports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supports` (
  `support_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `support_type` int DEFAULT NULL,
  `support_status` int DEFAULT NULL,
  PRIMARY KEY (`support_id`),
  KEY `support_type_id_FK_idx` (`support_type`),
  KEY `support_status_id_FK_idx` (`support_status`),
  KEY `support_user_id_FK_idx` (`user_id`),
  CONSTRAINT `support_status_id_FK` FOREIGN KEY (`support_status`) REFERENCES `status` (`status_id`),
  CONSTRAINT `support_type_id_FK` FOREIGN KEY (`support_type`) REFERENCES `support_type` (`support_type_id`),
  CONSTRAINT `support_user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`Id_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supports`
--

LOCK TABLES `supports` WRITE;
/*!40000 ALTER TABLE `supports` DISABLE KEYS */;
INSERT INTO `supports` VALUES (1,3,1,7),(2,3,2,9),(3,3,3,10),(4,3,4,7);
/*!40000 ALTER TABLE `supports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `Id_User` int NOT NULL,
  `User_Login` varchar(20) DEFAULT NULL,
  `User_Password` varchar(20) DEFAULT NULL,
  `User_Name` varchar(50) DEFAULT NULL,
  `User_Email` varchar(50) DEFAULT NULL,
  `User_Image` varchar(50) DEFAULT NULL,
  `User_Role` int DEFAULT NULL,
  `User_Status` int DEFAULT NULL,
  PRIMARY KEY (`Id_User`),
  KEY `User_Role_Id_FK_idx` (`User_Role`),
  KEY `User_Status_id_FK_idx` (`User_Status`),
  CONSTRAINT `User_Role_Id_FK` FOREIGN KEY (`User_Role`) REFERENCES `role` (`Role_Id`),
  CONSTRAINT `User_Status_id_FK` FOREIGN KEY (`User_Status`) REFERENCES `status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'123','123','','123','123.png',1,2),(4,'1','1','','1','',1,1),(5,'12','12','','12','',1,1),(6,'11','11','','11','',1,1),(7,'333','333','','333','',1,1),(8,'444','444','','444','',1,1),(9,'555','555','','555','',1,1),(10,'666','666','','666','',1,1),(11,'4','4','','5','',1,1),(12,'1235','123','','qwe','',1,1),(13,'123x5','123','','qwew','',1,1),(14,'155','155','','12321','',1,1),(15,'5515','555','','555','',1,1),(16,'4444','4444','','4444','',1,1),(17,'1234','123','','123','',1,1),(18,'15321352','12351324','','31edasf ','',1,1),(19,'4141','string','','string','',1,1),(20,'4142','4141','','4141','',1,1),(21,'1231241','123','','123','',1,1),(22,'1231','123','','421','',1,1),(23,'8','123','','123','',1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-25 11:46:43
