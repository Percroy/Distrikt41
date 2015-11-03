SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `gangs`
-- ----------------------------
DROP TABLE IF EXISTS `gangs`;
CREATE TABLE `gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `members` text,
  `maxmembers` int(2) DEFAULT '2',
  `bank` int(100) DEFAULT '0',
  `active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gangs
-- ----------------------------

-- ----------------------------
-- Table structure for `houses`
-- ----------------------------
DROP TABLE IF EXISTS `houses`;
CREATE TABLE `houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(32) NOT NULL,
  `gid` varchar(12) NOT NULL DEFAULT '0',
  `pos` varchar(64) DEFAULT NULL,
  `containers` text,
  `owned` tinyint(4) DEFAULT '0',
  `rentdate` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`pid`,`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of houses
-- ----------------------------

-- ----------------------------
-- Table structure for `players`
-- ----------------------------
DROP TABLE IF EXISTS `players`;
CREATE TABLE `players` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `playerid` varchar(50) NOT NULL,
  `name` varchar(32) NOT NULL,
  `aliases` text NOT NULL,
  `cash` int(100) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '0',
  `Karma` int(100) NOT NULL DEFAULT '1',
  `civ_gear` text NOT NULL,
  `civ_licenses` text,
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `jail_time` int(11) NOT NULL DEFAULT '0',
  `coplevel` enum('0','1','2','3','4','5','6','7','8','9','10','11') NOT NULL DEFAULT '0',
  `cop_gear` text NOT NULL,
  `cop_licenses` text,
  `mediclevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `med_gear` text NOT NULL,
  `med_licenses` text,
  `adminlevel` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `LastLogin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `died` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`playerid`,`LastLogin`),
  UNIQUE KEY `playerid` (`playerid`),
  KEY `name` (`name`),
  KEY `blacklist` (`blacklist`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of players
-- ----------------------------

-- ----------------------------
-- Table structure for `skillsys`
-- ----------------------------
DROP TABLE IF EXISTS `skillsys`;
CREATE TABLE `skillsys` (
  `playerid` varchar(50) NOT NULL DEFAULT '0',
  `D41_Apfel` int(100) NOT NULL DEFAULT '0',
  `D41_Pfirsich` int(100) NOT NULL DEFAULT '0',
  `D41_Kalkstein` int(100) NOT NULL DEFAULT '0',
  `D41_Salz` int(100) NOT NULL DEFAULT '0',
  `D41_Sand` int(100) NOT NULL DEFAULT '0',
  `D41_EisenRoh` int(100) NOT NULL DEFAULT '0',
  `D41_KupferRoh` int(100) NOT NULL DEFAULT '0',
  `D41_DiamantenRoh` int(100) NOT NULL DEFAULT '0',
  `D41_CannabisRoh` int(100) NOT NULL DEFAULT '0',
  `D41_KokainRoh` int(100) NOT NULL DEFAULT '0',
  `D41_HeroinRoh` int(100) NOT NULL DEFAULT '0',
  `D41_OelRoh` int(100) NOT NULL DEFAULT '0',
  `D41_FleischRoh` int(100) NOT NULL DEFAULT '0',
  `D41_KohleRoh` int(100) NOT NULL DEFAULT '0',
  `D41_Bruchstein` int(100) NOT NULL DEFAULT '0',
  `D41_TonRoh` int(100) NOT NULL DEFAULT '0',
  `D41_Krabben` int(100) NOT NULL DEFAULT '0',
  `D41_Fischen` int(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of skillsys
-- ----------------------------

-- ----------------------------
-- Table structure for `stocksys`
-- ----------------------------
DROP TABLE IF EXISTS `stocksys`;
CREATE TABLE `stocksys` (
  `ID` decimal(32,0) NOT NULL DEFAULT '1',
  `D41_Apfel` int(32) NOT NULL DEFAULT '0',
  `D41_Pfirsich` int(32) NOT NULL DEFAULT '0',
  `D41_Apfelschnaps` int(32) NOT NULL DEFAULT '0',
  `D41_Pfirsichschnaps` int(32) NOT NULL DEFAULT '0',
  `D41_Heroin` int(32) NOT NULL DEFAULT '0',
  `D41_Oel` int(32) NOT NULL DEFAULT '0',
  `D41_Cannabis` int(32) NOT NULL DEFAULT '0',
  `D41_BeefJerky` int(32) NOT NULL DEFAULT '0',
  `D41_Kokain` int(32) NOT NULL DEFAULT '0',
  `D41_Diamanten` int(32) NOT NULL DEFAULT '0',
  `D41_Eisen` int(32) NOT NULL DEFAULT '0',
  `D41_Kupfer` int(32) NOT NULL DEFAULT '0',
  `D41_Salz` int(32) NOT NULL DEFAULT '0',
  `D41_Kohle` int(32) NOT NULL DEFAULT '0',
  `D41_Glas` int(32) NOT NULL DEFAULT '0',
  `D41_Apfelsaft` int(32) NOT NULL DEFAULT '0',
  `D41_Pfirsichsaft` int(32) NOT NULL DEFAULT '0',
  `D41_Ton` int(32) NOT NULL DEFAULT '0',
  `D41_Zement` int(32) NOT NULL DEFAULT '0',
  `D41_WaffenKomponenten` int(32) NOT NULL DEFAULT '0',
  `D41_Stahl` int(32) NOT NULL DEFAULT '0',
  `D41_Fahrzeugteile` int(32) NOT NULL DEFAULT '0',
  `D41_Kerosin` int(32) NOT NULL DEFAULT '0',
  `D41_Kalkstein` int(32) NOT NULL DEFAULT '0',
  `D41_Krabben` int(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of stocksys
-- ----------------------------
INSERT INTO `stocksys` VALUES ('1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `vehicles`
-- ----------------------------
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `side` varchar(15) NOT NULL,
  `classname` varchar(32) NOT NULL,
  `type` varchar(12) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `plate` int(20) NOT NULL,
  `color` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `side` (`side`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vehicles
-- ----------------------------

-- ----------------------------
-- Table structure for `wanted`
-- ----------------------------
DROP TABLE IF EXISTS `wanted`;
CREATE TABLE `wanted` (
  `wantedID` varchar(50) NOT NULL,
  `wantedName` varchar(52) NOT NULL,
  `wantedCrimes` text NOT NULL,
  `wantedBounty` int(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wantedID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of wanted
-- ----------------------------

-- ----------------------------
-- Procedure structure for `deleteDeadVehicles`
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteDeadVehicles`;
DELIMITER ;;
CREATE DEFINER=`D41_MySQL`@`localhost` PROCEDURE `deleteDeadVehicles`()
BEGIN
	DELETE FROM `vehicles` WHERE `alive` = 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `deleteOldGangs`
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteOldGangs`;
DELIMITER ;;
CREATE DEFINER=`D41_MySQL`@`localhost` PROCEDURE `deleteOldGangs`()
DELETE FROM gangs WHERE `active`= 0
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `DeleteOldHouses`
-- ----------------------------
DROP PROCEDURE IF EXISTS `DeleteOldHouses`;
DELIMITER ;;
CREATE DEFINER=`D41_MySQL`@`localhost` PROCEDURE `DeleteOldHouses`()
DELETE FROM houses WHERE rentdate < 1
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `resetLifeVehicles`
-- ----------------------------
DROP PROCEDURE IF EXISTS `resetLifeVehicles`;
DELIMITER ;;
CREATE DEFINER=`D41_MySQL`@`localhost` PROCEDURE `resetLifeVehicles`()
BEGIN
	UPDATE vehicles SET `active`= 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `4hHouseRentTimer`
-- ----------------------------
DROP EVENT IF EXISTS `4hHouseRentTimer`;
DELIMITER ;;
CREATE DEFINER=`D41_MySQL`@`localhost` EVENT `4hHouseRentTimer` ON SCHEDULE EVERY 4 HOUR STARTS '2014-09-13 03:59:55' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE houses
SET rentdate = rentdate - 1
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `6WeeksPlayerDelete`
-- ----------------------------
DROP EVENT IF EXISTS `6WeeksPlayerDelete`;
DELIMITER ;;
CREATE DEFINER=`D41_MySQL`@`localhost` EVENT `6WeeksPlayerDelete` ON SCHEDULE EVERY 1 DAY STARTS '2014-09-13 23:59:55' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM players where lastLogin < DATE_SUB( CURRENT_TIME(), INTERVAL 6 Week)
;;
DELIMITER ;
