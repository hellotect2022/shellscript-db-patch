-- MySQL dump 10.19  Distrib 10.3.35-MariaDB, for Linux (x86_64)
--
-- Host: 192.168.11.202    Database: messenger_syncdata
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB

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
-- Table structure for table `compare_company`
--

DROP TABLE IF EXISTS `compare_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compare_company` (
  `CompanyID` int(11) NOT NULL,
  `CompanyCode` varchar(50) NOT NULL,
  `CompanyURL` varchar(150) DEFAULT NULL,
  `CompanyName` varchar(200) NOT NULL,
  `MultiCompanyName` varchar(2000) NOT NULL,
  `IsUse` char(1) NOT NULL,
  `CompanyPath` varchar(200) NOT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `SyncType` varchar(7) NOT NULL,
  `Grouping` varchar(50) DEFAULT NULL,
  `SortKey` int(11) DEFAULT NULL,
  `Number` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Number`),
  KEY `SyncType` (`SyncType`),
  KEY `CompanyCode` (`CompanyCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compare_company`
--

LOCK TABLES `compare_company` WRITE;
/*!40000 ALTER TABLE `compare_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `compare_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compare_group`
--

DROP TABLE IF EXISTS `compare_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compare_group` (
  `Number` int(11) NOT NULL AUTO_INCREMENT,
  `GroupCode` varchar(100) NOT NULL,
  `CompanyCode` varchar(50) NOT NULL,
  `GroupType` varchar(30) NOT NULL,
  `MemberOf` varchar(50) DEFAULT NULL,
  `GroupPath` varchar(500) DEFAULT NULL,
  `DisplayName` varchar(200) DEFAULT NULL,
  `MultiDisplayName` varchar(2000) DEFAULT NULL,
  `SortKey` int(11) DEFAULT NULL,
  `SortPath` varchar(2000) DEFAULT NULL,
  `IsUse` char(1) DEFAULT NULL,
  `IsHR` char(1) DEFAULT 'Y',
  `IsDisplay` char(1) DEFAULT NULL,
  `RegistDate` datetime DEFAULT current_timestamp(),
  `ModifyDate` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Reserved1` char(1) DEFAULT 'Y' COMMENT '그룹채팅 시작 여부 값',
  `Reserved2` varchar(50) DEFAULT NULL,
  `RetireDept` varchar(7) DEFAULT NULL,
  `SyncType` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`Number`),
  KEY `IDX_COMPARE_GROUP` (`SyncType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='동기화 그룹';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compare_group`
--

LOCK TABLES `compare_group` WRITE;
/*!40000 ALTER TABLE `compare_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `compare_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compare_user`
--

DROP TABLE IF EXISTS `compare_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compare_user` (
  `Number` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(50) NOT NULL,
  `LogonID` varchar(50) NOT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `EmpNo` varchar(50) NOT NULL,
  `DisplayName` varchar(100) NOT NULL,
  `MultiDisplayName` varchar(2000) NOT NULL,
  `SortKey` int(11) NOT NULL,
  `IsUse` char(1) NOT NULL,
  `IsHR` char(1) NOT NULL DEFAULT 'Y',
  `IsDisplay` char(1) NOT NULL,
  `IsMobile` char(1) NOT NULL,
  `RegistDate` datetime DEFAULT current_timestamp(),
  `ModifyDate` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `LoginFailCount` int(11) DEFAULT 0,
  `AccountLock` char(1) DEFAULT 'N',
  `AdminAuth` char(1) NOT NULL DEFAULT 'N' COMMENT 'M : 전체 권한,  A : 회사별 권한, N : 없음',
  `TimeZone` varchar(20) NOT NULL,
  `SyncType` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`Number`),
  KEY `IDX_COMPARE_USER` (`SyncType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='동기화 사용자';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compare_user`
--

LOCK TABLES `compare_user` WRITE;
/*!40000 ALTER TABLE `compare_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `compare_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compare_user_base_group`
--

DROP TABLE IF EXISTS `compare_user_base_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compare_user_base_group` (
  `Number` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(50) NOT NULL,
  `JobType` varchar(20) NOT NULL,
  `SortKey` int(11) DEFAULT NULL,
  `CompanyCode` varchar(50) DEFAULT NULL,
  `DeptCode` varchar(50) DEFAULT NULL,
  `DeptName` varchar(200) DEFAULT NULL,
  `MultiDeptName` varchar(2000) DEFAULT NULL,
  `JobPositionCode` varchar(50) DEFAULT NULL,
  `JobPositionName` varchar(200) DEFAULT NULL,
  `MultiJobPositionName` varchar(2000) DEFAULT NULL,
  `JobTitleCode` varchar(50) DEFAULT NULL,
  `JobTitleName` varchar(200) DEFAULT NULL,
  `MultiJobTitleName` varchar(2000) DEFAULT NULL,
  `JobLevelCode` varchar(50) DEFAULT NULL,
  `JobLevelName` varchar(200) DEFAULT NULL,
  `MultiJobLevelName` varchar(2000) DEFAULT NULL,
  `SyncType` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`Number`),
  KEY `IDX_COMPARE_BASEGROUP` (`SyncType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='동기화 사용자 그룹';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compare_user_base_group`
--

LOCK TABLES `compare_user_base_group` WRITE;
/*!40000 ALTER TABLE `compare_user_base_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `compare_user_base_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compare_user_base_group_addjob`
--

DROP TABLE IF EXISTS `compare_user_base_group_addjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compare_user_base_group_addjob` (
  `Number` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(50) NOT NULL,
  `JobType` varchar(20) NOT NULL,
  `SortKey` int(11) DEFAULT NULL,
  `CompanyCode` varchar(50) DEFAULT NULL,
  `DeptCode` varchar(50) DEFAULT NULL,
  `DeptName` varchar(200) DEFAULT NULL,
  `MultiDeptName` varchar(2000) DEFAULT NULL,
  `JobPositionCode` varchar(50) DEFAULT NULL,
  `JobPositionName` varchar(200) DEFAULT NULL,
  `MultiJobPositionName` varchar(2000) DEFAULT NULL,
  `JobTitleCode` varchar(50) DEFAULT NULL,
  `JobTitleName` varchar(200) DEFAULT NULL,
  `MultiJobTitleName` varchar(2000) DEFAULT NULL,
  `JobLevelCode` varchar(50) DEFAULT NULL,
  `JobLevelName` varchar(200) DEFAULT NULL,
  `MultiJobLevelName` varchar(2000) DEFAULT NULL,
  `SyncType` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`Number`),
  KEY `IDX_COMPARE_ADDJOB` (`SyncType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='동기화 사용자 겸직';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compare_user_base_group_addjob`
--

LOCK TABLES `compare_user_base_group_addjob` WRITE;
/*!40000 ALTER TABLE `compare_user_base_group_addjob` DISABLE KEYS */;
/*!40000 ALTER TABLE `compare_user_base_group_addjob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compare_user_info`
--

DROP TABLE IF EXISTS `compare_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compare_user_info` (
  `Number` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(50) NOT NULL,
  `PhotoPath` varchar(1000) DEFAULT NULL,
  `PhotoFullPath` varchar(1000) DEFAULT NULL,
  `PhotoUrlPath` varchar(1000) DEFAULT NULL,
  `PhotoChangeDate` datetime DEFAULT current_timestamp(),
  `Address` varchar(200) DEFAULT NULL,
  `PhoneNumber` varchar(50) DEFAULT NULL,
  `CompanyNumber` varchar(50) DEFAULT NULL,
  `BirthDate` varchar(10) DEFAULT NULL,
  `MailAddress` varchar(200) DEFAULT NULL,
  `EnterDate` varchar(10) DEFAULT NULL,
  `ChargeBusiness` varchar(100) DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `CreateDate` datetime DEFAULT current_timestamp(),
  `SyncType` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`Number`),
  KEY `IDX_COMPARE_USER_INFO` (`SyncType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='동기화 사용자 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compare_user_info`
--

LOCK TABLES `compare_user_info` WRITE;
/*!40000 ALTER TABLE `compare_user_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `compare_user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compare_vacation`
--

DROP TABLE IF EXISTS `compare_vacation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compare_vacation` (
  `number` int(11) NOT NULL AUTO_INCREMENT,
  `vacationInfoID` bigint(20) NOT NULL DEFAULT 0,
  `userID` varchar(50) NOT NULL,
  `displayName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '사용자 이름',
  `vacFlag` varchar(30) NOT NULL,
  `vacFlagName` varchar(100) DEFAULT NULL,
  `startDate` timestamp NULL DEFAULT NULL,
  `endDate` timestamp NULL DEFAULT NULL,
  `gubun` varchar(30) DEFAULT NULL,
  `gubunName` varchar(100) DEFAULT NULL,
  `state` char(1) DEFAULT NULL,
  `syncType` varchar(7) NOT NULL,
  PRIMARY KEY (`number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compare_vacation`
--

LOCK TABLES `compare_vacation` WRITE;
/*!40000 ALTER TABLE `compare_vacation` DISABLE KEYS */;
/*!40000 ALTER TABLE `compare_vacation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `noMigration` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobGroup` varchar(190) NOT NULL,
  `jobName` varchar(190) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `statusCode` varchar(10) DEFAULT NULL,
  `errorMessage` varchar(100) DEFAULT NULL,
  `createDate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`noMigration`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgaddinfo`
--

DROP TABLE IF EXISTS `orgaddinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgaddinfo` (
  `UserID` varchar(50) NOT NULL,
  `AddInfo` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgaddinfo`
--

LOCK TABLES `orgaddinfo` WRITE;
/*!40000 ALTER TABLE `orgaddinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `orgaddinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgaddjob`
--

DROP TABLE IF EXISTS `orgaddjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgaddjob` (
  `Number` int(11) NOT NULL AUTO_INCREMENT,
  `JobType` varchar(30) DEFAULT NULL COMMENT '겸직/파견',
  `UserID` varchar(50) DEFAULT NULL COMMENT '사용자 코드',
  `CompanyCode` varchar(50) DEFAULT NULL COMMENT '회사 코드',
  `DeptCode` varchar(50) DEFAULT NULL COMMENT '부서 코드',
  `JobLevelCode` varchar(50) DEFAULT NULL COMMENT '직급코드',
  `JobPositionCode` varchar(50) DEFAULT NULL COMMENT '직위코드',
  `JobTitleCode` varchar(50) DEFAULT NULL COMMENT '직책코드',
  `SortKey` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Number`),
  KEY `IDX_ORGADDJOB` (`CompanyCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='겸직 데이터 연동';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgaddjob`
--

LOCK TABLES `orgaddjob` WRITE;
/*!40000 ALTER TABLE `orgaddjob` DISABLE KEYS */;
/*!40000 ALTER TABLE `orgaddjob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgdept`
--

DROP TABLE IF EXISTS `orgdept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgdept` (
  `GroupCode` varchar(50) NOT NULL COMMENT '부서 코드',
  `CompanyCode` varchar(50) DEFAULT NULL COMMENT '소속 회사 코드',
  `MemberOf` varchar(50) DEFAULT NULL COMMENT '상위 부서 코드',
  `DisplayName` varchar(200) DEFAULT NULL COMMENT '부서명',
  `MultiDisplayName` varchar(2000) DEFAULT NULL COMMENT '다국어 부서명',
  `SortKey` int(11) DEFAULT NULL COMMENT '우선 순위',
  `IsUse` char(1) DEFAULT 'Y' COMMENT '사용 여부',
  `Reserved1` char(1) DEFAULT 'Y' COMMENT '그룹채팅시작여부',
  `RetireDept` char(1) DEFAULT 'N' COMMENT '퇴직부서여부',
  `IsDisplay` char(1) DEFAULT 'Y' COMMENT '부서 표시여부',
  PRIMARY KEY (`GroupCode`),
  KEY `IDX_ORGDEPT` (`CompanyCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='부서 데이터 연동';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgdept`
--

LOCK TABLES `orgdept` WRITE;
/*!40000 ALTER TABLE `orgdept` DISABLE KEYS */;
/*!40000 ALTER TABLE `orgdept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgdomain`
--

DROP TABLE IF EXISTS `orgdomain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgdomain` (
  `CompanyID` int(11) NOT NULL,
  `CompanyCode` varchar(50) NOT NULL,
  `CompanyURL` varchar(150) DEFAULT NULL,
  `CompanyName` varchar(200) NOT NULL,
  `MultiCompanyName` varchar(2000) NOT NULL,
  `Grouping` varchar(50) DEFAULT NULL,
  `IsUse` char(1) DEFAULT 'Y',
  `CreateDate` datetime DEFAULT NULL,
  `SortKey` int(11) DEFAULT NULL,
  PRIMARY KEY (`CompanyCode`),
  UNIQUE KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgdomain`
--

LOCK TABLES `orgdomain` WRITE;
/*!40000 ALTER TABLE `orgdomain` DISABLE KEYS */;
/*!40000 ALTER TABLE `orgdomain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgjoblevel`
--

DROP TABLE IF EXISTS `orgjoblevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgjoblevel` (
  `GroupCode` varchar(50) NOT NULL COMMENT '직급 코드',
  `CompanyCode` varchar(50) NOT NULL COMMENT '소속 회사 코드',
  `DisplayName` varchar(200) NOT NULL COMMENT '직급명',
  `MultiDisplayName` varchar(2000) DEFAULT NULL COMMENT '다국어 직급명',
  `SortKey` int(11) NOT NULL COMMENT '우선 순위',
  `IsUse` char(1) DEFAULT 'Y' COMMENT '사용 여부',
  `IsDisplay` char(1) DEFAULT 'Y' COMMENT '직급 표시여부',
  PRIMARY KEY (`GroupCode`),
  KEY `IDX_ORGJOBLEVEL` (`CompanyCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='직급 연동';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgjoblevel`
--

LOCK TABLES `orgjoblevel` WRITE;
/*!40000 ALTER TABLE `orgjoblevel` DISABLE KEYS */;
/*!40000 ALTER TABLE `orgjoblevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgjobposition`
--

DROP TABLE IF EXISTS `orgjobposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgjobposition` (
  `GroupCode` varchar(50) NOT NULL COMMENT '직위 코드',
  `CompanyCode` varchar(50) NOT NULL COMMENT '소속 회사 코드',
  `DisplayName` varchar(200) NOT NULL COMMENT '직위명',
  `MultiDisplayName` varchar(2000) DEFAULT NULL COMMENT '다국어 직위명',
  `SortKey` int(11) NOT NULL COMMENT '우선 순위',
  `IsUse` char(1) DEFAULT 'Y' COMMENT '사용 여부',
  `IsDisplay` char(1) DEFAULT 'Y' COMMENT '직위 표시여부',
  PRIMARY KEY (`GroupCode`),
  KEY `IDX_ORGJOBPOSITION` (`CompanyCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='직위 코드 연동';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgjobposition`
--

LOCK TABLES `orgjobposition` WRITE;
/*!40000 ALTER TABLE `orgjobposition` DISABLE KEYS */;
/*!40000 ALTER TABLE `orgjobposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgjobtitle`
--

DROP TABLE IF EXISTS `orgjobtitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgjobtitle` (
  `GroupCode` varchar(50) NOT NULL COMMENT '직책 코드',
  `CompanyCode` varchar(50) NOT NULL COMMENT '소속 회사 코드',
  `DisplayName` varchar(200) NOT NULL COMMENT '직위명',
  `MultiDisplayName` varchar(2000) DEFAULT NULL COMMENT '다국어 직책명',
  `SortKey` int(11) NOT NULL COMMENT '우선 순위',
  `IsUse` char(1) DEFAULT 'Y' COMMENT '사용 여부',
  `IsDisplay` char(1) DEFAULT 'Y' COMMENT '직책 표시여부',
  PRIMARY KEY (`GroupCode`),
  KEY `IDX_ORGJOBTITLE` (`CompanyCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='직책 코드 연동';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgjobtitle`
--

LOCK TABLES `orgjobtitle` WRITE;
/*!40000 ALTER TABLE `orgjobtitle` DISABLE KEYS */;
/*!40000 ALTER TABLE `orgjobtitle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgperson`
--

DROP TABLE IF EXISTS `orgperson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgperson` (
  `UserID` varchar(50) NOT NULL COMMENT '사용자 코드(로그온 아이디)',
  `CompanyCode` varchar(50) NOT NULL COMMENT '소속 회사 코드',
  `DeptCode` varchar(50) DEFAULT NULL COMMENT '소속 부서 코드',
  `LogonID` varchar(50) NOT NULL COMMENT '로그인 아이디',
  `EmpNo` varchar(50) DEFAULT NULL COMMENT '사원번호',
  `DisplayName` varchar(100) NOT NULL COMMENT '사용자 이름',
  `MultiDisplayName` varchar(1000) DEFAULT NULL COMMENT '사용자 다국어이름',
  `JobPositionCode` varchar(50) DEFAULT NULL COMMENT '직위 코드',
  `JobTitleCode` varchar(50) DEFAULT NULL COMMENT '직책 코드',
  `JobLevelCode` varchar(50) DEFAULT NULL COMMENT '직급 코드',
  `SortKey` int(11) DEFAULT NULL COMMENT '우선순위',
  `IsUse` char(1) DEFAULT 'Y' COMMENT '사용여부',
  `IsDisplay` char(1) DEFAULT 'Y' COMMENT '조직도 표시여부',
  `IsMobile` char(1) DEFAULT 'Y',
  `EnterDate` varchar(10) DEFAULT NULL COMMENT '입사일자',
  `RetireDate` varchar(10) DEFAULT NULL COMMENT '퇴사일자',
  `BirthDiv` varchar(10) DEFAULT 'S' COMMENT '양력(S)/음력(L)',
  `BirthDate` varchar(10) DEFAULT NULL COMMENT '생년월일',
  `PhotoPath` varchar(1000) DEFAULT NULL COMMENT '사진경로',
  `PhotoFullPath` varchar(1000) DEFAULT NULL,
  `PhotoUrlPath` varchar(1000) DEFAULT NULL,
  `MailAddress` varchar(100) DEFAULT NULL COMMENT '메일주소',
  `ExternalMailAddress` varchar(200) DEFAULT NULL COMMENT '외부메일주소',
  `ChargeBusiness` varchar(100) DEFAULT NULL COMMENT '담당업무',
  `PhoneNumberInter` varchar(50) DEFAULT NULL COMMENT '내선번호',
  `PhoneNumber` varchar(50) DEFAULT NULL COMMENT '전화번호',
  `Mobile` varchar(50) DEFAULT NULL COMMENT '휴대폰',
  `Fax` varchar(50) DEFAULT NULL COMMENT '팩스',
  `AdminAuth` char(1) DEFAULT 'N' COMMENT '관리자',
  PRIMARY KEY (`UserID`),
  KEY `IDX_ORGPERSON` (`CompanyCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사용자 연동';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgperson`
--

LOCK TABLES `orgperson` WRITE;
/*!40000 ALTER TABLE `orgperson` DISABLE KEYS */;
/*!40000 ALTER TABLE `orgperson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgvacation`
--

DROP TABLE IF EXISTS `orgvacation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgvacation` (
  `vacationInfoID` bigint(20) NOT NULL DEFAULT 0,
  `userID` varchar(50) NOT NULL,
  `displayName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '사용자 이름',
  `vacFlag` varchar(30) NOT NULL,
  `vacFlagName` varchar(100) NOT NULL,
  `startDate` timestamp NULL DEFAULT NULL,
  `endDate` timestamp NULL DEFAULT NULL,
  `gubun` varchar(30) NOT NULL,
  `gubunName` varchar(100) NOT NULL,
  `state` char(1) DEFAULT NULL,
  PRIMARY KEY (`vacationInfoID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgvacation`
--

LOCK TABLES `orgvacation` WRITE;
/*!40000 ALTER TABLE `orgvacation` DISABLE KEYS */;
/*!40000 ALTER TABLE `orgvacation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-10 17:59:11
