-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 16, 2023 at 05:08 AM
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
(1, 'Jestoni Castro');

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

--
-- Dumping data for table `tblmember`
--

INSERT INTO `tblmember` (`strMemberId`, `strMemFname`, `strMemMname`, `strMemLname`, `strMemEmail`, `intMemSecQuesId`, `strMemSecQuesAnswer`, `strMemPasscode`, `blMemCodeSendStat`, `blMemDelete`, `created_at`, `updated_at`, `deleted_at`) VALUES
('CODE001', 'BENJAMIN', 'A', 'ABAD', 'baabad@pup.edu.ph', 1, 'ivote', 'sN15gu', 0, 0, '2023-03-15 17:21:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE002', 'DOYLE', 'C', 'ABALOS', 'dcabalos@pup.edu.ph', 1, 'ivote', '5csG4b', 0, 0, '2023-03-15 17:23:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE003', 'JOSE', 'M', 'ABAT', 'jmabat@pup.edu.ph', 1, 'ivote', 'hiuGxa', 0, 0, '2023-03-15 17:24:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE004', 'MA. LOLITA', 'V', 'ABECIA', 'mlvabecia@pup.edu.ph', 1, 'ivote', '6Kts2v', 0, 0, '2023-03-15 17:26:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE005', 'MERLE', 'C', 'ABUELO', 'mcabuelo@pup.edu.ph', 1, 'ivote', 'vz5hfP', 0, 0, '2023-03-15 17:26:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE006', 'MINERVA LAIZA', 'C', 'ACOSTA', 'mlcacosta@pup.edu.ph', 1, 'ivote', 'aRoClL', 0, 0, '2023-03-15 17:28:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE007', 'REMEDIOS', 'G', 'ADO', 'rgado@pup.edu.ph', 1, 'ivote', 'HIOUvm', 0, 0, '2023-03-15 17:28:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE008', 'ABRAHAM', 'C.', 'CAMBA JR.', 'accambajr@pup.edu.ph', 1, 'ivote', 'QYO4Ai', 0, 0, '2023-03-15 17:29:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE009', 'ALEX', 'B', 'ADRIAS', 'abadrias@pup.edu.ph', 1, 'ivote', 'ECOS6j', 0, 0, '2023-03-15 17:29:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE010', 'DIVINA', 'T', 'ADRIAS', 'dtadrias@pup.edu.ph', 1, 'ivote', 'hlKDay', 0, 0, '2023-03-15 17:32:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE011', 'JOEL', 'T', 'AGACITA', 'jtagacita@pup.edu.ph', 1, 'ivote', 'HWAwB3', 0, 0, '2023-03-15 17:32:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE013', 'LOURDES', 'M', 'AGANAN', 'lmaganan@pup.edu.ph', 1, 'ivote', 'x9Lrsy', 0, 0, '2023-03-15 17:33:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE014', 'FERMIN', 'S', 'AGUILA', 'fsaguila@pup.edu.ph', 1, 'ivote', 'hqEZ3i', 0, 0, '2023-03-15 17:34:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE015', 'JULIANA', 'D', 'AGUILA', 'jdaguila@pup.edu.ph', 1, 'ivote', 'H8lGRq', 0, 0, '2023-03-15 17:35:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE016', 'ARLAN', 'M.', 'CAMBA', 'amcamba@pup.edu.ph', 1, 'ivote', 'mldvsj', 0, 0, '2023-03-15 17:35:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE017', 'CHRISTO REY', 'S', 'ALBASON', 'crsalbason@pup.edu.ph', 1, 'ivote', 'I4eLfk', 0, 0, '2023-03-15 17:36:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE018', 'RICHARD', 'M.', 'CAMPOS', 'rmcampos@pup.edu.ph', 1, 'ivote', 'rqA1aN', 0, 0, '2023-03-15 17:36:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE019', 'ANTONIO', 'N', 'ALCANTARA', 'analcantara@pup.edu.ph', 1, 'ivote', 'KQH1JZ', 0, 0, '2023-03-15 17:37:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE020', 'LEO', 'G', 'ALCARAZ', 'lgalcaraz@pup.edu.ph', 1, 'ivote', 'wgSBZ1', 0, 0, '2023-03-15 17:38:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE021', 'EDWIN', 'P.', 'CANDONTOL', 'epcandontol@pup.edu.ph', 1, 'ivote', 'YUz1sJ', 0, 0, '2023-03-15 17:38:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE022', 'MARLINE', 'T', 'ALFANTE', 'mtalfante@pup.edu.ph', 1, 'ivote', 'ucpmTq', 0, 0, '2023-03-15 17:39:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE023', 'ROSITA', 'E.', 'CANLAS', 'recanlas@pup.edu.ph', 1, 'ivote', 'ZO0Lqi', 0, 0, '2023-03-15 17:39:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE024', 'JOSEPHINE', 'O', 'ALFONSO', 'joalfonso@pup.edu.ph', 1, 'ivote', 'nOhfqu', 0, 0, '2023-03-15 17:40:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE025', 'LARRY', 'M', 'ALFONSO', 'lmalfonso@pup.edu.ph', 1, 'ivote', 'GTulAc', 0, 0, '2023-03-15 17:41:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE026', 'RAYMOND', 'L', 'ALFONSO', 'rlalfonso@pup.edu.ph', 1, 'ivote', '4t2vFT', 0, 0, '2023-03-15 17:41:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE027', 'LERMA', 'B', 'ALMEYDA', 'lbalmeyda@pup.edu.ph', 1, 'ivote', 'MhJkqI', 0, 0, '2023-03-15 17:42:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE028', 'DANTE', 'V', 'ALUMNO', 'dvalumno@pup.edu.ph', 1, 'ivote', '2s4FA1', 0, 0, '2023-03-15 17:43:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE029', 'JULIUS', 'S.', 'CANSINO', 'jscansino@pup.edu.ph', 1, 'ivote', 'FgE0rj', 0, 0, '2023-03-15 17:43:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE030', 'RICARDO', 'B', 'ALVARADO', 'rbalvarado@pup.edu.ph', 1, 'ivote', 'EOAiI4', 0, 0, '2023-03-15 17:43:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE031', 'RONNEL', 'H.', 'CAPULI', 'rhcapuli@pup.edu.ph', 1, 'ivote', 'YST2Ey', 0, 0, '2023-03-15 17:44:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE032', 'LOURDES', 'V', 'ALVAREZ', 'lvalvarez@pup.edu.ph', 1, 'ivote', 'F2M1t0', 0, 0, '2023-03-15 17:44:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE033', 'ARTURO', 'C.', 'CARAS', 'accaras@pup.edu.ph', 1, 'ivote', 'Du1iQa', 0, 0, '2023-03-15 17:45:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE034', 'FLORDELIZA', 'E', 'ALVENDIA', 'fealvendia@pup.edu.ph', 1, 'ivote', '4LQBsY', 0, 0, '2023-03-15 17:46:35', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE036', 'MARIA LEONILA', 'C', 'AMATA', 'mlcamata@pup.edu.ph', 1, 'ivote', 'pTi2n0', 0, 0, '2023-03-15 17:47:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE037', 'RUTH', 'P.', 'CARLOS', 'rpcarlos@pup.edu.ph', 1, 'ivote', '90eohA', 0, 0, '2023-03-15 17:47:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE038', 'RIBERT', 'R.', 'ENIERGA', 'rrenierga@pup.edu.ph', 1, 'ivote', 'Ra2OkV', 0, 0, '2023-03-15 17:48:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE039', 'MARK ANTHONY', 'Q', 'AMUL', 'maqamul@pup.edu.ph', 1, 'ivote', 'helb2B', 0, 0, '2023-03-15 17:48:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE040', 'ELAINE CARIE', 'A', 'ANDRES', 'ecaandres@pup.edu.ph', 1, 'ivote', 't8xLyU', 0, 0, '2023-03-15 17:49:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE041', 'RUZZEL JOSEPH', 'A', 'ANIMOSA', 'rjaanimosa@pup.edu.ph', 1, 'ivote', '35oZYB', 0, 0, '2023-03-15 17:50:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE042', 'DANDIE RAYMUNDO', 'O.', 'CARPIO', 'drocarpio@pup.edu.ph', 1, 'ivote', 'T9rPil', 0, 0, '2023-03-15 17:51:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE043', 'NESTOR', 'T', 'APACIONADO', 'ntapacionado@pup.edu.ph', 1, 'ivote', 'EOm3SP', 0, 0, '2023-03-15 17:51:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE044', 'MARIAN', 'G', 'ARADA', 'mgarada@pup.edu.ph', 1, 'ivote', 'sd6Mq0', 0, 0, '2023-03-15 17:52:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE045', 'REALIN', 'C', 'ARANZA', 'rcaranza@pup.edu.ph', 1, 'ivote', 'FuIofb', 0, 0, '2023-03-15 17:53:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE046', 'RAQUEL', 'A', 'AREVALO', 'raarevalo@pup.edu.ph', 1, 'ivote', '9ts5XQ', 0, 0, '2023-03-15 17:54:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE047', 'ARAPIA', 'C', 'ARIRAYA', 'acariraya@pup.edu.ph', 1, 'ivote', 'eYKUxR', 0, 0, '2023-03-15 17:54:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE048', 'EVELYN', 'A', 'ASENIERO', 'eaaseniero@pup.edu.ph', 1, 'ivote', 'DqoX7C', 0, 0, '2023-03-15 17:55:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE049', 'PERLA', 'S.', 'CARPIO', 'pscarpio@pup.edu.ph', 1, 'ivote', 'IqNjxP', 0, 0, '2023-03-15 17:56:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE050', 'RODEL', 'B', 'ASTILLA', 'rbastilla@pup.edu.ph', 1, 'ivote', 'J6l4nD', 0, 0, '2023-03-15 17:56:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE051', 'RICARDO', 'D.', 'CARPIO', 'rdcarpio@pup.edu.ph', 1, 'ivote', 'QV5FJB', 0, 0, '2023-03-15 17:57:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE052', 'GARY', 'C', 'AURE', 'gcaure@pup.edu.ph', 1, 'ivote', 'mQUdXz', 0, 0, '2023-03-15 17:57:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE053', 'ARLENE', 'F.', 'CARPIZO', 'afcarpizo@pup.edu.ph', 1, 'ivote', 'vWD6go', 0, 0, '2023-03-15 17:58:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE054', 'AIRAVIE JOY', 'DR', 'AUSTRIA', 'ajdraustria@pup.edu.ph', 1, 'ivote', 'wfysrc', 0, 0, '2023-03-15 17:58:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE055', 'ANTONIO ', 'F.', 'ENRIQUEZ JR.', 'afenriquezjr@pup.edu.ph', 1, 'ivote', '2PmgcU', 0, 0, '2023-03-15 17:59:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE056', 'REY', 'A.', 'CASADORES', 'rascasadores@pup.edu.ph', 1, 'ivote', 'ATgnRV', 0, 0, '2023-03-15 17:59:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE057', 'AMBROCIA', 'D', 'AUSTRIA', 'adaustria@pup.edu.ph', 1, 'ivote', 'oSiRZJ', 0, 0, '2023-03-15 17:59:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE058', 'RYAN', 'A', 'ENRIQUEZ', 'raenriquez@pup.edu.ph', 1, 'ivote', 'trfJHU', 0, 0, '2023-03-15 18:00:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE059', 'ELIAS', 'A', 'AUSTRIA', 'eaaustria@pup.edu.ph', 1, 'ivote', '2v5Ghz', 0, 0, '2023-03-15 18:00:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE060', 'PACITA', 'M.', 'CASALLO', 'pmcasallo@pup.edu.ph', 1, 'ivote', 'TZrzJq', 0, 0, '2023-03-15 18:00:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE061', 'MA. GEMALYN', 'S', 'AUSTRIA', 'magsaustria@pup.edu.ph', 1, 'ivote', 'MNWwQs', 0, 0, '2023-03-15 18:01:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE062', 'MARY JOY', 'A.', 'CASTILLO', 'mjacastillo@pup.edu.ph', 1, 'ivote', '2WU3QC', 0, 0, '2023-03-15 18:01:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE063', 'ANGELA', 'V', 'AVERION', 'avaverion@pup.edu.ph', 1, 'ivote', 'TyxZcs', 0, 0, '2023-03-15 18:01:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE064', 'JOCEPHRIAM', 'R.', 'ENTERIA ', 'jrenteria@pup.edu.ph', 1, 'ivote', 'XqKjkv', 0, 0, '2023-03-15 18:02:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE065', 'MELANI', 'L.', 'CASTILLO', 'mlcastillo@pup.edu.ph', 1, 'ivote', 'aliDvf', 0, 0, '2023-03-15 18:02:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE066', 'JOANNA', 'R', 'BACASER', 'jrbacaser@pup.edu.ph', 1, 'ivote', 'N04IJ2', 0, 0, '2023-03-15 18:03:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE067', 'CYNTHIA', 'P.', 'EQUIZA', 'cpequiza@pup.edu.ph', 1, 'ivote', '8jznqd', 0, 0, '2023-03-15 18:03:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE068', 'MELANIE', 'F', 'BACTASA', 'mfbactasa@pup.edu.ph', 1, 'ivote', 'zDqs8l', 0, 0, '2023-03-15 18:04:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE069', 'CESAR AMORSOLO', 'A', 'BAGABALDO', 'caabagaldo@pup.edu.ph', 1, 'ivote', 'ZV8oAM', 0, 0, '2023-03-15 18:05:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE070', 'ORLANDO', 'A', 'EQUIZA', 'oaequiza@pup.edu.ph', 1, 'ivote', '6ZmJjo', 0, 0, '2023-03-15 18:05:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE071', 'ARMAN', 'O.', 'CATANGHAL', 'arocatanghal@pup.edu.ph', 1, 'ivote', 'RVpLW2', 0, 0, '2023-03-15 18:05:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE072', 'MELINDA', 'S', 'BALBARINO', 'msbalbarino@pup.edu.ph', 1, 'ivote', 'Kfwxvd', 0, 0, '2023-03-15 18:05:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE073', 'MICHAEL ', 'V', 'ESCANILLA', 'mikevescanilla@pup.edu.ph', 1, 'ivote', 'PWcjDe', 0, 0, '2023-03-15 18:06:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE074', 'CHRISTIAN NOEL', 'Y', 'BALETA', 'cnybaleta@pup.edu.ph', 1, 'ivote', 'oP3zZ2', 0, 0, '2023-03-15 18:06:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE075', 'ROSICAR', 'E.', 'ESCOBER', 'reescober@pup.edu.ph', 1, 'ivote', 'WGM281', 0, 0, '2023-03-15 18:07:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE076', 'EMMANUEL', 'S', 'BALETA', 'esbaleta@pup.edu.ph', 1, 'ivote', 'Vv8qIp', 0, 0, '2023-03-15 18:07:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE077', 'PIA MERLA', 'H.', 'ESPERIDA', 'pmesperida@pup.edu.ph', 1, 'ivote', 'xE2FZp', 0, 0, '2023-03-15 18:07:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE078', 'VIVENCIO', 'O', 'BALLANO', 'voballano@pup.edu.ph', 1, 'ivote', 'YvSQAo', 0, 0, '2023-03-15 18:07:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE079', 'LIGAYA', 'M.', 'ESPINO', 'lmespino@pup.edu.ph', 1, 'ivote', '6gQTY0', 0, 0, '2023-03-15 18:08:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE080', 'SHERYLL', 'I', 'ESPINOCILLA', 'siespinocilla@pup.edu.ph', 1, 'ivote', '9q5OWH', 0, 0, '2023-03-15 18:09:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE081', 'RAQUEL', 'P', 'BARRERA', 'rpbarrera@pup.edu.ph', 1, 'ivote', 'i5HFoP', 0, 0, '2023-03-15 18:10:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE082', 'REYNALDO', 'T', 'BARRERA', 'rtbarrera@pup.edu.ph', 1, 'ivote', 'Lchwfo', 0, 0, '2023-03-15 18:10:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE083', 'RHODORA', 'L.', 'ESPIRITU', 'rlespiritu@pup.edu.ph', 1, 'ivote', 'THh5ei', 0, 0, '2023-03-15 18:10:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE084', 'JEFFREY', 'L', 'BARTILET', 'jlbartilet@pup.edu.ph', 1, 'ivote', 'mA76DB', 0, 0, '2023-03-15 18:11:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE085', 'ARIEL ', 'N.', 'ESQUIVEL', 'anesquivel@pup.edu.ph', 1, 'ivote', 'R0VSKW', 0, 0, '2023-03-15 18:11:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE086', 'ARNEL', 'O.', 'CATANGHAL', 'aocatanghal@pup.edu.ph', 1, 'ivote', 'AiFJjG', 0, 0, '2023-03-15 18:11:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE087', 'SYLVIA', 'M', 'BASILIO', 'smbasilio@pup.edu.ph', 1, 'ivote', 'PE3zfv', 0, 0, '2023-03-15 18:12:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE088', 'ARTURO ', 'P.', 'EVANGELISTA ', 'apevangelista@pup.edu.ph', 1, 'ivote', 'F0u4yD', 0, 0, '2023-03-15 18:12:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE089', 'MARISSA', 'G', 'BATHAN', 'mgbathan@pup.edu.ph', 1, 'ivote', 'kKWP9G', 0, 0, '2023-03-15 18:12:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE090', 'GARITO ', 'E', 'FABI ', 'gefabi@pup.edu.ph', 1, 'ivote', 'Y4NqO5', 0, 0, '2023-03-15 18:12:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE091', 'AMEIL', 'L', 'BATRONEL', 'albatronel@pup.edu.ph', 1, 'ivote', 'XvLBTA', 0, 0, '2023-03-15 18:13:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE092', 'RUTH', 'M.', 'CATANGHAL', 'rmcatanghal@pup.edu.ph', 1, 'ivote', 'ZrY2WI', 0, 0, '2023-03-15 18:13:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE093', 'OLIVIA ', 'P', 'FABI', 'opfabi@pup.edu.ph', 1, 'ivote', 'R5O1Gu', 0, 0, '2023-03-15 18:13:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE094', 'CHRISTINE JOYCE', 'S', 'BAUTISTA', 'cjs.bautista@pup.edu.ph', 1, 'ivote', '51WVp6', 0, 0, '2023-03-15 18:13:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE095', 'ELENA', 'N.', 'FA-ED', 'enfaed@pup.edu.ph', 1, 'ivote', 'BMExrl', 0, 0, '2023-03-15 18:14:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE096', 'ANNA LIZA', 'G', 'BAUZON', 'algbauzon@pup.edu.ph', 1, 'ivote', 'jImnp3', 0, 0, '2023-03-15 18:14:34', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE097', 'FELICITAS', 'A', 'BERMUDEZ', 'fabermudez@pup.edu.ph', 1, 'ivote', '1QJyFB', 0, 0, '2023-03-15 18:15:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE098', 'CARMELITA', 'M.', 'CAULI', 'cmcauli@pup.edu.ph', 1, 'ivote', 'Pa5SYk', 0, 0, '2023-03-15 18:15:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE099', 'ALLAN JAY', 'D.', 'FAJARDO', 'ajdfajardo@pup.edu.ph', 1, 'ivote', 'cHxOnL', 0, 0, '2023-03-15 18:15:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE100', 'NOEL', 'P', 'BERMUDEZ', 'npbermudez@pup.edu.ph', 1, 'ivote', '5gLCus', 0, 0, '2023-03-15 18:16:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE101', 'JERSON', 'M.', 'CELARIO', 'jmcelario@pup.edu.ph', 1, 'ivote', 'VEzoXl', 0, 0, '2023-03-15 18:16:34', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE102', 'GUILLERMO', 'O', 'BERNABE', 'gobernabe@pup.edu.ph', 1, 'ivote', 'WJGUft', 0, 0, '2023-03-15 18:17:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE103', 'YOLANDA', 'M.', 'CELARIO', 'ymcelario@pup.edu.ph', 1, 'ivote', 'kYJPgS', 0, 0, '2023-03-15 18:17:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE104', 'JULIET', 'I.', 'FERNANDEZ', 'jifernandez@pup.edu.ph', 1, 'ivote', 'ypbogs', 0, 0, '2023-03-15 18:17:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE105', 'ELIZABETH', 'C', 'FERNANDO ', 'ecfernando@pup.edu.ph', 1, 'ivote', '7hi1a9', 0, 0, '2023-03-15 18:18:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE106', 'MARICRIS', 'B.', 'CELERIO', 'mbcelerio@pup.edu.ph', 1, 'ivote', 'whrMbQ', 0, 0, '2023-03-15 18:18:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE107', 'RONALD', 'D', 'FERNANDO', 'rdfernando@pup.edu.ph', 1, 'ivote', 'jiUsOu', 0, 0, '2023-03-15 18:18:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE108', 'BERNARDINO', 'C', 'BERNARDINO', 'bcbernardino@pup.edu.ph', 1, 'ivote', 'LVNmFQ', 0, 0, '2023-03-15 18:19:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE109', 'REMEDIOS', 'E.', 'CLAROS', 'reclaros@pup.edu.ph', 1, 'ivote', 'M6U3yh', 0, 0, '2023-03-15 18:19:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE110', 'EDUARDO', 'C', 'FIGURA', 'ecfigura@pup.edu.ph', 1, 'ivote', 'b9SP4g', 0, 0, '2023-03-15 18:19:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE111', 'JAIME', 'C', 'BERNARDINO', 'jcbernardino@pup.edu.ph', 1, 'ivote', '0Ly18I', 0, 0, '2023-03-15 18:19:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE112', 'MARCELA ', 'R. ', 'FIGURA', 'mrfigura@pup.edu.ph', 1, 'ivote', 'M1LaEf', 0, 0, '2023-03-15 18:20:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE113', 'MIGUELITO', 'C.', 'COLARINA', 'mccolarina@pup.edu.ph', 1, 'ivote', 'e5ICol', 0, 0, '2023-03-15 18:20:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE114', 'JOSEPH RANIEL', 'A', 'BIANES', 'jrabianes@pup.edu.ph', 1, 'ivote', '3RlceN', 0, 0, '2023-03-15 18:20:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE115', 'JONATHAN', 'U.', 'FLORIDA ', 'ju.florida@pup.edu.ph', 1, 'ivote', 'pgseoA', 0, 0, '2023-03-15 18:21:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE116', 'REYNALDO', 'V', 'BIARO', 'rvbiaro@pup.edu.ph', 1, 'ivote', 'vJgoEk', 0, 0, '2023-03-15 18:21:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE117', 'BENILDA ELEONOR', 'V.', 'COMENDADOR', 'bevcomendador@pup.edu.ph', 1, 'ivote', 'lF9ad1', 0, 0, '2023-03-15 18:21:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE118', 'AI', 'F', 'FONTAMILLAS', 'affontamillas@pup.edu.ph', 1, 'ivote', 'chiNVM', 0, 0, '2023-03-15 18:21:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE119', 'GLENDA', 'A', 'BIEN', 'gabien@pup.edu.ph', 1, 'ivote', 'fVBTCP', 0, 0, '2023-03-15 18:22:34', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE120', 'ROMINA', 'A.', 'CONSUL', 'raconsul@pup.edu.ph', 1, 'ivote', 'KI4bxu', 0, 0, '2023-03-15 18:22:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE121', 'LOUVELLE ', 'S', 'FORMENTARA ', 'lsformentera@pup.edu.ph', 1, 'ivote', 'Del7Km', 0, 0, '2023-03-15 18:23:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE122', 'JONNA KARLA', 'C', 'BIEN', 'jkcbien@pup.edu.ph', 1, 'ivote', 'pZNJ2r', 0, 0, '2023-03-15 18:23:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE123', 'DARYL ACE', 'V.', 'CORNELL', 'davcornell@pup.edu.ph', 1, 'ivote', '0uG5SP', 0, 0, '2023-03-15 18:23:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE124', 'AILEEN', 'G', 'BIRION', 'agbirion@pup.edu.ph', 1, 'ivote', 'G60Jt2', 0, 0, '2023-03-15 18:23:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE125', 'EDRIAN', 'G', 'BLASQUINO', 'egblasquino@pup.edu.ph', 1, 'ivote', 'OLHClD', 0, 0, '2023-03-15 18:24:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE126', 'ROSALIE', 'A.', 'CORPUS', 'racorpus@pup.edu.ph', 1, 'ivote', 'ytsHkY', 0, 0, '2023-03-15 18:24:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE127', 'DORIS', 'G', 'BLEZA', 'dgbleza@pup.edu.ph', 1, 'ivote', '8xZ3B6', 0, 0, '2023-03-15 18:24:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE128', 'MARIETTA', 'C', 'BONA', 'mcbona@pup.edu.ph', 1, 'ivote', 'PGZYM0', 0, 0, '2023-03-15 18:25:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE129', 'ZENAIDA', 'S', 'BONAOBRA', 'zsbonaobra@pup.edu.ph', 1, 'ivote', '9bAwPc', 0, 0, '2023-03-15 18:26:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE130', 'CARMENCITA', 'S.', 'FRANCISCO', 'csfrancisco@pup.edu.ph', 1, 'ivote', 'oc6Tve', 0, 0, '2023-03-15 18:26:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE131', 'FERDINAND', 'R', 'BONDAME', 'frbondame@pup.edu.ph', 1, 'ivote', 'dNO1B6', 0, 0, '2023-03-15 18:26:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE132', 'MARIA TERESA', 'M.', 'CORRALES', 'mtmcorrales@pup.edu.ph', 1, 'ivote', 'v2srTJ', 0, 0, '2023-03-15 18:26:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE133', 'PEDRO', 'L.', 'FUNILAS', 'plfunilas@pup.edu.ph', 1, 'ivote', 'rosYME', 0, 0, '2023-03-15 18:27:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE134', 'ISMAILA', 'S', 'BONDOC', 'isbondoc@pup.edu.ph', 1, 'ivote', 'GUVnTP', 0, 0, '2023-03-15 18:27:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE135', 'ASUNCION', 'V', 'GABASA', 'avgabasa@pup.edu.ph', 1, 'ivote', 'GMljer', 0, 0, '2023-03-15 18:28:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE136', 'ROLANDO', 'M.', 'COVERO JR.', 'rmcoverojr@pup.edu.ph', 1, 'ivote', 'tfy3eP', 0, 0, '2023-03-15 18:28:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE137', 'NATAN', 'F', 'GACUTE', 'nfgacute@pup.edu.ph', 1, 'ivote', 'LUEjKJ', 0, 0, '2023-03-15 18:28:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE138', 'MA. THERESA', 'D', 'BONGULTO', 'mtdbongulto@pup.edu.ph', 1, 'ivote', 'tbhWLm', 0, 0, '2023-03-15 18:28:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE139', 'CLEOTILDE', 'L.', 'CRESCINI', 'clcrescini@pup.edu.ph', 1, 'ivote', 'n5ZTNt', 0, 0, '2023-03-15 18:29:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE140', 'JEAN', 'O', 'BONIOL', 'joboniol@pup.edu.ph', 1, 'ivote', 'uil67L', 0, 0, '2023-03-15 18:29:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE141', 'JOSE NINO', 'G.', 'GALANG', 'jnggalang@pup.edu.ph', 1, 'ivote', 'ZJ6E49', 0, 0, '2023-03-15 18:29:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE142', 'ELMER', 'P', 'BRABANTE', 'epbrabante@pup.edu.ph', 1, 'ivote', 'u9pFDx', 0, 0, '2023-03-15 18:30:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE143', 'FRITZ', 'C.', 'GALERO', 'fcgalero@pup.edu.ph', 1, 'ivote', 'qjTt97', 0, 0, '2023-03-15 18:30:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE144', 'JOHN ', 'P.', 'CRISOSTOMO', 'jpcrisostomo@pup.edu.ph', 1, 'ivote', 'bMxFgh', 0, 0, '2023-03-15 18:30:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE145', 'SALVE', 'B', 'BUELVA', 'svbuelva@pup.edu.ph', 1, 'ivote', 'szHytx', 0, 0, '2023-03-15 18:30:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE146', 'ANGELITA', 'T.', 'GALLANO', 'atgallano@pup.edu.ph', 1, 'ivote', 'rKnfvH', 0, 0, '2023-03-15 18:31:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE147', 'MA. AILENE', 'E', 'BUENO', 'maebueno@pup.edu.ph', 1, 'ivote', 'BoXjDk', 0, 0, '2023-03-15 18:31:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE148', 'ANA LIZZA', 'B.', 'CRISTE', 'albcriste@pup.edu.ph', 1, 'ivote', 'wKgxaW', 0, 0, '2023-03-15 18:32:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE149', 'MARIANITO ', 'P.', 'GALLEGO', 'mpgallegojr@pup.edu.ph', 1, 'ivote', 'M2DjIA', 0, 0, '2023-03-15 18:32:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE150', 'CIELITO', 'B', 'BUHAIN', 'cbbuhain@pup.edu.ph', 1, 'ivote', 'asneOI', 0, 0, '2023-03-15 18:32:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE151', 'LEONARDO', 'M', 'BULAWIT', 'lmbulawit@pup.edu.ph', 1, 'ivote', '9zfENZ', 0, 0, '2023-03-15 18:33:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE152', 'CHRISTOPHER', 'C.', 'CRISTE', 'cccriste@pup.edu.ph', 1, 'ivote', 'DlxndY', 0, 0, '2023-03-15 18:33:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE153', 'ALBERTO', 'R', 'GAMBOA ', 'argamboa@pup.edu.ph', 1, 'ivote', 'VdGYhX', 0, 0, '2023-03-15 18:33:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE154', 'ARMANDO', 'H.', 'CRUZ JR.', 'ahcruzjr@pup.edu.ph', 1, 'ivote', '0rXsmV', 0, 0, '2023-03-15 18:33:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE155', 'NASTASJA CAMILLE', 'T', 'BULFANGO', 'nctbulfango@pup.edu.ph', 1, 'ivote', 'eZ7F2d', 0, 0, '2023-03-15 18:34:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE156', 'MA. SHEILA ', 'S', 'GANCHERO', 'mssganchero@pup.edu.ph', 1, 'ivote', 'YvQqFr', 0, 0, '2023-03-15 18:34:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE157', 'ARTEMUS', 'G.', 'CRUZ', 'agcruz@pup.edu.ph', 1, 'ivote', 'ahMv4r', 0, 0, '2023-03-15 18:35:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE158', 'ARTHUR ', 'C', 'GARCIA ', 'acgarcia@pup.edu.ph', 1, 'ivote', '1uyzac', 0, 0, '2023-03-15 18:35:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE159', 'GERONIMO', 'A.', 'CUADRA', 'gacuadra@pup.edu.ph', 1, 'ivote', 'oSAadr', 0, 0, '2023-03-15 18:36:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE160', 'CESAR ', 'H.', 'GARCIA ', 'chgarcia@pup.edu.ph', 1, 'ivote', 'gsAwX0', 0, 0, '2023-03-15 18:36:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE161', 'OSCAR', 'M', 'BUMANGLAG JR.', 'ombumanglagjr@pup.edu.ph', 1, 'ivote', 'RDZeCg', 0, 0, '2023-03-15 18:36:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE162', 'ROCHELLE MAY ', 'E.', 'GARCIA ', 'rmergarcia@pup.edu.ph', 1, 'ivote', 's4xFDY', 0, 0, '2023-03-15 18:36:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE163', 'BAYANI', 'C', 'CABADDU', 'bccabaddu@pup.edu.ph', 1, 'ivote', 'oJEMgP', 0, 0, '2023-03-15 18:36:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE164', 'MELISSA', 'B', 'CABALO', 'mbcabalo@pup.edu.ph', 1, 'ivote', 'rUpAFo', 0, 0, '2023-03-15 18:37:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE165', 'JHONLEY', 'O.', 'CUBACUB', 'jocubacub@pup.edu.ph', 1, 'ivote', '5Lyj0c', 0, 0, '2023-03-15 18:37:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE166', 'ZOILO', 'C.', 'GARCIA ', 'zcgarcia@pup.edu.ph', 1, 'ivote', 'WlOSG9', 0, 0, '2023-03-15 18:37:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE167', 'EUFEMIA', 'B', 'CABANSAG', 'ebcabansag@pup.edu.ph', 1, 'ivote', 'BKZIbu', 0, 0, '2023-03-15 18:38:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE168', 'IRMA', 'A', 'GATCHO', 'iagatcho@pup.edu.ph', 1, 'ivote', '0sQeoI', 0, 0, '2023-03-15 18:38:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE169', 'AGATONA', 'D.', 'CUNANAN', 'adcunanan@pup.edu.ph', 1, 'ivote', '24VcpE', 0, 0, '2023-03-15 18:39:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE170', 'HANNA MAE', 'L.', 'GAYO', 'hmgayo@pup.edu.ph', 1, 'ivote', 't89qk2', 0, 0, '2023-03-15 18:40:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE171', 'RICHARD', 'C.', 'DACILLO', 'rcdacillo@pup.edu.ph', 1, 'ivote', '4t5hZj', 0, 0, '2023-03-15 18:40:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE172', 'GRACE', 'M.', 'GENTOLIZO', 'gmgentolizo@pup.edu.ph', 1, 'ivote', '1VLXmi', 0, 0, '2023-03-15 18:41:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE173', 'DANILO', 'P.', 'DADIA', 'dpdadia@pup.edu.ph', 1, 'ivote', 'iGlEz1', 0, 0, '2023-03-15 18:42:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE174', 'BLESSING', 'G.', 'GLOVA', 'bgglova@pup.edu.ph', 1, 'ivote', 'QOctaN', 0, 0, '2023-03-15 18:42:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE175', 'MA. ARTES DECENA', 'C', 'CABILES', 'madccabiles@pup.edu.ph', 1, 'ivote', 'rmOoCG', 0, 0, '2023-03-15 18:43:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE176', 'JOSELINDA', 'M.', 'GOLPEO', 'jmgolpeo@pup.edu.ph', 1, 'ivote', 'y4qgPJ', 0, 0, '2023-03-15 18:43:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE177', 'EDUARDO', 'O.', 'DADIVAS', 'eodadivas@pup.edu.ph', 1, 'ivote', '89rAuN', 0, 0, '2023-03-15 18:43:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE178', 'ELENA ', 'T.', 'GOMEZ', 'etgomez@pup.edu.ph', 1, 'ivote', 'cHhFYo', 0, 0, '2023-03-15 18:43:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE179', 'CEASAR BAYANI', 'V', 'CABOBOY', 'cbvcaboboy@pup.edu.ph', 1, 'ivote', 'szVmFN', 0, 0, '2023-03-15 18:44:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE180', 'AGNES', 'Y.', 'GONZAGA', 'aygonzaga@pup.edu.ph', 1, 'ivote', 'w4FZUl', 0, 0, '2023-03-15 18:44:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE181', 'QUEEN', 'D.', 'DAGAHUYA', 'qddagahuya@pup.edu.ph', 1, 'ivote', 'bVYF6s', 0, 0, '2023-03-15 18:45:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE182', 'HONORATO', 'I', 'CABRERA JR.', 'hicabrerajr@pup.edu.ph', 1, 'ivote', '9tYRBQ', 0, 0, '2023-03-15 18:45:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE183', 'JAIME', 'Y.', 'GONZALES', 'jygonzales@pup.edu.ph', 1, 'ivote', 'x8ZcJP', 0, 0, '2023-03-15 18:45:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE184', 'MYRNA', 'A', 'CABRERA', 'macabrera@pup.edu.ph', 1, 'ivote', 'HInWQq', 0, 0, '2023-03-15 18:45:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE185', 'LYDINAR', 'O.', 'DASTAS', 'lodastas@pup.edu.ph', 1, 'ivote', 'RSFWix', 0, 0, '2023-03-15 18:46:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE186', 'NAZARIO', 'M', 'CABRERA', 'nmcabrera@pup.edu.ph', 1, 'ivote', 'PS09wl', 0, 0, '2023-03-15 18:46:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE187', 'MC ROE', 'A', 'GONZALES', 'magonzales@pup.edu.ph', 1, 'ivote', 'V3L4w0', 0, 0, '2023-03-15 18:46:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE188', 'RESYLYN', 'Z', 'CABRERA', 'rzcabrera@pup.edu.ph', 1, 'ivote', 'jCHJRS', 0, 0, '2023-03-15 18:46:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE189', 'MYRNA', 'C', 'CACHO', 'mccacho@pup.edu.ph', 1, 'ivote', '02XDlI', 0, 0, '2023-03-15 18:47:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE190', 'LETICIA ', 'Z', 'GOROSPE ', 'lzgorospe@pup.edu.ph', 1, 'ivote', 'BYvz0G', 0, 0, '2023-03-15 18:47:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE191', 'FRANCIS JOHN', 'A.', 'DATILES', 'fjadatiles@pup.edu.ph', 1, 'ivote', '6ir1Uh', 0, 0, '2023-03-15 18:47:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE192', 'BARBARA', 'P', 'CAMACHO', 'bpcamacho@pup.edu.ph', 1, 'ivote', 'yGdRNJ', 0, 0, '2023-03-15 18:48:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE193', 'JORGINA', 'V.', 'DAVID', 'jvdavid@pup.edu.ph', 1, 'ivote', 'nv4tkE', 0, 0, '2023-03-15 18:48:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE194', 'BELEN', 'Z', 'DE ASIS', 'bzdeasis@pup.edu.ph', 1, 'ivote', 'pZBxOe', 0, 0, '2023-03-15 18:49:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE195', 'MARIE CHARLETTE', 'L.', 'GREENE', 'mclgreene@pup.edu.ph', 1, 'ivote', 'Jz5NTq', 0, 0, '2023-03-15 18:49:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE196', 'LEONARDO', 'G.', 'GRUTA', 'lggruta@pup.edu.ph', 1, 'ivote', 'EsZ2Ql', 0, 0, '2023-03-15 18:50:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE197', 'KATHLEEN JAEIGHT ', 'N.', 'DE GUZMAN', 'kjndeguzman@pup.edu.ph', 1, 'ivote', 'BbU69a', 0, 0, '2023-03-15 18:51:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE198', 'REYNALDO', 'A.', 'GUERZON', 'reynaldoaguerzon@pup.edu.ph', 1, 'ivote', 'ymbwIR', 0, 0, '2023-03-15 18:51:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE199', 'BENEDICTO', 'E.', 'GUEVARRA', 'beguevarra@pup.edu.ph', 1, 'ivote', '8ho70E', 0, 0, '2023-03-15 18:52:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE200', 'MELINDA', 'M.', 'DE GUZMAN', 'mmdeguzman@pup.edu.ph', 1, 'ivote', '4XmvYa', 0, 0, '2023-03-15 18:52:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE201', 'ALEXANDER', 'S', 'DE JESUS', 'asdejesus@pup.edu.ph', 1, 'ivote', 'XTURhQ', 0, 0, '2023-03-15 18:53:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE202', 'ALBERTO', 'C.', 'GUILLO', 'acguillo@pup.edu.ph', 1, 'ivote', 'VBxQkD', 0, 0, '2023-03-15 18:53:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE203', 'GINA', 'S', 'LIM', 'gslim@pup.edu.ph', 1, 'ivote', '4YVQ5P', 0, 0, '2023-03-15 18:54:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE204', 'ELMER', 'G.', 'DE JOSE', 'egdejose@pup.edu.ph', 1, 'ivote', 'cxXlhb', 0, 0, '2023-03-15 18:54:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE205', 'ADRIAN', 'R.', 'GUINTO', 'arguinto@pup.edu.ph', 1, 'ivote', 'Qd2qIT', 0, 0, '2023-03-15 18:54:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE206', 'ARELENE', 'D', 'LINGANAY', 'adlinganay@pup.edu.ph', 1, 'ivote', 'xtqhUG', 0, 0, '2023-03-15 18:55:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE207', 'FAUSTO', 'D.', 'GAUTIERREZ', 'fdgutierrez@pup.edu.ph', 1, 'ivote', 'OB7Eog', 0, 0, '2023-03-15 18:55:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE209', 'GARY ANTONIO', 'C', 'LIRIO', 'gaclirio@pup.edu.ph', 1, 'ivote', 'wjNa24', 0, 0, '2023-03-15 18:55:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE210', 'MA. DELIA', 'M', 'LIZ', 'mdmliz@pup.edu.ph', 1, 'ivote', 'yAQk09', 0, 0, '2023-03-15 18:56:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE211', 'MELINDA', 'W.', 'GUTIERREZ', 'mwgutierrez@pup.edu.ph', 1, 'ivote', 'pgByqR', 0, 0, '2023-03-15 18:56:39', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE212', 'RAQUEL', 'P', 'LOBIGAS', 'rplobigas@pup.edu.ph', 1, 'ivote', 'VfTRYQ', 0, 0, '2023-03-15 18:56:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE213', 'LOURDES', 'D.', 'DE LUMBAN', 'lddelumban@pup.edu.ph', 1, 'ivote', 'KSduaq', 0, 0, '2023-03-15 18:56:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE214', 'ROSIELYN', 'J', 'LOMTONG', 'rjlomtong@pup.edu.ph', 1, 'ivote', 'IvlMLd', 0, 0, '2023-03-15 18:57:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE215', 'DAISY', 'S', 'DE VERA', 'dsdevera@pup.edu.ph', 1, 'ivote', 'Q9D5oc', 0, 0, '2023-03-15 18:57:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE216', 'HERNANDO', 'G', 'LOPEZ', 'hglopez@pup.edu.ph', 1, 'ivote', 'AYLUT0', 0, 0, '2023-03-15 18:57:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE217', 'MADELYN', 'G', 'LOPEZ', 'mglopez@pup.edu.ph', 1, 'ivote', '4XsGTh', 0, 0, '2023-03-15 18:58:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE218', 'ZAILA', 'C.', 'DECIN', 'zcdecin@pup.edu.ph', 1, 'ivote', 'zOM26s', 0, 0, '2023-03-15 18:58:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE219', 'LICERIA', 'D', 'LORENZO', 'ldlorenzo@pup.edu.ph', 1, 'ivote', 'oKC0Dz', 0, 0, '2023-03-15 18:59:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE220', 'JESUSANA', 'S.', 'DEJITO', 'jsdejito@pup.edu.ph', 1, 'ivote', 'MygsCr', 0, 0, '2023-03-15 19:00:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE221', 'DANILO', 'D.', 'HERNANDEZ', 'ddshernandez@pup.edu.ph', 1, 'ivote', 'dFp5aN', 0, 0, '2023-03-15 19:00:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE222', 'ERWIN', 'J', 'DEL MUNDO', 'erjdelmundo@pup.edu.ph', 1, 'ivote', '1AvHK9', 0, 0, '2023-03-15 19:01:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE223', 'MA. ESPERANZA', 'S', 'LORENZO', 'maslorenzo@pup.edu.ph', 1, 'ivote', 'Q3aNrw', 0, 0, '2023-03-15 19:01:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE224', 'ARGIE', 'B', 'HIFARVA', 'abhifarva@pup.edu.ph', 1, 'ivote', 'mUBsZf', 0, 0, '2023-03-15 19:01:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE225', 'MARLENE ', 'S.', 'HIJE', 'mshijie@pup.edu.ph', 1, 'ivote', 'cqAzI7', 0, 0, '2023-03-15 19:02:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE226', 'ROMULO', 'B', 'HUBBARD', 'rmhubbard@pup.edu.ph', 1, 'ivote', 'd2VEkl', 0, 0, '2023-03-15 19:03:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE227', 'EVELYN', 'J', 'DEL MUNDO', 'ejdelmundo@pup.edu.ph', 1, 'ivote', 'RC3a5w', 0, 0, '2023-03-15 19:03:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE228', 'ROSENIE', 'F.', 'IBABAO', 'rfibabao@pup.edu.ph', 1, 'ivote', 'cuEpNU', 0, 0, '2023-03-15 19:04:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE229', 'JULIAN', 'L', 'LORICO JR.', 'jlloricojr@pup.edu.ph', 1, 'ivote', 'Gqb85f', 0, 0, '2023-03-15 19:04:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE230', 'MARLYN', 'G', 'DEL ROSARIO', 'mgdelrosario@pup.edu.ph', 1, 'ivote', 'Zjl2J5', 0, 0, '2023-03-15 19:04:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE231', 'PETE CRIZURBAN', 'R.', 'IBARRA', 'pcibarra@pup.edu.ph', 1, 'ivote', 'kmPCRF', 0, 0, '2023-03-15 19:04:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE232', 'ARNALD', 'R', 'LUMABAT', 'arlumabat@pup.edu.ph', 1, 'ivote', 'TfgUB1', 0, 0, '2023-03-15 19:04:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE233', 'BERNARDO', 'R', 'LUMABAT', 'brlumabat@pup.edu.ph', 1, 'ivote', 'fSQZYR', 0, 0, '2023-03-15 19:05:34', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE234', 'RONNIE ', 'A', 'IDIAN ', 'raidian@pup.edu.ph', 1, 'ivote', 'm5lJnP', 0, 0, '2023-03-15 19:05:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE235', 'JERRY', 'B', 'LUNA', 'jbluna@pup.edu.ph', 1, 'ivote', 'OaTqjU', 0, 0, '2023-03-15 19:06:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE236', 'MICHAEL', 'G', 'DEL ROSARIO', 'michaelgdelrosario@pup.edu.ph', 1, 'ivote', 'LW9P75', 0, 0, '2023-03-15 19:06:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE237', 'ROMEO', 'G', 'ILAGAN ', 'rgilagan@pup.edu.ph', 1, 'ivote', 'mcsowE', 0, 0, '2023-03-15 19:06:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE238', 'AVELINA', 'N', 'LUPAS', 'anlupas@pup.edu.ph', 1, 'ivote', 't60ZuF', 0, 0, '2023-03-15 19:06:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE239', 'EFREN', 'R', 'ILARINA', 'erilarina@pup.edu.ph', 1, 'ivote', 'Km7aeQ', 0, 0, '2023-03-15 19:06:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE240', 'ERNESTO', 'D', 'MACHADO', 'edmachado@pup.edu.ph', 1, 'ivote', 'zpNVHb', 0, 0, '2023-03-15 19:06:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE241', 'RAMON HERCULES ', 'G', 'DEL ROSARIO', 'rhgdelrosario@pup.edu.ph', 1, 'ivote', 'yk9vUi', 0, 0, '2023-03-15 19:07:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE242', 'FLORENITA', 'E', 'IMPERIAL', 'feimperial@pup.edu.ph', 1, 'ivote', 'tD5dPb', 0, 0, '2023-03-15 19:07:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE243', 'FRANCISCO', 'M', 'MAGANIS JR.', 'fmmaganisjr@pup.edu.ph', 1, 'ivote', 'QFwxqm', 0, 0, '2023-03-15 19:07:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE244', 'VERNA', 'C', 'MAGNAYE', 'vcmagnaye@pup.edu.ph', 1, 'ivote', 'WxEoOs', 0, 0, '2023-03-15 19:08:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE245', 'EMELITA', 'A.', 'ISAAC', 'eaisaac@pup.edu.ph', 1, 'ivote', 'hEu3dx', 0, 0, '2023-03-15 19:08:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE246', 'TONILYNNE', 'G.', 'DEL  ROSARIO', 'tgdelrosario@pup.edu.ph', 1, 'ivote', 'MvbOan', 0, 0, '2023-03-15 19:08:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE247', 'ROLITO', 'L', 'MAHAGUAY', 'rlmahaguay@pup.edu.ph', 1, 'ivote', 'tpdCqZ', 0, 0, '2023-03-15 19:08:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE248', 'ANGELA ', 'L.', 'ISRAEL', 'alisrael@pup.edu.ph', 1, 'ivote', 'OZqC9u', 0, 0, '2023-03-15 19:09:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE249', 'ARVIN', 'R.', 'DELA CRUZ', 'ardelacruz@pup.edu.ph', 1, 'ivote', 'V3vXcu', 0, 0, '2023-03-15 19:09:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE250', 'LORITO', 'I', 'MAKABENTA', 'limakabenta@pup.edu.ph', 1, 'ivote', '9L1ONl', 0, 0, '2023-03-15 19:09:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE251', 'ANGELYN', 'C.', 'JACOB', 'acjacob@pup.edu.ph', 1, 'ivote', 'wxDKNU', 0, 0, '2023-03-15 19:09:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE252', 'VALENTINO', 'B', 'JAZUL', 'vbjazul@pup.edu.ph', 1, 'ivote', 'Lw5cpg', 0, 0, '2023-03-15 19:10:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE253', 'CRISANTO', 'V', 'DELA CRUZ', 'cvdelacruz@pup.edu.ph', 1, 'ivote', 'lxiTRz', 0, 0, '2023-03-15 19:10:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE254', 'MARIFEL', 'I.', 'JAVIER', 'mijavier@pup.edu.ph', 1, 'ivote', 'v0EG3m', 0, 0, '2023-03-15 19:11:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE255', 'RAQUEL', 'G.', 'JAVIER', 'rgjavier@pup.edu.ph', 1, 'ivote', 'p6TPye', 0, 0, '2023-03-15 19:11:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE256', 'HERMOGENES', 'D', 'DELA CRUZ', 'hddelacruz@pup.edu.ph', 1, 'ivote', 'i3mDwg', 0, 0, '2023-03-15 19:11:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE257', 'JALAINE JOYCE', 'V', 'MALABANAN', 'jjvmalabanan@pup.edu.ph', 1, 'ivote', 'jHmDJQ', 0, 0, '2023-03-15 19:11:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE258', 'ERIC ', 'A.', 'JOYA ', 'eajoya@pup.edu.ph', 1, 'ivote', 'QvT4ku', 0, 0, '2023-03-15 19:12:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE259', 'HILARION HENRY', 'M', 'MALASIQUE', 'hhmmalasique@pup.edu.ph', 1, 'ivote', '2ZGPzi', 0, 0, '2023-03-15 19:12:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE260', 'ROMER', 'S.', 'JULIAN ', 'rsjulian@pup.edu.ph', 1, 'ivote', 'oX9rza', 0, 0, '2023-03-15 19:12:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE261', 'ORLEAN', 'G', 'DELA CRUZ', 'ogdelacruz@pup.edu.ph', 1, 'ivote', 'zVuohA', 0, 0, '2023-03-15 19:13:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE262', 'MICHELLE', 'O', 'MALLARI', 'momallari@pup.edu.ph', 1, 'ivote', 'DEPMnm', 0, 0, '2023-03-15 19:13:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE263', 'FERDINAND', 'L.', 'LA PUEBLA ', 'fllapuebla@pup.edu.ph', 1, 'ivote', 'Xmj45s', 0, 0, '2023-03-15 19:13:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE264', 'PONCIANO', 'D.', 'DELA CRUZ', 'pddelacruz@pup.edu.ph', 1, 'ivote', 'QoqUPn', 0, 0, '2023-03-15 19:13:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE265', 'NICOLAS', 'T', 'MALLARI', 'ntmallari@pup.edu.ph', 1, 'ivote', 'CSeIta', 0, 0, '2023-03-15 19:13:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE266', 'LERMA', 'U', 'MALZAN', 'lumalzan@pup.edu.ph', 1, 'ivote', '7MZad6', 0, 0, '2023-03-15 19:14:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE267', 'CLINT MICHAEL', 'F.', 'LACDANG', 'cmflacdang@pup.edu.ph', 1, 'ivote', 'BvR9qH', 0, 0, '2023-03-15 19:14:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE268', 'LOURELIE', 's', 'MAMPUSTI', 'lsmampusti@pup.edu.ph', 1, 'ivote', 'Y35RTO', 0, 0, '2023-03-15 19:14:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE269', 'RUDOLF', 'N.', 'LACERNA', 'raalacerna@pup.edu.ph', 1, 'ivote', '8haTti', 0, 0, '2023-03-15 19:15:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE270', 'RENZ OLIVER', 'B', 'DELA CRUZ', 'robdelacruz@pup.edu.ph', 1, 'ivote', 'B8cb2i', 0, 0, '2023-03-15 19:15:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE271', 'KRYSTAL', 'L', 'MANAMTAM', 'klmanamtam@pup.edu.ph', 1, 'ivote', 'rwSPOa', 0, 0, '2023-03-15 19:15:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE272', 'DENNIS', 'V.', 'LACSON', 'dvlacson@pup.edu.ph', 1, 'ivote', 'V4Hb1y', 0, 0, '2023-03-15 19:15:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE273', 'MATHEW', 'S', 'MANANSALA', 'msmanansala@pup.edu.ph', 1, 'ivote', 't3RMaZ', 0, 0, '2023-03-15 19:16:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE274', 'RUDOLF', 'I', 'DELA CRUZ', 'ridelacruz@pup.edu.ph', 1, 'ivote', 'DJ8XFd', 0, 0, '2023-03-15 19:16:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE275', 'JOY ANNE', 'C.', 'LAGRAMA', 'jaclagrama@pup.edu.ph', 1, 'ivote', 'jbTHU9', 0, 0, '2023-03-15 19:16:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE276', 'BERNICE', 'G', 'MANGABAT', 'bgmangabat@pup.edu.ph', 1, 'ivote', 'XI4iJV', 0, 0, '2023-03-15 19:16:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE277', 'JENALYN', 'Y.', 'LAI', 'jenalynylai@pup.edu.ph', 1, 'ivote', 'hPGJun', 0, 0, '2023-03-15 19:17:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE278', 'MARVIN', 'G.', 'LAI', 'mglai@pup.edu.ph', 1, 'ivote', 'CVSD3M', 0, 0, '2023-03-15 19:17:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE279', 'SHIELA MARIE', 'P', 'DELA CRUZ', 'smpdelacruz@pup.edu.ph', 1, 'ivote', 'NMUPup', 0, 0, '2023-03-15 19:17:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE280', 'LEVI', 'R', 'MANLAPAS', 'lrmanlapas@pup.edu.ph', 1, 'ivote', 'jhKdUx', 0, 0, '2023-03-15 19:17:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE281', 'MYRNA', 'F', 'MANLAPAS', 'mfmanlapas@pup.edu.ph', 1, 'ivote', '58WNJO', 0, 0, '2023-03-15 19:18:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE282', 'EDGARDO', 'A.', 'LATOZA', 'ealatoza@pup.edu.ph', 1, 'ivote', 'w8BjQ4', 0, 0, '2023-03-15 19:18:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE284', 'JESSICA', 'V', 'LAUZA', 'jvlauza@pup.edu.ph', 1, 'ivote', 'S4Zoxs', 0, 0, '2023-03-15 19:19:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE285', 'MARIA ELENA', 'M', 'MANO', 'memmano@pup.edu.ph', 1, 'ivote', 'rT2aX6', 0, 0, '2023-03-15 19:19:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE286', 'CARMELITA', 'P', 'MAPANAO', 'cpmapanao@pup.edu.ph', 1, 'ivote', 'QNwYdM', 0, 0, '2023-03-15 19:19:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE287', 'BONIFACIO', 'S.', 'LAYGO', 'bslaygo@pup.edu.ph', 1, 'ivote', 'kNDrEl', 0, 0, '2023-03-15 19:20:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE288', 'SANDRA', 'P', 'MARCOS', 'spmarcos@pup.edu.ph', 1, 'ivote', 'kR5Mzf', 0, 0, '2023-03-15 19:20:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE289', 'MICHAEL', 'B', 'DELA FUENTE', 'mbdelafuente@pup.edu.ph', 1, 'ivote', 'bndx0Z', 0, 0, '2023-03-15 19:20:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE290', 'ARLENE JOY', 'M', 'MARQUEZ', 'ajmmarquez@pup.edu.ph', 1, 'ivote', 'rNEwmL', 0, 0, '2023-03-15 19:20:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE291', 'LILBETH', 'L.', 'LAYGO', 'lllaygo@pup.edu.ph', 1, 'ivote', 'k6OrfA', 0, 0, '2023-03-15 19:21:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE292', 'EMELINDA', 'C.', 'LAYOS', 'eclayos@pup.edu.ph', 1, 'ivote', 'VawQiO', 0, 0, '2023-03-15 19:21:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE293', 'DIOSDADO', 'L', 'MARTINEZ', 'dlmartinez@pup.edu.ph', 1, 'ivote', 'Omn5CZ', 0, 0, '2023-03-15 19:22:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE294', 'JOSEPHINE', 'M', 'DELA ISLA', 'jmdelaisla@pup.edu.ph', 1, 'ivote', 'YeKUAd', 0, 0, '2023-03-15 19:22:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE295', 'LAMBERTO ANGEL', 'B', 'MARTINEZ', 'labmartinez@pup.edu.ph', 1, 'ivote', 'V2L9Xu', 0, 0, '2023-03-15 19:22:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE296', 'ALVIN', 'J.', 'LEGASPI', 'ajlegaspi@pup.edu.ph', 1, 'ivote', 'cSRKHy', 0, 0, '2023-03-15 19:22:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE297', 'JEFFERSON', 'N.', 'LEGASPI', 'jnlegaspi@pup.edu.ph', 1, 'ivote', 'lvLmnC', 0, 0, '2023-03-15 19:23:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE298', 'ELDRIN', 'P', 'DELGADO', 'epdelgado@pup.edu.ph', 1, 'ivote', 'K0GNUz', 0, 0, '2023-03-15 19:23:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE299', 'JEAN PAUL', 'G', 'MARTIREZ', 'jpgmartirez@pup.edu.ph', 1, 'ivote', 'vrUYLD', 0, 0, '2023-03-15 19:23:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE300', 'MARISSA', 'J.', 'LEGASPI', 'mjlegaspi@pup.edu.ph', 1, 'ivote', 'V1oRkv', 0, 0, '2023-03-15 19:24:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE301', 'MIGUEL DARWIN', 'Z', 'MASCARDO', 'mdzmascardo@pup.edu.ph', 1, 'ivote', 'rTa0oU', 0, 0, '2023-03-15 19:24:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE302', 'IRENEO ', 'C', 'DELAS ARMAS JR', 'icdelasarmasjr@pup.edu.ph', 1, 'ivote', 'JSQi9r', 0, 0, '2023-03-15 19:24:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE303', 'CRISELDA', 'M.', 'LIGON', 'cmligon@pup.edu.ph', 1, 'ivote', 'kfucsz', 0, 0, '2023-03-15 19:24:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE304', 'MARISSA', 'L', 'MAYRENA', 'mlmayrena@pup.edu.ph', 1, 'ivote', 'Wsvg9S', 0, 0, '2023-03-15 19:25:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE305', 'ANALYN', 'P.', 'LIM', 'aplim@pup.edu.ph', 1, 'ivote', 'CMOt9r', 0, 0, '2023-03-15 19:25:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE306', 'ESTELITA', 'E', 'MEDINA', 'eemedina@pup.edu.ph', 1, 'ivote', 'A5agOn', 0, 0, '2023-03-15 19:26:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE307', 'CARMELA', 'V', 'DELLOVA', 'cvdellova@pup.edu.ph', 1, 'ivote', 'nLzCVX', 0, 0, '2023-03-15 19:26:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE308', 'LEMY', 'E', 'MEDINA', 'lemedina@pup.edu.ph', 1, 'ivote', 'gWf9uV', 0, 0, '2023-03-15 19:26:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE309', 'MANUEL', 'B', 'MEDINA JR.', 'mbmedinajr@pup.edu.ph', 1, 'ivote', 'RH0YCx', 0, 0, '2023-03-15 19:27:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE310', 'LORENA', 'V', 'DELOS REYES', 'lvdelosreyes@pup.edu.ph', 1, 'ivote', 'v3LG6E', 0, 0, '2023-03-15 19:27:39', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE311', 'NARCISO', 'B', 'MEDINA JR', 'nbmedinajr@pup.edu.ph', 1, 'ivote', 'KVs3bI', 0, 0, '2023-03-15 19:27:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE312', 'MARIA PIA', 'V', 'MENDEZ', 'mpvmendez@pup.edu.ph', 1, 'ivote', 'r7Tqnc', 0, 0, '2023-03-15 19:28:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE313', 'MYLEEN', 'L', 'DELOS SANTOS', 'mldelossantos@pup.edu.ph', 1, 'ivote', 'grJM0G', 0, 0, '2023-03-15 19:28:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE314', 'MARY JANE', 'G', 'MENDOZA', 'mjgmendoza@pup.edu.ph', 1, 'ivote', 'yEuzNC', 0, 0, '2023-03-15 19:31:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tblmember` (`strMemberId`, `strMemFname`, `strMemMname`, `strMemLname`, `strMemEmail`, `intMemSecQuesId`, `strMemSecQuesAnswer`, `strMemPasscode`, `blMemCodeSendStat`, `blMemDelete`, `created_at`, `updated_at`, `deleted_at`) VALUES
('CODE315', 'EFRAIN', 'S', 'MIJARES', 'esmijares@pup.edu.ph', 1, 'ivote', 'BfLaMV', 0, 0, '2023-03-15 19:32:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE316', 'EMELINDA', 'A', 'MILLENA', 'eamillena@pup.edu.ph', 1, 'ivote', '7f2q8g', 0, 0, '2023-03-15 19:33:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE317', 'CHESTER', 'C', 'DEOCARIS', 'ccdeocaris@pup.edu.ph', 1, 'ivote', 'gB9u70', 0, 0, '2023-03-15 19:33:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE318', 'RAEMIL JOSHUA', 'A', 'MILLENA', 'rjamillena@pup.edu.ph', 1, 'ivote', 'V02AQY', 0, 0, '2023-03-15 19:33:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE319', 'JOHN LESTER', '', 'DEPUSOY', 'jldepusoy@pup.edu.ph', 1, 'ivote', 'FDaW79', 0, 0, '2023-03-15 19:34:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE320', 'RAMIR', 'M', 'MILLENA', 'rmmillena@pup.edu.ph', 1, 'ivote', 'nKLYXw', 0, 0, '2023-03-15 19:34:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE321', 'MYRNA', 'G', 'DIONA', 'mgdiona@pup.edu.ph', 1, 'ivote', 'ZK2ayh', 0, 0, '2023-03-15 19:34:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE322', 'TERESA', 'V', 'MOBILLA', 'tvmobilla@pup.edu.ph', 1, 'ivote', 'kHqAuv', 0, 0, '2023-03-15 19:35:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE323', 'ROGELIO', 'C', 'MOLINA JR', 'rcmolinajr@pup.edu.ph', 1, 'ivote', 'FfEZrn', 0, 0, '2023-03-15 19:35:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE324', 'LEONILA', 'A', 'DIONISIO', 'ladionisio@pup.edu.ph', 1, 'ivote', '6oldzS', 0, 0, '2023-03-15 19:36:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE325', 'THELMA', 'L', 'MONTANA', 'tlmontana@pup.edu.ph', 1, 'ivote', 'jGsYlJ', 0, 0, '2023-03-15 19:36:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE326', 'YOLANDA', 'T', 'MONTANCES', 'ytmontances@pup.edu.ph', 1, 'ivote', 'OGcBng', 0, 0, '2023-03-15 19:36:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE327', 'JOHN MARK', 'S', 'DISTOR', 'jmsdistor@pup.edu.ph', 1, 'ivote', 'lLrO6J', 0, 0, '2023-03-15 19:37:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE328', 'KRISTEL JOY', 'R', 'DITA', 'kjrdita@pup.edu.ph', 1, 'ivote', 'SemCjA', 0, 0, '2023-03-15 19:38:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE329', 'GARY ANTONIO', 'C.', 'LIRIO', 'gaclinio@pup.edu.ph', 1, 'ivote', '6OQk1r', 0, 0, '2023-03-15 19:39:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE330', 'GARRY', 'V', 'MORFE', 'gvmorfe@pup.edu.ph', 1, 'ivote', 'XvRJgT', 0, 0, '2023-03-15 19:39:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE331', 'MARY ANN JOY', 'M', 'DIZON', 'majmdizon@pup.edu.ph', 1, 'ivote', '50VnzA', 0, 0, '2023-03-15 19:40:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE332', 'RICARDO', 'L', 'DIZON', 'rldizon@pup.edu.ph', 1, 'ivote', '93Skzn', 0, 0, '2023-03-15 19:41:39', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE333', 'ALVIN', 'S', 'MORGA', 'alsmorga@pup.edu.ph', 1, 'ivote', 'XMmupG', 0, 0, '2023-03-15 19:42:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE334', 'ROSEMARIEBETH', 'R', 'DIZON', 'rrdizon@pup.edu.ph', 1, 'ivote', 'Ius2Wi', 0, 0, '2023-03-15 19:42:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE335', 'MARIA GEMMA', 'T', 'MORGA', 'mgtmorga@pup.edu.ph', 1, 'ivote', 'itXE2h', 0, 0, '2023-03-15 19:42:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE336', 'DIVINA', 'M', 'MOROTA', 'dmmorota@pup.edu.ph', 1, 'ivote', 'oCp8Iz', 0, 0, '2023-03-15 19:43:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE337', 'SHERYL CINDY', 'L', 'MORTERA', 'sclmortera@pup.edu.ph', 1, 'ivote', 'D0ia4B', 0, 0, '2023-03-15 19:43:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE338', 'JOSELITO', 'D', 'DOMINGO', 'jddomingo@pup.edu.ph', 1, 'ivote', '4LvQjr', 0, 0, '2023-03-15 19:43:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE339', 'KLARIBEL', 'P', 'DOMINGO', 'kpdomingo@pup.edu.ph', 1, 'ivote', 'W9QelF', 0, 0, '2023-03-15 19:44:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE340', 'AVELINO', 'G', 'MUNGCAL', 'agmungcal@pup.edu.ph', 1, 'ivote', 'yvDYKA', 0, 0, '2023-03-15 20:16:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE341', 'MARIA RUTH', 'M', 'MUNGCAL', 'mrmmungcal@pup.edu.ph', 1, 'ivote', 'zX1T68', 0, 0, '2023-03-15 20:17:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE342', 'ALJON', 'G.', 'PADA', 'agpada@pup.edu.ph', 1, 'ivote', 'sF9J6P', 0, 0, '2023-03-15 20:18:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE343', 'JAY', 'A.', 'PADILLA ', 'japadilla@pup.edu.ph', 1, 'ivote', 'YPWlpb', 0, 0, '2023-03-15 20:18:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE344', 'JENNIFER', 'DG', 'MUNSAYAC', 'jdgmunsayac@pup.edu.ph', 1, 'ivote', 'bRmCTi', 0, 0, '2023-03-15 20:18:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE345', 'OCTAVIO', 'M.', 'PAGALILAWAN', 'ompagalilawan@pup.edu.ph', 1, 'ivote', 'cGmCIQ', 0, 0, '2023-03-15 20:19:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE346', 'JOEL', 'M', 'MUNSAYAC', 'jmmunsayac@pup.edu.ph', 1, 'ivote', '3dFhga', 0, 0, '2023-03-15 20:19:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE347', 'DYANARHA', 'Y', 'MUSNI', 'dymusni@pup.edu.ph', 1, 'ivote', 'NEYagd', 0, 0, '2023-03-15 20:20:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE348', 'JESCEL', 'D.', 'PAGUIO', 'jdpaguio@pup.edu.ph', 1, 'ivote', 'Ws27k9', 0, 0, '2023-03-15 20:20:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE349', 'ARIANNE NICOLE', 'S', 'NACHOR', 'ans.nachor@pup.edu.ph', 1, 'ivote', 'sOqw8k', 0, 0, '2023-03-15 20:21:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE350', 'ORLANDO', 'V.', 'PAJABERA', 'ovpajabera@pup.edu.ph', 1, 'ivote', 'dDq7pt', 0, 0, '2023-03-15 20:21:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE351', 'CHERRY', 'V', 'NADONGA', 'nadongavcherry@pup.edu.ph', 1, 'ivote', 'zBcsXa', 0, 0, '2023-03-15 20:21:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE352', 'NEZITAS', 'S.', 'PAJARES', 'nspajares@pup.edu.ph', 1, 'ivote', '9XlY38', 0, 0, '2023-03-15 20:21:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE353', 'CONWE JEME', 'I', 'NARIO', 'cjinario@pup.edu.ph', 1, 'ivote', 'WYle2n', 0, 0, '2023-03-15 20:22:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE354', 'ROBERTO', 'S.', 'PALILLO', 'rspalillo@pup.edu.ph', 1, 'ivote', 'WPlB0I', 0, 0, '2023-03-15 20:22:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE355', 'MECMACK', 'A', 'NARTEA', 'manartea@pup.edu.ph', 1, 'ivote', 'hgFO9n', 0, 0, '2023-03-15 20:23:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE356', 'REBECCA', 'E.', 'PALMA ', 'repalma@pup.edu.ph', 1, 'ivote', 'IkL0DG', 0, 0, '2023-03-15 20:23:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE357', 'SALVADOR', 'R', 'NATOC', 'srnatoc@pup.edu.ph', 1, 'ivote', 'wuE06C', 0, 0, '2023-03-15 20:23:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE358', 'VERENA', 'P', 'NATOC', 'vpnatoc@pup.edu.ph', 1, 'ivote', '6oz9EO', 0, 0, '2023-03-15 20:24:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE359', 'JESSIE', 'M.', 'PANGILINAN JR.', 'jmpangilinanjr@pup.edu.ph', 1, 'ivote', 's6ZdUQ', 0, 0, '2023-03-15 20:24:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE360', 'JOCELYN', 'C', 'NAVA', 'jcnava@pup.edu.ph', 1, 'ivote', 'Jcr8ZS', 0, 0, '2023-03-15 20:24:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE361', 'BERNADETTE', 'M.', 'PANIBIO', 'bmpanibio@pup.edu.ph', 1, 'ivote', 'AMRWEl', 0, 0, '2023-03-15 20:24:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE362', 'RAYMOND', 'E', 'NAVARRO', 'renavarro@pup.edu.ph', 1, 'ivote', 'NTQRGm', 0, 0, '2023-03-15 20:25:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE363', 'LOIDA ', 'I.', 'PARAMBITA ', 'liparambita@pup.edu.ph', 1, 'ivote', 'KnqVgA', 0, 0, '2023-03-15 20:25:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE364', 'RACHEL', 'E', 'NAYRE', 'ranayre@pup.edu.ph', 1, 'ivote', '0udzRn', 0, 0, '2023-03-15 20:25:35', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE365', 'EDWIN', 'M.', 'PARFAN', 'emparfan@pup.edu.ph', 1, 'ivote', 'qbl61d', 0, 0, '2023-03-15 20:25:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE366', 'JOHN MARK', 'N', 'NERO', 'jmnnero@pup.edu.ph', 1, 'ivote', 'MsifrL', 0, 0, '2023-03-15 20:26:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE367', 'JESSIE MHAR ', 'D.', 'PASUMBAL', 'jmdpasumbal@pup.edu.ph', 1, 'ivote', 'H5agMk', 0, 0, '2023-03-15 20:26:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE368', 'KATHERINE', 'M.', 'NOBLE', 'kmnoble@pup.edu.ph', 1, 'ivote', 'AqnBLP', 0, 0, '2023-03-15 20:26:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE369', 'PERLA ', 'B.', 'PATRIARCA', 'pbpatriarca@pup.edu.ph', 1, 'ivote', 'NICwLT', 0, 0, '2023-03-15 20:27:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE370', 'LIZA MARIE', 'B', 'NUEVO', 'lbnuevo@pup.edu.ph', 1, 'ivote', 'tN2Qwi', 0, 0, '2023-03-15 20:27:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE371', 'EVANGELINE', 'B', 'OBA', 'eboba@pup.edu.ph', 1, 'ivote', 'FNCbgM', 0, 0, '2023-03-15 20:27:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE372', 'CASIANA', 'S.', 'PAYUMO', 'cspayumo@pup.edu.ph', 1, 'ivote', 'fnLAhq', 0, 0, '2023-03-15 20:27:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE373', 'MAURA ', 'C.', 'PAZ', 'mcpaz@pup.edu.ph', 1, 'ivote', 'KlNm0k', 0, 0, '2023-03-15 20:28:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE374', 'ALDEN', 'O', 'OBUYES', 'aoobuyes@pup.edu.ph', 1, 'ivote', '2IgcNi', 0, 0, '2023-03-15 20:28:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE375', 'RAFAEL MICHAEL', 'O.', 'PAZ', 'rmo.paz@pup.edu.ph', 1, 'ivote', '1NtP3D', 0, 0, '2023-03-15 20:29:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE376', 'EVELYN', 'A', 'OCAMPO', 'eaocampo@pup.edu.ph', 1, 'ivote', 'arWmlE', 0, 0, '2023-03-15 20:29:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE377', 'RUTH', 'R', 'OCLIDA', 'rroclida@pup.edu.ph', 1, 'ivote', 'QzrBdb', 0, 0, '2023-03-15 20:29:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE378', 'GERRY', 'C.', 'PECASTOTE', 'gcpecastote@pup.edu.ph', 1, 'ivote', 'NpkDgO', 0, 0, '2023-03-15 20:29:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE379', 'GERLIE', 'C', 'OGATIS', 'gc.ogatis@pup.edu.ph', 1, 'ivote', 'PUr9ey', 0, 0, '2023-03-15 20:30:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE380', 'MICHAEL ', 'S.', 'PECHARDO', 'mspechardo@pup.edu.ph', 1, 'ivote', 'Y9tqlP', 0, 0, '2023-03-15 20:30:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE381', 'GRACE ', 'D.', 'PEDIONGCO', 'gdpediongco@pup.edu.ph', 1, 'ivote', 'e7EFlj', 0, 0, '2023-03-15 20:30:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE382', 'RIZELLE-ARLYN', 'A', 'OLEGARIO', 'raaolegario@pup.edu.ph', 1, 'ivote', '0nFQM7', 0, 0, '2023-03-15 20:31:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE383', 'EMERITO', 'D.', 'PEDRENA ', 'edpedrena@pup.edu.ph', 1, 'ivote', 'RWv0p5', 0, 0, '2023-03-15 20:32:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE384', 'MARIO', 'S.', 'PELAGIO', 'mspelagio@pup.edu.ph', 1, 'ivote', 'R89etu', 0, 0, '2023-03-15 20:32:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE385', 'MICHAEL', 'B.', 'PELAGIO', 'mikespelagio@pup.edu.ph', 1, 'ivote', 'SDrXma', 0, 0, '2023-03-15 20:33:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE386', 'AIRA JEAN', 'B', 'OLIVAR', 'ajbolivar@pup.edu.ph', 1, 'ivote', 'Vjg7hv', 0, 0, '2023-03-15 20:33:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE387', 'SUSANA', 'V.', 'PELAGIO', 'svpelagio@pup.edu.ph', 1, 'ivote', 'lswN70', 0, 0, '2023-03-15 20:33:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE388', 'ANNIE', 'B', 'OLIVAR', 'abolivar@pup.edu.ph', 1, 'ivote', 'kPiBsD', 0, 0, '2023-03-15 20:34:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE389', 'FLORA ', 'F.', 'PELAYO', 'ffpelayo@pup.edu.ph', 1, 'ivote', 'R0VKJO', 0, 0, '2023-03-15 20:34:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE390', 'THERESE MARIE', 'A', 'OLIVER', 'tmaoliver@pup.edu.ph', 1, 'ivote', '8nT3F2', 0, 0, '2023-03-15 20:34:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE391', 'FRANCIA ', 'P.', 'PENAFLOR ', 'fppenaflor@pup.edu.ph', 1, 'ivote', 'Rp289B', 0, 0, '2023-03-15 20:35:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE392', 'ORLANDO', 'L', 'OLIVERIO JR.', 'ololiveriojr@pup.edu.ph', 1, 'ivote', 'gTCbFI', 0, 0, '2023-03-15 20:35:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE393', 'EDITHA ', 'A.', 'PERALTA ', 'eaperalta@pup.edu.ph', 1, 'ivote', 'FG83YZ', 0, 0, '2023-03-15 20:35:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE394', 'ARTURO', 'F.', 'PEREZ', 'afperez@pup.edu.ph', 1, 'ivote', 'GIupNT', 0, 0, '2023-03-15 20:36:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE395', 'MA. LUISA', 'U', 'OLIVEROS', 'mluoliveros@pup.edu.ph', 1, 'ivote', '6a7VNu', 0, 0, '2023-03-15 20:36:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE396', 'CARMELA ', 'S', 'PEREZ', 'casperez@pup.edu.ph', 1, 'ivote', '9g7Gnw', 0, 0, '2023-03-15 20:36:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE397', 'HAYDEE', 'B', 'OPINA', 'hbopina@pup.edu.ph', 1, 'ivote', 'nvjT6G', 0, 0, '2023-03-15 20:36:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE398', 'EMETERIA LEONILA ', 'A.', 'PEREZ', 'elaperez@pup.edu.ph', 1, 'ivote', 'SM6Bot', 0, 0, '2023-03-15 20:37:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE399', 'FLORINDA', 'H', 'OQUINDO', 'fhoquindo@pup.edu.ph', 1, 'ivote', '49epNr', 0, 0, '2023-03-15 20:37:39', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE400', 'HECTOR ', 'M.', 'PEREZ', 'hmperez@pup.edu.ph', 1, 'ivote', 'm07iho', 0, 0, '2023-03-15 20:37:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE401', 'CHRISTIAN', 'G', 'ORDANEL', 'cgordanel@pup.edu.ph', 1, 'ivote', 'tuorCe', 0, 0, '2023-03-15 20:38:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE402', 'VER JOHN', 'P.', 'PIA ', 'vjppia@pup.edu.ph', 1, 'ivote', 'C61fpe', 0, 0, '2023-03-15 20:38:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE403', 'NICK', 'J', 'OSORIO', 'njosorio@pup.edu.ph', 1, 'ivote', 'gdtHzZ', 0, 0, '2023-03-15 20:38:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE404', 'CRISTALINA', 'R.', 'PIERS', 'crpiers@pup.edu.ph', 1, 'ivote', 'PiMaRX', 0, 0, '2023-03-15 20:38:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE405', 'RONELDA', 'C', 'PAAT', 'rcpaat@pup.edu.ph', 1, 'ivote', 'D29CNk', 0, 0, '2023-03-15 20:39:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE406', 'ROLANDO', 'B', 'DOROMAL', 'rbdoromal@pup.edu.ph', 1, 'ivote', 'eKuo7a', 0, 0, '2023-03-15 20:39:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE407', 'CHERRY GRACE', 'B.', 'PIGON', 'cgbpigon@pup.edu.ph', 1, 'ivote', 'QkMtbV', 0, 0, '2023-03-15 20:39:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE408', 'MARIA CHRISTINA', 'M', 'PACIS', 'mcmpacis@pup.edu.ph', 1, 'ivote', 'NdJf0l', 0, 0, '2023-03-15 20:39:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE409', 'MARK CHRISTIAN', '', 'CATAPANG', 'mccatapang@pup.edu.ph', 1, 'ivote', 'Y9fWzE', 0, 0, '2023-03-15 20:39:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE410', 'JOEY', 'S.', 'PINALAS', 'jspinalas@pup.edu.ph', 1, 'ivote', '6QT40f', 0, 0, '2023-03-15 20:40:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE411', 'OLIVER', 'A', 'DUEZA', 'oadueza@pup.edu.ph', 1, 'ivote', 'Z4dBp0', 0, 0, '2023-03-15 20:40:34', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE412', 'PINLAC', 'P.', 'ROSALIA ', 'rppinlac@pup.edu.ph', 1, 'ivote', 'N0crJO', 0, 0, '2023-03-15 20:40:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE413', 'ERWIN', 'A', 'DUNGAO', 'eadungao@pup.edu.ph', 1, 'ivote', 'K5nw97', 0, 0, '2023-03-15 20:41:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE414', 'ANTONIO', 'B.', 'POLICARPIO', 'abpolicarpio@pup.edu.ph', 1, 'ivote', 'yFa7dD', 0, 0, '2023-03-15 20:41:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE415', 'JOCELYN', 'E.', 'PONCE', 'jeponce@pup.edu.ph', 1, 'ivote', 'MU0Ju8', 0, 0, '2023-03-15 20:42:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE416', 'MARY GRACE', 'T', 'DUNGCA', 'mgtdungca@pup.edu.ph', 1, 'ivote', 'WXPLdD', 0, 0, '2023-03-15 20:42:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE417', 'JOVIT', 'S.', 'PONON', 'jsponon@pup.edu.ph', 1, 'ivote', 'CJeVH9', 0, 0, '2023-03-15 20:42:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE418', 'MA. FLORA MAY', 'S.', 'PORCIUNCULA', 'mfmsporciuncula@pup.edu.ph', 1, 'ivote', 'wHC06b', 0, 0, '2023-03-15 20:43:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE419', 'CHRISTOPHER IAN', 'P', 'EGAR', 'cipegar@pup.edu.ph', 1, 'ivote', 'jw3udq', 0, 0, '2023-03-15 20:43:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE420', 'ELENITA ', 'R.', 'PORTEZ', 'erportez@pup.edu.ph', 1, 'ivote', 'PghmaR', 0, 0, '2023-03-15 20:43:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE421', 'ORWEN', 'E', 'ELUMIR', 'oeelumir@pup.edu.ph', 1, 'ivote', 'gopxGl', 0, 0, '2023-03-15 20:43:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE422', 'ALEXANDER', 'B.', 'PRUDENTE JR.', 'abprudentejr@pup.edu.ph', 1, 'ivote', 'VB7b16', 0, 0, '2023-03-15 20:44:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE423', 'GLENDA', 'D', 'SALORSANO', 'gdsalorsano@pup.edu.ph', 1, 'ivote', 'YIhEvL', 0, 0, '2023-03-15 20:45:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE424', 'DANTE ', 'A.', 'PRUDENTE JR.', 'daprudente@pup.edu.ph', 1, 'ivote', 'Iq0JgE', 0, 0, '2023-03-15 20:45:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE425', 'JUAN ', 'L.', 'PUBILCO JR.', 'jlpublicojr@pup.edu.ph', 1, 'ivote', 'tOSe3g', 0, 0, '2023-03-15 20:45:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE426', 'HILDA', 'F', 'SAN GABRIEL', 'hfsangabriel@pup.edu.ph', 1, 'ivote', 'iKogOq', 0, 0, '2023-03-15 20:46:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE427', 'JESSIE', 'I.', 'QUIERREZ', 'jiquierrez@pup.edu.ph', 1, 'ivote', '8MDkGP', 0, 0, '2023-03-15 20:46:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE429', 'ANA LIZA', 'H', 'SANCHEZ', 'alhsanchez@pup.edu.ph', 1, 'ivote', 'jr9aEL', 0, 0, '2023-03-15 20:47:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE430', 'EMELITA', 'T.', 'QUILINGAN', 'etquilingan@pup.edu.ph', 1, 'ivote', 'n70oEC', 0, 0, '2023-03-15 20:48:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE431', 'GEORGIA', 'B', 'SANGGALANG', 'gbsanggalang@pup.edu.ph', 1, 'ivote', 'kOwSTY', 0, 0, '2023-03-15 20:48:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE432', 'JOANNE JOY', 'M', 'SANTIAGO', 'jjmsantiago@pup.edu.ph', 1, 'ivote', 'kv1weI', 0, 0, '2023-03-15 20:49:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE433', 'RODRIGO', 'R.', 'QUILINGAN ', 'rodrquilingan@pup.edu.ph', 1, 'ivote', 'iGRjsk', 0, 0, '2023-03-15 20:49:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE434', 'SAMUEL', 'S', 'SANTIAGO', 'sssantiago@pup.edu.ph', 1, 'ivote', 'QPNqur', 0, 0, '2023-03-15 20:50:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE435', 'MARY ANN', 'G.', 'QUINANTE', 'magquinante@pup.edu.ph', 1, 'ivote', 'cMGC0D', 0, 0, '2023-03-15 20:50:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE436', 'ALMA', 'S', 'SANTOS', 'assantos@pup.edu.ph', 1, 'ivote', 'gT1NYf', 0, 0, '2023-03-15 20:50:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE437', 'ROLANDO', 'P.', 'QUINONES', 'rpquinones@pup.edu.ph', 1, 'ivote', '98fhUH', 0, 0, '2023-03-15 20:50:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE438', 'HERME', 'L', 'SANTOS', 'hlsantos@pup.edu.ph', 1, 'ivote', 'eMUTHP', 0, 0, '2023-03-15 20:51:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE439', 'MILAGROS', 'A', 'SANTOS', 'masantos@pup.edu.ph', 1, 'ivote', 'KDg9BP', 0, 0, '2023-03-15 20:52:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE440', 'NIÑO INOCENCIO', 'A', 'SANTOS', 'niasantos@pup.edu.ph', 1, 'ivote', 'Rr5Njv', 0, 0, '2023-03-15 20:53:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE441', 'JOSE', 'D', 'SARMIENTO', 'jdsarmiento@pup.edu.ph', 1, 'ivote', 'dMOjLn', 0, 0, '2023-03-15 20:54:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE442', 'VIOLETH', 'H', 'SARMIENTO', 'vhsarmiento@pup.edu.ph', 1, 'ivote', 'kJb5LH', 0, 0, '2023-03-15 20:55:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE443', 'ADAM', 'V.', 'RAMILO', 'avramilo@pup.edu.ph', 1, 'ivote', 'fo2VMi', 0, 0, '2023-03-15 20:55:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE444', 'JUAN AUGUSTO', 'C.', 'RAMIREZ', 'jacramirez@pup.edu.ph', 1, 'ivote', '8QGXbU', 0, 0, '2023-03-15 20:55:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE445', 'MONICA', 'C', 'SARRONDO', 'mcsarrondo@pup.edu.ph', 1, 'ivote', 'UwEWqf', 0, 0, '2023-03-15 20:55:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE446', 'BARSILISA ', 'B.', 'RAMISCAL', 'bbramiscal@pup.edu.ph', 1, 'ivote', 'CsTj0b', 0, 0, '2023-03-15 20:56:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE447', 'JENNIFER', 'C', 'SAULO', 'jcsaulo@pup.edu.ph', 1, 'ivote', 'uefkrW', 0, 0, '2023-03-15 20:56:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE448', 'RICARDO', 'F.', 'RAMISCAL', 'rframiscal@pup.edu.ph', 1, 'ivote', '0j3do4', 0, 0, '2023-03-15 20:57:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE450', 'CYRIL', 'E.', 'RAMOS ', 'ceramos@pup.edu.ph', 1, 'ivote', 'JHlkCB', 0, 0, '2023-03-15 20:58:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE451', 'EDWIN', 'P', 'SEDILLA', 'epsedilla@pup.edu.ph', 1, 'ivote', 'xwka2Q', 0, 0, '2023-03-15 20:58:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE452', 'JANETH', 'H.', 'RAMOS ', 'jhramos@pup.edu.ph', 1, 'ivote', 'Vt5QC1', 0, 0, '2023-03-15 20:58:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE453', 'NINA', 'A', 'SISON', 'nasison@pup.edu.ph', 1, 'ivote', 'YuJlhS', 0, 0, '2023-03-15 20:59:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE454', 'MAURICIO', 'L.', 'RASOLA ', 'mlrasola@pup.edu.ph', 1, 'ivote', 'SWBicO', 0, 0, '2023-03-15 20:59:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE455', 'SIXER', 'A', 'SITJAR', 'sasitjar@pup.edu.ph', 1, 'ivote', 'zRG7W2', 0, 0, '2023-03-15 20:59:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE456', 'VIOLETA', 'L.', 'RATCHO', 'vlratcho@pup.edu.ph', 1, 'ivote', 'rZRg7Q', 0, 0, '2023-03-15 20:59:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE457', 'MARY GRACE', 'S.', 'REAMBILLO', 'mgsreambillo@pup.edu.ph', 1, 'ivote', 'U2f7Rm', 0, 0, '2023-03-15 21:00:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE458', 'MA. CORAZON', 'N', 'SOLANO', 'mcnsolano@pup.edu.ph', 1, 'ivote', '1M0VjG', 0, 0, '2023-03-15 21:00:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE459', 'ROSE ANN', 'L.', 'REANO', 'ralreano@pup.edu.ph', 1, 'ivote', 'ILoXmS', 0, 0, '2023-03-15 21:01:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE460', 'REYNALDO', 'A', 'SOLANO', 'rasolano@pup.edu.ph', 1, 'ivote', 'ujn7sM', 0, 0, '2023-03-15 21:01:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE461', 'ADOLFO MARTIN', 'O', 'SOLIMAN', 'amosoliman@pup.edu.ph', 1, 'ivote', 'QW0Hc6', 0, 0, '2023-03-15 21:02:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE462', 'LIZYL', 'R.', 'REBUSQUILLO', 'lrrebusquillo@pup.edu.ph', 1, 'ivote', 'bANP06', 0, 0, '2023-03-15 21:02:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE463', 'ELISA', 'A', 'SOLIVEN', 'easoliven@pup.edu.ph', 1, 'ivote', 'Xqkvxp', 0, 0, '2023-03-15 21:02:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE464', 'TEODOLFO', 'Q.', 'REDILLAS', 'tqredillas@pup.edu.ph', 1, 'ivote', 'mSzxKv', 0, 0, '2023-03-15 21:03:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE465', 'ARNEL', 'O.', 'RENDON ', 'aorendn@pup.edu.ph', 1, 'ivote', 'OV5jvS', 0, 0, '2023-03-15 21:03:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE466', 'MA. JOEPE ', 'A', 'SOLOSA', 'mjasolosa@pup.edu.ph', 1, 'ivote', 'pu1sL5', 0, 0, '2023-03-15 21:03:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE467', 'LEOMAR', 'P.', 'REQUEJO', 'lprequejo@pup.edu.ph', 1, 'ivote', 'LkzYef', 0, 0, '2023-03-15 21:04:39', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE468', 'PERRY DAVID', 'L', 'SOLOSA', 'pdlsolosa@pup.edu.ph', 1, 'ivote', 'JFRDLG', 0, 0, '2023-03-15 21:04:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE469', 'RAYAN', 'C', 'SORIANO', 'rcsoriano@pup.edu.ph', 1, 'ivote', 'd1GbR0', 0, 0, '2023-03-15 21:05:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE470', 'AYREENLEE', 'E.', 'RESUS ', 'aeresus@pup.edu.ph', 1, 'ivote', 'lyQChg', 0, 0, '2023-03-15 21:05:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE471', 'GREGORIO', 'A.', 'REYES ', 'gareyes@pup.edu.ph', 1, 'ivote', 'sMZIpV', 0, 0, '2023-03-15 21:05:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE472', 'RUEL', 'A', 'SORIANO', 'rasoriano@pup.edu.ph', 1, 'ivote', 'PiOHB7', 0, 0, '2023-03-15 21:06:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE473', 'JERIELYN', 'V.', 'REYES ', 'jvreyes@pup.edu.ph', 1, 'ivote', 'gU9qk3', 0, 0, '2023-03-15 21:06:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE474', 'CATHERINE', 'D', 'SOTTO', 'cdsotto@pup.edu.ph', 1, 'ivote', 'CAiaRe', 0, 0, '2023-03-15 21:06:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE475', 'JINKY ', 'D.', 'REYES ', 'jdreyes@pup.edu.ph', 1, 'ivote', '4zQLZf', 0, 0, '2023-03-15 21:06:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE476', 'ROSA', 'M', 'STA.MARIA', 'rmstamaria@pup.edu.ph', 1, 'ivote', 'H5fNLb', 0, 0, '2023-03-15 21:07:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE477', 'MAGDALENA ', 'S.', 'REYES ', 'msreyes@pup.edu.ph', 1, 'ivote', '7CZzaS', 0, 0, '2023-03-15 21:07:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE478', 'PORTIA MARGARITA ', 'R.', 'REYES ', 'pmrreyes@pup.edu.ph', 1, 'ivote', 'uYxqof', 0, 0, '2023-03-15 21:07:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE479', 'CONCEPCION', 'R', 'SUMADSAD', 'crsumadsad@pup.edu.ph', 1, 'ivote', 'e41LVH', 0, 0, '2023-03-15 21:08:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE480', 'RENE LAURENTE', 'G.', 'REYES ', 'rlgreyes@pup.edu.ph', 1, 'ivote', 'mao9qC', 0, 0, '2023-03-15 21:08:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE481', 'GEORGE', 'A.', 'RICO', 'garico@pup.edu.ph', 1, 'ivote', 'x40w6m', 0, 0, '2023-03-15 21:08:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE482', 'CAROLINE', 'T', 'SUMANDE', 'ctsumande@pup.edu.ph', 1, 'ivote', 'u5kWpo', 0, 0, '2023-03-15 21:09:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE483', 'JEFFERSON', 'B.', 'RIEGO', 'jbriego@pup.edu.ph', 1, 'ivote', '84r5Fk', 0, 0, '2023-03-15 21:09:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE484', 'JOCELLE ANNE', 'A', 'SUMPAY', 'jaasumpay@pup.edu.ph', 1, 'ivote', 'O9cx1J', 0, 0, '2023-03-15 21:09:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE485', 'ANDREA ROSE ', 'E.', 'RIMORIN', 'arerimorin@pup.edu.ph', 1, 'ivote', 'Ktda17', 0, 0, '2023-03-15 21:10:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE486', 'CANDICE SHEENA', 'E', 'TADEO', 'csetadeo@pup.edu.ph', 1, 'ivote', 'zHqckL', 0, 0, '2023-03-15 21:10:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE487', 'ROBERTO', 'S.', 'RIMORIN', 'rsrimorin@pup.edu.ph', 1, 'ivote', 'k1hBIN', 0, 0, '2023-03-15 21:10:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE488', 'REMEGIO', 'C.', 'RIOS ', 'rcrios@pup.edu.ph', 1, 'ivote', 'bT1iAh', 0, 0, '2023-03-15 21:11:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE489', 'PAUL JEROME', 'C', 'TADEO', 'pjctadeo@pup.edu.ph', 1, 'ivote', 'tIAzTG', 0, 0, '2023-03-15 21:11:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE490', 'JOSEFINA', 'R', 'TAN', 'jrtan@pup.edu.ph', 1, 'ivote', 'e7pdA6', 0, 0, '2023-03-15 21:11:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE491', 'JEAN MYREEN ', 'N.', 'RIVERA ', 'jmnrivera@pup.edu.ph', 1, 'ivote', '8PDpVv', 0, 0, '2023-03-15 21:11:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE493', 'JEFFRY ', 'V.', 'RIVERA ', 'jvrivera@pup.edu.ph', 1, 'ivote', 'BHWIi2', 0, 0, '2023-03-15 21:12:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE494', 'LULU', 'V.', 'RIVERA ', 'lvrivera@pup.edu.ph', 1, 'ivote', 'VTMFsQ', 0, 0, '2023-03-15 21:13:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE495', 'NEMIA', 'R', 'TANASAS', 'nrtanasas@pup.edu.ph', 1, 'ivote', '15FdUQ', 0, 0, '2023-03-15 21:13:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE496', 'EMELIE', 'D', 'TATON', 'edtaton@pup.edu.ph', 1, 'ivote', 'ic1rtx', 0, 0, '2023-03-15 21:13:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE497', 'ARNOLD ', 'O.', 'RODRIGUEZ', 'aorodriguez@pup.edu.ph', 1, 'ivote', 'vXt7hR', 0, 0, '2023-03-15 21:14:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE498', 'ROBERTITO', 'S.', 'ROQUE', 'rsroque@pup.edu.ph', 1, 'ivote', 'Cp6iXS', 0, 0, '2023-03-15 21:14:34', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE499', 'PEDERITO', 'M', 'TENERIFE JR.', 'pmtenerifejr@pup.edu.ph', 1, 'ivote', 'qlcFrp', 0, 0, '2023-03-15 21:14:39', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE501', 'AMALIA ', 'C.', 'ROSALES ', 'acrosales@pup.edu.ph', 1, 'ivote', 'I7uKLl', 0, 0, '2023-03-15 21:15:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE502', 'MA. GAY', 'M', 'TEOPENGCO', 'mgmteopengco@pup.edu.ph', 1, 'ivote', '9prbF8', 0, 0, '2023-03-15 21:16:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE503', 'MARIA JUNITHESMER ', 'D.', 'ROSALES', 'mjdrosales@pup.edu.ph', 1, 'ivote', 'eKJzrt', 0, 0, '2023-03-15 21:16:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE504', 'FREDDIE', 'L', 'TESTA', 'fltesta@pup.edu.ph', 1, 'ivote', 'ylUR02', 0, 0, '2023-03-15 21:16:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE505', 'SANTOS', 'C.', 'ROSTATA', 'scrostata@pup.edu.ph', 1, 'ivote', '8dl0qy', 0, 0, '2023-03-15 21:16:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE506', 'ERNESTINA ', 'M.', 'ROXAS', 'emroxas@pup.edu.ph', 1, 'ivote', 'X1Hrlb', 0, 0, '2023-03-15 21:17:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE507', 'MARC ERICK VON', 'A', 'TIOSING', 'mevatiosing@pup.edu.ph', 1, 'ivote', 'N3XCH5', 0, 0, '2023-03-15 21:17:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE508', 'ROBERTO', 'H.', 'ROZON ', 'rhrozon@pup.edu.ph', 1, 'ivote', '1unoDh', 0, 0, '2023-03-15 21:17:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE509', 'FELIMON', 'T.', 'RUBIANO JR.', 'ftrubianojr@pup.edu.ph', 1, 'ivote', 'Qg0MFb', 0, 0, '2023-03-15 21:18:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE510', 'FLORENDO', 'C', 'TOBIAS JR', 'fctobiasjr@pup.edu.ph', 1, 'ivote', 'mI9zGL', 0, 0, '2023-03-15 21:18:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE511', 'FRESCIAN', 'C.', 'RUIZ', 'fcruiz@pup.edu.ph', 1, 'ivote', 'm6DLGi', 0, 0, '2023-03-15 21:18:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE512', 'RIA ', 'A.', 'SAGUM', 'rasagum@pup.edu.ph', 1, 'ivote', 'z3h27T', 0, 0, '2023-03-15 21:19:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE513', 'APOLINAR JULIUS', 'E', 'TOLENTINO', 'ajetolentino@pup.edu.ph', 1, 'ivote', 'Gtcgnd', 0, 0, '2023-03-15 21:19:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE514', 'OFELIA ', 'D.', 'SALAMATIN ', 'odsalamatin@pup.edu.ph', 1, 'ivote', 'AYPBvx', 0, 0, '2023-03-15 21:20:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE515', 'LUISITO', 'B', 'TOLENTINO', 'lbtolentino@pup.edu.ph', 1, 'ivote', 'aokiES', 0, 0, '2023-03-15 21:20:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE516', 'KIM WILBERT ', 'G.', 'SALANDAANAN ', 'kwgsalandaanan@pup.edu.ph', 1, 'ivote', '8hlBpQ', 0, 0, '2023-03-15 21:20:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE517', 'MYLA ', 'D.', 'SALCEDO ', 'mdsalcedo@pup.edu.ph', 1, 'ivote', 'Cf5g0l', 0, 0, '2023-03-15 21:21:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE518', 'ARMANDO', 'A', 'TORRES', 'aatorres@pup.edu.ph', 1, 'ivote', 'y8tghU', 0, 0, '2023-03-15 21:21:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE519', 'AURELUZ', 'L', 'TORRES', 'altorres@pup.edu.ph', 1, 'ivote', 'V1cvAq', 0, 0, '2023-03-15 21:22:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE520', 'BENEVER', 'A.', 'SALVADOR', 'basalvador@pup.edu.ph', 1, 'ivote', 'E3aHge', 0, 0, '2023-03-15 21:22:34', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE521', 'BENJAMIN', 'M', 'TORRES', 'bmtorres@pup.edu.ph', 1, 'ivote', 'iAutBk', 0, 0, '2023-03-15 21:22:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE522', 'MERCEDES', 'R.', 'SALVADOR', 'mrsalvador@pup.edu.ph', 1, 'ivote', 'Z4H29z', 0, 0, '2023-03-15 21:23:35', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE523', 'TIRSOLITO ', 'C.', 'SALVADOR ', 'tcsalvdor@pup.edu.ph', 1, 'ivote', 'OxcVjR', 0, 0, '2023-03-15 21:24:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE524', 'KAREN', 'G.', 'SAN DIEGO', 'kgsandiego@pup.edu.ph', 1, 'ivote', 'hunq1H', 0, 0, '2023-03-15 21:25:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE525', 'MA.RACHEL', 'C', 'TORRES', 'mrctorres@pup.edu.ph', 1, 'ivote', 'MXaEv0', 0, 0, '2023-03-15 21:25:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE526', 'MARSHARIE CEL', 'D', 'TORRES', 'mcdtorres@pup.edu.ph', 1, 'ivote', 'imrOSc', 0, 0, '2023-03-15 21:26:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE527', 'ARIEL', 'P', 'TUAZON', 'aptuazon@pup.edu.ph', 1, 'ivote', 'Hls6wT', 0, 0, '2023-03-15 21:37:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE528', 'ENGELBERT', 'S', 'TUNO', 'estuno@pup.edu.ph', 1, 'ivote', 'rIl6d2', 0, 0, '2023-03-15 21:38:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE529', 'VILMA', 'S', 'TUNO', 'vstuno@pup.edu.ph', 1, 'ivote', 'tCDwPA', 0, 0, '2023-03-15 21:38:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE530', 'ROSARIO', 'G', 'TURINGAN', 'rgturingan@pup.edu.ph', 1, 'ivote', 'KOcXpk', 0, 0, '2023-03-15 21:39:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE531', 'ANALYN', 'L', 'UBA', 'aluba@pup.edu.ph', 1, 'ivote', 'pOeDYQ', 0, 0, '2023-03-15 21:40:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE532', 'GRACE', 'C', 'UDAUNDO', 'gcudaundo@pup.edu.ph', 1, 'ivote', '6FKxV4', 0, 0, '2023-03-15 21:40:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE533', 'ANTONIUS', 'C', 'UMALI', 'acumali@pup.edu.ph', 1, 'ivote', 'qjVoNa', 0, 0, '2023-03-15 21:41:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE534', 'EDUAEL', 'G', 'USAL', 'egusal@pup.edu.ph', 1, 'ivote', 'zTtNLE', 0, 0, '2023-03-15 21:41:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE535', 'MARY GRACE', 'A', 'UYAP', 'mgauyap@pup.edu.ph', 1, 'ivote', 'tureYO', 0, 0, '2023-03-15 21:41:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE536', 'EILEEN JOY', 'M', 'VALIENTE', 'ejmmalubay@pup.edu.ph', 1, 'ivote', '0K5ELt', 0, 0, '2023-03-15 21:42:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE537', 'CONCEPCION', 'M', 'VEDASTO', 'cmvedasto@pup.edu.ph', 1, 'ivote', 'lidELy', 0, 0, '2023-03-15 21:42:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE538', 'ANTONIO', 'Y', 'VELASCO', 'ayvelasco@pup.edu.ph', 1, 'ivote', 'GZnSjs', 0, 0, '2023-03-15 21:43:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE539', 'MARIENEL', 'N', 'VELASCO', 'mnvelasco@pup.edu.ph', 1, 'ivote', 'xkXRg0', 0, 0, '2023-03-15 21:43:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE540', 'RAMONCITO', 'C', 'VENAL', 'rcvenal@pup.edu.ph', 1, 'ivote', 'rUOBwp', 0, 0, '2023-03-15 21:44:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE541', 'LIZBETTE', 'R', 'VERGARA', 'lrvergara@pup.edu.ph', 1, 'ivote', 'V3eCtY', 0, 0, '2023-03-15 21:44:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE542', 'AMOR', 'C', 'VICTORIO', 'acvictorio@pup.edu.ph', 1, 'ivote', 'MhxI1n', 0, 0, '2023-03-15 21:44:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE543', 'EUGIE', 'N', 'VICTORIO', 'envictoria@pup.edu.ph', 1, 'ivote', '0dNYPz', 0, 0, '2023-03-15 21:45:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE544', 'FREDERICK', 'M', 'VILLAMOR', 'fmvillamor@pup.edu.ph', 1, 'ivote', 'zLORWB', 0, 0, '2023-03-15 21:45:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE545', 'FERDINAND', 'S', 'VILLANUEVA', 'fsvillanueva@pup.edu.ph', 1, 'ivote', 'nmI9sE', 0, 0, '2023-03-15 21:46:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE546', 'ANGELITA', 'S', 'VILLARUEL', 'asvillaruel@pup.edu.ph', 1, 'ivote', 'icYKLU', 0, 0, '2023-03-15 21:46:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE547', 'JOHN CARLO', 'H', 'VILLEGAS', 'jchvillegas@pup.edu.ph', 1, 'ivote', 'YCTZf9', 0, 0, '2023-03-15 21:47:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE548', 'MAY ROSE', 'M', 'VILLEGAS', 'mrmvillegas@pup.edu.ph', 1, 'ivote', 'tXoOPD', 0, 0, '2023-03-15 21:47:34', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE549', 'JHUNEL', 'G', 'VINARAO', 'jgvinarao@pup.edu.ph', 1, 'ivote', 'pnPV0g', 0, 0, '2023-03-15 21:47:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE550', 'ANN-LYN', 'O', 'VINUYA', 'alovinuya@pup.edu.ph', 1, 'ivote', 'Mq0NKo', 0, 0, '2023-03-15 21:48:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE551', 'JOSEPH REYLAN', 'B', 'VIRAY', 'jrbviray@pup.edu.ph', 1, 'ivote', 'yAHZD6', 0, 0, '2023-03-15 21:48:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE552', 'KRIZTINE', 'R', 'VIRAY', 'kr.viray@pup.edu.ph', 1, 'ivote', 'c5WG83', 0, 0, '2023-03-15 21:49:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE553', 'ROLAND', 'C', 'VIRAY', 'rcviray@pup.edu.ph', 1, 'ivote', '2DljQb', 0, 0, '2023-03-15 21:49:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE554', 'FRANCISCA', 'C', 'VISCAYA', 'fcviscaya@pup.edu.ph', 1, 'ivote', 'uQDJbx', 0, 0, '2023-03-15 21:49:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE555', 'HAZEL MARIE', 'M', 'VITALES', 'hmmmvitales@pup.edu.ph', 1, 'ivote', 'wyXBNZ', 0, 0, '2023-03-15 21:50:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE556', 'LOIDA', 'A', 'YACAT', 'layacat@pup.edu.ph', 1, 'ivote', 'hGbxFm', 0, 0, '2023-03-15 21:50:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE557', 'BENJAMIN', 'T', 'YAMSON JR', 'btyamsonjr@pup.edu.ph', 1, 'ivote', 'Wz0hLP', 0, 0, '2023-03-15 21:51:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE558', 'MA.LIZA', 'T', 'YANES', 'mltyanes@pup.edu.ph', 1, 'ivote', 'TfFBKU', 0, 0, '2023-03-15 21:51:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE559', 'MARY GRACE', 'F', 'YEBRA', 'mglferreryebra@pup.edu.ph', 1, 'ivote', 'cX1kNE', 0, 0, '2023-03-15 21:52:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE560', 'MARIA THERESA', 'M', 'ZAPANTA', 'mtmzapanta@pup.edu.ph', 1, 'ivote', 'UVa7Qd', 0, 0, '2023-03-15 21:52:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE561', 'AILEEN', 'L', 'CAMBA', 'alcamba@pup.edu.ph', 1, 'ivote', 'oSsnuT', 0, 0, '2023-03-16 05:04:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CODE562', 'GLENN', 'V', 'DELA CUEVA', 'gvdelacueva@pup.edu.ph', 1, 'ivote', '9nz8Z2', 0, 0, '2023-03-16 05:06:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=567 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblmemberdetail`
--

INSERT INTO `tblmemberdetail` (`intMemDeId`, `strMemDeMemId`, `strMemDeFieldName`, `strMemDeFieldData`) VALUES
(1, 'CODE001', 'area', 'PUP'),
(2, 'CODE002', 'area', 'PUP'),
(3, 'CODE003', 'area', 'PUP'),
(4, 'CODE004', 'area', 'PUP'),
(5, 'CODE005', 'area', 'PUP'),
(6, 'CODE006', 'area', 'PUP'),
(7, 'CODE007', 'area', 'PUP'),
(9, 'CODE009', 'area', 'PUP'),
(10, 'CODE008', 'area', 'PUP'),
(11, 'CODE010', 'area', 'PUP'),
(12, 'CODE011', 'area', 'PUP'),
(13, 'CODE013', 'area', 'PUP'),
(14, 'CODE014', 'area', 'PUP'),
(15, 'CODE015', 'area', 'PUP'),
(16, 'CODE016', 'area', 'PUP'),
(17, 'CODE017', 'area', 'PUP'),
(18, 'CODE018', 'area', 'PUP'),
(19, 'CODE019', 'area', 'PUP'),
(20, 'CODE020', 'area', 'PUP'),
(21, 'CODE021', 'area', 'PUP'),
(22, 'CODE022', 'area', 'PUP'),
(23, 'CODE023', 'area', 'PUP'),
(24, 'CODE024', 'area', 'PUP'),
(25, 'CODE025', 'area', 'PUP'),
(26, 'CODE026', 'area', 'PUP'),
(27, 'CODE027', 'area', 'PUP'),
(28, 'CODE028', 'area', 'PUP'),
(29, 'CODE029', 'area', 'PUP'),
(30, 'CODE030', 'area', 'PUP'),
(31, 'CODE031', 'area', 'PUP'),
(32, 'CODE032', 'area', 'PUP'),
(33, 'CODE033', 'area', 'PUP'),
(34, 'CODE034', 'area', 'PUP'),
(36, 'CODE036', 'area', 'PUP'),
(37, 'CODE037', 'area', 'PUP'),
(38, 'CODE038', 'area', 'PUP'),
(39, 'CODE039', 'area', 'PUP'),
(40, 'CODE040', 'area', 'PUP'),
(41, 'CODE041', 'area', 'PUP'),
(42, 'CODE042', 'area', 'PUP'),
(43, 'CODE043', 'area', 'PUP'),
(44, 'CODE044', 'area', 'PUP'),
(45, 'CODE045', 'area', 'PUP'),
(46, 'CODE046', 'area', 'PUP'),
(47, 'CODE047', 'area', 'PUP'),
(48, 'CODE048', 'area', 'PUP'),
(49, 'CODE049', 'area', 'PUP'),
(50, 'CODE050', 'area', 'PUP'),
(51, 'CODE051', 'area', 'PUP'),
(52, 'CODE052', 'area', 'PUP'),
(53, 'CODE053', 'area', 'PUP'),
(54, 'CODE054', 'area', 'PUP'),
(55, 'CODE055', 'area', 'PUP'),
(56, 'CODE056', 'area', 'PUP'),
(57, 'CODE057', 'area', 'PUP'),
(58, 'CODE058', 'area', 'PUP'),
(59, 'CODE059', 'area', 'PUP'),
(60, 'CODE060', 'area', 'PUP'),
(61, 'CODE061', 'area', 'PUP'),
(62, 'CODE062', 'area', 'PUP'),
(63, 'CODE063', 'area', 'PUP'),
(64, 'CODE064', 'area', 'PUP'),
(65, 'CODE065', 'area', 'PUP'),
(66, 'CODE066', 'area', 'PUP'),
(67, 'CODE067', 'area', 'PUP'),
(68, 'CODE068', 'area', 'PUP'),
(69, 'CODE069', 'area', 'PUP'),
(70, 'CODE070', 'area', 'PUP'),
(72, 'CODE072', 'area', 'PUP'),
(73, 'CODE073', 'area', 'PUP'),
(74, 'CODE074', 'area', 'PUP'),
(75, 'CODE075', 'area', 'PUP'),
(76, 'CODE076', 'area', 'PUP'),
(77, 'CODE077', 'area', 'PUP'),
(78, 'CODE078', 'area', 'PUP'),
(79, 'CODE079', 'area', 'PUP'),
(80, 'CODE080', 'area', 'PUP'),
(81, 'CODE081', 'area', 'PUP'),
(82, 'CODE082', 'area', 'PUP'),
(83, 'CODE083', 'area', 'PUP'),
(84, 'CODE071', 'area', 'PUP'),
(85, 'CODE084', 'area', 'PUP'),
(86, 'CODE085', 'area', 'PUP'),
(87, 'CODE086', 'area', 'PUP'),
(88, 'CODE087', 'area', 'PUP'),
(89, 'CODE088', 'area', 'PUP'),
(90, 'CODE089', 'area', 'PUP'),
(91, 'CODE090', 'area', 'PUP'),
(92, 'CODE091', 'area', 'PUP'),
(93, 'CODE092', 'area', 'PUP'),
(94, 'CODE093', 'area', 'PUP'),
(95, 'CODE094', 'area', 'PUP'),
(96, 'CODE095', 'area', 'PUP'),
(97, 'CODE096', 'area', 'PUP'),
(98, 'CODE097', 'area', 'PUP'),
(99, 'CODE098', 'area', 'PUP'),
(100, 'CODE099', 'area', 'PUP'),
(101, 'CODE100', 'area', 'PUP'),
(102, 'CODE101', 'area', 'PUP'),
(103, 'CODE102', 'area', 'PUP'),
(104, 'CODE103', 'area', 'PUP'),
(105, 'CODE104', 'area', 'PUP'),
(106, 'CODE105', 'area', 'PUP'),
(107, 'CODE106', 'area', 'PUP'),
(108, 'CODE107', 'area', 'PUP'),
(109, 'CODE108', 'area', 'PUP'),
(110, 'CODE109', 'area', 'PUP'),
(111, 'CODE110', 'area', 'PUP'),
(112, 'CODE111', 'area', 'PUP'),
(113, 'CODE112', 'area', 'PUP'),
(114, 'CODE113', 'area', 'PUP'),
(115, 'CODE114', 'area', 'PUP'),
(116, 'CODE115', 'area', 'PUP'),
(117, 'CODE116', 'area', 'PUP'),
(118, 'CODE117', 'area', 'PUP'),
(119, 'CODE118', 'area', 'PUP'),
(120, 'CODE119', 'area', 'PUP'),
(121, 'CODE120', 'area', 'PUP'),
(122, 'CODE121', 'area', 'PUP'),
(123, 'CODE122', 'area', 'PUP'),
(124, 'CODE123', 'area', 'PUP'),
(125, 'CODE124', 'area', 'PUP'),
(126, 'CODE125', 'area', 'PUP'),
(127, 'CODE126', 'area', 'PUP'),
(128, 'CODE127', 'area', 'PUP'),
(129, 'CODE128', 'area', 'PUP'),
(130, 'CODE129', 'area', 'PUP'),
(131, 'CODE130', 'area', 'PUP'),
(132, 'CODE131', 'area', 'PUP'),
(133, 'CODE132', 'area', 'PUP'),
(134, 'CODE133', 'area', 'PUP'),
(135, 'CODE134', 'area', 'PUP'),
(136, 'CODE135', 'area', 'PUP'),
(137, 'CODE136', 'area', 'PUP'),
(138, 'CODE137', 'area', 'PUP'),
(139, 'CODE138', 'area', 'PUP'),
(140, 'CODE139', 'area', 'PUP'),
(141, 'CODE140', 'area', 'PUP'),
(142, 'CODE141', 'area', 'PUP'),
(143, 'CODE142', 'area', 'PUP'),
(144, 'CODE143', 'area', 'PUP'),
(145, 'CODE144', 'area', 'PUP'),
(146, 'CODE145', 'area', 'PUP'),
(147, 'CODE146', 'area', 'PUP'),
(148, 'CODE147', 'area', 'PUP'),
(149, 'CODE148', 'area', 'PUP'),
(150, 'CODE149', 'area', 'PUP'),
(151, 'CODE150', 'area', 'PUP'),
(152, 'CODE151', 'area', 'PUP'),
(153, 'CODE152', 'area', 'PUP'),
(154, 'CODE153', 'area', 'PUP'),
(155, 'CODE154', 'area', 'PUP'),
(156, 'CODE155', 'area', 'PUP'),
(157, 'CODE156', 'area', 'PUP'),
(158, 'CODE157', 'area', 'PUP'),
(159, 'CODE158', 'area', 'PUP'),
(160, 'CODE159', 'area', 'PUP'),
(161, 'CODE160', 'area', 'PUP'),
(162, 'CODE161', 'area', 'PUP'),
(163, 'CODE162', 'area', 'PUP'),
(164, 'CODE163', 'area', 'PUP'),
(165, 'CODE164', 'area', 'PUP'),
(166, 'CODE165', 'area', 'PUP'),
(167, 'CODE166', 'area', 'PUP'),
(168, 'CODE167', 'area', 'PUP'),
(169, 'CODE168', 'area', 'PUP'),
(170, 'CODE169', 'area', 'PUP'),
(171, 'CODE170', 'area', 'PUP'),
(172, 'CODE171', 'area', 'PUP'),
(173, 'CODE172', 'area', 'PUP'),
(174, 'CODE173', 'area', 'PUP'),
(175, 'CODE174', 'area', 'PUP'),
(176, 'CODE175', 'area', 'PUP'),
(177, 'CODE176', 'area', 'PUP'),
(178, 'CODE177', 'area', 'PUP'),
(179, 'CODE178', 'area', 'PUP'),
(180, 'CODE179', 'area', 'PUP'),
(181, 'CODE180', 'area', 'PUP'),
(182, 'CODE181', 'area', 'PUP'),
(183, 'CODE182', 'area', 'PUP'),
(184, 'CODE183', 'area', 'PUP'),
(185, 'CODE184', 'area', 'PUP'),
(186, 'CODE185', 'area', 'PUP'),
(187, 'CODE186', 'area', 'PUP'),
(188, 'CODE187', 'area', 'PUP'),
(189, 'CODE188', 'area', 'PUP'),
(190, 'CODE189', 'area', 'PUP'),
(191, 'CODE190', 'area', 'PUP'),
(192, 'CODE191', 'area', 'PUP'),
(193, 'CODE192', 'area', 'PUP'),
(194, 'CODE193', 'area', 'PUP'),
(195, 'CODE194', 'area', 'PUP'),
(196, 'CODE195', 'area', 'PUP'),
(197, 'CODE196', 'area', 'PUP'),
(198, 'CODE197', 'area', 'PUP'),
(199, 'CODE198', 'area', 'PUP'),
(200, 'CODE199', 'area', 'PUP'),
(201, 'CODE200', 'area', 'PUP'),
(202, 'CODE201', 'area', 'PUP'),
(203, 'CODE202', 'area', 'PUP'),
(204, 'CODE203', 'area', 'PUP'),
(205, 'CODE204', 'area', 'PUP'),
(206, 'CODE205', 'area', 'PUP'),
(207, 'CODE206', 'area', 'PUP'),
(208, 'CODE207', 'area', 'PUP'),
(210, 'CODE209', 'area', 'PUP'),
(211, 'CODE210', 'area', 'PUP'),
(212, 'CODE211', 'area', 'PUP'),
(213, 'CODE212', 'area', 'PUP'),
(214, 'CODE213', 'area', 'PUP'),
(215, 'CODE214', 'area', 'PUP'),
(216, 'CODE215', 'area', 'PUP'),
(217, 'CODE216', 'area', 'PUP'),
(218, 'CODE217', 'area', 'PUP'),
(219, 'CODE218', 'area', 'PUP'),
(220, 'CODE219', 'area', 'PUP'),
(221, 'CODE220', 'area', 'PUP'),
(222, 'CODE221', 'area', 'PUP'),
(224, 'CODE223', 'area', 'PUP'),
(225, 'CODE224', 'area', 'PUP'),
(226, 'CODE225', 'area', 'PUP'),
(228, 'CODE222', 'area', 'PUP'),
(229, 'CODE226', 'area', 'PUP'),
(230, 'CODE227', 'area', 'PUP'),
(231, 'CODE228', 'area', 'PUP'),
(232, 'CODE229', 'area', 'PUP'),
(233, 'CODE230', 'area', 'PUP'),
(234, 'CODE231', 'area', 'PUP'),
(235, 'CODE232', 'area', 'PUP'),
(236, 'CODE233', 'area', 'PUP'),
(237, 'CODE234', 'area', 'PUP'),
(238, 'CODE235', 'area', 'PUP'),
(239, 'CODE236', 'area', 'PUP'),
(240, 'CODE237', 'area', 'PUP'),
(241, 'CODE238', 'area', 'PUP'),
(242, 'CODE239', 'area', 'PUP'),
(243, 'CODE240', 'area', 'PUP'),
(244, 'CODE241', 'area', 'PUP'),
(245, 'CODE242', 'area', 'PUP'),
(246, 'CODE243', 'area', 'PUP'),
(247, 'CODE244', 'area', 'PUP'),
(248, 'CODE245', 'area', 'PUP'),
(249, 'CODE246', 'area', 'PUP'),
(250, 'CODE247', 'area', 'PUP'),
(251, 'CODE248', 'area', 'PUP'),
(252, 'CODE249', 'area', 'PUP'),
(253, 'CODE250', 'area', 'PUP'),
(254, 'CODE251', 'area', 'PUP'),
(255, 'CODE252', 'area', 'PUP'),
(256, 'CODE253', 'area', 'PUP'),
(257, 'CODE254', 'area', 'PUP'),
(258, 'CODE255', 'area', 'PUP'),
(259, 'CODE256', 'area', 'PUP'),
(260, 'CODE257', 'area', 'PUP'),
(261, 'CODE258', 'area', 'PUP'),
(262, 'CODE259', 'area', 'PUP'),
(263, 'CODE260', 'area', 'PUP'),
(264, 'CODE261', 'area', 'PUP'),
(265, 'CODE262', 'area', 'PUP'),
(266, 'CODE263', 'area', 'PUP'),
(267, 'CODE264', 'area', 'PUP'),
(268, 'CODE265', 'area', 'PUP'),
(269, 'CODE266', 'area', 'PUP'),
(270, 'CODE267', 'area', 'PUP'),
(271, 'CODE268', 'area', 'PUP'),
(272, 'CODE269', 'area', 'PUP'),
(273, 'CODE270', 'area', 'PUP'),
(274, 'CODE271', 'area', 'PUP'),
(275, 'CODE272', 'area', 'PUP'),
(276, 'CODE273', 'area', 'PUP'),
(277, 'CODE274', 'area', 'PUP'),
(278, 'CODE275', 'area', 'PUP'),
(279, 'CODE276', 'area', 'PUP'),
(280, 'CODE277', 'area', 'PUP'),
(281, 'CODE278', 'area', 'PUP'),
(282, 'CODE279', 'area', 'PUP'),
(283, 'CODE280', 'area', 'PUP'),
(284, 'CODE281', 'area', 'PUP'),
(285, 'CODE282', 'area', 'PUP'),
(286, 'CODE284', 'area', 'PUP'),
(287, 'CODE285', 'area', 'PUP'),
(288, 'CODE286', 'area', 'PUP'),
(289, 'CODE287', 'area', 'PUP'),
(290, 'CODE288', 'area', 'PUP'),
(291, 'CODE289', 'area', 'PUP'),
(292, 'CODE290', 'area', 'PUP'),
(293, 'CODE291', 'area', 'PUP'),
(294, 'CODE292', 'area', 'PUP'),
(295, 'CODE293', 'area', 'PUP'),
(296, 'CODE294', 'area', 'PUP'),
(297, 'CODE295', 'area', 'PUP'),
(298, 'CODE296', 'area', 'PUP'),
(299, 'CODE297', 'area', 'PUP'),
(300, 'CODE298', 'area', 'PUP'),
(301, 'CODE299', 'area', 'PUP'),
(302, 'CODE300', 'area', 'PUP'),
(303, 'CODE301', 'area', 'PUP'),
(304, 'CODE302', 'area', 'PUP'),
(305, 'CODE303', 'area', 'PUP'),
(306, 'CODE304', 'area', 'PUP'),
(307, 'CODE305', 'area', 'PUP'),
(308, 'CODE306', 'area', 'PUP'),
(309, 'CODE307', 'area', 'PUP'),
(310, 'CODE308', 'area', 'PUP'),
(311, 'CODE309', 'area', 'PUP'),
(312, 'CODE310', 'area', 'PUP'),
(313, 'CODE311', 'area', 'PUP'),
(314, 'CODE312', 'area', 'PUP'),
(315, 'CODE313', 'area', 'PUP'),
(316, 'CODE314', 'area', 'PUP'),
(317, 'CODE315', 'area', 'PUP'),
(318, 'CODE316', 'area', 'PUP'),
(319, 'CODE317', 'area', 'PUP'),
(320, 'CODE318', 'area', 'PUP'),
(321, 'CODE319', 'area', 'PUP'),
(322, 'CODE320', 'area', 'PUP'),
(323, 'CODE321', 'area', 'PUP'),
(324, 'CODE322', 'area', 'PUP'),
(325, 'CODE323', 'area', 'PUP'),
(326, 'CODE324', 'area', 'PUP'),
(327, 'CODE325', 'area', 'PUP'),
(328, 'CODE326', 'area', 'PUP'),
(329, 'CODE327', 'area', 'PUP'),
(330, 'CODE328', 'area', 'PUP'),
(331, 'CODE329', 'area', 'PUP'),
(332, 'CODE330', 'area', 'PUP'),
(333, 'CODE331', 'area', 'PUP'),
(334, 'CODE332', 'area', 'PUP'),
(335, 'CODE333', 'area', 'PUP'),
(336, 'CODE334', 'area', 'PUP'),
(337, 'CODE335', 'area', 'PUP'),
(338, 'CODE336', 'area', 'PUP'),
(339, 'CODE337', 'area', 'PUP'),
(340, 'CODE338', 'area', 'PUP'),
(341, 'CODE339', 'area', 'PUP'),
(343, 'CODE340', 'area', 'PUP'),
(344, 'CODE341', 'area', 'PUP'),
(345, 'CODE342', 'area', 'PUP'),
(346, 'CODE343', 'area', 'PUP'),
(347, 'CODE344', 'area', 'PUP'),
(348, 'CODE345', 'area', 'PUP'),
(349, 'CODE346', 'area', 'PUP'),
(350, 'CODE347', 'area', 'PUP'),
(351, 'CODE348', 'area', 'PUP'),
(352, 'CODE349', 'area', 'PUP'),
(353, 'CODE350', 'area', 'PUP'),
(354, 'CODE351', 'area', 'PUP'),
(355, 'CODE352', 'area', 'PUP'),
(356, 'CODE353', 'area', 'PUP'),
(357, 'CODE354', 'area', 'PUP'),
(358, 'CODE355', 'area', 'PUP'),
(359, 'CODE356', 'area', 'PUP'),
(360, 'CODE357', 'area', 'PUP'),
(361, 'CODE358', 'area', 'PUP'),
(362, 'CODE359', 'area', 'PUP'),
(363, 'CODE360', 'area', 'PUP'),
(364, 'CODE361', 'area', 'PUP'),
(365, 'CODE362', 'area', 'PUP'),
(366, 'CODE363', 'area', 'PUP'),
(367, 'CODE364', 'area', 'PUP'),
(368, 'CODE365', 'area', 'PUP'),
(369, 'CODE366', 'area', 'PUP'),
(370, 'CODE367', 'area', 'PUP'),
(371, 'CODE368', 'area', 'PUP'),
(372, 'CODE369', 'area', 'PUP'),
(373, 'CODE370', 'area', 'PUP'),
(374, 'CODE371', 'area', 'PUP'),
(375, 'CODE372', 'area', 'PUP'),
(376, 'CODE373', 'area', 'PUP'),
(377, 'CODE374', 'area', 'PUP'),
(378, 'CODE375', 'area', 'PUP'),
(379, 'CODE376', 'area', 'PUP'),
(380, 'CODE377', 'area', 'PUP'),
(381, 'CODE378', 'area', 'PUP'),
(382, 'CODE379', 'area', 'PUP'),
(383, 'CODE380', 'area', 'PUP'),
(384, 'CODE381', 'area', 'PUP'),
(385, 'CODE382', 'area', 'PUP'),
(386, 'CODE383', 'area', 'PUP'),
(387, 'CODE384', 'area', 'PUP'),
(388, 'CODE385', 'area', 'PUP'),
(389, 'CODE386', 'area', 'PUP'),
(390, 'CODE387', 'area', 'PUP'),
(391, 'CODE388', 'area', 'PUP'),
(392, 'CODE389', 'area', 'PUP'),
(393, 'CODE390', 'area', 'PUP'),
(394, 'CODE391', 'area', 'PUP'),
(395, 'CODE392', 'area', 'PUP'),
(396, 'CODE393', 'area', 'PUP'),
(397, 'CODE394', 'area', 'PUP'),
(398, 'CODE395', 'area', 'PUP'),
(399, 'CODE396', 'area', 'PUP'),
(400, 'CODE397', 'area', 'PUP'),
(401, 'CODE398', 'area', 'PUP'),
(402, 'CODE399', 'area', 'PUP'),
(403, 'CODE400', 'area', 'PUP'),
(404, 'CODE401', 'area', 'PUP'),
(405, 'CODE402', 'area', 'PUP'),
(406, 'CODE403', 'area', 'PUP'),
(407, 'CODE404', 'area', 'PUP'),
(408, 'CODE405', 'area', 'PUP'),
(409, 'CODE406', 'area', 'PUP'),
(410, 'CODE407', 'area', 'PUP'),
(411, 'CODE408', 'area', 'PUP'),
(412, 'CODE409', 'area', 'PUP'),
(413, 'CODE410', 'area', 'PUP'),
(414, 'CODE411', 'area', 'PUP'),
(415, 'CODE412', 'area', 'PUP'),
(416, 'CODE413', 'area', 'PUP'),
(417, 'CODE414', 'area', 'PUP'),
(418, 'CODE415', 'area', 'PUP'),
(419, 'CODE416', 'area', 'PUP'),
(420, 'CODE417', 'area', 'PUP'),
(421, 'CODE418', 'area', 'PUP'),
(422, 'CODE419', 'area', 'PUP'),
(423, 'CODE420', 'area', 'PUP'),
(424, 'CODE421', 'area', 'PUP'),
(425, 'CODE422', 'area', 'PUP'),
(426, 'CODE423', 'area', 'PUP'),
(427, 'CODE424', 'area', 'PUP'),
(428, 'CODE425', 'area', 'PUP'),
(429, 'CODE426', 'area', 'PUP'),
(430, 'CODE427', 'area', 'PUP'),
(432, 'CODE429', 'area', 'PUP'),
(433, 'CODE430', 'area', 'PUP'),
(434, 'CODE431', 'area', 'PUP'),
(435, 'CODE432', 'area', 'PUP'),
(436, 'CODE433', 'area', 'PUP'),
(437, 'CODE434', 'area', 'PUP'),
(438, 'CODE435', 'area', 'PUP'),
(439, 'CODE436', 'area', 'PUP'),
(440, 'CODE437', 'area', 'PUP'),
(441, 'CODE438', 'area', 'PUP'),
(442, 'CODE439', 'area', 'PUP'),
(443, 'CODE440', 'area', 'PUP'),
(444, 'CODE441', 'area', 'PUP'),
(445, 'CODE442', 'area', 'PUP'),
(446, 'CODE443', 'area', 'PUP'),
(447, 'CODE444', 'area', 'PUP'),
(448, 'CODE445', 'area', 'PUP'),
(449, 'CODE446', 'area', 'PUP'),
(450, 'CODE447', 'area', 'PUP'),
(451, 'CODE448', 'area', 'PUP'),
(453, 'CODE450', 'area', 'PUP'),
(454, 'CODE451', 'area', 'PUP'),
(455, 'CODE452', 'area', 'PUP'),
(456, 'CODE453', 'area', 'PUP'),
(457, 'CODE454', 'area', 'PUP'),
(458, 'CODE455', 'area', 'PUP'),
(459, 'CODE456', 'area', 'PUP'),
(460, 'CODE457', 'area', 'PUP'),
(461, 'CODE458', 'area', 'PUP'),
(462, 'CODE459', 'area', 'PUP'),
(463, 'CODE460', 'area', 'PUP'),
(464, 'CODE461', 'area', 'PUP'),
(465, 'CODE462', 'area', 'PUP'),
(466, 'CODE463', 'area', 'PUP'),
(467, 'CODE464', 'area', 'PUP'),
(468, 'CODE465', 'area', 'PUP'),
(469, 'CODE466', 'area', 'PUP'),
(470, 'CODE467', 'area', 'PUP'),
(471, 'CODE468', 'area', 'PUP'),
(472, 'CODE469', 'area', 'PUP'),
(473, 'CODE470', 'area', 'PUP'),
(474, 'CODE471', 'area', 'PUP'),
(475, 'CODE472', 'area', 'PUP'),
(476, 'CODE473', 'area', 'PUP'),
(477, 'CODE474', 'area', 'PUP'),
(478, 'CODE475', 'area', 'PUP'),
(479, 'CODE476', 'area', 'PUP'),
(480, 'CODE477', 'area', 'PUP'),
(481, 'CODE478', 'area', 'PUP'),
(482, 'CODE479', 'area', 'PUP'),
(483, 'CODE480', 'area', 'PUP'),
(484, 'CODE481', 'area', 'PUP'),
(485, 'CODE482', 'area', 'PUP'),
(486, 'CODE483', 'area', 'PUP'),
(487, 'CODE484', 'area', 'PUP'),
(488, 'CODE485', 'area', 'PUP'),
(489, 'CODE486', 'area', 'PUP'),
(490, 'CODE487', 'area', 'PUP'),
(491, 'CODE488', 'area', 'PUP'),
(492, 'CODE489', 'area', 'PUP'),
(493, 'CODE490', 'area', 'PUP'),
(494, 'CODE491', 'area', 'PUP'),
(496, 'CODE493', 'area', 'PUP'),
(497, 'CODE494', 'area', 'PUP'),
(498, 'CODE495', 'area', 'PUP'),
(499, 'CODE496', 'area', 'PUP'),
(500, 'CODE497', 'area', 'PUP'),
(501, 'CODE498', 'area', 'PUP'),
(502, 'CODE499', 'area', 'PUP'),
(504, 'CODE501', 'area', 'PUP'),
(505, 'CODE502', 'area', 'PUP'),
(506, 'CODE503', 'area', 'PUP'),
(507, 'CODE504', 'area', 'PUP'),
(508, 'CODE505', 'area', 'PUP'),
(509, 'CODE506', 'area', 'PUP'),
(510, 'CODE507', 'area', 'PUP'),
(511, 'CODE508', 'area', 'PUP'),
(512, 'CODE509', 'area', 'PUP'),
(513, 'CODE510', 'area', 'PUP'),
(514, 'CODE511', 'area', 'PUP'),
(515, 'CODE512', 'area', 'PUP'),
(516, 'CODE513', 'area', 'PUP'),
(517, 'CODE514', 'area', 'PUP'),
(518, 'CODE515', 'area', 'PUP'),
(519, 'CODE516', 'area', 'PUP'),
(520, 'CODE517', 'area', 'PUP'),
(521, 'CODE518', 'area', 'PUP'),
(522, 'CODE519', 'area', 'PUP'),
(523, 'CODE520', 'area', 'PUP'),
(524, 'CODE521', 'area', 'PUP'),
(525, 'CODE522', 'area', 'PUP'),
(526, 'CODE523', 'area', 'PUP'),
(527, 'CODE524', 'area', 'PUP'),
(528, 'CODE525', 'area', 'PUP'),
(529, 'CODE526', 'area', 'PUP'),
(530, 'CODE527', 'area', 'PUP'),
(531, 'CODE528', 'area', 'PUP'),
(532, 'CODE529', 'area', 'PUP'),
(533, 'CODE530', 'area', 'PUP'),
(534, 'CODE531', 'area', 'PUP'),
(535, 'CODE532', 'area', 'PUP'),
(536, 'CODE533', 'area', 'PUP'),
(537, 'CODE534', 'area', 'PUP'),
(538, 'CODE535', 'area', 'PUP'),
(539, 'CODE536', 'area', 'PUP'),
(540, 'CODE537', 'area', 'PUP'),
(541, 'CODE538', 'area', 'PUP'),
(542, 'CODE539', 'area', 'PUP'),
(543, 'CODE540', 'area', 'PUP'),
(544, 'CODE541', 'area', 'PUP'),
(545, 'CODE542', 'area', 'PUP'),
(546, 'CODE543', 'area', 'PUP'),
(547, 'CODE544', 'area', 'PUP'),
(548, 'CODE545', 'area', 'PUP'),
(549, 'CODE546', 'area', 'PUP'),
(550, 'CODE547', 'area', 'PUP'),
(551, 'CODE548', 'area', 'PUP'),
(552, 'CODE549', 'area', 'PUP'),
(553, 'CODE550', 'area', 'PUP'),
(554, 'CODE551', 'area', 'PUP'),
(555, 'CODE552', 'area', 'PUP'),
(556, 'CODE553', 'area', 'PUP'),
(557, 'CODE554', 'area', 'PUP'),
(558, 'CODE555', 'area', 'PUP'),
(559, 'CODE556', 'area', 'PUP'),
(560, 'CODE557', 'area', 'PUP'),
(561, 'CODE558', 'area', 'PUP'),
(562, 'CODE559', 'area', 'PUP'),
(563, 'CODE560', 'area', 'PUP'),
(565, 'CODE562', 'area', 'PUP'),
(566, 'CODE561', 'area', 'PUP');

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(45, 'Yuzef Ezeckiel D. Esparrago', 'ezeckesparrago@gmail.com', '$2y$10$dJWdhDLobb0Dhqq8Ydkbcu2p50rjjCoRed3YPxFknvvuxnUlvyJBW', 'QetNUr6Gf1AqIsdzvvtq0IDXrbORZSM3MJIgrhha7pGsadP1zJxt4lnsQ6x3', 0, '20230315094352-944509.png', 0, '2023-03-15 16:43:52', '2023-03-15 16:47:34'),
(46, 'Nicole Franzyne A. Jao', 'nicaatziecoy@gmail.com', '$2y$10$2LUzD/MSSFH1dEZ7neqcEOZJzEnsgeDE7FjAF1idDB75eVPV3HQYm', 'Bc0xHyaIRcMRdHfp0T0Bz4gYZwokMYeZFdN1mxpLBvcxtx9AvauhnFT36u9z', 0, '20230315094914-299073.png', 0, '2023-03-15 16:49:14', '2023-03-15 16:49:52'),
(47, 'Regienald Pueblos', 'regienaldpueblos13@gmail.com', '$2y$10$41gXeRvTiGhfrHIxQEWpye9Yl/Kgo2fbV1YzwFjALcp0TQH7Hqb72', 'nOm3bn6zPQkxPQzS0GXblzbdFfvbiUycTgjCZMRYuqCvvLhsphgFMGgL1b1L', 0, '20230316010952-806000.png', 0, '2023-03-16 08:09:52', '2023-03-16 12:27:19'),
(48, 'Jaimee Liz Encabo', 'encabojaimeeliz12@gmail.com', '$2y$10$Xx7ajvJjLff6qpcaxQaXAOE3MF8BftDE.IZPVQIBT3qB1yhIaEvIi', 'S5OwOD4PoFxXCOKyWWUjS89lXPcplAZWK2Wp7KNYxAGSviUc2VDclk0ZfJsc', 0, '20230316012418-571544.jpg', 0, '2023-03-16 08:24:18', '2023-03-16 12:27:19'),
(49, 'Carlos Miguel O. Dominise', 'caloymiguel11@gmail.com', '$2y$10$yo8jDYmrIkMhCLJnDfljuetGy8ZGQOWfcDjbhVxZvarkhXx99uiIO', 'g6GYxeej9olOMxw4rILASOzc1Fvw96CU6IODU1xurzHQF5qpBPrUxhHmAVPX', 0, '20230316014145-314350.png', 0, '2023-03-16 08:41:45', '2023-03-16 12:43:19'),
(50, 'Jestoni Castro', 'jestonicastro3@gmail.com', '$2y$10$DJ.XgVuIiu91Ur0BSK4Vd.JePlkvo4k4sEJVrWfIK9XMy34Xe0Eu2', NULL, 0, '20230316010308-607557.jpg', 0, '2023-03-16 05:03:08', '2023-03-16 05:03:08');

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
