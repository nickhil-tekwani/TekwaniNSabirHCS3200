CREATE DATABASE  IF NOT EXISTS `Northeastern` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Northeastern`;
-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: localhost    Database: Northeastern
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `advisor`
--

DROP TABLE IF EXISTS `advisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advisor` (
  `advisor_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `master_id` int(11) NOT NULL,
  PRIMARY KEY (`advisor_id`),
  KEY `master_id` (`master_id`),
  CONSTRAINT `advisor_ibfk_1` FOREIGN KEY (`master_id`) REFERENCES `faculty` (`faculty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advisor`
--

LOCK TABLES `advisor` WRITE;
/*!40000 ALTER TABLE `advisor` DISABLE KEYS */;
INSERT INTO `advisor` VALUES (1,'Co-Op',1),(2,'Academic',3),(3,'Co-Op',2);
/*!40000 ALTER TABLE `advisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `building_id` int(11) NOT NULL AUTO_INCREMENT,
  `building_name` varchar(50) NOT NULL,
  `street_name` varchar(40) NOT NULL,
  `street_number` int(11) NOT NULL,
  `zipcode` varchar(5) NOT NULL,
  PRIMARY KEY (`building_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'White Hall','Forsyth St',21,'02115'),(2,'Speare Hall','Speare Pl',10,'02115'),(3,'Richards Hall','Huntington Ave',360,'02115'),(4,'Dodge Hall','Huntington Ave',360,'02115'),(5,'Shillman Hall','Forsyth St',115,'02115'),(6,'Stetson Hall East','Speare Pl',11,'02115'),(7,'Stetson Hall West','Forsyth St',10,'02115'),(8,'International Village','Tremont St',1155,'02120'),(9,'LightView','Columbus Ave',744,'02120'),(10,'Davenport Commons A','Columbus Ave',700,'02120'),(11,'Davenport Commons B','Columbus Ave',696,'02118'),(12,'West Village A','Parker St',510,'02115'),(13,'West Village B','Parker St',460,'02120'),(14,'West Village C','Parker St',480,'02115'),(15,'West Village E','Leon St',10,'02115'),(16,'West Village F','Leon St',40,'02115'),(17,'West Village G','Parker St',450,'02115'),(18,'West Village H','Huntington Ave',440,'02115');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(50) NOT NULL,
  `course_number` varchar(40) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Fundamentals of Computer Science 1','CS2500',2),(2,'Fundamentals of Computer Science 2','CS2510',2),(3,'Object Oriented Design','CS3500',2),(4,'Financial Accounting','ACCT1201',4),(5,'Managerial Accounting','ACCT2301',4),(6,'Principles of Microeconomics','ECON1115',3),(7,'Principles of Macroeconomics','ECON1116',3),(8,'Calculus 1 For Science/Engineering','MATH1341',1),(9,'Calculus 2 For Science/Engineering','MATH1342',1),(10,'Programming with Data','DS2000',10);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) NOT NULL,
  `department_building` int(11) NOT NULL,
  PRIMARY KEY (`department_id`),
  KEY `department_building` (`department_building`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`department_building`) REFERENCES `building` (`building_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Mathematics',5),(2,'Computer Science',18),(3,'Economics',3),(4,'Accounting',3),(5,'Finance',5),(6,'Business',4),(7,'Communications',3),(8,'Journalism',5),(9,'Cybersecurity',18),(10,'Data Science',18);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `faculty_id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_firstname` varchar(50) NOT NULL,
  `faculty_lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `department_id` int(11) NOT NULL,
  `isFullTime` tinyint(1) NOT NULL,
  PRIMARY KEY (`faculty_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'John','Doe','doe.j@northeastern.edu',1,1),(2,'Michael','Scott','scott.m@northeastern.edu',2,0),(3,'Alan','Barman','barman.a@northeastern.edu',1,0),(4,'Ganesh','Krishnan','krishnan.g@',4,1),(5,'Niko','Bellic','bellic.n@northeastern.edu',2,1),(6,'Caleb','Brown','brown.c@northeastern.edu',5,0),(7,'Cynthia','Fernandes','fernandes.c@northeastern.edu',6,1),(8,'Rachael','Jones','jones.r@northeastern.edu',7,0),(9,'Mariam','Sheikh','sheikh.m@northeastern.edu',8,1),(10,'Kerriann','Ong','ong.k@northeastern.edu',9,1);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_faculty_update` BEFORE UPDATE ON `faculty` FOR EACH ROW INSERT INTO faculty_audit
 SET action = 'update',
     facultyid = OLD.faculty_id,
     lastname = OLD.faculty_lastname,
     changedat = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `faculty_audit`
--

DROP TABLE IF EXISTS `faculty_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facultyID` int(11) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `changedat` datetime DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_audit`
--

LOCK TABLES `faculty_audit` WRITE;
/*!40000 ALTER TABLE `faculty_audit` DISABLE KEYS */;
INSERT INTO `faculty_audit` VALUES (1,1,'Doe','2019-12-04 21:57:49','update');
/*!40000 ALTER TABLE `faculty_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facultyTeachesCourse`
--

DROP TABLE IF EXISTS `facultyTeachesCourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facultyTeachesCourse` (
  `faculty_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`faculty_id`,`course_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `facultyteachescourse_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `facultyteachescourse_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultyTeachesCourse`
--

LOCK TABLES `facultyTeachesCourse` WRITE;
/*!40000 ALTER TABLE `facultyTeachesCourse` DISABLE KEYS */;
INSERT INTO `facultyTeachesCourse` VALUES (2,1),(5,1),(5,2),(5,3),(4,4),(4,5),(1,8),(3,8),(1,9);
/*!40000 ALTER TABLE `facultyTeachesCourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `major` (
  `major_id` int(11) NOT NULL AUTO_INCREMENT,
  `major_name` varchar(50) NOT NULL,
  `department_id` int(11) NOT NULL,
  `isCombined` tinyint(1) NOT NULL,
  PRIMARY KEY (`major_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `major_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (1,'Computer Science',2,0),(2,'Computer Science and Computer Engineering',2,1),(3,'Computer Science and Biology',2,1),(4,'Computer Science and Business',2,1),(5,'Business Administration',6,0),(6,'Business Administration and Psychology',6,1),(7,'Mathematics and Business Administration',1,1),(8,'Data Science',10,0),(9,'Communications',7,0);
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `majorRequiresCourse`
--

DROP TABLE IF EXISTS `majorRequiresCourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `majorRequiresCourse` (
  `major_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`major_id`,`course_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `majorrequirescourse_ibfk_1` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `majorrequirescourse_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `majorRequiresCourse`
--

LOCK TABLES `majorRequiresCourse` WRITE;
/*!40000 ALTER TABLE `majorRequiresCourse` DISABLE KEYS */;
INSERT INTO `majorRequiresCourse` VALUES (1,1),(1,2),(1,3),(5,4),(5,5),(4,6),(4,7),(7,8),(7,9),(8,10);
/*!40000 ALTER TABLE `majorRequiresCourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `professor_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(8) NOT NULL,
  `master_id` int(11) NOT NULL,
  PRIMARY KEY (`professor_id`),
  KEY `master_id` (`master_id`),
  CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`master_id`) REFERENCES `faculty` (`faculty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (2,'visiting',5);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) NOT NULL,
  `master_id` int(11) NOT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `master_id` (`master_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`master_id`) REFERENCES `faculty` (`faculty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'maintenance',8),(2,'dining hall',9),(3,'IT',10);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `nuid` int(11) NOT NULL AUTO_INCREMENT,
  `student_firstname` varchar(50) NOT NULL,
  `student_lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `major_id` int(11) NOT NULL,
  PRIMARY KEY (`nuid`),
  KEY `major_id` (`major_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Hriday','Sabir','sabir.h@husky.neu.edu','8574729079',1),(2,'Nickhil','Tekwani','tekwani.n@husky.neu.edu','6174728531',2),(3,'Nitin','Reddy','reddy.n@husky.neu.edu','5723409742',3),(4,'Sam','Drew','drew.s@husky.neu.edu','2839743894',4),(5,'Jasmine','Aung','aung.j@husky.neu.edu','2348732772',5),(6,'Arbaab','Basha','basha.a@husky.neu.edu','8570062522',2),(7,'Catherine','Jacobs','jacobs.c@husky.neu.edu','9172873633',9),(8,'Alex','Ramirez','ramirez.a@husky.neu.edu','8572836288',6),(9,'Christy ','Ryan','ryan.c@husky.neu.edu','3962661880',1),(10,'Nathan ','Soto','soto.n@husky.neu.edu','6539189025',5),(12,'Gabriel ','Jackson','jackson.g@husky.neu.edu','4766497970',8),(13,'Magdalena','Barth','barth.m@husky.neu.edu','3946328021',4),(14,'Armida','Beavers','beavers.a@husky.neu.edu','2163836360',5),(15,'Ona','Ludwig','ludwig.o@husky.neu.edu','6138517318',6),(16,'Kevin','Bell','bell.k@husky.neu.edu','7346497415',7),(17,'Charles','Long','long.c@husky.neu.edu','9646399379',7),(18,'Andrew','Coleman','coleman.a@husky.neu.edu','2061491981',8),(19,'Arian ','Shields','shields.a@husky.neu.edu','9481181919',8),(20,'Reegan','Knight','knight.r@husky.neu.edu','5857551090',9),(21,'Pascal','Zavala','zavala.p@husky.neu.edu','6892700591',4),(22,'Iqra','Hogan','hogan.i@husky.neu.edu','6568806175',3),(23,'Lianne','Love','love.l@husky.neu.edu','3910880329',1),(24,'Zeynep','Chang','chang.z@husky.neu.edu','6568806175',2),(25,'Isabel','Mullins','mullins.i@husky.neu.edu','2765848847',2),(26,'Kaylee','Baldwin','baldwin.k@husky.neu.edu','6631816995',3),(27,'Sianna','Olsen','olsen.s@husky.neu.edu','3539274240',1);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Northeastern'
--
/*!50003 DROP FUNCTION IF EXISTS `departmenthasmorefaculty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `departmenthasmorefaculty`(
    dept1 CHAR(20),
    dept2 CHAR(20)
) RETURNS int(11)
    DETERMINISTIC
BEGIN

	DECLARE return_var INT;

    SET @sp1_size = (SELECT COUNT(faculty_id) FROM faculty WHERE department_id=dept1 GROUP BY department_id);
    SET @sp2_size = (SELECT COUNT(faculty_id) FROM faculty WHERE department_id=dept2 GROUP BY department_id);
    
    IF (@sp1_size > @sp2_size) THEN
    SET return_var = 1;
    RETURN return_var = 1;
    
    ELSEIF (@sp1_size = @sp2_size) THEN
    SET return_var = 0;
    RETURN return_var;

    ELSE SET return_Var = -1;
    RETURN return_var;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `majorhasmorestudents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `majorhasmorestudents`(
    major1 CHAR(20),
    major2 CHAR(20)
) RETURNS int(11)
    DETERMINISTIC
BEGIN

	DECLARE return_var INT;

    SET @sp1_size = (SELECT COUNT(nuid) FROM student WHERE major_id=major1 GROUP BY major_id);
    SET @sp2_size = (SELECT COUNT(nuid) FROM student WHERE major_id=major2 GROUP BY major_id);
    
    IF (@sp1_size > @sp2_size) THEN
    SET return_var = 1;
    RETURN return_var = 1;
    
    ELSEIF (@sp1_size = @sp2_size) THEN
    SET return_var = 0;
    RETURN return_var;

    ELSE SET return_Var = -1;
    RETURN return_var;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AdvisorAddOrEdit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdvisorAddOrEdit`(
IN _advisor_id int(11),
IN _type varchar(50),
IN _master_id int(11)
)
BEGIN
	IF _advisor_id = "0" THEN 
		INSERT INTO advisor(advisor_id, type, master_id)
        VALUES(_advisor_id, _type, _master_id);
        SET _advisor_id = LAST_INSERT_ID();
	ELSE 
		UPDATE advisor
        SET
        advisor_id = _advisor_id,
        type = _type,
        master_id = _master_id
        WHERE advisor_id = _advisor_id;
	END IF;
    
    SELECT _advisor_id AS "advisor_id";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuildingAddOrEdit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuildingAddOrEdit`(
IN _building_id int(11),
IN _building_name varchar(50),
IN _street_name varchar(40),
IN _street_number int(11),
IN _zipcode varchar(5)
)
BEGIN
	IF _building_id = 0 THEN 
		INSERT INTO building(building_id, building_name, street_name, street_number, zipcode)
        VALUES(_building_id, _building_name, _street_name, _street_number, _zipcode);
        SET _building_id = LAST_INSERT_ID();
	ELSE 
		UPDATE building
        SET
        building_id = _building_id,
        building_name = _building_name,
        street_name = _street_name,
        street_number = _street_number,
        zipcode = _zipcode
        WHERE building_id = _building_id;
	END IF;
    
    SELECT _building_id AS "building_id";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `countcoursebydept` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `countcoursebydept`(IN dept_input INT)
BEGIN
SELECT COUNT(course_id) FROM course
WHERE department_id = dept_input
GROUP BY dept_input;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `countmajor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `countmajor`(IN major_input INT)
BEGIN
SELECT COUNT(nuid) FROM student
WHERE major_id = major_input
GROUP BY major_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `countstudentsbyALLmajor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `countstudentsbyALLmajor`()
BEGIN
SELECT major_name, COUNT(nuid) FROM student
INNER JOIN major
ON student.major_id = major.major_id
GROUP BY major_name;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CourseAddOrEdit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CourseAddOrEdit`(
IN _course_id int(11),
IN _course_name varchar(50),
IN _course_number int(11),
IN _department_id int(11)
)
BEGIN
	IF _course_id = "0" THEN 
		INSERT INTO course(course_id, course_name, course_number, department_id)
        VALUES(_course_id, _course_name, _course_number, _department_id);
        SET _course_id = LAST_INSERT_ID();
	ELSE 
		UPDATE course
        SET
        course_id = _course_id,
        course_name = _course_name,
        course_number = _course_number,
        department_id = _department_id
        WHERE course_id = _course_id;
	END IF;
    
    SELECT _course_id AS "course_id";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DepartmentAddOrEdit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DepartmentAddOrEdit`(
IN _department_id int(11),
IN _department_name varchar(50),
IN _department_building int(11)
)
BEGIN
	IF _department_id = 0 THEN 
		INSERT INTO department(department_id, department_name, department_building)
        VALUES(_department_id, _department_name, _department_building);
        
        SET _department_id = LAST_INSERT_ID();
	ELSE 
		UPDATE department
        SET
        department_id = _department_id,
        department_name = _department_name,
        department_building = _department_building
        WHERE _department_id = _nuid;
	END IF;
    
    SELECT _department_id AS "department_id";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FacultyAddOrEdit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FacultyAddOrEdit`(
IN _faculty_id int(11),
IN _faculty_firstname varchar(50),
IN _faculty_lastname varchar(50),
IN _email varchar(50),
IN _department_id int(11),
IN _isFullTime tinyint(1)
)
BEGIN
	IF _faculty_id = "0" THEN 
		INSERT INTO faculty(faculty_id, faculty_firstname, faculty_lastname, email, department_id, isFullTime)
        VALUES(_faculty_id, _faculty_firstname, _faculty_lastname, _email, _department_id, _isFullTime);
        SET _faculty_id = LAST_INSERT_ID();
	ELSE 
		UPDATE faculty
        SET
        faculty_id = _faculty_id,
        faculty_firstname = _faculty_firstname,
        faculty_lastname = _faculty_lastname,
        email = _email,
        department_id = _department_id,
        isFullTime = _isFullTime
        WHERE faculty_id = _faculty_id;
	END IF;
    
    SELECT _faculty_id AS "faculty_id";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MajorAddOrEdit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MajorAddOrEdit`(
IN _major_id int(11),
IN _major_name varchar(50),
IN _department_id int(11),
IN _isCombined tinyint(1)
)
BEGIN
	IF _major_id = "0" THEN 
		INSERT INTO major(major_id, major_name, department_id, isCombined)
        VALUES(_major_id, _major_name, _department_id, _isCombined);
        SET _major_id = LAST_INSERT_ID();
	ELSE 
		UPDATE major
        SET
        major_id = _major_id,
        major_name = _faculty_firstname,
        department_id = _department_id,
        isCombined = _isFullTime
        WHERE major_id = _major_id;
	END IF;
    
    SELECT _major_id AS "major_id";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProfessorAddOrEdit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProfessorAddOrEdit`(
IN _professor_id int(11),
IN _status varchar(50),
IN _master_id int(11)
)
BEGIN
	IF _professor_id = "0" THEN 
		INSERT INTO professor(professor_id, status, master_id)
        VALUES(_professor_id, _status, _master_id);
        SET _professor_id = LAST_INSERT_ID();
	ELSE 
		UPDATE professor
        SET
        professor_id = _professor_id,
        status = _status,
        master_id = _master_id
        WHERE professor_id = _professor_id;
	END IF;
    
    SELECT _professor_id AS "professor_id";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `selectBuildingsOnStreet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectBuildingsOnStreet`(
IN streetname CHAR(20)
)
BEGIN
SELECT *
FROM building
WHERE street_name = streetname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `selectstudentbyfirstname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectstudentbyfirstname`(IN first_name VARCHAR(50))
BEGIN
SELECT * FROM student
WHERE student_firstname = first_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `selectstudentbylastname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectstudentbylastname`(IN last_name VARCHAR(50))
BEGIN
SELECT * FROM student
WHERE student_lastname = last_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `selectstudentbymajor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectstudentbymajor`(IN major_input INT(10))
BEGIN
SELECT * FROM student
WHERE major_id = major_input;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `StaffAddOrEdit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `StaffAddOrEdit`(
IN _staff_id int(11),
IN _role varchar(50),
IN _master_id int(11)
)
BEGIN
	IF _staff_id = "0" THEN 
		INSERT INTO staff(staff_id, role, master_id)
        VALUES(_staff_id, _role, _master_id);
        SET _staff_id = LAST_INSERT_ID();
	ELSE 
		UPDATE staff
        SET
        staff_id = _staff_id,
        role = _status,
        master_id = _master_id
        WHERE staff_id = _staff_id;
	END IF;
    
    SELECT _staff_id AS "staff_id";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `StudentAddOrEdit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `StudentAddOrEdit`(
IN _nuid int(11),
IN _firstName varchar(50),
IN _lastName varchar(50),
IN _email varchar(50),
IN _phone int(11),
IN _majorID int(11)
)
BEGIN
	IF _nuid = "0" THEN 
		INSERT INTO student(student_firstname, student_lastname, email, phone, major_id)
        VALUES(_firstName, _lastName, _email, _phone, _majorID);
        
        SET _nuid = LAST_INSERT_ID();
	ELSE 
		UPDATE student
        SET
        student_firstname = _firstName,
        student_lastname = _lastName,
        email = _email,
        phone = _phone,
        major_id = _majorID
        WHERE nuid = _nuid;
	END IF;
    
    SELECT _nuid AS "nuid";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `track_student` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `track_student`(IN student_input CHAR(20))
BEGIN
SELECT * FROM student
WHERE nuid = student_input;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-04 23:32:42
