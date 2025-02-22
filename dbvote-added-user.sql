-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 22, 2025 at 04:18 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbvote`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblactiveuser`
--

DROP TABLE IF EXISTS `tblactiveuser`;
CREATE TABLE IF NOT EXISTS `tblactiveuser` (
  `tblactiveuserID` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tblactiveuserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblactiveuser`
--

INSERT INTO `tblactiveuser` (`tblactiveuserID`, `name`) VALUES
(1, 'Brian Sebastian');

-- --------------------------------------------------------

--
-- Table structure for table `tblanswer`
--

DROP TABLE IF EXISTS `tblanswer`;
CREATE TABLE IF NOT EXISTS `tblanswer` (
  `intAnswerId` int(11) NOT NULL AUTO_INCREMENT,
  `strAnsMemId` varchar(45) NOT NULL,
  `intQuestId` int(11) NOT NULL,
  `intAnsSurvFormId` int(11) NOT NULL,
  `txtAnswer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`intAnswerId`),
  KEY `fkAnsMem_idx` (`strAnsMemId`),
  KEY `fkAnsQuest_idx` (`intQuestId`),
  KEY `fkAnsSurvForm_idx` (`intAnsSurvFormId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblaudit`
--

DROP TABLE IF EXISTS `tblaudit`;
CREATE TABLE IF NOT EXISTS `tblaudit` (
  `tblmemaudId` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(45) NOT NULL,
  `strMemberId` varchar(45) NOT NULL,
  `Action` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `newValue` varchar(45) DEFAULT NULL,
  `oldValue` varchar(45) DEFAULT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tblmemaudId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblcandidate`
--

DROP TABLE IF EXISTS `tblcandidate`;
CREATE TABLE IF NOT EXISTS `tblcandidate` (
  `strCandId` varchar(45) NOT NULL,
  `strCandMemId` varchar(45) NOT NULL,
  `strCandPosId` varchar(45) NOT NULL,
  `intCandParId` int(11) DEFAULT NULL,
  `strCandEducBack` text NOT NULL,
  `strCandInfo` text NOT NULL,
  `txtCandPic` tinytext NOT NULL,
  `blCandDelete` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`strCandMemId`,`strCandPosId`,`blCandDelete`),
  UNIQUE KEY `strCandId_UNIQUE` (`strCandId`),
  KEY `fkCandMem_idx` (`strCandMemId`),
  KEY `fkCandPos_idx` (`strCandPosId`),
  KEY `fkCandParty_idx` (`intCandParId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbldynamicfield`
--

DROP TABLE IF EXISTS `tbldynamicfield`;
CREATE TABLE IF NOT EXISTS `tbldynamicfield` (
  `intDynFieldId` int(11) NOT NULL AUTO_INCREMENT,
  `strDynFieldName` varchar(100) NOT NULL,
  `blDynStatus` tinyint(1) NOT NULL,
  PRIMARY KEY (`intDynFieldId`),
  UNIQUE KEY `strDynFieldName_UNIQUE` (`strDynFieldName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldynamicfield`
--

INSERT INTO `tbldynamicfield` (`intDynFieldId`, `strDynFieldName`, `blDynStatus`) VALUES
(1, 'area', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblelection`
--

DROP TABLE IF EXISTS `tblelection`;
CREATE TABLE IF NOT EXISTS `tblelection` (
  `intElectionId` int(11) NOT NULL AUTO_INCREMENT,
  `strElecTitle` varchar(80) NOT NULL,
  `strElecDesc` varchar(100) DEFAULT NULL,
  `blMemFee` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`intElectionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblmember`
--

DROP TABLE IF EXISTS `tblmember`;
CREATE TABLE IF NOT EXISTS `tblmember` (
  `strMemberId` varchar(45) NOT NULL,
  `strMemFname` varchar(45) NOT NULL,
  `strMemMname` varchar(45) DEFAULT NULL,
  `strMemLname` varchar(45) NOT NULL,
  `strMemEmail` varchar(45) NOT NULL,
  `intMemSecQuesId` int(11) DEFAULT '1',
  `strMemSecQuesAnswer` varchar(80) DEFAULT 'ivote',
  `strMemPasscode` char(6) DEFAULT NULL,
  `blMemCodeSendStat` tinyint(1) NOT NULL DEFAULT '0',
  `blMemDelete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`strMemberId`),
  UNIQUE KEY `strMemEmail_UNIQUE` (`strMemEmail`),
  UNIQUE KEY `strMemPasscode_UNIQUE` (`strMemPasscode`),
  KEY `fkMemSec_idx` (`intMemSecQuesId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblmemberdetail`
--

DROP TABLE IF EXISTS `tblmemberdetail`;
CREATE TABLE IF NOT EXISTS `tblmemberdetail` (
  `intMemDeId` int(11) NOT NULL AUTO_INCREMENT,
  `strMemDeMemId` varchar(45) NOT NULL,
  `strMemDeFieldName` varchar(45) NOT NULL,
  `strMemDeFieldData` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`intMemDeId`),
  UNIQUE KEY `intMemDeId_UNIQUE` (`intMemDeId`),
  KEY `fkMemDeMem_idx` (`strMemDeMemId`),
  KEY `fkMemDeFieldName_idx1` (`strMemDeFieldName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblmemberform`
--

DROP TABLE IF EXISTS `tblmemberform`;
CREATE TABLE IF NOT EXISTS `tblmemberform` (
  `intMemForm` int(11) NOT NULL AUTO_INCREMENT,
  `strMemFormTitle` varchar(100) NOT NULL,
  `strMemForm` text NOT NULL,
  PRIMARY KEY (`intMemForm`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblmemberform`
--

INSERT INTO `tblmemberform` (`intMemForm`, `strMemFormTitle`, `strMemForm`) VALUES
(15, 'Organization Member Form', '{\"title\":\"Organization Member Form\",\"fields\":[{\"title\":\"Member ID\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":1},{\"title\":\"First Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":2},{\"title\":\"Middle Name\",\"type\":\"element-single-line-text-default\",\"required\":false,\"position\":3},{\"title\":\"Last Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":4},{\"title\":\"Email\",\"type\":\"element-email\",\"required\":true,\"position\":5}]}'),
(16, 'Organization Member Form', '{\"title\":\"Organization Member Form\",\"fields\":[{\"title\":\"Member ID\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":1},{\"title\":\"First Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":2},{\"title\":\"Middle Name\",\"type\":\"element-single-line-text-default\",\"required\":false,\"position\":3},{\"title\":\"Last Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":4},{\"title\":\"Email\",\"type\":\"element-email\",\"required\":true,\"position\":5},{\"title\":\"Area\",\"type\":\"element-multiple-choice\",\"required\":false,\"position\":6,\"choices\":[{\"title\":\"NCR / Metro Manila\",\"value\":\"NCR / Metro Manila\",\"checked\":true},{\"title\":\"Luzon\",\"value\":\"Luzon\",\"checked\":false},{\"title\":\"Visayas\",\"value\":\"Visayas\",\"checked\":false},{\"title\":\"MIndanao\",\"value\":\"MIndanao\",\"checked\":false}]}]}'),
(22, 'Organization Member Form', '{\"title\":\"Organization Member Form\",\"fields\":[{\"title\":\"Member ID\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":1},{\"title\":\"First Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":2},{\"title\":\"Middle Name\",\"type\":\"element-single-line-text-default\",\"required\":false,\"position\":3},{\"title\":\"Last Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":4},{\"title\":\"Email\",\"type\":\"element-email\",\"required\":true,\"position\":5},{\"title\":\"Area\",\"type\":\"element-multiple-choice\",\"required\":false,\"position\":6,\"choices\":[{\"title\":\"NCR / Metro Manila\",\"value\":\"NCR / Metro Manila\",\"checked\":true},{\"title\":\"Luzon\",\"value\":\"Luzon\",\"checked\":false},{\"title\":\"Visayas\",\"value\":\"Visayas\",\"checked\":false},{\"title\":\"Mindanao\",\"value\":\"Mindanao\",\"checked\":false}]}]}'),
(32, 'Organization Member Form', '{\"title\":\"Organization Member Form\",\"fields\":[{\"title\":\"Member ID\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":1},{\"title\":\"First Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":2},{\"title\":\"Middle Name\",\"type\":\"element-single-line-text-default\",\"required\":false,\"position\":3},{\"title\":\"Last Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":4},{\"title\":\"Email\",\"type\":\"element-email\",\"required\":true,\"position\":5},{\"title\":\"Area\",\"type\":\"element-multiple-choice\",\"required\":false,\"position\":6,\"choices\":[{\"title\":\"NCR / Metro Manila\",\"value\":\"NCR / Metro Manila\",\"checked\":true},{\"title\":\"South Luzon\",\"value\":\"South Luzon\",\"checked\":false},{\"title\":\"North Luzon\",\"value\":\"North Luzon\",\"checked\":false},{\"title\":\"Visayas\",\"value\":\"Visayas\",\"checked\":false},{\"title\":\"Mindanao\",\"value\":\"Mindanao\",\"checked\":false},{\"title\":\"Others\",\"value\":\"Others\",\"checked\":false}]}]}'),
(42, 'Organization Member Form', '{\"title\":\"Organization Member Form\",\"fields\":[{\"title\":\"Member ID\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":1},{\"title\":\"First Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":2},{\"title\":\"Middle Name\",\"type\":\"element-single-line-text-default\",\"required\":false,\"position\":3},{\"title\":\"Last Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":4},{\"title\":\"Email\",\"type\":\"element-email\",\"required\":true,\"position\":5},{\"title\":\"Area\",\"type\":\"element-checkboxes\",\"required\":false,\"position\":6,\"choices\":[{\"title\":\"NCR / Metro Manila\",\"value\":\"NCR / Metro Manila\",\"checked\":false},{\"title\":\"South Luzon\",\"value\":\"South Luzon\",\"checked\":false},{\"title\":\"North Luzon\",\"value\":\"North Luzon\",\"checked\":false},{\"title\":\"Visayas\",\"value\":\"Visayas\",\"checked\":false},{\"title\":\"Mindanao\",\"value\":\"Mindanao\",\"checked\":false},{\"title\":\"Others\",\"value\":\"Others\",\"checked\":false}]}]}'),
(52, 'Organization Member Form', '{\"title\":\"Organization Member Form\",\"fields\":[{\"title\":\"Member ID\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":1},{\"title\":\"First Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":2},{\"title\":\"Middle Name\",\"type\":\"element-single-line-text-default\",\"required\":false,\"position\":3},{\"title\":\"Last Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":4},{\"title\":\"Email\",\"type\":\"element-email\",\"required\":true,\"position\":5},{\"title\":\"Area\",\"type\":\"element-multiple-choice\",\"required\":false,\"position\":6,\"choices\":[{\"title\":\"PUP\",\"value\":\"PUP\",\"checked\":true}]}]}'),
(53, 'Organization Member Form', '{\"title\":\"Organization Member Form\",\"fields\":[{\"title\":\"Member ID\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":1},{\"title\":\"First Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":2},{\"title\":\"Middle Name\",\"type\":\"element-single-line-text-default\",\"required\":false,\"position\":3},{\"title\":\"Last Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":4},{\"title\":\"Email\",\"type\":\"element-email\",\"required\":false,\"position\":5},{\"title\":\"Area\",\"type\":\"element-multiple-choice\",\"required\":false,\"position\":6,\"choices\":[{\"title\":\"PUP\",\"value\":\"PUP\",\"checked\":true}]}]}'),
(54, 'Organization Member Form', '{\"title\":\"Organization Member Form\",\"fields\":[{\"title\":\"Member ID\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":1},{\"title\":\"First Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":2},{\"title\":\"Middle Name\",\"type\":\"element-single-line-text-default\",\"required\":false,\"position\":3},{\"title\":\"Last Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":4},{\"title\":\"Area\",\"type\":\"element-multiple-choice\",\"required\":false,\"position\":5,\"choices\":[{\"title\":\"PUP\",\"value\":\"PUP\",\"checked\":true}]},{\"title\":\"Email\",\"type\":\"element-email\",\"required\":false,\"position\":6}]}'),
(55, 'Organization Member Form', '{\"title\":\"Organization Member Form\",\"fields\":[{\"title\":\"Member ID\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":1},{\"title\":\"Last Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":2},{\"title\":\"First Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":3},{\"title\":\"Middle Name\",\"type\":\"element-single-line-text-default\",\"required\":false,\"position\":4},{\"title\":\"Area\",\"type\":\"element-multiple-choice\",\"required\":false,\"position\":5,\"choices\":[{\"title\":\"PUP\",\"value\":\"PUP\",\"checked\":true}]},{\"title\":\"Email\",\"type\":\"element-email\",\"required\":false,\"position\":6}]}'),
(56, 'Organization Member Form', '{\"title\":\"Organization Member Form\",\"fields\":[{\"title\":\"Member ID\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":1},{\"title\":\"Last Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":2},{\"title\":\"First Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":3},{\"title\":\"Middle Name\",\"type\":\"element-single-line-text-default\",\"required\":false,\"position\":4},{\"title\":\"Area\",\"type\":\"element-multiple-choice\",\"required\":false,\"position\":5,\"choices\":[{\"title\":\"PUP\",\"value\":\"PUP\",\"checked\":true}]}]}'),
(57, 'Organization Member Form', '{\"title\":\"Organization Member Form\",\"fields\":[{\"title\":\"Member ID\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":1},{\"title\":\"Last Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":2},{\"title\":\"First Name\",\"type\":\"element-single-line-text-default\",\"required\":true,\"position\":3},{\"title\":\"Middle Name\",\"type\":\"element-single-line-text-default\",\"required\":false,\"position\":4},{\"title\":\"Area\",\"type\":\"element-multiple-choice\",\"required\":false,\"position\":5,\"choices\":[{\"title\":\"PUP\",\"value\":\"PUP\",\"checked\":true}]},{\"title\":\"Email\",\"type\":\"element-email\",\"required\":true,\"position\":6}]}');

-- --------------------------------------------------------

--
-- Table structure for table `tblparty`
--

DROP TABLE IF EXISTS `tblparty`;
CREATE TABLE IF NOT EXISTS `tblparty` (
  `intPartyId` int(11) NOT NULL AUTO_INCREMENT,
  `strPartyName` varchar(45) NOT NULL,
  `strPartyLeader` varchar(45) DEFAULT NULL,
  `txtPartyPic` text,
  `strPartyColor` varchar(45) NOT NULL DEFAULT '#90a4c9',
  `blPartyDelete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`intPartyId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblparty`
--

INSERT INTO `tblparty` (`intPartyId`, `strPartyName`, `strPartyLeader`, `txtPartyPic`, `strPartyColor`, `blPartyDelete`) VALUES
(1, 'Independent', NULL, NULL, '#90a4c9', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblposition`
--

DROP TABLE IF EXISTS `tblposition`;
CREATE TABLE IF NOT EXISTS `tblposition` (
  `strPositionId` varchar(45) NOT NULL,
  `strPosName` varchar(45) NOT NULL,
  `strPosColor` varchar(45) NOT NULL DEFAULT '#ffffff',
  `intPosVoteLimit` int(11) NOT NULL,
  `blPosDelete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`strPositionId`),
  UNIQUE KEY `strPosName_UNIQUE` (`strPosName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblpositiondetail`
--

DROP TABLE IF EXISTS `tblpositiondetail`;
CREATE TABLE IF NOT EXISTS `tblpositiondetail` (
  `intPosDeId` int(11) NOT NULL AUTO_INCREMENT,
  `strPosDePosId` varchar(45) NOT NULL,
  `strPosDeFieldName` varchar(80) NOT NULL,
  `strPosDeFieldData` varchar(80) NOT NULL,
  PRIMARY KEY (`intPosDeId`),
  KEY `fkPosDePos_idx` (`strPosDePosId`),
  KEY `fkPosDeFieldName_idx` (`strPosDeFieldName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblquestion`
--

DROP TABLE IF EXISTS `tblquestion`;
CREATE TABLE IF NOT EXISTS `tblquestion` (
  `intQuestId` int(11) NOT NULL AUTO_INCREMENT,
  `txtQuestDesc` tinytext,
  PRIMARY KEY (`intQuestId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblschedule`
--

DROP TABLE IF EXISTS `tblschedule`;
CREATE TABLE IF NOT EXISTS `tblschedule` (
  `intSchedId` int(11) NOT NULL AUTO_INCREMENT,
  `datSchedStart` date NOT NULL,
  `datSchedEnd` date NOT NULL,
  PRIMARY KEY (`intSchedId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblsecquestion`
--

DROP TABLE IF EXISTS `tblsecquestion`;
CREATE TABLE IF NOT EXISTS `tblsecquestion` (
  `intSecQuesId` int(11) NOT NULL AUTO_INCREMENT,
  `strSecQuestion` varchar(100) NOT NULL,
  PRIMARY KEY (`intSecQuesId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblsecurityquestion`
--

DROP TABLE IF EXISTS `tblsecurityquestion`;
CREATE TABLE IF NOT EXISTS `tblsecurityquestion` (
  `intSecQuesId` int(11) NOT NULL AUTO_INCREMENT,
  `strSecQuestion` varchar(100) NOT NULL,
  `blSecQuesDelete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`intSecQuesId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsecurityquestion`
--

INSERT INTO `tblsecurityquestion` (`intSecQuesId`, `strSecQuestion`, `blSecQuesDelete`) VALUES
(1, 'What is your favorite movie?', 0),
(5, 'What is your mother\'s maiden name?', 0),
(6, 'What is the first name of the person you first kissed?', 0),
(8, 'What was your childhood nickname?', 0),
(9, 'What is the name of your favorite childhood friend?', 0),
(10, 'Who is your childhood sports hero?', 0),
(11, 'In what town was your first job?', 0),
(12, 'Who is your favorite cartoon character?', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblsetting`
--

DROP TABLE IF EXISTS `tblsetting`;
CREATE TABLE IF NOT EXISTS `tblsetting` (
  `intSettingId` int(11) NOT NULL AUTO_INCREMENT,
  `strSetElecName` varchar(100) NOT NULL,
  `strSetElecDesc` text NOT NULL,
  `datSetStart` datetime NOT NULL,
  `datSetEnd` datetime NOT NULL,
  `blSetSurvey` tinyint(1) NOT NULL DEFAULT '0',
  `blSetParty` tinyint(1) NOT NULL DEFAULT '0',
  `txtSetLogo` text,
  `strHeader` varchar(200) NOT NULL,
  `strSetAddress` text,
  `blSetPublish` int(11) NOT NULL,
  `txtSiteKey` text,
  `txtSecret` text,
  PRIMARY KEY (`intSettingId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsetting`
--

INSERT INTO `tblsetting` (`intSettingId`, `strSetElecName`, `strSetElecDesc`, `datSetStart`, `datSetEnd`, `blSetSurvey`, `blSetParty`, `txtSetLogo`, `strHeader`, `strSetAddress`, `blSetPublish`, `txtSiteKey`, `txtSecret`) VALUES
(1, 'Sample Election', '', '2017-12-25 15:00:00', '2017-12-25 18:00:00', 0, 0, 'ivote.jpg', 'Institute of Bachelors in Information Technology', 'Anonas St, Sta. Mesa Manila', 0, '6Ld-uigTAAAAAC2tyTlIhh2Ca8jW28AGoEAqw85o', '6Ld-uigTAAAAAGFTeVRfNHIHZtGFf-lOdQ-xt6wz');

-- --------------------------------------------------------

--
-- Table structure for table `tblsurvey`
--

DROP TABLE IF EXISTS `tblsurvey`;
CREATE TABLE IF NOT EXISTS `tblsurvey` (
  `strSurveyId` varchar(45) NOT NULL,
  `strSurveyTitle` varchar(45) NOT NULL,
  `strSurveyDesc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`strSurveyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblsurveydetail`
--

DROP TABLE IF EXISTS `tblsurveydetail`;
CREATE TABLE IF NOT EXISTS `tblsurveydetail` (
  `intSDId` int(11) NOT NULL AUTO_INCREMENT,
  `intSDSHId` int(11) NOT NULL,
  `intSDSQId` int(11) NOT NULL,
  `strSDAnswer` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`intSDId`),
  KEY `fkSQSH_idx` (`intSDSHId`),
  KEY `fkSDSQ_idx` (`intSDSQId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblsurveyform`
--

DROP TABLE IF EXISTS `tblsurveyform`;
CREATE TABLE IF NOT EXISTS `tblsurveyform` (
  `intSurveyFormId` int(11) NOT NULL AUTO_INCREMENT,
  `strSurveyFormTitle` varchar(100) NOT NULL,
  `strSurveyFormDesc` varchar(100) DEFAULT NULL,
  `strSurveyForm` text NOT NULL,
  PRIMARY KEY (`intSurveyFormId`),
  KEY `fkSFSurvey_idx` (`strSurveyFormTitle`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsurveyform`
--

INSERT INTO `tblsurveyform` (`intSurveyFormId`, `strSurveyFormTitle`, `strSurveyFormDesc`, `strSurveyForm`) VALUES
(2, 'NDAP Survey', '', '{\"title\":\"NDAP Survey\",\"description\":\"\",\"fields\":[{\"title\":\"Brief description about your experience in using iVote++\",\"type\":\"element-paragraph-text\",\"required\":false,\"position\":1}]}'),
(12, 'NDAP Survey', '', '{\"title\":\"NDAP Survey\",\"description\":\"\",\"fields\":[{\"title\":\"Please Rate iVote++\",\"type\":\"element-multiple-choice\",\"required\":false,\"position\":1,\"choices\":[{\"title\":\"Excellent\",\"value\":\"Excellent\",\"checked\":true},{\"title\":\"Very Good\",\"value\":\"Very Good\",\"checked\":false},{\"title\":\"Fair\",\"value\":\"Fair\",\"checked\":false},{\"title\":\"Poor\",\"value\":\"Poor\",\"checked\":false},{\"title\":\"Unsatisfactory\",\"value\":\"Unsatisfactory\",\"checked\":false}]}]}'),
(42, 'NDAP Survey', '', '{\"title\":\"NDAP Survey\",\"description\":\"\",\"fields\":[{\"title\":\"Brief description about your experience in using iVote++\",\"type\":\"element-paragraph-text\",\"required\":false,\"position\":1}]}'),
(52, 'NDAP Survey', '', '{\"title\":\"NDAP Survey\",\"description\":\"\",\"fields\":[{\"title\":\"Brief description about your experience in using iVote++\",\"type\":\"element-paragraph-text\",\"required\":false,\"position\":1},{\"title\":\"Untitled\",\"type\":\"element-paragraph-text\",\"required\":false,\"position\":2}]}'),
(62, 'NDAP Survey', '', '{\"title\":\"NDAP Survey\",\"description\":\"\",\"fields\":[{\"title\":\"Brief description about your experience in using iVote++\",\"type\":\"element-paragraph-text\",\"required\":false,\"position\":1}]}'),
(72, 'NDAP Survey', '', '{\"title\":\"NDAP Survey\",\"description\":\"\",\"fields\":[{\"title\":\"Brief description about your experience in using iVote++\",\"type\":\"element-paragraph-text\",\"required\":false,\"position\":1},{\"title\":\"Untitled\",\"type\":\"element-checkboxes\",\"required\":false,\"position\":2,\"choices\":[{\"title\":\"First Choice\",\"value\":\"First Choice\",\"checked\":false},{\"title\":\"Second Choice\",\"value\":\"Second Choice\",\"checked\":false},{\"title\":\"Third Choice\",\"value\":\"Third Choice\",\"checked\":false}]}]}'),
(82, 'NDAP Survey', '', '{\"title\":\"NDAP Survey\",\"description\":\"\",\"fields\":[{\"title\":\"Please Rate iVote++\",\"type\":\"element-checkboxes\",\"required\":false,\"position\":1,\"choices\":[{\"title\":\"Excellent\",\"value\":\"Excellent\",\"checked\":false},{\"title\":\"Very Good\",\"value\":\"Very Good\",\"checked\":false},{\"title\":\"Good\",\"value\":\"Good\",\"checked\":false},{\"title\":\"Fair\",\"value\":\"Fair\",\"checked\":false},{\"title\":\"Unsatisfactory\",\"value\":\"Unsatisfactory\",\"checked\":false}]}]}'),
(92, 'NDAP Survey', '', '{\"title\":\"NDAP Survey\",\"description\":\"\",\"fields\":[{\"title\":\"Rate your experience in using iVote++\",\"type\":\"element-multiple-choice\",\"required\":false,\"position\":1,\"choices\":[{\"title\":\"Excellent\",\"value\":\"Excellent\",\"checked\":true},{\"title\":\"Very Good\",\"value\":\"Very Good\",\"checked\":false},{\"title\":\"Good\",\"value\":\"Good\",\"checked\":false},{\"title\":\"Satisfactory\",\"value\":\"Satisfactory\",\"checked\":false},{\"title\":\"Unsatisfactory\",\"value\":\"Unsatisfactory\",\"checked\":false}]}]}'),
(102, 'NDAP Survey', '', '{\"title\":\"NDAP Survey\",\"description\":\"\",\"fields\":[{\"title\":\"llalala\",\"type\":\"element-multiple-choice\",\"required\":false,\"position\":1,\"choices\":[{\"title\":\"First Choice\",\"value\":\"First Choice\",\"checked\":true},{\"title\":\"Second Choice\",\"value\":\"Second Choice\",\"checked\":false},{\"title\":\"Third Choice\",\"value\":\"Third Choice\",\"checked\":false}]},{\"title\":\"what the feck?\",\"type\":\"element-paragraph-text\",\"required\":false,\"position\":2}]}'),
(112, 'NDAP Amendments to its BY-LAWS', '', '{\"title\":\"NDAP Amendments to its BY-LAWS \",\"description\":\"\",\"fields\":[{\"title\":\"Dear NDAP Member,\",\"type\":\"element-section-break\",\"required\":false,\"position\":1,\"description\":\"Our organization is in the process of applying for a new SEC registration and preparing for the application as AIPO to be submitted to PRC. Both applications require ratification of amendments to the NDAP by laws and constitution. At the Board Meeting held last February 24 at Marriott Hotel, changes in the NDAP by-laws to make it responsive to RA 10862 (ND Law of 2016) and the CPD Law were approved.\\n\\nWe are requesting you to look at the changes and ratify them by putting “Agree” on the textfield. If not, please state your reason why you don’t approve of the change.\\n\"},{\"title\":\"1.ARTICLE VI - MEETING OF MEMBERS: Section 1\",\"type\":\"element-section-break\",\"required\":false,\"position\":2,\"description\":\"The Association shall hold a general meeting once a year, during the fourth Thursday of February at its principal office, or at any place within the Philippines which the Board may designate; Provided, That proper notice is sent to all  members indicating the date, time and place of the meeting. The date of the Association’s general meeting must be indicated to comply with the Corporation Law of the Philippines.\"},{\"title\":\"1. Answer\",\"type\":\"element-single-line-text\",\"required\":true,\"position\":3},{\"title\":\"2.ARTICLE VII - BOARD OF DIRECTORS AND OFFICERS OF THE ASSOCIATION: \",\"type\":\"element-section-break\",\"required\":false,\"position\":4,\"description\":\"Section 1\\tInclusion of an Ethics Committee in the Standing Committees\"},{\"title\":\"2. Answer\",\"type\":\"element-single-line-text\",\"required\":true,\"position\":5},{\"title\":\"3.ARTICLE VII - BOARD OF DIRECTORS AND OFFICERS OF THE ASSOCIATION:\",\"type\":\"element-section-break\",\"required\":false,\"position\":6,\"description\":\" Section 14: The Sections that represent the specific fields or areas of practice in Nutrition and Dietetics were defined as follows:<br><br>a.\\tHospital Dietetics Section covers clinical dietitians, therapeutic dietitians, administrative dietitians, food service managers and/or nutrition support unit heads in hospital settings.<br><br>\\nb.\\tCommunity and Public Health Nutrition Section covers nutrition-dietetics professionals involved in food and nutrition policy formulation, community assessment, planning, implementation, monitoring, evaluation of nutrition programs and advocacy; including consultants and technical advisers on nutrition.<br><br>c.\\tFood service Section covers nutrition-dietetics consultants and managers in food service establishments engaged in institutional food production, recipe development and standardization, implementation of food safety and sanitation practices, delivery and evaluation of services.<br><br>d.\\tEducation and Research Section covers the Academe (teachers/instructors of nutrition, dietetics and food service courses) and Food and Nutrition Research which include professionals in basic and applied food and nutrition research.<br><br>e.\\tBusiness and Industry Section covers professionals working in the business and industry doing work requiring nutrition and dietetics background that includes private practitioners and consultants in nutrition; professionals involved in developing and producing new food products following the principles of food and nutrition; and professionals and consultants involved in nutrition aspects in wellness and sports program.\"},{\"title\":\"3. Answer\",\"type\":\"element-single-line-text\",\"required\":true,\"position\":7},{\"title\":\"4.ARTICLE IX - NOMINATIONS AND ELECTIONS: We \",\"type\":\"element-section-break\",\"required\":false,\"position\":8,\"description\":\" We reverted back to the 15 candidates who obtained the highest number of votes instead of sectoral winners.\\nSection 14: Thirty (30) active members from the five different sectors (hospital-dietetics, public health, foodservice, research & education, and business & industry as candidates for the Board of Directors. The first fifteen (15) who get the highest number of votes shall be considered elected. In case of tie on the 15th place, the choice shall be decided by lot\\n\"},{\"title\":\"4. Answer\",\"type\":\"element-single-line-text\",\"required\":true,\"position\":9},{\"title\":\"Thank you!\",\"type\":\"element-section-break\",\"required\":false,\"position\":10,\"description\":\"Legislation Committee<br>Chair: Prof. Dr. Adela Jamorabo-Ruiz, RND<br>Members:  Dr. Zenaida V. Narciso, RND<br>Ms. Josephine P. Jamon, RND, MM, MBA\\n\"},{\"title\":\"Please rate your experience in using iVote++\",\"type\":\"element-multiple-choice\",\"required\":true,\"position\":11,\"choices\":[{\"title\":\"Excellent\",\"value\":\"Excellent\",\"checked\":true},{\"title\":\"Very good\",\"value\":\"Very good\",\"checked\":false},{\"title\":\"Good\",\"value\":\"Good\",\"checked\":false},{\"title\":\"Fair\",\"value\":\"Fair\",\"checked\":false},{\"title\":\"Unsatisfactory\",\"value\":\"Unsatisfactory\",\"checked\":false}]}]}'),
(122, 'PUP-MPC ELECTIONS', '', '{\"title\":\"PUP-MPC ELECTIONS\",\"description\":\"\",\"fields\":[{\"title\":\"Please rate your experience in using iVote++\",\"type\":\"element-multiple-choice\",\"required\":true,\"position\":1,\"choices\":[{\"title\":\"Excellent\",\"value\":\"Excellent\",\"checked\":true},{\"title\":\"Very good\",\"value\":\"Very good\",\"checked\":false},{\"title\":\"Good\",\"value\":\"Good\",\"checked\":false},{\"title\":\"Fair\",\"value\":\"Fair\",\"checked\":false},{\"title\":\"Unsatisfactory\",\"value\":\"Unsatisfactory\",\"checked\":false}]}]}'),
(123, 'PUP Survey title', '', '{\"title\":\"PUP Survey title\",\"description\":\"\",\"fields\":[{\"title\":\"Please rate your experience using iVOTE++\",\"type\":\"element-multiple-choice\",\"required\":true,\"position\":1,\"choices\":[{\"title\":\"Excellent\",\"value\":\"Excellent\",\"checked\":true},{\"title\":\"Very Good\",\"value\":\"Very Good\",\"checked\":false},{\"title\":\"Good\",\"value\":\"Good\",\"checked\":false},{\"title\":\"Fair\",\"value\":\"Fair\",\"checked\":false},{\"title\":\"Unsatisfactory\",\"value\":\"Unsatisfactory\",\"checked\":false}]}]}'),
(124, 'PUP-MPC Election', '', '{\"title\":\"PUP-MPC Election\",\"description\":\"\",\"fields\":[{\"title\":\"Please rate your experience using iVOTE++\",\"type\":\"element-multiple-choice\",\"required\":true,\"position\":1,\"choices\":[{\"title\":\"Excellent\",\"value\":\"Excellent\",\"checked\":true},{\"title\":\"Very Good\",\"value\":\"Very Good\",\"checked\":false},{\"title\":\"Good\",\"value\":\"Good\",\"checked\":false},{\"title\":\"Fair\",\"value\":\"Fair\",\"checked\":false},{\"title\":\"Unsatisfactory\",\"value\":\"Unsatisfactory\",\"checked\":false}]}]}');

-- --------------------------------------------------------

--
-- Table structure for table `tblsurveyheader`
--

DROP TABLE IF EXISTS `tblsurveyheader`;
CREATE TABLE IF NOT EXISTS `tblsurveyheader` (
  `intSHId` int(11) NOT NULL AUTO_INCREMENT,
  `strSHMemCode` varchar(45) NOT NULL,
  `datSHAnswered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`intSHId`,`strSHMemCode`),
  KEY `fkSHMemCode_idx` (`strSHMemCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblsurveyquestion`
--

DROP TABLE IF EXISTS `tblsurveyquestion`;
CREATE TABLE IF NOT EXISTS `tblsurveyquestion` (
  `intSQId` int(11) NOT NULL AUTO_INCREMENT,
  `strSQQuestion` varchar(200) NOT NULL,
  `strSQQuesType` varchar(100) DEFAULT NULL,
  `blSQStatus` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`intSQId`),
  UNIQUE KEY `strSQQuestion_UNIQUE` (`strSQQuestion`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsurveyquestion`
--

INSERT INTO `tblsurveyquestion` (`intSQId`, `strSQQuestion`, `strSQQuesType`, `blSQStatus`) VALUES
(32, 'rate_your_experience_in_using_ivote', 'element-multiple-choice', 0),
(42, 'llalala', 'element-multiple-choice', 0),
(52, 'what_the_feck?', 'element-paragraph-text', 0),
(62, 'dear_ndap_member', 'element-section-break', 0),
(72, '1_article_vi__meeting_of_members:_section_1', 'element-section-break', 0),
(82, '1__answer', 'element-single-line-text', 0),
(92, '2_article_vii__board_of_directors_and_officers_of_the_association:_', 'element-section-break', 0),
(102, '2__answer', 'element-single-line-text', 0),
(112, '3_article_vii__board_of_directors_and_officers_of_the_association:', 'element-section-break', 0),
(122, '3__answer', 'element-single-line-text', 0),
(132, '4_article_ix__nominations_and_elections:_we_', 'element-section-break', 0),
(142, '4__answer', 'element-single-line-text', 0),
(152, 'thank_you', 'element-section-break', 0),
(162, 'please_rate_your_experience_in_using_ivote', 'element-multiple-choice', 0),
(172, 'please_rate_your_experience_using_ivote', 'element-multiple-choice', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbluielement`
--

DROP TABLE IF EXISTS `tbluielement`;
CREATE TABLE IF NOT EXISTS `tbluielement` (
  `intUIId` int(11) NOT NULL AUTO_INCREMENT,
  `strUISkin` text NOT NULL,
  PRIMARY KEY (`intUIId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluielement`
--

INSERT INTO `tbluielement` (`intUIId`, `strUISkin`) VALUES
(2, 'skin-yellow-light'),
(12, 'skin-yellow'),
(22, 'skin-black-light'),
(32, 'skin-red'),
(33, 'skin-yellow');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

DROP TABLE IF EXISTS `tbluser`;
CREATE TABLE IF NOT EXISTS `tbluser` (
  `intUserId` int(11) NOT NULL AUTO_INCREMENT,
  `strUsername` varchar(45) NOT NULL,
  `strPassword` varchar(45) NOT NULL,
  `strUserEmail` varchar(45) DEFAULT NULL,
  `strUserFname` varchar(45) DEFAULT NULL,
  `strUserLname` varchar(45) DEFAULT NULL,
  `strAccountType` varchar(45) NOT NULL,
  `blDelete` tinyint(1) NOT NULL DEFAULT '0',
  `txtPicPath` tinytext,
  PRIMARY KEY (`intUserId`),
  UNIQUE KEY `strUsername_UNIQUE` (`strUsername`),
  UNIQUE KEY `strUserEmail_UNIQUE` (`strUserEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblvotedetail`
--

DROP TABLE IF EXISTS `tblvotedetail`;
CREATE TABLE IF NOT EXISTS `tblvotedetail` (
  `intVDId` int(11) NOT NULL AUTO_INCREMENT,
  `strVDVHCode` varchar(45) NOT NULL,
  `strVDCandId` varchar(45) NOT NULL,
  PRIMARY KEY (`strVDVHCode`,`strVDCandId`),
  UNIQUE KEY `intVDId_UNIQUE` (`intVDId`),
  KEY `fkVDCandId_idx` (`strVDCandId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblvoteheader`
--

DROP TABLE IF EXISTS `tblvoteheader`;
CREATE TABLE IF NOT EXISTS `tblvoteheader` (
  `intVHId` int(11) NOT NULL AUTO_INCREMENT,
  `strVHCode` varchar(45) NOT NULL,
  `strVHMemId` varchar(45) NOT NULL,
  `blvotestraight` int(11) NOT NULL,
  `strVHParty` text NOT NULL,
  `blcandidate` int(11) NOT NULL,
  `blundervote` int(11) NOT NULL,
  `datVHVoted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `intDevice` tinyint(1) DEFAULT NULL,
  `strBrowser` varchar(45) DEFAULT NULL,
  `strOpSys` varchar(45) DEFAULT NULL,
  `strDevModel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`strVHMemId`,`strVHCode`),
  UNIQUE KEY `intVHId_UNIQUE` (`intVHId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blAdmin` tinyint(4) NOT NULL DEFAULT '0',
  `txtPath` text COLLATE utf8_unicode_ci NOT NULL,
  `blDelete` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `blAdmin`, `txtPath`, `blDelete`, `created_at`, `updated_at`) VALUES
(7, 'Carlo Jumagdao', 'carlojumagdao@gmail.com', '$2y$10$s4kZ2Sb0ob1MgV.NZds.3uZWEA4LUvcHrQa7tqSZgkp0DD5p.zp6y', 'A4HSq0jTXiOIN9mhUE5KtTiCvy4271gnEpwDbdP9bQjPLvR4tV9ZqmKCj0X2', 0, '20170224124058-940491.JPG', 0, '2017-02-22 15:43:29', '2017-03-04 01:23:21'),
(10, 'Melody Legaspi', 'melodylegaspi@gmail.com', '$2y$10$EssJSmRdsQjl6ldI6hulHe3m1hGxpgveUvQ9msMc6anTZ.zU4TipO', NULL, 0, '20170307041815-493306.jpg', 0, '2017-02-23 17:22:42', '2017-03-07 16:18:15'),
(11, 'Arvin Gresola', 'arvingresola@gmail.com', '$2y$10$P8dF0EVDAUGcYGIriqrkaupnWdSp9u4oOE6cZDU8TKn2xKfyPOsYq', 'cnf8yrdmuA93X9XoFBaV2143JDvOEScZunkEP0pFWeJ1sme5ErwgKhqNgSgX', 0, '20170224013051-865552.jpg', 0, '2017-02-23 17:30:59', '2017-03-07 11:03:12'),
(12, 'Wendell Clarete', 'wendellclarete@gmail.com', '$2y$10$UopsLZe41VYH5TuY8n6Sj.oOmWDJ7jbXigF//2TYKTFc0X8EhFchK', 'L9AZaiP09OQ0KXyGPe8nKWyT4S5mHm4VJdJE8DNJj7MrVGK5MHyNdldKNxof', 0, '20170225062843-854473.jpg', 0, '2017-02-25 18:28:44', '2017-03-05 21:55:55'),
(22, 'Mon Paulo Velasco', 'monpaulovelasco@gmail.com', '$2y$10$QNXpjIOEiHXcdLyHmlRic.63npe9alJiXrt8hvlq.up09v84YZqG2', 'KQtDL1DLMXV7lfOIGja6J3Qbw38txGxKAgLbM7uSx2HTAVTeN9CXc3GLb9fH', 0, '20170225062927-383421.jpg', 0, '2017-02-25 18:29:27', '2017-02-26 13:32:38'),
(32, 'Jobelle Ordiz', 'ordiz663@gmail.com', '$2y$10$H5A3yi611xf/8wYShso.GON01LD.nj3UCK9vv0qum5Tq1arj85are', 'dt2UkyZOUUdAKj4YCjoH2OZuFd0p0yPIEd81Fmu5j8XpAZSLdG8RDIn3kMJj', 0, '20170305094117-612619.png', 0, '2017-02-25 18:30:04', '2017-03-05 21:41:18'),
(42, 'Paul Cruz', 'paulandrei@ymail.com', '$2y$10$/N5dgg6V5u2AuVgks2LSYu.IacPKNkfJjLV9MQnnf1zK7WXl4JC3.', NULL, 0, '20170314123807-631374.jpg', 0, '2017-03-13 09:56:58', '2017-03-14 04:38:07'),
(43, 'Arvin Luis Gresola', 'arvin@yahoo.com', '$2y$10$BTumwvUUQIN.ulzyZl23Juy/G.qp3tZPsXzZImOTsO04k8/P.PCOG', NULL, 0, '20170314025230-745686.jpg', 0, '2017-03-14 06:52:30', '2017-03-14 06:52:30'),
(44, 'edgar', 'raizusdavid@gmail.com', '$2y$10$Gyc2ihybPWnzVwITT.XjAOQmiRbV4Plwxv/R61JeBDTAyi/99WHQq', 'uXYY4fAVngfQo13wvYPFSxT6ukq4DlBGlNtwprZksnkFTlPRaNX2cis0wi0b', 0, '20180313054629-655409.png', 0, '2018-03-13 09:46:29', '2018-11-08 07:06:19'),
(45, 'Brian Sebastian', 'brianmaysebastian@gmail.com', '$2y$10$oDdzhGRLn4z2UOuZ5PTeru3gplMQZ50KdB6vAOMHMXkq1BN3a9dnG', 'bqdEsg3ijRB0ka72o9njYNh7d8Qlq5cYiDMDdBv7INE5jz7RPmrewX23t61g', 0, '20250223121138-453070.jpg', 0, '2025-02-22 16:11:38', '2025-02-22 16:12:16');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblanswer`
--
ALTER TABLE `tblanswer`
  ADD CONSTRAINT `fkAnsMem` FOREIGN KEY (`strAnsMemId`) REFERENCES `tblmember` (`strMemberId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fkAnsQuest` FOREIGN KEY (`intQuestId`) REFERENCES `tblquestion` (`intQuestId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fkAnsSurvForm` FOREIGN KEY (`intAnsSurvFormId`) REFERENCES `tblsurveyform` (`intSurveyFormId`) ON UPDATE CASCADE;

--
-- Constraints for table `tblcandidate`
--
ALTER TABLE `tblcandidate`
  ADD CONSTRAINT `fkCandMem` FOREIGN KEY (`strCandMemId`) REFERENCES `tblmember` (`strMemberId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fkCandParty` FOREIGN KEY (`intCandParId`) REFERENCES `tblparty` (`intPartyId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fkCandPos` FOREIGN KEY (`strCandPosId`) REFERENCES `tblposition` (`strPositionId`) ON UPDATE CASCADE;

--
-- Constraints for table `tblmemberdetail`
--
ALTER TABLE `tblmemberdetail`
  ADD CONSTRAINT `fkMemDeFieldName` FOREIGN KEY (`strMemDeFieldName`) REFERENCES `tbldynamicfield` (`strDynFieldName`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fkMemDeMemId` FOREIGN KEY (`strMemDeMemId`) REFERENCES `tblmember` (`strMemberId`) ON UPDATE CASCADE;

--
-- Constraints for table `tblpositiondetail`
--
ALTER TABLE `tblpositiondetail`
  ADD CONSTRAINT `fkPosDePosId` FOREIGN KEY (`strPosDePosId`) REFERENCES `tblposition` (`strPositionId`) ON UPDATE CASCADE;

--
-- Constraints for table `tblsurveydetail`
--
ALTER TABLE `tblsurveydetail`
  ADD CONSTRAINT `fkSDSH` FOREIGN KEY (`intSDSHId`) REFERENCES `tblsurveyheader` (`intSHId`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fkSDSQ` FOREIGN KEY (`intSDSQId`) REFERENCES `tblsurveyquestion` (`intSQId`) ON UPDATE CASCADE;

--
-- Constraints for table `tblsurveyheader`
--
ALTER TABLE `tblsurveyheader`
  ADD CONSTRAINT `fkSHMemCode` FOREIGN KEY (`strSHMemCode`) REFERENCES `tblmember` (`strMemberId`) ON UPDATE CASCADE;

--
-- Constraints for table `tblvotedetail`
--
ALTER TABLE `tblvotedetail`
  ADD CONSTRAINT `fkVDCandId` FOREIGN KEY (`strVDCandId`) REFERENCES `tblcandidate` (`strCandId`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
