CREATE DATABASE  IF NOT EXISTS `musclesh_aclopation` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `musclesh_aclopation`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: musclesh_aclopation
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
-- Table structure for table `agrupacion`
--

DROP TABLE IF EXISTS `agrupacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agrupacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `categoria_id` int NOT NULL,
  `imagen` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` double NOT NULL,
  `precio_reducido` double NOT NULL,
  `precio_team` double NOT NULL,
  `precio_team_vip` double NOT NULL,
  `precio_familiar` double NOT NULL,
  `prioridad` int NOT NULL,
  `estado_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agrupacion`
--

LOCK TABLES `agrupacion` WRITE;
/*!40000 ALTER TABLE `agrupacion` DISABLE KEYS */;
INSERT INTO `agrupacion` VALUES (3,'Alpha + 100% Creatina','2024-11-15',1,'1731703994256.jpg',300,0,290,280,270,20,1);
/*!40000 ALTER TABLE `agrupacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agrupacion_imagen`
--

DROP TABLE IF EXISTS `agrupacion_imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agrupacion_imagen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agrupacion_id` int NOT NULL,
  `estado_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agrupacion_imagen`
--

LOCK TABLES `agrupacion_imagen` WRITE;
/*!40000 ALTER TABLE `agrupacion_imagen` DISABLE KEYS */;
/*!40000 ALTER TABLE `agrupacion_imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agrupacion_menu_sub`
--

DROP TABLE IF EXISTS `agrupacion_menu_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agrupacion_menu_sub` (
  `id` int NOT NULL AUTO_INCREMENT,
  `agrupacion_id` int NOT NULL,
  `menu_sub_id` int NOT NULL,
  `categoria_id` int NOT NULL,
  `recomendado_producto_menu_sub_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agrupacion_menu_sub`
--

LOCK TABLES `agrupacion_menu_sub` WRITE;
/*!40000 ALTER TABLE `agrupacion_menu_sub` DISABLE KEYS */;
INSERT INTO `agrupacion_menu_sub` VALUES (167,3,4,9,2);
/*!40000 ALTER TABLE `agrupacion_menu_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agrupacion_objetivo`
--

DROP TABLE IF EXISTS `agrupacion_objetivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agrupacion_objetivo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `agrupacion_id` int NOT NULL,
  `objetivo_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agrupacion_objetivo`
--

LOCK TABLES `agrupacion_objetivo` WRITE;
/*!40000 ALTER TABLE `agrupacion_objetivo` DISABLE KEYS */;
INSERT INTO `agrupacion_objetivo` VALUES (41,3,3),(42,3,4),(43,3,5);
/*!40000 ALTER TABLE `agrupacion_objetivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imagen` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `titulo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES (1,'1731679747420.jpg','articulo-1','¿Por Qué Elegir los Productos de ABE? Ventajas y Beneficios','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras id nunc viverra, tristique nibh ut, convallis erat. Donec sed consectetur sapien. Nunc accumsan ex sit amet libero luctus, eget suscipit risus consequat. Nam ut lectus tincidunt, dictum justo eu, aliquet ex. Maecenas felis purus, aliquet quis dictum eu, viverra at purus. Ut tincidunt arcu quis quam laoreet suscipit. Sed dapibus cursus nibh a luctus.',1),(2,'1731679764748.jpg','articulo-2','Energía al Máximo: Todo lo que Necesitas Saber sobre las Bebidas BODY FUEL','Descripcion para el Articulo 2',1),(3,'1731679623466.jpg','articulo-3','Colágeno Beauty Glow: El Secreto para una Piel Radiante y Saludable','Descripcion para el Articulo 3',1),(4,'1731679630114.jpg','articulo-4','Galletas Critical Cookie: El Snack Perfecto para tu Energía y Bienestar','Descripcion para el Articulo 4',1),(5,'1731679637747.jpg','articulo-5','ISO-XP: La Fórmula Avanzada para Maximizar tu Recuperación Muscular','<p>Descripcion para el Articulo 5</p>',1),(6,'1731679645119.jpg','articulo-6','¿Por Qué Kevin Levrone Sigue Siendo una Referencia para Atletas y Culturistas?','<p>Descripcion <strong>para el Articulo 6</strong></p>',1),(7,'1731799961570.jpg','los-mejores-suplementos-para-aumentar-tu-energia-y-rendimiento','Los Mejores Suplementos para Aumentar tu Energía y Rendimiento','<p>a</p>',4),(8,'1731800308956.jpg','suplementos-para-la-recuperacion-muscular-cual-es-el-mejor','Suplementos para la Recuperación Muscular: ¿Cuál es el Mejor?','<p>sdsd</p>',3);
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulo_comentario`
--

DROP TABLE IF EXISTS `articulo_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulo_comentario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `articulo_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `comentario` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_id` int NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo_comentario`
--

LOCK TABLES `articulo_comentario` WRITE;
/*!40000 ALTER TABLE `articulo_comentario` DISABLE KEYS */;
INSERT INTO `articulo_comentario` VALUES (1,1,1,'Comentario',1,'2024-05-31 00:00:00'),(2,2,1,'Comentario',1,'2024-05-31 00:00:00'),(3,3,1,'Comentario',1,'2024-05-31 00:00:00'),(4,4,1,'Comentario',1,'2024-05-31 00:00:00'),(5,5,1,'Comentario',1,'2024-05-31 00:00:00'),(6,6,1,'Comentario',1,'2024-05-31 00:00:00'),(7,1,1,'Comentario',1,'2024-05-31 00:00:00'),(8,2,1,'Comentario',1,'2024-05-31 00:00:00'),(9,5,1,'Este es un comentario para el articulo 5',1,'2024-05-31 00:00:00'),(10,3,1,'Este es un comentario para el articulo 3',1,'2024-05-31 00:00:00'),(11,3,1,'Este es otro comentario para el articulo 3',1,'2024-05-31 00:00:00'),(12,1,1,'Comentario nuevo',1,'2024-05-31 00:00:00'),(13,2,1,'Este es un comentarios para este artículo',1,'2024-05-31 00:00:00');
/*!40000 ALTER TABLE `articulo_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_id` int NOT NULL,
  `tipo_dispositivo` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (1,'1731696621977.jpg',1,'laptop_pc'),(2,'1731696628162.jpg',1,'laptop_pc'),(3,'1731696632965.jpg',1,'laptop_pc'),(4,'1731696639722.jpg',1,'laptop_pc'),(5,'1731804161016.jpg',1,'movil_tablet'),(6,'1731804167458.jpg',1,'movil_tablet'),(7,'1731804173013.jpg',1,'movil_tablet'),(8,'1731804183364.jpg',1,'movil_tablet'),(10,'1731806058725.jpg',3,'movil_tablet');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner_menu_sub`
--

DROP TABLE IF EXISTS `banner_menu_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banner_menu_sub` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imagen` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_sub_id` int NOT NULL,
  `tipo_dispositivo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_menu_sub`
--

LOCK TABLES `banner_menu_sub` WRITE;
/*!40000 ALTER TABLE `banner_menu_sub` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner_menu_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobante_pago`
--

DROP TABLE IF EXISTS `comprobante_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprobante_pago` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobante_pago`
--

LOCK TABLES `comprobante_pago` WRITE;
/*!40000 ALTER TABLE `comprobante_pago` DISABLE KEYS */;
INSERT INTO `comprobante_pago` VALUES (1,'Boleta'),(2,'Factura');
/*!40000 ALTER TABLE `comprobante_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupon`
--

DROP TABLE IF EXISTS `cupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` double DEFAULT NULL,
  `valor_porcentual` int DEFAULT NULL,
  `costo_minimo` double NOT NULL,
  `estado_id` int NOT NULL,
  `cupon_categoria_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupon`
--

LOCK TABLES `cupon` WRITE;
/*!40000 ALTER TABLE `cupon` DISABLE KEYS */;
INSERT INTO `cupon` VALUES (1,'Elvis-123',NULL,20,0,3,1),(2,'JuanXD',20,NULL,0,3,1),(3,'Mari',NULL,28,0,1,1),(4,'Plantado',NULL,30,0,1,1);
/*!40000 ALTER TABLE `cupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupon_categoria`
--

DROP TABLE IF EXISTS `cupon_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupon_categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupon_categoria`
--

LOCK TABLES `cupon_categoria` WRITE;
/*!40000 ALTER TABLE `cupon_categoria` DISABLE KEYS */;
INSERT INTO `cupon_categoria` VALUES (1,'Primera compra'),(2,'Ilimitado'),(3,'Segunda Compra'),(4,'Tercera Compra');
/*!40000 ALTER TABLE `cupon_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupon_pedidos`
--

DROP TABLE IF EXISTS `cupon_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupon_pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cupon_id` int NOT NULL,
  `pedido_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupon_pedidos`
--

LOCK TABLES `cupon_pedidos` WRITE;
/*!40000 ALTER TABLE `cupon_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupon_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles`
--

DROP TABLE IF EXISTS `detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles`
--

LOCK TABLES `detalles` WRITE;
/*!40000 ALTER TABLE `detalles` DISABLE KEYS */;
INSERT INTO `detalles` VALUES (1,'300 GR | 120 SERV'),(2,'500 GR | 200 SERV'),(3,'1 KG | 400 SERV'),(4,'300 GR | 60 SERV'),(5,'1 KG | 200 SERV'),(6,'900 GR | 30 SERV'),(7,'2 KG | 66 SERV'),(8,'Vainilla'),(9,'Chocolate'),(10,'195 GR. | 31 SERV'),(11,'390 GR. | 62 SERV'),(12,'1KG | 40 SERV'),(13,'1.8 KG | 72 SERV'),(14,'450 GR. | 32 SERV'),(15,'1.4 KG | 100 SERV'),(16,'000000'),(17,'FF0000'),(18,'S'),(19,'M'),(20,'L'),(21,'390 GR.'),(22,'Fruit Burst'),(23,'Icy Blue Raz'),(24,'Lemon & Lime'),(25,'Naranja'),(26,'Mora'),(27,'Banana Delight'),(28,'Fudge Brownie'),(29,'White Chocolate'),(30,'Strawberries & Cream'),(31,'Vainilla Ice Cream'),(32,'Salted Caramel'),(33,'Chocolate Chip'),(34,'Double Chocolate'),(35,'White Chocolate & Raspberry'),(36,'White Chocolate Caramel'),(37,'Milk Chocolate Caramel'),(38,'Milk Chocolate Peanut'),(39,'Gooey Chocolate'),(40,'White Choco Peanut'),(41,'Unflavored'),(42,'Fruit Punch'),(43,'1.5 KG | 50 SERV.'),(44,'385 GR. | 44 SERV.'),(45,'500 ML');
/*!40000 ALTER TABLE `detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Activo'),(2,'Inactivo'),(3,'Papelera'),(4,'Archivado');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_articulo_producto`
--

DROP TABLE IF EXISTS `estado_articulo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_articulo_producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_articulo_producto`
--

LOCK TABLES `estado_articulo_producto` WRITE;
/*!40000 ALTER TABLE `estado_articulo_producto` DISABLE KEYS */;
INSERT INTO `estado_articulo_producto` VALUES (1,'Activo'),(2,'Inactivo'),(3,'Borrador'),(4,'Papelera'),(5,'Archivado');
/*!40000 ALTER TABLE `estado_articulo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_pedido`
--

DROP TABLE IF EXISTS `estado_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_pedido` (
  `id` int NOT NULL,
  `nombre` char(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_pedido`
--

LOCK TABLES `estado_pedido` WRITE;
/*!40000 ALTER TABLE `estado_pedido` DISABLE KEYS */;
INSERT INTO `estado_pedido` VALUES (1,'Pendiente de Pago'),(2,'Procesando'),(3,'En Camino'),(4,'Fallido'),(5,'Completado'),(6,'Cancelado'),(7,'Reembolsado'),(8,'Papelera');
/*!40000 ALTER TABLE `estado_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `footer`
--

DROP TABLE IF EXISTS `footer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `footer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `footer`
--

LOCK TABLES `footer` WRITE;
/*!40000 ALTER TABLE `footer` DISABLE KEYS */;
INSERT INTO `footer` VALUES (1,'Muscle Shop 2024. Todos los derechos reservados');
/*!40000 ALTER TABLE `footer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `header`
--

DROP TABLE IF EXISTS `header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `header`
--

LOCK TABLES `header` WRITE;
/*!40000 ALTER TABLE `header` DISABLE KEYS */;
INSERT INTO `header` VALUES (1,'Envío gratis por compras mayores a S/200'),(2,'WhatsApp: 924 698 077'),(3,'3 cuotas sin intereses con Diners, BBVA y BCP'),(4,'Envío a nivel nacional'),(6,'Las mejores ofertas en proteínas');
/*!40000 ALTER TABLE `header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logos`
--

DROP TABLE IF EXISTS `logos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `header` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registro` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `boleta` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logos`
--

LOCK TABLES `logos` WRITE;
/*!40000 ALTER TABLE `logos` DISABLE KEYS */;
INSERT INTO `logos` VALUES (1,'logo-muscleshop.png','logo1.png','logo2.png','muscle-shop.png','muscle-shop.png','logo-muscleshop 1.png',1);
/*!40000 ALTER TABLE `logos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Applied Nutrition','applied-nutrition'),(2,'Kevin Levrone','kevin-levrone'),(3,'Biotech Usa','biotech-usa'),(4,'Beauty Glow','beauty-glow'),(5,'Blow Up!','blow-up'),(6,'Muscle Shop','muscle-shop');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketplace`
--

DROP TABLE IF EXISTS `marketplace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketplace` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `estado_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketplace`
--

LOCK TABLES `marketplace` WRITE;
/*!40000 ALTER TABLE `marketplace` DISABLE KEYS */;
INSERT INTO `marketplace` VALUES (1,'Falabella','1731805302334.png','https://www.youtube.com',1),(2,'Ripley','1731805308644.png','https://www.google.com',1),(3,'Rappi','1731805315668.png','https://www.youtube.com',1),(4,'Mercado Libre','1731805322239.png','https://www.google.com',1),(5,'Juntoz','1731805327404.png','https://www.youtube.com',1),(6,'MiFarma','1731805334604.png','https://www.google.com',1),(7,'Inkafarma','1731805339285.png','https://www.youtube.com',1),(8,'Diners Club','1731805345284.png','https://www.google.com',1),(9,'Shopstar','1731805350472.png','https://www.youtube.com',1);
/*!40000 ALTER TABLE `marketplace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_id` int NOT NULL,
  `imagen` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_UNIQUE` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (2,'Suplementos','suplementos',1,'1731680139919.jpg','Descripción para Sumplementos'),(3,'Ropa','ropa',1,'1731680147471.jpg','Descripción para Ropa'),(4,'Accesorios','accesorios',1,'1731680152316.jpg','Descripción para Accesorios'),(5,'Objetivos','objetivos',2,'1731680158190.jpg','Descripcion para Objetivos'),(7,'Blogs','blogs',1,'1731680214403.jpg','Descripcion para Blog');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_sub`
--

DROP TABLE IF EXISTS `menu_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_sub` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_id` int DEFAULT NULL,
  `estado_id` int DEFAULT NULL,
  `imagen` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_sub`
--

LOCK TABLES `menu_sub` WRITE;
/*!40000 ALTER TABLE `menu_sub` DISABLE KEYS */;
INSERT INTO `menu_sub` VALUES (2,'Proteínas','proteinas',2,1,'1731808453061.jpg'),(3,'Pre/Intra/Pro Workout','preintrapro-workout',2,1,'1731808457867.jpg'),(4,'Aminoácidos','aminoacidos',2,1,'1731808463059.jpg'),(5,'Otros','otros',2,1,'1731808470956.jpg'),(6,'Colágenos','colagenos',2,2,'1731808476566.jpg'),(7,'Test-Brooster','test-brooster',2,2,'1731808482142.jpg'),(8,'Termogénico','termogenico',2,2,'1731808487088.jpg'),(9,'Food y Snacks','food-y-snacks',2,2,'1731808493552.jpg'),(23,'Hombre','hombre',3,1,'1731808505297.jpg'),(24,'Mujer','mujer',3,1,'1731808511224.jpg'),(25,'Marcas 2','marcas-2',3,1,'1731808516105.jpg'),(50,'Rehidratantes','rehidratantes',2,2,'1731808521084.jpg'),(84,'Shakers','shakers',4,1,'1731808526844.jpg'),(86,'Toallas','toallas',4,1,'1731808532474.jpg'),(89,'Gorras y Beanies','gorras-y-beanies',4,1,'1731808541577.jpg'),(90,'Prepararse antes de entrenar','prepararse-antes-de-entrenar',5,1,'1731670817972.jpg'),(91,'Durante el entrenamiento','durante-el-entrenamiento',5,1,'1731679491869.jpg'),(92,'Recuperación','recuperacion',5,1,'1731679497138.jpg'),(93,'Ganancia de Peso','ganancia-de-peso',5,1,'1731679507251.jpg'),(94,'Fuerza y Tonificación','fuerza-y-tonificacion',5,1,'1731679521019.jpg'),(95,'Aumento de consumo de proteína','aumento-de-consumo-de-proteina',5,1,'1731679528002.jpg'),(96,'Aumentar energía','aumentar-energia',5,1,'1731679533419.jpg'),(97,'Mejorar rendimiento','mejorar-rendimiento',5,1,'1731679540283.jpg'),(98,'Salud y Bienestar','salud-y-bienestar',5,1,'1731679548483.jpg'),(99,'Durante el día','durante-el-dia',5,1,'1731679554707.jpg'),(101,'asd','asd',2,1,'1731806676770.jpg');
/*!40000 ALTER TABLE `menu_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_pago`
--

DROP TABLE IF EXISTS `metodo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_pago` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pago`
--

LOCK TABLES `metodo_pago` WRITE;
/*!40000 ALTER TABLE `metodo_pago` DISABLE KEYS */;
INSERT INTO `metodo_pago` VALUES (1,'Visa'),(2,'Yape');
/*!40000 ALTER TABLE `metodo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_pago_exclusiones`
--

DROP TABLE IF EXISTS `metodo_pago_exclusiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_pago_exclusiones` (
  `id` int NOT NULL,
  `metodo_pago_id` int NOT NULL,
  `rol_perfil_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pago_exclusiones`
--

LOCK TABLES `metodo_pago_exclusiones` WRITE;
/*!40000 ALTER TABLE `metodo_pago_exclusiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `metodo_pago_exclusiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objetivos`
--

DROP TABLE IF EXISTS `objetivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objetivos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objetivos`
--

LOCK TABLES `objetivos` WRITE;
/*!40000 ALTER TABLE `objetivos` DISABLE KEYS */;
INSERT INTO `objetivos` VALUES (1,'Prepararse antes de entrenar','prepararse-antes-de-entrenar'),(2,'Durante el entrenamiento','durante-el-entrenamiento'),(3,'Recuperación','recuperacion'),(4,'Ganancia de Peso','ganancia-de-peso'),(5,'Fuerza y Tonificación','fuerza-y-tonificacion'),(6,'Aumento de consumo de proteína','aumento-de-consumo-de-proteina'),(7,'Aumentar energía','aumentar-energia'),(8,'Mejorar rendimiento','mejorar-rendimiento'),(9,'Salud y Bienestar','salud-y-bienestar'),(10,'Durante el día','durante-el-dia');
/*!40000 ALTER TABLE `objetivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_producto_comentario`
--

DROP TABLE IF EXISTS `pedido_producto_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_producto_comentario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pedidos_productos_id` int NOT NULL,
  `comentario` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_producto_comentario`
--

LOCK TABLES `pedido_producto_comentario` WRITE;
/*!40000 ALTER TABLE `pedido_producto_comentario` DISABLE KEYS */;
INSERT INTO `pedido_producto_comentario` VALUES (1,1,'Me gustó el producto.',1),(4,6,'Me agrada, seguiría comprando más.',1),(5,5,'Aún esperaré a que me llegue.',1);
/*!40000 ALTER TABLE `pedido_producto_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `total_costo` double DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  `metodo_pago_id` int DEFAULT NULL,
  `comprobante_id` int DEFAULT NULL,
  `ubigeo_id` int DEFAULT NULL,
  `num_pedido` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado_id` int DEFAULT NULL,
  `usuario_direccion_id` int DEFAULT NULL,
  `razon_social` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ruc` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion_facturacion` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `costo_envio_historico` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'2024-03-15 14:59:30',750,3,1,2,1,'11711550975385',3,NULL,NULL,NULL,NULL,NULL),(4,'2024-03-15 15:07:01',600,2,2,3,1,'11711550975387',3,NULL,NULL,NULL,NULL,NULL),(5,'2024-03-18 09:08:39',1500,2,1,1,1,'11711550975387',3,NULL,NULL,NULL,NULL,NULL),(7,'2024-03-18 18:06:37',500,1,2,1,1,'11711550975389',3,NULL,NULL,NULL,NULL,NULL),(8,'2024-03-18 18:14:37',500,3,1,1,1,'11711550975389',3,NULL,NULL,NULL,NULL,NULL),(9,'2024-03-19 09:07:05',1000,3,1,2,1,'11711550975382',3,NULL,NULL,NULL,NULL,NULL),(35,'2024-03-27 09:49:35',560,1,1,1,6,'11711550975388',3,NULL,NULL,NULL,NULL,NULL),(38,'2024-03-27 10:46:13',510,1,2,1,1,'11711554373032',3,NULL,NULL,NULL,NULL,NULL),(41,'2024-03-27 11:15:48',310,19,1,2,1,'191711556148445',3,NULL,NULL,NULL,NULL,NULL),(47,'2024-03-28 09:55:36',340,5,1,1,4,'51711637735824',3,NULL,NULL,NULL,NULL,NULL),(58,'2024-03-28 12:06:09',300,5,2,1,1,'11711550975385',3,NULL,NULL,NULL,NULL,NULL),(65,'2024-03-29 11:51:34',510,1,1,1,1,'11711731093731',3,NULL,NULL,NULL,NULL,NULL),(69,'2024-04-01 10:49:30',320,5,2,1,2,'51711986569793',3,NULL,NULL,NULL,NULL,NULL),(70,'2024-04-01 11:07:53',310,5,2,1,1,'51711987673478',3,NULL,NULL,NULL,NULL,NULL),(72,'2024-04-01 20:27:47',710,5,1,1,1,'51712021267003',3,NULL,NULL,NULL,NULL,NULL),(73,'2024-04-02 00:15:14',610,5,1,1,1,'51712034914394',3,NULL,NULL,NULL,NULL,NULL),(74,'2024-04-02 00:46:26',360,1,2,1,1,'11712036786472',3,NULL,NULL,NULL,NULL,NULL),(75,'2024-04-03 11:09:50',350,5,1,1,4,'51712160590358',3,NULL,NULL,NULL,NULL,NULL),(76,'2024-04-06 12:32:35',440,5,2,1,4,'51712424754533',3,NULL,NULL,NULL,NULL,NULL),(78,'2024-05-29 17:31:14',340,23,2,1,4,'231717021873508',3,NULL,NULL,NULL,NULL,NULL),(79,'2024-05-31 12:17:36',340,22,2,1,4,'221717175856497',3,NULL,NULL,NULL,NULL,NULL),(80,'2024-05-31 12:24:22',320,22,2,1,2,'221717176262000',3,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_estados_cambios`
--

DROP TABLE IF EXISTS `pedidos_estados_cambios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_estados_cambios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pedido_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `estado_inicial_id` int NOT NULL,
  `estado_cambiado_id` int NOT NULL,
  `fecha` datetime NOT NULL,
  `tipoCambio` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_estados_cambios`
--

LOCK TABLES `pedidos_estados_cambios` WRITE;
/*!40000 ALTER TABLE `pedidos_estados_cambios` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_estados_cambios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_productos`
--

DROP TABLE IF EXISTS `pedidos_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pedidos_id` int DEFAULT NULL,
  `productos_id` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `producto_propiedades_detalles_id` int DEFAULT NULL,
  `precio_unitario_historico` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_productos`
--

LOCK TABLES `pedidos_productos` WRITE;
/*!40000 ALTER TABLE `pedidos_productos` DISABLE KEYS */;
INSERT INTO `pedidos_productos` VALUES (1,1,2,3,750,5,NULL),(5,4,11,2,600,19,NULL),(6,5,2,5,1500,5,NULL),(9,7,3,2,500,11,NULL),(10,8,1,2,500,1,NULL),(11,9,2,2,500,4,NULL),(12,9,3,2,500,12,NULL),(38,35,6,2,500,91,NULL),(41,38,6,2,500,91,NULL),(44,41,1,1,300,1,NULL),(50,47,6,1,300,91,NULL),(61,58,1,1,300,1,NULL),(68,65,6,2,500,91,NULL),(72,69,6,1,300,91,NULL),(73,70,6,1,300,91,NULL),(75,72,1,2,700,1,NULL),(76,73,1,2,600,2,NULL),(77,74,1,1,350,1,NULL),(78,75,1,1,310,1,NULL),(79,76,1,1,400,1,NULL),(81,78,7,1,300,13,NULL),(82,79,11,1,300,97,NULL),(83,80,3,1,300,11,NULL);
/*!40000 ALTER TABLE `pedidos_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `popup`
--

DROP TABLE IF EXISTS `popup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `popup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imagen` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `popup`
--

LOCK TABLES `popup` WRITE;
/*!40000 ALTER TABLE `popup` DISABLE KEYS */;
INSERT INTO `popup` VALUES (1,'img-popup.png','SUBSCRIBETE CON NOSOTROS Y OBTÉN UN 10% DE DESCUENTO','Descripción del Popup');
/*!40000 ALTER TABLE `popup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(2500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_id` int NOT NULL,
  `fecha` date NOT NULL,
  `mostrar` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prioridad` int NOT NULL,
  `marcas_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'100% CREATINE MONOHYDRATE','1731667749573.jpg','100-creatine-monohydrate','Descubre la potencia de la Creatina Monohidratada 100% de Kevin Levrone, una fórmula pura y de alta calidad diseñada para llevar tu rendimiento al siguiente nivel. Ideal para atletas y entusiastas del fitness, este suplemento potencia la fuerza muscular, mejora la resistencia y acelera la recuperación post-entrenamiento. \r\n\r\nPharmaceutical Grade - Laboratory Tested - Doping Free del Producto',1,'2023-05-25','si',30,2),(2,'100% L-GLUTAMINE ','1731670048930.jpg','100-lglutamine','Maximiza tu recuperación y bienestar con la Glutamina 100% de Kevin Levrone. Esta fórmula premium, pura y sin aditivos, está diseñada para apoyar tus objetivos de rendimiento y salud. La glutamina es un aminoácido esencial que juega un papel crucial en la reparación muscular, la salud intestinal y el fortalecimiento del sistema inmunológico.',1,'2023-05-25','si',2,2),(3,'LEVROWHEY SUPREME ','1731670212523.jpg','levrowey-supreme','Eleva tu nutrición deportiva con LevroWhey Supreme de Kevin Levrone, una proteína de suero de leche de alta calidad formulada para maximizar tus resultados. Este suplemento premium ofrece una mezcla perfecta de proteínas de rápida absorción, ideal para apoyar el crecimiento muscular, la recuperación post-entrenamiento y la síntesis de proteínas',1,'2023-05-25','si',3,2),(4,'LEVROISO WHEY','1731671818962.jpg','levroiso-wey','Optimiza tu rendimiento con LevroIso Whey Supreme de Kevin Levrone, una proteína de suero aislada de alta pureza diseñada para los atletas más exigentes. Este suplemento premium proporciona una fuente de proteínas de rápida absorción, con un contenido mínimo de grasas y carbohidratos, ideal para apoyar el crecimiento muscular y la recuperación.',1,'2023-05-25','si',4,2),(6,'SHAABOOM PUMP','1731421256664.jpg','shaaboom-pump','Descripción del Producto',1,'2023-05-25','si',5,2),(7,'EAA ','1731672125029.jpg','eaa','Optimiza tu nutrición y rendimiento con EAA de Kevin Levrone, un suplemento de aminoácidos esenciales de alta calidad diseñado para apoyar el crecimiento muscular y la recuperación. Esta fórmula avanzada proporciona los nueve aminoácidos esenciales que tu cuerpo no puede producir por sí mismo, asegurando una síntesis de proteínas eficiente y una recuperación rápida post-entrenamiento.',1,'2023-05-25','si',6,1),(8,'ANABOLIC ISO WHEY','1731672160046.jpg','anabolic-iso','Desata tu potencial con Anabolic Iso Whey de Kevin Levrone, una proteína de suero aislada de la más alta calidad diseñada para impulsar tu desarrollo muscular y maximizar tus resultados. Esta fórmula avanzada ofrece una fuente pura de proteína de suero aislada, prácticamente libre de grasas y carbohidratos, para una absorción ultra rápida y una entrega óptima de aminoácidos a tus músculos.\r\n',1,'2023-05-25','si',7,1),(9,'ISO-XP ','1731672480445.jpg','iso-xp','\"ISO-XP es un suplemento rico en proteínas con edulcorante y, con diferencia, el aislado de proteína de suero más limpio y de mayor calidad disponible, con 22.5 gr. proteína por ración de 25 gr. ISO-XP no tiene soja añadida y utiliza lecitina de girasol como emulsionante.\r\nISO-XP es ideal para cualquiera que busque aumentar la ingesta diaria de proteínas sin grasas, carbohidratos ni azúcares adicionales. ISO-XP debe mezclarse con agua o leche desnatada para una fácil mezcla y un excelente sabor. \"',1,'2023-05-25','si',8,1),(11,'BCAA AMINO HYDRATE','1731672841107.jpg','bcaa-amino-hydrate','\"BCAA Amino Hydrate es la mezcla de bebidas intraentrenamiento y recuperación sin azúcar que todos los atletas, culturistas, powerliferts, boxeadores y personas que se mantienen en forma en general deben consumir durante cada entrenamiento.\r\n\r\nBCAA Amino Hydrate fue formulado para brindar cantidades máximas de aminoácidos de cadena ramificada altamente probados que maximizarán la intensidad y longevidad de su entrenamiento mientras inundan su cuerpo con una combinación perfecta de electrolitos y sales rehidratantes con citrulina agregada para un bombeo intraentrenamiento.\r\n\r\nAlimentar el motor de tu cuerpo durante tu entrenamiento es la clave para progresar.\"',1,'2023-05-25','si',9,1),(13,'BODY FUEL','1731673022079.jpg','body-fuel','BODYFUEL fue formulado para brindar una experiencia de bebida fácil combinada con una verdadera sensación de sabor. Ofreciendo una fuente de sodio, calcio, potasio, cloruro, zinc y magnesio de los electrolitos clave, junto con vitaminas B y antioxidantes para hidratar y alimentar sus intensas sesiones de entrenamiento.',1,'2023-05-25','si',10,1),(15,'HIGH PROTEIN SHAKE','1731673197649.jpg','high-protein-shake','HIGH PROTEIN SHAKE es un delicioso batido listo para tomar de tu sabor favorito. Suave, delicioso y con un alto porcentaje de proteína, High Protein Shake es la bebida que buscas para acompañar tus desayunos, cenas o snacks para alcanzar tus requerimientos del día a día.',1,'2023-05-25','si',11,1),(20,'CRITICAL COOKIE','1731674518329.jpg','critical-cookie','CRITICAL COOKIE es un snack rico en proteínas, cómodo de llevar en la bolsa del gimnasio o llevarlo a cualquier parte.',1,'2023-05-25','si',12,3),(24,'CRUNCH PROTEIN BAR','1731678566215.jpg','crunch-protein-bar','Protein Crunch es perfecto para recargar energías mientras vas camino a tu trabajo, al gimnasio incluso de viaje. Tiene un sabor fantástico y proporciona 21 g de proteína y solo 1,8 g de azúcar por barra.',1,'2023-05-25','si',13,3),(27,'SWIRL DUO BAR','1731678965736.jpg','swirl-duo-bar','Swirl Bar es una barra de proteína con sabor a chocolate y centro de caramelo suave con sabor a chocolate envuelto por una cobertura de chocolate con leche. Listo para comer y perfecto para llevar a cualquier lado.',1,'2023-05-25','si',14,3),(32,'COLÁGENO','1731679184320.jpg','colageno','El colágeno hidrolizado PEPTINEX es producido a partir de materias primas seleccionadas, obtenidas por la hidrólisis total del colágeno nativo tipo 1, el mismo tipo de colágeno encontrado en los huesos y piel humana. Presenta fácil digestión y es rápidamente absorbido y distribuido en el cuerpo humano.',1,'2023-05-25','si',15,3),(35,'ROPA MUJER','1731810088582.jpg','ropa-mujer','Descripcion del Producto',1,'2023-05-25','si',16,3),(36,'ROPA HOMBRE ','1731810106968.jpg','ropa-hombre','Descripcion del Producto',1,'2023-05-25','si',17,3),(37,'ACCESORIOS','1731810119768.jpg','accesorios','Descripcion del Producto',1,'2023-05-25','si',18,3),(38,'ACCESORIO DE GIMNASIO','1728026743456.png','accesorio-de-gimnasio','Descripcion del Producto',4,'2023-05-25','si',19,3),(47,'ABE','1731681971054.jpg','abe','ABE Ultimate Pre-Workout ofrece una combinación única de las ayudas ergogénicas e ingredientes de rendimiento más investigados para impulsar su rendimiento físico, reducir el cansancio y la fatiga* y mejorar la concentración durante su sesión de entrenamiento.',1,'2024-08-02','si',20,4),(50,'Producto Prueba 1','1728458804458.jpg','producto-prueba-1','D',5,'2024-10-09','si',20,4),(53,'creatine monohydrate','1730847834334.jpg','creatinemonohydrate','creatina monohidratada al 100 ',3,'2024-11-05','si',1,2),(54,'prueba','1730849038142.png','producto-prueba','prueba',4,'2024-11-05','no',0,2),(55,'Prueba 1','1730849422332.jpg','prueba1y2','Alpha TX9 te hará sentir bien',4,'2024-11-05','si',1,2),(56,'ALPHA TX9 ','1731701925299.jpg','alfa-5','Descubre el poder con Alpha TX9 de Kevin Levrone, un potente suplemento diseñado específicamente para hombres que buscan optimizar su rendimiento, energía y vitalidad. Esta fórmula avanzada combina ingredientes clave que apoyan la producción natural de testosterona, promoviendo el crecimiento muscular, la fuerza y el desempeño físico.',1,'2024-11-15','si',5,4);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_agrupado`
--

DROP TABLE IF EXISTS `producto_agrupado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_agrupado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `agrupacion_id` int NOT NULL,
  `producto_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_agrupado`
--

LOCK TABLES `producto_agrupado` WRITE;
/*!40000 ALTER TABLE `producto_agrupado` DISABLE KEYS */;
INSERT INTO `producto_agrupado` VALUES (1,44,2),(3,44,6),(4,45,1),(5,45,2),(6,46,1),(7,46,10),(8,46,30),(9,3,56),(10,3,1),(11,3,20);
/*!40000 ALTER TABLE `producto_agrupado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_agrupado_propiedades`
--

DROP TABLE IF EXISTS `producto_agrupado_propiedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_agrupado_propiedades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_agrupado_id` int NOT NULL,
  `producto_propiedades_detalles_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_agrupado_propiedades`
--

LOCK TABLES `producto_agrupado_propiedades` WRITE;
/*!40000 ALTER TABLE `producto_agrupado_propiedades` DISABLE KEYS */;
INSERT INTO `producto_agrupado_propiedades` VALUES (1,10,2),(2,10,3),(3,11,35);
/*!40000 ALTER TABLE `producto_agrupado_propiedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_categoria`
--

DROP TABLE IF EXISTS `producto_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_id` int NOT NULL,
  `url` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_sub_id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_categoria`
--

LOCK TABLES `producto_categoria` WRITE;
/*!40000 ALTER TABLE `producto_categoria` DISABLE KEYS */;
INSERT INTO `producto_categoria` VALUES (1,'Aisladas',1,'aisladas','2'),(2,'Whey',1,'whey','2'),(3,'Hidrolizada',1,'hidrolizada','2'),(4,'Concentrada',1,'concentrada','2'),(5,'Caseína',1,'caseina','2'),(6,'Vegana',1,'vegana','2'),(7,'BCAA',1,'bcaa','4'),(9,'EAA\'s',1,'eaas','4'),(10,'100% Monohidratada',2,'100-monohidratada','3'),(11,'100% L-Glutamine',2,'100-l-glutamine','4'),(12,'ABE',2,'abe','5'),(13,'Shaaboom Pump',2,'shaaboom-pump','5'),(14,'100% Hidrolizado',2,'100-hidrolizado','6'),(15,'Mora',2,'mora','6'),(16,'Naranja',2,'naranja','6'),(18,'Alpha TXS',2,'alpha-txs','7'),(19,'Gold LevroLean',2,'gold-levrolean','8'),(20,'Critical Cookie',2,'critical-cookie','9'),(21,'Protein Crunch Bar',2,'protein-crunch-bar','9'),(22,'SWIRL BAR',2,'swirl-bar','9'),(23,'HIGH PROTEIN SHAKE',2,'high-protein-shake','9'),(24,'Body Fuel',2,'body-fuel','50'),(29,'Pre Workout',1,'pre-workout','3'),(30,'Intra Workout',1,'intra-workout','3'),(31,'Pro Workout',1,'pro-workout','3'),(32,'Glutamina',1,'glutamina','4'),(33,'Creatina',1,'creatina','4'),(34,'Vitaminas y Minerales',1,'vitaminas-y-minerales','5'),(35,'Test Booster',1,'test-booster','5'),(36,'Colágeno',1,'colageno','5'),(37,'Quemadores',1,'quemadores','5'),(38,'Rehidratantes',1,'rehidratantes','5'),(39,'Food Y Snacks',1,'food-y-snacks','5'),(40,'Polos',1,'polos','23'),(41,'Tanks',1,'tanks','23'),(42,'Hoodies',1,'hoodies','23'),(43,'Casacas / Cortavientos',1,'casacascortavientos','23'),(44,'Shorts',1,'shorts','23'),(45,'Joggers',1,'joggers','23'),(46,'Polos',1,'polos','24'),(47,'Crops',1,'crops','24'),(48,'Tanks',1,'tanks','24'),(49,'Applied Nutrition',1,'applied-nutrition','25'),(50,'ABE',1,'abe','25'),(51,'Kevin Levrone',1,'kevin-levrone','25'),(52,'Muscle Shop',1,'muscle-shop','25'),(53,'Galoneras',1,'galoneras','84'),(54,'Metal Shaker',1,'metal-shaker','84'),(55,'2 Compartimientos',1,'2-compartimientos','84'),(56,'3 Compartimientos',1,'3-compartimientos','84'),(57,'Plastic Bottle',1,'plastic-bottle','84'),(58,'Applied Nutrition',1,'applied-nutrition','86'),(59,'ABE',1,'abe','86'),(60,'ABE',1,'abe','89'),(61,'Applied Nutrition',1,'applied-nutrition','89'),(62,'Kevin Levrone',1,'kevin-levrone','86'),(63,'Kevin Levrone',1,'kevin-levrone','89');
/*!40000 ALTER TABLE `producto_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_forma`
--

DROP TABLE IF EXISTS `producto_forma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_forma` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_forma`
--

LOCK TABLES `producto_forma` WRITE;
/*!40000 ALTER TABLE `producto_forma` DISABLE KEYS */;
INSERT INTO `producto_forma` VALUES (1,'normal',1),(2,'bestsellers',1),(3,'ofertas',1);
/*!40000 ALTER TABLE `producto_forma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_informacion`
--

DROP TABLE IF EXISTS `producto_informacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_informacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int NOT NULL,
  `beneficios` varchar(2500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uso_sugerido` varchar(2500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info_nutricional` varchar(2500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredientes` varchar(2500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precauciones` varchar(2500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(2500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_informacion`
--

LOCK TABLES `producto_informacion` WRITE;
/*!40000 ALTER TABLE `producto_informacion` DISABLE KEYS */;
INSERT INTO `producto_informacion` VALUES (43,49,'1. Provee continua concentración durante el entrenamiento gracias a la Cafeína y TheaCrine\n2. Aumenta el rendimiento físico durante ejercicios de alta intensidad gracias a la Creatina y Beta-Alanina\n3. La Vitamina B3 así como el Malato de Citrulina contribuirán a la reducción del cansancio y la fatiga.\n4. Apto para veganos y vegetarianos y libre de soja, gluten o lácteos\n5. Halal Certified Product\n6.  Abre sus vías respiratorias con Breathe Easy Coolant','DOSIFICACIÓN: Adultos, disolver una porción de 10,5 gr. (contenido del dosificador al ras) disuelto en 250 ml agua, 15 minutos antes de entrenar. Una vez al día. ','ALERGIAS: No se incluyen alérgenos comunes. Elaborado en una instalación que manipula leche, soja, huevos, gluten y sus productos.','Malato de Citrulina, Monohidrato de Creatina, Beta-Alanina, Bicarbonato de Sodio, Ácido (Ácido Cítrico), Dióxido de Silicio, Silicato de Calcio, Taurina, Cafeína Anhidra, Theacrine, Saborizante, Colorante (Remolacha Roja), Edulcorante (Sucralosa). , Nicotinamida (Vitamina B3), Vitamina B12 (Cianocobalamina).','Nada','ABE Ultimate Pre-Workout ofrece una combinación única de las ayudas ergogénicas e ingredientes de rendimiento más investigados para impulsar su rendimiento físico, reducir el cansancio y la fatiga* y mejorar la concentración durante su sesión de entrenamiento.','Nada'),(47,2,'\"1. Mejora la recuperación muscular\n2. Fortalece el sistema inmunológico\n3. Promueve la salud intestinal\n4. Reduce el catabolismo muscular\n5. Mejora la síntesis de proteína\n6. Apoya la hidratación celular\"','\"DOSIFICACIÓN: Como suplemento dietético para adultos. Mezcle 1 porción (5 gr.) con 250 ml de agua una vez al día.\nVIA DE ADMINISTRACIÓN: Oral\nSUPLEMENTO DIETÉTICO: No debe utilizarse como sustituo de una dieta equilibrada. Este producto no está indicado para el diagnóstico, tratamiento, curación ni prevención de alguna enfermedad\"','ALERGIAS Por favor leer ingredientes de la composición.','100% L-Glutamine','\"PRECAUCIONES Y ADVERTENCIAS: Consulte con su médico antes de usar este producto si es menor de 18 años, si está embarazada o dando de lactar o si tiene sospecha de alguna condición médica y/o toma alguna medicina recetada o sin prescripción. No supere la dosis diaria expresamente recomendada. No lo use si es alérgico a alguno de los compuestos del producto. Se recomienda una dieta variada y equilibrada y un estilo de vida saludable. Mantener fuera del alcance de los niños. Consumir antes de la fecha indicada en el envase.\nCONTRAINDICACIONES: Hipersensibilidad a alguno de los componentes. Pacientes con enfermedad renal y/o hepática.\nREACCIONES ADVERSAS: Excepcionalmente se puede presentar síntomas gastrointestinales, malestar estomacal, nauseas, vómitos y diarrea.\nCONDICIONES DE ALMACENAMIENTO: Almacenar a temperatura no mayor de 30°C y a humedad no mayor a 70%.\"','a','https://www.youtube.com/watch?v=I7G3qsJxooI'),(49,3,'\"1. 22 gr. de Proteína (per 30 gr. serving)\n2. 1.9 gr. de Carbohidratos (per 30 gr. serving)\n3. 1.9 gr. de Grasas (per 30 gr. serving)\n4. Contribuye a la mantención y aumento de masa muscular\n5. Fácil de mezclar\n6. Rápida absorción y digestión \"','\"DOSIFICACIÓN: Como suplemento dietético para adultos. Mezcle 1 porción (30 gr.) con 200 ml de agua o leche una o dos veces al día.\nVIA DE ADMINISTRACIÓN: Oral\nSUPLEMENTO DIETÉTICO: No debe utilizarse como sustituto de una dieta equilibrada. Este producto no está indicado para el diagnóstico, tratamiento, curación ni prevención de alguna enfermedad.\"','ALERGIAS Por favor leer ingredientes de la composición. ','Concentrado de Proteína de Suero (Procedente de la Leche), Cacao, Saborizante, Espesante (Goma Xantana), Sal, Antiaglomerante (E551), Edulcorantes (Sucralosa, Acesulfamo K).','\"PRECAUCIONES Y ADVERTENCIAS: Consulte con su médico antes de usar este producto si es menor de 18 años, si está embarazada o dando de lactar o si tiene sospecha de alguna condición médica y/o toma alguna medicina recetada o sin prescripción. No supere la dosis diaria expresamente recomendada. No lo use si es alérgico a alguno de los compuestos del producto. Se recomienda una dieta variada y equilibrada y un estilo de vida saludable. Mantener fuera del alcance de los niños. Consumir antes de la fecha de vencimiento indicada en el envase.\nCONTRAINDICACIONES: Hipersensibilidad a alguno de los componentes. Pacientes con enfermedad renal y/o hepática.\nREACCIONES ADVERSAS: Excepcionalmente se puede presentar síntomas gastrointestinales, malestar estomacal, nauseas, vómitos y diarrea.\nCONDICIONES DE ALMACENAMIENTO: Almacenar a temperatura no mayor a 30°C y a humedad no mayor al 70%.\"','a','https://www.youtube.com/watch?v=I7G3qsJxooI'),(50,4,'\"1. 25 gr. de Proteína (per 30 gr. Serving)\n2. 0.3 gr. de Grasa (per 30 gr. Serving)\n3. 0.75 gr. de Carbohidratos (per 30 gr. Serving)\n4. Contribuye a la mantención y aumento de masa muscular\n5. Fácil de mezclar.\n6. Rápida y fácil asimilación\"','\"DOSIFICACIÓN: Como suplemento dietético para adultos. Mezcle 1 porción (30 gr.) con 200 ml de agua o leche una o dos veces al día.\nVIA DE ADMINISTRACIÓN: Oral\nSUPLEMENTO DIETÉTICO: No debe utilizarse como sustituto de una dieta equilibrada. Este producto no está indicado para el diagnóstico, tratamiento, curación ni prevención de alguna enfermedad.\"','ALERGIAS Por favor leer ingredientes de la composición.','Aislado de Proteína de Suero (de Leche), Cacao, Espesante (Goma Xantana), Antiaglomerante (E551), Aroma, Sal, Edulcorantes (Acesulfamo K, Sucralosa).','\"PRECAUCIONES Y ADVERTENCIAS: Consulte con su médico antes de usar este producto si es menor de 18 años, si está embarazada o dando de lactar o si tiene sospecha de alguna condición médica y/o toma alguna medicina recetada o sin prescripción. No supere la dosis diaria expresamente recomendada. No lo use si es alérgico a alguno de los compuestos del producto. Se recomienda una dieta variada y equilibrada y un estilo de vida saludable. Mantener fuera del alcance de los niños. Consumir antes de la fecha de vencimiento indicada en el envase.\nCONTRAINDICACIONES: Hipersensibilidad a alguno de los componentes. Pacientes con enfermedad renal y/o hepática.\nREACCIONES ADVERSAS: Excepcionalmente se puede presentar síntomas gastrointestinales, malestar estomacal, nauseas, vómitos y diarrea.\nCONDICIONES DE ALMACENAMIENTO: Almacenar a temperatura no mayor a 30°C y a humedad no mayor al 70%.\"','a','https://www.youtube.com/watch?v=I7G3qsJxooI'),(51,6,'\"1. Incremento de energía.\n2. Mejora de concentración y enfoque.\n3. Aumento del flujo sanguíneo y bombeo muscular.\n4. Mayor resistencia y rendimiento.\n5. Reducción de la fatiga muscular.\n6. Rápida recuperación post-entrenamiento.\"','\"DOSIFICACIÓN: Como suplemento dietético para adultos. Mezcle 1 cucharada (8,75 gr.) con 150-200 ml de agua una vez al día, aproximadamente 20 minutos antes de su entrenamientos. \nVIA DE ADMINISTRACIÓN: Oral\nSUPLEMENTO DIETÉTICO: No debe utilizarse como sustituto de una dieta equilibrada. Este producto no está indicado para el diagnóstico, tratamiento, curación ni prevención de alguna enfermedad.\"','ALERGIAS Por favor leer ingredientes de la composición. ','Malato de citrulina, Beta-alanina, Monohidrato de creatina, Alfacetoglutarato de L-arginina (AKG), Antiaglomerante (Dióxido de silicio), Cafeína, Almidón de arroz, Saborizante, Edulcorantes (Sucralosa, Acesulfamo K), Colorante (E160A)','\"PRECAUCIONES Y ADVERTENCIAS: Consulte con su médico antes de usar este producto si es menor de 18 años, si está embarazada o dando de lactar o si tiene sospecha de alguna condición médica y/o toma alguna medicina recetada o sin prescripción. No supere la dosis diaria expresamente recomendada. No lo use si es alérgico a alguno de los compuesto del producto. Se recomienda una dieta variada y equilibrada y un estilo de vida saludable. Mantener fuera del alcance de los niños. Los complementos alimenticios no deben utilizarse como sustituos de una dieta variada y equilibrada. No consumir con alcohol. Consumir antes de la fecha de vencimiento indicada en el envase.\nCONTRAINDICACIONES: Hipersensibilidad a alguno de los componentes. Pacientes con enfermedad renal y/o hepática.\nREACCIONES ADVERSAS: Excepcionalmente se puede presentar síntomas gastrointestinales, malestar estomacal, nauseas, vómitos y diarrea.\nCONDICIONES DE ALMACENAMIENTO: Almacenar a temperatura no mayor a 30°C y a humedad no mayor a 70%.\"','a','https://www.youtube.com/watch?v=I7G3qsJxooI'),(53,9,'\"1. 22.5 gr. proteína (per 25 gr. serving)\n2. 0.1 gr. Lactosa (per 25 gr. serving)\n3. 0 gr. azúcar, carbohidratos y grasas (per 25 gr. serving)\n4. Libre de soja\n5. Whey producida de suero de leche de vacas que pastan libres en el campo\n6. Halal Certified Product\"','\"DOSIFICACIÓN: Mezclar 1 servicio (25g) con 200 ml de agua o leche descremada. Tomar 1 a 3 servicios diarios, dependiendo de sus requerimientos de proteína.\nVIA DE ADMINISTRACIÓN: Oral\n\nISO-XP se absorbe rápidamente, por lo que los momentos óptimos para usarlo son cuando necesitas proteínas rápidamente. Esto incluye inmediatamente al despertar, antes del desayuno e inmediatamente después del ejercicio. Después del entrenamiento, muchos deportistas toman una ración doble (50 g), ya que el cuerpo es capaz de procesar una gran cantidad de proteínas en su estado agotado.\"','ALERGIAS: Por favor leer ingredientes de la composición.','100 % Aislado de Proteína de Suero (Leche) (Emulsionado con Lecitina de Girasol), Polvoa de Cocoa, Sabor Natural, Edulcorante (Sucralosa)','\"PRECAUCIONES Y ADVERTENCIAS: Consulte con su médico antes de usar este producto si es menor de 18 años, si está embarazada o dando de lactar o si tiene sospecha de alguna condición médica y/o toma alguna medicina recetada o sin prescripción. No supere la dosis diaria expresamente recomendada. Consumir preferentemente antes de la fecha indicada en el envase.\nSUPLEMENTO DIETÉTICO: No debe utilizarse como sustituto de una dieta equilibrada. Este producto no está indicado para el diagnóstico, tratamiento, curación ni prevención de alguna enfermedad.\nCONDICIONES DE ALMACENAMIENTO: Almacenar en lugar y fresco y seco a temperatura no mayor de 30°C. Almacenar fuera del alcance y vista de los niños.\"','a','https://www.youtube.com/watch?v=I7G3qsJxooI'),(55,13,'1. Rápida hidratación\n2. Brinda los 5 electrolitos clave\n3. Vitamina B para energía\n4. Vitamina D3 para inmunidad\n5. Vitamina C+E para antioxidantes\n6. BCAA\'s para recuperación\n7. Listo para lleavr y tomar al instante','Consumir como parte de una dieta variada y equilibrada y un estilo de vida saludable. Bebida lista para tomar en cualquier momento del día según la preferencia del usuario.','ALERGIAS: Por favor leer ingredientes de la composición.','Agua de Manantial, Ácido (Ácido Cítrico), Saborizante, Conservantes (Sorbato de Potasio, Dicarbonato de Dimetilo, Benzoato de Sodio), Carbonato de Calcio, Cloruro de Sodio, Citrato Tripotásico, BCAA (2:1:1), Edulcorante (Sucralosa), Magnesio. Carbonato, Antioxidantes (Vitamina C, Acetato de Vitamina E), Vitaminas del grupo B (Vitamina B3, Vitamina B5, Vitamina B12, Vitamina B6), Gluconato de Zinc, Vitamina D3 (Colecalciferol). MEZCLA DE BCAA: 250 mg (L-Leucina, L-Isoleucina, L-Valina)','PRECAUCIONES Y ADVERTENCIAS: Mantenga su botella fresca y alejada de la luz solar directa. Una vez abierto conservar refrigerado y consumir en un plazo de 3 días. Peligro de asfixia, la tapa de esta botella no es adecuada para niños menores de 36 meses. Apto para Veganos y Vegatarianos. Consumir preferentemente antes de la fecha indicada en el envase.','a','https://youtube.com/watch?v=I7G3qsJxooI'),(56,15,'\"1. 42 gr. Proteína\n2. Bajo en grasas\n3. Sin azúcares añadidos\n4. Listo para tomar\n5. Endulzado son Sucralosa ','Consumir como parte de una dieta variada y equilibrada y un estilo de vida saludable. Bebida lista para tomar en cualquier momento del día según la preferencia del usuario.','ALERGIAS: Por favor leer ingredientes de la composición.','Concentrado de Proteína de Leche (65%), Agua, Leche Desnatada (7,5%), Saborizante, Estabilizador (Carragenano), Regulador de Acidez (Citrato Trisódico), Edulcorante (Sucralosa), Colorante (Betacaroteno).','PRECAUCIONES Y ADVERTENCIAS: Mantener sellado en un lugar fresco y seco. Una vez abierto conservar refrigerado y consumir antes de 12 horas. Este producto está listo para usar. Agitar bien antes de usar. Fecha de consumo preferente: ver lateral de la funda.','a','youtube.com/watch?v=I7G3qsJxooI'),(57,20,'1. 20 gr. de Proteína por galleta\n2. Sin edulcorantes artificiales\n3. Sabor natural recién horneado\n4. Tested for Athletes™\n5. Halal Certified Product & NON GMO','Listo para consumir en cualquier momento del día. Consumir como parte de una dieta equilibrada, variada y saludable.','ALERGIAS: Por favor leer ingredientes de la composición. Incluye cereales que tienen gluten.','Mezcla para Galletas (Azúcar, Proteína de Leche, Aceites Vegetales (Palma, Colza), Harina de Trigo (Harina de Trigo, Calcio, Hierro, Niacina, Tiamina), Aroma Natural de Vainilla, Melaza de Caña, Gasificantes (E450, E450, E500, E501), Margarina (Aceites vegetales (Palma, Colza), Sal, Emulsionante: Monoglicéridos Destilados; Aromatizantes Naturales, Colorantes Naturales (Anatto Bixin, Curcumina)), Concentrado de Proteína de Suero (Leche), Trozos de Chocolate Amargo (11%) (Azúcar, Masa de Cacao, Manteca de Cacao, Emulsionante (Lecitina de Girasol), Aroma Natural), Azúcar, Humectante: Glicerol, Aroma Natural, Sal Marina.','INSTRUCCIONES DE ALMACENAMIENTO: Conservar en un lugar fresco y seco. Una vez abierto guardar en un recipiente hermético. Consumir preferentemente antes de la fecha indicada en el envase.','a','youtube.com/watch?v=I7G3qsJxooI'),(58,24,'1. 21 gr. de Proteína por barra\n2. Bajo en grasa\n3. Bajo en azúcar\n4. Fácil de llevar\n5. Apto para vegetarianos\"','Listo para consumir en cualquier momento del día. Consumir como parte de una dieta equilibrada, variada y saludable. ','ALERGIAS: Por favor leer los ingredientes de la composición. Puede contener trazasa de: gluten, leche, shoja, cachuates, frutos secos, dióxido de azufre y sulfitos.','Mezcla de Proteínas (Aislado de Proteína de Leche, Proteína de Trigo Hidrolizada, Aislado de Proteína de Soja, Aislado de Proteína de Suero (Emulsionante: Lecitina de Girasol), (Leche)), Chocolate Blanco con Edulcorante (Edulcorante (Maltitol), Manteca de Cacao, Leche Entera en Polvo, Emulgente (Lecitina de Soja), Aroma Natural de Vainilla), Humectante (Glicerina), Caramelo Bajo en Azúcar (Humectante (Glicerol), Maltodextrina, Oligofructosa, Agua, Agente de Carga (Maltitol en Polvo), Aceite de Coco, Leche Desnatada en Polvo, Almidón de Maíz Ceroso Modificado, Colorante (Caramelo), Gelificante (Pectina), Regulador de Acidez (Lactato Cálcico), Emulgente (Lecitina de Soja), Sal, Aromas Naturales, Espesante (Goma Xantana)), Fibra de Tapioca Soluble, Edulcorante (Jarabel de Maltitol, Sucralosa), Agua, Aroma Natural','\"PRECAUCIONES Y ADVERTENCIAS: El consumo excesivo puede causar un efecto laxante. \nCONDICIONES DE ALMACENAMIENTO: Debe almacenarse entre 15°C Y 22°C, lejos de la luz solar directa, los olores y la humedad. (Humedad relativa máxima del 70%). El producto también debe mantenerse alejado de cambios de calor extremos. Mantener fuera del alcance de los niños. ','a','youtube.com/watch?v=I7G3qsJxooI'),(59,27,'\"1. 17 gr. de Proteína por Duo Bar\n2. 96 calorías por barra\n3. Bajo en azúcar\n4. Libre de colesterol \n5.Apto para vegetarianos','Listo para consumir en cualquier momento del día. Consumir como parte de una dieta equilibrada, variada y saludable. ','ALERGIAS: Por favor leer los ingredientes de la composición. Puede incluir cereales que contienen gluten así como nueces, cacahuetes y sulfitos.','Mezcla de Proteínas (Aislado de Proteína de Leche, Aislado de Proteína de Soja), Proteína de Trigo Hidrolizada, Cobertura de Chocolate con Leche con Edulcorante (Edulcorante (Maltitol), Manteca de Cacao, Leche Entera en Polvo, Masa de Cacao, Emulgente (Lecitina de Soja), Aroma Natural de Vainilla), Humectante (Glicerina), Relleno de Caramelo con Sabor a Chocolate (Humectante (Glicerol), Maltodextrina, Oligofructosa, Agua, Agente de Carga (Maltitol. Aceite de Coco, Almidón de Maíz Modificado, Leche Desnatada en Polvo, Gelificante (Pectina), Regulador de Acidez Lactato Cálcico), Emulgente (Lecitina de Soja), Aromas Naturales, Sal, Espesante (Goma Xantana), Colorante (Caramelo), Fibra de Tapioca Soluble, Edulcorante (Jarabe de Maltitol, Sucralosa), Harina de Avena, Agua, Goma de Acacia, Cacao en polvo Desgrasado, Aroma Natural.','\"PRECAUCIONES Y ADVERTENCIAS: El consumo excesivo puede causar un efecto laxante. \nCONDICIONES DE ALMACENAMIENTO: Debe almacenarse entre 15°C Y 22°C, lejos de la luz solar directa, los olores y la humedad. (Humedad relativa máxima del 70%). El producto también debe mantenerse alejado de cambios de calor extremos. Mantener fuera del alcance de los niños.','a','youtube.com/watch?v=I7G3qsJxooI'),(60,32,'\"1. 9.5 gr. Colágeno por servicio\n2. 60 mg Vitamina C, 200 mg Magnesio y 10 mg Zinc\n3. Mejora el sistema cardiovascular y nervioso.\n4. Fortalece los huesos, tendones, cartílagos y músculos.\n5. Fortalece el cabello, uñas y mejora su aspecto.\n6. Mejora la firmeza y textura de la piel.\n7.Previen úlceras gástricas.\n8. Actúa como antioxdante y desintoxicante.','DOSIFICACIÓN: Se recomienda consumir una porción de 10 g (una cucharada del envase) con agua, jugos de frutas u otras bebidas. El colágeno se puede tomar a cualquier hora del día y en cualquier momento.','ALERGIAS: Por favor leer los ingredientes de la composición. ','Harina de colágeno hidrolizado, harina de fruto de camu camu, cloruro de magnesio, hojas de stevia y sulfato de zinc, sabor a mora natural.','CONDICIONES DE ALMACENAMIENTO: Guardar en un lugar fresco y seco. Protegerlo de la luz solar directa.','a','https://www.youtube.com/watch?v=I7G3qsJxooI'),(61,7,'\"1. Estimula la síntesis de proteína.\n2. Mejora la recuperación muscular.\n3. Aumentar la resistencia muscular.\n4. Promueve la salud ósea.\n5. Apoya la función inmunológica.\n6. Contiene BCAA\'s','DOSIFICACIÓN: Mezcle 1 cucharada (6,2 g) de EAA con 250-350 ml de agua. Como complemento alimenticio consumir 1-2 raciones diarias, una ración entre comidas y otra antes de acostarse. Los días de entrenamiento tomar 1 dosis antes, durante o después de tu entrenamiento.','ALERGIAS Por favor leer ingredientes de la composición. ','Mezcla de Aminoácidos (L-lisina HCl, L-leucina, L-treonina, L-valina, L-fenilalanina, L-isoleucina, L-metionina, L-histidina, L-triptófano), Saborizante, Ácidos (Ácido Málico, Cítrico Ácido), Antiaglomerantes (E551, E341), Edulcorantes (Sucralosa, Acesulfamo K, Glucósidos de esteviol), Concentrado de Zumo de Remolacha Roja.','\"PRECAUCIONES Y ADVERTENCIAS: No lo use si es alérgico a alguno de los compuestos del suplemento. No utilizar en caso de embarazo o la lactancia. No exceda la dosis diaria recomendada. No se deben utilizar complementos alimenticios en sustitución de una dieta variada y equilibrada. Mantengase fuera del alcance de los niños.\nCONDICIONES DE ALMACENAMIENTO: Almacenar a temperatura no mayor a 30°C y a humedad no mayor a 70%.\"','a','https://www.youtube.com/watch?v=I7G3qsJxooI'),(62,11,'\"1. 0 gr. de azúcar, carbohidratos, grasas.\n2. Contiene 1535 mg electrolitos, 7200 mg BCAA (per 14 g. serving) \n3. Contiene citrulina para intra-workout pump\n4. 3 gr. Glutamina\n5. Informed-Sport Batch Tested for Athletes\n6. Fácil mezcla ','\"DOSIFICACIÓN: Mezclar 1 servicio (14g) con 500 ml de agua y mezclar bien una vez al día. Tomar durante el ejercicio en los días de entrenamiento o durante el día en los días que no tenga entrenamientos.\nVIA DE ADMINISTRACIÓN: Oral','ALERGIAS: Por favor leer ingredientes de la composición.','Calcio, Cloruro, Fosforo, Potasio, Sodio, Vitamina B6. L-Leucina, L-Isoleucina, L-Valina, L-Glutamina, L-Citrulina DL-Malato, Citrato Trisodico, Citrato Tripotasico, Fofasto Tricalcico, Antiaglomerantes (Dióxido de Silicio), Saborizante Natural, Acidulante (Ácido Cítrico), Edulcorante (Sucralosa), Colorante Natural (Remolacha en Polvo)','\"PRECAUCIONES Y ADVERTENCIAS: Consulte con su médico antes de usar este producto si es menor de 18 años, si está embarazada o andado de lactar o si tiene sospecha de alguna condición médica y/o toma algna medicina recetada o sin preescripción. No supere la dosis diaria expresamente recomendada. Almacenar fuera del alcance y vista de los niños. Consumir preferentemente antes de la fecha indicada en el envase.\nSUPLEMENTO DIETÉTICO: No debe utilizarse como sustituo de una dieta equilibrada. Este producto no está indicado para el diagnóstico, tratamiento, curación ni prevención de alguna enfermedad.\nCONDICIONES DE ALMACENAMIENTO: Almacenar a temperatura no mayor de 30°C y a humedad no mayor a 70%','a','https://www.youtube.com/watch?v=I7G3qsJxooI'),(63,47,'1. Provee continua concentración durante el entrenamiento gracias a la Cafeína y TheaCrine\n2. Aumenta el rendimiento físico durante ejercicios de alta intensidad gracias a la Creatina y Beta-Alanina\n3. La Vitamina B3 así como el Malato de Citrulina contribuirán a la reducción del cansancio y la fatiga.\n4. Apto para veganos y vegetarianos y libre de soja, gluten o lácteos\n5. Halal Certified Product\n6. Contiene Dynamine','DOSIFICACIÓN: Adultos, disolver una porción de 10,5 gr. (contenido del dosificador al ras) disuelto en 250 ml agua, 15 minutos antes de entrenar. Una vez al día. \nVÍA DE ADMINISTRACIÓN: Oral','ALERGIAS: No se incluyen alérgenos comunes. Elaborado en una instalación que manipula leche, soja, huevos, gluten y sus productos.','Malato de Citrulina, Monohidrato de Creatina, Beta-Alanina, Bicarbonato de Sodio, Ácido (Ácido Cítrico), Dióxido de Silicio, Silicato de Calcio, Taurina, Cafeína Anhidra, Metilliberina (como Dynamine), Theacrine, Saborizante, Colorante (Remolacha Roja), Edulcorante (Sucralosa). , Nicotinamida (Vitamina B3), Vitamina B12 (Cianocobalamina).\n\nDynamine es una marca registrada y protegida por patentes pendientes que reivindican prioridad al número de serie 61/903,362; bajo distribución global exclusiva por Compound Solutions, Inc.','PRECAUCIONES Y ADVERTENCIAS: Consulte con su médico antes de usar este producto si es menor de 18 años, si está embarazada o dando de lactar o si tiene sospecha de alguna condición médica y/o si está tomando algún producto o medicamento. Los suplementos dietéticos no deben utilizarse como sustitutos de una dieta equilibrada. No supere la dosis diaria expresamente recomendada. No lo use si es alérgico a alguno de los compuestos del producto. Se recomienda una dieta variada y equilibrada y un estilo de vida saludable. Mantener fuera del alcance de los niños. Consumir antes de la fecha de vencimiento indicada en el envase.\nCONTRAINDICACIONES: Hipersensibilidad a alguno de los componentes. Pacientes con enfermedad renal y/o hepática.\nREACCIONES ADVERSAS: Excepionalmente se puede presentar síntomas gastrointestinales, malestar estomacal, nauseas, vómitos y diarrea.\nCONDICIONES DE ALMACENAMIENTO: Almacenar a temperatura no mayor de 30°C','a','https://www.youtube.com/watch?v=I7G3qsJxooI'),(64,8,'\"1. 25.5 gr. de Proteína (per 30 gr. Serving)\n2. 1000 mg de Taurina (per 30 gr. Serving)\n3. 500 mg Ácido D-Aspartic (DAA) (per 30 gr. Serving)\n4. 3000 mg Creatina Monohidratada (per 30 gr. Serving)\n5. 0.9 gr. de Carbohidratos (per 30 gr. Serving)\n6. 0.8 gr. de Grasa (per 30 gr. Serving)','\"DOSIFICACIÓN: Como suplemento dietético para adultos. Mezcle 1 porción (30 gr.) con 250-300 ml de agua o leche descremada. Consumir antes o inmediatamente después del entrenamiento para mayor beneficio.\nVIA DE ADMINISTRACIÓN: Oral\nSUPLEMENTO DIETÉTICO: No debe utilizarse como sustituto de una dieta equilibrada. Este producto no está indicado para el diagnóstico, tratamiento, curación ni prevención de alguna enfermedad.','ALERGIAS Por favor leer ingredientes de la composición. ','Aislado de Proteína de Suero (de Leche), Monohidrato de Creatina, Taurina, Cacao, Ácido D-Aspártico, Sal, Espesante (Goma Xantana), Antiaglomerante (E551), Saborizantes, Edulcorantes (Sucralosa, Acesulfamo K).','\"PRECAUCIONES Y ADVERTENCIAS: Consulte con su médico antes de usar este producto si es menor de 18 años, si está embarazada o dando de lactar o si tiene sospecha de alguna condición médica y/o toma alguna medicina recetada o sin prescripción. No supere la dosis diaria expresamente recomendada. No lo use si es alérgico a alguno de los compuestos del producto. Se recomienda una dieta variada y equilibrada y un estilo de vida saludable. Mantener fuera del alcance de los niños. Consumir antes de la fecha de vencimiento indicada en el envase.\nCONTRAINDICACIONES: Hipersensibilidad a alguno de los componentes. Pacientes con enfermedad renal y/o hepática.\nREACCIONES ADVERSAS: Excepcionalmente se puede presentar síntomas gastrointestinales, malestar estomacal, nauseas, vómitos y diarrea.\nCONDICIONES DE ALMACENAMIENTO: Almacenar a temperatura no mayor de 30°C y a humedad no mayor a 70%.','a','https://www.youtube.com/watch?v=I7G3qsJxooI'),(66,1,'\"1. Creatina 100% Monohidratada.\n2. Aumento de fuerza y potencia muscular.\n3. Mejora en el rendimiento.\n4. Incremento de masa muscular\n5. Mejora de la función cerebral\n6. Beneficios de la salud general','DOSIFICACIÓN: Como suplemento dietético para adultos. Mezcle 1 porción (2.5 gr.) con 125 ml de agua una vez al día. Para mayor beneficio consumir 1 gr. x cada 10 kilos de peso corporal con 300 ml de agua, mezclar y consumir una vez al día. \nVÍA DE ADMINISTRACIÓN: Oral','ALERGIAS Por favor leer ingredientes de la composición.','100% Creatina Monohidratada','PRECAUCIONES Y ADVERTENCIAS: Consulte con su médico antes de usar este producto si es menor de 18 años, si está embarazada o dando de lactar o si tiene sospecha de alguna condición médica y/o toma alguna medicina recetada o sin prescripción. No supere la dosis diaria expresamente recomendada. No lo use si es alérgico a alguno de los compuestos del producto. Se recomienda una dieta variada y equilibrada y un estilo de vida saludable. Mantener fuera del alcance de los niños. Consumir antes de la fecha de vencimiento indicada en el envase.\nCONTRAINDICACIONES: Hipersensibilidad a alguno de los componentes. Pacientes con enfermedad renal y/o hepática.\nREACCIONES ADVERSAS: Excepcionalmente se puede presentar síntomas gastrointestinales, malestar estomacal, nauseas, vómitos y diarreas.\nCONDICIONES DE ALMACENAMIENTO: Almacenar a temperatura no mayor de 30°C y a humedad no mayor a 70%.','a','https://www.youtube.com/watch?v=7VAqX3-KNSw');
/*!40000 ALTER TABLE `producto_informacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_menu_sub`
--

DROP TABLE IF EXISTS `producto_menu_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_menu_sub` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int DEFAULT NULL,
  `menu_sub_id` int DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  `recomendado_producto_menu_sub_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_menu_sub`
--

LOCK TABLES `producto_menu_sub` WRITE;
/*!40000 ALTER TABLE `producto_menu_sub` DISABLE KEYS */;
INSERT INTO `producto_menu_sub` VALUES (37,1,4,33,1),(46,2,4,32,1),(61,3,2,2,1),(79,7,4,9,1),(107,9,2,1,1),(169,11,4,7,1),(237,1,5,34,1),(240,1,4,7,1),(243,50,4,9,2),(244,50,4,11,2),(245,50,4,11,2),(247,6,5,13,2),(248,8,2,2,2),(249,15,9,23,2),(251,24,9,21,2),(253,32,6,15,2),(254,13,50,24,2),(255,47,3,29,2),(256,4,2,2,2),(259,20,9,20,2),(266,56,2,1,2);
/*!40000 ALTER TABLE `producto_menu_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_objetivo`
--

DROP TABLE IF EXISTS `producto_objetivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_objetivo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int NOT NULL,
  `objetivos_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_objetivo`
--

LOCK TABLES `producto_objetivo` WRITE;
/*!40000 ALTER TABLE `producto_objetivo` DISABLE KEYS */;
INSERT INTO `producto_objetivo` VALUES (8,3,3),(9,3,5),(10,3,6),(11,3,8),(12,3,9),(18,9,3),(19,9,5),(20,9,6),(21,9,8),(22,9,9),(23,11,2),(24,11,3),(25,11,7),(26,11,8),(27,11,9),(28,55,4),(29,50,4),(30,50,4),(31,50,5),(32,50,5),(42,13,7),(43,13,2),(44,13,3),(61,27,4),(62,27,10),(63,27,5),(64,32,9),(65,1,9),(66,1,5),(67,1,8),(68,2,3),(69,2,5),(70,2,6),(71,2,8),(72,2,9),(73,4,3),(74,4,5),(75,4,6),(76,4,9),(77,4,8),(78,6,1),(79,6,5),(80,6,7),(81,7,2),(82,7,3),(83,7,7),(84,7,8),(85,7,9),(91,13,8),(92,13,9),(93,15,9),(94,15,6),(97,24,9),(98,24,6),(99,32,8),(100,32,3),(101,47,1),(102,47,5),(103,47,7),(104,8,3),(105,8,6),(106,8,7),(107,8,9),(108,8,10),(117,20,9),(118,20,6),(124,56,4);
/*!40000 ALTER TABLE `producto_objetivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_propiedades_detalles`
--

DROP TABLE IF EXISTS `producto_propiedades_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_propiedades_detalles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int NOT NULL,
  `sku` varchar(25) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `stock` int NOT NULL,
  `precio` double NOT NULL,
  `precio_reducido` double NOT NULL,
  `precio_team` double NOT NULL,
  `precio_team_vip` double NOT NULL,
  `precio_familiar` double NOT NULL,
  `producto_forma_id` int NOT NULL,
  `estado_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_propiedades_detalles`
--

LOCK TABLES `producto_propiedades_detalles` WRITE;
/*!40000 ALTER TABLE `producto_propiedades_detalles` DISABLE KEYS */;
INSERT INTO `producto_propiedades_detalles` VALUES (1,1,'123','1731669901098.jpg',40,500,450,400,350,300,2,1),(2,1,'124','1731669996837.jpg',50,250,240,80,50,20,2,1),(3,1,'125','1731670009464.jpg',30,125,100,70,60,10,2,1),(4,3,'126','1731670197834.jpg',20,300,270,260,230,220,2,1),(5,3,'127','1731670208717.jpg',25,290,280,250,240,210,2,1),(6,2,'128','1731670099554.jpg',15,360,330,320,290,280,2,1),(7,2,'129','1731670110016.jpg',16,350,340,310,300,270,2,1),(8,4,'130','1731671859295.jpg',18,520,490,480,450,440,2,1),(9,4,'131','1731671887630.jpg',20,510,500,470,460,430,2,1),(10,4,'132','1731671898216.jpg',20,340,330,300,290,260,2,1),(11,4,'133','1731671907576.jpg',36,350,320,310,280,270,2,1),(12,6,'134','1731671982576.jpg',12,200,180,160,140,120,2,1),(13,7,'135','1731672112910.jpg',25,230,200,180,120,100,2,1),(14,7,'136','1731672120785.jpg',14,220,210,160,140,80,2,1),(15,8,'137','1731672318163.jpg',26,280,270,260,250,240,2,1),(16,9,'138','1731672648429.jpg',14,250,240,230,220,210,2,1),(17,9,'139','1731672693974.jpg',15,260,250,240,230,220,2,1),(18,9,'140','1731672708240.jpg',16,300,290,280,270,260,2,1),(19,9,'141','1731672721862.jpg',17,280,270,260,250,240,2,1),(20,11,'142','1731670703409.jpg',12,560,550,540,530,520,2,1),(21,11,'143','1731672878985.jpg',16,540,530,520,510,500,2,1),(22,11,'144','1731672892514.jpg',15,520,500,480,460,440,2,1),(23,11,'145','1731672922959.jpg',14,500,480,460,440,420,2,1),(24,13,'146','1731673067660.jpg',17,480,470,460,450,430,2,1),(25,13,'147','1731673077166.jpg',16,470,460,450,440,430,2,1),(27,50,'148','1728458947935.jpg',25,30,25,25,25,25,2,1),(28,55,'1234','1730850226213.jpg',10,100,90,80,70,60,2,1),(29,55,'1235','1730850528178.jpg',10,200,199,180,170,160,2,1),(30,15,'123ds','1731674061679.jpg',19,300,0,280,270,260,1,1),(31,15,'sad123','1731674238879.jpg',27,300,280,270,260,250,1,1),(32,15,'23sd','1731674280605.jpg',25,300,290,280,270,260,1,1),(33,15,'26sd','1731674329012.jpg',30,300,290,280,270,260,1,1),(34,15,'123sad','1731674373400.jpg',30,300,290,280,270,260,1,1),(35,20,'ere234','1731674737165.jpg',20,400,390,380,370,360,1,1),(36,20,'vbv46','1731674777254.jpg',20,400,390,380,370,360,1,1),(37,20,'nmnm345','1731674818875.jpg',15,400,390,380,370,360,1,1),(38,20,'trt44','1731674870242.jpg',20,400,390,380,370,360,1,1),(39,20,'cvc23','1731674912598.jpg',20,100,90,80,70,60,1,1),(40,20,'231sd','1731674953807.jpg',40,100,90,80,70,60,1,1),(41,20,'ghg34','1731674990612.jpg',22,100,90,80,70,60,1,1),(42,20,'jkj34','1731675028328.jpg',20,100,90,80,70,60,1,1),(43,24,'YTY23','1731678374684.jpg',30,300,290,280,270,260,1,1),(44,24,'hgh32','1731678404581.jpg',40,300,290,280,270,260,1,1),(45,24,'yt23','1731678436378.jpg',30,300,290,280,270,260,1,1),(46,24,'cv32','1731678480371.jpg',16,80,70,60,50,40,1,1),(47,24,'cv23','1731678526055.jpg',20,80,70,60,50,40,1,1),(48,24,'bnv43','1731678553561.jpg',30,80,70,60,50,40,1,1),(49,27,'tye212','1731679076742.jpg',32,500,490,480,460,450,1,1),(50,27,'12rt','1731679062634.jpg',23,500,490,480,470,460,1,1),(51,27,'gf43','1731679106315.jpg',20,500,490,480,470,460,1,1),(52,27,'tr45','1731679147982.jpg',26,500,490,480,470,460,1,1),(53,32,'bgh12','1731679321000.jpg',34,700,690,680,670,660,1,1),(54,32,'ty34','1731679370737.jpg',30,700,690,680,670,660,1,1),(55,47,'23dsg','1731682138094.jpg',34,200,190,180,170,159,1,1),(56,47,'45fdf','1731682182924.jpg',35,200,190,180,170,160,1,1),(57,56,'er34','1731703165772.jpg',20,300,290,280,270,260,1,1);
/*!40000 ALTER TABLE `producto_propiedades_detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_propiedades_detalles_variacion`
--

DROP TABLE IF EXISTS `producto_propiedades_detalles_variacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_propiedades_detalles_variacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_propiedades_detalles_id` int NOT NULL,
  `producto_variacion_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_propiedades_detalles_variacion`
--

LOCK TABLES `producto_propiedades_detalles_variacion` WRITE;
/*!40000 ALTER TABLE `producto_propiedades_detalles_variacion` DISABLE KEYS */;
INSERT INTO `producto_propiedades_detalles_variacion` VALUES (1,1,1),(2,2,2),(3,3,3),(4,6,4),(5,7,5),(6,4,6),(7,4,7),(8,5,6),(9,5,8),(11,27,37),(12,27,35),(13,27,33),(14,16,19),(15,16,21),(16,17,19),(17,17,22),(18,18,20),(19,18,21),(20,19,20),(21,19,22),(22,8,9),(23,8,11),(24,9,9),(25,9,12),(26,10,10),(27,10,11),(28,11,10),(29,11,12),(30,12,13),(31,12,14),(32,13,15),(33,13,17),(34,14,16),(35,14,17),(36,15,18),(37,20,23),(38,20,25),(39,21,23),(40,21,26),(41,22,24),(42,22,25),(43,23,24),(44,23,26),(45,24,27),(46,24,28),(47,25,27),(48,25,29),(49,28,40),(50,29,41),(51,30,42),(52,30,43),(53,31,45),(54,31,44),(55,32,46),(56,32,45),(57,33,45),(58,33,47),(59,34,48),(60,34,45),(61,35,51),(62,35,49),(63,36,49),(64,36,52),(65,37,49),(66,37,53),(67,38,49),(68,38,53),(69,39,53),(70,39,50),(71,40,51),(72,40,50),(73,41,52),(74,41,50),(75,42,54),(76,42,50),(77,43,58),(78,43,55),(79,44,58),(80,44,56),(81,45,58),(82,45,57),(83,46,59),(84,46,57),(85,47,59),(86,47,56),(87,48,55),(88,48,59),(89,49,62),(90,49,60),(91,50,61),(92,50,62),(93,51,63),(94,51,61),(95,52,63),(96,52,60),(97,53,65),(98,53,64),(99,54,64),(100,54,66),(101,55,67),(102,55,68),(103,56,69),(104,56,67),(105,57,77),(106,57,76);
/*!40000 ALTER TABLE `producto_propiedades_detalles_variacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_recomendado`
--

DROP TABLE IF EXISTS `producto_recomendado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_recomendado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_sub_id` int NOT NULL,
  `productos_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_recomendado`
--

LOCK TABLES `producto_recomendado` WRITE;
/*!40000 ALTER TABLE `producto_recomendado` DISABLE KEYS */;
INSERT INTO `producto_recomendado` VALUES (1,2,3),(2,2,6),(3,2,9),(4,1,2),(6,17,15),(8,10,1),(9,19,3),(10,19,8),(11,19,4),(12,23,7),(13,23,12),(14,23,9),(15,25,11),(16,24,11),(17,25,15);
/*!40000 ALTER TABLE `producto_recomendado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_rol_perfil`
--

DROP TABLE IF EXISTS `producto_rol_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_rol_perfil` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int NOT NULL,
  `rol_perfil_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_rol_perfil`
--

LOCK TABLES `producto_rol_perfil` WRITE;
/*!40000 ALTER TABLE `producto_rol_perfil` DISABLE KEYS */;
INSERT INTO `producto_rol_perfil` VALUES (1,50,1),(2,50,2),(3,51,1),(4,51,3),(5,51,4),(6,51,2),(7,52,2),(8,52,4),(9,52,3),(10,52,1),(11,53,2),(12,53,1),(13,53,4),(14,53,3),(15,54,1),(16,55,4),(17,55,3),(18,55,1),(19,55,2),(20,1,1),(21,1,2),(22,2,2),(23,2,1),(24,3,2),(25,3,1),(26,4,2),(27,4,1),(28,6,2),(29,6,1),(30,7,1),(31,7,2),(32,8,2),(33,8,1),(34,9,2),(35,9,1),(36,11,1),(37,11,2),(38,13,1),(39,13,2),(40,15,2),(41,15,1),(42,20,1),(43,20,2),(44,24,1),(45,24,2),(46,27,2),(47,27,1),(48,32,1),(49,32,2),(50,48,1),(51,48,2),(52,47,1),(53,47,2),(54,56,1),(55,56,2),(56,1,3),(57,37,1),(58,37,2),(59,38,1),(60,38,2),(61,35,2),(62,35,1),(63,36,2),(64,36,1);
/*!40000 ALTER TABLE `producto_rol_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_variacion`
--

DROP TABLE IF EXISTS `producto_variacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_variacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int NOT NULL,
  `propiedades_id` int NOT NULL,
  `valor` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_variacion`
--

LOCK TABLES `producto_variacion` WRITE;
/*!40000 ALTER TABLE `producto_variacion` DISABLE KEYS */;
INSERT INTO `producto_variacion` VALUES (1,1,1,'300 GR. | 120 SERV.'),(2,1,1,'500 GR. | 200 SERV.'),(3,1,1,'1KG | 400 SERV.'),(4,2,1,'300 GR. | 60 SERV.'),(5,2,1,'1KG | 200 SERV.'),(6,3,1,'1.5 KG | 50 SERV.'),(7,3,4,'CHOCOLATE'),(8,3,4,'VAINILLA'),(9,4,1,'900 GR. | 30 SERV.'),(10,4,1,'2KG | 66 SERV.'),(11,4,4,'CHOCOLATE'),(12,4,4,'VAINILLA'),(13,6,1,'385 GR. | 44 SERV.'),(14,6,4,'FRUIT PUNCH'),(15,7,1,'195 GR. | 31 SERV.'),(16,7,1,'390 GR. | 62 SERV.'),(17,7,4,'FRUIT PUNCH'),(18,8,1,'2KG | 66 SERV.'),(19,9,1,'1KG | 40 SERV.'),(20,9,1,'1.8KG | 72 SERV.'),(21,9,4,'CHOCOLATE'),(22,9,4,'VAINILLA'),(23,11,1,'450 GR. | 32 SERV.'),(24,11,1,'1.4 KG | 100 SERV.'),(25,11,4,'FRUIT BURST'),(26,11,4,'ICY BLUE RAZ'),(27,13,1,'500 ML'),(28,13,4,'LEMON & LIME'),(29,13,4,'ICY BLUE RAZ'),(32,50,1,'2kg'),(33,50,1,'100gr.'),(34,50,1,'500gr.'),(35,50,4,'Chocolate'),(36,50,4,'Fresa'),(37,50,3,'Pequeño'),(38,50,3,'Mediano'),(39,50,3,'Grande'),(40,55,1,'300'),(41,55,1,'500'),(42,15,1,'500 ML'),(43,15,4,'BANANA DELIGHT'),(44,15,4,'FUDGE BROWNIE'),(45,15,1,'330 ML'),(46,15,4,'WHITE CHOCOLATE'),(47,15,4,'STRAWBERRIES & CREAM'),(48,15,4,'VANILLA ICE CREAM'),(49,20,1,'Caja'),(50,20,1,'Unidad'),(51,20,4,'SALTED CARAMEL'),(52,20,4,'CHOCOLATE CHIP'),(53,20,4,'DOUBLE CHOCOLATE'),(54,20,4,'WHITE CHOCOLATE & RASPBERRY'),(55,24,4,'WHITE CHOCOLATE CARAMEL'),(56,24,4,'MILK CHOCOLATE CARAMEL'),(57,24,4,'MILK CHOCOLATE PEANUT'),(58,24,1,'Caja'),(59,24,1,'Unidad'),(60,27,4,'GOOEY CHOCOLATE'),(61,27,4,'WHITE CHOCO PEANUT'),(62,27,1,'Caja'),(63,27,1,'Unidad'),(64,32,1,'500 GR'),(65,32,4,'MORA'),(66,32,4,'NARANJA'),(67,47,1,'390 GR'),(68,47,4,'STRAWBERRY MOJITO'),(69,47,4,'SOUR GUMMY BEAR'),(70,47,4,'CANDY ICE BLAST'),(76,56,1,'378 GR'),(77,56,4,'Fruit Punch');
/*!40000 ALTER TABLE `producto_variacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedad_detalle_imagen`
--

DROP TABLE IF EXISTS `propiedad_detalle_imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedad_detalle_imagen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `producto_propiedad_detalle_id` int NOT NULL,
  `estado_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedad_detalle_imagen`
--

LOCK TABLES `propiedad_detalle_imagen` WRITE;
/*!40000 ALTER TABLE `propiedad_detalle_imagen` DISABLE KEYS */;
INSERT INTO `propiedad_detalle_imagen` VALUES (9,'Producto_Extra.png',15,1),(10,'Producti_2.png',16,1),(11,'Producto_tagla.png',16,1),(15,'1731900441771.jpg',1,1),(16,'1731900449850.jpg',1,1),(17,'1731900453473.jpg',1,1),(18,'1731900465499.jpg',2,1),(19,'1731900469288.jpg',2,1),(20,'1731900472774.jpg',2,1),(21,'1731900812307.jpg',3,1),(22,'1731900815697.jpg',3,1),(23,'1731900819191.jpg',3,1),(24,'1731900835121.jpg',6,1),(25,'1731900838060.jpg',6,1),(26,'1731900841561.jpg',6,1),(27,'1731900852068.jpg',7,1),(28,'1731900854942.jpg',7,1),(29,'1731900858065.jpg',7,1),(30,'1731901280375.jpg',4,1),(31,'1731901283433.jpg',4,1),(32,'1731901286457.jpg',4,1),(33,'1731901298941.jpg',5,1),(34,'1731901301888.jpg',5,1),(35,'1731901304860.jpg',5,1),(36,'1731901336025.jpg',8,1),(37,'1731901340693.jpg',8,1),(38,'1731901344493.jpg',8,1),(39,'1731901352983.jpg',9,1),(40,'1731901355821.jpg',9,1),(41,'1731901359777.jpg',9,1),(42,'1731901369559.jpg',10,1),(43,'1731901372245.jpg',10,1),(44,'1731901375416.jpg',10,1),(45,'1731901385560.jpg',11,1),(46,'1731901389476.jpg',11,1),(48,'1731901398555.jpg',11,1),(50,'1731901433663.jpg',12,1),(51,'1731901438464.jpg',12,1),(52,'1731901443137.jpg',12,1),(53,'1731901464004.jpg',13,1),(54,'1731901467793.jpg',13,1),(55,'1731901471634.jpg',13,1),(56,'1731901479948.jpg',14,1),(57,'1731901484428.jpg',14,1),(58,'1731901488404.jpg',14,1);
/*!40000 ALTER TABLE `propiedad_detalle_imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedades`
--

DROP TABLE IF EXISTS `propiedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedades`
--

LOCK TABLES `propiedades` WRITE;
/*!40000 ALTER TABLE `propiedades` DISABLE KEYS */;
INSERT INTO `propiedades` VALUES (1,'Presentación'),(2,'Color'),(3,'Tamaños'),(4,'Sabor');
/*!40000 ALTER TABLE `propiedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recomendado_producto_menu_sub`
--

DROP TABLE IF EXISTS `recomendado_producto_menu_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recomendado_producto_menu_sub` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recomendado_producto_menu_sub`
--

LOCK TABLES `recomendado_producto_menu_sub` WRITE;
/*!40000 ALTER TABLE `recomendado_producto_menu_sub` DISABLE KEYS */;
INSERT INTO `recomendado_producto_menu_sub` VALUES (1,'recomendado'),(2,'menu sub');
/*!40000 ALTER TABLE `recomendado_producto_menu_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redes_sociales`
--

DROP TABLE IF EXISTS `redes_sociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `redes_sociales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redes_sociales`
--

LOCK TABLES `redes_sociales` WRITE;
/*!40000 ALTER TABLE `redes_sociales` DISABLE KEYS */;
INSERT INTO `redes_sociales` VALUES (1,'Facebook','facebook'),(2,'Instagram','instagram'),(3,'Tiktok','tiktok'),(4,'Twitter','twitter');
/*!40000 ALTER TABLE `redes_sociales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_perfil`
--

DROP TABLE IF EXISTS `rol_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_perfil` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_perfil`
--

LOCK TABLES `rol_perfil` WRITE;
/*!40000 ALTER TABLE `rol_perfil` DISABLE KEYS */;
INSERT INTO `rol_perfil` VALUES (1,'Cliente',1),(2,'Team',1),(3,'Team Vip',1),(4,'Familiar',1);
/*!40000 ALTER TABLE `rol_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_TIENDA'),(3,'ROLE_CLIENTE'),(4,'ROLE_ATENCION'),(5,'ROLE_BLOG');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubigeo`
--

DROP TABLE IF EXISTS `ubigeo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubigeo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `region` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provincia` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distrito` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `costo` double NOT NULL,
  `costo_expres` double NOT NULL,
  `estado_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubigeo`
--

LOCK TABLES `ubigeo` WRITE;
/*!40000 ALTER TABLE `ubigeo` DISABLE KEYS */;
INSERT INTO `ubigeo` VALUES (1,'Lima','Canta','Los Olivos',10,0,1),(2,'Ica','Chincha','Paracas',20,0,1),(3,'Piura','Talara','Negritos',30,0,1),(4,'Lima','Lima Metropolitana','San Miguel',40,0,1),(5,'Lima','Lima Metropolitana','Callao',50,0,3);
/*!40000 ALTER TABLE `ubigeo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_direccion`
--

DROP TABLE IF EXISTS `usuario_direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_direccion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `direccion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referencia` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mapa` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_direccion`
--

LOCK TABLES `usuario_direccion` WRITE;
/*!40000 ALTER TABLE `usuario_direccion` DISABLE KEYS */;
INSERT INTO `usuario_direccion` VALUES (1,1,'Direccion Completa 1','Referencia 1',NULL,NULL),(2,5,'Direccion Completa 2','Referencia 2',NULL,NULL),(3,5,'Direccion Completa 3','Referencia 3',NULL,NULL),(4,5,'Direccion Completa 4','Referencia 3',NULL,NULL),(5,22,'','',NULL,NULL),(6,23,'AV. MALVAS 348','FRENTE AL CAMPO DEPORTIVO',NULL,NULL),(7,22,'esta es una direccion de prueba','esta es una referencia de prueba',NULL,NULL),(8,22,'aasdasd','asdasda',NULL,NULL);
/*!40000 ALTER TABLE `usuario_direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_perfil`
--

DROP TABLE IF EXISTS `usuario_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_perfil` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_id` int NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `tipo_documento` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DNI',
  `nro_documento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '45986541',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_perfil`
--

LOCK TABLES `usuario_perfil` WRITE;
/*!40000 ALTER TABLE `usuario_perfil` DISABLE KEYS */;
INSERT INTO `usuario_perfil` VALUES (1,'Elvis','Alcantara','989 898 847',1,NULL,'DNI','45986541'),(4,'Shanady','Estrada','933162322',2,NULL,'DNI','45986541'),(6,'Monica','Apellll','989 898 847',3,NULL,'DNI','45986541'),(7,'Manuel','Fuentes','955 782 428',4,NULL,'DNI','45986541'),(10,'Cliente','Ejemplo','933162322',5,NULL,'DNI','45986541'),(17,'Gian','Estrada Orosco','933162322',18,NULL,'DNI','45986541'),(18,'Cliente2','Cliente2','933162322',19,NULL,'DNI','45986541'),(19,'Cliente','Estrada','933162322',20,NULL,'DNI','45986541'),(20,'Shanady','Estrada','933162322',21,NULL,'DNI','45986541'),(21,'Juan','Arce','912345676',22,NULL,'DNI','45986541'),(22,'PRUEBA ALONSO','PRUEBA ARCE','987654321',23,NULL,'DNI','45986541'),(30,'Jose','Quevedo','933419609',25,NULL,'DNI','45986541'),(31,'Jose','Quevedo','',26,NULL,'DNI','45986541'),(32,'Jose','Palma','',27,NULL,'DNI','45986541'),(33,'Juan José','Pérez Lazarte','963258741',24,'2000-01-01','DNI','74123658'),(36,'Jose','Carhuas','1231231345',29,NULL,'DNI','45986541'),(37,'Felix','Aponte','123123123',28,NULL,'DNI','45986541');
/*!40000 ALTER TABLE `usuario_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_rol`
--

DROP TABLE IF EXISTS `usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_rol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `rol_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_rol`
--

LOCK TABLES `usuario_rol` WRITE;
/*!40000 ALTER TABLE `usuario_rol` DISABLE KEYS */;
INSERT INTO `usuario_rol` VALUES (5,1,1),(7,4,4),(9,3,1),(10,3,3),(11,5,3),(12,6,3),(37,11,3),(38,12,3),(39,13,3),(40,14,3),(41,15,3),(42,16,3),(43,17,3),(44,18,2),(45,19,5),(46,20,3),(47,21,3),(48,22,3),(49,23,3),(50,24,3),(51,25,3),(52,26,1),(53,27,3),(55,28,4),(56,29,3);
/*!40000 ALTER TABLE `usuario_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `correo` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_id` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `ultimo_acceso` datetime DEFAULT NULL,
  `rol_perfil_id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'elvis@hotmail.com','$2a$10$pkApjQ5udhFNyvvndivuMuNrp84.GiFhjm4uz1EmupYI6QAv2ZIaa','1','2024-03-07 00:00:00','2024-05-31 00:00:00','2'),(2,'shanady@gmail.com','$2a$10$pXfYSk3aMBrxKnmG.COfpOdlj4zQ5DuAuNLTH/fGWLrRdpGQ1JIqq','1','2024-03-07 00:00:00','2024-05-31 00:00:00','2'),(3,'monica@hotmail.com','$2a$10$B.pweq1kqya4a7W7kntZ5ecE.wJngBp/A9Oy/7rDyjXtK7GRFj3t2','1','2024-03-07 00:00:00','2024-05-31 00:00:00','1'),(4,'atencion@hotmail.com','$2a$2a$10$Es8werQuA50cfFb6VcKVbOSPr3GQCqYyGxH30fPOxNk0N.pAVf1bu','1','2024-03-12 00:00:00','2024-05-31 00:00:00','1'),(5,'cliente@gmail.com','$2a$10$Fs04VC7yIGINBPB.0SuTM.EUk1POIwf6O.wc4mT83f7Knku71gKL2','1','2024-03-13 00:00:00','2024-05-31 00:00:00','1'),(18,'tienda@gmail.com','$2a$10$9Ufe7jhw6XeyB8.fCeEEYuKO/Yh4.3ftgwBRQVElfWc/X1NUS2ZwG','1','2024-03-27 00:00:00','2024-05-31 00:00:00','1'),(19,'blog@hotmail.com','$2a$10$9ED//Q2vCnIEOeQoIVPBDeDy4dn94ZxKJnra/crpl3lFm.Ec4flh.','1','2024-03-27 00:00:00','2024-05-31 00:00:00','1'),(20,'lou@gmail.com','$2a$10$KRohNA8kH3TP15Ck2HLe5OgsS1iNDorv7SVRfB/Qbh34LoJyx3IcK','3','2024-03-28 00:00:00','2024-05-31 00:00:00','1'),(21,'louu@gmail.com','$2a$10$E7738aFuiiQWh4tiLVzTEukU48ac2CCGDZw1Hrs5sHrRyJPkon.BW','3','2024-03-28 00:00:00','2024-05-31 00:00:00','1'),(22,'juan@gmail.com','$2a$10$4yCOwuZ6HRZHY9jd8MutgOKWYUpyZytFya5vdcZ8iPnvJmXGQJnU6','3','2024-04-14 00:00:00','2024-05-31 00:00:00','1'),(23,'PRUEBA@GMAIL.COM','$2a$10$6/t9q9Xs6B2tszNepMr1he3nxPm8R3EOyFE11FAMAWvicixC5w576','1','2024-05-29 00:00:00','2024-05-31 00:00:00','1'),(24,'juanjoseperezlazarte12@gmail.com','$2a$10$MJWApri4BHTAuo/jxbBL9uTnvi8KtGJtsNigE5i7OnRWTUDAa8EpW','1','2024-11-15 00:00:00','2024-05-31 00:00:00','3'),(25,'j.quevedo0412@gmail.com','$2a$10$ppXDggQb4/2aXqi6Hdr6QegEJXoKeR8Q9ZPeI7lK933xO86y1cVr6','1','2024-11-05 00:00:00',NULL,'1'),(26,'j.quevedo@muscleshopperu.com','$2a$10$bRPQUQuHJyjt2E9nXoisY.lN6bb2Ljxqivd703LWQ7MsM5N2l4AM2','1','2024-11-05 00:00:00',NULL,'1'),(27,'jorgepalma@gmail.com','$2a$10$91DBq6Q5PRFcvJclrd7Tw.aMHtRk9nur7fl8LvIqtNUuwPNt6IE32','1','2024-11-05 00:00:00',NULL,'1'),(28,'felixaponte@gmail.com','$2a$10$la38Q6YYJEP5OAVec5xUH.Ur3JFuBWO1/DKv9ygxuAA.1mNw4KJy2','3','2024-11-16 00:00:00',NULL,'2'),(29,'carhuas@gmail.com','$2a$10$KxqwPDuw1AnjIgv.PlwqY.i6ekDQvjCSSZri5ogcAGQSZ3u5CpXga','1','2024-11-16 00:00:00',NULL,'1');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-20 18:06:19
