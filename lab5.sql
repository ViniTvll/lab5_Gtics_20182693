CREATE DATABASE  IF NOT EXISTS `lab5` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lab5`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: lab5
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas` (
  `idAreas` int NOT NULL,
  `nombreArea` varchar(45) NOT NULL,
  PRIMARY KEY (`idAreas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'Psiquiatria'),(2,'Neurologia'),(3,'Psicologia'),(4,'Terapia Ocupacional');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canciones`
--

DROP TABLE IF EXISTS `canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canciones` (
  `idCanciones` int NOT NULL,
  `nombreCancion` varchar(45) NOT NULL,
  `tipoCancion` int NOT NULL,
  `idRecurso` int NOT NULL,
  PRIMARY KEY (`idCanciones`,`idRecurso`),
  KEY `fk_Canciones_Recursos1_idx` (`idRecurso`),
  CONSTRAINT `fk_Canciones_Recursos1` FOREIGN KEY (`idRecurso`) REFERENCES `recursos` (`idRecursos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canciones`
--

LOCK TABLES `canciones` WRITE;
/*!40000 ALTER TABLE `canciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `canciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `idCitas` int NOT NULL AUTO_INCREMENT,
  `motivoConsulta` varchar(45) NOT NULL,
  `idPaciente` int NOT NULL,
  `idArea` int NOT NULL,
  `idProfesional` int NOT NULL,
  `idSede` int NOT NULL,
  `idFechaConsulta` int NOT NULL,
  `idRiesgo` int NOT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `Citascol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCitas`),
  KEY `fk_Citas_Fechas1_idx` (`idFechaConsulta`,`idProfesional`),
  KEY `fk_Citas_Areas1_idx` (`idArea`),
  KEY `fk_Citas_Sedes1_idx` (`idSede`),
  KEY `fk_Citas_Pacientes1_idx` (`idPaciente`),
  KEY `fk_Citas_Riesgos1_idx` (`idRiesgo`),
  CONSTRAINT `fk_Citas_Areas1` FOREIGN KEY (`idArea`) REFERENCES `areas` (`idAreas`),
  CONSTRAINT `fk_Citas_Fechas1` FOREIGN KEY (`idFechaConsulta`, `idProfesional`) REFERENCES `fechas` (`idFechas`, `idProfesional`),
  CONSTRAINT `fk_Citas_Pacientes1` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`idPacientes`),
  CONSTRAINT `fk_Citas_Riesgos1` FOREIGN KEY (`idRiesgo`) REFERENCES `riesgos` (`idRiesgos`),
  CONSTRAINT `fk_Citas_Sedes1` FOREIGN KEY (`idSede`) REFERENCES `sedes` (`idSedes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fechas`
--

DROP TABLE IF EXISTS `fechas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fechas` (
  `idFechas` int NOT NULL,
  `fechaDisponibilidad` date NOT NULL,
  `idProfesional` int NOT NULL,
  PRIMARY KEY (`idFechas`,`idProfesional`),
  KEY `fk_Fechas_Profesionales1_idx` (`idProfesional`),
  CONSTRAINT `fk_Fechas_Profesionales1` FOREIGN KEY (`idProfesional`) REFERENCES `profesionales` (`idProfesionales`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fechas`
--

LOCK TABLES `fechas` WRITE;
/*!40000 ALTER TABLE `fechas` DISABLE KEYS */;
/*!40000 ALTER TABLE `fechas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foro`
--

DROP TABLE IF EXISTS `foro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foro` (
  `idForo` int NOT NULL,
  `comentario` varchar(45) NOT NULL,
  `nombrePersona` varchar(45) NOT NULL,
  PRIMARY KEY (`idForo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foro`
--

LOCK TABLES `foro` WRITE;
/*!40000 ALTER TABLE `foro` DISABLE KEYS */;
/*!40000 ALTER TABLE `foro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frases`
--

DROP TABLE IF EXISTS `frases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frases` (
  `idFrases` int NOT NULL,
  `frase` varchar(45) DEFAULT NULL,
  `idRecurso` int NOT NULL,
  PRIMARY KEY (`idFrases`,`idRecurso`),
  KEY `fk_Frases_Recursos1_idx` (`idRecurso`),
  CONSTRAINT `fk_Frases_Recursos1` FOREIGN KEY (`idRecurso`) REFERENCES `recursos` (`idRecursos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frases`
--

LOCK TABLES `frases` WRITE;
/*!40000 ALTER TABLE `frases` DISABLE KEYS */;
/*!40000 ALTER TABLE `frases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `idPacientes` int NOT NULL AUTO_INCREMENT,
  `nombrePaciente` varchar(45) DEFAULT NULL,
  `DNI` varchar(45) DEFAULT NULL,
  `Edad` int DEFAULT NULL,
  `Pacientescol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPacientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesionales`
--

DROP TABLE IF EXISTS `profesionales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesionales` (
  `idProfesionales` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `imagen` varchar(45) NOT NULL,
  `descripcionProfesional` varchar(90) NOT NULL,
  `idArea` int NOT NULL,
  `idSede` int NOT NULL,
  PRIMARY KEY (`idProfesionales`),
  KEY `fk_Profesionales_Areas_idx` (`idArea`),
  KEY `fk_Profesionales_Sedes1_idx` (`idSede`),
  CONSTRAINT `fk_Profesionales_Areas` FOREIGN KEY (`idArea`) REFERENCES `areas` (`idAreas`),
  CONSTRAINT `fk_Profesionales_Sedes1` FOREIGN KEY (`idSede`) REFERENCES `sedes` (`idSedes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesionales`
--

LOCK TABLES `profesionales` WRITE;
/*!40000 ALTER TABLE `profesionales` DISABLE KEYS */;
INSERT INTO `profesionales` VALUES (1,'Leonardo Campos','','.',1,1),(2,' Ronald Boyer','','.',1,2),(3,'Karla Pezo','','.',1,3),(4,'Mayra Gonzales','','.',2,4),(5,' Franco Lazo','','.',2,5),(6,'Victor Guerra','','.',3,1),(7,'Paolo Valiente','','..',3,2),(8,'Alonso Llanos','','.',3,3),(9,' Diego Torres','','.',4,4),(10,'Piero Mendoza','','.',4,5),(11,'Hellen Aranda','','.',4,1);
/*!40000 ALTER TABLE `profesionales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recursos`
--

DROP TABLE IF EXISTS `recursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recursos` (
  `idRecursos` int NOT NULL,
  PRIMARY KEY (`idRecursos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recursos`
--

LOCK TABLES `recursos` WRITE;
/*!40000 ALTER TABLE `recursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `recursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riesgos`
--

DROP TABLE IF EXISTS `riesgos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riesgos` (
  `idRiesgos` int NOT NULL,
  `Bajo` int NOT NULL,
  `Moderado` int NOT NULL,
  `Alto` int NOT NULL,
  `Muy Alto` int NOT NULL,
  PRIMARY KEY (`idRiesgos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riesgos`
--

LOCK TABLES `riesgos` WRITE;
/*!40000 ALTER TABLE `riesgos` DISABLE KEYS */;
/*!40000 ALTER TABLE `riesgos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sedes`
--

DROP TABLE IF EXISTS `sedes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sedes` (
  `idSedes` int NOT NULL,
  `nombreSede` varchar(45) NOT NULL,
  PRIMARY KEY (`idSedes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sedes`
--

LOCK TABLES `sedes` WRITE;
/*!40000 ALTER TABLE `sedes` DISABLE KEYS */;
INSERT INTO `sedes` VALUES (1,'San Martin'),(2,'Lima'),(3,'Arequipa'),(4,'Trujillo'),(5,'Ayacucho');
/*!40000 ALTER TABLE `sedes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-28 17:26:20
