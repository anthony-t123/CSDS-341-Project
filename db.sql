-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: votes
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.2

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
-- Current Database: `votes`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `votes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `votes`;

--
-- Table structure for table `Candidate`
--

DROP TABLE IF EXISTS `Candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Candidate` (
  `CandidateName` varchar(50) NOT NULL,
  `Year` int NOT NULL,
  `Age` int DEFAULT NULL,
  `HomeState` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CandidateName`,`Year`),
  KEY `HomeState` (`HomeState`),
  CONSTRAINT `Candidate_ibfk_1` FOREIGN KEY (`HomeState`) REFERENCES `States` (`StateName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Candidate`
--

LOCK TABLES `Candidate` WRITE;
/*!40000 ALTER TABLE `Candidate` DISABLE KEYS */;
/*!40000 ALTER TABLE `Candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `County`
--

DROP TABLE IF EXISTS `County`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `County` (
  `CountyName` varchar(50) NOT NULL,
  `StateName` varchar(50) NOT NULL,
  PRIMARY KEY (`CountyName`,`StateName`),
  KEY `StateName` (`StateName`),
  CONSTRAINT `County_ibfk_1` FOREIGN KEY (`StateName`) REFERENCES `States` (`StateName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `County`
--

LOCK TABLES `County` WRITE;
/*!40000 ALTER TABLE `County` DISABLE KEYS */;
/*!40000 ALTER TABLE `County` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nominates`
--

DROP TABLE IF EXISTS `Nominates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Nominates` (
  `CandidateName` varchar(50) NOT NULL,
  `Year` int NOT NULL,
  `PartyName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CandidateName`,`Year`),
  KEY `PartyName` (`PartyName`),
  CONSTRAINT `Nominates_ibfk_1` FOREIGN KEY (`CandidateName`, `Year`) REFERENCES `Candidate` (`CandidateName`, `Year`),
  CONSTRAINT `Nominates_ibfk_2` FOREIGN KEY (`PartyName`) REFERENCES `Political_Party` (`PartyName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nominates`
--

LOCK TABLES `Nominates` WRITE;
/*!40000 ALTER TABLE `Nominates` DISABLE KEYS */;
/*!40000 ALTER TABLE `Nominates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Political_Party`
--

DROP TABLE IF EXISTS `Political_Party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Political_Party` (
  `PartyName` varchar(50) NOT NULL,
  `Color` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PartyName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Political_Party`
--

LOCK TABLES `Political_Party` WRITE;
/*!40000 ALTER TABLE `Political_Party` DISABLE KEYS */;
/*!40000 ALTER TABLE `Political_Party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `States`
--

DROP TABLE IF EXISTS `States`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `States` (
  `StateName` varchar(50) NOT NULL,
  `Abbreviation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`StateName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `States`
--

LOCK TABLES `States` WRITE;
/*!40000 ALTER TABLE `States` DISABLE KEYS */;
/*!40000 ALTER TABLE `States` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Statistics`
--

DROP TABLE IF EXISTS `Statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Statistics` (
  `StateName` varchar(50) NOT NULL,
  `Year` varchar(50) NOT NULL,
  `ElectoralVotes` int DEFAULT NULL,
  `StatePop` int DEFAULT NULL,
  PRIMARY KEY (`StateName`,`Year`),
  CONSTRAINT `Statistics_ibfk_1` FOREIGN KEY (`StateName`) REFERENCES `States` (`StateName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Statistics`
--

LOCK TABLES `Statistics` WRITE;
/*!40000 ALTER TABLE `Statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `Statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vote_Count`
--

DROP TABLE IF EXISTS `Vote_Count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vote_Count` (
  `CandidateName` varchar(50) NOT NULL,
  `Year` int NOT NULL,
  `CountyName` varchar(50) NOT NULL,
  `Count` int DEFAULT NULL,
  PRIMARY KEY (`CandidateName`,`Year`,`CountyName`),
  KEY `CountyName` (`CountyName`),
  CONSTRAINT `Vote_Count_ibfk_1` FOREIGN KEY (`CandidateName`, `Year`) REFERENCES `Candidate` (`CandidateName`, `Year`),
  CONSTRAINT `Vote_Count_ibfk_2` FOREIGN KEY (`CountyName`) REFERENCES `County` (`CountyName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vote_Count`
--

LOCK TABLES `Vote_Count` WRITE;
/*!40000 ALTER TABLE `Vote_Count` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vote_Count` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-25 17:11:16
