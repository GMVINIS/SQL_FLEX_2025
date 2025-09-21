CREATE DATABASE  IF NOT EXISTS `gv_indumentaria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gv_indumentaria`;
-- MySQL dump 10.13  Distrib 8.0.42, for macos15 (arm64)
--
-- Host: localhost    Database: gv_indumentaria
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Temporary view structure for view `bajo_stock`
--

DROP TABLE IF EXISTS `bajo_stock`;
/*!50001 DROP VIEW IF EXISTS `bajo_stock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bajo_stock` AS SELECT 
 1 AS `id_producto`,
 1 AS `nombre_producto`,
 1 AS `descripcion_talle`,
 1 AS `descripcion_color`,
 1 AS `stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(20) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'30456789','Lucía','Pérez','Argentina','lucia.perez@email.com','1995-06-21'),(2,'28999888','Juan','Gómez','Argentina','juan.gomez@email.com','1990-03-12'),(3,'41555111','María','Fernández','Uruguaya','maria.fernandez@email.com','1988-11-02'),(4,'33888999','Diego','Lopez','Chilena','diego.lopez@email.com','1993-09-05');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_after_cliente_new` AFTER INSERT ON `cliente` FOR EACH ROW BEGIN
    INSERT INTO log_cliente (usuario, fecha, hora, accion)
    VALUES (CURRENT_USER(), CURDATE(), CURTIME(), CONCAT('Se ha ingresado un cliente nuevo. ID: ', NEW.id_cliente)); #Se inserta el usuario actual, la fecha y la hora actual, junto con una descripción de la acción que se realizó.
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_after_cliente_delete` AFTER DELETE ON `cliente` FOR EACH ROW BEGIN
    INSERT INTO log_cliente (usuario, fecha, hora, accion)
    VALUES (CURRENT_USER(), CURDATE(), CURTIME(), CONCAT('Se ha eliminado un cliente. ID: ', OLD.id_cliente))
    ; #Se inserta el usuario actual, la fecha y la hora actual, junto con una descripción de la acción que se realizó.
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `id_color` int NOT NULL AUTO_INCREMENT,
  `descripcion_color` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_color`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'Negro'),(2,'Blanco'),(3,'Rojo'),(4,'Azul'),(5,'Verde');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costo_producto`
--

DROP TABLE IF EXISTS `costo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costo_producto` (
  `id_costo` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `moneda` varchar(10) DEFAULT 'ARS',
  PRIMARY KEY (`id_costo`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `costo_producto_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costo_producto`
--

LOCK TABLES `costo_producto` WRITE;
/*!40000 ALTER TABLE `costo_producto` DISABLE KEYS */;
INSERT INTO `costo_producto` VALUES (1,1,9000.00,'ARS'),(2,2,11250.00,'ARS'),(3,3,12000.00,'ARS'),(4,4,10000.00,'ARS'),(5,5,7000.00,'ARS'),(6,6,29250.00,'ARS'),(7,7,15000.00,'ARS'),(8,8,8100.00,'ARS');
/*!40000 ALTER TABLE `costo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `id_talle` int NOT NULL,
  `id_color` int NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_talle` (`id_talle`),
  KEY `id_color` (`id_color`),
  KEY `id_venta` (`id_venta`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_talle`) REFERENCES `talle` (`id_talle`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_color`) REFERENCES `color` (`id_color`),
  CONSTRAINT `detalle_venta_ibfk_3` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`),
  CONSTRAINT `detalle_venta_ibfk_4` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,1,1,2,1,1),(2,1,2,1,3,4),(3,1,5,3,2,5),(4,2,3,1,4,2),(5,2,6,2,5,3),(6,3,4,4,1,1),(7,3,7,2,2,5),(8,4,8,1,3,2),(9,4,2,5,4,4),(10,5,1,2,5,5),(11,5,5,3,1,2),(12,6,6,1,3,3),(13,6,3,4,2,1),(14,7,4,2,5,4),(15,7,7,1,4,2),(16,8,8,3,1,5),(17,8,2,2,3,1),(18,9,1,5,2,4),(19,9,6,1,4,3),(20,10,3,2,5,5),(21,10,5,3,1,2),(22,11,7,2,3,3),(23,11,8,1,2,4),(24,12,4,4,5,1),(25,12,1,3,4,2),(26,13,6,2,2,5),(27,13,2,1,3,1),(28,14,5,3,1,4),(29,14,7,2,2,3),(30,15,8,4,5,2),(31,15,3,1,4,5);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_before_detalle_venta_insert` BEFORE INSERT ON `detalle_venta` FOR EACH ROW BEGIN
    DECLARE v_stock INT;

    -- Consultar el stock actual del producto.
    SELECT stock INTO v_stock
    FROM stock
    WHERE id_producto = NEW.id_producto AND Id_talle=NEW.id_talle AND id_color=NEW.id_color;

    -- Verificar si hay suficiente stock.
    IF v_stock < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Stock insuficiente para realizar la venta';
    ELSE
        -- Opcional: descontar el stock automáticamente.
        UPDATE stock
        SET stock = stock - NEW.cantidad
        WHERE id_producto = NEW.id_producto AND Id_talle=NEW.id_talle AND id_color=NEW.id_color;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `detalle_venta_check`
--

DROP TABLE IF EXISTS `detalle_venta_check`;
/*!50001 DROP VIEW IF EXISTS `detalle_venta_check`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `detalle_venta_check` AS SELECT 
 1 AS `id_venta`,
 1 AS `id_cliente`,
 1 AS `fecha`,
 1 AS `id_detalle`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `log_cliente`
--

DROP TABLE IF EXISTS `log_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(150) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `accion` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_cliente`
--

LOCK TABLES `log_cliente` WRITE;
/*!40000 ALTER TABLE `log_cliente` DISABLE KEYS */;
INSERT INTO `log_cliente` VALUES (1,'root@localhost','2025-09-21','17:47:02','Se ha ingresado un cliente nuevo. ID: 6'),(2,'root@localhost','2025-09-21','17:47:02','Se ha eliminado un cliente. ID: 6');
/*!40000 ALTER TABLE `log_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precio_producto`
--

DROP TABLE IF EXISTS `precio_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `precio_producto` (
  `id_precio` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `moneda` varchar(10) DEFAULT 'ARS',
  PRIMARY KEY (`id_precio`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `precio_producto_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precio_producto`
--

LOCK TABLES `precio_producto` WRITE;
/*!40000 ALTER TABLE `precio_producto` DISABLE KEYS */;
INSERT INTO `precio_producto` VALUES (1,1,20000.00,'ARS'),(2,2,25000.00,'ARS'),(3,3,40000.00,'ARS'),(4,4,30000.00,'ARS'),(5,5,35000.00,'ARS'),(6,6,65000.00,'ARS'),(7,7,50000.00,'ARS'),(8,8,45000.00,'ARS');
/*!40000 ALTER TABLE `precio_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(30) DEFAULT NULL,
  `id_tipo_prenda` int NOT NULL,
  `id_temporada` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_tipo_prenda` (`id_tipo_prenda`),
  KEY `id_temporada` (`id_temporada`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_tipo_prenda`) REFERENCES `tipo_prenda` (`id_tipo_prenda`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_temporada`) REFERENCES `temporada` (`id_temporada`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Remera básica liviana',1,1),(2,'Remera básica manga larga',1,2),(3,'Pantalón lino',2,1),(4,'Pantalón corderoi',2,2),(5,'Pantalón cargo',2,2),(6,'Campera de jean',3,1),(7,'Buzo oversize',3,2),(8,'Anteojos de sol',4,1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id_stock` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `stock` int NOT NULL,
  `id_talle` int NOT NULL,
  `id_color` int NOT NULL,
  PRIMARY KEY (`id_stock`),
  KEY `id_producto` (`id_producto`),
  KEY `id_talle` (`id_talle`),
  KEY `id_color` (`id_color`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`id_talle`) REFERENCES `talle` (`id_talle`),
  CONSTRAINT `stock_ibfk_3` FOREIGN KEY (`id_color`) REFERENCES `color` (`id_color`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,1,16,1,1),(2,1,30,1,2),(3,1,25,1,3),(4,1,22,1,4),(5,1,12,1,5),(6,1,12,2,1),(7,1,29,2,2),(8,1,27,2,3),(9,1,12,2,4),(10,1,15,2,5),(11,1,21,3,1),(12,1,17,3,2),(13,1,15,3,3),(14,1,16,3,4),(15,1,18,3,5),(16,1,17,4,1),(17,1,30,4,2),(18,1,21,4,3),(19,1,23,4,4),(20,1,19,4,5),(21,1,21,5,1),(22,1,17,5,2),(23,1,28,5,3),(24,1,22,5,4),(25,1,21,5,5),(26,2,16,1,1),(27,2,16,1,2),(28,2,23,1,3),(29,2,25,1,4),(30,2,20,1,5),(31,2,22,2,1),(32,2,30,2,2),(33,2,18,2,3),(34,2,27,2,4),(35,2,26,2,5),(36,2,17,3,1),(37,2,15,3,2),(38,2,26,3,3),(39,2,21,3,4),(40,2,23,3,5),(41,2,12,4,1),(42,2,15,4,2),(43,2,28,4,3),(44,2,19,4,4),(45,2,19,4,5),(46,2,24,5,1),(47,2,20,5,2),(48,2,11,5,3),(49,2,20,5,4),(50,2,25,5,5),(51,3,15,1,1),(52,3,16,1,2),(53,3,19,1,3),(54,3,15,1,4),(55,3,15,1,5),(56,3,10,2,1),(57,3,24,2,2),(58,3,28,2,3),(59,3,27,2,4),(60,3,18,2,5),(61,3,25,3,1),(62,3,14,3,2),(63,3,17,3,3),(64,3,24,3,4),(65,3,26,3,5),(66,3,24,4,1),(67,3,18,4,2),(68,3,12,4,3),(69,3,17,4,4),(70,3,27,4,5),(71,3,24,5,1),(72,3,25,5,2),(73,3,15,5,3),(74,3,18,5,4),(75,3,30,5,5),(76,4,22,1,1),(77,4,28,1,2),(78,4,27,1,3),(79,4,21,1,4),(80,4,21,1,5),(81,4,25,2,1),(82,4,12,2,2),(83,4,15,2,3),(84,4,24,2,4),(85,4,28,2,5),(86,4,27,3,1),(87,4,29,3,2),(88,4,23,3,3),(89,4,12,3,4),(90,4,24,3,5),(91,4,28,4,1),(92,4,24,4,2),(93,4,18,4,3),(94,4,13,4,4),(95,4,23,4,5),(96,4,15,5,1),(97,4,27,5,2),(98,4,25,5,3),(99,4,18,5,4),(100,4,25,5,5),(101,5,18,1,1),(102,5,18,1,2),(103,5,27,1,3),(104,5,26,1,4),(105,5,18,1,5),(106,5,23,2,1),(107,5,30,2,2),(108,5,30,2,3),(109,5,28,2,4),(110,5,20,2,5),(111,5,23,3,1),(112,5,20,3,2),(113,5,17,3,3),(114,5,20,3,4),(115,5,28,3,5),(116,5,14,4,1),(117,5,24,4,2),(118,5,13,4,3),(119,5,30,4,4),(120,5,16,4,5),(121,5,18,5,1),(122,5,20,5,2),(123,5,28,5,3),(124,5,20,5,4),(125,5,11,5,5),(126,6,14,1,1),(127,6,18,1,2),(128,6,18,1,3),(129,6,24,1,4),(130,6,26,1,5),(131,6,21,2,1),(132,6,17,2,2),(133,6,26,2,3),(134,6,29,2,4),(135,6,16,2,5),(136,6,26,3,1),(137,6,29,3,2),(138,6,17,3,3),(139,6,30,3,4),(140,6,23,3,5),(141,6,22,4,1),(142,6,22,4,2),(143,6,11,4,3),(144,6,25,4,4),(145,6,28,4,5),(146,6,26,5,1),(147,6,27,5,2),(148,6,23,5,3),(149,6,18,5,4),(150,6,17,5,5),(151,7,15,1,1),(152,7,27,1,2),(153,7,13,1,3),(154,7,22,1,4),(155,7,19,1,5),(156,7,15,2,1),(157,7,18,2,2),(158,7,26,2,3),(159,7,16,2,4),(160,7,27,2,5),(161,7,19,3,1),(162,7,12,3,2),(163,7,11,3,3),(164,7,16,3,4),(165,7,11,3,5),(166,7,29,4,1),(167,7,24,4,2),(168,7,14,4,3),(169,7,11,4,4),(170,7,25,4,5),(171,7,21,5,1),(172,7,17,5,2),(173,7,12,5,3),(174,7,24,5,4),(175,7,29,5,5),(176,8,23,1,1),(177,8,19,1,2),(178,8,12,1,3),(179,8,26,1,4),(180,8,19,1,5),(181,8,23,2,1),(182,8,28,2,2),(183,8,30,2,3),(184,8,23,2,4),(185,8,24,2,5),(186,8,12,3,1),(187,8,12,3,2),(188,8,12,3,3),(189,8,10,3,4),(190,8,29,3,5),(191,8,21,4,1),(192,8,18,4,2),(193,8,27,4,3),(194,8,16,4,4),(195,8,16,4,5),(196,8,21,5,1),(197,8,14,5,2),(198,8,22,5,3),(199,8,26,5,4),(200,8,18,5,5);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `stock_valorizado`
--

DROP TABLE IF EXISTS `stock_valorizado`;
/*!50001 DROP VIEW IF EXISTS `stock_valorizado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `stock_valorizado` AS SELECT 
 1 AS `id_producto`,
 1 AS `nombre_producto`,
 1 AS `stock`,
 1 AS `descripcion_talle`,
 1 AS `descripcion_color`,
 1 AS `costo`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `talle`
--

DROP TABLE IF EXISTS `talle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talle` (
  `id_talle` int NOT NULL AUTO_INCREMENT,
  `descripcion_talle` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_talle`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talle`
--

LOCK TABLES `talle` WRITE;
/*!40000 ALTER TABLE `talle` DISABLE KEYS */;
INSERT INTO `talle` VALUES (1,'XS'),(2,'S'),(3,'M'),(4,'L'),(5,'XL');
/*!40000 ALTER TABLE `talle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporada`
--

DROP TABLE IF EXISTS `temporada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temporada` (
  `id_temporada` int NOT NULL AUTO_INCREMENT,
  `descripcion_temporada` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_temporada`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporada`
--

LOCK TABLES `temporada` WRITE;
/*!40000 ALTER TABLE `temporada` DISABLE KEYS */;
INSERT INTO `temporada` VALUES (1,'Primavera/Verano'),(2,'Otoño/Invierno');
/*!40000 ALTER TABLE `temporada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_prenda`
--

DROP TABLE IF EXISTS `tipo_prenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_prenda` (
  `id_tipo_prenda` int NOT NULL AUTO_INCREMENT,
  `descripcion_tipo_prenda` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_prenda`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_prenda`
--

LOCK TABLES `tipo_prenda` WRITE;
/*!40000 ALTER TABLE `tipo_prenda` DISABLE KEYS */;
INSERT INTO `tipo_prenda` VALUES (1,'Superiores'),(2,'Inferiores'),(3,'Abrigos'),(4,'Accesorios');
/*!40000 ALTER TABLE `tipo_prenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `variedad_productos`
--

DROP TABLE IF EXISTS `variedad_productos`;
/*!50001 DROP VIEW IF EXISTS `variedad_productos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `variedad_productos` AS SELECT 
 1 AS `descripcion_tipo_prenda`,
 1 AS `descripcion_temporada`,
 1 AS `cantidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_venta`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,1,'2025-07-20 14:30:00'),(2,2,'2025-07-21 16:45:00'),(3,3,'2025-07-22 17:20:00'),(4,4,'2025-07-22 11:25:00'),(5,1,'2025-08-23 10:20:00'),(6,2,'2025-09-22 09:30:00'),(7,3,'2025-07-25 20:20:00'),(8,4,'2025-09-01 15:30:00'),(9,1,'2025-07-10 17:05:00'),(10,2,'2025-06-05 12:20:00'),(11,3,'2025-07-29 16:40:00'),(12,4,'2025-08-15 09:37:00'),(13,1,'2025-06-22 11:45:00'),(14,2,'2025-09-21 19:19:00'),(15,3,'2025-06-22 10:10:00'),(20,2,'2025-09-21 17:47:02');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `venta_analisis`
--

DROP TABLE IF EXISTS `venta_analisis`;
/*!50001 DROP VIEW IF EXISTS `venta_analisis`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `venta_analisis` AS SELECT 
 1 AS `id_venta`,
 1 AS `id_cliente`,
 1 AS `nombre`,
 1 AS `fecha`,
 1 AS `cantidad`,
 1 AS `id_producto`,
 1 AS `nombre_producto`,
 1 AS `precio`,
 1 AS `costo`,
 1 AS `margen_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `venta_internacional`
--

DROP TABLE IF EXISTS `venta_internacional`;
/*!50001 DROP VIEW IF EXISTS `venta_internacional`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `venta_internacional` AS SELECT 
 1 AS `nacionalidad`,
 1 AS `ventas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_producto`
--

DROP TABLE IF EXISTS `vista_producto`;
/*!50001 DROP VIEW IF EXISTS `vista_producto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_producto` AS SELECT 
 1 AS `id_producto`,
 1 AS `nombre_producto`,
 1 AS `descripcion_temporada`,
 1 AS `descripcion_tipo_prenda`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'gv_indumentaria'
--
/*!50003 DROP FUNCTION IF EXISTS `buscar_stock_por_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `buscar_stock_por_producto`(codigo_producto INT, codigo_talle INT, codigo_color INT) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE stock_producto INT;
  SELECT stock into stock_producto	
  FROM stock
  WHERE id_producto=codigo_producto AND id_talle=codigo_talle AND id_color=codigo_color;
  
  RETURN stock_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `compras_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `compras_cliente`(cliente_seleccionado INT) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE compras_clientes INT;
  SELECT count(id_venta) into compras_clientes
  FROM venta
  WHERE id_cliente=cliente_seleccionado;
  
  RETURN compras_clientes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InsertarEliminarclientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertarEliminarclientes`(
    IN p_operacion VARCHAR (10),
    IN p_dni VARCHAR(20),
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR (100), 
    IN p_nacionalidad VARCHAR (50),
    IN p_email VARCHAR(100),
    IN p_fecha_nacimiento DATE
)
BEGIN
    IF p_operacion = 'INSERT' THEN
        SET @query = CONCAT(
            'INSERT INTO cliente(dni, nombre, apellido, nacionalidad, email, fecha_nacimiento) VALUES (''',
            p_dni, ''',''',
            p_nombre, ''',''',
            p_apellido, ''',''',
            p_nacionalidad, ''',''',
            p_email, ''',''',
            p_fecha_nacimiento, ''');'
        );

    ELSEIF p_operacion = 'DELETE' THEN
        SET @query = CONCAT(
            'DELETE FROM cliente WHERE dni = ''', p_dni, ''';'
        );
    END IF;

    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ventasproducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ventasproducto`(
    IN p_producto INT
)
BEGIN
    SET @query = CONCAT(
        'SELECT p.nombre_producto, v.id_venta, v.fecha, det.cantidad
         FROM producto p
         JOIN detalle_venta det ON det.id_producto=p.id_producto
         JOIN venta v ON v.id_venta = det.id_venta
         WHERE p.id_producto = ', p_producto, ';'
    );

    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `bajo_stock`
--

/*!50001 DROP VIEW IF EXISTS `bajo_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bajo_stock` AS select `p`.`id_producto` AS `id_producto`,`p`.`nombre_producto` AS `nombre_producto`,`t`.`descripcion_talle` AS `descripcion_talle`,`c`.`descripcion_color` AS `descripcion_color`,`s`.`stock` AS `stock` from (((`stock` `s` join `producto` `p` on((`p`.`id_producto` = `s`.`id_producto`))) join `talle` `t` on((`t`.`id_talle` = `s`.`id_talle`))) join `color` `c` on((`c`.`id_color` = `s`.`id_color`))) where (`s`.`stock` <= 15) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `detalle_venta_check`
--

/*!50001 DROP VIEW IF EXISTS `detalle_venta_check`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `detalle_venta_check` AS select `v`.`id_venta` AS `id_venta`,`v`.`id_cliente` AS `id_cliente`,`v`.`fecha` AS `fecha`,`det`.`id_detalle` AS `id_detalle` from (`venta` `v` left join `detalle_venta` `det` on((`v`.`id_venta` = `det`.`id_venta`))) where (`det`.`id_detalle` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stock_valorizado`
--

/*!50001 DROP VIEW IF EXISTS `stock_valorizado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stock_valorizado` AS select `p`.`id_producto` AS `id_producto`,`p`.`nombre_producto` AS `nombre_producto`,`s`.`stock` AS `stock`,`t`.`descripcion_talle` AS `descripcion_talle`,`c`.`descripcion_color` AS `descripcion_color`,`costo`.`costo` AS `costo`,(`s`.`stock` * `costo`.`costo`) AS `total` from ((((`stock` `s` join `producto` `p` on((`p`.`id_producto` = `s`.`id_producto`))) join `talle` `t` on((`t`.`id_talle` = `s`.`id_talle`))) join `color` `c` on((`c`.`id_color` = `s`.`id_color`))) join `costo_producto` `costo` on((`costo`.`id_producto` = `s`.`id_producto`))) order by (`s`.`stock` * `costo`.`costo`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `variedad_productos`
--

/*!50001 DROP VIEW IF EXISTS `variedad_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `variedad_productos` AS select `tipo`.`descripcion_tipo_prenda` AS `descripcion_tipo_prenda`,`t`.`descripcion_temporada` AS `descripcion_temporada`,count(`p`.`id_producto`) AS `cantidad` from ((`producto` `p` join `temporada` `t` on((`t`.`id_temporada` = `p`.`id_temporada`))) join `tipo_prenda` `tipo` on((`tipo`.`id_tipo_prenda` = `p`.`id_tipo_prenda`))) group by `tipo`.`descripcion_tipo_prenda`,`t`.`descripcion_temporada` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `venta_analisis`
--

/*!50001 DROP VIEW IF EXISTS `venta_analisis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `venta_analisis` AS select `v`.`id_venta` AS `id_venta`,`v`.`id_cliente` AS `id_cliente`,concat(`c`.`nombre`,' ',`c`.`apellido`) AS `nombre`,`v`.`fecha` AS `fecha`,`det`.`cantidad` AS `cantidad`,`det`.`id_producto` AS `id_producto`,`prod`.`nombre_producto` AS `nombre_producto`,`p`.`precio` AS `precio`,`cost`.`costo` AS `costo`,(`det`.`cantidad` * (`p`.`precio` - `cost`.`costo`)) AS `margen_total` from (((((`venta` `v` left join `detalle_venta` `det` on((`v`.`id_venta` = `det`.`id_venta`))) left join `cliente` `c` on((`v`.`id_cliente` = `c`.`id_cliente`))) left join `precio_producto` `p` on((`det`.`id_producto` = `p`.`id_producto`))) left join `producto` `prod` on((`det`.`id_producto` = `prod`.`id_producto`))) left join `costo_producto` `cost` on((`det`.`id_producto` = `cost`.`id_producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `venta_internacional`
--

/*!50001 DROP VIEW IF EXISTS `venta_internacional`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `venta_internacional` AS select `c`.`nacionalidad` AS `nacionalidad`,count(`v`.`id_venta`) AS `ventas` from (`cliente` `c` left join `venta` `v` on((`c`.`id_cliente` = `v`.`id_cliente`))) group by `c`.`nacionalidad` order by `c`.`nacionalidad` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_producto`
--

/*!50001 DROP VIEW IF EXISTS `vista_producto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_producto` AS select `p`.`id_producto` AS `id_producto`,`p`.`nombre_producto` AS `nombre_producto`,`temp`.`descripcion_temporada` AS `descripcion_temporada`,`tipo`.`descripcion_tipo_prenda` AS `descripcion_tipo_prenda` from ((`producto` `p` left join `temporada` `temp` on((`p`.`id_temporada` = `temp`.`id_temporada`))) left join `tipo_prenda` `tipo` on((`p`.`id_tipo_prenda` = `tipo`.`id_tipo_prenda`))) */;
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

-- Dump completed on 2025-09-21 17:50:26
