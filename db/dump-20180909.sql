-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bd2_mateus
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.31-MariaDB

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `alu_matricula` varchar(10) NOT NULL,
  `alu_nome` varchar(50) NOT NULL,
  PRIMARY KEY (`alu_matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES ('1111111111','Daenerys Targaryen'),('2222222222','Gregor Clegane'),('3333333333','Lady Brienne'),('4444444444','Jon Snow'),('5555555555','Tyrion Lannister'),('6666666666','Davos Seaworth'),('7777777777','Ramsay Snow'),('8888888888','Margaery Tyrell');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota`
--

DROP TABLE IF EXISTS `nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota` (
  `not_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `alu_matricula` varchar(10) NOT NULL,
  `not_nota` decimal(10,2) NOT NULL,
  PRIMARY KEY (`not_codigo`,`alu_matricula`),
  KEY `alu_matricula` (`alu_matricula`),
  CONSTRAINT `nota_ibfk_1` FOREIGN KEY (`alu_matricula`) REFERENCES `aluno` (`alu_matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota`
--

LOCK TABLES `nota` WRITE;
/*!40000 ALTER TABLE `nota` DISABLE KEYS */;
INSERT INTO `nota` VALUES (18,'1111111111',7.30),(19,'1111111111',6.80),(20,'1111111111',7.79),(21,'2222222222',2.34),(22,'2222222222',3.10),(23,'2222222222',2.58),(24,'3333333333',6.23),(25,'3333333333',6.49),(26,'3333333333',6.41),(27,'4444444444',7.44),(28,'4444444444',8.05),(29,'4444444444',7.23),(30,'5555555555',9.67),(31,'5555555555',8.94),(32,'5555555555',9.46),(33,'6666666666',3.56),(34,'6666666666',0.00),(35,'6666666666',1.42),(36,'7777777777',5.00),(37,'7777777777',6.00),(38,'7777777777',7.00),(39,'8888888888',7.68),(40,'8888888888',7.33),(41,'8888888888',8.21);
/*!40000 ALTER TABLE `nota` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-09 10:58:15
