CREATE DATABASE  IF NOT EXISTS `newd` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `newd`;
-- MariaDB dump 10.19  Distrib 10.7.3-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: newd
-- ------------------------------------------------------
-- Server version	10.7.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `action_foul`
--

DROP TABLE IF EXISTS `action_foul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_foul` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foul_type` varchar(45) NOT NULL,
  `aswing_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_golf_aswing_id_idx` (`aswing_id`),
  CONSTRAINT `fk_golf_aswing_id` FOREIGN KEY (`aswing_id`) REFERENCES `golf_action_swing` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_foul`
--

LOCK TABLES `action_foul` WRITE;
/*!40000 ALTER TABLE `action_foul` DISABLE KEYS */;
/*!40000 ALTER TABLE `action_foul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `language` varchar(100) DEFAULT NULL,
  `suite` varchar(100) DEFAULT NULL,
  `floor` varchar(100) DEFAULT NULL,
  `building` varchar(100) DEFAULT NULL,
  `street_number` varchar(100) DEFAULT NULL,
  `street_prefix` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `street_suffix` varchar(100) DEFAULT NULL,
  `neighborhood` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `locality` varchar(100) DEFAULT NULL,
  `county` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `postal_code` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_addresses_1` (`locality`),
  KEY `IDX_addresses_2` (`region`),
  KEY `IDX_addresses_3` (`postal_code`),
  KEY `IDX_FK_add_loc_id__loc_id` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliation_phases`
--

DROP TABLE IF EXISTS `affiliation_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliation_phases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliation_id` int(11) NOT NULL,
  `ancestor_affiliation_id` int(11) DEFAULT NULL,
  `start_season_id` int(11) DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_season_id` int(11) DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_seasons_affiliation_phases1` (`end_season_id`),
  KEY `FK_seasons_affiliation_phases` (`start_season_id`),
  KEY `FK_affiliations_affiliation_phases1` (`ancestor_affiliation_id`),
  KEY `FK_affiliations_affiliation_phases` (`affiliation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliation_phases`
--

LOCK TABLES `affiliation_phases` WRITE;
/*!40000 ALTER TABLE `affiliation_phases` DISABLE KEYS */;
INSERT INTO `affiliation_phases` VALUES
(0,0,NULL,1,NULL,5,NULL),
(1,1,NULL,2,NULL,4,NULL),
(2,2,NULL,3,NULL,2,NULL),
(3,3,NULL,4,NULL,3,NULL),
(4,4,NULL,5,NULL,1,NULL);
/*!40000 ALTER TABLE `affiliation_phases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliations`
--

DROP TABLE IF EXISTS `affiliations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliation_key` varchar(100) NOT NULL,
  `affiliation_type` varchar(100) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_affiliations_1` (`affiliation_key`),
  KEY `IDX_affiliations_2` (`affiliation_type`),
  KEY `IDX_FK_aff_pub_id__pub_id` (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliations`
--

LOCK TABLES `affiliations` WRITE;
/*!40000 ALTER TABLE `affiliations` DISABLE KEYS */;
INSERT INTO `affiliations` VALUES
(0,'1',NULL,0),
(1,'2',NULL,1),
(2,'3',NULL,2),
(3,'4',NULL,3),
(4,'5',NULL,4);
/*!40000 ALTER TABLE `affiliations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliations_documents`
--

DROP TABLE IF EXISTS `affiliations_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliations_documents` (
  `affiliation_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  KEY `FK_aff_doc_aff_id__aff_id` (`affiliation_id`),
  KEY `FK_aff_doc_doc_id__doc_id` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliations_documents`
--

LOCK TABLES `affiliations_documents` WRITE;
/*!40000 ALTER TABLE `affiliations_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliations_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliations_events`
--

DROP TABLE IF EXISTS `affiliations_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliations_events` (
  `affiliation_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  KEY `FK_aff_eve_aff_id__aff_id` (`affiliation_id`),
  KEY `FK_aff_eve_eve_id__eve_id` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliations_events`
--

LOCK TABLES `affiliations_events` WRITE;
/*!40000 ALTER TABLE `affiliations_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliations_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliations_media`
--

DROP TABLE IF EXISTS `affiliations_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliations_media` (
  `affiliation_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  KEY `FK_aff_med_med_id__med_id` (`media_id`),
  KEY `FK_aff_med_aff_id__aff_id` (`affiliation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliations_media`
--

LOCK TABLES `affiliations_media` WRITE;
/*!40000 ALTER TABLE `affiliations_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `affiliations_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmakers`
--

DROP TABLE IF EXISTS `bookmakers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmakers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_key` varchar(100) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_boo_loc_id__loc_id` (`location_id`),
  KEY `FK_boo_pub_id__pub_id` (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmakers`
--

LOCK TABLES `bookmakers` WRITE;
/*!40000 ALTER TABLE `bookmakers` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmakers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_person_stats`
--

DROP TABLE IF EXISTS `core_person_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_person_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time_played_event` varchar(40) DEFAULT NULL,
  `time_played_total` varchar(40) DEFAULT NULL,
  `time_played_event_average` varchar(40) DEFAULT NULL,
  `events_played` int(11) DEFAULT NULL,
  `events_started` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cor_per_sta_pos_id__pos_id` (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2589 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_person_stats`
--

LOCK TABLES `core_person_stats` WRITE;
/*!40000 ALTER TABLE `core_person_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_person_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_stats`
--

DROP TABLE IF EXISTS `core_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` varchar(100) DEFAULT NULL,
  `score_opposing` varchar(100) DEFAULT NULL,
  `score_attempts` varchar(100) DEFAULT NULL,
  `score_attempts_opposing` varchar(100) DEFAULT NULL,
  `score_percentage` varchar(100) DEFAULT NULL,
  `score_percentage_opposing` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_stats`
--

LOCK TABLES `core_stats` WRITE;
/*!40000 ALTER TABLE `core_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_info`
--

DROP TABLE IF EXISTS `db_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_info` (
  `version` varchar(100) NOT NULL DEFAULT '16',
  KEY `IDX_db_info_1` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_info`
--

LOCK TABLES `db_info` WRITE;
/*!40000 ALTER TABLE `db_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `display_names`
--

DROP TABLE IF EXISTS `display_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `display_names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(100) NOT NULL,
  `entity_type` varchar(100) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `abbreviation` varchar(100) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `prefix` varchar(20) DEFAULT NULL,
  `suffix` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3959 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `display_names`
--

LOCK TABLES `display_names` WRITE;
/*!40000 ALTER TABLE `display_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `display_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_classes`
--

DROP TABLE IF EXISTS `document_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_document_classes_1` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_classes`
--

LOCK TABLES `document_classes` WRITE;
/*!40000 ALTER TABLE `document_classes` DISABLE KEYS */;
INSERT INTO `document_classes` VALUES
(1,'CERTIFICATE'),
(3,'HANDICAP'),
(0,'ID'),
(2,'MATRIC'),
(4,'SCORE');
/*!40000 ALTER TABLE `document_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_contents`
--

DROP TABLE IF EXISTS `document_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `sportsml` varchar(200) DEFAULT NULL,
  `abstract` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_doc_con_doc_id__doc_id` (`document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_contents`
--

LOCK TABLES `document_contents` WRITE;
/*!40000 ALTER TABLE `document_contents` DISABLE KEYS */;
INSERT INTO `document_contents` VALUES
(0,0,'CARD',NULL),
(1,1,'FOTO',NULL),
(2,2,'FOTO',NULL),
(3,3,'PAPER',NULL),
(4,4,'PAPER',NULL);
/*!40000 ALTER TABLE `document_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_fixtures`
--

DROP TABLE IF EXISTS `document_fixtures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_fixtures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fixture_key` varchar(100) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `document_class_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_document_fixtures_1` (`fixture_key`),
  KEY `IDX_FK_doc_fix_doc_cla_id__doc_cla_id` (`document_class_id`),
  KEY `IDX_FK_doc_fix_pub_id__pub_id` (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_fixtures`
--

LOCK TABLES `document_fixtures` WRITE;
/*!40000 ALTER TABLE `document_fixtures` DISABLE KEYS */;
INSERT INTO `document_fixtures` VALUES
(0,'0',0,'JASON',0),
(1,'1',1,'TERRA',1),
(2,'2',2,'JACOB',2),
(3,'3',3,'TERESSA',3),
(4,'4',4,'JOHAN',4);
/*!40000 ALTER TABLE `document_fixtures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_fixtures_events`
--

DROP TABLE IF EXISTS `document_fixtures_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_fixtures_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_fixture_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `latest_document_id` int(11) NOT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_doc_fix_eve_doc_fix_id__doc_fix_id` (`document_fixture_id`),
  KEY `IDX_FK_doc_fix_eve_eve_id__eve_id` (`event_id`),
  KEY `IDX_FK_doc_fix_eve_lat_doc_id__doc_id` (`latest_document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7916 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_fixtures_events`
--

LOCK TABLES `document_fixtures_events` WRITE;
/*!40000 ALTER TABLE `document_fixtures_events` DISABLE KEYS */;
INSERT INTO `document_fixtures_events` VALUES
(0,0,0,1,NULL),
(1,1,1,2,NULL),
(2,2,2,0,NULL),
(3,3,3,2,NULL),
(4,4,4,1,NULL);
/*!40000 ALTER TABLE `document_fixtures_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_package_entry`
--

DROP TABLE IF EXISTS `document_package_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_package_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_package_id` int(11) NOT NULL,
  `rank` varchar(100) DEFAULT NULL,
  `document_id` int(11) NOT NULL,
  `headline` varchar(100) DEFAULT NULL,
  `short_headline` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_doc_pac_ent_doc_pac_id__doc_pac_id` (`document_package_id`),
  KEY `FK_doc_pac_ent_doc_id__doc_id` (`document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_package_entry`
--

LOCK TABLES `document_package_entry` WRITE;
/*!40000 ALTER TABLE `document_package_entry` DISABLE KEYS */;
INSERT INTO `document_package_entry` VALUES
(0,0,'1',0,NULL,NULL),
(1,1,'2',1,NULL,NULL),
(2,2,'3',2,NULL,NULL),
(3,3,'4',3,NULL,NULL),
(4,4,'5',4,NULL,NULL);
/*!40000 ALTER TABLE `document_package_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_packages`
--

DROP TABLE IF EXISTS `document_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_key` varchar(100) DEFAULT NULL,
  `package_name` varchar(100) DEFAULT NULL,
  `date_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_packages`
--

LOCK TABLES `document_packages` WRITE;
/*!40000 ALTER TABLE `document_packages` DISABLE KEYS */;
INSERT INTO `document_packages` VALUES
(0,'0','FEDEX',NULL),
(1,'1','AMAZON',NULL),
(2,'2','FEDEX',NULL),
(3,'3','YOUTUBE',NULL),
(4,'4','TWITCH',NULL);
/*!40000 ALTER TABLE `document_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` varchar(75) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `revision_id` varchar(75) DEFAULT NULL,
  `stats_coverage` varchar(100) DEFAULT NULL,
  `document_fixture_id` int(11) NOT NULL,
  `source_id` int(11) DEFAULT NULL,
  `db_loading_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_documents_1` (`doc_id`),
  KEY `IDX_documents_3` (`date_time`),
  KEY `IDX_documents_4` (`priority`),
  KEY `IDX_documents_5` (`revision_id`),
  KEY `IDX_FK_doc_doc_fix_id__doc_fix_id` (`document_fixture_id`),
  KEY `IDX_FK_doc_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_FK_doc_sou_id__pub_id` (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES
(0,'0',0,NULL,'MR','ENG','H',NULL,'ALL',0,NULL,NULL),
(1,'1',1,NULL,'MS','ENG','H',NULL,'HEADLINES',1,NULL,NULL),
(2,'2',2,NULL,'MR','ENG','L',NULL,'SHOTS',1,NULL,NULL),
(3,'3',3,NULL,'MR','ENG','M',NULL,'PLAYERS',2,NULL,NULL),
(4,'4',4,NULL,'MS','ENG','L',NULL,'UMPIRES',1,NULL,NULL);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_media`
--

DROP TABLE IF EXISTS `documents_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `media_caption_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_doc_med_med_cap_id__med_cap_id` (`media_caption_id`),
  KEY `FK_doc_med_med_id__med_id` (`media_id`),
  KEY `FK_doc_med_doc_id__doc_id` (`document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_media`
--

LOCK TABLES `documents_media` WRITE;
/*!40000 ALTER TABLE `documents_media` DISABLE KEYS */;
INSERT INTO `documents_media` VALUES
(0,0,1,1),
(1,1,2,2),
(2,2,3,3),
(3,3,4,4),
(4,4,5,5);
/*!40000 ALTER TABLE `documents_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_key` varchar(100) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `site_alignment` varchar(100) DEFAULT NULL,
  `event_status` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `attendance` varchar(100) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_events_1` (`event_key`),
  KEY `IDX_FK_eve_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_FK_eve_sit_id__sit_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4351 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES
(0,'0',0,NULL,1,NULL,'ON','3','1000',NULL),
(1,'1',1,NULL,1,NULL,'ON','3','2500',NULL),
(2,'2',2,NULL,2,NULL,'OFF','3','3545',NULL),
(3,'3',3,NULL,5,NULL,'OFF','3','1203',NULL),
(4,'4',4,NULL,4,NULL,'OFF','3','5480',NULL);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_documents`
--

DROP TABLE IF EXISTS `events_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events_documents` (
  `event_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  KEY `FK_eve_doc_doc_id__doc_id` (`document_id`),
  KEY `FK_eve_doc_eve_id__eve_id` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_documents`
--

LOCK TABLES `events_documents` WRITE;
/*!40000 ALTER TABLE `events_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_media`
--

DROP TABLE IF EXISTS `events_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events_media` (
  `event_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  KEY `FK_eve_med_med_id__med_id` (`media_id`),
  KEY `FK_eve_med_eve_id__eve_id` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_media`
--

LOCK TABLES `events_media` WRITE;
/*!40000 ALTER TABLE `events_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_sub_seasons`
--

DROP TABLE IF EXISTS `events_sub_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events_sub_seasons` (
  `event_id` int(11) NOT NULL,
  `sub_season_id` int(11) NOT NULL,
  KEY `FK_eve_sub_sea_sub_sea_id__sub_sea_id` (`sub_season_id`),
  KEY `FK_eve_sub_sea_eve_id__eve_id` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_sub_seasons`
--

LOCK TABLES `events_sub_seasons` WRITE;
/*!40000 ALTER TABLE `events_sub_seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_sub_seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_action`
--

DROP TABLE IF EXISTS `golf_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_action` (
  `event_state_id` int(11) NOT NULL,
  `hole_id` int(11) NOT NULL,
  `aswing_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `stroke_number` int(11) NOT NULL,
  PRIMARY KEY (`event_state_id`,`hole_id`,`aswing_id`,`player_id`,`stroke_number`),
  KEY `fk_ga_hole_id_idx` (`hole_id`),
  KEY `fk_ga_aswing_id_idx` (`aswing_id`),
  KEY `fk_ga_player_id_idx` (`player_id`),
  CONSTRAINT `fk_ga_aswing_id` FOREIGN KEY (`aswing_id`) REFERENCES `golf_action_swing` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ga_event_state_id` FOREIGN KEY (`event_state_id`) REFERENCES `golf_event_states` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ga_hole_id` FOREIGN KEY (`hole_id`) REFERENCES `golf_hole` (`hole_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ga_player_id` FOREIGN KEY (`player_id`) REFERENCES `golf_player` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_action`
--

LOCK TABLES `golf_action` WRITE;
/*!40000 ALTER TABLE `golf_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `golf_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_action_swing`
--

DROP TABLE IF EXISTS `golf_action_swing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_action_swing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_distance` double NOT NULL,
  `total_carry` double NOT NULL,
  `face_angle` double NOT NULL,
  `launch_angle` double NOT NULL,
  `distance_from_hole` double NOT NULL,
  `dynamic_loft` double NOT NULL,
  `spin_rate` double NOT NULL,
  `ball_speed` double NOT NULL,
  `apex` double NOT NULL,
  `ball_landing_area` varchar(45) NOT NULL,
  `face_to_path` varchar(45) NOT NULL,
  `angle_of_attack` double NOT NULL,
  `smash_factor` double NOT NULL,
  `club_head_speed` double NOT NULL,
  `swing_speed` double NOT NULL,
  `club_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_club_id_idx` (`club_id`),
  CONSTRAINT `fk_club_id` FOREIGN KEY (`club_id`) REFERENCES `golf_club` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_action_swing`
--

LOCK TABLES `golf_action_swing` WRITE;
/*!40000 ALTER TABLE `golf_action_swing` DISABLE KEYS */;
/*!40000 ALTER TABLE `golf_action_swing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_action_taken_by`
--

DROP TABLE IF EXISTS `golf_action_taken_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_action_taken_by` (
  `player_id` int(11) NOT NULL,
  `aswing_id` int(11) NOT NULL,
  `strke_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`player_id`,`aswing_id`),
  KEY `fk_gatb_aswing_id_idx` (`aswing_id`),
  CONSTRAINT `fk_gatb_aswing_id` FOREIGN KEY (`aswing_id`) REFERENCES `golf_action_swing` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_gatb_player_id` FOREIGN KEY (`player_id`) REFERENCES `persons` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_action_taken_by`
--

LOCK TABLES `golf_action_taken_by` WRITE;
/*!40000 ALTER TABLE `golf_action_taken_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `golf_action_taken_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_club`
--

DROP TABLE IF EXISTS `golf_club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_club` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `club_name` varchar(45) NOT NULL,
  `average_distance` double NOT NULL,
  `loft` double NOT NULL,
  `head_weight` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_club`
--

LOCK TABLES `golf_club` WRITE;
/*!40000 ALTER TABLE `golf_club` DISABLE KEYS */;
/*!40000 ALTER TABLE `golf_club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_course`
--

DROP TABLE IF EXISTS `golf_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `yards` int(15) NOT NULL,
  `course_type` varchar(45) NOT NULL,
  `location_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`owner_id`),
  KEY `fk_location_id_idx` (`location_id`),
  KEY `fk_gc_owner_id_idx` (`owner_id`),
  CONSTRAINT `fk_gc_owner_id` FOREIGN KEY (`owner_id`) REFERENCES `persons` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_location_id` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_course`
--

LOCK TABLES `golf_course` WRITE;
/*!40000 ALTER TABLE `golf_course` DISABLE KEYS */;
INSERT INTO `golf_course` VALUES
(0,'PINE VALLEY G.C.',7181,'Greenland',1,10),
(1,'MERION G.C. (EAST)',6998,'Desert Sand',6,12),
(2,'PEBBLE BEACH G. LINKS',7000,'Tropical Beach',4,11);
/*!40000 ALTER TABLE `golf_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_event_staff`
--

DROP TABLE IF EXISTS `golf_event_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_event_staff` (
  `id` int(11) NOT NULL,
  `role` varchar(45) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id_idx` (`course_id`),
  CONSTRAINT `course_id` FOREIGN KEY (`course_id`) REFERENCES `golf_course` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_staff_id` FOREIGN KEY (`id`) REFERENCES `persons` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_event_staff`
--

LOCK TABLES `golf_event_staff` WRITE;
/*!40000 ALTER TABLE `golf_event_staff` DISABLE KEYS */;
INSERT INTO `golf_event_staff` VALUES
(20,'CLEANER',0),
(21,'MARSHALL',0),
(22,'MARSHALL',0),
(23,'OFFICIAL',2),
(24,'CLEANER',0);
/*!40000 ALTER TABLE `golf_event_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_event_states`
--

DROP TABLE IF EXISTS `golf_event_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_event_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `current_no_participants` int(3) NOT NULL,
  `Current_state` varchar(45) DEFAULT NULL,
  `sequence_no` int(15) DEFAULT NULL,
  `holes_played` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_event_id_idx` (`event_id`),
  CONSTRAINT `fk_event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_event_states`
--

LOCK TABLES `golf_event_states` WRITE;
/*!40000 ALTER TABLE `golf_event_states` DISABLE KEYS */;
INSERT INTO `golf_event_states` VALUES
(1,2,'9999-12-31 13:56:59',5,NULL,NULL,'2'),
(2,1,'9999-12-31 12:59:59',5,NULL,NULL,'5'),
(3,3,'9999-12-31 12:59:59',5,NULL,NULL,'5'),
(4,4,'9999-12-31 12:59:59',5,NULL,NULL,'7'),
(5,2,'9999-12-31 12:59:59',5,NULL,NULL,'17'),
(6,1,'9999-12-31 12:59:59',5,NULL,NULL,'12'),
(7,0,'9999-12-31 12:59:59',5,NULL,NULL,'12'),
(8,2,'9999-12-31 12:59:59',5,NULL,NULL,'14'),
(9,4,'9999-12-31 12:59:59',5,NULL,NULL,'16'),
(10,3,'9999-12-31 12:59:59',5,NULL,NULL,'7'),
(11,0,'9999-12-31 12:59:59',5,NULL,NULL,'3');
/*!40000 ALTER TABLE `golf_event_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_event_stats`
--

DROP TABLE IF EXISTS `golf_event_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_event_stats` (
  `event_id` int(11) NOT NULL,
  `best_stroke` int(11) DEFAULT NULL,
  `Money_won` double NOT NULL,
  `event_winner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `fk_ges_event_winner_id_idx` (`event_winner_id`),
  CONSTRAINT `fk_ges_event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ges_event_winner_id` FOREIGN KEY (`event_winner_id`) REFERENCES `golf_player` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_event_stats`
--

LOCK TABLES `golf_event_stats` WRITE;
/*!40000 ALTER TABLE `golf_event_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `golf_event_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_held_at`
--

DROP TABLE IF EXISTS `golf_held_at`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_held_at` (
  `event_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`,`course_id`),
  KEY `fk_gha_course_id_idx` (`course_id`),
  CONSTRAINT `fk_gha_course_id` FOREIGN KEY (`course_id`) REFERENCES `golf_course` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_gha_event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_held_at`
--

LOCK TABLES `golf_held_at` WRITE;
/*!40000 ALTER TABLE `golf_held_at` DISABLE KEYS */;
/*!40000 ALTER TABLE `golf_held_at` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_hole`
--

DROP TABLE IF EXISTS `golf_hole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_hole` (
  `hole_id` int(11) NOT NULL AUTO_INCREMENT,
  `hole_number` int(11) NOT NULL,
  `golf_course_id` int(11) NOT NULL,
  `distance_from_tee` double NOT NULL,
  `par` int(11) NOT NULL,
  PRIMARY KEY (`hole_id`),
  KEY `fk_golf_course_idx` (`golf_course_id`),
  CONSTRAINT `fk_golf_course` FOREIGN KEY (`golf_course_id`) REFERENCES `golf_course` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_hole`
--

LOCK TABLES `golf_hole` WRITE;
/*!40000 ALTER TABLE `golf_hole` DISABLE KEYS */;
INSERT INTO `golf_hole` VALUES
(1,2,0,380,5),
(2,3,0,280,3),
(3,4,0,450,5),
(4,5,0,356,4),
(5,6,0,280,3),
(6,7,0,375,5),
(7,8,0,380,4),
(8,9,0,375,4),
(9,10,0,380,5),
(10,11,0,375,4),
(11,12,0,280,4),
(12,13,0,375,4),
(13,14,0,450,5),
(14,15,0,375,5),
(15,16,0,356,4),
(16,17,0,375,4),
(17,18,0,450,5),
(18,1,1,375,5),
(19,2,1,365,5),
(20,3,1,475,5),
(21,4,1,380,4),
(22,5,1,380,4),
(23,6,1,356,5),
(24,7,1,375,4),
(25,8,1,450,5),
(26,9,1,375,4),
(27,10,1,356,4),
(28,11,1,375,5),
(29,12,1,356,4),
(30,13,1,375,4),
(31,14,1,287,3),
(32,15,1,375,4),
(33,16,1,370,4),
(34,17,1,380,5),
(35,18,1,375,5),
(36,1,2,345,4),
(37,2,2,450,5),
(38,3,2,380,4),
(39,4,2,375,4),
(40,5,2,380,5),
(41,6,2,375,5),
(42,7,2,450,5),
(43,8,2,380,4),
(44,9,2,375,4),
(45,10,2,287,3),
(46,11,2,487,5),
(47,12,2,387,4),
(48,13,2,380,4),
(49,14,2,489,4),
(50,15,2,450,4),
(51,16,2,387,4),
(52,17,2,287,3),
(53,18,2,380,4),
(54,1,2,450,5),
(55,1,0,356,4);
/*!40000 ALTER TABLE `golf_hole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_hole_stats`
--

DROP TABLE IF EXISTS `golf_hole_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_hole_stats` (
  `hole_id` int(11) NOT NULL,
  `stat_name` varchar(45) NOT NULL,
  `stat_value` varchar(45) NOT NULL,
  PRIMARY KEY (`hole_id`),
  CONSTRAINT `fk_hs_hole_id` FOREIGN KEY (`hole_id`) REFERENCES `golf_hole` (`hole_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_hole_stats`
--

LOCK TABLES `golf_hole_stats` WRITE;
/*!40000 ALTER TABLE `golf_hole_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `golf_hole_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_hole_winner`
--

DROP TABLE IF EXISTS `golf_hole_winner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_hole_winner` (
  `player_id` int(11) NOT NULL,
  `hole_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `win_type` varchar(45) NOT NULL,
  KEY `fk_ghw_hole_id_idx` (`hole_id`),
  KEY `fk_ghw_event_id_idx` (`event_id`),
  KEY `fk_ghw_player_id_idx` (`player_id`),
  CONSTRAINT `fk_ghw_event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ghw_hole_id` FOREIGN KEY (`hole_id`) REFERENCES `golf_hole` (`hole_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ghw_player_id` FOREIGN KEY (`player_id`) REFERENCES `golf_player` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_hole_winner`
--

LOCK TABLES `golf_hole_winner` WRITE;
/*!40000 ALTER TABLE `golf_hole_winner` DISABLE KEYS */;
/*!40000 ALTER TABLE `golf_hole_winner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_leading_player`
--

DROP TABLE IF EXISTS `golf_leading_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_leading_player` (
  `player_id` int(11) NOT NULL,
  `event_state_id` int(11) NOT NULL,
  KEY `fk_lp_even_state_id_idx` (`event_state_id`),
  KEY `fk_lp_player_id_idx` (`player_id`),
  CONSTRAINT `fk_lp_even_state_id` FOREIGN KEY (`event_state_id`) REFERENCES `golf_event_states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lp_player_id` FOREIGN KEY (`player_id`) REFERENCES `golf_player` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_leading_player`
--

LOCK TABLES `golf_leading_player` WRITE;
/*!40000 ALTER TABLE `golf_leading_player` DISABLE KEYS */;
/*!40000 ALTER TABLE `golf_leading_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_participates_in`
--

DROP TABLE IF EXISTS `golf_participates_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_participates_in` (
  `player_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`player_id`,`event_id`),
  KEY `fk_gpi_event_id_idx` (`event_id`),
  CONSTRAINT `fk_gpi_event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_gpi_player_id` FOREIGN KEY (`player_id`) REFERENCES `golf_player` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_participates_in`
--

LOCK TABLES `golf_participates_in` WRITE;
/*!40000 ALTER TABLE `golf_participates_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `golf_participates_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_player`
--

DROP TABLE IF EXISTS `golf_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_player` (
  `id` int(11) NOT NULL,
  `events_won` int(11) NOT NULL,
  `world_ranking` int(11) NOT NULL,
  `handicap` int(11) NOT NULL,
  `player_fname` varchar(45) NOT NULL,
  `player_sname` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_gp_player_id` FOREIGN KEY (`id`) REFERENCES `persons` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_player`
--

LOCK TABLES `golf_player` WRITE;
/*!40000 ALTER TABLE `golf_player` DISABLE KEYS */;
INSERT INTO `golf_player` VALUES
(0,5,6,2,'Robert','Officer'),
(1,3,45,2,'Jason ','Ang'),
(2,2,76,5,'Thabo','Mathebula'),
(3,4,15,1,'Aaron','Perreira'),
(4,3,23,3,'Jacob','Berry'),
(5,3,24,4,'Many','More'),
(6,4,17,2,'Ching','Yang'),
(7,5,1,2,'Fereira','Paulos'),
(8,2,3,3,'Ben','Foster'),
(9,4,2,2,'Kenny','Gee');
/*!40000 ALTER TABLE `golf_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_player_event_stats`
--

DROP TABLE IF EXISTS `golf_player_event_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_player_event_stats` (
  `event_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `current_rank` int(11) NOT NULL,
  `is_disqualified` tinyint(4) NOT NULL,
  `holes_won` int(11) NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`event_id`,`player_id`),
  KEY `fk_pes_player_id_idx` (`player_id`),
  CONSTRAINT `fk_pes_event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pes_player_id` FOREIGN KEY (`player_id`) REFERENCES `golf_player` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_player_event_stats`
--

LOCK TABLES `golf_player_event_stats` WRITE;
/*!40000 ALTER TABLE `golf_player_event_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `golf_player_event_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_player_furthest_from_hole`
--

DROP TABLE IF EXISTS `golf_player_furthest_from_hole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_player_furthest_from_hole` (
  `player_id` int(11) NOT NULL,
  `event_state_id` int(11) NOT NULL,
  `distance_hole` double NOT NULL,
  KEY `fk_gpffh_event_state_id_idx` (`event_state_id`),
  KEY `fk_gpffh_player_id_idx` (`player_id`),
  CONSTRAINT `fk_gpffh_event_state_id` FOREIGN KEY (`event_state_id`) REFERENCES `golf_event_states` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_gpffh_player_id` FOREIGN KEY (`player_id`) REFERENCES `golf_player` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_player_furthest_from_hole`
--

LOCK TABLES `golf_player_furthest_from_hole` WRITE;
/*!40000 ALTER TABLE `golf_player_furthest_from_hole` DISABLE KEYS */;
/*!40000 ALTER TABLE `golf_player_furthest_from_hole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_player_swing`
--

DROP TABLE IF EXISTS `golf_player_swing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_player_swing` (
  `id` int(11) NOT NULL,
  `aswing_id` int(11) NOT NULL,
  `stroke_number` varchar(45) NOT NULL,
  KEY `fk_gps_aswing_id_idx` (`aswing_id`),
  KEY `fk_gps_player_id_idx` (`id`),
  CONSTRAINT `fk_gps_aswing_id` FOREIGN KEY (`aswing_id`) REFERENCES `golf_action_swing` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_gps_player_id` FOREIGN KEY (`id`) REFERENCES `golf_player` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_player_swing`
--

LOCK TABLES `golf_player_swing` WRITE;
/*!40000 ALTER TABLE `golf_player_swing` DISABLE KEYS */;
/*!40000 ALTER TABLE `golf_player_swing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_score_card`
--

DROP TABLE IF EXISTS `golf_score_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_score_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hole_id` int(11) NOT NULL,
  `player_par` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hole_id_idx` (`hole_id`),
  CONSTRAINT `fk_hole_id` FOREIGN KEY (`hole_id`) REFERENCES `golf_hole` (`hole_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_score_card`
--

LOCK TABLES `golf_score_card` WRITE;
/*!40000 ALTER TABLE `golf_score_card` DISABLE KEYS */;
INSERT INTO `golf_score_card` VALUES
(1,4,70),
(2,5,72),
(3,8,71),
(4,2,73),
(5,7,74),
(6,17,71),
(7,6,69),
(8,23,71),
(9,12,70),
(10,1,71);
/*!40000 ALTER TABLE `golf_score_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_score_relation`
--

DROP TABLE IF EXISTS `golf_score_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_score_relation` (
  `player_id` int(11) NOT NULL,
  `score_card_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `hole_id` int(11) NOT NULL,
  KEY `fk_scr_score_card_id_idx` (`score_card_id`),
  KEY `fk_scr_event_id_idx` (`event_id`),
  KEY `fk_scr_hole_id_idx` (`hole_id`),
  KEY `fk_scr_player_id_idx` (`player_id`),
  CONSTRAINT `fk_scr_event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_scr_hole_id` FOREIGN KEY (`hole_id`) REFERENCES `golf_hole` (`hole_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_scr_player_id` FOREIGN KEY (`player_id`) REFERENCES `golf_player` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_scr_score_card_id` FOREIGN KEY (`score_card_id`) REFERENCES `golf_score_card` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_score_relation`
--

LOCK TABLES `golf_score_relation` WRITE;
/*!40000 ALTER TABLE `golf_score_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `golf_score_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_sponsor`
--

DROP TABLE IF EXISTS `golf_sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_sponsor` (
  `id` int(11) NOT NULL,
  `company_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_sponsor_id` FOREIGN KEY (`id`) REFERENCES `persons` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_sponsor`
--

LOCK TABLES `golf_sponsor` WRITE;
/*!40000 ALTER TABLE `golf_sponsor` DISABLE KEYS */;
INSERT INTO `golf_sponsor` VALUES
(25,'NIKE'),
(26,'ADIDAS'),
(27,'ROLEX'),
(28,'UNDER ARMOUR'),
(29,'CALLAWAY'),
(30,'TAYLOR MADE'),
(31,'CASIO'),
(32,'PING');
/*!40000 ALTER TABLE `golf_sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `golf_sponsorship`
--

DROP TABLE IF EXISTS `golf_sponsorship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `golf_sponsorship` (
  `sponser_id` int(11) NOT NULL,
  `sponsee_id` int(11) NOT NULL,
  KEY `fk_sponsee_id_idx` (`sponsee_id`),
  KEY `fk_sponser_id_idx` (`sponser_id`),
  CONSTRAINT `fk_sponsee_id` FOREIGN KEY (`sponsee_id`) REFERENCES `golf_player` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_sponser_id` FOREIGN KEY (`sponser_id`) REFERENCES `golf_sponsor` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `golf_sponsorship`
--

LOCK TABLES `golf_sponsorship` WRITE;
/*!40000 ALTER TABLE `golf_sponsorship` DISABLE KEYS */;
/*!40000 ALTER TABLE `golf_sponsorship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injury_phases`
--

DROP TABLE IF EXISTS `injury_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `injury_phases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `injury_status` varchar(100) DEFAULT NULL,
  `injury_type` varchar(100) DEFAULT NULL,
  `injury_comment` varchar(100) DEFAULT NULL,
  `disabled_list` varchar(100) DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `season_id` int(11) DEFAULT NULL,
  `phase_type` varchar(100) DEFAULT NULL,
  `injury_side` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_inj_pha_per_id__per_id` (`person_id`),
  KEY `IDX_FK_inj_pha_sea_id__sea_id` (`season_id`),
  KEY `IDX_injury_phases_2` (`injury_status`),
  KEY `IDX_injury_phases_3` (`start_date_time`),
  KEY `IDX_injury_phases_4` (`end_date_time`)
) ENGINE=InnoDB AUTO_INCREMENT=772 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injury_phases`
--

LOCK TABLES `injury_phases` WRITE;
/*!40000 ALTER TABLE `injury_phases` DISABLE KEYS */;
/*!40000 ALTER TABLE `injury_phases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `key_aliases`
--

DROP TABLE IF EXISTS `key_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `key_aliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_id` int(11) NOT NULL,
  `key_root_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_key_roots_key_aliases` (`key_root_id`),
  KEY `IDX_key_aliases_2` (`key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `key_aliases`
--

LOCK TABLES `key_aliases` WRITE;
/*!40000 ALTER TABLE `key_aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `key_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `key_roots`
--

DROP TABLE IF EXISTS `key_roots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `key_roots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_key_aliases_1` (`key_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `key_roots`
--

LOCK TABLES `key_roots` WRITE;
/*!40000 ALTER TABLE `key_roots` DISABLE KEYS */;
/*!40000 ALTER TABLE `key_roots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `latest_revisions`
--

DROP TABLE IF EXISTS `latest_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `latest_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_id` varchar(75) NOT NULL,
  `latest_document_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_lat_rev_lat_doc_id__doc_id` (`latest_document_id`),
  KEY `IDX_latest_revisions_1` (`revision_id`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `latest_revisions`
--

LOCK TABLES `latest_revisions` WRITE;
/*!40000 ALTER TABLE `latest_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `latest_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timezone` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `country_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_locations_1` (`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES
(0,'0','13','25','1050'),
(1,'+1','25','50','1111'),
(2,'+2','18','80','1235'),
(3,'+3','33','21','2552'),
(4,'-1','50','35','1548'),
(5,'-2','15','64','1520'),
(6,'-3','26','89','9546');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `revision_id` int(11) DEFAULT NULL,
  `media_type` varchar(100) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  `date_time` varchar(100) DEFAULT NULL,
  `credit_id` int(11) NOT NULL,
  `db_loading_date_time` datetime DEFAULT NULL,
  `creation_location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_med_cre_id__per_id` (`credit_id`),
  KEY `FK_med_pub_id__pub_id` (`publisher_id`),
  KEY `FK_med_cre_loc_id__loc_id` (`creation_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_captions`
--

DROP TABLE IF EXISTS `media_captions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_captions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL,
  `caption_type` varchar(100) DEFAULT NULL,
  `caption` varchar(100) DEFAULT NULL,
  `caption_author_id` int(11) NOT NULL,
  `language` varchar(100) DEFAULT NULL,
  `caption_size` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_med_cap_med_id__med_id` (`media_id`),
  KEY `FK_med_cap_cap_aut_id__per_id` (`caption_author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_captions`
--

LOCK TABLES `media_captions` WRITE;
/*!40000 ALTER TABLE `media_captions` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_captions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_contents`
--

DROP TABLE IF EXISTS `media_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL,
  `object` varchar(100) DEFAULT NULL,
  `format` varchar(100) DEFAULT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `height` varchar(100) DEFAULT NULL,
  `width` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `file_size` varchar(100) DEFAULT NULL,
  `resolution` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_med_con_med_id__med_id` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_contents`
--

LOCK TABLES `media_contents` WRITE;
/*!40000 ALTER TABLE `media_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_keywords`
--

DROP TABLE IF EXISTS `media_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) DEFAULT NULL,
  `media_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_med_key_med_id__med_id` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_keywords`
--

LOCK TABLES `media_keywords` WRITE;
/*!40000 ALTER TABLE `media_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outcome_totals`
--

DROP TABLE IF EXISTS `outcome_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outcome_totals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `standing_subgroup_id` int(11) NOT NULL,
  `outcome_holder_type` varchar(100) DEFAULT NULL,
  `outcome_holder_id` int(11) DEFAULT NULL,
  `rank` varchar(100) DEFAULT NULL,
  `wins` varchar(100) DEFAULT NULL,
  `losses` varchar(100) DEFAULT NULL,
  `ties` varchar(100) DEFAULT NULL,
  `undecideds` varchar(100) DEFAULT NULL,
  `winning_percentage` varchar(100) DEFAULT NULL,
  `points_scored_for` varchar(100) DEFAULT NULL,
  `points_scored_against` varchar(100) DEFAULT NULL,
  `points_difference` varchar(100) DEFAULT NULL,
  `standing_points` varchar(100) DEFAULT NULL,
  `streak_type` varchar(100) DEFAULT NULL,
  `streak_duration` varchar(100) DEFAULT NULL,
  `streak_total` varchar(100) DEFAULT NULL,
  `streak_start` date DEFAULT NULL,
  `streak_end` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_out_tot_sta_sub_id__sta_sub_id` (`standing_subgroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outcome_totals`
--

LOCK TABLES `outcome_totals` WRITE;
/*!40000 ALTER TABLE `outcome_totals` DISABLE KEYS */;
/*!40000 ALTER TABLE `outcome_totals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants_events`
--

DROP TABLE IF EXISTS `participants_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participants_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_type` varchar(100) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `alignment` varchar(100) DEFAULT NULL,
  `score` varchar(100) DEFAULT NULL,
  `event_outcome` varchar(100) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_par_eve_eve_id__eve_id` (`event_id`),
  KEY `IDX_participants_events_1` (`participant_type`),
  KEY `IDX_participants_events_2` (`participant_id`),
  KEY `IDX_participants_events_3` (`alignment`),
  KEY `IDX_participants_events_4` (`event_outcome`)
) ENGINE=InnoDB AUTO_INCREMENT=8701 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants_events`
--

LOCK TABLES `participants_events` WRITE;
/*!40000 ALTER TABLE `participants_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `participants_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periods`
--

DROP TABLE IF EXISTS `periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_event_id` int(11) NOT NULL,
  `period_value` varchar(100) DEFAULT NULL,
  `score` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_per_par_eve_id__par_eve_id` (`participant_event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=549 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periods`
--

LOCK TABLES `periods` WRITE;
/*!40000 ALTER TABLE `periods` DISABLE KEYS */;
/*!40000 ALTER TABLE `periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_event_metadata`
--

DROP TABLE IF EXISTS `person_event_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_event_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `health` varchar(100) DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `lineup_slot` int(11) DEFAULT NULL,
  `lineup_slot_sequence` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_per_eve_met_eve_id__eve_id` (`event_id`),
  KEY `IDX_FK_per_eve_met_per_id__per_id` (`person_id`),
  KEY `IDX_FK_per_eve_met_pos_id__pos_id` (`position_id`),
  KEY `IDX_FK_per_eve_met_rol_id__rol_id` (`role_id`),
  KEY `IDX_FK_teams_person_event_metadata` (`team_id`),
  KEY `IDX_person_event_metadata_1` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4003 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_event_metadata`
--

LOCK TABLES `person_event_metadata` WRITE;
/*!40000 ALTER TABLE `person_event_metadata` DISABLE KEYS */;
INSERT INTO `person_event_metadata` VALUES
(0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,4,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5,5,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(6,6,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(7,7,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(8,8,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(9,9,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `person_event_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_phases`
--

DROP TABLE IF EXISTS `person_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_phases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `membership_type` varchar(40) NOT NULL,
  `membership_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `role_status` varchar(40) DEFAULT NULL,
  `phase_status` varchar(40) DEFAULT NULL,
  `uniform_number` varchar(20) DEFAULT NULL,
  `regular_position_id` int(11) DEFAULT NULL,
  `regular_position_depth` varchar(40) DEFAULT NULL,
  `height` varchar(100) DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `start_season_id` int(11) DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `end_season_id` int(11) DEFAULT NULL,
  `entry_reason` varchar(40) DEFAULT NULL,
  `exit_reason` varchar(40) DEFAULT NULL,
  `selection_level` int(11) DEFAULT NULL,
  `selection_sublevel` int(11) DEFAULT NULL,
  `selection_overall` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_per_pha_rol_id__rol_id` (`role_id`),
  KEY `FK_per_pha_sta_sea_id__sea_id` (`start_season_id`),
  KEY `FK_per_pha_end_sea_id__sea_id` (`end_season_id`),
  KEY `IDX_FK_per_pha_per_id__per_id` (`person_id`),
  KEY `IDX_FK_per_pha_reg_pos_id__pos_id` (`regular_position_id`),
  KEY `IDX_person_phases_1` (`membership_type`),
  KEY `IDX_person_phases_2` (`membership_id`),
  KEY `IDX_person_phases_3` (`phase_status`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_phases`
--

LOCK TABLES `person_phases` WRITE;
/*!40000 ALTER TABLE `person_phases` DISABLE KEYS */;
INSERT INTO `person_phases` VALUES
(0,0,'FULL',0,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1,1,'FULL',1,NULL,NULL,NULL,'12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,2,'FULL',2,NULL,NULL,NULL,'10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,3,'HALF',0,NULL,NULL,NULL,'11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,4,'HALF',0,NULL,NULL,NULL,'7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5,5,'FULL',2,NULL,NULL,NULL,'8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(6,6,'HALF',2,NULL,NULL,NULL,'5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(7,7,'FULL',2,NULL,NULL,NULL,'6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(8,8,'FULL',1,NULL,NULL,NULL,'2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(9,9,'FULL',1,NULL,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `person_phases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_key` varchar(100) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `birth_date` varchar(30) DEFAULT NULL,
  `death_date` varchar(30) DEFAULT NULL,
  `birth_location_id` int(11) DEFAULT NULL,
  `hometown_location_id` int(11) DEFAULT NULL,
  `residence_location_id` int(11) DEFAULT NULL,
  `death_location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_per_bir_loc_id__loc_id` (`birth_location_id`),
  KEY `FK_per_dea_loc_id__loc_id` (`death_location_id`),
  KEY `FK_per_res_loc_id__loc_id` (`residence_location_id`),
  KEY `FK_per_hom_loc_id__loc_id` (`hometown_location_id`),
  KEY `IDX_FK_per_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_persons_1` (`person_key`)
) ENGINE=InnoDB AUTO_INCREMENT=3938 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` VALUES
(0,'0',0,'M','95-01-01',NULL,NULL,NULL,NULL,NULL),
(1,'1',1,'M','95-02-02',NULL,NULL,NULL,NULL,NULL),
(2,'2',2,'M','95-03-03',NULL,NULL,NULL,NULL,NULL),
(3,'3',3,'M','95-04-04',NULL,NULL,NULL,NULL,NULL),
(4,'4',4,'M','95-05-05',NULL,NULL,NULL,NULL,NULL),
(5,'5',5,'M','95-06-06',NULL,NULL,NULL,NULL,NULL),
(6,'6',6,'M','95-07-07',NULL,NULL,NULL,NULL,NULL),
(7,'7',7,'M','95-08-08',NULL,NULL,NULL,NULL,NULL),
(8,'8',8,'M','95-09-09',NULL,NULL,NULL,NULL,NULL),
(9,'9',9,'M','95-10-10',NULL,NULL,NULL,NULL,NULL),
(10,'10',10,'F','95-10-10',NULL,NULL,NULL,NULL,NULL),
(11,'11',11,'M','96-10-12',NULL,NULL,NULL,NULL,NULL),
(12,'12',12,'F','95-12-10',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons_documents`
--

DROP TABLE IF EXISTS `persons_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons_documents` (
  `person_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  KEY `FK_per_doc_per_id__per_id` (`person_id`),
  KEY `FK_per_doc_doc_id__doc_id` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons_documents`
--

LOCK TABLES `persons_documents` WRITE;
/*!40000 ALTER TABLE `persons_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `persons_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons_media`
--

DROP TABLE IF EXISTS `persons_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persons_media` (
  `person_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  KEY `FK_per_med_med_id__med_id` (`media_id`),
  KEY `FK_per_med_per_id__per_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons_media`
--

LOCK TABLES `persons_media` WRITE;
/*!40000 ALTER TABLE `persons_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `persons_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliation_id` int(11) NOT NULL,
  `abbreviation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_pos_aff_id__aff_id` (`affiliation_id`),
  KEY `IDX_positions_1` (`abbreviation`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publishers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_key` varchar(100) NOT NULL,
  `publisher_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_publishers_1` (`publisher_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_key` varchar(100) NOT NULL,
  `role_name` varchar(100) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_roles_1` (`role_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_key` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `league_id` int(11) NOT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_sea_lea_id__aff_id` (`league_id`),
  KEY `IDX_FK_sea_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_seasons_1` (`season_key`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons`
--

LOCK TABLES `seasons` WRITE;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_key` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_sit_loc_id__loc_id` (`location_id`),
  KEY `IDX_FK_sit_pub_id__pub_id` (`publisher_id`),
  KEY `IDX_sites_1` (`site_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standing_subgroups`
--

DROP TABLE IF EXISTS `standing_subgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `standing_subgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `standing_id` int(11) NOT NULL,
  `affiliation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sta_sub_sta_id__sta_id` (`standing_id`),
  KEY `FK_sta_sub_aff_id__aff_id` (`affiliation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standing_subgroups`
--

LOCK TABLES `standing_subgroups` WRITE;
/*!40000 ALTER TABLE `standing_subgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `standing_subgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standings`
--

DROP TABLE IF EXISTS `standings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `standings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliation_id` int(11) NOT NULL,
  `standing_type` varchar(100) DEFAULT NULL,
  `sub_season_id` int(11) NOT NULL,
  `last_updated` varchar(100) DEFAULT NULL,
  `duration_scope` varchar(100) DEFAULT NULL,
  `competition_scope` varchar(100) DEFAULT NULL,
  `competition_scope_id` varchar(100) DEFAULT NULL,
  `alignment_scope` varchar(100) DEFAULT NULL,
  `site_scope` varchar(100) DEFAULT NULL,
  `scoping_label` varchar(100) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  `source` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sta_aff_id__aff_id` (`affiliation_id`),
  KEY `FK_sta_sub_sea_id__sub_sea_id` (`sub_season_id`),
  KEY `FK_sta_pub_id__pub_id` (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standings`
--

LOCK TABLES `standings` WRITE;
/*!40000 ALTER TABLE `standings` DISABLE KEYS */;
/*!40000 ALTER TABLE `standings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_repository_type` varchar(100) DEFAULT NULL,
  `stat_repository_id` int(11) NOT NULL,
  `stat_holder_type` varchar(100) DEFAULT NULL,
  `stat_holder_id` int(11) DEFAULT NULL,
  `stat_coverage_type` varchar(100) DEFAULT NULL,
  `stat_coverage_id` int(11) DEFAULT NULL,
  `context` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_stats_1` (`stat_repository_type`),
  KEY `IDX_stats_2` (`stat_repository_id`),
  KEY `IDX_stats_3` (`stat_holder_type`),
  KEY `IDX_stats_4` (`stat_holder_id`),
  KEY `IDX_stats_5` (`stat_coverage_type`),
  KEY `IDX_stats_6` (`stat_coverage_id`),
  KEY `IDX_stats_7` (`context`)
) ENGINE=InnoDB AUTO_INCREMENT=12212 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_periods`
--

DROP TABLE IF EXISTS `sub_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period_id` int(11) NOT NULL,
  `sub_period_value` varchar(100) DEFAULT NULL,
  `score` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_sub_per_per_id__per_id` (`period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_periods`
--

LOCK TABLES `sub_periods` WRITE;
/*!40000 ALTER TABLE `sub_periods` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_seasons`
--

DROP TABLE IF EXISTS `sub_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_seasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_season_key` varchar(100) NOT NULL,
  `season_id` int(11) NOT NULL,
  `sub_season_type` varchar(100) NOT NULL,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_sub_sea_sea_id__sea_id` (`season_id`),
  KEY `IDX_sub_seasons_1` (`sub_season_key`),
  KEY `IDX_sub_seasons_2` (`sub_season_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_seasons`
--

LOCK TABLES `sub_seasons` WRITE;
/*!40000 ALTER TABLE `sub_seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_american_football_stats`
--

DROP TABLE IF EXISTS `team_american_football_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_american_football_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yards_per_attempt` varchar(100) DEFAULT NULL,
  `average_starting_position` varchar(100) DEFAULT NULL,
  `timeouts` varchar(100) DEFAULT NULL,
  `time_of_possession` varchar(100) DEFAULT NULL,
  `turnover_ratio` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_american_football_stats`
--

LOCK TABLES `team_american_football_stats` WRITE;
/*!40000 ALTER TABLE `team_american_football_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_american_football_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_phases`
--

DROP TABLE IF EXISTS `team_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_phases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `start_season_id` int(11) DEFAULT NULL,
  `end_season_id` int(11) DEFAULT NULL,
  `affiliation_id` int(11) NOT NULL,
  `start_date_time` varchar(100) DEFAULT NULL,
  `end_date_time` varchar(100) DEFAULT NULL,
  `phase_status` varchar(40) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tea_aff_pha_rol_id__rol_id` (`role_id`),
  KEY `FK_tea_aff_pha_end_sea_id__sea_id` (`end_season_id`),
  KEY `FK_tea_aff_pha_sta_sea_id__sea_id` (`start_season_id`),
  KEY `FK_tea_aff_pha_aff_id__aff_id` (`affiliation_id`),
  KEY `FK_tea_aff_pha_tea_id__tea_id` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=369 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_phases`
--

LOCK TABLES `team_phases` WRITE;
/*!40000 ALTER TABLE `team_phases` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_phases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_key` varchar(100) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `home_site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tea_pub_id__pub_id` (`publisher_id`),
  KEY `FK_tea_hom_sit_id__sit_id` (`home_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_documents`
--

DROP TABLE IF EXISTS `teams_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams_documents` (
  `team_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  KEY `FK_tea_doc_tea_id__tea_id` (`team_id`),
  KEY `FK_tea_doc_doc_id__doc_id` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_documents`
--

LOCK TABLES `teams_documents` WRITE;
/*!40000 ALTER TABLE `teams_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_media`
--

DROP TABLE IF EXISTS `teams_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams_media` (
  `team_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  KEY `FK_tea_med_med_id__med_id` (`media_id`),
  KEY `FK_tea_med_tea_id__tea_id` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_media`
--

LOCK TABLES `teams_media` WRITE;
/*!40000 ALTER TABLE `teams_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(45) NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `sname` varchar(45) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) DEFAULT NULL,
  `admin_priv` tinyint(1) DEFAULT NULL,
  `age` int(3) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagering_moneylines`
--

DROP TABLE IF EXISTS `wagering_moneylines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagering_moneylines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `rotation_key` varchar(100) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `vigorish` varchar(100) DEFAULT NULL,
  `line` varchar(100) DEFAULT NULL,
  `line_opening` varchar(100) DEFAULT NULL,
  `prediction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wag_mon_boo_id__boo_id` (`bookmaker_id`),
  KEY `FK_wag_mon_tea_id__tea_id` (`team_id`),
  KEY `FK_wag_mon_eve_id__eve_id` (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagering_moneylines`
--

LOCK TABLES `wagering_moneylines` WRITE;
/*!40000 ALTER TABLE `wagering_moneylines` DISABLE KEYS */;
INSERT INTO `wagering_moneylines` VALUES
(0,1,1,NULL,1,0,NULL,NULL,NULL,NULL,NULL,'1'),
(1,2,1,NULL,2,1,NULL,NULL,NULL,NULL,NULL,'2'),
(2,3,1,NULL,3,2,NULL,NULL,NULL,NULL,NULL,'5'),
(3,4,2,NULL,4,3,NULL,NULL,NULL,NULL,NULL,'4'),
(4,5,3,NULL,5,4,NULL,NULL,NULL,NULL,NULL,'3');
/*!40000 ALTER TABLE `wagering_moneylines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagering_odds_lines`
--

DROP TABLE IF EXISTS `wagering_odds_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagering_odds_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `rotation_key` varchar(100) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `numerator` varchar(100) DEFAULT NULL,
  `denominator` varchar(100) DEFAULT NULL,
  `prediction` varchar(100) DEFAULT NULL,
  `payout_calculation` varchar(100) DEFAULT NULL,
  `payout_amount` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wag_odd_lin_tea_id__tea_id` (`team_id`),
  KEY `FK_wag_odd_lin_eve_id__eve_id` (`event_id`),
  KEY `FK_wag_odd_lin_boo_id__boo_id` (`bookmaker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagering_odds_lines`
--

LOCK TABLES `wagering_odds_lines` WRITE;
/*!40000 ALTER TABLE `wagering_odds_lines` DISABLE KEYS */;
INSERT INTO `wagering_odds_lines` VALUES
(0,1,0,NULL,1,1,NULL,NULL,NULL,NULL,'1',NULL,NULL),
(1,2,1,NULL,1,2,NULL,NULL,NULL,NULL,'1',NULL,NULL),
(2,3,2,NULL,2,3,NULL,NULL,NULL,NULL,'2',NULL,NULL),
(3,4,3,NULL,3,4,NULL,NULL,NULL,NULL,'3',NULL,NULL),
(4,5,4,NULL,4,5,NULL,NULL,NULL,NULL,'4',NULL,NULL);
/*!40000 ALTER TABLE `wagering_odds_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagering_runlines`
--

DROP TABLE IF EXISTS `wagering_runlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagering_runlines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `rotation_key` varchar(100) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `vigorish` varchar(100) DEFAULT NULL,
  `line` varchar(100) DEFAULT NULL,
  `line_opening` varchar(100) DEFAULT NULL,
  `line_value` varchar(100) DEFAULT NULL,
  `prediction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wag_run_boo_id__boo_id` (`bookmaker_id`),
  KEY `FK_wag_run_tea_id__tea_id` (`team_id`),
  KEY `FK_wag_run_eve_id__eve_id` (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagering_runlines`
--

LOCK TABLES `wagering_runlines` WRITE;
/*!40000 ALTER TABLE `wagering_runlines` DISABLE KEYS */;
INSERT INTO `wagering_runlines` VALUES
(0,1,1,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2'),
(1,2,2,NULL,2,2,NULL,NULL,NULL,NULL,NULL,NULL,'5'),
(2,3,3,NULL,3,3,NULL,NULL,NULL,NULL,NULL,NULL,'3'),
(3,4,4,NULL,4,4,NULL,NULL,NULL,NULL,NULL,NULL,'1'),
(4,5,5,NULL,5,5,NULL,NULL,NULL,NULL,NULL,NULL,'1');
/*!40000 ALTER TABLE `wagering_runlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagering_straight_spread_lines`
--

DROP TABLE IF EXISTS `wagering_straight_spread_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagering_straight_spread_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `rotation_key` varchar(100) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `vigorish` varchar(100) DEFAULT NULL,
  `line_value` varchar(100) DEFAULT NULL,
  `line_value_opening` varchar(100) DEFAULT NULL,
  `prediction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wag_str_spr_lin_tea_id__tea_id` (`team_id`),
  KEY `FK_wag_str_spr_lin_eve_id__eve_id` (`event_id`),
  KEY `FK_wag_str_spr_lin_boo_id__boo_id` (`bookmaker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagering_straight_spread_lines`
--

LOCK TABLES `wagering_straight_spread_lines` WRITE;
/*!40000 ALTER TABLE `wagering_straight_spread_lines` DISABLE KEYS */;
INSERT INTO `wagering_straight_spread_lines` VALUES
(0,1,1,NULL,5,4,NULL,NULL,NULL,NULL,NULL,'1'),
(1,2,2,NULL,2,3,NULL,NULL,NULL,NULL,NULL,'5'),
(2,3,3,NULL,3,2,NULL,NULL,NULL,NULL,NULL,'4'),
(3,4,4,NULL,4,1,NULL,NULL,NULL,NULL,NULL,'2'),
(4,5,5,NULL,1,5,NULL,NULL,NULL,NULL,NULL,'3');
/*!40000 ALTER TABLE `wagering_straight_spread_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagering_total_score_lines`
--

DROP TABLE IF EXISTS `wagering_total_score_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagering_total_score_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookmaker_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `rotation_key` varchar(100) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `vigorish` varchar(100) DEFAULT NULL,
  `line_over` varchar(100) DEFAULT NULL,
  `line_under` varchar(100) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  `total_opening` varchar(100) DEFAULT NULL,
  `prediction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_wag_tot_sco_lin_boo_id__boo_id` (`bookmaker_id`),
  KEY `FK_wag_tot_sco_lin_eve_id__eve_id` (`event_id`),
  KEY `FK_wag_tot_sco_lin_tea_id__tea_id` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagering_total_score_lines`
--

LOCK TABLES `wagering_total_score_lines` WRITE;
/*!40000 ALTER TABLE `wagering_total_score_lines` DISABLE KEYS */;
INSERT INTO `wagering_total_score_lines` VALUES
(0,5,1,NULL,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1'),
(1,2,2,NULL,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5'),
(2,3,5,NULL,5,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4'),
(3,4,3,NULL,4,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3'),
(4,1,4,NULL,3,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2');
/*!40000 ALTER TABLE `wagering_total_score_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_conditions`
--

DROP TABLE IF EXISTS `weather_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weather_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `temperature` varchar(100) DEFAULT NULL,
  `temperature_units` varchar(40) DEFAULT NULL,
  `humidity` varchar(100) DEFAULT NULL,
  `clouds` varchar(100) DEFAULT NULL,
  `wind_direction` varchar(100) DEFAULT NULL,
  `wind_velocity` varchar(100) DEFAULT NULL,
  `weather_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FK_wea_con_eve_id__eve_id` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_conditions`
--

LOCK TABLES `weather_conditions` WRITE;
/*!40000 ALTER TABLE `weather_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `weather_conditions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-08  2:50:59
