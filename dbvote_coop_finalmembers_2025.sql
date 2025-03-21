-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 11, 2025 at 05:26 AM
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


--
-- Dumping data for table `tblcandidate`
--

INSERT INTO `tblcandidate` (`strCandId`, `strCandMemId`, `strCandPosId`, `intCandParId`, `strCandEducBack`, `strCandInfo`, `txtCandPic`, `blCandDelete`, `created_at`, `updated_at`, `deleted_at`) VALUES
('CAND007', 'CODE100', 'POS003', 1, '', '', '20250307022440-481445.jpg', 0, '2025-03-07 06:24:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CAND001', 'CODE202', 'POS001', 1, '', '', '20250307022105-705566.JPG', 0, '2025-03-07 06:21:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CAND008', 'CODE131', 'POS003', 1, '', '', '20250307022508-979085.jpg', 0, '2025-03-07 06:25:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CAND002', 'CODE225', 'POS001', 1, '', '', '20250307022135-213839.JPG', 0, '2025-03-07 06:21:35', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CAND005', 'CODE248', 'POS002', 1, '', '', '20250307022338-454155.jpg', 0, '2025-03-07 06:23:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CAND003', 'CODE308', 'POS001', 1, '', '', '20250307022206-712890.JPG', 0, '2025-03-07 06:22:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CAND004', 'CODE389', 'POS001', 1, '', '', '20250307022254-595513.JPG', 0, '2025-03-07 06:22:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('CAND006', 'CODE455', 'POS002', 1, '', '', '20250307022400-643419.jpg', 0, '2025-03-07 06:24:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`strMemberId`),
  UNIQUE KEY `strMemEmail_UNIQUE` (`strMemEmail`),
  UNIQUE KEY `strMemPasscode_UNIQUE` (`strMemPasscode`),
  KEY `fkMemSec_idx` (`intMemSecQuesId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblmember`
--

INSERT INTO `tblmember` (`strMemberId`, `strMemFname`, `strMemMname`, `strMemLname`, `strMemEmail`, `intMemSecQuesId`, `strMemSecQuesAnswer`, `strMemPasscode`, `blMemCodeSendStat`, `blMemDelete`, `created_at`, `updated_at`, `deleted_at`) VALUES
('CODE001', 'DOYLE', 'C', 'ABALOS', 'doylecabalos@pup.edu.ph', 1, 'ivote', '6S92j3', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE002', 'MARISSA', 'J', 'ABALOS', 'marissajabalos@pup.edu.ph', 1, 'ivote', 'Gx8hot', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE003', 'JOSE', 'M', 'ABAT', 'josemabat@pup.edu.ph', 1, 'ivote', 'dNPNY9', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE004', 'MA.  LOLITA', '', 'ABECIA', 'malolitaabecia@pup.edu.ph', 1, 'ivote', '54T16n', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE005', 'GERINO', 'P', 'ABELIDA  JR.', 'gerinopabelidajr.@pup.edu.ph', 1, 'ivote', 'xmdTni', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE006', 'MERLE', 'C', 'ABUELO', 'merlecabuelo@pup.edu.ph', 1, 'ivote', 'lsAIuL', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE007', 'MINERA  LAIZA', 'C', 'ACOSTA', 'mineralaizacacosta@pup.edu.ph', 1, 'ivote', 'Rb3DQN', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE008', 'REMEDIOS', 'G', 'ADO', 'remediosgado@pup.edu.ph', 1, 'ivote', 'hcGyGQ', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE009', 'DIVINA', 'T', 'ADRIAS', 'divinatadrias@pup.edu.ph', 1, 'ivote', 'Gvh6qP', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE010', 'JOEL', 'T', 'AGACITA', 'joeltagacita@pup.edu.ph', 1, 'ivote', 'KH3pim', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE011', 'LOURDES', 'M', 'AGANAN', 'lourdesmaganan@pup.edu.ph', 1, 'ivote', 'C7ct4a', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE012', 'FERMIN', 'S', 'AGUILA', 'ferminsaguila@pup.edu.ph', 1, 'ivote', 'dULAwV', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE013', 'JULIANA', 'D', 'AGUILA', 'julianadaguila@pup.edu.ph', 1, 'ivote', 't8ShkB', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE014', 'CHRISTO  REY', 'S', 'ALBASON', 'christoreysalbason@pup.edu.ph', 1, 'ivote', 'dgichI', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE015', 'LEO', 'G', 'ALCARAZ', 'leogalcaraz@pup.edu.ph', 1, 'ivote', 'GkXkK6', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE016', 'JOSEPHINE', 'O', 'ALFONSO', 'josephineoalfonso@pup.edu.ph', 1, 'ivote', 'EzMHad', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE017', 'LARRY', 'M', 'ALFONSO', 'larrymalfonso@pup.edu.ph', 1, 'ivote', 'vMe7PU', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE018', 'RAYMOND', 'L', 'ALFONSO', 'raymondlalfonso@pup.edu.ph', 1, 'ivote', 'UA76Tu', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE019', 'LERMA', 'B', 'ALMEYDA', 'lermabalmeyda@pup.edu.ph', 1, 'ivote', 'uWBfv4', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE020', 'DANTE', 'V', 'ALUMNO', 'dantevalumno@pup.edu.ph', 1, 'ivote', 'GbtiQB', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE021', 'LOURDES', 'V', 'ALVAREZ', 'lourdesvalvarez@pup.edu.ph', 1, 'ivote', 'mR0sbJ', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE022', 'FLORDELIZA', 'E', 'ALVENDIA', 'flordelizaealvendia@pup.edu.ph', 1, 'ivote', 'gQ8C0F', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE023', 'MARIA  LEONILA', 'C', 'AMATA', 'marialeonilacamata@pup.edu.ph', 1, 'ivote', 'QfgvoL', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE024', 'MARK  ANTHONY', 'Q', 'AMUL', 'markanthonyqamul@pup.edu.ph', 1, 'ivote', 'zL3wL9', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE025', 'ELAINE  CARIE', 'A', 'ANDRES', 'elainecarieaandres@pup.edu.ph', 1, 'ivote', 'vaxb46', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE026', 'NESTOR', 'T', 'APACIONADO', 'nestortapacionado@pup.edu.ph', 1, 'ivote', 'B3OGAW', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE027', 'JONNALYN', 'B', 'APSAY', 'jonnalynbapsay@pup.edu.ph', 1, 'ivote', 'AZQ6Wf', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE028', 'RODOLFO', 'Y', 'AQUINO', 'rodolfoyaquino@pup.edu.ph', 1, 'ivote', 'tW7USe', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE029', 'MARIAN', 'G', 'ARADA', 'mariangarada@pup.edu.ph', 1, 'ivote', 'IlMAN1', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE030', 'REALIN', 'C', 'ARANZA', 'realincaranza@pup.edu.ph', 1, 'ivote', 'lHq7C9', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE031', 'RAQUEL', 'A', 'AREVALO', 'raquelaarevalo@pup.edu.ph', 1, 'ivote', '0p79sS', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE032', 'ARAPIA', 'C', 'ARIRAYA', 'arapiacariraya@pup.edu.ph', 1, 'ivote', 'V1MBr6', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE033', 'RECHELLE', 'C', 'ASIS', 'rechellecasis@pup.edu.ph', 1, 'ivote', 'RMWxCT', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE034', 'GARY', 'C', 'AURE', 'garycaure@pup.edu.ph', 1, 'ivote', 'UFBryN', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE035', 'MARY  ANN', 'C', 'AURE', 'maryanncaure@pup.edu.ph', 1, 'ivote', 'yyCpRn', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE036', 'AIRAVIE  JOY', 'D', 'AUSTRIA', 'airaviejoydaustria@pup.edu.ph', 1, 'ivote', 'iHcVmf', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE037', 'AMBROCIA', 'D', 'AUSTRIA', 'ambrociadaustria@pup.edu.ph', 1, 'ivote', '2x93DO', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE038', 'ELIAS', 'A', 'AUSTRIA', 'eliasaaustria@pup.edu.ph', 1, 'ivote', 'DCWslw', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE039', 'MA.  GEMALYN', 'S', 'AUSTRIA', 'magemalynsaustria@pup.edu.ph', 1, 'ivote', 'IAgSxZ', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE040', 'JOANNA', 'R', 'BACASER', 'joannarbacaser@pup.edu.ph', 1, 'ivote', 'jt5ziC', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE041', 'MELANIE', 'F', 'BACTASA', 'melaniefbactasa@pup.edu.ph', 1, 'ivote', 'hV54uC', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE042', 'CESAR  AMORSOLO', 'A', 'BAGABALDO', 'cesaramorsoloabagabaldo@pup.edu.ph', 1, 'ivote', 'uSkp4L', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE043', 'BERNARDO', 'D', 'BALAGTAS', 'bernardodbalagtas@pup.edu.ph', 1, 'ivote', '0UgzJo', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE044', 'MELINDA', 'S', 'BALBARINO', 'melindasbalbarino@pup.edu.ph', 1, 'ivote', 'twwiXp', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE045', 'CHRISTIAN  NOEL', 'Y', 'BALETA', 'christiannoelybaleta@pup.edu.ph', 1, 'ivote', '2yGn5l', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE046', 'VIVENCIO', 'O', 'BALLANO', 'vivenciooballano@pup.edu.ph', 1, 'ivote', 'aWZ46y', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE047', 'JULIE  ANN', 'S', 'BARCE', 'julieannsbarce@pup.edu.ph', 1, 'ivote', 'fEVv0H', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE048', 'RAQUEL', 'P', 'BARRERA', 'raquelpbarrera@pup.edu.ph', 1, 'ivote', 'LlUtxn', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE049', 'REYNALDO', 'T', 'BARRERA', 'reynaldotbarrera@pup.edu.ph', 1, 'ivote', '4UZwYm', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE050', 'JEFFREY', 'L', 'BARTILET', 'jeffreylbartilet@pup.edu.ph', 1, 'ivote', 'gLuYK9', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE051', 'JORI  LACE', 'R', 'BASBAS', 'jorilacerbasbas@pup.edu.ph', 1, 'ivote', 'sG4ztD', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE052', 'SYLVIA', 'M', 'BASILIO', 'sylviambasilio@pup.edu.ph', 1, 'ivote', 'vXDWSn', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE053', 'MARISSA', 'G', 'BATHAN', 'marissagbathan@pup.edu.ph', 1, 'ivote', 'zYEfzo', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE054', 'AMEIL', 'L', 'BATRONEL', 'ameillbatronel@pup.edu.ph', 1, 'ivote', '9NeVI7', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE055', 'CHRISTINE  JOYCE', 'S', 'BAUTISTA', 'christinejoycesbautista@pup.edu.ph', 1, 'ivote', 'gLO6TQ', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE056', 'MARLON  JHON', 'B', 'BAUTISTA', 'marlonjhonbbautista@pup.edu.ph', 1, 'ivote', 'KLLvBo', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE057', 'NOEL', 'A', 'BERGONIA', 'noelabergonia@pup.edu.ph', 1, 'ivote', 'IPHf5Z', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE058', 'NOEL', 'P', 'BERMUDEZ', 'noelpbermudez@pup.edu.ph', 1, 'ivote', '1Zr7V9', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE059', 'GUILLERMO', 'O', 'BERNABE', 'guillermoobernabe@pup.edu.ph', 1, 'ivote', 'a5R2kH', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE060', 'BERNARDINO', 'C', 'BERNARDINO', 'bernardinocbernardino@pup.edu.ph', 1, 'ivote', 'd1ewKI', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE061', 'JAIME', 'C', 'BERNARDINO', 'jaimecbernardino@pup.edu.ph', 1, 'ivote', 'mpwMqS', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE062', 'JOSEPH  RANIEL', 'A', 'BIANES', 'josephranielabianes@pup.edu.ph', 1, 'ivote', 'VP1Zq8', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE063', 'REYNALDO', 'V', 'BIARO', 'reynaldovbiaro@pup.edu.ph', 1, 'ivote', 'roP9Q3', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE064', 'AGNES', 'J', 'BIEN', 'agnesjbien@pup.edu.ph', 1, 'ivote', '1oh5yF', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE065', 'GLENDA', 'C', 'BIEN', 'glendacbien@pup.edu.ph', 1, 'ivote', 'w7SUSC', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE066', 'JONNA  KARLA', 'C', 'BIEN', 'jonnakarlacbien@pup.edu.ph', 1, 'ivote', 'GO4n4f', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE067', 'JAKE', 'A', 'BINUYA', 'jakeabinuya@pup.edu.ph', 1, 'ivote', 'jq9jei', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE068', 'AILEEN', 'G', 'BIRION', 'aileengbirion@pup.edu.ph', 1, 'ivote', 'siRIPd', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE069', 'EDRIAN', 'G', 'BLASQUINO', 'edriangblasquino@pup.edu.ph', 1, 'ivote', 'iMNCoQ', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE070', 'DORIS', 'G', 'BLEZA', 'dorisgbleza@pup.edu.ph', 1, 'ivote', 'LfnN1P', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE071', 'MARIETTA', 'C', 'BONA', 'mariettacbona@pup.edu.ph', 1, 'ivote', 'irCShm', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE072', 'ZENAIDA', 'S', 'BONAOBRA', 'zenaidasbonaobra@pup.edu.ph', 1, 'ivote', 'l5SoFf', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE073', 'FERDINAND', 'R', 'BONDAME', 'ferdinandrbondame@pup.edu.ph', 1, 'ivote', 'Ce1riu', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE074', 'ISMAILA', 'S', 'BONDOC', 'ismailasbondoc@pup.edu.ph', 1, 'ivote', '5SvvVo', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE075', 'MA.  THERESA', 'D', 'BONGULTO', 'matheresadbongulto@pup.edu.ph', 1, 'ivote', 'Heweqz', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE076', 'JEAN', 'O', 'BONIOL', 'jeanoboniol@pup.edu.ph', 1, 'ivote', '4kE9Km', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE077', 'ELMER', 'P', 'BRABANTE', 'elmerpbrabante@pup.edu.ph', 1, 'ivote', 'QyP2we', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE078', 'CRESILDA', 'M', 'BRAGAS', 'cresildambragas@pup.edu.ph', 1, 'ivote', '9Izbmb', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE079', 'ERNESTO  JR.', 'R', 'BROBIO', 'ernestojrrbrobio@pup.edu.ph', 1, 'ivote', 'O5iETq', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE080', 'SALVE', 'B', 'BUELVA', 'salvebbuelva@pup.edu.ph', 1, 'ivote', 'XdUo2p', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE081', 'MA.  AILENE', 'E', 'BUENO', 'maaileneebueno@pup.edu.ph', 1, 'ivote', 'UNcPZ5', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE082', 'CIELITO', 'B', 'BUHAIN', 'cielitobbuhain@pup.edu.ph', 1, 'ivote', 'ABpvwr', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE083', 'NATASJA  CAMILLE', 'T', 'BULFANGO', 'natasjacamilletbulfango@pup.edu.ph', 1, 'ivote', 'CP8cJ1', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE084', 'OSCAR  JR.', 'M', 'BUMANGLAG', 'oscarjrmbumanglag@pup.edu.ph', 1, 'ivote', 'rDArys', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE085', 'BAYANI', 'C', 'CABADDU', 'bayaniccabaddu@pup.edu.ph', 1, 'ivote', 'Me2AJ7', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE086', 'MELISSA', 'B', 'CABALO', 'melissabcabalo@pup.edu.ph', 1, 'ivote', 'n8Nq8w', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE087', 'EUFEMIA', 'B', 'CABANSAG', 'eufemiabcabansag@pup.edu.ph', 1, 'ivote', 'AMqzwS', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE088', 'MA.  ARTES', 'D', 'CABILES', 'maartesdcabiles@pup.edu.ph', 1, 'ivote', 'XVL3Gb', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE089', 'CEASAR  BAYANI', 'V', 'CABOBOY', 'ceasarbayanivcaboboy@pup.edu.ph', 1, 'ivote', 'KoyNrG', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE090', 'DINO  TRISTAN', 'C', 'CABRERA', 'dinotristanccabrera@pup.edu.ph', 1, 'ivote', 'kFhMjU', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE091', 'HONORATO  I.', 'J', 'CABRERA', 'honoratoijcabrera@pup.edu.ph', 1, 'ivote', 'lg6rCS', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE092', 'NAZARIO', 'M', 'CABRERA', 'nazariomcabrera@pup.edu.ph', 1, 'ivote', 'XUxYrx', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE093', 'RESYLYN', 'Z', 'CABRERA', 'resylynzcabrera@pup.edu.ph', 1, 'ivote', '81nMBL', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE094', 'MARY  GRACE', 'T', 'CABRIDO', 'marygracetcabrido@pup.edu.ph', 1, 'ivote', 'H6kYyp', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE095', 'MYRNA', 'C', 'CACHO', 'myrnaccacho@pup.edu.ph', 1, 'ivote', '5h9mz5', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE096', 'ABRAHAM  JR.', 'C', 'CAMBA', 'abrahamjrccamba@pup.edu.ph', 1, 'ivote', 'oiLEvv', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE097', 'AILEEN', 'L', 'CAMBA', 'aileenlcamba@pup.edu.ph', 1, 'ivote', 'S75bwK', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE098', 'ARLAN', 'M', 'CAMBA', 'arlanmcamba@pup.edu.ph', 1, 'ivote', '2XQoVS', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE099', 'RICHARD', 'M', 'CAMPOS', 'richardmcampos@pup.edu.ph', 1, 'ivote', 'cZdEyd', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE100', 'EDWIN', 'P', 'CANDONTOL', 'edwinpcandontol@pup.edu.ph', 1, 'ivote', '7plaFb', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE101', 'ARLENE', 'B', 'CANLAS', 'arlenebcanlas@pup.edu.ph', 1, 'ivote', 'qTsRUw', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE102', 'ROSITA', 'E', 'CANLAS', 'rositaecanlas@pup.edu.ph', 1, 'ivote', '6TR8H1', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE103', 'JULIUS', 'S', 'CANSINO', 'juliusscansino@pup.edu.ph', 1, 'ivote', 'cey8DP', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE104', 'RONNEL', 'H', 'CAPULI', 'ronnelhcapuli@pup.edu.ph', 1, 'ivote', 'B0rP8R', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE105', 'RUTH', 'P', 'CARLOS', 'ruthpcarlos@pup.edu.ph', 1, 'ivote', 'ypuT4o', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE106', 'DANDIE  RAYMUND', 'O', 'CARPIO', 'dandieraymundocarpio@pup.edu.ph', 1, 'ivote', '54tov3', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE107', 'PERLA', 'D', 'CARPIO', 'perladcarpio@pup.edu.ph', 1, 'ivote', 'hrCKpV', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE108', 'RICARDO', 'D', 'CARPIO', 'ricardodcarpio@pup.edu.ph', 1, 'ivote', '9znq4d', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE109', 'ARLENE', 'F', 'CARPIZO', 'arlenefcarpizo@pup.edu.ph', 1, 'ivote', 'VEI9fh', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE110', 'REY', 'A', 'CASADORES', 'reyacasadores@pup.edu.ph', 1, 'ivote', 'iGBZRM', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE111', 'PACITA', 'M', 'CASALLO', 'pacitamcasallo@pup.edu.ph', 1, 'ivote', 'o5Rxfe', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE112', 'MARY  JOY', 'A', 'CASTILLO', 'maryjoyacastillo@pup.edu.ph', 1, 'ivote', 'TQsSKX', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE113', 'CHERRY', 'D', 'CASUAT', 'cherrydcasuat@pup.edu.ph', 1, 'ivote', 'UbFsyb', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE114', 'ARMAN', 'O', 'CATANGHAL', 'armanocatanghal@pup.edu.ph', 1, 'ivote', 'tvQMxM', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE115', 'RUTH', 'M', 'CATANGHAL', 'ruthmcatanghal@pup.edu.ph', 1, 'ivote', '67ohvS', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE116', 'MARK', 'C', 'CATAPANG', 'markccatapang@pup.edu.ph', 1, 'ivote', '09JDRh', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE117', 'CARMELITA', 'M', 'CAULI', 'carmelitamcauli@pup.edu.ph', 1, 'ivote', 'qGFoAp', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE118', 'YOLANDA', 'M', 'CELARIO', 'yolandamcelario@pup.edu.ph', 1, 'ivote', '3Ps9Nf', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE119', 'MARICRIS', 'B', 'CELERIO', 'maricrisbcelerio@pup.edu.ph', 1, 'ivote', '7XltUI', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE120', 'CHEYSSER', 'I', 'CEREZO', 'cheyssericerezo@pup.edu.ph', 1, 'ivote', 'Ox7cxr', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE121', 'REMEDIOS', 'E', 'CLAROS', 'remedioseclaros@pup.edu.ph', 1, 'ivote', '5eK3Zh', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE122', 'MIGUELITO', 'C', 'COLARINA', 'miguelitoccolarina@pup.edu.ph', 1, 'ivote', 'Musyn5', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE123', 'BENILDA  ELEONOR', 'V', 'COMENDADOR', 'benildaeleonorvcomendador@pup.edu.ph', 1, 'ivote', 'dmvVND', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE124', 'ROMINA', 'A', 'CONSUL', 'rominaaconsul@pup.edu.ph', 1, 'ivote', 'ttjDJp', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE125', 'LEONARDO', 'P', 'COQUILLA', 'leonardopcoquilla@pup.edu.ph', 1, 'ivote', '2VgY9B', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE126', 'DARYL  ACE', 'V', 'CORNELL', 'darylacevcornell@pup.edu.ph', 1, 'ivote', 'ml6scT', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE127', 'ROSALIE', 'A', 'CORPUS', 'rosalieacorpus@pup.edu.ph', 1, 'ivote', 'msEv7E', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE128', 'ROLANDO  JR.', 'M', 'COVERO', 'rolandojrmcovero@pup.edu.ph', 1, 'ivote', 'ERElj0', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE129', 'JOHN', 'P', 'CRISOSTOMO', 'johnpcrisostomo@pup.edu.ph', 1, 'ivote', '6p6Jm8', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE130', 'ANA  LIZZA', 'B', 'CRISTE', 'analizzabcriste@pup.edu.ph', 1, 'ivote', 'qmN3Vw', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE131', 'CHRISTOPHER', 'C', 'CRISTE', 'christopherccriste@pup.edu.ph', 1, 'ivote', 'Cu3uOH', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE132', 'ARTEMUS', 'G', 'CRUZ', 'artemusgcruz@pup.edu.ph', 1, 'ivote', 'F6rT0a', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE133', 'GERONIMO', 'A', 'CUADRA', 'geronimoacuadra@pup.edu.ph', 1, 'ivote', 'VGj8Fp', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE134', 'JHONLEY', 'O', 'CUBACUB', 'jhonleyocubacub@pup.edu.ph', 1, 'ivote', 'QVEYBq', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE135', 'AGATONA', 'D', 'CUNANAN', 'agatonadcunanan@pup.edu.ph', 1, 'ivote', 'p0tt16', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE136', 'DANILO', 'P', 'DADIA', 'danilopdadia@pup.edu.ph', 1, 'ivote', 'RBzoeK', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE137', 'EDUARDO', 'O', 'DADIVAS', 'eduardoodadivas@pup.edu.ph', 1, 'ivote', '6U4UWU', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE138', 'QUEEN', 'D', 'DAGAHUYA', 'queenddagahuya@pup.edu.ph', 1, 'ivote', 'OAL8It', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE139', 'VIRGINIA', 'B', 'DANGANAN', 'virginiabdanganan@pup.edu.ph', 1, 'ivote', '02us8q', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE140', 'FRANCIS  JOHN', 'A', 'DATILES', 'francisjohnadatiles@pup.edu.ph', 1, 'ivote', 'LrL4yF', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE141', 'KENNETH', 'P', 'DAZON', 'kennethpdazon@pup.edu.ph', 1, 'ivote', 'AJlttS', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE142', 'BELEN', 'Z', 'DE  ASIS', 'belenzdeasis@pup.edu.ph', 1, 'ivote', 'sT5Eu4', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE143', 'MELINDA', 'M', 'DE  GUZMAN', 'melindamdeguzman@pup.edu.ph', 1, 'ivote', 'tNn2V6', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE144', 'ALEXANDER', 'S', 'DE  JESUS', 'alexandersdejesus@pup.edu.ph', 1, 'ivote', 'vavijk', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE145', 'ELMER', 'G', 'DE  JOSE', 'elmergdejose@pup.edu.ph', 1, 'ivote', 'cBxcQe', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE146', 'RONEL', 'B', 'DE  LOYOLA', 'ronelbdeloyola@pup.edu.ph', 1, 'ivote', 'sF1ANj', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE147', 'LOURDES', 'D', 'DE  LUMBAN', 'lourdesddelumban@pup.edu.ph', 1, 'ivote', 'n8b9oo', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE148', 'DAISY', 'S', 'DE  VERA', 'daisysdevera@pup.edu.ph', 1, 'ivote', 'TezVuC', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE149', 'ZAILA', 'C', 'DECIN', 'zailacdecin@pup.edu.ph', 1, 'ivote', 'utoVRX', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE150', 'JESUSANA', 'S', 'DEJITO', 'jesusanasdejito@pup.edu.ph', 1, 'ivote', 'kTWjht', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE151', 'MARLYN', 'G', 'DEL  ROSARIO', 'marlyngdelrosario@pup.edu.ph', 1, 'ivote', '2q9BzF', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE152', 'MICHAEL', 'G', 'DEL  ROSARIO', 'michaelgdelrosario@pup.edu.ph', 1, 'ivote', 'TgMg0f', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE153', 'RAMON  HERCULES', 'G', 'DEL  ROSARIO', 'ramonherculesgdelrosario@pup.edu.ph', 1, 'ivote', 'Ms9CMV', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE154', 'TONILYNNE', 'G', 'DEL  ROSARIO', 'tonilynnegdelrosario@pup.edu.ph', 1, 'ivote', 'Zr6Bvj', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE155', 'ARVIN', 'R', 'DELA  CRUZ', 'arvinrdelacruz@pup.edu.ph', 1, 'ivote', 'G7ARGX', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE156', 'CRISANTO', 'V', 'DELA  CRUZ', 'crisantovdelacruz@pup.edu.ph', 1, 'ivote', 'wBTW29', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE157', 'HERMOGENES', 'D', 'DELA  CRUZ', 'hermogenesddelacruz@pup.edu.ph', 1, 'ivote', 'mAObiW', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE158', 'PONCIANO', 'D', 'DELA  CRUZ', 'poncianoddelacruz@pup.edu.ph', 1, 'ivote', 'OqzziC', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE159', 'RUDOLF', 'I', 'DELA  CRUZ', 'rudolfidelacruz@pup.edu.ph', 1, 'ivote', 'jTE2d3', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE160', 'SHIELA  MARIE', 'P', 'DELA  CRUZ', 'shielamariepdelacruz@pup.edu.ph', 1, 'ivote', 'cBL1HQ', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE161', 'GLENN', 'V', 'DELA  CUEVA', 'glennvdelacueva@pup.edu.ph', 1, 'ivote', 'Xrjl1E', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE162', 'MICHAEL', 'B', 'DELA  FUENTE', 'michaelbdelafuente@pup.edu.ph', 1, 'ivote', 'dISzAo', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE163', 'JOSEPHINE', 'M', 'DELA  ISLA', 'josephinemdelaisla@pup.edu.ph', 1, 'ivote', 'Zobn5K', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE164', 'IRENEO  JR.', 'C', 'DELAS  ARMAS', 'ireneojrcdelasarmas@pup.edu.ph', 1, 'ivote', 'z6Kv7v', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE165', 'LORENA', 'V', 'DELOS  REYES', 'lorenavdelosreyes@pup.edu.ph', 1, 'ivote', 'me07VK', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE166', 'MYLEEN', 'L', 'DELOS  SANTOS', 'myleenldelossantos@pup.edu.ph', 1, 'ivote', '86HoQv', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE167', 'CHESTER', 'C', 'DEOCARIS', 'chestercdeocaris@pup.edu.ph', 1, 'ivote', 'QgZN4P', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE168', 'JOHN', 'L', 'DEPUSOY', 'johnldepusoy@pup.edu.ph', 1, 'ivote', 'r3M4q3', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE169', 'MYRNA', 'G', 'DIONA', 'myrnagdiona@pup.edu.ph', 1, 'ivote', 'WzZEqp', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE170', 'LEONILA', 'A', 'DIONISIO', 'leonilaadionisio@pup.edu.ph', 1, 'ivote', 'u1eGj0', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE171', 'JOHN  MARK', 'S', 'DISTOR', 'johnmarksdistor@pup.edu.ph', 1, 'ivote', 'PdGHzZ', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE172', 'KRISTEL  JOY', 'R', 'DITA', 'kristeljoyrdita@pup.edu.ph', 1, 'ivote', 'RsQjys', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE173', 'MARY  ANN', 'J', 'DIZON', 'maryannjdizon@pup.edu.ph', 1, 'ivote', 'NAdt2X', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE174', 'ROSEMARIEBETH', 'R', 'DIZON', 'rosemariebethrdizon@pup.edu.ph', 1, 'ivote', 'UoWXzs', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE175', 'JOSELITO', 'D', 'DOMINGO', 'joselitoddomingo@pup.edu.ph', 1, 'ivote', 'B2Z2h8', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE176', 'KLARIBEL', 'P', 'DOMINGO', 'klaribelpdomingo@pup.edu.ph', 1, 'ivote', 'J3rkXA', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE177', 'ROLANDO', 'B', 'DOROMAL', 'rolandobdoromal@pup.edu.ph', 1, 'ivote', 'KU4i8Y', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE178', 'OLIVER', 'A', 'DUEZA', 'oliveradueza@pup.edu.ph', 1, 'ivote', 'rSOKoF', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE179', 'ERWIN', 'A', 'DUNGAO', 'erwinadungao@pup.edu.ph', 1, 'ivote', 'me4pk9', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE180', 'MARY  GRACE', 'T', 'DUNGCA', 'marygracetdungca@pup.edu.ph', 1, 'ivote', 'YK1pub', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE181', 'DEBBIE  JIM', 'C', 'DURAN', 'debbiejimcduran@pup.edu.ph', 1, 'ivote', 'WHnc1F', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE182', 'ORWEN', 'E', 'ELUMIR', 'orweneelumir@pup.edu.ph', 1, 'ivote', 'CuygDc', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE183', 'RIBERT', 'R', 'ENIERGA', 'ribertrenierga@pup.edu.ph', 1, 'ivote', 'LAayRO', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE184', 'ANTONIO  JR.', 'F', 'ENRIQUEZ', 'antoniojrfenriquez@pup.edu.ph', 1, 'ivote', 'YGKCxw', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE185', 'RYAN', 'A', 'ENRIQUEZ', 'ryanaenriquez@pup.edu.ph', 1, 'ivote', 'kO2Q1c', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE186', 'PRUDENCE', 'S', 'ENTRATA', 'prudencesentrata@pup.edu.ph', 1, 'ivote', 'tswOiI', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE187', 'CYNTHIA', 'P', 'EQUIZA', 'cynthiapequiza@pup.edu.ph', 1, 'ivote', 'FIGHLb', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE188', 'ORLANDO', 'A', 'EQUIZA', 'orlandoaequiza@pup.edu.ph', 1, 'ivote', 'UuzVdR', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE189', 'MICHAEL', 'V', 'ESCANILLA', 'michaelvescanilla@pup.edu.ph', 1, 'ivote', 'mGvoR9', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE190', 'ROSICAR', 'E', 'ESCOBER', 'rosicareescober@pup.edu.ph', 1, 'ivote', 'nCX8Mk', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE191', 'PIA  MERLA', 'H', 'ESPERIDA', 'piamerlahesperida@pup.edu.ph', 1, 'ivote', 'rc4CaP', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE192', 'SHERYLL', 'I', 'ESPINOCILLA', 'sherylliespinocilla@pup.edu.ph', 1, 'ivote', '7YQ0vE', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE193', 'ARIEL', 'N', 'ESQUIVEL', 'arielnesquivel@pup.edu.ph', 1, 'ivote', '1INAye', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE194', 'ARTURO', 'P', 'EVANGELISTA', 'arturopevangelista@pup.edu.ph', 1, 'ivote', '8ku4IT', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE195', 'ELENA', 'N', 'FA-ED', 'elenanfa-ed@pup.edu.ph', 1, 'ivote', 'w5yvCn', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE196', 'GARITO', 'E', 'FABI', 'garitoefabi@pup.edu.ph', 1, 'ivote', 'pdzBxP', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE197', 'OLIVIA', 'P', 'FABI', 'oliviapfabi@pup.edu.ph', 1, 'ivote', 'YZoL1V', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE198', 'IVAN', 'N', 'FARONAL', 'ivannfaronal@pup.edu.ph', 1, 'ivote', 'IjXjGJ', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE199', 'JULIET', 'I', 'FERNANDEZ', 'julietifernandez@pup.edu.ph', 1, 'ivote', 'Dua9Q2', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE200', 'ELIZABETH', 'C', 'FERNANDO', 'elizabethcfernando@pup.edu.ph', 1, 'ivote', 'K3FzIg', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE201', 'RONALD', 'D', 'FERNANDO', 'ronalddfernando@pup.edu.ph', 1, 'ivote', '76yxvd', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE202', 'EDUARDO', 'C', 'FIGURA', 'eduardocfigura@pup.edu.ph', 1, 'ivote', 'IMetia', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE203', 'MARCELA', 'R', 'FIGURA', 'marcelarfigura@pup.edu.ph', 1, 'ivote', 'HpIibT', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE204', 'JONATHAN', 'U', 'FLORIDA', 'jonathanuflorida@pup.edu.ph', 1, 'ivote', 'kCEBRa', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE205', 'AL', 'F', 'FONTAMILLAS', 'alffontamillas@pup.edu.ph', 1, 'ivote', '0NED1Q', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE206', 'LOUVELLE', 'S', 'FORMENTERA', 'louvellesformentera@pup.edu.ph', 1, 'ivote', 'wUpryA', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE207', 'PEDRO', 'L', 'FUNILAS', 'pedrolfunilas@pup.edu.ph', 1, 'ivote', 'hdrRq2', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE208', 'ASUNCION', 'V', 'GABASA', 'asuncionvgabasa@pup.edu.ph', 1, 'ivote', 'FZhAWh', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE209', 'NATAN', 'F', 'GACUTE', 'natanfgacute@pup.edu.ph', 1, 'ivote', 'uBTQn1', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE210', 'JAIRUSS', 'P', 'GALANG', 'jairusspgalang@pup.edu.ph', 1, 'ivote', 'iDsWWC', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE211', 'JOSE  NINO', 'G', 'GALANG', 'joseninoggalang@pup.edu.ph', 1, 'ivote', 'QpibOp', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE212', 'FRITZ', 'C', 'GALERO', 'fritzcgalero@pup.edu.ph', 1, 'ivote', 'DcWPSy', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE213', 'ADRIAN', 'T', 'GALLANO', 'adriantgallano@pup.edu.ph', 1, 'ivote', 'MYIdHY', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE214', 'MARIANITO', 'P', 'GALLEGO', 'marianitopgallego@pup.edu.ph', 1, 'ivote', 'waRHQa', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE215', 'MA.  SHIELA', 'S', 'GANCHERO', 'mashielasganchero@pup.edu.ph', 1, 'ivote', 'BFds8z', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE216', 'ARTHUR', 'C', 'GARCIA', 'arthurcgarcia@pup.edu.ph', 1, 'ivote', 'Ob0h6Q', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE217', 'ROCHELLE  MAY', 'E', 'GARCIA', 'rochellemayegarcia@pup.edu.ph', 1, 'ivote', 'MWRPf9', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE218', 'IRMA', 'A', 'GATCHO', 'irmaagatcho@pup.edu.ph', 1, 'ivote', 'ZxmoEP', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE219', 'HANNA  MAE', 'L', 'GAYO', 'hannamaelgayo@pup.edu.ph', 1, 'ivote', 'AnX81j', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE220', 'GRACE', 'M', 'GENTOLIZO', 'gracemgentolizo@pup.edu.ph', 1, 'ivote', 'FD9Vpq', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE221', 'JOYCE  ANN', 'B', 'GESLAYA', 'joyceannbgeslaya@pup.edu.ph', 1, 'ivote', 'fCg0Oh', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE222', 'JOSELINDA', 'M', 'GOLPEO', 'joselindamgolpeo@pup.edu.ph', 1, 'ivote', 'ohuOEh', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE223', 'ELENA', 'T', 'GOMEZ', 'elenatgomez@pup.edu.ph', 1, 'ivote', 'chaRQA', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE224', 'AGNES', 'Y', 'GONZAGA', 'agnesygonzaga@pup.edu.ph', 1, 'ivote', 'NFN7Ud', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE225', 'JAIME', 'Y', 'GONZALES', 'jaimeygonzales@pup.edu.ph', 1, 'ivote', 'iOfI9P', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE226', 'MC  ROE', 'A', 'GONZALES', 'mcroeagonzales@pup.edu.ph', 1, 'ivote', 'M5ddUy', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE227', 'MARIE  CHARLETTE', 'L', 'GREENE', 'mariecharlettelgreene@pup.edu.ph', 1, 'ivote', 'Yr7Eyb', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE228', 'LEONARDO', 'G', 'GRUTA', 'leonardoggruta@pup.edu.ph', 1, 'ivote', 'o4sarq', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE229', 'REYNALDO', 'A', 'GUERZON', 'reynaldoaguerzon@pup.edu.ph', 1, 'ivote', 'G4aTzk', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE230', 'ALBERTO', 'C', 'GUILLO', 'albertocguillo@pup.edu.ph', 1, 'ivote', 'rA8OUr', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE231', 'ADRIAN', 'R', 'GUINTO', 'adrianrguinto@pup.edu.ph', 1, 'ivote', 'ziNCue', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE232', 'FAUSTO', 'D', 'GUTIERREZ', 'faustodgutierrez@pup.edu.ph', 1, 'ivote', 'eqyWVE', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE233', 'MELINDA', 'W', 'GUTIERREZ', 'melindawgutierrez@pup.edu.ph', 1, 'ivote', 'lGcG9R', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE234', 'DANILO', 'D', 'HERNANDEZ', 'danilodhernandez@pup.edu.ph', 1, 'ivote', 'TiiC8s', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE235', 'ARGIE', 'B', 'HIFARVA', 'argiebhifarva@pup.edu.ph', 1, 'ivote', 'k2E4uE', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE236', 'PETE  CRIZURBAN', 'R', 'IBARRA', 'petecrizurbanribarra@pup.edu.ph', 1, 'ivote', 'I9qt6V', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE237', 'RONNIE', 'A', 'IDIAN', 'ronnieaidian@pup.edu.ph', 1, 'ivote', 'ZJ0Rib', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE238', 'EFREN', 'R', 'ILARINA', 'efrenrilarina@pup.edu.ph', 1, 'ivote', 'sKRfwf', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE239', 'VENANCIO', 'B', 'IRAULA', 'venanciobiraula@pup.edu.ph', 1, 'ivote', 'Ti7ee6', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE240', 'EMELITA', 'A', 'ISAAC', 'emelitaaisaac@pup.edu.ph', 1, 'ivote', 'Spe9yo', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE241', 'ANGELA', 'L', 'ISRAEL', 'angelalisrael@pup.edu.ph', 1, 'ivote', 'BSsX07', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE242', 'ANGELYN', 'C', 'JACOB', 'angelyncjacob@pup.edu.ph', 1, 'ivote', 'hKkeWQ', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE243', 'MARIFEL', 'I', 'JAVIER', 'marifelijavier@pup.edu.ph', 1, 'ivote', 'P5ve3I', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE244', 'RAQUEL', 'G', 'JAVIER', 'raquelgjavier@pup.edu.ph', 1, 'ivote', 'xBorV8', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE245', 'VALENTINO', 'B', 'JAZUL', 'valentinobjazul@pup.edu.ph', 1, 'ivote', 'h8Q0no', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE246', 'MANOLITO', 'S', 'JEREMILLO', 'manolitosjeremillo@pup.edu.ph', 1, 'ivote', 'Mwawpa', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE247', 'ERIC', 'A', 'JOYA', 'ericajoya@pup.edu.ph', 1, 'ivote', 'yOLkWG', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE248', 'CLINT  MICHAEL', 'F', 'LACDANG', 'clintmichaelflacdang@pup.edu.ph', 1, 'ivote', 'ZGVPNZ', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE249', 'RUDOLF  ANTHONY', 'A', 'LACERNA', 'rudolfanthonyalacerna@pup.edu.ph', 1, 'ivote', 'L5pyLO', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE250', 'JOY  ANNE', 'C', 'LAGRAMA', 'joyanneclagrama@pup.edu.ph', 1, 'ivote', 'DXoXDb', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE251', 'JENALYN', 'Y', 'LAI', 'jenalynylai@pup.edu.ph', 1, 'ivote', 'PqDZw6', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE252', 'MARVIN', 'G', 'LAI', 'marvinglai@pup.edu.ph', 1, 'ivote', 'DAqRsv', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE253', 'EDGARDO', 'A', 'LATOZA', 'edgardoalatoza@pup.edu.ph', 1, 'ivote', 'RXDw5u', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE254', 'BONIFACIO', 'S', 'LAYGO', 'bonifacioslaygo@pup.edu.ph', 1, 'ivote', 'wegQkO', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE255', 'LILIBETH', 'L', 'LAYGO', 'lilibethllaygo@pup.edu.ph', 1, 'ivote', 'BpNb1K', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE256', 'EMELINDA', 'C', 'LAYOS', 'emelindaclayos@pup.edu.ph', 1, 'ivote', '2pjtOF', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE257', 'ALVIN', 'J', 'LEGASPI', 'alvinjlegaspi@pup.edu.ph', 1, 'ivote', '8HNNYE', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE258', 'JEFFERSON', 'N', 'LEGASPI', 'jeffersonnlegaspi@pup.edu.ph', 1, 'ivote', 'KpqRPS', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE259', 'MARISSA', 'J', 'LEGASPI', 'marissajlegaspi@pup.edu.ph', 1, 'ivote', '6aClTI', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE260', 'GINA', 'S', 'LIM', 'ginaslim@pup.edu.ph', 1, 'ivote', 'QAahch', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE261', 'JASON', 'D', 'LIMKIAN', 'jasondlimkian@pup.edu.ph', 1, 'ivote', 'dG5yzn', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE262', 'ARLENE', 'D', 'LINGANAY', 'arlenedlinganay@pup.edu.ph', 1, 'ivote', '92QaEi', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE263', 'GARY  ANTONIO', 'C', 'LIRIO', 'garyantonioclirio@pup.edu.ph', 1, 'ivote', 'xnYoF4', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE264', 'MA.  DELIA', 'M', 'LIZ', 'madeliamliz@pup.edu.ph', 1, 'ivote', 'W6yVO2', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE265', 'RAQUEL', 'P', 'LOBIGAS', 'raquelplobigas@pup.edu.ph', 1, 'ivote', '4A0u2p', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE266', 'MARVIN', 'M', 'LOBOS', 'marvinmlobos@pup.edu.ph', 1, 'ivote', '7oMUWw', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE267', 'ROSIELYN', 'D', 'LOMTONG', 'rosielyndlomtong@pup.edu.ph', 1, 'ivote', 'jBLJkK', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE268', 'HERNANDO', 'G', 'LOPEZ', 'hernandoglopez@pup.edu.ph', 1, 'ivote', '93E769', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE269', 'MADELYN', 'G', 'LOPEZ', 'madelynglopez@pup.edu.ph', 1, 'ivote', 'RCSMAh', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE270', 'MA.  ESPERANZA', 'S', 'LORENZO', 'maesperanzaslorenzo@pup.edu.ph', 1, 'ivote', 'LPCsTV', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE271', 'JULIAN', 'L', 'LORICO', 'julianllorico@pup.edu.ph', 1, 'ivote', '73zeWz', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE272', 'ARNALDO', 'R', 'LUMABAT', 'arnaldorlumabat@pup.edu.ph', 1, 'ivote', 'FY1Mzh', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE273', 'BERNARDO', 'R', 'LUMABAT', 'bernardorlumabat@pup.edu.ph', 1, 'ivote', '53AEmF', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE274', 'JERRY', 'B', 'LUNA', 'jerrybluna@pup.edu.ph', 1, 'ivote', 'w39Jxq', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE275', 'ERNESTO', 'D', 'MACHADO', 'ernestodmachado@pup.edu.ph', 1, 'ivote', 'sA4Jvq', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE276', 'MERCEDITA', 'C', 'MAG-ISA', 'merceditacmag-isa@pup.edu.ph', 1, 'ivote', 'xOpjww', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE277', 'ROLITO', 'L', 'MAHAGUAY', 'rolitolmahaguay@pup.edu.ph', 1, 'ivote', '5rBPmC', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE278', 'LORITO', 'I', 'MAKABENTA', 'loritoimakabenta@pup.edu.ph', 1, 'ivote', 'JFKeAx', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE279', 'JALAINE  JOYCE', 'V', 'MALABANAN', 'jalainejoycevmalabanan@pup.edu.ph', 1, 'ivote', 'SZs21m', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE280', 'HILARION  HENRY', 'M', 'MALASIQUE', 'hilarionhenrymmalasique@pup.edu.ph', 1, 'ivote', 'gQb63n', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE281', 'NICOLAS', 'T', 'MALLARI', 'nicolastmallari@pup.edu.ph', 1, 'ivote', 'JjcHjS', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE282', 'LERMA', 'U', 'MALZAN', 'lermaumalzan@pup.edu.ph', 1, 'ivote', 'qiW8cL', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE283', 'LOURELIE', 'S', 'MAMPUSTI', 'loureliesmampusti@pup.edu.ph', 1, 'ivote', 'DHBbkU', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE284', 'MATHEW', 'S', 'MANANSALA', 'mathewsmanansala@pup.edu.ph', 1, 'ivote', 'fIzkzq', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE285', 'ROSANNA', 'D', 'MANANSALA', 'rosannadmanansala@pup.edu.ph', 1, 'ivote', 'uSNLQM', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE286', 'BERNICE', 'G', 'MANGABAT', 'bernicegmangabat@pup.edu.ph', 1, 'ivote', 'tIqxl2', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE287', 'LEVI', 'R', 'MANLAPAS', 'levirmanlapas@pup.edu.ph', 1, 'ivote', 'uU7dC1', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE288', 'MYRNA', 'F', 'MANLAPAS', 'myrnafmanlapas@pup.edu.ph', 1, 'ivote', 'GEtH0A', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE289', 'MARIA  ELENA', 'M', 'MANO', 'mariaelenammano@pup.edu.ph', 1, 'ivote', 'q4lJUY', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE290', 'CARMELITA', 'P', 'MAPANAO', 'carmelitapmapanao@pup.edu.ph', 1, 'ivote', 'o9uaOH', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE291', 'CECILIA', 'V', 'MARBELLA', 'ceciliavmarbella@pup.edu.ph', 1, 'ivote', 'WdUsUi', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE292', 'SANDRA', 'P', 'MARCOS', 'sandrapmarcos@pup.edu.ph', 1, 'ivote', 'ZHzY4c', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE293', 'ARLENE  JOY', 'M', 'MARQUEZ', 'arlenejoymmarquez@pup.edu.ph', 1, 'ivote', '8xW5Gp', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE294', 'EFREN', 'S', 'MARTIN', 'efrensmartin@pup.edu.ph', 1, 'ivote', 'vASeDt', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE295', 'DIOSDADO', 'L', 'MARTINEZ', 'diosdadolmartinez@pup.edu.ph', 1, 'ivote', 'pVLdV1', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE296', 'LAMBERTO  ANGEL', 'B', 'MARTINEZ', 'lambertoangelbmartinez@pup.edu.ph', 1, 'ivote', 'QFJNFo', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE297', 'JEAN  PAUL', 'G', 'MARTIREZ', 'jeanpaulgmartirez@pup.edu.ph', 1, 'ivote', 'WWLgK0', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE298', 'MARISSA', 'L', 'MAYRENA', 'marissalmayrena@pup.edu.ph', 1, 'ivote', 'Da8LfT', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE299', 'ADRIAN', 'B', 'MEDINA', 'adrianbmedina@pup.edu.ph', 1, 'ivote', 'REUZP0', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE300', 'ELIJAH', 'A', 'MEDINA', 'elijahamedina@pup.edu.ph', 1, 'ivote', 'jublVo', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE301', 'ESTELITA', 'E', 'MEDINA', 'estelitaemedina@pup.edu.ph', 1, 'ivote', 'YRe8Hr', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE302', 'LEMY', 'E', 'MEDINA', 'lemyemedina@pup.edu.ph', 1, 'ivote', '02MCD8', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE303', 'MANUEL  JR.', 'B', 'MEDINA', 'manueljrbmedina@pup.edu.ph', 1, 'ivote', 'm1K1J5', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE304', 'MARIA  PIA', 'V', 'MENDEZ', 'mariapiavmendez@pup.edu.ph', 1, 'ivote', '104pYp', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE305', 'KRISTIN  ANDREA', 'M', 'MENDOZA', 'kristinandreammendoza@pup.edu.ph', 1, 'ivote', 'vErwk8', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE306', 'MARY  JANE', 'G', 'MENDOZA', 'maryjanegmendoza@pup.edu.ph', 1, 'ivote', 'svCG9x', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE307', 'PAUL', 'G', 'MERCADO', 'paulgmercado@pup.edu.ph', 1, 'ivote', 'cLLERX', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE308', 'EMELINDA', 'A', 'MILLENA', 'emelindaamillena@pup.edu.ph', 1, 'ivote', 'KzSGwA', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE309', 'RAEMIL  JOSHUA', 'A', 'MILLENA', 'raemiljoshuaamillena@pup.edu.ph', 1, 'ivote', 'zq5OH6', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE310', 'RAMIR', 'M', 'MILLENA', 'ramirmmillena@pup.edu.ph', 1, 'ivote', 'uw11AW', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE311', 'ROGELIO  JR.', 'C', 'MOLINA', 'rogeliojrcmolina@pup.edu.ph', 1, 'ivote', 'aRDJyY', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE312', 'THELMA', 'L', 'MONTANA', 'thelmalmontana@pup.edu.ph', 1, 'ivote', 'mr4Y0O', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE313', 'YOLANDA', 'T', 'MONTANCES', 'yolandatmontances@pup.edu.ph', 1, 'ivote', 'GM41R0', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE314', 'HEMMADY', 'S', 'MORA', 'hemmadysmora@pup.edu.ph', 1, 'ivote', 'je9CCo', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE315', 'ALVIN', 'S', 'MORGA', 'alvinsmorga@pup.edu.ph', 1, 'ivote', 'Ugf0GO', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE316', 'DIVINA', 'M', 'MOROTA', 'divinammorota@pup.edu.ph', 1, 'ivote', 'cw6fx5', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE317', 'SHERYL  CINDY', 'L', 'MORTERA', 'sherylcindylmortera@pup.edu.ph', 1, 'ivote', '4NT69t', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE318', 'AVELINO', 'G', 'MUNGCAL', 'avelinogmungcal@pup.edu.ph', 1, 'ivote', '6uL4xf', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE319', 'MARIA  RUTH', 'M', 'MUNGCAL', 'mariaruthmmungcal@pup.edu.ph', 1, 'ivote', 'PELJfs', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE320', 'JENNIFER', 'D', 'MUNSAYAC', 'jenniferdmunsayac@pup.edu.ph', 1, 'ivote', 'H1d61e', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE321', 'JOEL', 'M', 'MUNSAYAC', 'joelmmunsayac@pup.edu.ph', 1, 'ivote', '9Qknbg', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE322', 'ARIANNE  NICOLE', 'S', 'NACHOR', 'ariannenicolesnachor@pup.edu.ph', 1, 'ivote', '2dTmQf', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE323', 'CONWE  JEME', 'I', 'NARIO', 'conwejemeinario@pup.edu.ph', 1, 'ivote', 'u7Vm98', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE324', 'JOANNA  RAVEANA', 'A', 'NARIO', 'joannaraveanaanario@pup.edu.ph', 1, 'ivote', '5r955q', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE325', 'MECMACK', 'A', 'NARTEA', 'mecmackanartea@pup.edu.ph', 1, 'ivote', 'JHs7uh', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE326', 'SALVADOR', 'R', 'NATOC', 'salvadorrnatoc@pup.edu.ph', 1, 'ivote', 'RM33ur', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE327', 'VERENA', 'P', 'NATOC', 'verenapnatoc@pup.edu.ph', 1, 'ivote', 'L3nRzh', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE328', 'JOCELYN', 'C', 'NAVA', 'jocelyncnava@pup.edu.ph', 1, 'ivote', 'wzi07Y', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE329', 'RAYMOND', 'E', 'NAVARRO', 'raymondenavarro@pup.edu.ph', 1, 'ivote', 'Qz0O5K', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE330', 'RACHEL', 'A', 'NAYRE', 'rachelanayre@pup.edu.ph', 1, 'ivote', 'xYyHnp', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE331', 'JOHN  MARK', 'N', 'NERO', 'johnmarknnero@pup.edu.ph', 1, 'ivote', 'uIEWJr', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE332', 'KATHERINE', 'M', 'NOBLE', 'katherinemnoble@pup.edu.ph', 1, 'ivote', 'puegO7', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE333', 'LIZA  MARIE', 'B', 'NUEVO', 'lizamariebnuevo@pup.edu.ph', 1, 'ivote', 'mXlU9M', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE334', 'ALDEN', 'D', 'OBUYES', 'aldendobuyes@pup.edu.ph', 1, 'ivote', 'vFnmRt', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL);
INSERT INTO `tblmember` (`strMemberId`, `strMemFname`, `strMemMname`, `strMemLname`, `strMemEmail`, `intMemSecQuesId`, `strMemSecQuesAnswer`, `strMemPasscode`, `blMemCodeSendStat`, `blMemDelete`, `created_at`, `updated_at`, `deleted_at`) VALUES
('CODE335', 'EVELYN', 'A', 'OCAMPO', 'evelynaocampo@pup.edu.ph', 1, 'ivote', 'R8VRVV', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE336', 'RUTH', 'R', 'OCLIDA', 'ruthroclida@pup.edu.ph', 1, 'ivote', 'R2KQ1K', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE337', 'GERLIE', 'C', 'OGATIS', 'gerliecogatis@pup.edu.ph', 1, 'ivote', 'knMVwO', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE338', 'RIZELLE  -', 'A', 'OLEGARIO', 'rizelleaolegario@pup.edu.ph', 1, 'ivote', 'buHfbd', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE339', 'ALFONSO', 'V', 'OLESCO  JR.', 'alfonsovolescojr.@pup.edu.ph', 1, 'ivote', '3uHYni', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE340', 'ANNIE', 'B', 'OLIVAR', 'anniebolivar@pup.edu.ph', 1, 'ivote', 'BC6OZN', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE341', 'THERESE  MARIE', 'A', 'OLIVER', 'theresemarieaoliver@pup.edu.ph', 1, 'ivote', 'rbanGA', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE342', 'ORLANDO  JR.', 'L', 'OLIVERIO', 'orlandojrloliverio@pup.edu.ph', 1, 'ivote', 'CPz1dU', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE343', 'MA.  LUISA', 'U', 'OLIVEROS', 'maluisauoliveros@pup.edu.ph', 1, 'ivote', 't07aBJ', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE344', 'HAYDEE', 'B', 'OPINA', 'haydeebopina@pup.edu.ph', 1, 'ivote', 'wVeHP7', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE345', 'FLORINDA', 'H', 'OQUINDO', 'florindahoquindo@pup.edu.ph', 1, 'ivote', 'vyaQht', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE346', 'CHRISTIAN', 'G', 'ORDANEL', 'christiangordanel@pup.edu.ph', 1, 'ivote', 'ZJk0Uz', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE347', 'NICK', 'J', 'OSORIO', 'nickjosorio@pup.edu.ph', 1, 'ivote', 'ifgYVT', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE348', 'RONELDA', 'C', 'PAAT', 'roneldacpaat@pup.edu.ph', 1, 'ivote', 'JvOFTL', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE349', 'AIRA  JEAN', 'O', 'PABALAN', 'airajeanopabalan@pup.edu.ph', 1, 'ivote', 'Zo6Oei', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE350', 'MARIA  CRISTINA', 'M', 'PACIS', 'mariacristinampacis@pup.edu.ph', 1, 'ivote', 'fgWxQG', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE351', 'ALJON', 'G', 'PADA', 'aljongpada@pup.edu.ph', 1, 'ivote', 'Yfwiwg', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE352', 'OCTAVIO', 'M', 'PAGALILAWAN', 'octaviompagalilawan@pup.edu.ph', 1, 'ivote', 'wjBPdT', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE353', 'JESCEL', 'D', 'PAGUIO', 'jesceldpaguio@pup.edu.ph', 1, 'ivote', 'M0B15J', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE354', 'ORLANDO', 'V', 'PAJABERA', 'orlandovpajabera@pup.edu.ph', 1, 'ivote', 'eO5HKz', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE355', 'NEZITAS', 'S', 'PAJARES', 'nezitasspajares@pup.edu.ph', 1, 'ivote', 'brdaoh', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE356', 'ROBERTO', 'S', 'PALILLO', 'robertospalillo@pup.edu.ph', 1, 'ivote', 'qcaTDe', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE357', 'REBECCA', 'E', 'PALMA', 'rebeccaepalma@pup.edu.ph', 1, 'ivote', 'V5p4oP', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE358', 'GINALYN', 'B', 'PANGHULAN', 'ginalynbpanghulan@pup.edu.ph', 1, 'ivote', 'mojI5k', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE359', 'JESSIE  JR.', 'M', 'PANGILINAN', 'jessiejrmpangilinan@pup.edu.ph', 1, 'ivote', 'bGhAlI', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE360', 'BERNADETTE', 'M', 'PANIBIO', 'bernadettempanibio@pup.edu.ph', 1, 'ivote', 'zm7SRd', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE361', 'LOIDA', 'I', 'PARAMBITA', 'loidaiparambita@pup.edu.ph', 1, 'ivote', 'OUbT56', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE362', 'JESSIE  MHAR', 'D', 'PASUMBAL', 'jessiemhardpasumbal@pup.edu.ph', 1, 'ivote', 'LwuzGR', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE363', 'MELBA', 'A', 'PAUAL', 'melbaapaual@pup.edu.ph', 1, 'ivote', 'RWsLHF', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE364', 'CASIANA', 'S', 'PAYUMO', 'casianaspayumo@pup.edu.ph', 1, 'ivote', 'qddMoI', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE365', 'MAURA', 'C', 'PAZ', 'mauracpaz@pup.edu.ph', 1, 'ivote', 'CfziD5', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE366', 'RAFAEL  MICHAEL', 'O', 'PAZ', 'rafaelmichaelopaz@pup.edu.ph', 1, 'ivote', 'XZig4A', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE367', 'GERRY', 'C', 'PECATOSTE', 'gerrycpecatoste@pup.edu.ph', 1, 'ivote', 'qq2hlU', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE368', 'MICHAEL', 'S', 'PECHARDO', 'michaelspechardo@pup.edu.ph', 1, 'ivote', 'trevRB', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE369', 'EMERITO', 'D', 'PEDRENA', 'emeritodpedrena@pup.edu.ph', 1, 'ivote', 'jlhTKs', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE370', 'MARIO', 'S', 'PELAGIO', 'mariospelagio@pup.edu.ph', 1, 'ivote', 'MWSgCI', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE371', 'MICHAEL', 'S', 'PELAGIO', 'michaelspelagio@pup.edu.ph', 1, 'ivote', 'wUro4p', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE372', 'SUSANA', 'V', 'PELAGIO', 'susanavpelagio@pup.edu.ph', 1, 'ivote', 'n5jXwx', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE373', 'FLORA', 'F', 'PELAYO', 'florafpelayo@pup.edu.ph', 1, 'ivote', 'HMer7N', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE374', 'EDITHA', 'A', 'PERALTA', 'edithaaperalta@pup.edu.ph', 1, 'ivote', 'M8hWiN', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE375', 'ARTURO', 'F', 'PEREZ', 'arturofperez@pup.edu.ph', 1, 'ivote', 'GCspUN', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE376', 'CARMELA', 'S', 'PEREZ', 'carmelasperez@pup.edu.ph', 1, 'ivote', 'qBffv6', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE377', 'EMETERIA  LEONILA', 'A', 'PEREZ', 'emeterialeonilaaperez@pup.edu.ph', 1, 'ivote', 'pqAFYF', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE378', 'LIEZEL', 'M', 'PEREZ', 'liezelmperez@pup.edu.ph', 1, 'ivote', 'd5jZCB', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE379', 'CHERRY  GRACE', 'B', 'PIGON', 'cherrygracebpigon@pup.edu.ph', 1, 'ivote', 'nZg1xI', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE380', 'ROSALIA', 'P', 'PINLAC', 'rosaliappinlac@pup.edu.ph', 1, 'ivote', '2cG9TR', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE381', 'JOCELYN', 'E', 'PONCE', 'jocelyneponce@pup.edu.ph', 1, 'ivote', 'eNcWeL', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE382', 'JOVIT', 'S', 'PONON', 'jovitsponon@pup.edu.ph', 1, 'ivote', 'Cw7fJt', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE383', 'MA.  FLORA', 'M', 'PORCIUNCULA', 'mafloramporciuncula@pup.edu.ph', 1, 'ivote', 'HT8pS4', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE384', 'ELENITA', 'R', 'PORTEZ', 'elenitarportez@pup.edu.ph', 1, 'ivote', 'rsX4e9', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE385', 'ALEXANDER  JR.', 'B', 'PRUDENTE', 'alexanderjrbprudente@pup.edu.ph', 1, 'ivote', 'crV9Q4', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE386', 'JUAN', 'L', 'PUBLICO  JR.', 'juanlpublicojr.@pup.edu.ph', 1, 'ivote', 'Xnvn8x', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE387', 'JESSIE', 'I', 'QUIERREZ', 'jessieiquierrez@pup.edu.ph', 1, 'ivote', 'HFoDtA', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE388', 'EMELITA', 'T', 'QUILINGAN', 'emelitatquilingan@pup.edu.ph', 1, 'ivote', '4Kol8B', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE389', 'RODRIGO', 'R', 'QUILINGAN', 'rodrigorquilingan@pup.edu.ph', 1, 'ivote', 'u301A7', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE390', 'ROLANDO  P.', 'J', 'QUINONES', 'rolandopjquinones@pup.edu.ph', 1, 'ivote', 'q48GtJ', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE391', 'ADAM', 'V', 'RAMILO', 'adamvramilo@pup.edu.ph', 1, 'ivote', 'qkxL02', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE392', 'JUAN', 'A', 'RAMIREZ', 'juanaramirez@pup.edu.ph', 1, 'ivote', 'PIDfhl', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE393', 'BARSILISA', 'B', 'RAMISCAL', 'barsilisabramiscal@pup.edu.ph', 1, 'ivote', 'njdxwr', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE394', 'RICARDO', 'F', 'RAMISCAL', 'ricardoframiscal@pup.edu.ph', 1, 'ivote', '1J8TxU', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE395', 'CYRIL', 'E', 'RAMOS', 'cyrileramos@pup.edu.ph', 1, 'ivote', 'YgSTS4', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE396', 'JANETH', 'H', 'RAMOS', 'janethhramos@pup.edu.ph', 1, 'ivote', '7STKo6', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE397', 'MAURICIO', 'L', 'RASOLA', 'mauriciolrasola@pup.edu.ph', 1, 'ivote', 'phpMDp', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE398', 'VIOLETA', 'L', 'RATCHO', 'violetalratcho@pup.edu.ph', 1, 'ivote', 'pKRxsS', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE399', 'MARY  GRACE', 'S', 'REAMBILLO', 'marygracesreambillo@pup.edu.ph', 1, 'ivote', '5wtSuF', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE400', 'ROSE  ANNE', 'L', 'REANO', 'roseannelreano@pup.edu.ph', 1, 'ivote', 'gTSXvF', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE401', 'LIZYL', 'R', 'REBUSQILLO', 'lizylrrebusqillo@pup.edu.ph', 1, 'ivote', 'i1zLrX', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE402', 'ARNEL', 'O', 'RENDON', 'arnelorendon@pup.edu.ph', 1, 'ivote', 'PwvYsE', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE403', 'LEOMAR', 'P', 'REQUEJO', 'leomarprequejo@pup.edu.ph', 1, 'ivote', 'VlplJn', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE404', 'AYREENLEE', 'E', 'RESUS', 'ayreenleeeresus@pup.edu.ph', 1, 'ivote', '9oNfrN', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE405', 'GREGORIO', 'A', 'REYES', 'gregorioareyes@pup.edu.ph', 1, 'ivote', 'Nm9zVd', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE406', 'JINKY', 'D', 'REYES', 'jinkydreyes@pup.edu.ph', 1, 'ivote', 'phsS2a', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE407', 'MAGDALENA', 'S', 'REYES', 'magdalenasreyes@pup.edu.ph', 1, 'ivote', 'gvJEVy', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE408', 'MARY  ANN', 'T', 'REYES', 'maryanntreyes@pup.edu.ph', 1, 'ivote', 'HfA6iv', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE409', 'PORTIA  MARGARITA', 'R', 'REYES', 'portiamargaritarreyes@pup.edu.ph', 1, 'ivote', 'W9HO2U', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE410', 'RENE  LAURENTE', 'G', 'REYES', 'renelaurentegreyes@pup.edu.ph', 1, 'ivote', 'ASOb1J', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE411', 'GEORGE', 'A', 'RICO', 'georgearico@pup.edu.ph', 1, 'ivote', 'vEd0DU', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE412', 'JEFFERSON', 'B', 'RIEGO', 'jeffersonbriego@pup.edu.ph', 1, 'ivote', 'cTSNYc', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE413', 'ANDREA  ROSE', 'E', 'RIMORIN', 'andrearoseerimorin@pup.edu.ph', 1, 'ivote', 'fHEKcU', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE414', 'ROBERTO', 'S', 'RIMORIN', 'robertosrimorin@pup.edu.ph', 1, 'ivote', 'zK8xLd', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE415', 'REMEGIO', 'C', 'RIOS', 'remegiocrios@pup.edu.ph', 1, 'ivote', 'itF2Fp', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE416', 'JEFFREY', 'V', 'RIVERA', 'jeffreyvrivera@pup.edu.ph', 1, 'ivote', '2OKvcF', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE417', 'ARNOLD', 'O', 'RODRIGUEZ', 'arnoldorodriguez@pup.edu.ph', 1, 'ivote', 'FE6AUr', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE418', 'ROBERTITO', 'S', 'ROQUE', 'robertitosroque@pup.edu.ph', 1, 'ivote', 'eP03JW', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE419', 'RYAN', 'C', 'ROQUE', 'ryancroque@pup.edu.ph', 1, 'ivote', 'Wvn3Jh', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE420', 'MARIA  JUNITHESMER', 'D', 'ROSALES', 'mariajunithesmerdrosales@pup.edu.ph', 1, 'ivote', '478yTR', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE421', 'ROBERTO', 'H', 'ROZON', 'robertohrozon@pup.edu.ph', 1, 'ivote', 'pCBREC', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE422', 'FRESCIAN', 'C', 'RUIZ', 'fresciancruiz@pup.edu.ph', 1, 'ivote', 'ulLuD2', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE423', 'RIA', 'A', 'SAGUM', 'riaasagum@pup.edu.ph', 1, 'ivote', 't0Jnaz', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE424', 'OFELIA', 'D', 'SALAMATIN', 'ofeliadsalamatin@pup.edu.ph', 1, 'ivote', 'E6taji', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE425', 'MICHELLE', 'L', 'SALAZAR', 'michellelsalazar@pup.edu.ph', 1, 'ivote', 'LjQekf', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE426', 'RAQUEL', 'G', 'SALAZAR', 'raquelgsalazar@pup.edu.ph', 1, 'ivote', 'mIXKKe', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE427', 'MYLA', 'D', 'SALCEDO', 'myladsalcedo@pup.edu.ph', 1, 'ivote', 'EAt4u3', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE428', 'BENEVER', 'A', 'SALVADOR', 'beneverasalvador@pup.edu.ph', 1, 'ivote', 'j7fgQz', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE429', 'GEOFFREY', 'T', 'SALVADOR', 'geoffreytsalvador@pup.edu.ph', 1, 'ivote', '8YF7xc', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE430', 'MARIA  MERCEDES', 'R', 'SALVADOR', 'mariamercedesrsalvador@pup.edu.ph', 1, 'ivote', 'yEohOd', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE431', 'MERCEDES', 'R', 'SALVADOR', 'mercedesrsalvador@pup.edu.ph', 1, 'ivote', 'sMvA8v', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE432', 'TIRSOLITO', 'C', 'SALVADOR', 'tirsolitocsalvador@pup.edu.ph', 1, 'ivote', 'CknlkY', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE433', 'GISCELLE  IVETH', 'J', 'SAMONTE', 'giscelleivethjsamonte@pup.edu.ph', 1, 'ivote', '8SfbSS', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE434', 'MELODIA', 'R', 'SAMPAN', 'melodiarsampan@pup.edu.ph', 1, 'ivote', 'ehsGzo', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE435', 'KAREN', 'G', 'SAN  DIEGO', 'karengsandiego@pup.edu.ph', 1, 'ivote', 'GYKG6a', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE436', 'HILDA', 'F', 'SAN  GABRIEL', 'hildafsangabriel@pup.edu.ph', 1, 'ivote', 'phnMIw', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE437', 'MANOLITO', 'S', 'SAN  JOSE', 'manolitossanjose@pup.edu.ph', 1, 'ivote', '96PrRb', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE438', 'ANA  LIZA', 'H', 'SANCHEZ', 'analizahsanchez@pup.edu.ph', 1, 'ivote', 'uHH4Z0', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE439', 'JOANNE  JOY', 'M', 'SANTIAGO', 'joannejoymsantiago@pup.edu.ph', 1, 'ivote', 'FyUk1i', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE440', 'SAMUEL', 'S', 'SANTIAGO', 'samuelssantiago@pup.edu.ph', 1, 'ivote', 'lQ1kas', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE441', 'ALMA', 'S', 'SANTOS', 'almassantos@pup.edu.ph', 1, 'ivote', 'd0vidB', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE442', 'NINO  INOCENCIO', 'A', 'SANTOS', 'ninoinocencioasantos@pup.edu.ph', 1, 'ivote', 'uaDfoV', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE443', 'JOSE', 'D', 'SARMIENTO', 'josedsarmiento@pup.edu.ph', 1, 'ivote', 'VKoMZb', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE444', 'MONICA', 'C', 'SARRONDO', 'monicacsarrondo@pup.edu.ph', 1, 'ivote', 'PiHXj2', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE445', 'MARY', 'J', 'SAWA-AN', 'maryjsawa-an@pup.edu.ph', 1, 'ivote', 'LnBdlj', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE446', 'EDWIN', 'P', 'SEDILLA', 'edwinpsedilla@pup.edu.ph', 1, 'ivote', 'tp26ja', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE447', 'NINA', 'A', 'SISON', 'ninaasison@pup.edu.ph', 1, 'ivote', 'jWsIAB', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE448', 'SIXER', 'A', 'SITJAR', 'sixerasitjar@pup.edu.ph', 1, 'ivote', 'QWVFwQ', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE449', 'MA.  CORAZON', 'N', 'SOLANO', 'macorazonnsolano@pup.edu.ph', 1, 'ivote', 'sPBGfc', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE450', 'REYNALDO', 'A', 'SOLANO', 'reynaldoasolano@pup.edu.ph', 1, 'ivote', 'NfaGuV', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE451', 'RICHELLE', 'V', 'SOLOMON', 'richellevsolomon@pup.edu.ph', 1, 'ivote', 'SLRliU', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE452', 'MA.  JOEPE', 'M', 'SOLOSA', 'majoepemsolosa@pup.edu.ph', 1, 'ivote', 'h9tnQi', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE453', 'PERRY  DAVID', 'L', 'SOLOSA', 'perrydavidlsolosa@pup.edu.ph', 1, 'ivote', 'n0hoSV', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE454', 'MARY  SHANE', 'P', 'SORIANO', 'maryshanepsoriano@pup.edu.ph', 1, 'ivote', 'vdPnG8', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE455', 'RAYAN', 'C', 'SORIANO', 'rayancsoriano@pup.edu.ph', 1, 'ivote', 'SE2aRD', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE456', 'CATHERINE', 'D', 'SOTTO', 'catherinedsotto@pup.edu.ph', 1, 'ivote', '4mNzEQ', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE457', 'ROSA', 'M', 'STA.  MARIA', 'rosamsta.maria@pup.edu.ph', 1, 'ivote', 't0rLjW', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE458', 'KEVIN', 'M', 'SULIVA', 'kevinmsuliva@pup.edu.ph', 1, 'ivote', 'POXtSa', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE459', 'CONCEPCION', 'R', 'SUMADSAD', 'concepcionrsumadsad@pup.edu.ph', 1, 'ivote', 'iATiyy', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE460', 'CAROLINE', 'T', 'SUMANDE', 'carolinetsumande@pup.edu.ph', 1, 'ivote', 'eBROFk', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE461', 'JOCELLE  ANNE', 'A', 'SUMPAY', 'jocelleanneasumpay@pup.edu.ph', 1, 'ivote', 'XobjM5', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE462', 'PRISTOLINE', 'S', 'SUYAT', 'pristolinessuyat@pup.edu.ph', 1, 'ivote', 'I0Vz3F', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE463', 'SHAINALYN', 'M', 'TANA', 'shainalynmtana@pup.edu.ph', 1, 'ivote', 'u8CRFH', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE464', 'NEMIA', 'R', 'TANASAS', 'nemiartanasas@pup.edu.ph', 1, 'ivote', 'WRovvq', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE465', 'EMELIE', 'D', 'TATON', 'emeliedtaton@pup.edu.ph', 1, 'ivote', 'slouno', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE466', 'PEDERITO', 'M', 'TENERIFE  JR.', 'pederitomtenerifejr.@pup.edu.ph', 1, 'ivote', 'kcSpE4', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE467', 'ALYSSA', 'M', 'TEODORO', 'alyssamteodoro@pup.edu.ph', 1, 'ivote', 'gDZGhn', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE468', 'MA.  GAY', 'M', 'TEOPENGCO', 'magaymteopengco@pup.edu.ph', 1, 'ivote', 'INtKXJ', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE469', 'FREDDIE', 'L', 'TESTA', 'freddieltesta@pup.edu.ph', 1, 'ivote', 'UnQGrL', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE470', 'MARC  ERICK', 'V', 'TIOSING', 'marcerickvtiosing@pup.edu.ph', 1, 'ivote', 'N2gopU', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE471', 'FLORENDO', '', 'TOBIAS', 'florendotobias@pup.edu.ph', 1, 'ivote', 'IaNWFi', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE472', 'APOLINAR  JULIUS', 'E', 'TOLENTINO', 'apolinarjuliusetolentino@pup.edu.ph', 1, 'ivote', '543O9D', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE473', 'ARMANDO', 'A', 'TORRES', 'armandoatorres@pup.edu.ph', 1, 'ivote', 'se8rix', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE474', 'BENJAMIN', 'M', 'TORRES', 'benjaminmtorres@pup.edu.ph', 1, 'ivote', 'viCrE8', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE475', 'MA.  RACHEL', 'C', 'TORRES', 'marachelctorres@pup.edu.ph', 1, 'ivote', 'XxlDfr', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE476', 'CHRISTIAN  PAUL', 'B', 'TRANCE', 'christianpaulbtrance@pup.edu.ph', 1, 'ivote', '5eW0L9', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE477', 'CYNTHIA', 'C', 'TRINIDAD', 'cynthiactrinidad@pup.edu.ph', 1, 'ivote', 'dwrAyk', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE478', 'ARIEL', 'P', 'TUAZON', 'arielptuazon@pup.edu.ph', 1, 'ivote', 'FnvGT4', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE479', 'LUZVIMINDA', 'O', 'TUGADE', 'luzvimindaotugade@pup.edu.ph', 1, 'ivote', 'fgANrA', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE480', 'ENGELBERT', 'S', 'TUNO', 'engelbertstuno@pup.edu.ph', 1, 'ivote', 'b8vJ15', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE481', 'VILMA', 'S', 'TUNO', 'vilmastuno@pup.edu.ph', 1, 'ivote', 'epTZ8b', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE482', 'ANALYN', 'L', 'UBA', 'analynluba@pup.edu.ph', 1, 'ivote', 'FB83sK', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE483', 'GRACE', 'C', 'UDAUNDO', 'gracecudaundo@pup.edu.ph', 1, 'ivote', 'qDvqzo', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE484', 'ANTONIUS', 'C', 'UMALI', 'antoniuscumali@pup.edu.ph', 1, 'ivote', '6bVAYT', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE485', 'LAURENCE', 'P', 'USONA', 'laurencepusona@pup.edu.ph', 1, 'ivote', 'aRErzQ', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE486', 'MARY  GRACE', 'A', 'UYAP', 'marygraceauyap@pup.edu.ph', 1, 'ivote', 'lGARqP', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE487', 'RENALYN', 'J', 'VALDEZ', 'renalynjvaldez@pup.edu.ph', 1, 'ivote', 'Q4bDlV', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE488', 'EILEEN  JOY', 'M', 'VALIENTE', 'eileenjoymvaliente@pup.edu.ph', 1, 'ivote', '6GCTLf', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE489', 'CONCEPCION', 'M', 'VEDASTO', 'concepcionmvedasto@pup.edu.ph', 1, 'ivote', 'OoWtOe', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE490', 'MARIENEL', 'N', 'VELASCO', 'marienelnvelasco@pup.edu.ph', 1, 'ivote', 'MXuU3r', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE491', 'LIZBETTE', 'R', 'VERGARA', 'lizbettervergara@pup.edu.ph', 1, 'ivote', 'tU3Zuq', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE492', 'AMOR', 'C', 'VICTORIO', 'amorcvictorio@pup.edu.ph', 1, 'ivote', 'PsVJBm', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE493', 'EUGIE', 'N', 'VICTORIO', 'eugienvictorio@pup.edu.ph', 1, 'ivote', 'CQpxNW', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE494', 'JOHN  DAHRELL', 'J', 'VILELA', 'johndahrelljvilela@pup.edu.ph', 1, 'ivote', 'DA3vOs', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE495', 'JESUS  EMMANUEL', 'S', 'VILLAFUERTE', 'jesusemmanuelsvillafuerte@pup.edu.ph', 1, 'ivote', '9C1YTA', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE496', 'FREDERICK', 'M', 'VILLAMOR', 'frederickmvillamor@pup.edu.ph', 1, 'ivote', 'Hx12NH', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE497', 'FERDINAND', 'S', 'VILLANUEVA', 'ferdinandsvillanueva@pup.edu.ph', 1, 'ivote', '1EN4dp', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE498', 'DAISY', 'G', 'VILLARANTE', 'daisygvillarante@pup.edu.ph', 1, 'ivote', 'VF1Bx2', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE499', 'ANGELITA', 'S', 'VILLARUEL', 'angelitasvillaruel@pup.edu.ph', 1, 'ivote', 'jNOuaQ', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE500', 'JOHN  CARLO', 'H', 'VILLEGAS', 'johncarlohvillegas@pup.edu.ph', 1, 'ivote', 'e8VO7R', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE501', 'MAY  ROSE', 'M', 'VILLEGAS', 'mayrosemvillegas@pup.edu.ph', 1, 'ivote', 'hcpeWv', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE502', 'JHUNEL', 'G', 'VINARAO', 'jhunelgvinarao@pup.edu.ph', 1, 'ivote', '6SyjuV', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE503', 'ANN-LYN', 'O', 'VINUYA', 'annlynovinuya@pup.edu.ph', 1, 'ivote', 'VXERKH', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE504', 'JOSEPH  REYLAN', 'B', 'VIRAY', 'josephreylanbviray@pup.edu.ph', 1, 'ivote', 'gYMETz', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE505', 'KRIZTINE', 'R', 'VIRAY', 'kriztinerviray@pup.edu.ph', 1, 'ivote', 'xNxIkM', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE506', 'ROLAND', 'C', 'VIRAY', 'rolandcviray@pup.edu.ph', 1, 'ivote', 'L8IHzv', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE507', 'HAZEL  MARIE', 'M', 'VITALES', 'hazelmariemvitales@pup.edu.ph', 1, 'ivote', '5hNwrW', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE508', 'BENJAMIN', 'T', 'YAMSON  JR.', 'benjamintyamsonjr.@pup.edu.ph', 1, 'ivote', 'xuhxqn', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE509', 'MA.  LIZA', 'T', 'YANES', 'malizatyanes@pup.edu.ph', 1, 'ivote', 'GIUprB', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE510', 'MARY  GRACE', 'F', 'YEBRA', 'marygracefyebra@pup.edu.ph', 1, 'ivote', 'NsJwhg', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL),
('CODE511', 'MARIA  THERESA', 'M', 'ZAPANTA', 'mariatheresamzapanta@pup.edu.ph', 1, 'ivote', '5Vojto', 0, 0, '2025-03-11 12:56:32', '2025-03-11 12:56:32', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=latin1;

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
(8, 'CODE008', 'area', 'PUP'),
(9, 'CODE009', 'area', 'PUP'),
(10, 'CODE010', 'area', 'PUP'),
(11, 'CODE011', 'area', 'PUP'),
(12, 'CODE012', 'area', 'PUP'),
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
(35, 'CODE035', 'area', 'PUP'),
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
(71, 'CODE071', 'area', 'PUP'),
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
(84, 'CODE084', 'area', 'PUP'),
(85, 'CODE085', 'area', 'PUP'),
(86, 'CODE086', 'area', 'PUP'),
(87, 'CODE087', 'area', 'PUP'),
(88, 'CODE088', 'area', 'PUP'),
(89, 'CODE089', 'area', 'PUP'),
(90, 'CODE090', 'area', 'PUP'),
(91, 'CODE091', 'area', 'PUP'),
(92, 'CODE092', 'area', 'PUP'),
(93, 'CODE093', 'area', 'PUP'),
(94, 'CODE094', 'area', 'PUP'),
(95, 'CODE095', 'area', 'PUP'),
(96, 'CODE096', 'area', 'PUP'),
(97, 'CODE097', 'area', 'PUP'),
(98, 'CODE098', 'area', 'PUP'),
(99, 'CODE099', 'area', 'PUP'),
(100, 'CODE100', 'area', 'PUP'),
(101, 'CODE101', 'area', 'PUP'),
(102, 'CODE102', 'area', 'PUP'),
(103, 'CODE103', 'area', 'PUP'),
(104, 'CODE104', 'area', 'PUP'),
(105, 'CODE105', 'area', 'PUP'),
(106, 'CODE106', 'area', 'PUP'),
(107, 'CODE107', 'area', 'PUP'),
(108, 'CODE108', 'area', 'PUP'),
(109, 'CODE109', 'area', 'PUP'),
(110, 'CODE110', 'area', 'PUP'),
(111, 'CODE111', 'area', 'PUP'),
(112, 'CODE112', 'area', 'PUP'),
(113, 'CODE113', 'area', 'PUP'),
(114, 'CODE114', 'area', 'PUP'),
(115, 'CODE115', 'area', 'PUP'),
(116, 'CODE116', 'area', 'PUP'),
(117, 'CODE117', 'area', 'PUP'),
(118, 'CODE118', 'area', 'PUP'),
(119, 'CODE119', 'area', 'PUP'),
(120, 'CODE120', 'area', 'PUP'),
(121, 'CODE121', 'area', 'PUP'),
(122, 'CODE122', 'area', 'PUP'),
(123, 'CODE123', 'area', 'PUP'),
(124, 'CODE124', 'area', 'PUP'),
(125, 'CODE125', 'area', 'PUP'),
(126, 'CODE126', 'area', 'PUP'),
(127, 'CODE127', 'area', 'PUP'),
(128, 'CODE128', 'area', 'PUP'),
(129, 'CODE129', 'area', 'PUP'),
(130, 'CODE130', 'area', 'PUP'),
(131, 'CODE131', 'area', 'PUP'),
(132, 'CODE132', 'area', 'PUP'),
(133, 'CODE133', 'area', 'PUP'),
(134, 'CODE134', 'area', 'PUP'),
(135, 'CODE135', 'area', 'PUP'),
(136, 'CODE136', 'area', 'PUP'),
(137, 'CODE137', 'area', 'PUP'),
(138, 'CODE138', 'area', 'PUP'),
(139, 'CODE139', 'area', 'PUP'),
(140, 'CODE140', 'area', 'PUP'),
(141, 'CODE141', 'area', 'PUP'),
(142, 'CODE142', 'area', 'PUP'),
(143, 'CODE143', 'area', 'PUP'),
(144, 'CODE144', 'area', 'PUP'),
(145, 'CODE145', 'area', 'PUP'),
(146, 'CODE146', 'area', 'PUP'),
(147, 'CODE147', 'area', 'PUP'),
(148, 'CODE148', 'area', 'PUP'),
(149, 'CODE149', 'area', 'PUP'),
(150, 'CODE150', 'area', 'PUP'),
(151, 'CODE151', 'area', 'PUP'),
(152, 'CODE152', 'area', 'PUP'),
(153, 'CODE153', 'area', 'PUP'),
(154, 'CODE154', 'area', 'PUP'),
(155, 'CODE155', 'area', 'PUP'),
(156, 'CODE156', 'area', 'PUP'),
(157, 'CODE157', 'area', 'PUP'),
(158, 'CODE158', 'area', 'PUP'),
(159, 'CODE159', 'area', 'PUP'),
(160, 'CODE160', 'area', 'PUP'),
(161, 'CODE161', 'area', 'PUP'),
(162, 'CODE162', 'area', 'PUP'),
(163, 'CODE163', 'area', 'PUP'),
(164, 'CODE164', 'area', 'PUP'),
(165, 'CODE165', 'area', 'PUP'),
(166, 'CODE166', 'area', 'PUP'),
(167, 'CODE167', 'area', 'PUP'),
(168, 'CODE168', 'area', 'PUP'),
(169, 'CODE169', 'area', 'PUP'),
(170, 'CODE170', 'area', 'PUP'),
(171, 'CODE171', 'area', 'PUP'),
(172, 'CODE172', 'area', 'PUP'),
(173, 'CODE173', 'area', 'PUP'),
(174, 'CODE174', 'area', 'PUP'),
(175, 'CODE175', 'area', 'PUP'),
(176, 'CODE176', 'area', 'PUP'),
(177, 'CODE177', 'area', 'PUP'),
(178, 'CODE178', 'area', 'PUP'),
(179, 'CODE179', 'area', 'PUP'),
(180, 'CODE180', 'area', 'PUP'),
(181, 'CODE181', 'area', 'PUP'),
(182, 'CODE182', 'area', 'PUP'),
(183, 'CODE183', 'area', 'PUP'),
(184, 'CODE184', 'area', 'PUP'),
(185, 'CODE185', 'area', 'PUP'),
(186, 'CODE186', 'area', 'PUP'),
(187, 'CODE187', 'area', 'PUP'),
(188, 'CODE188', 'area', 'PUP'),
(189, 'CODE189', 'area', 'PUP'),
(190, 'CODE190', 'area', 'PUP'),
(191, 'CODE191', 'area', 'PUP'),
(192, 'CODE192', 'area', 'PUP'),
(193, 'CODE193', 'area', 'PUP'),
(194, 'CODE194', 'area', 'PUP'),
(195, 'CODE195', 'area', 'PUP'),
(196, 'CODE196', 'area', 'PUP'),
(197, 'CODE197', 'area', 'PUP'),
(198, 'CODE198', 'area', 'PUP'),
(199, 'CODE199', 'area', 'PUP'),
(200, 'CODE200', 'area', 'PUP'),
(201, 'CODE201', 'area', 'PUP'),
(202, 'CODE202', 'area', 'PUP'),
(203, 'CODE203', 'area', 'PUP'),
(204, 'CODE204', 'area', 'PUP'),
(205, 'CODE205', 'area', 'PUP'),
(206, 'CODE206', 'area', 'PUP'),
(207, 'CODE207', 'area', 'PUP'),
(208, 'CODE208', 'area', 'PUP'),
(209, 'CODE209', 'area', 'PUP'),
(210, 'CODE210', 'area', 'PUP'),
(211, 'CODE211', 'area', 'PUP'),
(212, 'CODE212', 'area', 'PUP'),
(213, 'CODE213', 'area', 'PUP'),
(214, 'CODE214', 'area', 'PUP'),
(215, 'CODE215', 'area', 'PUP'),
(216, 'CODE216', 'area', 'PUP'),
(217, 'CODE217', 'area', 'PUP'),
(218, 'CODE218', 'area', 'PUP'),
(219, 'CODE219', 'area', 'PUP'),
(220, 'CODE220', 'area', 'PUP'),
(221, 'CODE221', 'area', 'PUP'),
(222, 'CODE222', 'area', 'PUP'),
(223, 'CODE223', 'area', 'PUP'),
(224, 'CODE224', 'area', 'PUP'),
(225, 'CODE225', 'area', 'PUP'),
(226, 'CODE226', 'area', 'PUP'),
(227, 'CODE227', 'area', 'PUP'),
(228, 'CODE228', 'area', 'PUP'),
(229, 'CODE229', 'area', 'PUP'),
(230, 'CODE230', 'area', 'PUP'),
(231, 'CODE231', 'area', 'PUP'),
(232, 'CODE232', 'area', 'PUP'),
(233, 'CODE233', 'area', 'PUP'),
(234, 'CODE234', 'area', 'PUP'),
(235, 'CODE235', 'area', 'PUP'),
(236, 'CODE236', 'area', 'PUP'),
(237, 'CODE237', 'area', 'PUP'),
(238, 'CODE238', 'area', 'PUP'),
(239, 'CODE239', 'area', 'PUP'),
(240, 'CODE240', 'area', 'PUP'),
(241, 'CODE241', 'area', 'PUP'),
(242, 'CODE242', 'area', 'PUP'),
(243, 'CODE243', 'area', 'PUP'),
(244, 'CODE244', 'area', 'PUP'),
(245, 'CODE245', 'area', 'PUP'),
(246, 'CODE246', 'area', 'PUP'),
(247, 'CODE247', 'area', 'PUP'),
(248, 'CODE248', 'area', 'PUP'),
(249, 'CODE249', 'area', 'PUP'),
(250, 'CODE250', 'area', 'PUP'),
(251, 'CODE251', 'area', 'PUP'),
(252, 'CODE252', 'area', 'PUP'),
(253, 'CODE253', 'area', 'PUP'),
(254, 'CODE254', 'area', 'PUP'),
(255, 'CODE255', 'area', 'PUP'),
(256, 'CODE256', 'area', 'PUP'),
(257, 'CODE257', 'area', 'PUP'),
(258, 'CODE258', 'area', 'PUP'),
(259, 'CODE259', 'area', 'PUP'),
(260, 'CODE260', 'area', 'PUP'),
(261, 'CODE261', 'area', 'PUP'),
(262, 'CODE262', 'area', 'PUP'),
(263, 'CODE263', 'area', 'PUP'),
(264, 'CODE264', 'area', 'PUP'),
(265, 'CODE265', 'area', 'PUP'),
(266, 'CODE266', 'area', 'PUP'),
(267, 'CODE267', 'area', 'PUP'),
(268, 'CODE268', 'area', 'PUP'),
(269, 'CODE269', 'area', 'PUP'),
(270, 'CODE270', 'area', 'PUP'),
(271, 'CODE271', 'area', 'PUP'),
(272, 'CODE272', 'area', 'PUP'),
(273, 'CODE273', 'area', 'PUP'),
(274, 'CODE274', 'area', 'PUP'),
(275, 'CODE275', 'area', 'PUP'),
(276, 'CODE276', 'area', 'PUP'),
(277, 'CODE277', 'area', 'PUP'),
(278, 'CODE278', 'area', 'PUP'),
(279, 'CODE279', 'area', 'PUP'),
(280, 'CODE280', 'area', 'PUP'),
(281, 'CODE281', 'area', 'PUP'),
(282, 'CODE282', 'area', 'PUP'),
(283, 'CODE283', 'area', 'PUP'),
(284, 'CODE284', 'area', 'PUP'),
(285, 'CODE285', 'area', 'PUP'),
(286, 'CODE286', 'area', 'PUP'),
(287, 'CODE287', 'area', 'PUP'),
(288, 'CODE288', 'area', 'PUP'),
(289, 'CODE289', 'area', 'PUP'),
(290, 'CODE290', 'area', 'PUP'),
(291, 'CODE291', 'area', 'PUP'),
(292, 'CODE292', 'area', 'PUP'),
(293, 'CODE293', 'area', 'PUP'),
(294, 'CODE294', 'area', 'PUP'),
(295, 'CODE295', 'area', 'PUP'),
(296, 'CODE296', 'area', 'PUP'),
(297, 'CODE297', 'area', 'PUP'),
(298, 'CODE298', 'area', 'PUP'),
(299, 'CODE299', 'area', 'PUP'),
(300, 'CODE300', 'area', 'PUP'),
(301, 'CODE301', 'area', 'PUP'),
(302, 'CODE302', 'area', 'PUP'),
(303, 'CODE303', 'area', 'PUP'),
(304, 'CODE304', 'area', 'PUP'),
(305, 'CODE305', 'area', 'PUP'),
(306, 'CODE306', 'area', 'PUP'),
(307, 'CODE307', 'area', 'PUP'),
(308, 'CODE308', 'area', 'PUP'),
(309, 'CODE309', 'area', 'PUP'),
(310, 'CODE310', 'area', 'PUP'),
(311, 'CODE311', 'area', 'PUP'),
(312, 'CODE312', 'area', 'PUP'),
(313, 'CODE313', 'area', 'PUP'),
(314, 'CODE314', 'area', 'PUP'),
(315, 'CODE315', 'area', 'PUP'),
(316, 'CODE316', 'area', 'PUP'),
(317, 'CODE317', 'area', 'PUP'),
(318, 'CODE318', 'area', 'PUP'),
(319, 'CODE319', 'area', 'PUP'),
(320, 'CODE320', 'area', 'PUP'),
(321, 'CODE321', 'area', 'PUP'),
(322, 'CODE322', 'area', 'PUP'),
(323, 'CODE323', 'area', 'PUP'),
(324, 'CODE324', 'area', 'PUP'),
(325, 'CODE325', 'area', 'PUP'),
(326, 'CODE326', 'area', 'PUP'),
(327, 'CODE327', 'area', 'PUP'),
(328, 'CODE328', 'area', 'PUP'),
(329, 'CODE329', 'area', 'PUP'),
(330, 'CODE330', 'area', 'PUP'),
(331, 'CODE331', 'area', 'PUP'),
(332, 'CODE332', 'area', 'PUP'),
(333, 'CODE333', 'area', 'PUP'),
(334, 'CODE334', 'area', 'PUP'),
(335, 'CODE335', 'area', 'PUP'),
(336, 'CODE336', 'area', 'PUP'),
(337, 'CODE337', 'area', 'PUP'),
(338, 'CODE338', 'area', 'PUP'),
(339, 'CODE339', 'area', 'PUP'),
(340, 'CODE340', 'area', 'PUP'),
(341, 'CODE341', 'area', 'PUP'),
(342, 'CODE342', 'area', 'PUP'),
(343, 'CODE343', 'area', 'PUP'),
(344, 'CODE344', 'area', 'PUP'),
(345, 'CODE345', 'area', 'PUP'),
(346, 'CODE346', 'area', 'PUP'),
(347, 'CODE347', 'area', 'PUP'),
(348, 'CODE348', 'area', 'PUP'),
(349, 'CODE349', 'area', 'PUP'),
(350, 'CODE350', 'area', 'PUP'),
(351, 'CODE351', 'area', 'PUP'),
(352, 'CODE352', 'area', 'PUP'),
(353, 'CODE353', 'area', 'PUP'),
(354, 'CODE354', 'area', 'PUP'),
(355, 'CODE355', 'area', 'PUP'),
(356, 'CODE356', 'area', 'PUP'),
(357, 'CODE357', 'area', 'PUP'),
(358, 'CODE358', 'area', 'PUP'),
(359, 'CODE359', 'area', 'PUP'),
(360, 'CODE360', 'area', 'PUP'),
(361, 'CODE361', 'area', 'PUP'),
(362, 'CODE362', 'area', 'PUP'),
(363, 'CODE363', 'area', 'PUP'),
(364, 'CODE364', 'area', 'PUP'),
(365, 'CODE365', 'area', 'PUP'),
(366, 'CODE366', 'area', 'PUP'),
(367, 'CODE367', 'area', 'PUP'),
(368, 'CODE368', 'area', 'PUP'),
(369, 'CODE369', 'area', 'PUP'),
(370, 'CODE370', 'area', 'PUP'),
(371, 'CODE371', 'area', 'PUP'),
(372, 'CODE372', 'area', 'PUP'),
(373, 'CODE373', 'area', 'PUP'),
(374, 'CODE374', 'area', 'PUP'),
(375, 'CODE375', 'area', 'PUP'),
(376, 'CODE376', 'area', 'PUP'),
(377, 'CODE377', 'area', 'PUP'),
(378, 'CODE378', 'area', 'PUP'),
(379, 'CODE379', 'area', 'PUP'),
(380, 'CODE380', 'area', 'PUP'),
(381, 'CODE381', 'area', 'PUP'),
(382, 'CODE382', 'area', 'PUP'),
(383, 'CODE383', 'area', 'PUP'),
(384, 'CODE384', 'area', 'PUP'),
(385, 'CODE385', 'area', 'PUP'),
(386, 'CODE386', 'area', 'PUP'),
(387, 'CODE387', 'area', 'PUP'),
(388, 'CODE388', 'area', 'PUP'),
(389, 'CODE389', 'area', 'PUP'),
(390, 'CODE390', 'area', 'PUP'),
(391, 'CODE391', 'area', 'PUP'),
(392, 'CODE392', 'area', 'PUP'),
(393, 'CODE393', 'area', 'PUP'),
(394, 'CODE394', 'area', 'PUP'),
(395, 'CODE395', 'area', 'PUP'),
(396, 'CODE396', 'area', 'PUP'),
(397, 'CODE397', 'area', 'PUP'),
(398, 'CODE398', 'area', 'PUP'),
(399, 'CODE399', 'area', 'PUP'),
(400, 'CODE400', 'area', 'PUP'),
(401, 'CODE401', 'area', 'PUP'),
(402, 'CODE402', 'area', 'PUP'),
(403, 'CODE403', 'area', 'PUP'),
(404, 'CODE404', 'area', 'PUP'),
(405, 'CODE405', 'area', 'PUP'),
(406, 'CODE406', 'area', 'PUP'),
(407, 'CODE407', 'area', 'PUP'),
(408, 'CODE408', 'area', 'PUP'),
(409, 'CODE409', 'area', 'PUP'),
(410, 'CODE410', 'area', 'PUP'),
(411, 'CODE411', 'area', 'PUP'),
(412, 'CODE412', 'area', 'PUP'),
(413, 'CODE413', 'area', 'PUP'),
(414, 'CODE414', 'area', 'PUP'),
(415, 'CODE415', 'area', 'PUP'),
(416, 'CODE416', 'area', 'PUP'),
(417, 'CODE417', 'area', 'PUP'),
(418, 'CODE418', 'area', 'PUP'),
(419, 'CODE419', 'area', 'PUP'),
(420, 'CODE420', 'area', 'PUP'),
(421, 'CODE421', 'area', 'PUP'),
(422, 'CODE422', 'area', 'PUP'),
(423, 'CODE423', 'area', 'PUP'),
(424, 'CODE424', 'area', 'PUP'),
(425, 'CODE425', 'area', 'PUP'),
(426, 'CODE426', 'area', 'PUP'),
(427, 'CODE427', 'area', 'PUP'),
(428, 'CODE428', 'area', 'PUP'),
(429, 'CODE429', 'area', 'PUP'),
(430, 'CODE430', 'area', 'PUP'),
(431, 'CODE431', 'area', 'PUP'),
(432, 'CODE432', 'area', 'PUP'),
(433, 'CODE433', 'area', 'PUP'),
(434, 'CODE434', 'area', 'PUP'),
(435, 'CODE435', 'area', 'PUP'),
(436, 'CODE436', 'area', 'PUP'),
(437, 'CODE437', 'area', 'PUP'),
(438, 'CODE438', 'area', 'PUP'),
(439, 'CODE439', 'area', 'PUP'),
(440, 'CODE440', 'area', 'PUP'),
(441, 'CODE441', 'area', 'PUP'),
(442, 'CODE442', 'area', 'PUP'),
(443, 'CODE443', 'area', 'PUP'),
(444, 'CODE444', 'area', 'PUP'),
(445, 'CODE445', 'area', 'PUP'),
(446, 'CODE446', 'area', 'PUP'),
(447, 'CODE447', 'area', 'PUP'),
(448, 'CODE448', 'area', 'PUP'),
(449, 'CODE449', 'area', 'PUP'),
(450, 'CODE450', 'area', 'PUP'),
(451, 'CODE451', 'area', 'PUP'),
(452, 'CODE452', 'area', 'PUP'),
(453, 'CODE453', 'area', 'PUP'),
(454, 'CODE454', 'area', 'PUP'),
(455, 'CODE455', 'area', 'PUP'),
(456, 'CODE456', 'area', 'PUP'),
(457, 'CODE457', 'area', 'PUP'),
(458, 'CODE458', 'area', 'PUP'),
(459, 'CODE459', 'area', 'PUP'),
(460, 'CODE460', 'area', 'PUP'),
(461, 'CODE461', 'area', 'PUP'),
(462, 'CODE462', 'area', 'PUP'),
(463, 'CODE463', 'area', 'PUP'),
(464, 'CODE464', 'area', 'PUP'),
(465, 'CODE465', 'area', 'PUP'),
(466, 'CODE466', 'area', 'PUP'),
(467, 'CODE467', 'area', 'PUP'),
(468, 'CODE468', 'area', 'PUP'),
(469, 'CODE469', 'area', 'PUP'),
(470, 'CODE470', 'area', 'PUP'),
(471, 'CODE471', 'area', 'PUP'),
(472, 'CODE472', 'area', 'PUP'),
(473, 'CODE473', 'area', 'PUP'),
(474, 'CODE474', 'area', 'PUP'),
(475, 'CODE475', 'area', 'PUP'),
(476, 'CODE476', 'area', 'PUP'),
(477, 'CODE477', 'area', 'PUP'),
(478, 'CODE478', 'area', 'PUP'),
(479, 'CODE479', 'area', 'PUP'),
(480, 'CODE480', 'area', 'PUP'),
(481, 'CODE481', 'area', 'PUP'),
(482, 'CODE482', 'area', 'PUP'),
(483, 'CODE483', 'area', 'PUP'),
(484, 'CODE484', 'area', 'PUP'),
(485, 'CODE485', 'area', 'PUP'),
(486, 'CODE486', 'area', 'PUP'),
(487, 'CODE487', 'area', 'PUP'),
(488, 'CODE488', 'area', 'PUP'),
(489, 'CODE489', 'area', 'PUP'),
(490, 'CODE490', 'area', 'PUP'),
(491, 'CODE491', 'area', 'PUP'),
(492, 'CODE492', 'area', 'PUP'),
(493, 'CODE493', 'area', 'PUP'),
(494, 'CODE494', 'area', 'PUP'),
(495, 'CODE495', 'area', 'PUP'),
(496, 'CODE496', 'area', 'PUP'),
(497, 'CODE497', 'area', 'PUP'),
(498, 'CODE498', 'area', 'PUP'),
(499, 'CODE499', 'area', 'PUP'),
(500, 'CODE500', 'area', 'PUP'),
(501, 'CODE501', 'area', 'PUP'),
(502, 'CODE502', 'area', 'PUP'),
(503, 'CODE503', 'area', 'PUP'),
(504, 'CODE504', 'area', 'PUP'),
(505, 'CODE505', 'area', 'PUP'),
(506, 'CODE506', 'area', 'PUP'),
(507, 'CODE507', 'area', 'PUP'),
(508, 'CODE508', 'area', 'PUP'),
(509, 'CODE509', 'area', 'PUP'),
(510, 'CODE510', 'area', 'PUP'),
(511, 'CODE511', 'area', 'PUP');

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


--
-- Dumping data for table `tblposition`
--

INSERT INTO `tblposition` (`strPositionId`, `strPosName`, `strPosColor`, `intPosVoteLimit`, `blPosDelete`, `created_at`, `updated_at`, `deleted_at`) VALUES
('POS001', 'Board of Directors', 'blue', 4, 0, '2025-03-07 06:15:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('POS002', 'Audit and Inventory Committee', 'red', 2, 0, '2025-03-07 06:15:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('POS003', 'Election Committee', 'green', 2, 0, '2025-03-07 06:16:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00');


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


--
-- Dumping data for table `tblpositiondetail`
--

INSERT INTO `tblpositiondetail` (`intPosDeId`, `strPosDePosId`, `strPosDeFieldName`, `strPosDeFieldData`) VALUES
(1, 'POS001', 'area', 'PUP'),
(2, 'POS002', 'area', 'PUP'),
(3, 'POS003', 'area', 'PUP');


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
