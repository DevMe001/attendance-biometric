-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: biometric
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `archive`
--

DROP TABLE IF EXISTS `archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive` (
  `archive_id` int(11) NOT NULL AUTO_INCREMENT,
  `archive_name` varchar(255) NOT NULL,
  `tablename` varchar(100) NOT NULL,
  `column_name` varchar(50) NOT NULL,
  `columnId` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`archive_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive`
--

LOCK TABLES `archive` WRITE;
/*!40000 ALTER TABLE `archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `attendance_list`
--

DROP TABLE IF EXISTS `attendance_list`;
/*!50001 DROP VIEW IF EXISTS `attendance_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `attendance_list` AS SELECT
 1 AS `fullName`,
  1 AS `lrn`,
  1 AS `attendance_id`,
  1 AS `enrolled_id`,
  1 AS `fingerscan`,
  1 AS `clockType`,
  1 AS `date_created`,
  1 AS `is_archive`,
  1 AS `rec_id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `attendance_record`
--

DROP TABLE IF EXISTS `attendance_record`;
/*!50001 DROP VIEW IF EXISTS `attendance_record`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `attendance_record` AS SELECT
 1 AS `fullName`,
  1 AS `lrn`,
  1 AS `attendance_id`,
  1 AS `enrolled_id`,
  1 AS `fingerscan`,
  1 AS `date_created`,
  1 AS `is_archive` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `attendance_record_list`
--

DROP TABLE IF EXISTS `attendance_record_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance_record_list` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `attendance_id` int(11) NOT NULL,
  `rec_type` int(11) NOT NULL COMMENT '1 clock in 2 clockout',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_archive` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`rec_id`),
  KEY `fk_attendanceid` (`attendance_id`),
  CONSTRAINT `fk_attendanceid` FOREIGN KEY (`attendance_id`) REFERENCES `fingerprint_enroll` (`attendance_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_record_list`
--

LOCK TABLES `attendance_record_list` WRITE;
/*!40000 ALTER TABLE `attendance_record_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance_record_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `classdetails`
--

DROP TABLE IF EXISTS `classdetails`;
/*!50001 DROP VIEW IF EXISTS `classdetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `classdetails` AS SELECT
 1 AS `class_id`,
  1 AS `class_name`,
  1 AS `section_id`,
  1 AS `subject_id`,
  1 AS `teacher_id`,
  1 AS `is_archive`,
  1 AS `class_limit`,
  1 AS `room_number`,
  1 AS `scheduled_time`,
  1 AS `timeofDay`,
  1 AS `year_level`,
  1 AS `date_created`,
  1 AS `sectionName`,
  1 AS `sectionId`,
  1 AS `subjectId`,
  1 AS `subjectName`,
  1 AS `yearId`,
  1 AS `yearName`,
  1 AS `teacherId`,
  1 AS `teacherName` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `classes_record`
--

DROP TABLE IF EXISTS `classes_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes_record` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(50) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `room_number` int(11) NOT NULL,
  `scheduled_time` varchar(50) NOT NULL,
  `timeofDay` varchar(50) NOT NULL,
  `year_level` int(11) NOT NULL,
  `is_archive` tinyint(1) DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`class_id`),
  KEY `fk_section_id` (`section_id`),
  KEY `fk_subject_id` (`subject_id`),
  KEY `fk_year_level` (`year_level`),
  KEY `fk_teacher_id` (`teacher_id`),
  CONSTRAINT `fk_section_id` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_year_level` FOREIGN KEY (`year_level`) REFERENCES `year` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes_record`
--

LOCK TABLES `classes_record` WRITE;
/*!40000 ALTER TABLE `classes_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `classes_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `distictatttendanceuser`
--

DROP TABLE IF EXISTS `distictatttendanceuser`;
/*!50001 DROP VIEW IF EXISTS `distictatttendanceuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `distictatttendanceuser` AS SELECT
 1 AS `fullName`,
  1 AS `lrn`,
  1 AS `attendance_id`,
  1 AS `enrolled_id`,
  1 AS `fingerscan`,
  1 AS `clockType`,
  1 AS `date_created`,
  1 AS `sectionName`,
  1 AS `yearLevel`,
  1 AS `class_name`,
  1 AS `account_id` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `emergency_contact`
--

DROP TABLE IF EXISTS `emergency_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emergency_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactName` varchar(50) NOT NULL,
  `relationship` varchar(50) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_student_emergency` (`student_id`),
  CONSTRAINT `fk_student_emergency` FOREIGN KEY (`student_id`) REFERENCES `student_record` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_contact`
--

LOCK TABLES `emergency_contact` WRITE;
/*!40000 ALTER TABLE `emergency_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `emergency_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment_record`
--

DROP TABLE IF EXISTS `enrollment_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fingerprint_upload` varchar(100) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `submit_report` int(11) DEFAULT NULL,
  `receipt_id` int(11) DEFAULT NULL,
  `is_archive` tinyint(1) DEFAULT 0,
  `date_enrolled` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `section_id` (`section_id`),
  KEY `submit_report` (`submit_report`),
  KEY `fk_receipt_id` (`receipt_id`),
  CONSTRAINT `enrollment_record_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_record` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `enrollment_record_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `enrollment_record_ibfk_4` FOREIGN KEY (`submit_report`) REFERENCES `student_submitted` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_receipt_id` FOREIGN KEY (`receipt_id`) REFERENCES `receipt_record` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment_record`
--

LOCK TABLES `enrollment_record` WRITE;
/*!40000 ALTER TABLE `enrollment_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `enrollment_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `enrollment_records`
--

DROP TABLE IF EXISTS `enrollment_records`;
/*!50001 DROP VIEW IF EXISTS `enrollment_records`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `enrollment_records` AS SELECT
 1 AS `enrollment_id`,
  1 AS `student_id`,
  1 AS `is_archive`,
  1 AS `ref_number`,
  1 AS `lrn`,
  1 AS `fullName`,
  1 AS `lastName`,
  1 AS `middleName`,
  1 AS `firstName`,
  1 AS `nationality`,
  1 AS `profile`,
  1 AS `gender`,
  1 AS `age`,
  1 AS `birthdate`,
  1 AS `pbirth`,
  1 AS `studentNumber`,
  1 AS `currentAddress`,
  1 AS `sectionId`,
  1 AS `sectionName`,
  1 AS `yearLevelId`,
  1 AS `yearType`,
  1 AS `yearLevel`,
  1 AS `contactName`,
  1 AS `relationship`,
  1 AS `phone`,
  1 AS `fatherName`,
  1 AS `fatherOccupation`,
  1 AS `fatherNumber`,
  1 AS `motherName`,
  1 AS `motherOccupation`,
  1 AS `motherNumber`,
  1 AS `guardianName`,
  1 AS `guardianNumber`,
  1 AS `guardianAddress`,
  1 AS `report_card`,
  1 AS `formSf10`,
  1 AS `birthCertificate`,
  1 AS `good_moral`,
  1 AS `medical_cert`,
  1 AS `rec_letter`,
  1 AS `study_permit`,
  1 AS `alien_regcard`,
  1 AS `passport_copy`,
  1 AS `auth_school_record`,
  1 AS `type`,
  1 AS `date_enrolled`,
  1 AS `yearEnrolled`,
  1 AS `submit_id`,
  1 AS `receipt_id`,
  1 AS `typeFee`,
  1 AS `miscellanious`,
  1 AS `bookModules`,
  1 AS `tuitionFee`,
  1 AS `totalFee`,
  1 AS `fullCashPayment`,
  1 AS `dateNow` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fingerprint_enroll`
--

DROP TABLE IF EXISTS `fingerprint_enroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fingerprint_enroll` (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `enrolled_id` int(11) NOT NULL,
  `fingerscan` varchar(4000) NOT NULL,
  `is_archive` tinyint(1) DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`attendance_id`),
  KEY `fk_enrolled_id` (`enrolled_id`),
  CONSTRAINT `fk_enrolled_id` FOREIGN KEY (`enrolled_id`) REFERENCES `enrollment_record` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fingerprint_enroll`
--

LOCK TABLES `fingerprint_enroll` WRITE;
/*!40000 ALTER TABLE `fingerprint_enroll` DISABLE KEYS */;
/*!40000 ALTER TABLE `fingerprint_enroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `getarchivetables`
--

DROP TABLE IF EXISTS `getarchivetables`;
/*!50001 DROP VIEW IF EXISTS `getarchivetables`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `getarchivetables` AS SELECT
 1 AS `table_name` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `getrecentarchive`
--

DROP TABLE IF EXISTS `getrecentarchive`;
/*!50001 DROP VIEW IF EXISTS `getrecentarchive`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `getrecentarchive` AS SELECT
 1 AS `archive_id`,
  1 AS `archive_name`,
  1 AS `tablename`,
  1 AS `column_name`,
  1 AS `columnId`,
  1 AS `date_created` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `groupsectionandlevel`
--

DROP TABLE IF EXISTS `groupsectionandlevel`;
/*!50001 DROP VIEW IF EXISTS `groupsectionandlevel`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `groupsectionandlevel` AS SELECT
 1 AS `fullName`,
  1 AS `lrn`,
  1 AS `attendance_id`,
  1 AS `enrolled_id`,
  1 AS `fingerscan`,
  1 AS `clockType`,
  1 AS `date_created`,
  1 AS `is_archive`,
  1 AS `sectionId`,
  1 AS `sectionName`,
  1 AS `yearLevel`,
  1 AS `yearId`,
  1 AS `class_name`,
  1 AS `account_id` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `receipt_record`
--

DROP TABLE IF EXISTS `receipt_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receipt_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeFee` varchar(50) NOT NULL,
  `miscellanious` varchar(50) NOT NULL,
  `bookModules` varchar(100) NOT NULL,
  `tuitionFee` varchar(50) NOT NULL,
  `totalFee` varchar(50) NOT NULL,
  `fullCashPayment` varchar(20) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `receipt_record_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_record` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt_record`
--

LOCK TABLES `receipt_record` WRITE;
/*!40000 ALTER TABLE `receipt_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipt_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relative_record`
--

DROP TABLE IF EXISTS `relative_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relative_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fatherName` varchar(50) NOT NULL,
  `fatherOccupation` varchar(50) NOT NULL,
  `fatherNumber` varchar(11) NOT NULL,
  `fatherEmail` varchar(50) NOT NULL,
  `fatherAddress` varchar(250) NOT NULL,
  `motherName` varchar(50) NOT NULL,
  `motherOccupation` varchar(50) NOT NULL,
  `motherNumber` varchar(11) NOT NULL,
  `motherEmail` varchar(50) NOT NULL,
  `motherAddress` varchar(250) NOT NULL,
  `guardianName` varchar(50) NOT NULL,
  `guardianNumber` varchar(11) NOT NULL,
  `guardianEmail` varchar(250) NOT NULL,
  `guardianAddress` varchar(100) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_student_relative_id` (`student_id`),
  CONSTRAINT `fk_student_relative_id` FOREIGN KEY (`student_id`) REFERENCES `student_record` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relative_record`
--

LOCK TABLES `relative_record` WRITE;
/*!40000 ALTER TABLE `relative_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `relative_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schoolyear`
--

DROP TABLE IF EXISTS `schoolyear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schoolyear` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schoolyear`
--

LOCK TABLES `schoolyear` WRITE;
/*!40000 ALTER TABLE `schoolyear` DISABLE KEYS */;
INSERT INTO `schoolyear` VALUES (1,'2023-01-02','2024-01-01');
/*!40000 ALTER TABLE `schoolyear` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `is_archive` tinyint(1) DEFAULT 0,
  `limit_section` varchar(50) DEFAULT NULL,
  `min_grade` varchar(11) DEFAULT NULL,
  `max_grade` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'A',0,'30','96','100'),(2,'B',0,'30','90','95'),(3,'C',0,'30','85','89'),(4,'D',0,'30','80','84'),(5,'E',0,'30','75','79');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sectionlist`
--

DROP TABLE IF EXISTS `sectionlist`;
/*!50001 DROP VIEW IF EXISTS `sectionlist`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sectionlist` AS SELECT
 1 AS `id`,
  1 AS `name`,
  1 AS `is_archive`,
  1 AS `limit_section`,
  1 AS `min_grade`,
  1 AS `max_grade` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `student_record`
--

DROP TABLE IF EXISTS `student_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_number` varchar(100) NOT NULL,
  `lrn` varchar(12) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `fullName` varchar(50) NOT NULL,
  `profile` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `age` varchar(20) NOT NULL,
  `birthdate` varchar(11) NOT NULL,
  `pbirth` varchar(100) NOT NULL,
  `studentNumber` varchar(50) NOT NULL,
  `currentAddress` varchar(100) NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `year_id` int(11) DEFAULT NULL,
  `is_archive` tinyint(1) DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_year_id` (`year_id`),
  CONSTRAINT `fk_year_id` FOREIGN KEY (`year_id`) REFERENCES `year` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_record`
--

LOCK TABLES `student_record` WRITE;
/*!40000 ALTER TABLE `student_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_subject`
--

DROP TABLE IF EXISTS `student_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) DEFAULT NULL,
  `year_level` int(11) DEFAULT NULL,
  `teachers_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  KEY `year_level` (`year_level`),
  KEY `teachers_id` (`teachers_id`),
  CONSTRAINT `student_subject_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_subject_ibfk_2` FOREIGN KEY (`year_level`) REFERENCES `year` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_subject_ibfk_3` FOREIGN KEY (`teachers_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_subject`
--

LOCK TABLES `student_subject` WRITE;
/*!40000 ALTER TABLE `student_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_submitted`
--

DROP TABLE IF EXISTS `student_submitted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_submitted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_card` varchar(50) DEFAULT NULL,
  `formSf10` varchar(50) DEFAULT NULL,
  `birthCertificate` varchar(50) DEFAULT NULL,
  `good_moral` varchar(50) DEFAULT NULL,
  `medical_cert` varchar(50) DEFAULT NULL,
  `rec_letter` varchar(50) DEFAULT NULL,
  `study_permit` varchar(50) DEFAULT NULL,
  `alien_regcard` varchar(50) DEFAULT NULL,
  `passport_copy` varchar(50) DEFAULT NULL,
  `auth_school_record` varchar(50) DEFAULT NULL,
  `type` varchar(11) DEFAULT NULL COMMENT 'local 0 | foreign 1',
  `student_id` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_student_id` (`student_id`),
  CONSTRAINT `fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `student_record` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_submitted`
--

LOCK TABLES `student_submitted` WRITE;
/*!40000 ALTER TABLE `student_submitted` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_submitted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `studentmasterlist`
--

DROP TABLE IF EXISTS `studentmasterlist`;
/*!50001 DROP VIEW IF EXISTS `studentmasterlist`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `studentmasterlist` AS SELECT
 1 AS `id`,
  1 AS `ref_number`,
  1 AS `lrn`,
  1 AS `lname`,
  1 AS `mname`,
  1 AS `fname`,
  1 AS `fullName`,
  1 AS `profile`,
  1 AS `email`,
  1 AS `gender`,
  1 AS `age`,
  1 AS `birthdate`,
  1 AS `pbirth`,
  1 AS `studentNumber`,
  1 AS `currentAddress`,
  1 AS `nationality`,
  1 AS `year_id`,
  1 AS `date_created`,
  1 AS `is_archive`,
  1 AS `yearCreated`,
  1 AS `yearId`,
  1 AS `yearName`,
  1 AS `fatherName`,
  1 AS `fatherOccupation`,
  1 AS `fatherNumber`,
  1 AS `fatherEmail`,
  1 AS `fatherAddress`,
  1 AS `motherName`,
  1 AS `motherOccupation`,
  1 AS `motherNumber`,
  1 AS `motherEmail`,
  1 AS `motherAddress`,
  1 AS `guardianName`,
  1 AS `guardianNumber`,
  1 AS `guardianEmail`,
  1 AS `guardianAddress`,
  1 AS `contactName`,
  1 AS `relationship`,
  1 AS `phone`,
  1 AS `report_card`,
  1 AS `formSf10`,
  1 AS `birthCertificate`,
  1 AS `good_moral`,
  1 AS `medical_cert`,
  1 AS `rec_letter`,
  1 AS `study_permit`,
  1 AS `alien_regcard`,
  1 AS `passport_copy`,
  1 AS `auth_school_record`,
  1 AS `type`,
  1 AS `submitdoc_id` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `is_archive` tinyint(1) DEFAULT 0,
  `sub_subject` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'ENGLISH',0,NULL),(2,'FILIPINO',0,NULL),(3,'MATH',0,NULL),(4,'SCIENCE',0,NULL),(5,'ESP',0,NULL),(6,'ESL',0,NULL),(7,'MATHEMATICS',0,NULL),(8,'ARALIN PANLIPUNAN(AP)',0,NULL),(9,'EDUKASYON SA PAGPAPAKATAO(ESP)',0,NULL),(10,'MAPEH(MUSIC)',0,''),(11,'MOTHER TONGUE',0,NULL),(12,'TECHNOLOGY AND LIVEHOOD EDUCATION',0,'TLE'),(13,'MAPEH(ART)',0,NULL),(14,'MAPEH(PE)',0,NULL),(15,'MAPEH(HEALTH)',0,NULL),(16,'ORAL COMMUNICATION',0,NULL),(17,'KOMUNIKASYON AT PANANALIKSIK SA WIKANG AT KULTURANG PILIPINO',0,NULL),(18,'GENERAL MATHEMATICS',0,NULL),(19,'EARTH AND LIFE SCIENCE',0,NULL),(20,'PHYSICAL EDUCATION AND HEALTH',0,NULL),(21,'ENGLISH FOR ACADEMICS AND PROFESSIONAL PURPOSES',0,NULL),(22,'CREATIVE WRITING/ MALIKHAING PAGSULAT',0,NULL),(23,'ORGANIZATION MANAGEMENT',0,NULL),(24,'GENERAL PHYSICS(ELECTIVE 1)',0,NULL),(25,'READING AND WRITING',0,NULL),(26,'PAGBASA AT PAGSUSURI NG IBAT IBANG TEKSTO TUNGO SA PANANALIKSIK',0,NULL),(27,'STATISTIC AND PROBABILITY',0,NULL),(28,'PHYSICAL SICENCE',0,NULL),(29,'PHYSICAL EDUCATION AND HEALTH',0,NULL),(30,'DISASTER READINESS AND RISK REDUCTION',0,NULL),(31,'PRACTICAL RESEARCH 1',0,NULL),(32,'FILIPINO SA PILING LARANG',0,NULL),(33,'21ST CENTURY LITERATURE FROM THE PHILIPPINES AND THE WORLD',0,NULL),(34,'CONTEMPORARY PHILIPPINES ARTS FROM THE REGIONS',0,NULL),(35,'UNDERSTANDING CULTURE SOCIETY AND POLITICS',0,NULL),(36,'INTRODUCTION TO THE PHILOSOPHY OF THE HUMAN PERSON/PAMBUNGAD SA PILOSOPIYA NG TAO',0,NULL),(37,'PRACTICAL RESEARCH 2',0,NULL),(38,'ENTREPRENEURSHIP',0,NULL),(39,'PHILIPPINE POLITICS AND GOVERNANCE',0,NULL),(40,'MEDIA AND INFORMATION LITERACY',0,NULL),(41,'PERSONAL DEVELOPMENT/PANSARILING KAUNLARAN',0,NULL),(42,'EMPOWERMENT TECHNOLOGIES',0,NULL),(43,'INQUIRIES,INVESTIGATION AND IMMERSION',0,NULL),(44,'APPLIED ECONOMICS',0,NULL),(45,'DISCIPLINE AND IDEAS SOCIAL SCIENCES',0,NULL),(46,'GENERAL PHYSICS (ELECTIVE 2)',0,NULL),(47,'WORK IMMERSION',0,NULL),(50,'test',1,NULL);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `subjectlist`
--

DROP TABLE IF EXISTS `subjectlist`;
/*!50001 DROP VIEW IF EXISTS `subjectlist`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `subjectlist` AS SELECT
 1 AS `id`,
  1 AS `name`,
  1 AS `is_archive`,
  1 AS `sub_subject` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `teacher_attendance`
--

DROP TABLE IF EXISTS `teacher_attendance`;
/*!50001 DROP VIEW IF EXISTS `teacher_attendance`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `teacher_attendance` AS SELECT
 1 AS `fullName`,
  1 AS `lrn`,
  1 AS `attendance_id`,
  1 AS `enrolled_id`,
  1 AS `fingerscan`,
  1 AS `clockType`,
  1 AS `date_created`,
  1 AS `is_archive`,
  1 AS `sectionId`,
  1 AS `sectionName`,
  1 AS `yearLevel`,
  1 AS `yearId`,
  1 AS `class_name`,
  1 AS `account_id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `teacher_credentials`
--

DROP TABLE IF EXISTS `teacher_credentials`;
/*!50001 DROP VIEW IF EXISTS `teacher_credentials`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `teacher_credentials` AS SELECT
 1 AS `id`,
  1 AS `username`,
  1 AS `password`,
  1 AS `role`,
  1 AS `date_created`,
  1 AS `profile`,
  1 AS `fullName` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `teacher_details`
--

DROP TABLE IF EXISTS `teacher_details`;
/*!50001 DROP VIEW IF EXISTS `teacher_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `teacher_details` AS SELECT
 1 AS `record_id`,
  1 AS `teacher_profile_id`,
  1 AS `fullName`,
  1 AS `profile`,
  1 AS `gender`,
  1 AS `age`,
  1 AS `birthdate`,
  1 AS `address`,
  1 AS `course_taken`,
  1 AS `account_id`,
  1 AS `subject_id`,
  1 AS `subjectName`,
  1 AS `year_id`,
  1 AS `yearLevel`,
  1 AS `yearType` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `teacher_profile`
--

DROP TABLE IF EXISTS `teacher_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(50) NOT NULL,
  `profile` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `age` varchar(6) NOT NULL,
  `birthdate` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `course_taken` varchar(50) NOT NULL,
  `is_archive` tinyint(1) DEFAULT 0,
  `account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_account_id` (`account_id`),
  CONSTRAINT `fk_account_id` FOREIGN KEY (`account_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_profile`
--

LOCK TABLES `teacher_profile` WRITE;
/*!40000 ALTER TABLE `teacher_profile` DISABLE KEYS */;
INSERT INTO `teacher_profile` VALUES (39,'MICHELLE ARAGON','teach2.jpg','female','23','2000-09-09','CALOOCAN CITY','IT',0,9);
/*!40000 ALTER TABLE `teacher_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_record`
--

DROP TABLE IF EXISTS `teacher_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `year_level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `subject_id` (`subject_id`),
  KEY `year_level` (`year_level`),
  CONSTRAINT `teacher_record_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_record_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacher_record_ibfk_3` FOREIGN KEY (`year_level`) REFERENCES `year` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_record`
--

LOCK TABLES `teacher_record` WRITE;
/*!40000 ALTER TABLE `teacher_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `teacherdetailsrecord`
--

DROP TABLE IF EXISTS `teacherdetailsrecord`;
/*!50001 DROP VIEW IF EXISTS `teacherdetailsrecord`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `teacherdetailsrecord` AS SELECT
 1 AS `teach_id`,
  1 AS `account_id`,
  1 AS `teacher_profile_id`,
  1 AS `fullName`,
  1 AS `profile`,
  1 AS `gender`,
  1 AS `age`,
  1 AS `birthdate`,
  1 AS `address`,
  1 AS `course_taken`,
  1 AS `subjectChosen`,
  1 AS `subjectIdLevel`,
  1 AS `levelChosen` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `teacherinfo`
--

DROP TABLE IF EXISTS `teacherinfo`;
/*!50001 DROP VIEW IF EXISTS `teacherinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `teacherinfo` AS SELECT
 1 AS `id`,
  1 AS `fullName`,
  1 AS `profile`,
  1 AS `gender`,
  1 AS `age`,
  1 AS `birthdate`,
  1 AS `address`,
  1 AS `course_taken`,
  1 AS `is_archive`,
  1 AS `account_id` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(350) NOT NULL,
  `role` int(1) NOT NULL COMMENT '1 = Administrator | 2 = Teacher',
  `is_archive` tinyint(1) DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$vp9epCOhuMO1ZLYTTT.oMOvFgsRF3ZiJhRCJWRpmTKMSUfs67iSDy',1,0,'2023-10-25 14:05:59'),(9,'teacher01','$2y$10$xWOKe1x0Ido5a53ZMmovTOc/Cv2/UjlnRdbSnXN1K8Euy1iZSV1s.',2,0,'2024-01-25 09:38:26');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `userslist`
--

DROP TABLE IF EXISTS `userslist`;
/*!50001 DROP VIEW IF EXISTS `userslist`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `userslist` AS SELECT
 1 AS `id`,
  1 AS `username`,
  1 AS `password`,
  1 AS `role`,
  1 AS `is_archive`,
  1 AS `date_created` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `year`
--

DROP TABLE IF EXISTS `year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` int(1) NOT NULL COMMENT '1 = elementary| 2 = high school 3-senior high 4 collage',
  `is_archive` tinyint(1) DEFAULT 0,
  `qualify_age` int(2) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `year`
--

LOCK TABLES `year` WRITE;
/*!40000 ALTER TABLE `year` DISABLE KEYS */;
INSERT INTO `year` VALUES (1,'Nursery',1,0,2,'2023-10-26 11:23:04'),(2,'Kinder',1,0,4,'2023-10-26 11:23:04'),(3,'Grade 1',1,0,6,'2023-10-26 11:23:04'),(4,'Grade 2',1,0,7,'2023-10-26 11:23:04'),(5,'Grade 3',1,0,8,'2023-10-26 11:23:04'),(6,'Grade 4',1,0,9,'2023-10-26 11:23:04'),(7,'Grade 5',1,0,10,'2023-10-26 11:23:04'),(8,'Grade 6',1,0,11,'2023-10-26 11:23:04'),(9,'Grade 7',2,0,12,'2023-10-26 11:23:04'),(10,'Grade 8',2,0,13,'2023-10-26 11:23:04'),(11,'Grade 9',2,0,14,'2025-10-01 11:23:04'),(12,'Grade 10',2,0,15,'2023-10-26 11:23:04'),(13,'Grade 11',3,0,16,'2023-10-26 11:23:04'),(14,'Grade 12',3,0,17,'2023-10-26 11:23:04');
/*!40000 ALTER TABLE `year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `yearlist`
--

DROP TABLE IF EXISTS `yearlist`;
/*!50001 DROP VIEW IF EXISTS `yearlist`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `yearlist` AS SELECT
 1 AS `id`,
  1 AS `name`,
  1 AS `type`,
  1 AS `is_archive`,
  1 AS `qualify_age`,
  1 AS `date_created` */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'biometric'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSpecificArchiveTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSpecificArchiveTable`(IN `table_name` VARCHAR(255))
BEGIN 
SET @Sql = CONCAT('SELECT a.*,ar.archive_id,ar.date_created as archiveDate FROM ',table_name,' a INNER JOIN archive ar ON ar.columnId = a.rec_id WHERE is_archive = 1');
PREPARE stmt FROM @Sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;                 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSpecificArchiveTablewithId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSpecificArchiveTablewithId`(IN `table_name` VARCHAR(255), IN `dynamic_column` VARCHAR(255))
BEGIN 
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        SHOW ERRORS;
    END;

    -- Disable foreign key checks
    SET FOREIGN_KEY_CHECKS = 0;

    SET @Sql = CONCAT('SELECT a.*, ar.archive_id,ar.date_created as archiveDate FROM ', table_name, ' a INNER JOIN archive ar ON ar.columnId = a.', dynamic_column, ' WHERE is_archive = 1');
    
    PREPARE stmt FROM @Sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;   

    -- Enable foreign key checks
    SET FOREIGN_KEY_CHECKS = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSpecificTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSpecificTable`(
    IN table_name VARCHAR(255)
)
BEGIN
    SET @sql = CONCAT('SELECT * FROM ', table_name, ' WHERE is_archive = 1');
    
  
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `attendance_list`
--

/*!50001 DROP VIEW IF EXISTS `attendance_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `attendance_list` AS select `s`.`fullName` AS `fullName`,`s`.`lrn` AS `lrn`,`a`.`attendance_id` AS `attendance_id`,`a`.`enrolled_id` AS `enrolled_id`,`a`.`fingerscan` AS `fingerscan`,`at`.`rec_type` AS `clockType`,`at`.`date_created` AS `date_created`,`at`.`is_archive` AS `is_archive`,`at`.`rec_id` AS `rec_id` from (((`fingerprint_enroll` `a` join `enrollment_record` `er` on(`er`.`id` = `a`.`enrolled_id`)) join `student_record` `s` on(`s`.`id` = `er`.`student_id`)) join `attendance_record_list` `at` on(`at`.`attendance_id` = `a`.`attendance_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `attendance_record`
--

/*!50001 DROP VIEW IF EXISTS `attendance_record`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `attendance_record` AS select `s`.`fullName` AS `fullName`,`s`.`lrn` AS `lrn`,`a`.`attendance_id` AS `attendance_id`,`a`.`enrolled_id` AS `enrolled_id`,`a`.`fingerscan` AS `fingerscan`,`a`.`date_created` AS `date_created`,`a`.`is_archive` AS `is_archive` from ((`fingerprint_enroll` `a` join `enrollment_record` `er` on(`er`.`id` = `a`.`enrolled_id`)) join `student_record` `s` on(`s`.`id` = `er`.`student_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `classdetails`
--

/*!50001 DROP VIEW IF EXISTS `classdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `classdetails` AS select `cl`.`class_id` AS `class_id`,`cl`.`class_name` AS `class_name`,`cl`.`section_id` AS `section_id`,`cl`.`subject_id` AS `subject_id`,`cl`.`teacher_id` AS `teacher_id`,`cl`.`is_archive` AS `is_archive`,`s`.`limit_section` AS `class_limit`,`cl`.`room_number` AS `room_number`,`cl`.`scheduled_time` AS `scheduled_time`,`cl`.`timeofDay` AS `timeofDay`,`cl`.`year_level` AS `year_level`,`cl`.`date_created` AS `date_created`,`s`.`name` AS `sectionName`,`s`.`id` AS `sectionId`,`sub`.`id` AS `subjectId`,`sub`.`name` AS `subjectName`,`y`.`id` AS `yearId`,`y`.`name` AS `yearName`,`tp`.`id` AS `teacherId`,`tp`.`fullName` AS `teacherName` from ((((`classes_record` `cl` join `section` `s` on(`s`.`id` = `cl`.`section_id`)) join `subject` `sub` on(`sub`.`id` = `cl`.`subject_id`)) join `teacher_profile` `tp` on(`tp`.`id` = `cl`.`teacher_id`)) join `year` `y` on(`y`.`id` = `cl`.`year_level`)) where `cl`.`is_archive` = 0 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `distictatttendanceuser`
--

/*!50001 DROP VIEW IF EXISTS `distictatttendanceuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `distictatttendanceuser` AS select `al`.`fullName` AS `fullName`,`al`.`lrn` AS `lrn`,`al`.`attendance_id` AS `attendance_id`,`al`.`enrolled_id` AS `enrolled_id`,`al`.`fingerscan` AS `fingerscan`,`al`.`clockType` AS `clockType`,`al`.`date_created` AS `date_created`,`en`.`sectionName` AS `sectionName`,`en`.`yearLevel` AS `yearLevel`,`cl`.`class_name` AS `class_name`,`tch`.`account_id` AS `account_id` from (((`attendance_list` `al` join `enrollment_records` `en` on(`en`.`enrollment_id` = `al`.`enrolled_id`)) join `classes_record` `cl` on(`cl`.`section_id` = `en`.`sectionId` and `cl`.`year_level` = `en`.`yearLevelId`)) join `teacher_profile` `tch` on(`tch`.`id` = `cl`.`teacher_id`)) group by `al`.`lrn` order by `al`.`date_created` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `enrollment_records`
--

/*!50001 DROP VIEW IF EXISTS `enrollment_records`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `enrollment_records` AS select `e`.`id` AS `enrollment_id`,`e`.`student_id` AS `student_id`,`e`.`is_archive` AS `is_archive`,`s`.`ref_number` AS `ref_number`,`s`.`lrn` AS `lrn`,`s`.`fullName` AS `fullName`,`s`.`lname` AS `lastName`,`s`.`mname` AS `middleName`,`s`.`fname` AS `firstName`,`s`.`nationality` AS `nationality`,`s`.`profile` AS `profile`,`s`.`gender` AS `gender`,`s`.`age` AS `age`,`s`.`birthdate` AS `birthdate`,`s`.`pbirth` AS `pbirth`,`s`.`studentNumber` AS `studentNumber`,`s`.`currentAddress` AS `currentAddress`,`sc`.`id` AS `sectionId`,`sc`.`name` AS `sectionName`,`y`.`id` AS `yearLevelId`,`y`.`type` AS `yearType`,`y`.`name` AS `yearLevel`,`em`.`contactName` AS `contactName`,`em`.`relationship` AS `relationship`,`em`.`phone` AS `phone`,`r`.`fatherName` AS `fatherName`,`r`.`fatherOccupation` AS `fatherOccupation`,`r`.`fatherNumber` AS `fatherNumber`,`r`.`motherName` AS `motherName`,`r`.`motherOccupation` AS `motherOccupation`,`r`.`motherNumber` AS `motherNumber`,`r`.`guardianName` AS `guardianName`,`r`.`guardianNumber` AS `guardianNumber`,`r`.`guardianAddress` AS `guardianAddress`,`sr`.`report_card` AS `report_card`,`sr`.`formSf10` AS `formSf10`,`sr`.`birthCertificate` AS `birthCertificate`,`sr`.`good_moral` AS `good_moral`,`sr`.`medical_cert` AS `medical_cert`,`sr`.`rec_letter` AS `rec_letter`,`sr`.`study_permit` AS `study_permit`,`sr`.`alien_regcard` AS `alien_regcard`,`sr`.`passport_copy` AS `passport_copy`,`sr`.`auth_school_record` AS `auth_school_record`,`sr`.`type` AS `type`,`e`.`date_enrolled` AS `date_enrolled`,year(`e`.`date_enrolled`) AS `yearEnrolled`,`e`.`submit_report` AS `submit_id`,`e`.`receipt_id` AS `receipt_id`,`sm`.`typeFee` AS `typeFee`,`sm`.`miscellanious` AS `miscellanious`,`sm`.`bookModules` AS `bookModules`,`sm`.`tuitionFee` AS `tuitionFee`,`sm`.`totalFee` AS `totalFee`,`sm`.`fullCashPayment` AS `fullCashPayment`,current_timestamp() AS `dateNow` from (((((((`enrollment_record` `e` join `student_record` `s` on(`s`.`id` = `e`.`student_id`)) join `emergency_contact` `em` on(`em`.`student_id` = `e`.`student_id`)) join `relative_record` `r` on(`r`.`student_id` = `e`.`student_id`)) join `student_submitted` `sr` on(`sr`.`id` = `e`.`submit_report`)) join `section` `sc` on(`sc`.`id` = `e`.`section_id`)) join `year` `y` on(`y`.`id` = `s`.`year_id`)) join `receipt_record` `sm` on(`sm`.`id` = `e`.`receipt_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getarchivetables`
--

/*!50001 DROP VIEW IF EXISTS `getarchivetables`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getarchivetables` AS select `information_schema`.`tables`.`TABLE_NAME` AS `table_name` from `information_schema`.`tables` where `information_schema`.`tables`.`TABLE_SCHEMA` = 'biometric' and `information_schema`.`tables`.`TABLE_NAME` not in ('receipt_record','relative_record','emergency_contact','archive','student_subject','student_submitted','teacher_record','attendance_record_list','fingerprint_enroll','classdetails','enrollment_record','studentmasterlist','teacherdetailsrecord','teacher_attendance','teacher_credentials','getarchivetables','schoolyear','teacher_details') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `getrecentarchive`
--

/*!50001 DROP VIEW IF EXISTS `getrecentarchive`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `getrecentarchive` AS select `archive`.`archive_id` AS `archive_id`,`archive`.`archive_name` AS `archive_name`,`archive`.`tablename` AS `tablename`,`archive`.`column_name` AS `column_name`,`archive`.`columnId` AS `columnId`,`archive`.`date_created` AS `date_created` from `archive` order by `archive`.`archive_id` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `groupsectionandlevel`
--

/*!50001 DROP VIEW IF EXISTS `groupsectionandlevel`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `groupsectionandlevel` AS select `teacher_attendance`.`fullName` AS `fullName`,`teacher_attendance`.`lrn` AS `lrn`,`teacher_attendance`.`attendance_id` AS `attendance_id`,`teacher_attendance`.`enrolled_id` AS `enrolled_id`,`teacher_attendance`.`fingerscan` AS `fingerscan`,`teacher_attendance`.`clockType` AS `clockType`,`teacher_attendance`.`date_created` AS `date_created`,`teacher_attendance`.`is_archive` AS `is_archive`,`teacher_attendance`.`sectionId` AS `sectionId`,`teacher_attendance`.`sectionName` AS `sectionName`,`teacher_attendance`.`yearLevel` AS `yearLevel`,`teacher_attendance`.`yearId` AS `yearId`,`teacher_attendance`.`class_name` AS `class_name`,`teacher_attendance`.`account_id` AS `account_id` from `teacher_attendance` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sectionlist`
--

/*!50001 DROP VIEW IF EXISTS `sectionlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sectionlist` AS select `section`.`id` AS `id`,`section`.`name` AS `name`,`section`.`is_archive` AS `is_archive`,`section`.`limit_section` AS `limit_section`,`section`.`min_grade` AS `min_grade`,`section`.`max_grade` AS `max_grade` from `section` where `section`.`is_archive` = 0 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `studentmasterlist`
--

/*!50001 DROP VIEW IF EXISTS `studentmasterlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `studentmasterlist` AS select `s`.`id` AS `id`,`s`.`ref_number` AS `ref_number`,`s`.`lrn` AS `lrn`,`s`.`lname` AS `lname`,`s`.`mname` AS `mname`,`s`.`fname` AS `fname`,`s`.`fullName` AS `fullName`,`s`.`profile` AS `profile`,`s`.`email` AS `email`,`s`.`gender` AS `gender`,`s`.`age` AS `age`,`s`.`birthdate` AS `birthdate`,`s`.`pbirth` AS `pbirth`,`s`.`studentNumber` AS `studentNumber`,`s`.`currentAddress` AS `currentAddress`,`s`.`nationality` AS `nationality`,`s`.`year_id` AS `year_id`,`s`.`date_created` AS `date_created`,`s`.`is_archive` AS `is_archive`,year(`s`.`date_created`) AS `yearCreated`,`y`.`id` AS `yearId`,`y`.`name` AS `yearName`,`rc`.`fatherName` AS `fatherName`,`rc`.`fatherOccupation` AS `fatherOccupation`,`rc`.`fatherNumber` AS `fatherNumber`,`rc`.`fatherEmail` AS `fatherEmail`,`rc`.`fatherAddress` AS `fatherAddress`,`rc`.`motherName` AS `motherName`,`rc`.`motherOccupation` AS `motherOccupation`,`rc`.`motherNumber` AS `motherNumber`,`rc`.`motherEmail` AS `motherEmail`,`rc`.`motherAddress` AS `motherAddress`,`rc`.`guardianName` AS `guardianName`,`rc`.`guardianNumber` AS `guardianNumber`,`rc`.`guardianEmail` AS `guardianEmail`,`rc`.`guardianAddress` AS `guardianAddress`,`em`.`contactName` AS `contactName`,`em`.`relationship` AS `relationship`,`em`.`phone` AS `phone`,`st`.`report_card` AS `report_card`,`st`.`formSf10` AS `formSf10`,`st`.`birthCertificate` AS `birthCertificate`,`st`.`good_moral` AS `good_moral`,`st`.`medical_cert` AS `medical_cert`,`st`.`rec_letter` AS `rec_letter`,`st`.`study_permit` AS `study_permit`,`st`.`alien_regcard` AS `alien_regcard`,`st`.`passport_copy` AS `passport_copy`,`st`.`auth_school_record` AS `auth_school_record`,`st`.`type` AS `type`,`st`.`id` AS `submitdoc_id` from ((((`student_record` `s` join `year` `y` on(`y`.`id` = `s`.`year_id`)) join `relative_record` `rc` on(`rc`.`student_id` = `s`.`id`)) join `emergency_contact` `em` on(`em`.`student_id` = `s`.`id`)) join `student_submitted` `st` on(`st`.`student_id` = `s`.`id`)) where `s`.`is_archive` = 0 order by year(`s`.`date_created`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `subjectlist`
--

/*!50001 DROP VIEW IF EXISTS `subjectlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `subjectlist` AS select `subject`.`id` AS `id`,`subject`.`name` AS `name`,`subject`.`is_archive` AS `is_archive`,`subject`.`sub_subject` AS `sub_subject` from `subject` where `subject`.`is_archive` = 0 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `teacher_attendance`
--

/*!50001 DROP VIEW IF EXISTS `teacher_attendance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `teacher_attendance` AS select `al`.`fullName` AS `fullName`,`al`.`lrn` AS `lrn`,`al`.`attendance_id` AS `attendance_id`,`al`.`enrolled_id` AS `enrolled_id`,`al`.`fingerscan` AS `fingerscan`,`al`.`clockType` AS `clockType`,`al`.`date_created` AS `date_created`,`al`.`is_archive` AS `is_archive`,`en`.`sectionId` AS `sectionId`,`en`.`sectionName` AS `sectionName`,`en`.`yearLevel` AS `yearLevel`,`en`.`yearLevelId` AS `yearId`,`cl`.`class_name` AS `class_name`,`tch`.`account_id` AS `account_id` from (((`attendance_list` `al` join `enrollment_records` `en` on(`en`.`enrollment_id` = `al`.`enrolled_id`)) join `classes_record` `cl` on(`cl`.`section_id` = `en`.`sectionId` and `cl`.`year_level` = `en`.`yearLevelId`)) join `teacher_profile` `tch` on(`tch`.`id` = `cl`.`teacher_id`)) order by `al`.`date_created` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `teacher_credentials`
--

/*!50001 DROP VIEW IF EXISTS `teacher_credentials`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `teacher_credentials` AS select `u`.`id` AS `id`,`u`.`username` AS `username`,`u`.`password` AS `password`,`u`.`role` AS `role`,`u`.`date_created` AS `date_created`,`th`.`profile` AS `profile`,`th`.`fullName` AS `fullName` from (`users` `u` join `teacher_profile` `th` on(`th`.`account_id` = `u`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `teacher_details`
--

/*!50001 DROP VIEW IF EXISTS `teacher_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `teacher_details` AS select `tr`.`id` AS `record_id`,`tp`.`id` AS `teacher_profile_id`,`tp`.`fullName` AS `fullName`,`tp`.`profile` AS `profile`,`tp`.`gender` AS `gender`,`tp`.`age` AS `age`,`tp`.`birthdate` AS `birthdate`,`tp`.`address` AS `address`,`tp`.`course_taken` AS `course_taken`,`tp`.`account_id` AS `account_id`,`s`.`id` AS `subject_id`,`s`.`name` AS `subjectName`,`y`.`id` AS `year_id`,`y`.`name` AS `yearLevel`,`y`.`type` AS `yearType` from (((`teacher_record` `tr` join `teacher_profile` `tp` on(`tp`.`id` = `tr`.`teacher_id`)) join `subject` `s` on(`s`.`id` = `tr`.`subject_id`)) join `year` `y` on(`y`.`id` = `tr`.`year_level`)) group by `tr`.`teacher_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `teacherdetailsrecord`
--

/*!50001 DROP VIEW IF EXISTS `teacherdetailsrecord`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `teacherdetailsrecord` AS select `tr`.`id` AS `teach_id`,`tp`.`account_id` AS `account_id`,`tp`.`id` AS `teacher_profile_id`,`tp`.`fullName` AS `fullName`,`tp`.`profile` AS `profile`,`tp`.`gender` AS `gender`,`tp`.`age` AS `age`,`tp`.`birthdate` AS `birthdate`,`tp`.`address` AS `address`,`tp`.`course_taken` AS `course_taken`,group_concat(concat(`s`.`name`,' (',`y`.`name`,')') separator ', ') AS `subjectChosen`,concat('[',group_concat(concat('{ \'subject\':',`s`.`id`,', \'level\':',`y`.`id`,', \'id\':',`tr`.`id`,'}') separator ', '),']') AS `subjectIdLevel`,group_concat(`y`.`name` separator ', ') AS `levelChosen` from (((`teacher_record` `tr` join `teacher_profile` `tp` on(`tp`.`id` = `tr`.`teacher_id`)) join `subject` `s` on(`s`.`id` = `tr`.`subject_id`)) join `year` `y` on(`y`.`id` = `tr`.`year_level`)) group by `tr`.`teacher_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `teacherinfo`
--

/*!50001 DROP VIEW IF EXISTS `teacherinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `teacherinfo` AS select `teacher_profile`.`id` AS `id`,`teacher_profile`.`fullName` AS `fullName`,`teacher_profile`.`profile` AS `profile`,`teacher_profile`.`gender` AS `gender`,`teacher_profile`.`age` AS `age`,`teacher_profile`.`birthdate` AS `birthdate`,`teacher_profile`.`address` AS `address`,`teacher_profile`.`course_taken` AS `course_taken`,`teacher_profile`.`is_archive` AS `is_archive`,`teacher_profile`.`account_id` AS `account_id` from `teacher_profile` where `teacher_profile`.`is_archive` = 0 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `userslist`
--

/*!50001 DROP VIEW IF EXISTS `userslist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `userslist` AS select `users`.`id` AS `id`,`users`.`username` AS `username`,`users`.`password` AS `password`,`users`.`role` AS `role`,`users`.`is_archive` AS `is_archive`,`users`.`date_created` AS `date_created` from `users` where `users`.`is_archive` = 0 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `yearlist`
--

/*!50001 DROP VIEW IF EXISTS `yearlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `yearlist` AS select `year`.`id` AS `id`,`year`.`name` AS `name`,`year`.`type` AS `type`,`year`.`is_archive` AS `is_archive`,`year`.`qualify_age` AS `qualify_age`,`year`.`date_created` AS `date_created` from `year` where `year`.`is_archive` = 0 */;
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

-- Dump completed on 2024-01-25 17:44:58
