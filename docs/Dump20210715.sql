-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: akimiami.channeldevs.us    Database: mc_00009
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.20.04.1

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
-- Table structure for table `dbo_ErrorTable`
--

DROP TABLE IF EXISTS `dbo_ErrorTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_ErrorTable` (
  `ID` varchar(10) NOT NULL,
  `ErrorID` varchar(50) NOT NULL,
  `ErrorDesc` varchar(150) NOT NULL,
  `ErrorDate` varchar(23) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_AptCalendar`
--

DROP TABLE IF EXISTS `dbo_K_AptCalendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_AptCalendar` (
  `AptID` varchar(10) NOT NULL,
  `AptPersonal_id` varchar(10) NOT NULL,
  `AptStartDate` varchar(23) NOT NULL,
  `AptEndDate` varchar(23) NOT NULL,
  `AptStartTime` varchar(23) NOT NULL,
  `AptEndTime` varchar(23) NOT NULL,
  `AptTypeID` varchar(10) NOT NULL,
  `AptKept` bit(1) NOT NULL,
  `AptDesc` tinyint(1) NOT NULL,
  `AptNotes` tinyint(1) NOT NULL,
  `AptEmail` varchar(100) NOT NULL,
  `AptPhone` varchar(50) NOT NULL,
  `AptEmailSent` bit(1) NOT NULL,
  `AptPhoned` bit(1) NOT NULL,
  `AptDuration` varchar(10) NOT NULL,
  `AptNameType` char(1) NOT NULL,
  `AptCancelled` bit(1) NOT NULL,
  PRIMARY KEY (`AptID`),
  KEY `_dta_index_K_AptCalendar_8_1461580245__K2_K7_8` (`AptPersonal_id`,`AptTypeID`),
  KEY `NonClusteredIndex-20140904-175033` (`AptPersonal_id`,`AptStartDate`,`AptEndDate`,`AptKept`),
  KEY `NonClusteredIndex-20150523-093234` (`AptStartDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_Apt_Type`
--

DROP TABLE IF EXISTS `dbo_K_Apt_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_Apt_Type` (
  `AptTypeID` varchar(10) NOT NULL,
  `AptTypeDesc` varchar(50) NOT NULL,
  `AptTypeActive` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_Contract_detail`
--

DROP TABLE IF EXISTS `dbo_K_Contract_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_Contract_detail` (
  `RecID` varchar(10) NOT NULL,
  `ContractID` varchar(10) NOT NULL,
  `SessionID` varchar(50) NOT NULL,
  `ProgramID` varchar(10) NOT NULL,
  `StartDate` varchar(23) NOT NULL,
  `ExpireDate` varchar(23) NOT NULL,
  `MaxLessons` varchar(10) NOT NULL,
  `MinLessons` varchar(10) NOT NULL,
  `Total` varchar(19) NOT NULL,
  `FeePaidForNextBelt` bit(1) NOT NULL,
  `duration_months` varchar(10) NOT NULL,
  `StudentID` varchar(10) NOT NULL,
  `StudentIDs` varchar(200) NOT NULL,
  `downpayment` varchar(19) NOT NULL,
  `StudentProgHistID` varchar(10) NOT NULL,
  `RenewalDate` varchar(23) NOT NULL,
  `OriginalExpireDate` varchar(23) NOT NULL,
  `amtfinanced` varchar(19) NOT NULL,
  `monthlypay` varchar(19) NOT NULL,
  `numofpays` varchar(10) NOT NULL,
  `financepercent` varchar(5) NOT NULL,
  `financecharge` varchar(19) NOT NULL,
  `startpaydate` varchar(23) NOT NULL,
  `endpaydate` varchar(23) NOT NULL,
  `includes_exam_fees` bit(1) NOT NULL,
  PRIMARY KEY (`RecID`),
  KEY `NonClusteredIndex-20150523-093036` (`ContractID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_Contract_temp_print_table`
--

DROP TABLE IF EXISTS `dbo_K_Contract_temp_print_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_Contract_temp_print_table` (
  `RecID` varchar(10) NOT NULL,
  `SessionID` varchar(50) NOT NULL,
  `ProgramID` varchar(10) NOT NULL,
  `StartDate` varchar(23) NOT NULL,
  `ExpireDate` varchar(23) NOT NULL,
  `MaxLessons` varchar(10) NOT NULL,
  `MinLessons` varchar(10) NOT NULL,
  `Total` varchar(19) NOT NULL,
  `FeePaidForNextBelt` bit(1) NOT NULL,
  `duration_months` varchar(10) NOT NULL,
  `StudentID` varchar(10) NOT NULL,
  `StudentIDs` varchar(200) NOT NULL,
  `downpayment` varchar(19) NOT NULL,
  `amtfinanced` varchar(19) NOT NULL,
  `monthlypay` varchar(19) NOT NULL,
  `numofpays` varchar(10) NOT NULL,
  `financepercent` varchar(5) NOT NULL,
  `financecharge` varchar(19) NOT NULL,
  `startpaydate` varchar(23) NOT NULL,
  `endpaydate` varchar(23) NOT NULL,
  `includes_exam_fees` varchar(10) NOT NULL,
  PRIMARY KEY (`RecID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_Contract_temp_working`
--

DROP TABLE IF EXISTS `dbo_K_Contract_temp_working`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_Contract_temp_working` (
  `RecID` varchar(10) NOT NULL,
  `SessionID` varchar(50) NOT NULL,
  `ProgramID` varchar(10) NOT NULL,
  `StartDate` varchar(23) NOT NULL,
  `ExpireDate` varchar(23) NOT NULL,
  `MaxLessons` varchar(10) NOT NULL,
  `MinLessons` varchar(10) NOT NULL,
  `Total` varchar(19) NOT NULL,
  `FeePaidForNextBelt` bit(1) NOT NULL,
  `duration_months` varchar(10) NOT NULL,
  `StudentID` varchar(10) NOT NULL,
  `StudentIDs` varchar(200) NOT NULL,
  `downpayment` varchar(19) NOT NULL,
  `amtfinanced` varchar(19) NOT NULL,
  `monthlypay` varchar(19) NOT NULL,
  `numofpays` varchar(10) NOT NULL,
  `financepercent` varchar(5) NOT NULL,
  `financecharge` varchar(19) NOT NULL,
  `startpaydate` varchar(23) NOT NULL,
  `endpaydate` varchar(23) NOT NULL,
  `includes_exam_fees` varchar(10) NOT NULL,
  PRIMARY KEY (`RecID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_Doc_Type`
--

DROP TABLE IF EXISTS `dbo_K_Doc_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_Doc_Type` (
  `ID` varchar(10) NOT NULL,
  `DOCTYPE` varchar(50) NOT NULL,
  `Active` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_Docs`
--

DROP TABLE IF EXISTS `dbo_K_Docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_Docs` (
  `DOCID` varchar(10) NOT NULL,
  `StudentID` varchar(10) NOT NULL,
  `Description` varchar(128) NOT NULL,
  `Filename` varchar(128) NOT NULL,
  `Filetype` varchar(10) NOT NULL,
  `FileBinary` varbinary(0) NOT NULL,
  `Uploaddatetime` varchar(23) NOT NULL,
  PRIMARY KEY (`DOCID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_EmailRepository`
--

DROP TABLE IF EXISTS `dbo_K_EmailRepository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_EmailRepository` (
  `EmailID` varchar(19) NOT NULL,
  `EmailActive` bit(1) NOT NULL,
  `EmailName` varchar(50) NOT NULL,
  `EmailSubject` varchar(256) NOT NULL,
  `Emailbody` tinyint(1) NOT NULL,
  `EmailAttachment` varchar(256) NOT NULL,
  `EmailWorkflowType` varchar(10) NOT NULL,
  `EmailDateModified` varchar(23) NOT NULL,
  KEY `_dta_index_K_EmailRepository_8_238623893__K2_K1_K3` (`EmailActive`,`EmailID`,`EmailName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_EmailRepository_Groups`
--

DROP TABLE IF EXISTS `dbo_K_EmailRepository_Groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_EmailRepository_Groups` (
  `EmailTemplateGroupID` varchar(10) NOT NULL,
  `EmailTemplateGroupName` varchar(250) NOT NULL,
  `Active` bit(1) NOT NULL,
  `cr_dt` varchar(23) NOT NULL,
  `up_dt` varchar(23) NOT NULL,
  PRIMARY KEY (`EmailTemplateGroupID`),
  UNIQUE KEY `NonClusteredIndex-20180921-215936` (`EmailTemplateGroupName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_EmailRepository_Groups_Link`
--

DROP TABLE IF EXISTS `dbo_K_EmailRepository_Groups_Link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_EmailRepository_Groups_Link` (
  `EmailTemplateGroupLinkID` varchar(10) NOT NULL,
  `EmailTemplateGroupID` varchar(10) NOT NULL,
  `EmailTemplateID` varchar(10) NOT NULL,
  `cr_dt` varchar(23) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_EmailRepository_old`
--

DROP TABLE IF EXISTS `dbo_K_EmailRepository_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_EmailRepository_old` (
  `EmailID` varchar(19) NOT NULL,
  `EmailActive` bit(1) NOT NULL,
  `EmailName` varchar(50) NOT NULL,
  `EmailSubject` varchar(256) NOT NULL,
  `Emailbody` tinyint(1) NOT NULL,
  `EmailAttachment` varchar(256) NOT NULL,
  `EmailDateModified` varchar(23) NOT NULL,
  `EmailType` varchar(10) NOT NULL,
  `EmailWorkflowType` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_Email_Selection_groups`
--

DROP TABLE IF EXISTS `dbo_K_Email_Selection_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_Email_Selection_groups` (
  `SelectionID` varchar(10) NOT NULL,
  `SelectionDesc` varchar(128) NOT NULL,
  `RdBtnSource` varchar(50) NOT NULL,
  `RdBtnProspectsobsolete` varchar(50) NOT NULL,
  `ChkListStatus` tinyint(1) NOT NULL,
  `ChkListBelts` tinyint(1) NOT NULL,
  `cmbLastAttend` tinyint(1) NOT NULL,
  `TxtAttendedDays` varchar(10) NOT NULL,
  `RdBtnRenewals` varchar(50) NOT NULL,
  `RenewalsFrom` varchar(23) NOT NULL,
  `RenewalsTo` varchar(23) NOT NULL,
  `RdBtnEnrollments` varchar(50) NOT NULL,
  `EnrollmentsFrom` varchar(23) NOT NULL,
  `EnrollmentsTo` varchar(23) NOT NULL,
  `RdBtnExpired` varchar(50) NOT NULL,
  `ExpiredFrom` varchar(23) NOT NULL,
  `ExpiredTo` varchar(23) NOT NULL,
  `RdBtnBDates` varchar(50) NOT NULL,
  `BdateFrom` varchar(23) NOT NULL,
  `BdateTo` varchar(23) NOT NULL,
  `RdBtnAnniv` varchar(50) NOT NULL,
  `AnnivFrom` varchar(23) NOT NULL,
  `AnnivTo` varchar(23) NOT NULL,
  `RdBtnGraduation` varchar(50) NOT NULL,
  `GraduationFrom` varchar(23) NOT NULL,
  `GraduationTo` varchar(23) NOT NULL,
  `EmailID` varchar(10) NOT NULL,
  `Notes` tinyint(1) NOT NULL,
  `Active` bit(1) NOT NULL,
  `EmailSubject` varchar(256) NOT NULL,
  `Emailbody` tinyint(1) NOT NULL,
  `EmailAttachment` varchar(256) NOT NULL,
  `ChkStatusAll` bit(1) NOT NULL,
  `ChkBeltsAll` bit(1) NOT NULL,
  `RdProspectStatus` varchar(50) NOT NULL,
  `RdBtnCallDate` varchar(50) NOT NULL,
  `CallDateFrom` varchar(23) NOT NULL,
  `CallDateTo` varchar(23) NOT NULL,
  `RdBtnEnrollDate` varchar(50) NOT NULL,
  `EnrollDateFrom` varchar(23) NOT NULL,
  `EnrollDateTo` varchar(23) NOT NULL,
  `ChkListAdSource` tinyint(1) NOT NULL,
  `ChkAdSourceAll` bit(1) NOT NULL,
  `ProspectAgeFrom` varchar(10) NOT NULL,
  `StudentAgeFrom` varchar(10) NOT NULL,
  `ProspectAgeTo` varchar(10) NOT NULL,
  `StudentAgeTo` varchar(10) NOT NULL,
  `ChkListDiscipline` tinyint(1) NOT NULL,
  `chkDisciplineAll` bit(1) NOT NULL,
  `ChkListPrograms` tinyint(1) NOT NULL,
  `chkProgramsAll` bit(1) NOT NULL,
  `ChkListAllowedClasses` tinyint(1) NOT NULL,
  `ChkAllowedClassesAll` bit(1) NOT NULL,
  `EmailSentDaysAgoFrom` varchar(10) NOT NULL,
  `EmailSentDaysAgoTo` varchar(10) NOT NULL,
  `FutureAptDaysFrom` varchar(10) NOT NULL,
  `FutureAptDaysTo` varchar(10) NOT NULL,
  `KeptAptDaysFrom` varchar(10) NOT NULL,
  `KeptAptDaysTo` varchar(10) NOT NULL,
  `MissedAptDaysFrom` varchar(10) NOT NULL,
  `MissedAptDaysTo` varchar(10) NOT NULL,
  `CallDateDaysFrom` varchar(10) NOT NULL,
  `CallDateDaysTo` varchar(10) NOT NULL,
  `ChkIsActive` bit(1) NOT NULL,
  `RdSendType` varchar(50) NOT NULL,
  `ChkAutoRun` bit(1) NOT NULL,
  `chkPinToDashB` bit(1) NOT NULL,
  `txtAttendDaysFrom` varchar(10) NOT NULL,
  `txtAttendDaysTo` varchar(10) NOT NULL,
  `txtStudentLastEmailFrom` varchar(10) NOT NULL,
  `txtStudentLastEmailTo` varchar(10) NOT NULL,
  `txtDropOutFrom` varchar(23) NOT NULL,
  `txtDropOutTo` varchar(23) NOT NULL,
  `RdBtnDropOut` varchar(50) NOT NULL,
  `RdBtnGradConfirmed` varchar(50) NOT NULL,
  `RdBtnTips` varchar(50) NOT NULL,
  `ChkListTips` tinyint(1) NOT NULL,
  `DisplayZone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_Email_Student_Selection_detail`
--

DROP TABLE IF EXISTS `dbo_K_Email_Student_Selection_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_Email_Student_Selection_detail` (
  `ESelectionDetailID` varchar(10) NOT NULL,
  `EPersonalID` varchar(10) NOT NULL,
  `EProspectID` varchar(10) NOT NULL,
  `EFname` varchar(50) NOT NULL,
  `EMName` varchar(50) NOT NULL,
  `ELName` varchar(50) NOT NULL,
  `EPrimaryAddress` varchar(50) NOT NULL,
  `EAddress1` varchar(50) NOT NULL,
  `EAddress2` varchar(50) NOT NULL,
  `EAddress3` varchar(50) NOT NULL,
  `EAddress4` varchar(50) NOT NULL,
  `EAddress5` varchar(50) NOT NULL,
  `EProspectStatus` varchar(50) NOT NULL,
  `ERenewalDate` varchar(23) NOT NULL,
  `EEnrollmentDate` varchar(23) NOT NULL,
  `EExpired` varchar(23) NOT NULL,
  `EBdate` varchar(23) NOT NULL,
  `EAnnivDate` varchar(23) NOT NULL,
  `EGradDate` varchar(23) NOT NULL,
  `EStudentStatus` varchar(10) NOT NULL,
  `EStudentBelt` varchar(10) NOT NULL,
  `ELastAttendDate` varchar(23) NOT NULL,
  `ELastAttendDays` varchar(10) NOT NULL,
  `EProspectCallDate` varchar(23) NOT NULL,
  `EProspectEnrollDate` varchar(23) NOT NULL,
  `EProspectAdSourceID` varchar(10) NOT NULL,
  `EProspectAge` varchar(10) NOT NULL,
  `EStudentAge` varchar(10) NOT NULL,
  `ERecordType` char(1) NOT NULL,
  `EAddress6` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_Email_WorkFlow`
--

DROP TABLE IF EXISTS `dbo_K_Email_WorkFlow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_Email_WorkFlow` (
  `RecID` varchar(10) NOT NULL,
  `WorkFlowID` varchar(10) NOT NULL,
  `WorkFlowDesc` varchar(50) NOT NULL,
  `Active` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_EmailsSent`
--

DROP TABLE IF EXISTS `dbo_K_EmailsSent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_EmailsSent` (
  `EmailSentID` varchar(19) NOT NULL,
  `EmailID` varchar(19) NOT NULL,
  `EmailStudentID` varchar(10) NOT NULL,
  `EmailName` varchar(50) NOT NULL,
  `EmailSubject` varchar(256) NOT NULL,
  `Emailbody` tinyint(1) NOT NULL,
  `EmailAttachment` varchar(256) NOT NULL,
  `EmailSentDate` varchar(23) NOT NULL,
  `EmailSentTo` tinyint(1) NOT NULL,
  `EmailNameType` char(1) NOT NULL,
  `EmailWorkflowType` varchar(10) NOT NULL,
  KEY `ClusteredIndex-20150522-065707` (`EmailStudentID`),
  KEY `_dta_index_K_EmailsSent_8_478624748__K1_2_3_4_5_6_7_8_9_10` (`EmailSentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_EndOfDayStats`
--

DROP TABLE IF EXISTS `dbo_K_EndOfDayStats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_EndOfDayStats` (
  `EOMID` varchar(10) NOT NULL,
  `EOMDate` date NOT NULL,
  `EOMActiveCount` varchar(10) NOT NULL,
  `EOMDropOutCount` varchar(10) NOT NULL,
  `EOMInactiveCount` varchar(10) NOT NULL,
  `EOMProspectActiveCount` varchar(10) NOT NULL,
  `EOMProspectInactiveCount` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_Intake_contact`
--

DROP TABLE IF EXISTS `dbo_K_Intake_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_Intake_contact` (
  `contact_ID` varchar(10) NOT NULL,
  `relation_ID` varchar(10) NOT NULL,
  `isBillingAddress` bit(1) NOT NULL,
  `isMainAddress` bit(1) NOT NULL,
  `Addr1` varchar(50) NOT NULL,
  `Addr2` varchar(50) NOT NULL,
  `Addr3` varchar(50) NOT NULL,
  `Addr4` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `St` varchar(10) NOT NULL,
  `cellprovider` varchar(10) NOT NULL,
  `IntakerecID` varchar(10) NOT NULL,
  `zipcode` varchar(50) NOT NULL,
  `Email1` varchar(50) NOT NULL,
  `Email2` varchar(50) NOT NULL,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `HomePhone` varchar(19) NOT NULL,
  `CellPhone` varchar(19) NOT NULL,
  `Duplicate` bit(1) NOT NULL,
  `MasterStudentID` varchar(10) NOT NULL,
  PRIMARY KEY (`contact_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_Intake_personal`
--

DROP TABLE IF EXISTS `dbo_K_Intake_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_Intake_personal` (
  `Intake_personal_id` varchar(10) NOT NULL,
  `status_id` varchar(10) NOT NULL,
  `last_mod_date` varchar(23) NOT NULL,
  `duration` varchar(10) NOT NULL,
  `Intake_personal_type_ID` varchar(10) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `bdate` varchar(23) NOT NULL,
  `sex` int NOT NULL,
  `maritalstatus` int NOT NULL,
  `addr1` varchar(50) NOT NULL,
  `addr2` varchar(50) NOT NULL,
  `addr3` varchar(50) NOT NULL,
  `addr4` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip` varchar(50) NOT NULL,
  `home_phone` varchar(50) NOT NULL,
  `work_phone` varchar(50) NOT NULL,
  `cell_phone` varchar(50) NOT NULL,
  `beeper` varchar(50) NOT NULL,
  `email1` varchar(50) NOT NULL,
  `email2` varchar(50) NOT NULL,
  `post` bit(1) NOT NULL,
  `medical_condition` longtext NOT NULL,
  `pros_call_date` varchar(23) NOT NULL,
  `pros_cont_name` varchar(80) NOT NULL,
  `pros_adver` varchar(10) NOT NULL,
  `current_belt_id` varchar(10) NOT NULL,
  `paid_for_next_belt` bit(1) NOT NULL,
  `program_id` varchar(10) NOT NULL,
  `level_Id` varchar(10) NOT NULL,
  `includes_exam_fees` bit(1) NOT NULL,
  `enroll` varchar(23) NOT NULL,
  `upgrade` varchar(23) NOT NULL,
  `start` varchar(23) NOT NULL,
  `expire` varchar(23) NOT NULL,
  `extended` varchar(23) NOT NULL,
  `max_lesson` varchar(10) NOT NULL,
  `min_lesson` varchar(10) NOT NULL,
  `date_last_belt` varchar(23) NOT NULL,
  `messg` longtext NOT NULL,
  `contact_fname1` varchar(50) NOT NULL,
  `contact_relationship1` varchar(50) NOT NULL,
  `contact_phone1` varchar(50) NOT NULL,
  `conact_email1` varchar(50) NOT NULL,
  `contact_fname2` varchar(50) NOT NULL,
  `contact_relationship2` varchar(50) NOT NULL,
  `contact_phone2` varchar(50) NOT NULL,
  `conact_email2` varchar(50) NOT NULL,
  `contact_fname3` varchar(50) NOT NULL,
  `contact_relationship3` varchar(50) NOT NULL,
  `contact_phone3` varchar(50) NOT NULL,
  `conact_email3` varchar(50) NOT NULL,
  `class_attend_offset` varchar(10) NOT NULL,
  `daily_message` longtext NOT NULL,
  `referred_by` varchar(50) NOT NULL,
  `advert_id` varchar(10) NOT NULL,
  `pros_age` varchar(10) NOT NULL,
  `billaddr1` varchar(50) NOT NULL,
  `billaddr2` varchar(50) NOT NULL,
  `billaddr3` varchar(50) NOT NULL,
  `billaddr4` varchar(50) NOT NULL,
  `billcity` varchar(50) NOT NULL,
  `billst` varchar(50) NOT NULL,
  `billzip` varchar(50) NOT NULL,
  `contact_fname4` varchar(50) NOT NULL,
  `contact_relationship4` varchar(50) NOT NULL,
  `contact_phone4` varchar(50) NOT NULL,
  `conact_email4` varchar(50) NOT NULL,
  `Renewal` varchar(23) NOT NULL,
  `Prospect_ID` varchar(19) NOT NULL,
  `Current_belt_track_id` varchar(10) NOT NULL,
  `prgDuration` varchar(10) NOT NULL,
  `prgTotal` varchar(19) NOT NULL,
  `prgDownPay` varchar(19) NOT NULL,
  `prgFinancePercent` varchar(19) NOT NULL,
  `prgFinanceChrg` varchar(19) NOT NULL,
  `prgFinanceAmt` varchar(19) NOT NULL,
  `prgNumofpays` varchar(10) NOT NULL,
  `prgMonthPays` varchar(19) NOT NULL,
  `prgStartPay` varchar(23) NOT NULL,
  `prgEndPay` varchar(23) NOT NULL,
  `photo2` tinyint(1) NOT NULL,
  `Contact1TextProvider` varchar(10) NOT NULL,
  `Contact2TextProvider` varchar(10) NOT NULL,
  `Contact3TextProvider` varchar(10) NOT NULL,
  `Contact4TextProvider` varchar(10) NOT NULL,
  `MailAddressRelationship` varchar(10) NOT NULL,
  `BillAddressRelationship` varchar(10) NOT NULL,
  `Enrolled` bit(1) NOT NULL,
  `StudentID` varchar(10) NOT NULL,
  `ReferredByID` varchar(10) NOT NULL,
  `ReferredByName` varchar(50) NOT NULL,
  `ContractDoc` tinyint(1) NOT NULL,
  `belt_size` varchar(10) NOT NULL,
  `contact_lname1` varchar(50) NOT NULL,
  `contact_lname2` varchar(50) NOT NULL,
  `contact_lname3` varchar(50) NOT NULL,
  `contact_lname4` varchar(50) NOT NULL,
  `contact_cellPhone1` varchar(19) NOT NULL,
  `contact_cellPhone2` varchar(19) NOT NULL,
  `contact_cellPhone3` varchar(19) NOT NULL,
  `contact_cellPhone4` varchar(19) NOT NULL,
  `contact_homePhone1` varchar(19) NOT NULL,
  `contact_homePhone2` varchar(19) NOT NULL,
  `contact_homePhone3` varchar(19) NOT NULL,
  `contact_homePhone4` varchar(19) NOT NULL,
  `contact_rel_id1` varchar(10) NOT NULL,
  `contact_rel_id2` varchar(10) NOT NULL,
  `contact_rel_id3` varchar(10) NOT NULL,
  `contact_rel_id4` varchar(10) NOT NULL,
  `contact_1_addr1` varchar(50) NOT NULL,
  `contact_1_addr2` varchar(50) NOT NULL,
  `contact_1_email2` varchar(50) NOT NULL,
  `contact_2_addr1` varchar(50) NOT NULL,
  `contact_2_addr2` varchar(50) NOT NULL,
  `contact_2_email2` varchar(50) NOT NULL,
  `contact_3_addr1` varchar(50) NOT NULL,
  `contact_3_addr2` varchar(50) NOT NULL,
  `contact_3_email2` varchar(50) NOT NULL,
  `contact_4_addr1` varchar(50) NOT NULL,
  `contact_4_addr2` varchar(50) NOT NULL,
  `contact_4_email2` varchar(50) NOT NULL,
  `contact_1_City` varchar(50) NOT NULL,
  `contact_1_state` varchar(50) NOT NULL,
  `contact_1_zip` varchar(50) NOT NULL,
  `contact_2_City` varchar(50) NOT NULL,
  `contact_2_state` varchar(50) NOT NULL,
  `contact_2_zip` varchar(50) NOT NULL,
  `contact_3_City` varchar(50) NOT NULL,
  `contact_3_state` varchar(50) NOT NULL,
  `contact_3_zip` varchar(50) NOT NULL,
  `contact_4_City` varchar(50) NOT NULL,
  `contact_4_state` varchar(50) NOT NULL,
  `contact_4_zip` varchar(50) NOT NULL,
  `billaddrSameAsMain` bit(1) NOT NULL,
  `programIsShared` bit(1) NOT NULL,
  `contact_1_SendEmail` bit(1) NOT NULL,
  `contact_2_SendEmail` bit(1) NOT NULL,
  `contact_3_SendEmail` bit(1) NOT NULL,
  `contact_4_SendEmail` bit(1) NOT NULL,
  `contact_2_type` varchar(10) NOT NULL,
  `contact_1_type` varchar(10) NOT NULL,
  PRIMARY KEY (`Intake_personal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_Months`
--

DROP TABLE IF EXISTS `dbo_K_Months`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_Months` (
  `ID` varchar(10) NOT NULL,
  `monnum` varchar(10) NOT NULL,
  `nsmr` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_Prospect`
--

DROP TABLE IF EXISTS `dbo_K_Prospect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_Prospect` (
  `ProspectID` varchar(10) NOT NULL,
  `ProspectTypeID` varchar(10) NOT NULL,
  `ProspectFname` varchar(50) NOT NULL,
  `ProspectMname` varchar(50) NOT NULL,
  `ProspectLname` varchar(50) NOT NULL,
  `ProspectPhone1` varchar(50) NOT NULL,
  `ProspectPhone2` varchar(50) NOT NULL,
  `ProspectEmail1` varchar(50) NOT NULL,
  `ProspectEmail2` varchar(50) NOT NULL,
  `ProspectBdate` varchar(23) NOT NULL,
  `ProspectAge` varchar(10) NOT NULL,
  `ProspectNote` tinyint(1) NOT NULL,
  `ProspectLastUpdate` varchar(23) NOT NULL,
  `ProspectContactFname` varchar(50) NOT NULL,
  `ProspectContactLname` varchar(50) NOT NULL,
  `ProspectContactRelationshipID` varchar(10) NOT NULL,
  `ProspectAdID` varchar(10) NOT NULL,
  `ProspectCallDate` varchar(23) NOT NULL,
  `ProspectStudentID` varchar(10) NOT NULL,
  `ProspectConverted` bit(1) NOT NULL,
  `ProspectReferredby` varchar(100) NOT NULL,
  `ProspectLastActivity` varchar(23) NOT NULL,
  `ProspectConvertDate` varchar(23) NOT NULL,
  `ProspectActive` bit(1) NOT NULL,
  `ProspectMasterID` varchar(10) NOT NULL,
  `ProspectGender` int NOT NULL,
  `ProspectSendTexts` bit(1) NOT NULL,
  `ProspectCellSMS` varchar(50) NOT NULL,
  `ProspectCellMMS` varchar(50) NOT NULL,
  `ProspectAddr1` varchar(50) NOT NULL,
  `ProspectAddr2` varchar(50) NOT NULL,
  `ProspectCity` varchar(50) NOT NULL,
  `ProspectSt` varchar(10) NOT NULL,
  `ProspectZip` varchar(50) NOT NULL,
  PRIMARY KEY (`ProspectID`),
  KEY `_dta_index_K_Prospect_8_245575913__K1_K18` (`ProspectID`,`ProspectCallDate`),
  KEY `NonClusteredIndex-20140826-175234` (`ProspectCallDate`),
  KEY `NonClusteredIndex-20140826-175744` (`ProspectConverted`),
  KEY `NonClusteredIndex-20140826-175803` (`ProspectAdID`),
  KEY `NonClusteredIndex-20140904-175135` (`ProspectActive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_ProspectLead`
--

DROP TABLE IF EXISTS `dbo_K_ProspectLead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_ProspectLead` (
  `ProspectLeadID` varchar(19) NOT NULL,
  `Prospectfname` varchar(50) NOT NULL,
  `ProspectLname` varchar(50) NOT NULL,
  `ProspectPhone` varchar(50) NOT NULL,
  `ProspectPhone2` varchar(50) NOT NULL,
  `ProspectEmail` varchar(50) NOT NULL,
  `ProspectEmail2` varchar(50) NOT NULL,
  `ProspectActive` bit(1) NOT NULL,
  `ProspectDispoID` varchar(10) NOT NULL,
  `ProspectCallLog` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_ProspectLeadDispo`
--

DROP TABLE IF EXISTS `dbo_K_ProspectLeadDispo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_ProspectLeadDispo` (
  `DispoID` varchar(19) NOT NULL,
  `DispoDescription` varchar(50) NOT NULL,
  `DispoActive` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_ProspectMaster`
--

DROP TABLE IF EXISTS `dbo_K_ProspectMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_ProspectMaster` (
  `ProspectMasterID` varchar(19) NOT NULL,
  `ProspectTypeID` varchar(10) NOT NULL,
  `ProspectPhone1` varchar(50) NOT NULL,
  `ProspectPhone2` varchar(50) NOT NULL,
  `ProspectEmail1` varchar(50) NOT NULL,
  `ProspectEmail2` varchar(50) NOT NULL,
  `ProspectNote` tinyint(1) NOT NULL,
  `ProspectLastUpdate` varchar(23) NOT NULL,
  `ProspectContactFname` varchar(50) NOT NULL,
  `ProspectContactLName` varchar(50) NOT NULL,
  `ProspectContactRelationshipID` varchar(10) NOT NULL,
  `ProspectAdID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_Prospect_Type`
--

DROP TABLE IF EXISTS `dbo_K_Prospect_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_Prospect_Type` (
  `ProspectTypeID` varchar(10) NOT NULL,
  `ProspectTypeDesc` varchar(50) NOT NULL,
  `Active` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_Recurrence_Duration`
--

DROP TABLE IF EXISTS `dbo_K_Recurrence_Duration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_Recurrence_Duration` (
  `DurationID` varchar(10) NOT NULL,
  `Duration` varchar(10) NOT NULL,
  PRIMARY KEY (`DurationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_Recurrence_Interval`
--

DROP TABLE IF EXISTS `dbo_K_Recurrence_Interval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_Recurrence_Interval` (
  `RecurIntID` varchar(10) NOT NULL,
  `RecurIntAddCode` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RecurIntDesc` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`RecurIntID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_Referred`
--

DROP TABLE IF EXISTS `dbo_K_Referred`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_Referred` (
  `ReferredID` varchar(10) NOT NULL,
  `ReferredByID` varchar(10) NOT NULL,
  `ReferreeID` varchar(10) NOT NULL,
  `ReferredDate` varchar(23) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_SignIn_Ticker`
--

DROP TABLE IF EXISTS `dbo_K_SignIn_Ticker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_SignIn_Ticker` (
  `TickerID` varchar(10) NOT NULL,
  `Message` varchar(200) NOT NULL,
  `StartDate` varchar(23) NOT NULL,
  `EndDate` varchar(23) NOT NULL,
  `Color` varchar(50) NOT NULL,
  `Active` bit(1) NOT NULL,
  `DayOfWeek` varchar(10) NOT NULL,
  PRIMARY KEY (`TickerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_States`
--

DROP TABLE IF EXISTS `dbo_K_States`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_States` (
  `StateID` varchar(10) NOT NULL,
  `StateAbrv` varchar(10) NOT NULL,
  `StateDesc` varchar(50) NOT NULL,
  PRIMARY KEY (`StateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_Status_Filter`
--

DROP TABLE IF EXISTS `dbo_K_Status_Filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_Status_Filter` (
  `FilterID` varchar(10) NOT NULL,
  `FilterDesc` varchar(50) NOT NULL,
  PRIMARY KEY (`FilterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_Status_Interval`
--

DROP TABLE IF EXISTS `dbo_K_Status_Interval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_Status_Interval` (
  `ID` varchar(10) NOT NULL,
  `StatusInterval` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_Template_merge_fields`
--

DROP TABLE IF EXISTS `dbo_K_Template_merge_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_Template_merge_fields` (
  `TemplateFieldID` varchar(10) NOT NULL,
  `FieldType` varchar(50) NOT NULL,
  `FieldDescription` varchar(50) NOT NULL,
  `MergeField` varchar(50) NOT NULL,
  PRIMARY KEY (`TemplateFieldID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_Text_Message_Carriers`
--

DROP TABLE IF EXISTS `dbo_K_Text_Message_Carriers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_Text_Message_Carriers` (
  `CarrierID` varchar(10) NOT NULL,
  `CarrierName` varchar(50) NOT NULL,
  `extension` varchar(50) NOT NULL,
  PRIMARY KEY (`CarrierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_YNTable`
--

DROP TABLE IF EXISTS `dbo_K_YNTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_YNTable` (
  `YNValue` bit(1) NOT NULL,
  `YNDesc` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_achiev`
--

DROP TABLE IF EXISTS `dbo_K_achiev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_achiev` (
  `achievement_ID` varchar(10) NOT NULL,
  `belt_ID_obsolete` varchar(10) NOT NULL,
  `sublevel_ID_obsolete` varchar(10) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `attenance` bit(1) NOT NULL,
  `effective_date` varchar(23) NOT NULL,
  `achiev_type_ID` varchar(10) NOT NULL,
  `active` bit(1) NOT NULL,
  `ceremony` bit(1) NOT NULL,
  PRIMARY KEY (`achievement_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_achiev_type`
--

DROP TABLE IF EXISTS `dbo_K_achiev_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_achiev_type` (
  `achiev_type_ID` varchar(10) NOT NULL,
  `description` varchar(128) NOT NULL,
  `active` bit(1) NOT NULL,
  PRIMARY KEY (`achiev_type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_advertisements`
--

DROP TABLE IF EXISTS `dbo_K_advertisements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_advertisements` (
  `advert_type_ID` varchar(10) NOT NULL,
  `Description` varchar(128) NOT NULL,
  `Active` bit(1) NOT NULL,
  PRIMARY KEY (`advert_type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_batch_archive`
--

DROP TABLE IF EXISTS `dbo_K_batch_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_batch_archive` (
  `batch_arch_id` varchar(10) NOT NULL,
  `batch_daily_id` varchar(10) NOT NULL,
  `batch_date_time` varchar(23) NOT NULL,
  `student_id` varchar(10) NOT NULL,
  `student_class_attendance_id` varchar(10) NOT NULL,
  `attended` bit(1) NOT NULL,
  `accomplished_achieve` bit(1) NOT NULL,
  `achieve_id` varchar(10) NOT NULL,
  `boards_broken` varchar(10) NOT NULL,
  `applied_to_achieve_id` varchar(10) NOT NULL,
  `achievement_accomplished_id` varchar(10) NOT NULL,
  `class_counted_black_tip` bit(1) NOT NULL,
  `belt_detail_posted` bit(1) NOT NULL,
  `belt_posted` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_batch_daily`
--

DROP TABLE IF EXISTS `dbo_K_batch_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_batch_daily` (
  `batch_daily_id` varchar(10) NOT NULL,
  `batch_date_time` varchar(23) NOT NULL,
  `student_id` varchar(10) NOT NULL,
  `student_class_attendance_id` varchar(10) NOT NULL,
  `attended` bit(1) NOT NULL,
  `accomplished_achieve` bit(1) NOT NULL,
  `achieve_id` varchar(10) NOT NULL,
  `boards_broken` varchar(10) NOT NULL,
  `applied_to_achieve_id` varchar(10) NOT NULL,
  `achievement_accomplished_id` varchar(10) NOT NULL,
  `class_counted_black_tip` bit(1) NOT NULL,
  `belt_detail_posted` bit(1) NOT NULL,
  `belt_posted` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_belt_achiev`
--

DROP TABLE IF EXISTS `dbo_K_belt_achiev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_belt_achiev` (
  `belt_achieve_ID` varchar(10) NOT NULL,
  `Belt_ID` varchar(10) NOT NULL,
  `achieve_ID` varchar(10) NOT NULL,
  `type_ID` varchar(10) NOT NULL,
  `attendance_count` varchar(10) NOT NULL,
  `tip_order` varchar(10) NOT NULL,
  `autoaccomplish` bit(1) NOT NULL,
  `active` bit(1) NOT NULL,
  `ceremony` bit(1) NOT NULL,
  PRIMARY KEY (`belt_achieve_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_belt_achiev_hist`
--

DROP TABLE IF EXISTS `dbo_K_belt_achiev_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_belt_achiev_hist` (
  `belt_achiev_hist_ID` varchar(10) NOT NULL,
  `student_ID` varchar(10) NOT NULL,
  `belt_ID` varchar(10) NOT NULL,
  `belt_achiev_ID` varchar(10) NOT NULL,
  `accomplished` int NOT NULL,
  `accomplished_date` varchar(23) NOT NULL,
  `color_id` varchar(10) NOT NULL,
  `color` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_belt_paid`
--

DROP TABLE IF EXISTS `dbo_K_belt_paid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_belt_paid` (
  `belt_paid_ID` varchar(10) NOT NULL,
  `student_ID` varchar(10) NOT NULL,
  `belt_ID` varchar(10) NOT NULL,
  `Paid` int NOT NULL,
  PRIMARY KEY (`belt_paid_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_belt_student_detail_hist`
--

DROP TABLE IF EXISTS `dbo_K_belt_student_detail_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_belt_student_detail_hist` (
  `belt_detail_id` varchar(10) NOT NULL,
  `student_id` varchar(10) NOT NULL,
  `belt_ID` varchar(10) NOT NULL,
  `achieve_ID` varchar(10) NOT NULL,
  `achiev_description` varchar(255) NOT NULL,
  `attendance_required` varchar(10) NOT NULL,
  `attendance_to_applied` varchar(10) NOT NULL,
  `achieve_type_id` varchar(10) NOT NULL,
  `achieve_type_desc` varchar(128) NOT NULL,
  `date_started` varchar(23) NOT NULL,
  `accomplished` bit(1) NOT NULL,
  `accomplished_date` varchar(23) NOT NULL,
  `teacher_ID` varchar(10) NOT NULL,
  `teacher_name` varchar(50) NOT NULL,
  `classes_attended_offset` varchar(10) NOT NULL,
  `accomplished_class_attend_ID` varchar(10) NOT NULL,
  `belt_detail_posted` bit(1) NOT NULL,
  `tip_order` varchar(10) NOT NULL,
  `belt_student_ID` varchar(10) NOT NULL,
  `autoaccomplish` bit(1) NOT NULL,
  PRIMARY KEY (`belt_detail_id`),
  KEY `_dta_index_K_belt_student_detail_hist_c_8_226099846__K1` (`belt_detail_id`),
  KEY `_dta_index_K_belt_student_detail_hist_8_226099846__K1_5` (`belt_detail_id`),
  KEY `_dta_index_K_belt_student_detail_hist_8_226099846__K11_K19_K1_3` (`accomplished`,`belt_student_ID`,`belt_detail_id`,`tip_order`),
  KEY `_dta_index_K_belt_student_detail_hist_8_226099846__K11_K8_K19_4` (`accomplished`,`achieve_type_id`,`belt_student_ID`,`belt_detail_id`),
  KEY `_dta_index_K_belt_student_detail_hist_8_226099846__K19_K1_K11_5` (`belt_student_ID`,`belt_detail_id`,`accomplished`,`attendance_required`,`tip_order`),
  KEY `NonClusteredIndex-20140524-211708` (`student_id`,`belt_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_belt_student_hist`
--

DROP TABLE IF EXISTS `dbo_K_belt_student_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_belt_student_hist` (
  `belt_student_ID` varchar(10) NOT NULL,
  `student_ID` varchar(10) NOT NULL,
  `belt_ID` varchar(10) NOT NULL,
  `date_aquired` varchar(23) NOT NULL,
  `current_belt` bit(1) NOT NULL,
  `paid` bit(1) NOT NULL,
  `next_belt_id` varchar(10) NOT NULL,
  `aquired` bit(1) NOT NULL,
  `belt_posted` bit(1) NOT NULL,
  `belt_track_id` varchar(10) NOT NULL,
  `belt_color_text` varchar(50) NOT NULL,
  `Belt_color_code` varchar(50) NOT NULL,
  `Belt_order` varchar(10) NOT NULL,
  `date_accomplished` varchar(23) NOT NULL,
  PRIMARY KEY (`belt_student_ID`),
  KEY `_dta_index_K_belt_student_hist_c_8_1749581271__K1` (`belt_student_ID`),
  KEY `_dta_index_K_belt_student_hist_8_1749581271__K1_11_13` (`belt_student_ID`),
  KEY `_dta_index_K_belt_student_hist_8_1749581271__K3` (`belt_ID`),
  KEY `NonClusteredIndex-20140524-211636` (`student_ID`,`belt_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_belt_track`
--

DROP TABLE IF EXISTS `dbo_K_belt_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_belt_track` (
  `BeltTrackID` varchar(10) NOT NULL,
  `BeltTrackDescr` varchar(100) NOT NULL,
  `Active` bit(1) NOT NULL,
  PRIMARY KEY (`BeltTrackID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_belts`
--

DROP TABLE IF EXISTS `dbo_K_belts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_belts` (
  `belt_ID` varchar(10) NOT NULL,
  `color_ID` varchar(10) NOT NULL,
  `required_achiev_ID` varchar(10) NOT NULL,
  `classes_per_black` varchar(10) NOT NULL,
  `next_belt_id` varchar(10) NOT NULL,
  `effective_date` varchar(23) NOT NULL,
  `belt_color_text` varchar(50) NOT NULL,
  `Belt_color_code` varchar(50) NOT NULL,
  `Belt_order` varchar(10) NOT NULL,
  `belt_track_id` varchar(10) NOT NULL,
  `Active` bit(1) NOT NULL,
  `newbeltEmailID` varchar(10) NOT NULL,
  `lastattendEmailID` varchar(10) NOT NULL,
  `lastcolorEmailID` varchar(10) NOT NULL,
  PRIMARY KEY (`belt_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_board_history`
--

DROP TABLE IF EXISTS `dbo_K_board_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_board_history` (
  `board_hist_ID` varchar(10) NOT NULL,
  `board_type_ID` varchar(10) NOT NULL,
  `student_ID` varchar(10) NOT NULL,
  `date_purchased` varchar(23) NOT NULL,
  `date_broke` varchar(23) NOT NULL,
  `purchased_amt` varchar(10) NOT NULL,
  `broke_amt` varchar(10) NOT NULL,
  `comment` longtext NOT NULL,
  `trans_date` varchar(23) NOT NULL,
  `trans_type` char(1) NOT NULL,
  `trans_amt` varchar(10) NOT NULL,
  PRIMARY KEY (`board_hist_ID`),
  KEY `_dta_index_K_board_history_c_8_866102126__K3_K10` (`student_ID`,`trans_type`),
  KEY `_dta_index_K_board_history_8_866102126__K3_11` (`student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_board_trans_type`
--

DROP TABLE IF EXISTS `dbo_K_board_trans_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_board_trans_type` (
  `Board_trans_type` char(1) NOT NULL,
  `Board_trans_type_desc` varchar(50) NOT NULL,
  PRIMARY KEY (`Board_trans_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_calendar`
--

DROP TABLE IF EXISTS `dbo_K_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_calendar` (
  `day_id` varchar(10) NOT NULL,
  `date` varchar(23) NOT NULL,
  `day_of_week_id` varchar(10) NOT NULL,
  `day_of_week_text` varchar(10) NOT NULL,
  `achieve_id` varchar(10) NOT NULL,
  `class_type_id` varchar(10) NOT NULL,
  `enddate` varchar(23) NOT NULL,
  `day_type_text` varchar(100) NOT NULL,
  `day_description` tinyint(1) NOT NULL,
  `class_level_id` varchar(10) NOT NULL,
  PRIMARY KEY (`day_id`),
  KEY `ClusteredIndex-20150523-093644` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_class`
--

DROP TABLE IF EXISTS `dbo_K_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_class` (
  `class_ID` varchar(10) NOT NULL,
  `date` varchar(23) NOT NULL,
  `time` varchar(23) NOT NULL,
  `type_ID` varchar(10) NOT NULL,
  `teacher_ID` varchar(10) NOT NULL,
  `Level_id` varchar(10) NOT NULL,
  `Printed` int NOT NULL,
  `enddate` varchar(23) NOT NULL,
  `Description` tinyint(1) NOT NULL,
  `ClassType` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Recurduration` varchar(10) NOT NULL,
  `RecurInterval` varchar(10) NOT NULL,
  `Autocreate` bit(1) NOT NULL,
  `RecurrMasterID` varchar(10) NOT NULL,
  `RecurrDataField` tinyint(1) NOT NULL,
  `ApplyToTip` bit(1) NOT NULL,
  `CeremonyFull` bit(1) NOT NULL,
  PRIMARY KEY (`class_ID`),
  KEY `_dta_index_K_class_c_8_1013578649__K2D` (`date`),
  KEY `_dta_index_K_class_8_1013578649__K1_2` (`class_ID`),
  KEY `_dta_index_K_class_8_1013578649__K1_K2_10` (`class_ID`,`date`),
  KEY `_dta_index_K_class_8_1013578649__K1_K4_K2` (`class_ID`,`type_ID`,`date`),
  KEY `_dta_index_K_class_8_1013578649__K1_K4_K6_K2` (`class_ID`,`type_ID`,`Level_id`,`date`),
  KEY `_dta_index_K_class_8_1013578649__K2_1` (`date`),
  KEY `_dta_index_K_class_8_1013578649__K4_K1_2_10` (`type_ID`,`class_ID`),
  KEY `NonClusteredIndex-20140411-060223` (`date`),
  KEY `NonClusteredIndex-20140411-060247` (`Level_id`),
  KEY `NonClusteredIndex-20140411-190122` (`ClassType`),
  KEY `NonClusteredIndex-20140411-190211` (`type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_class_attendance`
--

DROP TABLE IF EXISTS `dbo_K_class_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_class_attendance` (
  `class_attend_ID` varchar(10) NOT NULL,
  `student_ID` varchar(10) NOT NULL,
  `class_ID` varchar(10) NOT NULL,
  `enrolled` bit(1) NOT NULL,
  `attended` bit(1) NOT NULL,
  `late` bit(1) NOT NULL,
  `accomplished_achieve` bit(1) NOT NULL,
  `Notes` longtext NOT NULL,
  `achieve_id` varchar(10) NOT NULL,
  `boards_broken` varchar(10) NOT NULL,
  `applied_to_achieve_id` varchar(10) NOT NULL,
  `achievement_accomplished_id` varchar(10) NOT NULL,
  `class_posted` bit(1) NOT NULL,
  `apply_to_black_tip` bit(1) NOT NULL,
  `hold_count` varchar(10) NOT NULL,
  `current_belt_id` varchar(10) NOT NULL,
  `current_prog_id` varchar(10) NOT NULL,
  PRIMARY KEY (`class_attend_ID`),
  KEY `ClusteredIndex-20140410-204501` (`class_ID`),
  KEY `_dta_index_K_class_attendance_8_885578193__K11_K14` (`applied_to_achieve_id`,`apply_to_black_tip`),
  KEY `_dta_index_K_class_attendance_8_885578193__K17_K3_K2_K5_1` (`current_prog_id`,`class_ID`,`student_ID`,`attended`),
  KEY `_dta_index_K_class_attendance_8_885578193__K2_K16_K3` (`student_ID`,`current_belt_id`,`class_ID`),
  KEY `_dta_index_K_class_attendance_8_885578193__K2_K5_K17_K3_1` (`student_ID`,`attended`,`current_prog_id`,`class_ID`),
  KEY `_dta_index_K_class_attendance_8_885578193__K5_K3_K2` (`attended`,`class_ID`,`student_ID`),
  KEY `NonClusteredIndex-20140410-204648` (`current_prog_id`),
  KEY `NonClusteredIndex-20140410-204831` (`student_ID`),
  KEY `NonClusteredIndex-20140411-191538` (`attended`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_class_batch`
--

DROP TABLE IF EXISTS `dbo_K_class_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_class_batch` (
  `class_batch_ID` varchar(10) NOT NULL,
  `student_ID` varchar(10) NOT NULL,
  `class_ID` varchar(10) NOT NULL,
  `enrolled` bit(1) NOT NULL,
  `attended` bit(1) NOT NULL,
  `late` bit(1) NOT NULL,
  `accomplished_achieve` bit(1) NOT NULL,
  `Notes` longtext NOT NULL,
  `achieve_id` varchar(10) NOT NULL,
  `boards_broken` varchar(10) NOT NULL,
  `applied_to_achieve_id` varchar(10) NOT NULL,
  `achievement_accomplished_id` varchar(10) NOT NULL,
  `class_posted` bit(1) NOT NULL,
  `apply_to_black_tip` bit(1) NOT NULL,
  `hold_count` varchar(10) NOT NULL,
  `current_belt_id` varchar(10) NOT NULL,
  `available_belt_id` varchar(10) NOT NULL,
  `current_prog_id` varchar(10) NOT NULL,
  `posted` bit(1) NOT NULL,
  `confirmbelt` bit(1) NOT NULL,
  `sortbyAttendtipOrColorOrBelt` varchar(10) NOT NULL,
  `class_type_id` varchar(10) NOT NULL,
  `count_of_class_type` varchar(10) NOT NULL,
  `sendemail` bit(1) NOT NULL,
  PRIMARY KEY (`class_batch_ID`),
  KEY `NonClusteredIndex-20140411-184525` (`class_ID`),
  KEY `NonClusteredIndex-20140411-184705` (`posted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_class_batch_Posted`
--

DROP TABLE IF EXISTS `dbo_K_class_batch_Posted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_class_batch_Posted` (
  `class_batch_ID` varchar(10) NOT NULL,
  `student_ID` varchar(10) NOT NULL,
  `class_ID` varchar(10) NOT NULL,
  `enrolled` bit(1) NOT NULL,
  `attended` bit(1) NOT NULL,
  `late` bit(1) NOT NULL,
  `accomplished_achieve` bit(1) NOT NULL,
  `Notes` longtext NOT NULL,
  `achieve_id` varchar(10) NOT NULL,
  `boards_broken` varchar(10) NOT NULL,
  `applied_to_achieve_id` varchar(10) NOT NULL,
  `achievement_accomplished_id` varchar(10) NOT NULL,
  `class_posted` bit(1) NOT NULL,
  `apply_to_black_tip` bit(1) NOT NULL,
  `hold_count` varchar(10) NOT NULL,
  `current_belt_id` varchar(10) NOT NULL,
  `available_belt_id` varchar(10) NOT NULL,
  `current_prog_id` varchar(10) NOT NULL,
  `posted` bit(1) NOT NULL,
  `confirmbelt` bit(1) NOT NULL,
  `sortbyAttendtipOrColorOrBelt` varchar(10) NOT NULL,
  `class_type_id` varchar(10) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `status_code` varchar(50) NOT NULL,
  `belt_color_text` varchar(50) NOT NULL,
  `available_belt_text` varchar(50) NOT NULL,
  `Classes_left` varchar(10) NOT NULL,
  `expireDate` varchar(23) NOT NULL,
  `enroll` varchar(23) NOT NULL,
  `bdate` varchar(23) NOT NULL,
  `last_attend_date` varchar(23) NOT NULL,
  `daily_message` longtext NOT NULL,
  `count_of_class_type` varchar(10) NOT NULL,
  `paid` bit(1) NOT NULL,
  `board_balance` varchar(10) NOT NULL,
  `SendlastAttendAutoEmail` bit(1) NOT NULL,
  `SendlastColortipAutoEmail` bit(1) NOT NULL,
  `SendnewBeltAutoEmail` bit(1) NOT NULL,
  `sendemail` bit(1) NOT NULL,
  PRIMARY KEY (`class_batch_ID`),
  KEY `ClusteredIndex-20160224-183714` (`class_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_class_batch_detail`
--

DROP TABLE IF EXISTS `dbo_K_class_batch_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_class_batch_detail` (
  `class_batch_detail_id` varchar(10) NOT NULL,
  `class_batch_ID` varchar(10) NOT NULL,
  `available_achieve_id` varchar(10) NOT NULL,
  `accomplished` bit(1) NOT NULL,
  `classonly` bit(1) NOT NULL,
  `class_id` varchar(10) NOT NULL,
  `posted` bit(1) NOT NULL,
  PRIMARY KEY (`class_batch_detail_id`),
  KEY `_dta_index_K_class_batch_detail_8_946102411__K2_K4_K1_K3` (`class_batch_ID`,`accomplished`,`class_batch_detail_id`,`available_achieve_id`),
  KEY `_dta_index_K_class_batch_detail_8_946102411__K2_K5_K4_K1_K3` (`class_batch_ID`,`classonly`,`accomplished`,`class_batch_detail_id`,`available_achieve_id`),
  KEY `NonClusteredIndex-20150523-092928` (`class_batch_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_class_batch_detail_posted`
--

DROP TABLE IF EXISTS `dbo_K_class_batch_detail_posted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_class_batch_detail_posted` (
  `class_batch_detail_id` varchar(10) NOT NULL,
  `class_batch_ID` varchar(10) NOT NULL,
  `available_achieve_id` varchar(10) NOT NULL,
  `accomplished` bit(1) NOT NULL,
  `classonly` bit(1) NOT NULL,
  `class_id` varchar(10) NOT NULL,
  `posted` bit(1) NOT NULL,
  `achiev_description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_class_level`
--

DROP TABLE IF EXISTS `dbo_K_class_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_class_level` (
  `level_id` varchar(10) NOT NULL,
  `level_code` varchar(10) NOT NULL,
  `level_description` varchar(50) NOT NULL,
  `mon_time` varchar(23) NOT NULL,
  `tue_time` varchar(23) NOT NULL,
  `wed_time` varchar(23) NOT NULL,
  `thu_time` varchar(23) NOT NULL,
  `fri_time` varchar(23) NOT NULL,
  `sat_time` varchar(23) NOT NULL,
  `sun_time` varchar(23) NOT NULL,
  `level_num` varchar(10) NOT NULL,
  `color` varchar(255) NOT NULL,
  `Active` bit(1) NOT NULL,
  `ApplyToTip` bit(1) NOT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_class_level_belt`
--

DROP TABLE IF EXISTS `dbo_K_class_level_belt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_class_level_belt` (
  `Class_level_belt_unique_id` varchar(10) NOT NULL,
  `Class_level_belt_id` varchar(10) NOT NULL,
  `Class_level_level_id` varchar(10) NOT NULL,
  `Allowed` bit(1) NOT NULL,
  PRIMARY KEY (`Class_level_belt_unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_class_level_student`
--

DROP TABLE IF EXISTS `dbo_K_class_level_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_class_level_student` (
  `Class_level_student_unique_id` varchar(10) NOT NULL,
  `Class_level_Student_id` varchar(10) NOT NULL,
  `Class_level_level_id` varchar(10) NOT NULL,
  `Allowed` bit(1) NOT NULL,
  `Autofrombelt` bit(1) NOT NULL,
  PRIMARY KEY (`Class_level_student_unique_id`),
  KEY `NonClusteredIndex-20150523-093010` (`Class_level_Student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_class_type`
--

DROP TABLE IF EXISTS `dbo_K_class_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_class_type` (
  `class_type_ID` varchar(10) NOT NULL,
  `class_type_code` varchar(10) NOT NULL,
  `description` varchar(128) NOT NULL,
  `Tip1` varchar(10) NOT NULL,
  `Tip2` varchar(10) NOT NULL,
  `Tip3` varchar(10) NOT NULL,
  `active` bit(1) NOT NULL,
  PRIMARY KEY (`class_type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_class_type_detail`
--

DROP TABLE IF EXISTS `dbo_K_class_type_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_class_type_detail` (
  `class_type_detail_id` varchar(10) NOT NULL,
  `class_type_id` varchar(10) NOT NULL,
  `class_achiev_type_id` varchar(10) NOT NULL,
  PRIMARY KEY (`class_type_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_color`
--

DROP TABLE IF EXISTS `dbo_K_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_color` (
  `color_ID` varchar(10) NOT NULL,
  `Color` varchar(32) NOT NULL,
  `Color_Code` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`color_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_contact`
--

DROP TABLE IF EXISTS `dbo_K_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_contact` (
  `contact_ID` varchar(10) NOT NULL,
  `relation_ID` varchar(10) NOT NULL,
  `isBillingAddress` bit(1) NOT NULL,
  `isMainAddress` bit(1) NOT NULL,
  `Addr1` varchar(50) NOT NULL,
  `Addr2` varchar(50) NOT NULL,
  `Addr3` varchar(50) NOT NULL,
  `Addr4` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `St` varchar(10) NOT NULL,
  `cellprovider` varchar(10) NOT NULL,
  `StudentID` varchar(10) NOT NULL,
  `zipcode` varchar(50) NOT NULL,
  `Email1` varchar(50) NOT NULL,
  `Email2` varchar(50) NOT NULL,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `CellPhone` varchar(19) NOT NULL,
  `HomePhone` varchar(19) NOT NULL,
  `Duplicate` bit(1) NOT NULL,
  `MasterStudentID` varchar(10) NOT NULL,
  `SendEmails` bit(1) NOT NULL,
  `SendTexts` bit(1) NOT NULL,
  `CellEmailExt` varchar(20) NOT NULL,
  `CellSMS` varchar(50) NOT NULL,
  `CellMMS` varchar(50) NOT NULL,
  PRIMARY KEY (`contact_ID`),
  KEY `_dta_index_K_contact_c_8_1282103608__K4_K3` (`isMainAddress`,`isBillingAddress`),
  KEY `_dta_index_K_contact_8_1282103608__K12_K3_K4_K1_5_6_9_10_11_131` (`StudentID`,`isBillingAddress`,`isMainAddress`,`contact_ID`),
  KEY `_dta_index_K_contact_8_1282103608__K4_K12_K3_K5_K6_K14_K15_K162` (`isMainAddress`,`StudentID`,`isBillingAddress`,`Addr1`,`Addr2`,`Email1`,`Email2`,`Fname`,`Lname`,`CellPhone`,`HomePhone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_contract`
--

DROP TABLE IF EXISTS `dbo_K_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_contract` (
  `Contract_id` varchar(10) NOT NULL,
  `Student1_ID` varchar(10) NOT NULL,
  `Student2_Id` varchar(10) NOT NULL,
  `Student3_id` varchar(10) NOT NULL,
  `Student1_Lname` varchar(50) NOT NULL,
  `Student2_lname` varchar(50) NOT NULL,
  `Student3_lname` varchar(50) NOT NULL,
  `Father_name` varchar(50) NOT NULL,
  `Mother_name` varchar(50) NOT NULL,
  `Payee_fname` varchar(50) NOT NULL,
  `Payee_lname` varchar(50) NOT NULL,
  `addr1` varchar(50) NOT NULL,
  `addr2` varchar(50) NOT NULL,
  `addr3` varchar(50) NOT NULL,
  `addr4` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip` varchar(50) NOT NULL,
  `contact_name1` varchar(50) NOT NULL,
  `email1` varchar(50) NOT NULL,
  `billaddr1` varchar(50) NOT NULL,
  `billaddr2` varchar(50) NOT NULL,
  `billaddr3` varchar(50) NOT NULL,
  `billaddr4` varchar(50) NOT NULL,
  `billcity` varchar(50) NOT NULL,
  `billst` varchar(50) NOT NULL,
  `billzip` varchar(50) NOT NULL,
  `home_phone` varchar(50) NOT NULL,
  `work_phone` varchar(50) NOT NULL,
  `cell_phone` varchar(50) NOT NULL,
  `Program_id1` varchar(10) NOT NULL,
  `program_name1` varchar(128) NOT NULL,
  `start1` varchar(50) NOT NULL,
  `expire1` varchar(50) NOT NULL,
  `total1` varchar(19) NOT NULL,
  `downpayment1` varchar(19) NOT NULL,
  `amtfinanced1` varchar(19) NOT NULL,
  `monthlypay1` varchar(19) NOT NULL,
  `numofpays1` int NOT NULL,
  `financechrg1` varchar(19) NOT NULL,
  `max_lessons1` varchar(50) NOT NULL,
  `min_lessons1` varchar(50) NOT NULL,
  `Program_id2` varchar(10) NOT NULL,
  `program_name2` varchar(128) NOT NULL,
  `start2` varchar(50) NOT NULL,
  `expire2` varchar(50) NOT NULL,
  `total2` varchar(19) NOT NULL,
  `downpayment2` varchar(19) NOT NULL,
  `amtfinanced2` varchar(19) NOT NULL,
  `monthlypay2` varchar(19) NOT NULL,
  `numofpays2` int NOT NULL,
  `financechrg2` varchar(19) NOT NULL,
  `max_lessons2` varchar(50) NOT NULL,
  `min_lessons2` varchar(50) NOT NULL,
  `Program_id3` varchar(10) NOT NULL,
  `program_name3` varchar(128) NOT NULL,
  `start3` varchar(50) NOT NULL,
  `expire3` varchar(50) NOT NULL,
  `total3` varchar(19) NOT NULL,
  `downpayment3` varchar(19) NOT NULL,
  `amtfinanced3` varchar(19) NOT NULL,
  `monthlypay3` varchar(19) NOT NULL,
  `numofpays3` int NOT NULL,
  `financechrg3` varchar(19) NOT NULL,
  `max_lessons3` varchar(50) NOT NULL,
  `min_lessons3` varchar(50) NOT NULL,
  `stbirth1` varchar(50) NOT NULL,
  `stbirth2` varchar(50) NOT NULL,
  `stbirth3` varchar(50) NOT NULL,
  `stsex1` varchar(50) NOT NULL,
  `stsex2` varchar(50) NOT NULL,
  `stsex3` varchar(50) NOT NULL,
  `duration_months1` varchar(50) NOT NULL,
  `duration_months2` varchar(50) NOT NULL,
  `duration_months3` varchar(50) NOT NULL,
  `startpay1` varchar(50) NOT NULL,
  `startpay2` varchar(50) NOT NULL,
  `endpay1` varchar(50) NOT NULL,
  `endpay2` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_contract_master`
--

DROP TABLE IF EXISTS `dbo_K_contract_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_contract_master` (
  `Contract_ID` varchar(10) NOT NULL,
  `Father_name` varchar(50) NOT NULL,
  `Mother_name` varchar(50) NOT NULL,
  `Payee_fname` varchar(50) NOT NULL,
  `Payee_lname` varchar(50) NOT NULL,
  `addr1` varchar(50) NOT NULL,
  `addr2` varchar(50) NOT NULL,
  `addr3` varchar(50) NOT NULL,
  `addr4` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip` varchar(50) NOT NULL,
  `contact_name` varchar(50) NOT NULL,
  `email1` varchar(50) NOT NULL,
  `billaddr1` varchar(50) NOT NULL,
  `billaddr2` varchar(50) NOT NULL,
  `billaddr3` varchar(50) NOT NULL,
  `billaddr4` varchar(50) NOT NULL,
  `billcity` varchar(50) NOT NULL,
  `billst` varchar(50) NOT NULL,
  `billzip` varchar(50) NOT NULL,
  `home_phone` varchar(50) NOT NULL,
  `work_phone` varchar(50) NOT NULL,
  `cell_phone` varchar(50) NOT NULL,
  `total` varchar(19) NOT NULL,
  `downpayment` varchar(19) NOT NULL,
  `amtfinanced` varchar(19) NOT NULL,
  `monthlypay` varchar(19) NOT NULL,
  `numofpays` varchar(5) NOT NULL,
  `financechrg` varchar(19) NOT NULL,
  `startpaydate` varchar(23) NOT NULL,
  `endpaydate` varchar(23) NOT NULL,
  `percentfinanced` varchar(19) NOT NULL,
  `contract_doc` tinyint(1) NOT NULL,
  PRIMARY KEY (`Contract_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_contract_templates`
--

DROP TABLE IF EXISTS `dbo_K_contract_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_contract_templates` (
  `Template_id` varchar(10) NOT NULL,
  `Template` tinyint(1) NOT NULL,
  `Active` bit(1) NOT NULL,
  `Template_description` varchar(100) NOT NULL,
  `TemplateType` varchar(100) NOT NULL,
  PRIMARY KEY (`Template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_default_Codes`
--

DROP TABLE IF EXISTS `dbo_K_default_Codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_default_Codes` (
  `DefaultID` varchar(10) NOT NULL,
  `DefaultCodeID` varchar(10) NOT NULL,
  `DefaultTable` varchar(50) NOT NULL,
  `DefaultDesc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_level_belt_link`
--

DROP TABLE IF EXISTS `dbo_K_level_belt_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_level_belt_link` (
  `ID` varchar(10) NOT NULL,
  `Level_ID` varchar(10) NOT NULL,
  `Belt_id` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_login`
--

DROP TABLE IF EXISTS `dbo_K_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_login` (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `loginID` mediumtext NOT NULL,
  `password` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_mail_merge`
--

DROP TABLE IF EXISTS `dbo_K_mail_merge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_mail_merge` (
  `personal_id` varchar(10) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `bdate` varchar(23) NOT NULL,
  `addr1` varchar(50) NOT NULL,
  `addr2` varchar(50) NOT NULL,
  `addr3` varchar(50) NOT NULL,
  `addr4` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip` varchar(50) NOT NULL,
  `contact_name1` varchar(50) NOT NULL,
  `status_code` varchar(50) NOT NULL,
  `expire` varchar(23) NOT NULL,
  `program_name` varchar(128) NOT NULL,
  `date_aquired` varchar(23) NOT NULL,
  `Color` varchar(32) NOT NULL,
  `total` varchar(19) NOT NULL,
  `downpayment` varchar(19) NOT NULL,
  `amtfinanced` varchar(19) NOT NULL,
  `monthlypay` varchar(19) NOT NULL,
  `numofpays` varchar(5) NOT NULL,
  `financechrg` varchar(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_med_conditions`
--

DROP TABLE IF EXISTS `dbo_K_med_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_med_conditions` (
  `medical_ID` varchar(10) NOT NULL,
  `student_ID` varchar(10) NOT NULL,
  `Description` longtext NOT NULL,
  PRIMARY KEY (`medical_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_merge_codes`
--

DROP TABLE IF EXISTS `dbo_K_merge_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_merge_codes` (
  `Merge_codeID` varchar(10) NOT NULL,
  `Merge_Code` varchar(50) NOT NULL,
  `Merge_data_field` varchar(50) NOT NULL,
  `Merge_code_type` varchar(10) NOT NULL,
  `Merge_popupmenu_code` varchar(50) NOT NULL,
  PRIMARY KEY (`Merge_codeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_merge_docs`
--

DROP TABLE IF EXISTS `dbo_K_merge_docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_merge_docs` (
  `doc_id` varchar(10) NOT NULL,
  `doc_name` varchar(50) NOT NULL,
  `doc_path` varchar(100) NOT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_messages`
--

DROP TABLE IF EXISTS `dbo_K_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_messages` (
  `message_id` varchar(10) NOT NULL,
  `student_id` varchar(10) NOT NULL,
  `message` longtext NOT NULL,
  `date` varchar(23) NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `_dta_index_K_messages_8_1330103779__K2_K1_K4` (`student_id`,`message_id`,`date`),
  KEY `_dta_index_K_messages_8_1330103779__K4D_K1_K2` (`date`,`message_id`,`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_personal`
--

DROP TABLE IF EXISTS `dbo_K_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_personal` (
  `personal_id` varchar(10) NOT NULL,
  `status_id` varchar(10) NOT NULL,
  `block` bit(1) NOT NULL,
  `last_mod_date` varchar(23) NOT NULL,
  `duration` varchar(10) NOT NULL,
  `personal_type_ID` varchar(10) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `bdate` varchar(23) NOT NULL,
  `sex` int NOT NULL,
  `maritalstatus` int NOT NULL,
  `addr1` varchar(50) NOT NULL,
  `addr2` varchar(50) NOT NULL,
  `addr3` varchar(50) NOT NULL,
  `addr4` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip` varchar(50) NOT NULL,
  `home_phone` varchar(50) NOT NULL,
  `work_phone` varchar(50) NOT NULL,
  `cell_phone` varchar(50) NOT NULL,
  `beeper` varchar(50) NOT NULL,
  `email1` varchar(50) NOT NULL,
  `email2` varchar(50) NOT NULL,
  `photo` longtext NOT NULL,
  `post` bit(1) NOT NULL,
  `medical_condition` longtext NOT NULL,
  `pros_call_date` varchar(23) NOT NULL,
  `pros_cont_name` varchar(80) NOT NULL,
  `pros_adver` varchar(10) NOT NULL,
  `current_belt_id` varchar(10) NOT NULL,
  `paid_for_next_belt` bit(1) NOT NULL,
  `program_id` varchar(10) NOT NULL,
  `level_Id` varchar(10) NOT NULL,
  `monday` bit(1) NOT NULL,
  `tuesday` bit(1) NOT NULL,
  `wednesday` bit(1) NOT NULL,
  `thursday` bit(1) NOT NULL,
  `friday` bit(1) NOT NULL,
  `saturday` bit(1) NOT NULL,
  `sunday` bit(1) NOT NULL,
  `unlimited` bit(1) NOT NULL,
  `includes_exam_fees` bit(1) NOT NULL,
  `enroll` varchar(23) NOT NULL,
  `upgrade` varchar(23) NOT NULL,
  `start` varchar(23) NOT NULL,
  `expire` varchar(23) NOT NULL,
  `extended` varchar(23) NOT NULL,
  `max_lesson` varchar(10) NOT NULL,
  `min_lesson` varchar(10) NOT NULL,
  `date_last_belt` varchar(23) NOT NULL,
  `messg` longtext NOT NULL,
  `old_id` varchar(10) NOT NULL,
  `old_program` varchar(255) NOT NULL,
  `old_current_belt` varchar(50) NOT NULL,
  `old_current_tip` varchar(50) NOT NULL,
  `old_status` varchar(50) NOT NULL,
  `old_age` varchar(10) NOT NULL,
  `contact_name1` varchar(50) NOT NULL,
  `contact_relationship1` varchar(50) NOT NULL,
  `contact_phone1` varchar(50) NOT NULL,
  `conact_email1` varchar(50) NOT NULL,
  `contact_name2` varchar(50) NOT NULL,
  `contact_relationship2` varchar(50) NOT NULL,
  `contact_phone2` varchar(50) NOT NULL,
  `conact_email2` varchar(50) NOT NULL,
  `contact_name3` varchar(50) NOT NULL,
  `contact_relationship3` varchar(50) NOT NULL,
  `contact_phone3` varchar(50) NOT NULL,
  `conact_email3` varchar(50) NOT NULL,
  `class_attend_offset` varchar(10) NOT NULL,
  `daily_message` longtext NOT NULL,
  `old_offset` varchar(10) NOT NULL,
  `referred_by` varchar(50) NOT NULL,
  `advert_id` varchar(10) NOT NULL,
  `pros_age` varchar(10) NOT NULL,
  `pros_appt1_date` varchar(23) NOT NULL,
  `pros_appt1_time` varchar(23) NOT NULL,
  `pros_appt1_kept` bit(1) NOT NULL,
  `pros_appt1_comm` longtext NOT NULL,
  `pros_appt1_posted` bit(1) NOT NULL,
  `pros_appt2_date` varchar(23) NOT NULL,
  `pros_appt2_time` varchar(23) NOT NULL,
  `pros_appt2_kept` bit(1) NOT NULL,
  `pros_appt2_comm` longtext NOT NULL,
  `pros_appt2_posted` bit(1) NOT NULL,
  `pros_appt3_date` varchar(23) NOT NULL,
  `pros_appt3_time` varchar(23) NOT NULL,
  `pros_appt3_kept` bit(1) NOT NULL,
  `pros_appt3_comm` longtext NOT NULL,
  `pros_appt3_posted` bit(1) NOT NULL,
  `pros_call_time` varchar(23) NOT NULL,
  `pros_ref_by` varchar(100) NOT NULL,
  `pros_comm` longtext NOT NULL,
  `dropoutdate` varchar(23) NOT NULL,
  `billaddr1` varchar(50) NOT NULL,
  `billaddr2` varchar(50) NOT NULL,
  `billaddr3` varchar(50) NOT NULL,
  `billaddr4` varchar(50) NOT NULL,
  `billcity` varchar(50) NOT NULL,
  `billst` varchar(50) NOT NULL,
  `billzip` varchar(50) NOT NULL,
  `contact_name4` varchar(50) NOT NULL,
  `contact_relationship4` varchar(50) NOT NULL,
  `contact_phone4` varchar(50) NOT NULL,
  `conact_email4` varchar(50) NOT NULL,
  `bdayemaisent` bit(1) NOT NULL,
  `annivemailsent` bit(1) NOT NULL,
  `Renewal` varchar(23) NOT NULL,
  `Prospect_ID` varchar(19) NOT NULL,
  `Current_belt_track_id` varchar(10) NOT NULL,
  `Contact1TextProvider` varchar(10) NOT NULL,
  `Contact2TextProvider` varchar(10) NOT NULL,
  `Contact3TextProvider` varchar(10) NOT NULL,
  `Contact4TextProvider` varchar(10) NOT NULL,
  `MailAddressRelationship` varchar(10) NOT NULL,
  `BillAddressRelationship` varchar(10) NOT NULL,
  `ProspectID` varchar(10) NOT NULL,
  `graduation_class_id` varchar(10) NOT NULL,
  `belt_size` varchar(10) NOT NULL,
  `GraduationConfirmed` bit(1) NOT NULL,
  `ReferredByID` varchar(10) NOT NULL,
  `UploadedToQB` varchar(10) NOT NULL,
  `QBOStatus` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `QBOCustName` varchar(256) NOT NULL,
  `QBOCustNum` varchar(10) NOT NULL,
  `QBDCustName` varchar(256) NOT NULL,
  `QBDCustNum` varchar(10) NOT NULL,
  `QBDStatus` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`personal_id`),
  KEY `ClusteredIndex-20140410-205014` (`personal_id`,`program_id`),
  KEY `_dta_index_K_personal_8_341576255__K1_2_7_9_32_34_120_122` (`personal_id`),
  KEY `_dta_index_K_personal_8_341576255__K124_K2_1` (`UploadedToQB`,`status_id`),
  KEY `_dta_index_K_personal_8_341576255__K34` (`program_id`),
  KEY `_dta_index_K_personal_8_341576255__K34_K2` (`program_id`,`status_id`),
  KEY `_dta_index_K_personal_8_341576255__K45_2_32` (`enroll`),
  KEY `_dta_index_K_personal_8_341576255__K96` (`dropoutdate`),
  KEY `NonClusteredIndex-20140412-081242` (`current_belt_id`),
  KEY `NonClusteredIndex-20140412-081524` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_personal_type`
--

DROP TABLE IF EXISTS `dbo_K_personal_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_personal_type` (
  `personal_type_ID` varchar(10) NOT NULL,
  `description` varchar(128) NOT NULL,
  PRIMARY KEY (`personal_type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_prog_hist_contract`
--

DROP TABLE IF EXISTS `dbo_K_prog_hist_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_prog_hist_contract` (
  `Prog_Hist_contract_ID` varchar(10) NOT NULL,
  `Contract_ID` varchar(10) NOT NULL,
  `Program_Hist_ID` varchar(10) NOT NULL,
  `Contract_text` tinyint(1) NOT NULL,
  PRIMARY KEY (`Prog_Hist_contract_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_progam_class`
--

DROP TABLE IF EXISTS `dbo_K_progam_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_progam_class` (
  `program_class_ID` varchar(10) NOT NULL,
  `program_ID` varchar(10) NOT NULL,
  `class_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`program_class_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_program_hist`
--

DROP TABLE IF EXISTS `dbo_K_program_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_program_hist` (
  `program_hist_ID` varchar(10) NOT NULL,
  `program_ID` varchar(10) NOT NULL,
  `student_ID` varchar(10) NOT NULL,
  `max_lessons` varchar(10) NOT NULL,
  `min_lessons` varchar(10) NOT NULL,
  `StartDate` varchar(23) NOT NULL,
  `ExpireDate` varchar(23) NOT NULL,
  `RenewalDate` varchar(23) NOT NULL,
  `OriginalExpireDate` varchar(23) NOT NULL,
  `ContractID` varchar(10) NOT NULL,
  `Total` varchar(19) NOT NULL,
  `feepaidfornextbelt` bit(1) NOT NULL,
  `duration_months` varchar(10) NOT NULL,
  `amtfinanced` varchar(19) NOT NULL,
  `monthlypay` varchar(19) NOT NULL,
  `numofpays` varchar(10) NOT NULL,
  `financepercent` varchar(5) NOT NULL,
  `financecharge` varchar(19) NOT NULL,
  `startpaydate` varchar(23) NOT NULL,
  `endpaydate` varchar(23) NOT NULL,
  `class_attend_offset` varchar(10) NOT NULL,
  `includes_exam_fees` bit(1) NOT NULL,
  `downpay` varchar(19) NOT NULL,
  `QBOStatus` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `QBDStatus` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`program_hist_ID`),
  KEY `_dta_index_K_program_hist_c_8_2099048__K1` (`program_hist_ID`),
  KEY `_dta_index_K_program_hist_8_2099048__K8_K1` (`RenewalDate`,`program_hist_ID`),
  KEY `NonClusteredIndex-20140412-081149` (`program_ID`),
  KEY `NonClusteredIndex-20150523-093123` (`student_ID`,`program_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_programs`
--

DROP TABLE IF EXISTS `dbo_K_programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_programs` (
  `program_ID` varchar(10) NOT NULL,
  `program_name` varchar(128) NOT NULL,
  `Program_display_name` varchar(255) NOT NULL,
  `enroll_date` varchar(23) NOT NULL,
  `upgrade_date` varchar(23) NOT NULL,
  `start_date` varchar(23) NOT NULL,
  `expire_date` varchar(23) NOT NULL,
  `ext_date` varchar(23) NOT NULL,
  `duration_months` varchar(50) NOT NULL,
  `tpw` varchar(50) NOT NULL,
  `max_lessons` varchar(10) NOT NULL,
  `min_lessons` varchar(10) NOT NULL,
  `app_classes_per_black_tip` double NOT NULL,
  `monday` bit(1) NOT NULL,
  `tuesday` bit(1) NOT NULL,
  `wednesday` bit(1) NOT NULL,
  `thursday` bit(1) NOT NULL,
  `friday` bit(1) NOT NULL,
  `saturday` bit(1) NOT NULL,
  `sunday` bit(1) NOT NULL,
  `unlimited` bit(1) NOT NULL,
  `total` varchar(19) NOT NULL,
  `downpayment` varchar(19) NOT NULL,
  `amtfinanced` varchar(19) NOT NULL,
  `monthlypay` varchar(19) NOT NULL,
  `numofpays` int NOT NULL,
  `financechrg` varchar(19) NOT NULL,
  `belt_fee_included` bit(1) NOT NULL,
  `active` bit(1) NOT NULL,
  PRIMARY KEY (`program_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_prospects_obsolete`
--

DROP TABLE IF EXISTS `dbo_K_prospects_obsolete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_prospects_obsolete` (
  `prospect_ID` varchar(10) NOT NULL,
  `personal_ID` varchar(10) NOT NULL,
  `call_date` varchar(23) NOT NULL,
  `advert_ID` varchar(10) NOT NULL,
  `reffered_by` varchar(128) NOT NULL,
  `handled_by` varchar(128) NOT NULL,
  `Called` int NOT NULL,
  PRIMARY KEY (`prospect_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_relationship`
--

DROP TABLE IF EXISTS `dbo_K_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_relationship` (
  `relationship_ID` varchar(10) NOT NULL,
  `Description` varchar(50) NOT NULL,
  PRIMARY KEY (`relationship_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_status_update_triggers`
--

DROP TABLE IF EXISTS `dbo_K_status_update_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_status_update_triggers` (
  `ID` varchar(19) NOT NULL,
  `status_trigger` varchar(23) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_student`
--

DROP TABLE IF EXISTS `dbo_K_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_student` (
  `student_ID` varchar(10) NOT NULL,
  `personal_ID` varchar(10) NOT NULL,
  `medical_ID` varchar(10) NOT NULL,
  `karate_ID` varchar(10) NOT NULL,
  `current_belt_id` varchar(10) NOT NULL,
  PRIMARY KEY (`student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_teacher`
--

DROP TABLE IF EXISTS `dbo_K_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_teacher` (
  `teacher_ID` varchar(10) NOT NULL,
  `personal_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`teacher_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_K_timezoneoffset`
--

DROP TABLE IF EXISTS `dbo_K_timezoneoffset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_K_timezoneoffset` (
  `ID` varchar(10) NOT NULL,
  `timezoneoffset` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_MC_Photo_Table`
--

DROP TABLE IF EXISTS `dbo_MC_Photo_Table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_MC_Photo_Table` (
  `Photo_ID` varchar(10) NOT NULL,
  `Student_ID` varchar(10) NOT NULL,
  `Photo` tinyint(1) NOT NULL,
  PRIMARY KEY (`Student_ID`),
  KEY `NonClusteredIndex-20140412-090449` (`Student_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_Q_Class_Roster_working_table`
--

DROP TABLE IF EXISTS `dbo_Q_Class_Roster_working_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_Q_Class_Roster_working_table` (
  `ID` varchar(10) NOT NULL,
  `class_attend_ID` double NOT NULL,
  `class_ID` double NOT NULL,
  `student_ID` double NOT NULL,
  `enrolled` bit(1) NOT NULL,
  `accomplished_achieve` bit(1) NOT NULL,
  `Expr1004` bit(1) NOT NULL,
  `late` bit(1) NOT NULL,
  `Notes` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `mname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `achieve_id` double NOT NULL,
  `achievement_accomplished_id` double NOT NULL,
  `attended` bit(1) NOT NULL,
  `boards_broken` double NOT NULL,
  `tip_description` varchar(255) NOT NULL,
  `Expr1017` bit(1) NOT NULL,
  `applied_to_achieve_id` double NOT NULL,
  `hold_count` double NOT NULL,
  `attendance_required` double NOT NULL,
  `attendance_to_applied` double NOT NULL,
  `classes_attended_offset` double NOT NULL,
  `class_posted` bit(1) NOT NULL,
  `date` varchar(23) NOT NULL,
  `level_description` varchar(255) NOT NULL,
  `apply_to_black_tip` bit(1) NOT NULL,
  `time` varchar(23) NOT NULL,
  `black_tip_achieved` bit(1) NOT NULL,
  `Expr1` varchar(255) NOT NULL,
  `enroll` varchar(23) NOT NULL,
  `bdate` varchar(23) NOT NULL,
  `status_code` varchar(255) NOT NULL,
  `paid_for_next_belt` bit(1) NOT NULL,
  `class_type_description` varchar(255) NOT NULL,
  `Color` varchar(255) NOT NULL,
  `includes_exam_fees` bit(1) NOT NULL,
  `ClasseSinceProgrStart` double NOT NULL,
  `daily_message` varchar(255) NOT NULL,
  `expire` varchar(23) NOT NULL,
  `max_lesson` double NOT NULL,
  `Classes Left` double NOT NULL,
  `date_aquired` varchar(23) NOT NULL,
  `SumOfboards_broken` varchar(255) NOT NULL,
  `SumOfpurchased_amt` varchar(255) NOT NULL,
  `type_ID` double NOT NULL,
  `medical_condition` varchar(255) NOT NULL,
  `Txtbeltdue` varchar(255) NOT NULL,
  `txtpaid` varchar(255) NOT NULL,
  `txtalert` varchar(255) NOT NULL,
  `classcountfortype` varchar(255) NOT NULL,
  `txtmessgs` varchar(255) NOT NULL,
  `text90` varchar(255) NOT NULL,
  `text92` varchar(255) NOT NULL,
  `txtblacktipdue` varchar(255) NOT NULL,
  `txtcolor` varchar(255) NOT NULL,
  `expr2` varchar(255) NOT NULL,
  `Countofclass_attend_ID` varchar(255) NOT NULL,
  `txtTestBeltReadyForNextTip` varchar(255) NOT NULL,
  `NextBelt` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_k_status`
--

DROP TABLE IF EXISTS `dbo_k_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_k_status` (
  `status_id` varchar(10) NOT NULL,
  `status_code` varchar(50) NOT NULL,
  `min_att_per_month` varchar(10) NOT NULL,
  `max_att_per_month` varchar(10) NOT NULL,
  `autoupdate` bit(1) NOT NULL,
  `IsProspect` bit(1) NOT NULL,
  `FilterID` varchar(10) NOT NULL,
  `GroupKey` varchar(19) NOT NULL,
  `active` bit(1) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbo_tmptest`
--

DROP TABLE IF EXISTS `dbo_tmptest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_tmptest` (
  `personal_id` varchar(10) NOT NULL,
  `Class_level_level_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-15 19:40:43
