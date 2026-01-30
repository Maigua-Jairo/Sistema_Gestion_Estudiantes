-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema_asistencia
-- ------------------------------------------------------
-- Server version	8.0.44

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

--
-- Table structure for table `asignacion`
--

DROP TABLE IF EXISTS `asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignacion` (
  `id_asignacion` int NOT NULL AUTO_INCREMENT,
  `id_docente` int NOT NULL,
  `id_materia` int NOT NULL,
  `id_curso` int NOT NULL,
  `periodo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_asignacion`),
  KEY `id_docente` (`id_docente`),
  KEY `id_materia` (`id_materia`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `asignacion_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  CONSTRAINT `asignacion_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`),
  CONSTRAINT `asignacion_ibfk_3` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacion`
--

LOCK TABLES `asignacion` WRITE;
/*!40000 ALTER TABLE `asignacion` DISABLE KEYS */;
INSERT INTO `asignacion` VALUES (1,1,1,1,'2025-A'),(2,2,2,2,'2025-A'),(3,3,3,3,'2025-A'),(4,4,4,4,'2025-A'),(5,5,5,5,'2025-A'),(6,6,6,6,'2025-A'),(7,7,7,7,'2025-A'),(8,8,8,8,'2025-A'),(9,9,9,9,'2025-A'),(10,10,10,10,'2025-A');
/*!40000 ALTER TABLE `asignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencia` (
  `id_asistencia` int NOT NULL AUTO_INCREMENT,
  `id_matricula` int NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`id_asistencia`),
  KEY `id_matricula` (`id_matricula`),
  CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`id_matricula`) REFERENCES `matricula` (`id_matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
INSERT INTO `asistencia` VALUES (1,1,'2025-01-10','presente'),(2,2,'2025-01-10','presente'),(3,3,'2025-01-10','ausente'),(4,4,'2025-01-10','presente'),(5,5,'2025-01-10','ausente'),(6,6,'2025-01-10','presente'),(7,7,'2025-01-10','presente'),(8,8,'2025-01-10','ausente'),(9,9,'2025-01-10','presente'),(10,10,'2025-01-10','ausente');
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `id_curso` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `periodo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Segundo Software A','2025-A'),(2,'Segundo Software B','2025-A'),(3,'Tercero Software A','2025-A'),(4,'Tercero Software B','2025-A'),(5,'Cuarto Software A','2025-A'),(6,'Cuarto Software B','2025-A'),(7,'Quinto Software A','2025-A'),(8,'Quinto Software B','2025-A'),(9,'Sexto Software A','2025-A'),(10,'Sexto Software B','2025-A');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `id_docente` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_docente`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (1,'Ana','Martinez','ana.martinez@epn.edu.ec'),(2,'Luis','Gomez','luis.gomez@epn.edu.ec'),(3,'Pedro','Salazar','pedro.salazar@epn.edu.ec'),(4,'Rosa','Villacis','rosa.villacis@epn.edu.ec'),(5,'Jorge','Molina','jorge.molina@epn.edu.ec'),(6,'Paula','Espinoza','paula.espinoza@epn.edu.ec'),(7,'Fernando','Reinoso','fernando.reinoso@epn.edu.ec'),(8,'Lucia','Benitez','lucia.benitez@epn.edu.ec'),(9,'Marco','Chavez','marco.chavez@epn.edu.ec'),(10,'Elena','Cruz','elena.cruz@epn.edu.ec');
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `id_estudiante` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_estudiante`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (1,'Juan','Perez','juan.perez@epn.edu.ec','activo'),(2,'Maria','Lopez','maria.lopez@epn.edu.ec','activo'),(3,'Carlos','Vera','carlos.vera@epn.edu.ec','activo'),(4,'Ana','Mendoza','ana.mendoza@epn.edu.ec','activo'),(5,'Luis','Ortega','luis.ortega@epn.edu.ec','activo'),(6,'Sofia','Ramos','sofia.ramos@epn.edu.ec','activo'),(7,'Diego','Paredes','diego.paredes@epn.edu.ec','activo'),(8,'Valeria','Castro','valeria.castro@epn.edu.ec','activo'),(9,'Andres','Navarro','andres.navarro@epn.edu.ec','activo'),(10,'Camila','Torres','camila.torres@epn.edu.ec','activo'),(11,'Jairo','Maigua','jairo.maigua@epn.edu.ec','bloqueado');
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `justificacion`
--

DROP TABLE IF EXISTS `justificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `justificacion` (
  `id_justificacion` int NOT NULL AUTO_INCREMENT,
  `id_asistencia` int NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `aprobado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_justificacion`),
  KEY `id_asistencia` (`id_asistencia`),
  CONSTRAINT `justificacion_ibfk_1` FOREIGN KEY (`id_asistencia`) REFERENCES `asistencia` (`id_asistencia`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `justificacion`
--

LOCK TABLES `justificacion` WRITE;
/*!40000 ALTER TABLE `justificacion` DISABLE KEYS */;
INSERT INTO `justificacion` VALUES (1,1,'Enfermedad',1),(2,2,'Problemas familiares',1),(3,3,'Cita medica',1),(4,4,'Viaje',0),(5,5,'Retraso',0),(6,6,'Actividad institucional',1),(7,7,'Permiso especial',1),(8,8,'Emergencia',1),(9,9,'Fuerza mayor',1),(10,10,'Otro motivo',0);
/*!40000 ALTER TABLE `justificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `id_materia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `creditos` int NOT NULL,
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'Base de Datos',4),(2,'Programacion I',5),(3,'Programacion II',5),(4,'Matematicas Discretas',4),(5,'Sistemas Operativos',4),(6,'Redes de Computadoras',4),(7,'Ingenieria de Software',5),(8,'Estructura de Datos',4),(9,'Arquitectura de Computadores',4),(10,'Seguridad Informatica',4);
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula` (
  `id_matricula` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int NOT NULL,
  `id_materia` int NOT NULL,
  `id_curso` int NOT NULL,
  PRIMARY KEY (`id_matricula`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_materia` (`id_materia`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`),
  CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`),
  CONSTRAINT `matricula_ibfk_3` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` VALUES (1,1,1,1),(2,2,2,2),(3,3,3,3),(4,4,4,4),(5,5,5,5),(6,6,6,6),(7,7,7,7),(8,8,8,8),(9,9,9,9),(10,10,10,10);
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_asistencia_general`
--

DROP TABLE IF EXISTS `vista_asistencia_general`;
/*!50001 DROP VIEW IF EXISTS `vista_asistencia_general`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_asistencia_general` AS SELECT 
 1 AS `nombres`,
 1 AS `apellidos`,
 1 AS `Materia`,
 1 AS `fecha`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_asistencia_general`
--

/*!50001 DROP VIEW IF EXISTS `vista_asistencia_general`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_asistencia_general` AS select `e`.`nombres` AS `nombres`,`e`.`apellidos` AS `apellidos`,`ma`.`nombre` AS `Materia`,`a`.`fecha` AS `fecha`,`a`.`estado` AS `estado` from (((`asistencia` `a` join `matricula` `m` on((`a`.`id_matricula` = `m`.`id_matricula`))) join `estudiante` `e` on((`m`.`id_estudiante` = `e`.`id_estudiante`))) join `materia` `ma` on((`m`.`id_materia` = `ma`.`id_materia`))) */;
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

-- Dump completed on 2026-01-29 14:24:39
