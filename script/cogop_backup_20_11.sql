CREATE DATABASE  IF NOT EXISTS `cogop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cogop`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: cogop
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `configuracion_tabla`
--

DROP TABLE IF EXISTS `configuracion_tabla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuracion_tabla` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_datos` varchar(45) NOT NULL,
  `menu_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion_tabla`
--

LOCK TABLES `configuracion_tabla` WRITE;
/*!40000 ALTER TABLE `configuracion_tabla` DISABLE KEYS */;
INSERT INTO `configuracion_tabla` VALUES (1,'5',11),(2,'6',10);
/*!40000 ALTER TABLE `configuracion_tabla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Amazonas'),(2,'Áncash'),(3,'Apurímac'),(4,'Arequipa'),(5,'Ayacucho'),(6,'Cajamarca'),(7,'Callao'),(8,'Cusco'),(9,'Huancavelica'),(10,'Huánuco'),(11,'Ica'),(12,'Junín'),(13,'La Libertad'),(14,'Lambayeque'),(15,'Lima'),(16,'Loreto'),(17,'Madre de Dios'),(18,'Moquegua'),(19,'Pasco'),(20,'Piura'),(21,'Puno'),(22,'San Martín'),(23,'Tacna'),(24,'Tumbes'),(25,'Ucayali');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discipulado`
--

DROP TABLE IF EXISTS `discipulado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discipulado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discipulado`
--

LOCK TABLES `discipulado` WRITE;
/*!40000 ALTER TABLE `discipulado` DISABLE KEYS */;
INSERT INTO `discipulado` VALUES (1,'1er. Curso'),(2,'2do. Curso'),(3,'3er. Curso');
/*!40000 ALTER TABLE `discipulado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distritos`
--

DROP TABLE IF EXISTS `distritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distritos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `provincias_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `provincia_id` (`provincias_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `distritos_ibfk_1` FOREIGN KEY (`provincias_id`) REFERENCES `provincias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distritos`
--

LOCK TABLES `distritos` WRITE;
/*!40000 ALTER TABLE `distritos` DISABLE KEYS */;
INSERT INTO `distritos` VALUES (1,'Chachapoyas',1),(2,'Asunción',1),(3,'Bagua',2),(4,'Aramango',2),(5,'Huaraz',3),(6,'Independencia',3),(7,'Carhuaz',4),(8,'Marcará',4),(9,'Abancay',5),(10,'Chacoche',5),(11,'Andahuaylas',6),(12,'Talavera',6),(13,'Arequipa',7),(14,'Alto Selva Alegre',7),(15,'Camaná',8),(16,'Mariscal Cáceres',8);
/*!40000 ALTER TABLE `distritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distritos_cogop`
--

DROP TABLE IF EXISTS `distritos_cogop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distritos_cogop` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `distritos_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index2` (`distritos_id`),
  CONSTRAINT `distritos_cogop_distritos` FOREIGN KEY (`distritos_id`) REFERENCES `distritos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distritos_cogop`
--

LOCK TABLES `distritos_cogop` WRITE;
/*!40000 ALTER TABLE `distritos_cogop` DISABLE KEYS */;
INSERT INTO `distritos_cogop` VALUES (1,'distrito 1',1),(2,'distrito 2',1);
/*!40000 ALTER TABLE `distritos_cogop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dones`
--

DROP TABLE IF EXISTS `dones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dones`
--

LOCK TABLES `dones` WRITE;
/*!40000 ALTER TABLE `dones` DISABLE KEYS */;
INSERT INTO `dones` VALUES (1,'Sabiduría'),(2,'Fe'),(3,'Sanidad'),(4,'Profecía'),(5,'Conocimiento');
/*!40000 ALTER TABLE `dones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educacion`
--

DROP TABLE IF EXISTS `educacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `educacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educacion`
--

LOCK TABLES `educacion` WRITE;
/*!40000 ALTER TABLE `educacion` DISABLE KEYS */;
INSERT INTO `educacion` VALUES (1,'Primaria Completa'),(2,'Primaria Incompleta');
/*!40000 ALTER TABLE `educacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Activo'),(2,'Inactivo'),(3,'Eliminado');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudios_eclesiasticos`
--

DROP TABLE IF EXISTS `estudios_eclesiasticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudios_eclesiasticos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudios_eclesiasticos`
--

LOCK TABLES `estudios_eclesiasticos` WRITE;
/*!40000 ALTER TABLE `estudios_eclesiasticos` DISABLE KEYS */;
INSERT INTO `estudios_eclesiasticos` VALUES (1,'ejemplo1'),(2,'ejemplo2');
/*!40000 ALTER TABLE `estudios_eclesiasticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudios_seculares`
--

DROP TABLE IF EXISTS `estudios_seculares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudios_seculares` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudios_seculares`
--

LOCK TABLES `estudios_seculares` WRITE;
/*!40000 ALTER TABLE `estudios_seculares` DISABLE KEYS */;
INSERT INTO `estudios_seculares` VALUES (1,'Primaria'),(2,'Secundariaaa');
/*!40000 ALTER TABLE `estudios_seculares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_pastoral`
--

DROP TABLE IF EXISTS `ficha_pastoral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_pastoral` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `miembro_id` int NOT NULL,
  `lugar_nacimiento` varchar(45) NOT NULL,
  `domicilio_actual` varchar(70) NOT NULL,
  `educacion_id` int NOT NULL,
  `grado_ciclo` varchar(45) NOT NULL,
  `titulo_profesion` varchar(45) NOT NULL,
  `fecha_bautismo_agua` date NOT NULL,
  `fecha_bautismo_espiritu_santo` date NOT NULL,
  `fecha_añadido_iglesia` date NOT NULL,
  `nombre_bautizo` varchar(45) NOT NULL,
  `discipulado_id` int NOT NULL,
  `ficha_pastoral_estudios_setidp_id` int NOT NULL,
  `ficha_pastoral_mayordomia_fiel_id` int NOT NULL,
  `ficha_pastoral_vision_iglesia_dios_id` int NOT NULL,
  `ficha_pastoral_doctrina_gobierno_iglesia_id` int NOT NULL,
  `ficha_pastoral_disposicion_llamado_id` int NOT NULL,
  `ficha_pastoral_promesa_desarrollo_id` int NOT NULL,
  `ficha_pastoral_miembro_organizacion_religiosa_id` int NOT NULL,
  `ficha_pastoral_datos_familiares_id` int NOT NULL,
  `ficha_pastoral_secuencia_servicio_ministerial_id` int NOT NULL,
  `fecha_conversion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_pastoral`
--

LOCK TABLES `ficha_pastoral` WRITE;
/*!40000 ALTER TABLE `ficha_pastoral` DISABLE KEYS */;
INSERT INTO `ficha_pastoral` VALUES (1,1,1,'','',0,'','','0000-00-00','0000-00-00','0000-00-00','',0,0,0,0,0,0,0,0,0,0,NULL);
/*!40000 ALTER TABLE `ficha_pastoral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_pastoral_conyugue_bautismo`
--

DROP TABLE IF EXISTS `ficha_pastoral_conyugue_bautismo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_pastoral_conyugue_bautismo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_pastoral_conyugue_bautismo`
--

LOCK TABLES `ficha_pastoral_conyugue_bautismo` WRITE;
/*!40000 ALTER TABLE `ficha_pastoral_conyugue_bautismo` DISABLE KEYS */;
INSERT INTO `ficha_pastoral_conyugue_bautismo` VALUES (1,'Si'),(2,'No');
/*!40000 ALTER TABLE `ficha_pastoral_conyugue_bautismo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_pastoral_conyugue_convertido`
--

DROP TABLE IF EXISTS `ficha_pastoral_conyugue_convertido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_pastoral_conyugue_convertido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_pastoral_conyugue_convertido`
--

LOCK TABLES `ficha_pastoral_conyugue_convertido` WRITE;
/*!40000 ALTER TABLE `ficha_pastoral_conyugue_convertido` DISABLE KEYS */;
INSERT INTO `ficha_pastoral_conyugue_convertido` VALUES (1,'Si'),(2,'No');
/*!40000 ALTER TABLE `ficha_pastoral_conyugue_convertido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_pastoral_conyugue_miembro_iglesia`
--

DROP TABLE IF EXISTS `ficha_pastoral_conyugue_miembro_iglesia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_pastoral_conyugue_miembro_iglesia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_pastoral_conyugue_miembro_iglesia`
--

LOCK TABLES `ficha_pastoral_conyugue_miembro_iglesia` WRITE;
/*!40000 ALTER TABLE `ficha_pastoral_conyugue_miembro_iglesia` DISABLE KEYS */;
INSERT INTO `ficha_pastoral_conyugue_miembro_iglesia` VALUES (1,'Si'),(2,'No');
/*!40000 ALTER TABLE `ficha_pastoral_conyugue_miembro_iglesia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_pastoral_datos_familiares`
--

DROP TABLE IF EXISTS `ficha_pastoral_datos_familiares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_pastoral_datos_familiares` (
  `id` int NOT NULL AUTO_INCREMENT,
  `miembros_datos_familiares_id` int NOT NULL,
  `conyugue_fecha_nacimiento` date DEFAULT NULL,
  `fecha_matrimonio` date DEFAULT NULL,
  `ficha_pastoral_conyugue_convertido_id` int DEFAULT NULL,
  `ficha_pastoral_conyugue_miembro_iglesia_id` int DEFAULT NULL,
  `ficha_pastoral_conyugue_bautismo_id` int DEFAULT NULL,
  `numero_hijos` int DEFAULT NULL,
  `numero_hijos_miembros_iglesia` int DEFAULT NULL,
  `hijos_edades` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_pastoral_datos_familiares`
--

LOCK TABLES `ficha_pastoral_datos_familiares` WRITE;
/*!40000 ALTER TABLE `ficha_pastoral_datos_familiares` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficha_pastoral_datos_familiares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_pastoral_disposicion_llamado`
--

DROP TABLE IF EXISTS `ficha_pastoral_disposicion_llamado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_pastoral_disposicion_llamado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_pastoral_disposicion_llamado`
--

LOCK TABLES `ficha_pastoral_disposicion_llamado` WRITE;
/*!40000 ALTER TABLE `ficha_pastoral_disposicion_llamado` DISABLE KEYS */;
INSERT INTO `ficha_pastoral_disposicion_llamado` VALUES (1,'Si'),(2,'No');
/*!40000 ALTER TABLE `ficha_pastoral_disposicion_llamado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_pastoral_doctrina_gobierno_iglesia`
--

DROP TABLE IF EXISTS `ficha_pastoral_doctrina_gobierno_iglesia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_pastoral_doctrina_gobierno_iglesia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_pastoral_doctrina_gobierno_iglesia`
--

LOCK TABLES `ficha_pastoral_doctrina_gobierno_iglesia` WRITE;
/*!40000 ALTER TABLE `ficha_pastoral_doctrina_gobierno_iglesia` DISABLE KEYS */;
INSERT INTO `ficha_pastoral_doctrina_gobierno_iglesia` VALUES (1,'Si'),(2,'No');
/*!40000 ALTER TABLE `ficha_pastoral_doctrina_gobierno_iglesia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_pastoral_eleccion`
--

DROP TABLE IF EXISTS `ficha_pastoral_eleccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_pastoral_eleccion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_pastoral_eleccion`
--

LOCK TABLES `ficha_pastoral_eleccion` WRITE;
/*!40000 ALTER TABLE `ficha_pastoral_eleccion` DISABLE KEYS */;
INSERT INTO `ficha_pastoral_eleccion` VALUES (1,'Si'),(2,'No');
/*!40000 ALTER TABLE `ficha_pastoral_eleccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_pastoral_estudios_setidp`
--

DROP TABLE IF EXISTS `ficha_pastoral_estudios_setidp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_pastoral_estudios_setidp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_pastoral_estudios_setidp`
--

LOCK TABLES `ficha_pastoral_estudios_setidp` WRITE;
/*!40000 ALTER TABLE `ficha_pastoral_estudios_setidp` DISABLE KEYS */;
INSERT INTO `ficha_pastoral_estudios_setidp` VALUES (1,'Si'),(2,'No');
/*!40000 ALTER TABLE `ficha_pastoral_estudios_setidp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_pastoral_mayordomia_fiel`
--

DROP TABLE IF EXISTS `ficha_pastoral_mayordomia_fiel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_pastoral_mayordomia_fiel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_pastoral_mayordomia_fiel`
--

LOCK TABLES `ficha_pastoral_mayordomia_fiel` WRITE;
/*!40000 ALTER TABLE `ficha_pastoral_mayordomia_fiel` DISABLE KEYS */;
INSERT INTO `ficha_pastoral_mayordomia_fiel` VALUES (1,'Si'),(2,'No');
/*!40000 ALTER TABLE `ficha_pastoral_mayordomia_fiel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_pastoral_miembro_organizacion_religiosa`
--

DROP TABLE IF EXISTS `ficha_pastoral_miembro_organizacion_religiosa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_pastoral_miembro_organizacion_religiosa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_pastoral_miembro_organizacion_religiosa`
--

LOCK TABLES `ficha_pastoral_miembro_organizacion_religiosa` WRITE;
/*!40000 ALTER TABLE `ficha_pastoral_miembro_organizacion_religiosa` DISABLE KEYS */;
INSERT INTO `ficha_pastoral_miembro_organizacion_religiosa` VALUES (1,'Si'),(2,'No');
/*!40000 ALTER TABLE `ficha_pastoral_miembro_organizacion_religiosa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_pastoral_nombre_organizacion`
--

DROP TABLE IF EXISTS `ficha_pastoral_nombre_organizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_pastoral_nombre_organizacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `tiempo` varchar(45) NOT NULL,
  `ficha_pastoral_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_pastoral_nombre_organizacion`
--

LOCK TABLES `ficha_pastoral_nombre_organizacion` WRITE;
/*!40000 ALTER TABLE `ficha_pastoral_nombre_organizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficha_pastoral_nombre_organizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_pastoral_promesa_desarrollo`
--

DROP TABLE IF EXISTS `ficha_pastoral_promesa_desarrollo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_pastoral_promesa_desarrollo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_pastoral_promesa_desarrollo`
--

LOCK TABLES `ficha_pastoral_promesa_desarrollo` WRITE;
/*!40000 ALTER TABLE `ficha_pastoral_promesa_desarrollo` DISABLE KEYS */;
INSERT INTO `ficha_pastoral_promesa_desarrollo` VALUES (1,'Si'),(2,'No');
/*!40000 ALTER TABLE `ficha_pastoral_promesa_desarrollo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_pastoral_secuencia_servicio_ministerial`
--

DROP TABLE IF EXISTS `ficha_pastoral_secuencia_servicio_ministerial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_pastoral_secuencia_servicio_ministerial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `year_ingreso` char(4) DEFAULT NULL,
  `datos_utilidad` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_pastoral_secuencia_servicio_ministerial`
--

LOCK TABLES `ficha_pastoral_secuencia_servicio_ministerial` WRITE;
/*!40000 ALTER TABLE `ficha_pastoral_secuencia_servicio_ministerial` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficha_pastoral_secuencia_servicio_ministerial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_pastoral_vision_iglesia_dios`
--

DROP TABLE IF EXISTS `ficha_pastoral_vision_iglesia_dios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_pastoral_vision_iglesia_dios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_pastoral_vision_iglesia_dios`
--

LOCK TABLES `ficha_pastoral_vision_iglesia_dios` WRITE;
/*!40000 ALTER TABLE `ficha_pastoral_vision_iglesia_dios` DISABLE KEYS */;
INSERT INTO `ficha_pastoral_vision_iglesia_dios` VALUES (1,'Si'),(2,'No');
/*!40000 ALTER TABLE `ficha_pastoral_vision_iglesia_dios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hijos`
--

DROP TABLE IF EXISTS `hijos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hijos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) NOT NULL,
  `apellido_paterno` varchar(45) NOT NULL,
  `apellido_materno` varchar(45) NOT NULL,
  `miembros_datos_familiares_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_miembros_datos_familiares` (`miembros_datos_familiares_id`),
  CONSTRAINT `fk_miembros_datos_familiares` FOREIGN KEY (`miembros_datos_familiares_id`) REFERENCES `miembros_datos_familiares` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hijos`
--

LOCK TABLES `hijos` WRITE;
/*!40000 ALTER TABLE `hijos` DISABLE KEYS */;
INSERT INTO `hijos` VALUES (10,'Panchho','Flores','Lara',10),(11,'Carlos','Flores','Lara',10),(12,'Juan','Flores','Lara',11),(13,'Carlos','Flores','Lara',11),(14,'Juan','Flores','Lara',12),(15,'Carlos','Flores','Lara',12),(16,'Juan','Flores','Lara',13),(17,'Carlos','Flores','Lara',13),(18,'Juan','Flores','Lara',14),(19,'Carlos','Flores','Lara',14),(20,'Juan','Flores','Lara',15),(21,'Carlos','Flores','Lara',15),(22,'Juan','Flores','Lara',16),(23,'Carlos','Flores','Lara',16),(24,'Juan','Flores','Lara',17),(25,'Carlos','Flores','Lara',17),(26,'Juan','Flores','Lara',18),(27,'Carlos','Flores','Lara',18),(28,'Juan','Flores','Lara',19),(29,'Carlos','Flores','Lara',19),(30,'Juan','Flores','Lara',20),(31,'Carlos','Flores','Lara',20),(32,'Juan','Flores','Lara',21),(33,'Carlos','Flores','Lara',21),(34,'Juan','Flores','Lara',22),(35,'Carlos','Flores','Lara',22),(36,'Juan','Flores','Lara',23),(37,'Carlos','Flores','Lara',23),(38,'Juan','Flores','Lara',24),(39,'Carlos','Flores','Lara',24),(40,'Juan','Flores','Lara',25),(41,'Carlos','Flores','Lara',25),(42,'Juan','Flores','Lara',26),(43,'Carlos','Flores','Lara',26),(44,'Juan','Flores','Lara',27),(45,'Carlos','Flores','Lara',27),(46,'Juan','Flores','Lara',28),(47,'Carlos','Flores','Lara',28),(48,'Juan','Flores','Lara',29),(49,'Carlos','Flores','Lara',29),(50,'Juan','Flores','Lara',30),(51,'Carlos','Flores','Lara',30),(52,'Juan','Flores','Lara',31),(53,'Carlos','Flores','Lara',31),(54,'Juan','Flores','Lara',32),(55,'Carlos','Flores','Lara',32),(56,'Juan','Flores','Lara',33),(57,'Carlos','Flores','Lara',33),(58,'Juan','Flores','Lara',34),(59,'Carlos','Flores','Lara',34),(60,'purple','dd','blue',35),(61,'Juan','Flores','Lara',38),(62,'Carlos','Flores','Lara',38),(65,'Juan','Flores','Lara',39),(66,'Carlos','Flores','Lara',39),(67,'Juan','Flores','Lara',40),(69,'Juan','Flores','Lara',1),(70,'Carlos','Flores','Lara',1);
/*!40000 ALTER TABLE `hijos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iglesia`
--

DROP TABLE IF EXISTS `iglesia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iglesia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iglesia`
--

LOCK TABLES `iglesia` WRITE;
/*!40000 ALTER TABLE `iglesia` DISABLE KEYS */;
INSERT INTO `iglesia` VALUES (4,'COGOP - EJEMPLO'),(3,'COGOP - OTRO'),(2,'COGOP - SAN OTRO'),(1,'COGOP - SAN PEDRO DE CHIO ');
/*!40000 ALTER TABLE `iglesia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `url` varchar(45) NOT NULL,
  `parent_id` int NOT NULL,
  `rol_id` int NOT NULL,
  `classs_change` char(15) DEFAULT NULL,
  `iconStyle` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_UNIQUE` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (2,300,'Inicio','./pastor/inicio-pastor',0,4,NULL,'flaticon-025-dashboard'),(8,400,'Inicio','./dashboard',0,1,'','flaticon-025-dashboard'),(9,301,'Usuarios','./usuario-admin',16,1,NULL,'flaticon-025-dashboard'),(10,600,'Gestión Reportes','./secretario/reportes',0,2,NULL,'flaticon-013-checkmark'),(11,700,'Gestión Miembros','./secretario/miembros',0,2,NULL,'flaticon-381-panel'),(12,800,'Gestión Tesorería','./inicio-tesorero',0,3,'mm-collapse','flaticon-050-info'),(13,801,'Informes Tesorería','./tesorero/informes',12,3,NULL,'flaticon-381-panel'),(14,802,'Plan de Cuentas Ingresos','./tesorero/cuentas-ingresos',12,3,NULL,'flaticon-381-panel'),(15,803,'Plan de Cuentas Egresos','./tesorero/cuentas-egresos',12,3,NULL,'flaticon-381-panel'),(16,300,'Mantenedor','./mantenedor-admin',0,1,'mm-collapse','flaticon-050-info'),(17,302,'Menu','./menu-admin',16,1,'','flaticon-050-info'),(50,500,'Gestión Pastoral','./pastor/ficha-pastoral',0,4,NULL,'flaticon-017-clipboard');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miembros`
--

DROP TABLE IF EXISTS `miembros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miembros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `iglesia_id` int DEFAULT NULL,
  `miembros_tipo_registro_id` int NOT NULL,
  `miembros_tipo_documento_id` int NOT NULL,
  `numero_documento` char(16) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `apellido_paterno` varchar(45) NOT NULL,
  `apellido_materno` varchar(45) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `miembros_estados_id` int NOT NULL,
  `miembros_sexo_id` int NOT NULL,
  `miembros_estados_civil_id` int NOT NULL,
  `telefono_fijo` char(10) NOT NULL,
  `telefono_celular` char(14) NOT NULL,
  `email` varchar(45) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `fecha_bautismo` date NOT NULL,
  `fecha_conversion` date NOT NULL,
  `miembros_ministro_bautizmo_id` int NOT NULL,
  `fecha_traslado` date NOT NULL,
  `experiencias` text NOT NULL,
  `mayordomia` text NOT NULL,
  `miembros_convencimiento_doctrina_id` int NOT NULL,
  `miembros_dias_visita_id` int NOT NULL,
  `miembros_horas_visita_id` int NOT NULL,
  `miembros_datos_familiares_id` int NOT NULL,
  `iglesia_mision` text,
  `gdc` char(4) NOT NULL,
  `gps` char(4) NOT NULL,
  `cm` char(4) NOT NULL,
  `mision` varchar(50) NOT NULL,
  `fecha_observado` date NOT NULL,
  `fecha_baja` date NOT NULL,
  `departamentos_id` int DEFAULT NULL,
  `provincias_id` int DEFAULT NULL,
  `distritos_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_documento_UNIQUE` (`numero_documento`),
  KEY `miembros_datos_familiar_fk` (`miembros_datos_familiares_id`),
  KEY `fk_miembros_convencimiento_doctrina` (`miembros_convencimiento_doctrina_id`),
  CONSTRAINT `fk_miembros_convencimiento_doctrina` FOREIGN KEY (`miembros_convencimiento_doctrina_id`) REFERENCES `miembros_convencimiento_doctrina` (`id`),
  CONSTRAINT `miembros_convencimiento_doctrina_fk` FOREIGN KEY (`miembros_convencimiento_doctrina_id`) REFERENCES `miembros_convencimiento_doctrina` (`id`),
  CONSTRAINT `miembros_datos_familiar_fk` FOREIGN KEY (`miembros_datos_familiares_id`) REFERENCES `miembros_datos_familiares` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembros`
--

LOCK TABLES `miembros` WRITE;
/*!40000 ALTER TABLE `miembros` DISABLE KEYS */;
INSERT INTO `miembros` VALUES (55,2,2,2,3,'1234567','2024-11-03','Lara','Pérez','Juan',1,2,2,'1234567','123456789','juan@gmail.com','Calle felicidad 232','2024-11-01','2024-11-01',2,'2024-11-01','Experiencias en retiros','qwerty',1,1,2,52,NULL,'123','321','125','misionesss','2024-11-01','2024-11-02',1,1,2),(56,20,4,1,1,'123456','2024-11-01','Ruiz','Bravo','Mariana',1,1,2,'123433','123456','lmcl.cllm@gmail.com','Calle amarillo 435','2024-10-31','2024-10-28',1,'2024-11-01','experiencias en catequesis','qwerty',1,1,1,53,NULL,'123','321','125','misionesss','2024-10-27','2024-11-02',2,3,4),(58,NULL,1,3,2,'2222','2024-10-30','Ruiz','Shoan','Elvis',4,2,2,'123433','123456','lmcl.cllm@gmail.com','Calle amarillo 435','2024-10-28','2024-11-20',2,'2024-10-30','experiencias en catequesis','qwerty',1,3,1,56,NULL,'123','321','125','misionesss','2024-10-27','2024-11-04',2,3,3),(61,NULL,4,2,1,'12345633','2024-11-18','Torres','Quispe','Juan',2,2,1,'123433','123456','lmcl.cllm@gmail.com','Calle amarillo 435','2024-10-29','2024-10-27',2,'2024-10-27','experiencias en catequesis','qwerty',1,1,2,60,NULL,'123','321','125','misionesss','2024-11-10','2024-11-01',1,1,2),(62,2,4,1,1,'1230003','2024-10-28','Torres','Quispe','Juan',1,2,3,'123433','123456','manuel@gmail.com','Calle amarillo 435','2024-10-28','2024-10-27',2,'2024-10-28','experiencias en catequesis','qwerty',1,1,1,61,NULL,'123','321','125','misionesss','2024-11-03','2024-11-03',2,3,3),(63,NULL,3,1,3,'1234562','2024-11-02','Torres','Ruíz','Paula',1,2,1,'123433','123456','lmcl.cllm@gmail.com','Calle amarillo 435','2024-10-28','2024-10-30',1,'2024-10-29','experiencias en catequesis','qwerty',1,3,1,62,NULL,'123','321','125','misionesss','2024-10-28','2024-10-28',1,1,2),(64,2,4,1,1,'3322','2024-11-01','Torres','Ruíz','Paula',1,1,1,'123433','123456','lmcl.cllm@gmail.com','Calle amarillo 435','2024-10-31','2024-11-06',2,'2024-11-03','experiencias en catequesis','qwerty',1,1,1,63,NULL,'123','321','125','misionesss','2024-11-04','2024-11-11',1,1,2),(65,20,1,1,1,'3377777722','2024-10-29','Flores','Blue','Paulaa',1,1,1,'123433','123456','lmcl.cllm@gmail.com','Calle amarillo 435','2024-11-10','2024-11-04',1,'2024-11-04','experiencias en catequesis','qwerty',1,1,1,64,'lllo','123','33','125','misionesss','2024-11-25','2024-11-18',1,2,2),(66,NULL,1,1,2,'123000','2024-11-11','Torres','Ruíz','Paula',1,2,1,'123433','123456','lmcl.cllm@gmail.com','Calle amarillo 435','2024-10-27','2024-10-28',1,'2024-10-31','experiencias en catequesis','qwerty',1,5,1,71,NULL,'123','321','125','misionesss','2024-11-04','2024-11-11',1,1,1);
/*!40000 ALTER TABLE `miembros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miembros_convencimiento_doctrina`
--

DROP TABLE IF EXISTS `miembros_convencimiento_doctrina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miembros_convencimiento_doctrina` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembros_convencimiento_doctrina`
--

LOCK TABLES `miembros_convencimiento_doctrina` WRITE;
/*!40000 ALTER TABLE `miembros_convencimiento_doctrina` DISABLE KEYS */;
INSERT INTO `miembros_convencimiento_doctrina` VALUES (1,'Sí'),(2,'No');
/*!40000 ALTER TABLE `miembros_convencimiento_doctrina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miembros_datos_familiares`
--

DROP TABLE IF EXISTS `miembros_datos_familiares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miembros_datos_familiares` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombres_conyuge` varchar(50) NOT NULL,
  `apellido_materno_conyuge` varchar(30) NOT NULL,
  `apellido_paterno_conyuge` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembros_datos_familiares`
--

LOCK TABLES `miembros_datos_familiares` WRITE;
/*!40000 ALTER TABLE `miembros_datos_familiares` DISABLE KEYS */;
INSERT INTO `miembros_datos_familiares` VALUES (1,'Fiorela','López','ZZZ'),(10,'María Elena','López','Sánchez'),(11,'María Elena','López','Sánchez'),(12,'María Elena','López','Sánchez'),(13,'María Elena','López','Sánchez'),(14,'María Elena','López','Sánchez'),(15,'María Elena','López','Sánchez'),(16,'María Elena','López','Sánchez'),(17,'María Elena','López','Sánchez'),(18,'María Elena','López','Sánchez'),(19,'María Elena','López','Sánchez'),(20,'María Elena','López','Sánchez'),(21,'María Elena','López','Sánchez'),(22,'María Elena','López','Sánchez'),(23,'María Elena','López','Sánchez'),(24,'María Elena','López','Sánchez'),(25,'María Elena','López','Sánchez'),(26,'María Elena','López','Sánchez'),(27,'María Elena','López','Sánchez'),(28,'María Elena','López','Sánchez'),(29,'María Elena','López','Sánchez'),(30,'María Elena','López','Sánchez'),(31,'María Elena','López','Sánchez'),(32,'María Elena','López','Sánchez'),(33,'María Elena','López','Sánchez'),(34,'María Elena','López','Sánchez'),(35,'asdf','frrere','frrere'),(36,'','',''),(37,'','',''),(38,'María Elena','López','Sánchez'),(39,'María Elena','López','Sánchez'),(40,'Fiorela','yyyyy','ZZZ');
/*!40000 ALTER TABLE `miembros_datos_familiares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miembros_dias_visita`
--

DROP TABLE IF EXISTS `miembros_dias_visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miembros_dias_visita` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembros_dias_visita`
--

LOCK TABLES `miembros_dias_visita` WRITE;
/*!40000 ALTER TABLE `miembros_dias_visita` DISABLE KEYS */;
INSERT INTO `miembros_dias_visita` VALUES (1,'Lunes'),(2,'Martes'),(3,'Miércoles'),(4,'Jueves'),(5,'Viernes'),(6,'Sábado'),(7,'Domingo');
/*!40000 ALTER TABLE `miembros_dias_visita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miembros_dones`
--

DROP TABLE IF EXISTS `miembros_dones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miembros_dones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dones_id` int NOT NULL,
  `miembros_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembros_dones`
--

LOCK TABLES `miembros_dones` WRITE;
/*!40000 ALTER TABLE `miembros_dones` DISABLE KEYS */;
INSERT INTO `miembros_dones` VALUES (1,1,1),(2,43,1),(3,43,2),(4,1,44),(5,2,44),(6,1,46),(7,2,46),(8,1,47),(9,2,47),(10,1,48),(11,2,48),(12,1,49),(13,1,50),(14,1,51),(15,2,51),(16,1,41),(18,1,52),(19,2,52),(20,1,53),(28,2,53);
/*!40000 ALTER TABLE `miembros_dones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miembros_estados`
--

DROP TABLE IF EXISTS `miembros_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miembros_estados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembros_estados`
--

LOCK TABLES `miembros_estados` WRITE;
/*!40000 ALTER TABLE `miembros_estados` DISABLE KEYS */;
INSERT INTO `miembros_estados` VALUES (1,'Activo'),(2,'Inactivo'),(3,'Observado'),(4,'Excluído');
/*!40000 ALTER TABLE `miembros_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miembros_estados_civil`
--

DROP TABLE IF EXISTS `miembros_estados_civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miembros_estados_civil` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembros_estados_civil`
--

LOCK TABLES `miembros_estados_civil` WRITE;
/*!40000 ALTER TABLE `miembros_estados_civil` DISABLE KEYS */;
INSERT INTO `miembros_estados_civil` VALUES (1,'Soltero'),(2,'Casado'),(3,'Viudo'),(4,'Divorciado'),(5,'Separado');
/*!40000 ALTER TABLE `miembros_estados_civil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miembros_estudios_eclesiasticos`
--

DROP TABLE IF EXISTS `miembros_estudios_eclesiasticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miembros_estudios_eclesiasticos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estudios_eclesiasticos_id` int NOT NULL,
  `miembros_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembros_estudios_eclesiasticos`
--

LOCK TABLES `miembros_estudios_eclesiasticos` WRITE;
/*!40000 ALTER TABLE `miembros_estudios_eclesiasticos` DISABLE KEYS */;
INSERT INTO `miembros_estudios_eclesiasticos` VALUES (1,1,1),(2,1,47),(3,2,47),(4,2,48),(5,1,49),(6,1,50),(7,1,51),(8,2,51),(9,1,52),(10,2,52),(11,1,53),(12,2,53);
/*!40000 ALTER TABLE `miembros_estudios_eclesiasticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miembros_estudios_seculares`
--

DROP TABLE IF EXISTS `miembros_estudios_seculares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miembros_estudios_seculares` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estudios_seculares_id` int NOT NULL,
  `miembros_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembros_estudios_seculares`
--

LOCK TABLES `miembros_estudios_seculares` WRITE;
/*!40000 ALTER TABLE `miembros_estudios_seculares` DISABLE KEYS */;
INSERT INTO `miembros_estudios_seculares` VALUES (1,1,1),(2,1,46),(3,2,46),(4,1,47),(5,2,47),(6,1,48),(7,2,48),(8,2,49),(9,1,49),(10,1,50),(11,1,51),(12,2,51),(13,1,52),(14,2,52),(15,1,53),(20,2,53);
/*!40000 ALTER TABLE `miembros_estudios_seculares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miembros_historial`
--

DROP TABLE IF EXISTS `miembros_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miembros_historial` (
  `id` int NOT NULL,
  `miembros_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `user_id_new` int DEFAULT NULL,
  `miembros_tipo_registro_id` int DEFAULT NULL,
  `miembros_tipo_registro_id_new` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembros_historial`
--

LOCK TABLES `miembros_historial` WRITE;
/*!40000 ALTER TABLE `miembros_historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `miembros_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miembros_horas_visita`
--

DROP TABLE IF EXISTS `miembros_horas_visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miembros_horas_visita` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hora` char(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembros_horas_visita`
--

LOCK TABLES `miembros_horas_visita` WRITE;
/*!40000 ALTER TABLE `miembros_horas_visita` DISABLE KEYS */;
INSERT INTO `miembros_horas_visita` VALUES (1,'6:00'),(2,'7:00');
/*!40000 ALTER TABLE `miembros_horas_visita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miembros_ministro_bautizmo`
--

DROP TABLE IF EXISTS `miembros_ministro_bautizmo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miembros_ministro_bautizmo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembros_ministro_bautizmo`
--

LOCK TABLES `miembros_ministro_bautizmo` WRITE;
/*!40000 ALTER TABLE `miembros_ministro_bautizmo` DISABLE KEYS */;
INSERT INTO `miembros_ministro_bautizmo` VALUES (1,'Ministro1'),(2,'Ministro2');
/*!40000 ALTER TABLE `miembros_ministro_bautizmo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miembros_sexo`
--

DROP TABLE IF EXISTS `miembros_sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miembros_sexo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembros_sexo`
--

LOCK TABLES `miembros_sexo` WRITE;
/*!40000 ALTER TABLE `miembros_sexo` DISABLE KEYS */;
INSERT INTO `miembros_sexo` VALUES (1,'Femenino'),(2,'Masculino');
/*!40000 ALTER TABLE `miembros_sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miembros_tipo_documento`
--

DROP TABLE IF EXISTS `miembros_tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miembros_tipo_documento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembros_tipo_documento`
--

LOCK TABLES `miembros_tipo_documento` WRITE;
/*!40000 ALTER TABLE `miembros_tipo_documento` DISABLE KEYS */;
INSERT INTO `miembros_tipo_documento` VALUES (1,'DNI'),(2,'PASAPORTE'),(3,'CE');
/*!40000 ALTER TABLE `miembros_tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miembros_tipo_registro`
--

DROP TABLE IF EXISTS `miembros_tipo_registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `miembros_tipo_registro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembros_tipo_registro`
--

LOCK TABLES `miembros_tipo_registro` WRITE;
/*!40000 ALTER TABLE `miembros_tipo_registro` DISABLE KEYS */;
INSERT INTO `miembros_tipo_registro` VALUES (1,'Miembro'),(2,'Creyente'),(3,'Otro');
/*!40000 ALTER TABLE `miembros_tipo_registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) NOT NULL,
  `apellido` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'Elvis1','Alcantara'),(2,'Manuel','Fuentes'),(3,'Juan','Perez'),(19,'Mariana','Canales'),(20,'nombre','apellido'),(21,'bbbc','bbbc'),(22,'awa','awa'),(23,'awa','awa'),(24,'awa','awa'),(25,'erer','ererer'),(26,'asdasd','asdasd'),(27,'lala','lala'),(28,'lala','lala');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `departamentos_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departamentos_id` (`departamentos_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `provincias_ibfk_1` FOREIGN KEY (`departamentos_id`) REFERENCES `departamentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'Chachapoyas',1),(2,'Bagua',1),(3,'Huaraz',2),(4,'Carhuaz',2),(5,'Abancay',3),(6,'Andahuaylas',3),(7,'Arequipa',4),(8,'Camaná',4);
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportes`
--

DROP TABLE IF EXISTS `reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reportes_tipo_id` int NOT NULL,
  `reportes_periodo_descripcion_id` int NOT NULL,
  `year` int NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `direccion` text NOT NULL,
  `reportes_estado_id` int DEFAULT NULL,
  `reportes_mes_id` int DEFAULT NULL,
  `reportes_trimestre_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes`
--

LOCK TABLES `reportes` WRITE;
/*!40000 ALTER TABLE `reportes` DISABLE KEYS */;
INSERT INTO `reportes` VALUES (1,3,7,2026,'Mariana','Loyola','12345672','lalal@fff.com','asdf',2,1,NULL),(2,2,15,2026,'Mariana','Loyola','12345672','lalal@fff.com','Una casa',4,NULL,1),(3,1,10,2039,'Carlos','Flores','123','laura@gamil.com','123ERRFD',5,2,NULL),(4,3,7,2345,'Flor','Gloria','12345672','LAURA@GAMIL.COM','123ERRFD',1,3,NULL),(5,3,9,2345,'Trina','Sánchez','12345672','lalal@fff.com','asdf',2,4,NULL),(6,2,14,2026,'Julio','Venegas','12345672','lalal@fff.com','aaaa',2,NULL,2),(7,2,15,2022,'Julio','Venegas','12345672','lalal@fff.com','asdf',2,NULL,3);
/*!40000 ALTER TABLE `reportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportes_decision`
--

DROP TABLE IF EXISTS `reportes_decision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes_decision` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes_decision`
--

LOCK TABLES `reportes_decision` WRITE;
/*!40000 ALTER TABLE `reportes_decision` DISABLE KEYS */;
INSERT INTO `reportes_decision` VALUES (1,'Sí'),(2,'No');
/*!40000 ALTER TABLE `reportes_decision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportes_estado`
--

DROP TABLE IF EXISTS `reportes_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes_estado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes_estado`
--

LOCK TABLES `reportes_estado` WRITE;
/*!40000 ALTER TABLE `reportes_estado` DISABLE KEYS */;
INSERT INTO `reportes_estado` VALUES (1,'Nuevo'),(2,'Por validar '),(3,'En proceso'),(4,'Validado'),(5,'Observado');
/*!40000 ALTER TABLE `reportes_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportes_mes`
--

DROP TABLE IF EXISTS `reportes_mes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes_mes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lealtad_id` int DEFAULT NULL,
  `relacion_familiar_id` int DEFAULT NULL,
  `liderazgo_id` int DEFAULT NULL,
  `iglesia_vision_id` int DEFAULT NULL,
  `valores_id` int DEFAULT NULL,
  `nro_reuniones` int DEFAULT NULL,
  `diezmos` int DEFAULT NULL,
  `tesorero_reporte_id` int DEFAULT NULL,
  `visita_supervisor_zonal_id` int DEFAULT NULL,
  `visita_supervisor_distrital_id` int DEFAULT NULL,
  `asistencia_reuniones_id` int DEFAULT NULL,
  `nro_sin_bautismo` int DEFAULT NULL,
  `nro_miembros_pacto` int DEFAULT NULL,
  `nro_agregados` int DEFAULT NULL,
  `nro_activos` int DEFAULT NULL,
  `nro_bautizo_agua` int DEFAULT NULL,
  `nro_bautizo_espiritu` int DEFAULT NULL,
  `nro_trasladados` int DEFAULT NULL,
  `nro_excluidos` int DEFAULT NULL,
  `nro_consolidados` int DEFAULT NULL,
  `nro_eslider` int DEFAULT NULL,
  `nro_discipulado` int DEFAULT NULL,
  `nro_liderazgo_local` int DEFAULT NULL,
  `nro_gdc` int DEFAULT NULL,
  `nro_gps` int DEFAULT NULL,
  `nro_campos_misioneros` int DEFAULT NULL,
  `nro_misiones` int DEFAULT NULL,
  `nro_iglesias_organizadas` int DEFAULT NULL,
  `nro_infantes` int DEFAULT NULL,
  `nro_adolescentes` int DEFAULT NULL,
  `nro_jovenes` int DEFAULT NULL,
  `nro_damas` int DEFAULT NULL,
  `nro_caballeros` int DEFAULT NULL,
  `nro_familias` int DEFAULT NULL,
  `nro_alumnos_escuela` int DEFAULT NULL,
  `nro_alumnos_setidp` int DEFAULT NULL,
  `incentivo_oracion_id` int DEFAULT NULL,
  `promedio_personas_oracion` int DEFAULT NULL,
  `incentivo_cosecha_id` int DEFAULT NULL,
  `promedio_personas_cosecha` int DEFAULT NULL,
  `incentivo_liderazgo_id` int DEFAULT NULL,
  `promedio_personas_liderazgo` int DEFAULT NULL,
  `incentivo_mayordomia_id` int DEFAULT NULL,
  `promedio_personas_mayordomia` int DEFAULT NULL,
  `incentivo_mision_social_id` int DEFAULT NULL,
  `promedio_personas_mision_social` int DEFAULT NULL,
  `comentario` text,
  `nro_pastores_potencia` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes_mes`
--

LOCK TABLES `reportes_mes` WRITE;
/*!40000 ALTER TABLE `reportes_mes` DISABLE KEYS */;
INSERT INTO `reportes_mes` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `reportes_mes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportes_periodo`
--

DROP TABLE IF EXISTS `reportes_periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes_periodo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes_periodo`
--

LOCK TABLES `reportes_periodo` WRITE;
/*!40000 ALTER TABLE `reportes_periodo` DISABLE KEYS */;
INSERT INTO `reportes_periodo` VALUES (1,'Mes'),(2,'Trimestre');
/*!40000 ALTER TABLE `reportes_periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportes_periodo_descripcion`
--

DROP TABLE IF EXISTS `reportes_periodo_descripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes_periodo_descripcion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `reportes_periodo_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes_periodo_descripcion`
--

LOCK TABLES `reportes_periodo_descripcion` WRITE;
/*!40000 ALTER TABLE `reportes_periodo_descripcion` DISABLE KEYS */;
INSERT INTO `reportes_periodo_descripcion` VALUES (1,'Enero',1),(2,'Febrero',1),(3,'Marzo',1),(4,'Abril',1),(5,'Mayo',1),(6,'Junio',1),(7,'Julio',1),(8,'Agosto',1),(9,'Septiembre',1),(10,'Octubre',1),(11,'Novienbre',1),(12,'Diciembre',1),(13,'I',2),(14,'II',2),(15,'III',2),(16,'VI',2);
/*!40000 ALTER TABLE `reportes_periodo_descripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportes_tipo`
--

DROP TABLE IF EXISTS `reportes_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes_tipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `reportes_periodo_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes_tipo`
--

LOCK TABLES `reportes_tipo` WRITE;
/*!40000 ALTER TABLE `reportes_tipo` DISABLE KEYS */;
INSERT INTO `reportes_tipo` VALUES (1,'Ministerio de Escuela Dominical',1),(2,'Pastor de Iglesia Local',2),(3,'Ministerio de Jóvenes',1),(4,'Ministerio de Adolescentes',2),(5,'Ministerio de Familia',2),(6,'Plantador de Campo o GPS',1),(7,'Pastor de la Misión',1),(8,'Ministro Licenciado',1),(9,'Ministerio de niños',2);
/*!40000 ALTER TABLE `reportes_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportes_trimestre`
--

DROP TABLE IF EXISTS `reportes_trimestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes_trimestre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `participacion_cena_id` int DEFAULT NULL,
  `adoracion_id` int DEFAULT NULL,
  `nro_miembros` int DEFAULT NULL,
  `nro_creyentes` int DEFAULT NULL,
  `nro_jovenes` int DEFAULT NULL,
  `nro_santificados` int DEFAULT NULL,
  `nro_bes` int DEFAULT NULL,
  `nro_convertidos_trimestre` int DEFAULT NULL,
  `nro_consolidados_trimestre` int DEFAULT NULL,
  `nro_discipulados_trimestre` int DEFAULT NULL,
  `nro_campamentos` int DEFAULT NULL,
  `nro_retiros` int DEFAULT NULL,
  `resultados` text,
  `nro_jovenes_gdc` int DEFAULT NULL,
  `promedio_cultos` int DEFAULT NULL,
  `estrategia_biblia` text,
  `nro_entrenados` int DEFAULT NULL,
  `nro_involucrados` int DEFAULT NULL,
  `mayordomia_id` int DEFAULT NULL,
  `nro_actividades_mision_social` int DEFAULT NULL,
  `nro_jovenes_mision_social` int DEFAULT NULL,
  `estrategias_evangelistas` text,
  `metas_id` int DEFAULT NULL,
  `razones` text,
  `nro_plantacion` int DEFAULT NULL,
  `nro_hedraima` int DEFAULT NULL,
  `actividades_distrital_id` int DEFAULT NULL,
  `actividades_local_id` int DEFAULT NULL,
  `nro_jovenes_escuela` int DEFAULT NULL,
  `nro_voluntarios` int DEFAULT NULL,
  `comentario` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes_trimestre`
--

LOCK TABLES `reportes_trimestre` WRITE;
/*!40000 ALTER TABLE `reportes_trimestre` DISABLE KEYS */;
INSERT INTO `reportes_trimestre` VALUES (1,1,2,1231,123123,123123,12313,1231,33,1231,23,1231,12313,'1231',123,1231,'1231',1231,12,2,12312,123123,'1231',2,'Porque sí',1231,12312,2,2,123,12,'Súper feliz'),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `reportes_trimestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador','Administrador'),(2,'Secretario','Secretario'),(3,'Tesorero','tesorero'),(4,'Pastor','Pastor');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tesoreria_auxiliar`
--

DROP TABLE IF EXISTS `tesoreria_auxiliar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tesoreria_auxiliar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tesoreria_auxiliar`
--

LOCK TABLES `tesoreria_auxiliar` WRITE;
/*!40000 ALTER TABLE `tesoreria_auxiliar` DISABLE KEYS */;
INSERT INTO `tesoreria_auxiliar` VALUES (1,'Diezmos'),(2,'Ofrenda'),(3,'Otros');
/*!40000 ALTER TABLE `tesoreria_auxiliar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tesoreria_cuenta`
--

DROP TABLE IF EXISTS `tesoreria_cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tesoreria_cuenta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) NOT NULL,
  `tipo_cuenta` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tesoreria_cuenta`
--

LOCK TABLES `tesoreria_cuenta` WRITE;
/*!40000 ALTER TABLE `tesoreria_cuenta` DISABLE KEYS */;
INSERT INTO `tesoreria_cuenta` VALUES (1,'10 - CAJA','CI'),(2,'70 - INGRESOS POR DIEZMOS Y OFRENDAS','CI'),(3,'90 - DISTRIBUCIÓN DE DIEZMOS Y OFRENDAS','CE'),(4,'91 - GASTOS DE LA IGLESIA LOCAL','CE');
/*!40000 ALTER TABLE `tesoreria_cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tesoreria_cuenta_egreso`
--

DROP TABLE IF EXISTS `tesoreria_cuenta_egreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tesoreria_cuenta_egreso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cuenta` varchar(60) NOT NULL,
  `subcuenta` varchar(60) NOT NULL,
  `descripcion` varchar(60) NOT NULL,
  `obligatorio` char(4) NOT NULL,
  `calculo_sistema` char(4) NOT NULL,
  `estado` char(8) NOT NULL,
  `comentario` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tesoreria_cuenta_egreso`
--

LOCK TABLES `tesoreria_cuenta_egreso` WRITE;
/*!40000 ALTER TABLE `tesoreria_cuenta_egreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `tesoreria_cuenta_egreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tesoreria_cuenta_ingreso`
--

DROP TABLE IF EXISTS `tesoreria_cuenta_ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tesoreria_cuenta_ingreso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tesoreria_cuenta_id` int NOT NULL,
  `subcuenta` varchar(60) NOT NULL,
  `descripcion` varchar(60) NOT NULL,
  `obligatorio` char(4) NOT NULL,
  `tesoreria_auxiliar_id` int DEFAULT NULL,
  `estado` char(8) NOT NULL,
  `comentario` varchar(60) DEFAULT NULL,
  `miembro_requerido` char(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tesoreria_cuenta_ingreso`
--

LOCK TABLES `tesoreria_cuenta_ingreso` WRITE;
/*!40000 ALTER TABLE `tesoreria_cuenta_ingreso` DISABLE KEYS */;
INSERT INTO `tesoreria_cuenta_ingreso` VALUES (1,1,'1001','Saldo anterior en Caja','Sí',NULL,'Activo',NULL,'No'),(2,2,'7001','Diezmos ingresados a la iglesia local','Sí',1,'Activo',NULL,'Sí');
/*!40000 ALTER TABLE `tesoreria_cuenta_ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tesoreria_detalle_egreso_diario`
--

DROP TABLE IF EXISTS `tesoreria_detalle_egreso_diario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tesoreria_detalle_egreso_diario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tesoreria_informe_id` int NOT NULL,
  `tesoreria_egreso_diario_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tesoreria_detalle_egreso_diario`
--

LOCK TABLES `tesoreria_detalle_egreso_diario` WRITE;
/*!40000 ALTER TABLE `tesoreria_detalle_egreso_diario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tesoreria_detalle_egreso_diario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tesoreria_detalle_ingreso_diario`
--

DROP TABLE IF EXISTS `tesoreria_detalle_ingreso_diario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tesoreria_detalle_ingreso_diario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tesoreria_informe_id` int NOT NULL,
  `tesoreria_ingreso_diario_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tesoreria_detalle_ingreso_diario`
--

LOCK TABLES `tesoreria_detalle_ingreso_diario` WRITE;
/*!40000 ALTER TABLE `tesoreria_detalle_ingreso_diario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tesoreria_detalle_ingreso_diario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tesoreria_egreso_diario`
--

DROP TABLE IF EXISTS `tesoreria_egreso_diario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tesoreria_egreso_diario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tesoreria_cuenta_egreso_id` int NOT NULL,
  `importe` decimal(10,2) NOT NULL,
  `descripcion` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tesoreria_egreso_diario`
--

LOCK TABLES `tesoreria_egreso_diario` WRITE;
/*!40000 ALTER TABLE `tesoreria_egreso_diario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tesoreria_egreso_diario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tesoreria_informe`
--

DROP TABLE IF EXISTS `tesoreria_informe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tesoreria_informe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periodo` date NOT NULL,
  `estado` varchar(20) NOT NULL,
  `total_enviado` decimal(10,2) NOT NULL,
  `banco` varchar(45) NOT NULL,
  `nro_operacion` varchar(45) NOT NULL,
  `fecha_operacion` date NOT NULL,
  `importe_operacion` decimal(10,2) NOT NULL,
  `nro_recibo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tesoreria_informe`
--

LOCK TABLES `tesoreria_informe` WRITE;
/*!40000 ALTER TABLE `tesoreria_informe` DISABLE KEYS */;
/*!40000 ALTER TABLE `tesoreria_informe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tesoreria_ingreso_diario`
--

DROP TABLE IF EXISTS `tesoreria_ingreso_diario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tesoreria_ingreso_diario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tesoreria_cuenta_ingreso_id` int NOT NULL,
  `miembros_id` int DEFAULT NULL,
  `importe` decimal(10,2) NOT NULL,
  `descripcion` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tesoreria_ingreso_diario`
--

LOCK TABLES `tesoreria_ingreso_diario` WRITE;
/*!40000 ALTER TABLE `tesoreria_ingreso_diario` DISABLE KEYS */;
INSERT INTO `tesoreria_ingreso_diario` VALUES (1,1,1,500.00,NULL);
/*!40000 ALTER TABLE `tesoreria_ingreso_diario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(150) NOT NULL,
  `perfil_id` int NOT NULL,
  `rol_id` int NOT NULL,
  `estado_id` int NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `distritos_cogop_id` int DEFAULT NULL,
  `iglesia_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'elvis','$2a$12$FcwEz5F37lO89ekX7VLB2.sxbEgJFl0uiw0ft1B0yi0i0dIjrQpba',1,1,1,'84fad039-7e72-4d3f-ab81-4dc6bbee9845.png',1,4),(2,'manuel','$2a$12$FcwEz5F37lO89ekX7VLB2.sxbEgJFl0uiw0ft1B0yi0i0dIjrQpba',2,4,1,'',2,2),(3,'juan','$2a$12$FcwEz5F37lO89ekX7VLB2.sxbEgJFl0uiw0ft1B0yi0i0dIjrQpba',3,3,1,'',2,4),(20,'mariana','$2a$12$FcwEz5F37lO89ekX7VLB2.sxbEgJFl0uiw0ft1B0yi0i0dIjrQpba',19,2,1,'',1,4),(21,'nuevo','$2b$12$h3URa3q5k6LeWX8SQdK72OFVk0Tq1usJHXY98JTZVT6HS1/bX.VKa',20,1,3,'',NULL,NULL),(26,'aaaaaa','$2b$12$0RdFmJWFlXo6XJY6Ss/ch.cqfRJEiumCi99QLetnX4jlT7KdwfsjK',21,1,3,'',NULL,NULL),(29,'awa','$2b$12$2A.sGs6H/vRCTXlWNjksauTe3yMdY8lSVv3iP71dZ6ynIovwp/y1e',24,2,3,'',NULL,NULL),(30,'erer','$2b$12$MKw5KDEmeHmbiB9AKvMi6Ov7DCfweq6DMxXFXIcFOxm/By7BIf6Ay',25,2,3,'',2,1),(31,'asdasd','$2b$12$emglRH2OG8LDynsjY7StROP2UEfTOG5CO9J3WLXJDAuYKB/TX3zce',26,1,1,'',1,3);
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

-- Dump completed on 2024-11-20 19:30:14
