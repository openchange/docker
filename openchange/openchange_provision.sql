-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: 172.17.0.66    Database: openchange
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Current Database: `openchange`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `openchange` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `openchange`;

--
-- Table structure for table `folders`
--

DROP TABLE IF EXISTS `folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ou_id` int(11) NOT NULL,
  `folder_id` bigint(20) unsigned NOT NULL,
  `folder_class` varchar(6) NOT NULL DEFAULT 'system',
  `mailbox_id` bigint(20) unsigned DEFAULT NULL,
  `parent_folder_id` bigint(20) unsigned DEFAULT NULL,
  `FolderType` int(11) DEFAULT NULL,
  `SystemIdx` int(11) DEFAULT NULL,
  `MAPIStoreURI` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_folders_ou_id_idx` (`ou_id`),
  KEY `fk_folders_mailbox_id_idx` (`mailbox_id`),
  KEY `fk_folders_parent_folder_id_idx` (`parent_folder_id`),
  CONSTRAINT `fk_folders_mailbox_id` FOREIGN KEY (`mailbox_id`) REFERENCES `mailboxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_folders_ou_id` FOREIGN KEY (`ou_id`) REFERENCES `organizational_units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_folders_parent_folder_id` FOREIGN KEY (`parent_folder_id`) REFERENCES `folders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders`
--

LOCK TABLES `folders` WRITE;
/*!40000 ALTER TABLE `folders` DISABLE KEYS */;
INSERT INTO `folders` VALUES (1,1,72057594037927937,'public',NULL,NULL,1,1,NULL),(2,1,144115188075855873,'public',NULL,1,1,2,NULL),(3,1,216172782113783809,'public',NULL,1,1,3,NULL),(4,1,288230376151711745,'public',NULL,3,1,4,NULL),(5,1,360287970189639681,'public',NULL,3,1,6,NULL),(6,1,432345564227567617,'public',NULL,5,1,9,NULL),(7,1,504403158265495553,'public',NULL,3,1,5,NULL),(8,1,576460752303423489,'public',NULL,7,1,8,NULL),(9,1,648518346341351425,'public',NULL,3,1,-1,NULL),(17,1,17366724588070764545,'system',1,NULL,1,9,NULL),(18,1,17438782182108692481,'system',1,NULL,1,10,NULL),(19,1,17510839776146620417,'system',1,NULL,1,11,NULL),(20,1,17582897370184548353,'system',1,NULL,1,12,NULL);
/*!40000 ALTER TABLE `folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders_properties`
--

DROP TABLE IF EXISTS `folders_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders_properties` (
  `folder_id` bigint(20) unsigned NOT NULL,
  `name` varchar(256) NOT NULL,
  `value` varchar(512) DEFAULT NULL,
  KEY `fk_folders_properties_folder_id_idx` (`folder_id`),
  CONSTRAINT `fk_folders_properties_folder_id` FOREIGN KEY (`folder_id`) REFERENCES `folders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders_properties`
--

LOCK TABLES `folders_properties` WRITE;
/*!40000 ALTER TABLE `folders_properties` DISABLE KEYS */;
INSERT INTO `folders_properties` VALUES (1,'PidTagFolderChildCount','2'),(1,'PidTagChangeNumber','72057594037927937'),(1,'PidTagDisplayName','Public Folder Root'),(1,'PidTagCreationTime','130609769320000000'),(1,'PidTagLastModificationTime','130609769320000000'),(1,'PidTagSubFolders','TRUE'),(2,'PidTagFolderChildCount','0'),(2,'PidTagChangeNumber','144115188075855873'),(2,'PidTagDisplayName','IPM_SUBTREE'),(2,'PidTagCreationTime','130609769320000000'),(2,'PidTagLastModificationTime','130609769320000000'),(2,'PidTagSubFolders','FALSE'),(2,'PidTagAttributeHidden','0'),(2,'PidTagAttributeReadOnly','0'),(2,'PidTagAttributeSystem','0'),(2,'PidTagContainerClass','IPF.Note (check this)'),(3,'PidTagFolderChildCount','4'),(3,'PidTagChangeNumber','216172782113783809'),(3,'PidTagDisplayName','NON_IPM_SUBTREE'),(3,'PidTagCreationTime','130609769320000000'),(3,'PidTagLastModificationTime','130609769320000000'),(3,'PidTagSubFolders','TRUE'),(3,'PidTagAttributeHidden','0'),(3,'PidTagAttributeReadOnly','0'),(3,'PidTagAttributeSystem','0'),(3,'PidTagContainerClass','IPF.Note (check this)'),(4,'PidTagFolderChildCount','0'),(4,'PidTagChangeNumber','288230376151711745'),(4,'PidTagDisplayName','EFORMS REGISTRY'),(4,'PidTagCreationTime','130609769320000000'),(4,'PidTagLastModificationTime','130609769320000000'),(4,'PidTagSubFolders','FALSE'),(4,'PidTagAttributeHidden','0'),(4,'PidTagAttributeReadOnly','0'),(4,'PidTagAttributeSystem','0'),(4,'PidTagContainerClass','IPF.Note (check this)'),(5,'PidTagFolderChildCount','1'),(5,'PidTagChangeNumber','360287970189639681'),(5,'PidTagDisplayName','OFFLINE ADDRESS BOOK'),(5,'PidTagCreationTime','130609769320000000'),(5,'PidTagLastModificationTime','130609769320000000'),(5,'PidTagSubFolders','TRUE'),(5,'PidTagAttributeHidden','0'),(5,'PidTagAttributeReadOnly','0'),(5,'PidTagAttributeSystem','0'),(5,'PidTagContainerClass','IPF.Note (check this)'),(6,'PidTagFolderChildCount','0'),(6,'PidTagChangeNumber','432345564227567617'),(6,'PidTagDisplayName','/o=First Organization/cn=addrlists/cn=oabs/cn=Default Offline Address Book'),(6,'PidTagCreationTime','130609769320000000'),(6,'PidTagLastModificationTime','130609769320000000'),(6,'PidTagSubFolders','FALSE'),(6,'PidTagAttributeHidden','0'),(6,'PidTagAttributeReadOnly','0'),(6,'PidTagAttributeSystem','0'),(6,'PidTagContainerClass','IPF.Note (check this)'),(7,'PidTagFolderChildCount','1'),(7,'PidTagChangeNumber','504403158265495553'),(7,'PidTagDisplayName','SCHEDULE+ FREE BUSY'),(7,'PidTagCreationTime','130609769320000000'),(7,'PidTagLastModificationTime','130609769320000000'),(7,'PidTagSubFolders','TRUE'),(7,'PidTagAttributeHidden','0'),(7,'PidTagAttributeReadOnly','0'),(7,'PidTagAttributeSystem','0'),(7,'PidTagContainerClass','IPF.Note (check this)'),(8,'PidTagFolderChildCount','0'),(8,'PidTagChangeNumber','576460752303423489'),(8,'PidTagDisplayName','EX:/o=First Organization/ou=First Administrative Group'),(8,'PidTagCreationTime','130609769320000000'),(8,'PidTagLastModificationTime','130609769320000000'),(8,'PidTagSubFolders','FALSE'),(8,'PidTagAttributeHidden','0'),(8,'PidTagAttributeReadOnly','0'),(8,'PidTagAttributeSystem','0'),(8,'PidTagContainerClass','IPF.Note (check this)'),(9,'PidTagFolderChildCount','0'),(9,'PidTagChangeNumber','648518346341351425'),(9,'PidTagDisplayName','Events Root'),(9,'PidTagCreationTime','130609769320000000'),(9,'PidTagLastModificationTime','130609769320000000'),(9,'PidTagSubFolders','FALSE'),(9,'PidTagAttributeHidden','0'),(9,'PidTagAttributeReadOnly','0'),(9,'PidTagAttributeSystem','0'),(9,'PidTagContainerClass','IPF.Note (check this)'),(17,'PidTagContentUnreadCount','0'),(17,'PidTagContentCount','0'),(17,'PidTagAttributeHidden','0'),(17,'PidTagAttributeSystem','0'),(17,'PidTagAttributeReadOnly','0'),(17,'PidTagAccess','63'),(17,'PidTagRights','2043'),(17,'PidTagCreationTime','130609770590000000'),(17,'PidTagDisplayName','Reminders'),(17,'PidTagContainerClass','Outlook.Reminder'),(17,'PidTagFolderType','2'),(18,'PidTagContentUnreadCount','0'),(18,'PidTagContentCount','0'),(18,'PidTagAttributeHidden','0'),(18,'PidTagAttributeSystem','0'),(18,'PidTagAttributeReadOnly','0'),(18,'PidTagAccess','63'),(18,'PidTagRights','2043'),(18,'PidTagCreationTime','130609770590000000'),(18,'PidTagDisplayName','To-Do'),(18,'PidTagContainerClass','IPF.Task'),(18,'PidTagFolderType','2'),(18,'PidTagLastModificationTime','130609770590000000'),(18,'PidTagChangeNumber','2666130979403333633'),(19,'PidTagContentUnreadCount','0'),(19,'PidTagContentCount','0'),(19,'PidTagAttributeHidden','0'),(19,'PidTagAttributeSystem','0'),(19,'PidTagAttributeReadOnly','0'),(19,'PidTagAccess','63'),(19,'PidTagRights','2043'),(19,'PidTagCreationTime','130609770590000000'),(19,'PidTagDisplayName','Tracked Mail Processing'),(19,'PidTagContainerClass','IPF.Note'),(19,'PidTagFolderType','2'),(19,'PidTagLastModificationTime','130609770590000000'),(19,'PidTagChangeNumber','2882303761517117441'),(20,'PidTagContentUnreadCount','0'),(20,'PidTagContentCount','0'),(20,'PidTagAttributeHidden','0'),(20,'PidTagAttributeSystem','0'),(20,'PidTagAttributeReadOnly','0'),(20,'PidTagAccess','63'),(20,'PidTagRights','2043'),(20,'PidTagCreationTime','130609770590000000'),(20,'PidTagDisplayName','Top of Information Store'),(20,'PidTagSubfolders','TRUE'),(20,'PidTagExtendedFolderFlags','AQQAABAABgQDAAAA'),(20,'PidTagLastModificationTime','130609770640000000'),(20,'PidTagChangeNumber','9367487224930631681'),(17,'PidTagExtendedFolderFlags','AQQAAAAB'),(17,'PidTagLastModificationTime','130609770650000000'),(17,'PidTagChangeNumber','9943947977234055169');
/*!40000 ALTER TABLE `folders_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailboxes`
--

DROP TABLE IF EXISTS `mailboxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailboxes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ou_id` int(11) NOT NULL,
  `folder_id` bigint(20) unsigned NOT NULL,
  `name` varchar(256) NOT NULL,
  `MailboxGUID` varchar(36) NOT NULL,
  `ReplicaGUID` varchar(36) NOT NULL,
  `ReplicaID` int(11) NOT NULL,
  `SystemIdx` int(11) NOT NULL,
  `indexing_url` varchar(1024) DEFAULT NULL,
  `locale` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mailboxes_ou_id_idx` (`ou_id`),
  CONSTRAINT `fk_mailboxes_ou_id` FOREIGN KEY (`ou_id`) REFERENCES `organizational_units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailboxes`
--

LOCK TABLES `mailboxes` WRITE;
/*!40000 ALTER TABLE `mailboxes` DISABLE KEYS */;
INSERT INTO `mailboxes` VALUES (1,1,16790263835767341057,'openchange','082152cf-ae39-44a1-b11f-a1e1af3bac08','e909c6a9-6142-4c5d-90d2-80e682807458',1,1,NULL,'en_US');
/*!40000 ALTER TABLE `mailboxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailboxes_properties`
--

DROP TABLE IF EXISTS `mailboxes_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailboxes_properties` (
  `mailbox_id` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` varchar(512) DEFAULT NULL,
  KEY `fk_mailboxes_properties_mailbox_id_idx` (`mailbox_id`),
  CONSTRAINT `fk_mailboxes_properties_mailbox_id` FOREIGN KEY (`mailbox_id`) REFERENCES `mailboxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailboxes_properties`
--

LOCK TABLES `mailboxes_properties` WRITE;
/*!40000 ALTER TABLE `mailboxes_properties` DISABLE KEYS */;
INSERT INTO `mailboxes_properties` VALUES (1,'PidTagAccess','63'),(1,'PidTagRights','2043'),(1,'PidTagFolderType','1'),(1,'PidTagSubFolders','TRUE'),(1,'PidTagDisplayName','OpenChange: openchange'),(1,'PidTagCreationTime','130609770590000000'),(1,'PidTagMessageClass','IPC'),(1,'PidTagIpmDraftsEntryId','AAAAAM9SIQg5rqFEsR+h4a87rAgBAKnGCelCYV1MkNKA5oKAdFgAAAAAA/kAAA=='),(1,'PidTagIpmAppointmentEntryId','AAAAAM9SIQg5rqFEsR+h4a87rAgBAKnGCelCYV1MkNKA5oKAdFgAAAAAA/oAAA=='),(1,'PidTagIpmContactEntryId','AAAAAM9SIQg5rqFEsR+h4a87rAgBAKnGCelCYV1MkNKA5oKAdFgAAAAAA/sAAA=='),(1,'PidTagIpmTaskEntryId','AAAAAM9SIQg5rqFEsR+h4a87rAgBAKnGCelCYV1MkNKA5oKAdFgAAAAAA/wAAA=='),(1,'PidTagIpmNoteEntryId','AAAAAM9SIQg5rqFEsR+h4a87rAgBAKnGCelCYV1MkNKA5oKAdFgAAAAAA/0AAA=='),(1,'PidTagIpmJournalEntryId','AAAAAM9SIQg5rqFEsR+h4a87rAgBAKnGCelCYV1MkNKA5oKAdFgAAAAAA/4AAA=='),(1,'PidTagRemindersOnlineEntryId','AAAAAM9SIQg5rqFEsR+h4a87rAgBAKnGCelCYV1MkNKA5oKAdFgAAAAAA/EAAA=='),(1,'PidTagAdditionalRenEntryIds','0x00000006;<nil>;<nil>;<nil>;<nil>;AAAAAM9SIQg5rqFEsR+h4a87rAgBAKnGCelCYV1MkNKA5oKAdFgAAAAABAcAAA==;<nil>'),(1,'PidTagAdditionalRenEntryIdsEx','AYAyAAEALgAAAAAAz1IhCDmuoUSxH6HhrzusCAEAqcYJ6UJhXUyQ0oDmgoB0WAAAAAAEAQAABoAyAAEALgAAAAAAz1IhCDmuoUSxH6HhrzusCAEAqcYJ6UJhXUyQ0oDmgoB0WAAAAAAEAgAAB4AyAAEALgAAAAAAz1IhCDmuoUSxH6HhrzusCAEAqcYJ6UJhXUyQ0oDmgoB0WAAAAAAEAwAACIAyAAEALgAAAAAAz1IhCDmuoUSxH6HhrzusCAEAqcYJ6UJhXUyQ0oDmgoB0WAAAAAAECQAAAAAAAA=='),(1,'PidTagLastModificationTime','130609770670000000'),(1,'PidTagChangeNumber','10448351135499550721');
/*!40000 ALTER TABLE `mailboxes_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapistore_indexes`
--

DROP TABLE IF EXISTS `mapistore_indexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapistore_indexes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(1024) NOT NULL,
  `next_fmid` varchar(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapistore_indexes`
--

LOCK TABLES `mapistore_indexes` WRITE;
/*!40000 ALTER TABLE `mapistore_indexes` DISABLE KEYS */;
INSERT INTO `mapistore_indexes` VALUES (1,'openchange','1052');
/*!40000 ALTER TABLE `mapistore_indexes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapistore_indexing`
--

DROP TABLE IF EXISTS `mapistore_indexing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapistore_indexing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(1024) NOT NULL,
  `fmid` varchar(36) NOT NULL,
  `url` varchar(1024) NOT NULL,
  `soft_deleted` varchar(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapistore_indexing`
--

LOCK TABLES `mapistore_indexing` WRITE;
/*!40000 ALTER TABLE `mapistore_indexing` DISABLE KEYS */;
/*!40000 ALTER TABLE `mapistore_indexing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ou_id` int(11) DEFAULT NULL,
  `message_id` bigint(20) unsigned DEFAULT NULL,
  `message_type` varchar(45) DEFAULT NULL,
  `folder_id` bigint(20) unsigned DEFAULT NULL,
  `mailbox_id` bigint(20) unsigned DEFAULT NULL,
  `normalized_subject` text,
  PRIMARY KEY (`id`),
  KEY `fk_messages_ou_id_idx` (`ou_id`),
  KEY `fk_messages_folder_id_idx` (`folder_id`),
  KEY `fk_messages_mailbox_id_idx` (`mailbox_id`),
  CONSTRAINT `fk_messages_folder_id` FOREIGN KEY (`folder_id`) REFERENCES `folders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_messages_mailbox_id` FOREIGN KEY (`mailbox_id`) REFERENCES `mailboxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_messages_ou_id` FOREIGN KEY (`ou_id`) REFERENCES `organizational_units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,720575940379279361,'systemMessage',8,1,'USER-/CN=RECIPIENTS/CN=OPENCHANGE');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages_properties`
--

DROP TABLE IF EXISTS `messages_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages_properties` (
  `message_id` bigint(20) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` varchar(512) NOT NULL,
  KEY `fk_messages_properties_message_id_idx` (`message_id`),
  KEY `message_properties_message_id_name_idx` (`message_id`,`name`),
  CONSTRAINT `fk_messages_properties_message_id` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages_properties`
--

LOCK TABLES `messages_properties` WRITE;
/*!40000 ALTER TABLE `messages_properties` DISABLE KEYS */;
INSERT INTO `messages_properties` VALUES (1,'PidTagDisplayBcc',''),(1,'PidTagDisplayCc',''),(1,'PidTagDisplayTo',''),(1,'PidTagHasNamedProperties','0');
/*!40000 ALTER TABLE `messages_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `named_properties`
--

DROP TABLE IF EXISTS `named_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `named_properties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `propType` int(10) unsigned NOT NULL,
  `oleguid` varchar(255) NOT NULL,
  `mappedId` int(10) unsigned NOT NULL,
  `propId` int(10) unsigned DEFAULT NULL,
  `propName` varchar(255) DEFAULT NULL,
  `oom` varchar(255) DEFAULT NULL,
  `canonical` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `named_properties_nappedId` (`mappedId`),
  KEY `named_properties_type_oleguid_propId` (`type`,`oleguid`,`propId`),
  KEY `named_properties_type_oleguid_propName` (`type`,`oleguid`,`propName`)
) ENGINE=InnoDB AUTO_INCREMENT=1064 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `named_properties`
--

LOCK TABLES `named_properties` WRITE;
/*!40000 ALTER TABLE `named_properties` DISABLE KEYS */;
INSERT INTO `named_properties` VALUES (1066,0,3,'00062004-0000-0000-c000-000000000046',36864,32809,NULL,'ABPArrayType','PidLidAddressBookProviderArrayType'),(1067,0,4099,'00062004-0000-0000-c000-000000000046',36865,32808,NULL,'ABPEmailList','PidLidAddressBookProviderEmailList'),(1068,0,31,'00062004-0000-0000-c000-000000000046',36866,32989,NULL,'AddressCountryCode','PidLidAddressCountryCode'),(1069,0,258,'00062004-0000-0000-c000-000000000046',36867,32846,NULL,'AnniversaryEventEID','PidLidAnniversaryEventEntryId'),(1070,0,11,'00062004-0000-0000-c000-000000000046',36868,32805,NULL,'AutoLog','PidLidAutoLog'),(1071,0,258,'00062004-0000-0000-c000-000000000046',36869,32845,NULL,'BirthdayEventEID','PidLidBirthdayEventEntryId'),(1072,0,64,'00062004-0000-0000-c000-000000000046',36870,32990,NULL,'ApptBirthdayLocal','PidLidBirthdayLocal'),(1073,0,258,'00062004-0000-0000-c000-000000000046',36871,32833,NULL,'BCCardPicture','PidLidBusinessCardCardPicture'),(1074,0,258,'00062004-0000-0000-c000-000000000046',36872,32832,NULL,'BCDisplayDefinition','PidLidBusinessCardDisplayDefinition'),(1075,0,3,'00062004-0000-0000-c000-000000000046',36873,32803,NULL,'ContactCharSet','PidLidContactCharacterSet'),(1076,0,4099,'00062004-0000-0000-c000-000000000046',36874,32775,NULL,'ContactItemData','PidLidContactItemData'),(1077,0,258,'00062004-0000-0000-c000-000000000046',36875,32994,NULL,'ContactLinkedGALEntryID','PidLidContactLinkedGlobalAddressListEntryId'),(1078,0,72,'00062004-0000-0000-c000-000000000046',36876,33000,NULL,'ContactLinkGALLinkID','PidLidContactLinkGlobalAddressListLinkId'),(1079,0,3,'00062004-0000-0000-c000-000000000046',36877,32998,NULL,'ContactLinkGALLinkState','PidLidContactLinkGlobalAddressListLinkState'),(1080,0,4354,'00062004-0000-0000-c000-000000000046',36878,32997,NULL,'ContactLinkLinkRejectHistory','PidLidContactLinkLinkRejectHistory'),(1081,0,4127,'00062004-0000-0000-c000-000000000046',36879,32995,NULL,'ContactLinkSMTPAddressCache','PidLidContactLinkSMTPAddressCache'),(1082,0,31,'00062004-0000-0000-c000-000000000046',36880,32847,NULL,'ContactUserField1','PidLidContactUserField1'),(1083,0,31,'00062004-0000-0000-c000-000000000046',36881,32848,NULL,'ContactUserField2','PidLidContactUserField2'),(1084,0,31,'00062004-0000-0000-c000-000000000046',36882,32849,NULL,'ContactUserField3','PidLidContactUserField3'),(1085,0,31,'00062004-0000-0000-c000-000000000046',36883,32850,NULL,'ContactUserField4','PidLidContactUserField4'),(1086,0,31,'00062004-0000-0000-c000-000000000046',36884,32784,NULL,'Department','PidLidDepartment'),(1087,0,3,'00062004-0000-0000-c000-000000000046',36885,32844,NULL,'DLChecksum','PidLidDistributionListChecksum'),(1088,0,4354,'00062004-0000-0000-c000-000000000046',36886,32853,NULL,'DLMembers','PidLidDistributionListMembers'),(1089,0,31,'00062004-0000-0000-c000-000000000046',36887,32851,NULL,'DLName','PidLidDistributionListName'),(1090,0,4354,'00062004-0000-0000-c000-000000000046',36888,32852,NULL,'DLOneOffMembers','PidLidDistributionListOneOffMembers'),(1091,0,258,'00062004-0000-0000-c000-000000000046',36889,32868,NULL,'DLStream','PidLidDistributionListStream'),(1092,0,31,'00062004-0000-0000-c000-000000000046',36890,32898,NULL,'Email1AddrType','PidLidEmail1AddressType'),(1093,0,31,'00062004-0000-0000-c000-000000000046',36891,32896,NULL,'Email1DisplayName','PidLidEmail1DisplayName'),(1094,0,31,'00062004-0000-0000-c000-000000000046',36892,32899,NULL,'Email1EmailAddress','PidLidEmail1EmailAddress'),(1095,0,31,'00062004-0000-0000-c000-000000000046',36893,32900,NULL,'Email1OriginalDisplayName, Email1OriginalDisplayName,, EXSCHEMA_MAPI_EMAIL1ORIGINALDISPLAYNAME','PidLidEmail1OriginalDisplayName'),(1096,0,258,'00062004-0000-0000-c000-000000000046',36894,32901,NULL,'Email1OriginalEntryID','PidLidEmail1OriginalEntryId'),(1097,0,31,'00062004-0000-0000-c000-000000000046',36895,32914,NULL,'Email2AddrType','PidLidEmail2AddressType'),(1098,0,31,'00062004-0000-0000-c000-000000000046',36896,32912,NULL,'Email2DisplayName','PidLidEmail2DisplayName'),(1099,0,31,'00062004-0000-0000-c000-000000000046',36897,32915,NULL,'Email2EmailAddress','PidLidEmail2EmailAddress'),(1100,0,31,'00062004-0000-0000-c000-000000000046',36898,32916,NULL,'Email2OriginalDisplayName','PidLidEmail2OriginalDisplayName'),(1101,0,258,'00062004-0000-0000-c000-000000000046',36899,32917,NULL,'Email2OriginalEntryID','PidLidEmail2OriginalEntryId'),(1102,0,31,'00062004-0000-0000-c000-000000000046',36900,32930,NULL,'Email3AddrType','PidLidEmail3AddressType'),(1103,0,31,'00062004-0000-0000-c000-000000000046',36901,32928,NULL,'Email3DisplayName','PidLidEmail3DisplayName'),(1104,0,31,'00062004-0000-0000-c000-000000000046',36902,32931,NULL,'Email3EmailAddress','PidLidEmail3EmailAddress'),(1105,0,31,'00062004-0000-0000-c000-000000000046',36903,32932,NULL,'Email3OriginalDisplayName','PidLidEmail3OriginalDisplayName'),(1106,0,258,'00062004-0000-0000-c000-000000000046',36904,32933,NULL,'Email3OriginalEntryID','PidLidEmail3OriginalEntryId'),(1107,0,31,'00062004-0000-0000-c000-000000000046',36905,32946,NULL,'Fax1AddrType','PidLidFax1AddressType'),(1108,0,31,'00062004-0000-0000-c000-000000000046',36906,32947,NULL,'Fax1EmailAddress','PidLidFax1EmailAddress'),(1109,0,31,'00062004-0000-0000-c000-000000000046',36907,32948,NULL,'Fax1OriginalDisplayName','PidLidFax1OriginalDisplayName'),(1110,0,258,'00062004-0000-0000-c000-000000000046',36908,32949,NULL,'Fax1OriginalEntryID','PidLidFax1OriginalEntryId'),(1111,0,31,'00062004-0000-0000-c000-000000000046',36909,32962,NULL,'Fax2AddrType','PidLidFax2AddressType'),(1112,0,31,'00062004-0000-0000-c000-000000000046',36910,32963,NULL,'Fax2EmailAddress','PidLidFax2EmailAddress'),(1113,0,31,'00062004-0000-0000-c000-000000000046',36911,32964,NULL,'Fax2OriginalDisplayName','PidLidFax2OriginalDisplayName'),(1114,0,258,'00062004-0000-0000-c000-000000000046',36912,32965,NULL,'Fax2OriginalEntryID','PidLidFax2OriginalEntryId'),(1115,0,31,'00062004-0000-0000-c000-000000000046',36913,32978,NULL,'Fax3AddrType','PidLidFax3AddressType'),(1116,0,31,'00062004-0000-0000-c000-000000000046',36914,32979,NULL,'Fax3EmailAddress','PidLidFax3EmailAddress'),(1117,0,31,'00062004-0000-0000-c000-000000000046',36915,32980,NULL,'Fax3OriginalDisplayName','PidLidFax3OriginalDisplayName'),(1118,0,258,'00062004-0000-0000-c000-000000000046',36916,32981,NULL,'Fax3OriginalEntryID','PidLidFax3OriginalEntryId'),(1119,0,31,'00062004-0000-0000-c000-000000000046',36917,32773,NULL,'FileUnder','PidLidFileUnder'),(1120,0,3,'00062004-0000-0000-c000-000000000046',36918,32774,NULL,'FileUnderId','PidLidFileUnderId'),(1121,0,4099,'00062004-0000-0000-c000-000000000046',36919,32806,NULL,'FileUnderList','PidLidFileUnderList'),(1122,0,31,'00062004-0000-0000-c000-000000000046',36920,32984,NULL,'FreeBusyLocation','PidLidFreeBusyLocation'),(1123,0,11,'00062004-0000-0000-c000-000000000046',36921,32789,NULL,'HasPicture','PidLidHasPicture'),(1124,0,31,'00062004-0000-0000-c000-000000000046',36922,32794,NULL,'HomeAddress','PidLidHomeAddress'),(1125,0,31,'00062004-0000-0000-c000-000000000046',36923,32986,NULL,'HomeAddressCountryCode','PidLidHomeAddressCountryCode'),(1126,0,31,'00062004-0000-0000-c000-000000000046',36924,32811,NULL,'HTML','PidLidHtml'),(1127,0,31,'00062004-0000-0000-c000-000000000046',36925,32866,NULL,'InstMsg','PidLidInstantMessagingAddress'),(1128,0,11,'00062004-0000-0000-c000-000000000046',36926,32992,NULL,'IsContactLinked','PidLidIsContactLinked'),(1129,0,31,'00062004-0000-0000-c000-000000000046',36927,32796,NULL,'OtherAddress','PidLidOtherAddress'),(1130,0,31,'00062004-0000-0000-c000-000000000046',36928,32988,NULL,'OtherAddressCountryCode','PidLidOtherAddressCountryCode'),(1131,0,3,'00062004-0000-0000-c000-000000000046',36929,32802,NULL,'PostalAddressId','PidLidPostalAddressId'),(1132,0,64,'00062004-0000-0000-c000-000000000046',36930,32991,NULL,'ApptAnniversaryLocal','PidLidWeddingAnniversaryLocal'),(1133,0,31,'00062004-0000-0000-c000-000000000046',36931,32795,NULL,'WorkAddress','PidLidWorkAddress'),(1134,0,31,'00062004-0000-0000-c000-000000000046',36932,32838,NULL,'WorkAddressCity','PidLidWorkAddressCity'),(1135,0,31,'00062004-0000-0000-c000-000000000046',36933,32841,NULL,'WorkAddressCountry','PidLidWorkAddressCountry'),(1136,0,31,'00062004-0000-0000-c000-000000000046',36934,32987,NULL,'WorkAddressCountryCode','PidLidWorkAddressCountryCode'),(1137,0,31,'00062004-0000-0000-c000-000000000046',36935,32840,NULL,'WorkAddressPostalCode','PidLidWorkAddressPostalCode'),(1138,0,31,'00062004-0000-0000-c000-000000000046',36936,32842,NULL,'WorkAddressPostOfficeBox','PidLidWorkAddressPostOfficeBox'),(1139,0,31,'00062004-0000-0000-c000-000000000046',36937,32839,NULL,'WorkAddressState','PidLidWorkAddressState'),(1140,0,31,'00062004-0000-0000-c000-000000000046',36938,32814,NULL,'YomiCompanyName','PidLidYomiCompanyName'),(1141,0,31,'00062004-0000-0000-c000-000000000046',36939,32812,NULL,'YomiFirstName','PidLidYomiFirstName'),(1142,0,31,'00062004-0000-0000-c000-000000000046',36940,32813,NULL,'YomiLastName','PidLidYomiLastName'),(1143,0,31,'00062002-0000-0000-c000-000000000046',36941,33336,NULL,'AllAttendeesString','PidLidAllAttendeesString'),(1144,0,11,'00062002-0000-0000-c000-000000000046',36942,33350,NULL,'AllowExternCheck','PidLidAllowExternalCheck'),(1145,0,3,'00062002-0000-0000-c000-000000000046',36943,33287,NULL,'ApptAuxFlags','PidLidAppointmentAuxiliaryFlags'),(1146,0,3,'00062002-0000-0000-c000-000000000046',36944,33300,NULL,'ApptColor','PidLidAppointmentColor'),(1147,0,11,'00062002-0000-0000-c000-000000000046',36945,33367,NULL,'ApptCounterProposal','PidLidAppointmentCounterProposal'),(1148,0,3,'00062002-0000-0000-c000-000000000046',36946,33299,NULL,'ApptDuration','PidLidAppointmentDuration'),(1149,0,64,'00062002-0000-0000-c000-000000000046',36947,33297,NULL,'ApptEndDate','PidLidAppointmentEndDate'),(1150,0,64,'00062002-0000-0000-c000-000000000046',36948,33296,NULL,'ApptEndTime','PidLidAppointmentEndTime'),(1151,0,64,'00062002-0000-0000-c000-000000000046',36949,33294,NULL,'ApptEndWhole','PidLidAppointmentEndWhole'),(1152,0,3,'00062002-0000-0000-c000-000000000046',36950,33283,NULL,'ApptLastSequence','PidLidAppointmentLastSequence'),(1153,0,11,'00062002-0000-0000-c000-000000000046',36951,33370,NULL,'ApptNotAllowPropose','PidLidAppointmentNotAllowPropose'),(1154,0,3,'00062002-0000-0000-c000-000000000046',36952,33369,NULL,'ApptProposalNum','PidLidAppointmentProposalNumber'),(1155,0,3,'00062002-0000-0000-c000-000000000046',36953,33366,NULL,'ApptProposedDuration','PidLidAppointmentProposedDuration'),(1156,0,64,'00062002-0000-0000-c000-000000000046',36954,33361,NULL,'ApptProposedEndWhole','PidLidAppointmentProposedEndWhole'),(1157,0,64,'00062002-0000-0000-c000-000000000046',36955,33360,NULL,'ApptProposedStartWhole','PidLidAppointmentProposedStartWhole'),(1158,0,258,'00062002-0000-0000-c000-000000000046',36956,33302,NULL,'ApptRecur','PidLidAppointmentRecur'),(1159,0,31,'00062002-0000-0000-c000-000000000046',36957,33328,NULL,'ApptReplyName, http://schemas.microsoft.com/mapi/apptreplyname','PidLidAppointmentReplyName'),(1160,0,64,'00062002-0000-0000-c000-000000000046',36958,33312,NULL,'ApptReplyTime','PidLidAppointmentReplyTime'),(1161,0,3,'00062002-0000-0000-c000-000000000046',36959,33281,NULL,'ApptSequence','PidLidAppointmentSequence'),(1162,0,64,'00062002-0000-0000-c000-000000000046',36960,33282,NULL,'ApptSeqTime','PidLidAppointmentSequenceTime'),(1163,0,64,'00062002-0000-0000-c000-000000000046',36961,33298,NULL,'ApptStartDate','PidLidAppointmentStartDate'),(1164,0,64,'00062002-0000-0000-c000-000000000046',36962,33295,NULL,'ApptStartTime','PidLidAppointmentStartTime'),(1165,0,64,'00062002-0000-0000-c000-000000000046',36963,33293,NULL,'ApptStartWhole','PidLidAppointmentStartWhole'),(1166,0,3,'00062002-0000-0000-c000-000000000046',36964,33303,NULL,'ApptStateFlags','PidLidAppointmentStateFlags'),(1167,0,11,'00062002-0000-0000-c000-000000000046',36965,33301,NULL,'ApptSubType','PidLidAppointmentSubType'),(1168,0,258,'00062002-0000-0000-c000-000000000046',36966,33375,NULL,'ApptTZDefEndDisplay','PidLidAppointmentTimeZoneDefinitionEndDisplay'),(1169,0,258,'00062002-0000-0000-c000-000000000046',36967,33376,NULL,'ApptTZDefRecur','PidLidAppointmentTimeZoneDefinitionRecur'),(1170,0,258,'00062002-0000-0000-c000-000000000046',36968,33374,NULL,'ApptTZDefStartDisplay','PidLidAppointmentTimeZoneDefinitionStartDisplay'),(1171,0,258,'00062002-0000-0000-c000-000000000046',36969,33373,NULL,'ApptUnsendableRecips','PidLidAppointmentUnsendableRecipients'),(1172,0,64,'00062002-0000-0000-c000-000000000046',36970,33318,NULL,'ApptUpdateTime','PidLidAppointmentUpdateTime'),(1173,0,11,'00062002-0000-0000-c000-000000000046',36971,33338,NULL,'AutoFillLocation','PidLidAutoFillLocation'),(1174,0,11,'00062002-0000-0000-c000-000000000046',36972,33348,NULL,'AutoStartCheck','PidLidAutoStartCheck'),(1175,0,3,'00062002-0000-0000-c000-000000000046',36973,33285,NULL,'BusyStatus','PidLidBusyStatus'),(1176,0,31,'00062002-0000-0000-c000-000000000046',36974,33340,NULL,'CCAttendeesString','PidLidCcAttendeesString'),(1177,0,3,'00062002-0000-0000-c000-000000000046',36975,33284,NULL,'ChangeHighlight','PidLidChangeHighlight'),(1178,0,64,'00062002-0000-0000-c000-000000000046',36976,33334,NULL,'ClipEnd','PidLidClipEnd'),(1179,0,64,'00062002-0000-0000-c000-000000000046',36977,33333,NULL,'ClipStart','PidLidClipStart'),(1180,0,31,'00062002-0000-0000-c000-000000000046',36978,33351,NULL,'CollaborateDoc','PidLidCollaborateDoc'),(1181,0,11,'00062002-0000-0000-c000-000000000046',36979,33344,NULL,'ConfCheck','PidLidConferencingCheck'),(1182,0,3,'00062002-0000-0000-c000-000000000046',36980,33345,NULL,'ConfType','PidLidConferencingType'),(1183,0,31,'00062002-0000-0000-c000-000000000046',36981,33346,NULL,'Directory','PidLidDirectory'),(1184,0,64,'00062002-0000-0000-c000-000000000046',36982,33320,NULL,'ExceptionReplaceTime','PidLidExceptionReplaceTime'),(1185,0,11,'00062002-0000-0000-c000-000000000046',36983,33323,NULL,'FExceptionalAttendees','PidLidFExceptionalAttendees'),(1186,0,11,'00062002-0000-0000-c000-000000000046',36984,33286,NULL,'FExceptionalBody','PidLidFExceptionalBody'),(1187,0,11,'00062002-0000-0000-c000-000000000046',36985,33321,NULL,'FInvited','PidLidFInvited'),(1188,0,11,'00062002-0000-0000-c000-000000000046',36986,33290,NULL,'FwrdInstance','PidLidForwardInstance'),(1189,0,258,'00062002-0000-0000-c000-000000000046',36987,33377,NULL,'ForwardNotificationRecipients','PidLidForwardNotificationRecipients'),(1190,0,11,'00062002-0000-0000-c000-000000000046',36988,33327,NULL,'FOthersAppt, http://schemas.microsoft.com/mapi/fothersappt','PidLidFOthersAppointment'),(1191,0,258,'00062002-0000-0000-c000-000000000046',36989,33402,NULL,'InboundICalStream, dispidInboundICalStream','PidLidInboundICalStream'),(1192,0,3,'00062002-0000-0000-c000-000000000046',36990,33316,NULL,'IntendedBusyStatus','PidLidIntendedBusyStatus'),(1193,0,4354,'00062002-0000-0000-c000-000000000046',36991,33292,NULL,'LinkedTaskItems','PidLidLinkedTaskItems'),(1194,0,31,'00062002-0000-0000-c000-000000000046',36992,33288,NULL,'Location','PidLidLocation'),(1195,0,31,'00062002-0000-0000-c000-000000000046',36993,33289,NULL,'MWSURL','PidLidMeetingWorkspaceUrl'),(1196,0,31,'00062002-0000-0000-c000-000000000046',36994,33352,NULL,'NetShowURL','PidLidNetShowUrl'),(1197,0,31,'00062002-0000-0000-c000-000000000046',36995,33353,NULL,'OnlinePassword','PidLidOnlinePassword'),(1198,0,31,'00062002-0000-0000-c000-000000000046',36996,33347,NULL,'OrgAlias','PidLidOrganizerAlias'),(1199,0,258,'00062002-0000-0000-c000-000000000046',36997,33335,NULL,'OrigStoreEid, http://schemas.microsoft.com/mapi/origstoreeid','PidLidOriginalStoreEntryId'),(1200,0,31,'00062002-0000-0000-c000-000000000046',36998,33326,NULL,'OwnerName','PidLidOwnerName'),(1201,0,31,'00062002-0000-0000-c000-000000000046',36999,33330,NULL,'RecurPattern','PidLidRecurrencePattern'),(1202,0,3,'00062002-0000-0000-c000-000000000046',37000,33329,NULL,'RecurType','PidLidRecurrenceType'),(1203,0,11,'00062002-0000-0000-c000-000000000046',37001,33315,NULL,'Recurring','PidLidRecurring'),(1204,0,3,'00062002-0000-0000-c000-000000000046',37002,33304,NULL,'ResponseStatus','PidLidResponseStatus'),(1205,0,11,'00062002-0000-0000-c000-000000000046',37003,33403,NULL,'IsSingleBodyICal, dispidIsSingleBodyICal','PidLidSingleBodyICal'),(1206,0,31,'00062002-0000-0000-c000-000000000046',37004,33332,NULL,'TimeZoneDesc','PidLidTimeZoneDescription'),(1207,0,258,'00062002-0000-0000-c000-000000000046',37005,33331,NULL,'TimeZoneStruct','PidLidTimeZoneStruct'),(1208,0,31,'00062002-0000-0000-c000-000000000046',37006,33339,NULL,'ToAttendeesString','PidLidToAttendeesString'),(1209,1,31,'96357f7f-59e1-47d0-99a7-46515c183b54',37007,0,'AttachmentMacContentType',NULL,'PidNameAttachmentMacContentType'),(1210,1,258,'96357f7f-59e1-47d0-99a7-46515c183b54',37008,0,'AttachmentMacInfo',NULL,'PidNameAttachmentMacInfo'),(1211,0,3,'11000e07-b51b-40d6-af21-caa85edab1d0',37009,21,NULL,'ClientIntent','PidLidClientIntent'),(1212,0,11,'11000e07-b51b-40d6-af21-caa85edab1d0',37010,34252,NULL,'ExchangeProcessed','PidLidServerProcessed'),(1213,0,3,'11000e07-b51b-40d6-af21-caa85edab1d0',37011,34253,NULL,'ExchangeProcessingAction','PidLidServerProcessingActions'),(1214,0,11,'00062008-0000-0000-c000-000000000046',37012,34062,NULL,'AgingDontAgeMe','PidLidAgingDontAgeMe'),(1215,0,3,'00062008-0000-0000-c000-000000000046',37013,34074,NULL,'SniffState','PidLidAutoProcessState'),(1216,0,31,'00062008-0000-0000-c000-000000000046',37014,34101,NULL,'Billing','PidLidBilling'),(1217,0,31,'00062008-0000-0000-c000-000000000046',37015,34230,NULL,'Classification','PidLidClassification'),(1218,0,31,'00062008-0000-0000-c000-000000000046',37016,34231,NULL,'ClassDesc','PidLidClassificationDescription'),(1219,0,31,'00062008-0000-0000-c000-000000000046',37017,34232,NULL,'ClassGuid','PidLidClassificationGuid'),(1220,0,11,'00062008-0000-0000-c000-000000000046',37018,34234,NULL,'ClassKeep','PidLidClassificationKeep'),(1221,0,11,'00062008-0000-0000-c000-000000000046',37019,34229,NULL,'Classified','PidLidClassified'),(1222,0,64,'00062008-0000-0000-c000-000000000046',37020,34071,NULL,'CommonEnd','PidLidCommonEnd'),(1223,0,64,'00062008-0000-0000-c000-000000000046',37021,34070,NULL,'CommonStart','PidLidCommonStart'),(1224,0,4127,'00062008-0000-0000-c000-000000000046',37022,34105,NULL,'Companies, http://schemas.microsoft.com/exchange/companies','PidLidCompanies'),(1225,0,258,'00062008-0000-0000-c000-000000000046',37023,34181,NULL,'ContactLinkEntry','PidLidContactLinkEntry'),(1226,0,31,'00062008-0000-0000-c000-000000000046',37024,34182,NULL,'ContactLinkName','PidLidContactLinkName'),(1227,0,258,'00062008-0000-0000-c000-000000000046',37025,34180,NULL,'ContactLinkSearchKey','PidLidContactLinkSearchKey'),(1228,0,4127,'00062008-0000-0000-c000-000000000046',37026,34106,NULL,'Contacts','PidLidContacts'),(1229,0,64,'00062008-0000-0000-c000-000000000046',37027,34250,NULL,'ConvActionLastAppliedTime','PidLidConversationActionLastAppliedTime'),(1230,0,64,'00062008-0000-0000-c000-000000000046',37028,34248,NULL,'ConvActionMaxDeliveryTime','PidLidConversationActionMaxDeliveryTime'),(1231,0,258,'00062008-0000-0000-c000-000000000046',37029,34246,NULL,'ConvActionMoveFolderEid','PidLidConversationActionMoveFolderEid'),(1232,0,258,'00062008-0000-0000-c000-000000000046',37030,34247,NULL,'ConvActionMoveStoreEid','PidLidConversationActionMoveStoreEid'),(1233,0,3,'00062008-0000-0000-c000-000000000046',37031,34251,NULL,'ConvActionVersion','PidLidConversationActionVersion'),(1234,0,3,'00062008-0000-0000-c000-000000000046',37032,34249,NULL,'ConvExLegacyProcessedRand','PidLidConversationProcessed'),(1235,0,3,'00062008-0000-0000-c000-000000000046',37033,34130,NULL,'CurrentVersion','PidLidCurrentVersion'),(1236,0,31,'00062008-0000-0000-c000-000000000046',37034,34132,NULL,'CurrentVersionName','PidLidCurrentVersionName'),(1237,0,3,'00062008-0000-0000-c000-000000000046',37035,4096,NULL,'NULL','PidLidDayOfMonth'),(1238,0,31,'00062008-0000-0000-c000-000000000046',37036,34096,NULL,'Request','PidLidFlagRequest'),(1239,0,3,'00062008-0000-0000-c000-000000000046',37037,34240,NULL,'FlagStringEnum','PidLidFlagString'),(1240,0,3,'00062008-0000-0000-c000-000000000046',37038,4097,NULL,'http://schemas.microsoft.com/mapi/dayofweekmask','PidLidICalendarDayOfWeekMask'),(1241,0,31,'00062008-0000-0000-c000-000000000046',37039,34225,NULL,'NULL','PidLidInfoPathFormName'),(1242,0,31,'00062008-0000-0000-c000-000000000046',37040,34176,NULL,'InetAcctName','PidLidInternetAccountName'),(1243,0,31,'00062008-0000-0000-c000-000000000046',37041,34177,NULL,'InetAcctStamp','PidLidInternetAccountStamp'),(1244,0,3,'00062008-0000-0000-c000-000000000046',37042,4102,NULL,'NULL','PidLidMonthOfYear'),(1245,0,11,'00062008-0000-0000-c000-000000000046',37043,4107,NULL,'http://schemas.microsoft.com/mapi/fnoenddate','PidLidNoEndDateFlag'),(1246,0,31,'00062008-0000-0000-c000-000000000046',37044,34104,NULL,'NonSendableBCC','PidLidNonSendableBcc'),(1247,0,31,'00062008-0000-0000-c000-000000000046',37045,34103,NULL,'NonSendableCC','PidLidNonSendableCc'),(1248,0,31,'00062008-0000-0000-c000-000000000046',37046,34102,NULL,'NonSendableTo','PidLidNonSendableTo'),(1249,0,4099,'00062008-0000-0000-c000-000000000046',37047,34117,NULL,'NonSendBccTrackStatus','PidLidNonSendBccTrackStatus'),(1250,0,4099,'00062008-0000-0000-c000-000000000046',37048,34116,NULL,'NonSendCcTrackStatus','PidLidNonSendCcTrackStatus'),(1251,0,4099,'00062008-0000-0000-c000-000000000046',37049,34115,NULL,'NonSendToTrackStatus','PidLidNonSendToTrackStatus'),(1252,0,3,'00062008-0000-0000-c000-000000000046',37050,4101,NULL,'NULL','PidLidOccurrences'),(1253,0,3,'00062008-0000-0000-c000-000000000046',37051,34272,NULL,'PendingStateforTMDocument','PidLidPendingStateForSiteMailboxDocument'),(1254,0,11,'00062008-0000-0000-c000-000000000046',37052,34054,NULL,'Private','PidLidPrivate'),(1255,0,11,'00062008-0000-0000-c000-000000000046',37053,32837,NULL,'PromptSendUpdate','PidLidPromptSendUpdate'),(1256,0,3,'00062008-0000-0000-c000-000000000046',37054,4109,NULL,'NULL','PidLidRecurrenceDuration'),(1257,0,258,'00062008-0000-0000-c000-000000000046',37055,34237,NULL,'ReferenceEID','PidLidReferenceEntryId'),(1258,0,3,'00062008-0000-0000-c000-000000000046',37056,34049,NULL,'ReminderDelta, http://schemas.microsoft.com/mapi/reminderdelta','PidLidReminderDelta'),(1259,0,31,'00062008-0000-0000-c000-000000000046',37057,34079,NULL,'ReminderFileParam','PidLidReminderFileParameter'),(1260,0,11,'00062008-0000-0000-c000-000000000046',37058,34076,NULL,'ReminderOverride','PidLidReminderOverride'),(1261,0,11,'00062008-0000-0000-c000-000000000046',37059,34078,NULL,'ReminderPlaySound','PidLidReminderPlaySound'),(1262,0,11,'00062008-0000-0000-c000-000000000046',37060,34051,NULL,'ReminderSet','PidLidReminderSet'),(1263,0,64,'00062008-0000-0000-c000-000000000046',37061,34144,NULL,'ReminderNextTime','PidLidReminderSignalTime'),(1264,0,64,'00062008-0000-0000-c000-000000000046',37062,34050,NULL,'ReminderTime','PidLidReminderTime'),(1265,0,64,'00062008-0000-0000-c000-000000000046',37063,34053,NULL,'ReminderTimeDate','PidLidReminderTimeDate'),(1266,0,64,'00062008-0000-0000-c000-000000000046',37064,34052,NULL,'ReminderTimeTime','PidLidReminderTimeTime'),(1267,0,3,'00062008-0000-0000-c000-000000000046',37065,34077,NULL,'ReminderType, http://schemas.microsoft.com/mapi/remindertype','PidLidReminderType'),(1268,0,3,'00062008-0000-0000-c000-000000000046',37066,34065,NULL,'RemoteStatus','PidLidRemoteStatus'),(1269,0,3,'00062008-0000-0000-c000-000000000046',37067,34064,NULL,'SideEffects','PidLidSideEffects'),(1270,0,11,'00062008-0000-0000-c000-000000000046',37068,34068,NULL,'SmartNoAttach','PidLidSmartNoAttach'),(1271,0,258,'00062008-0000-0000-c000-000000000046',37069,34204,NULL,'SpamOriginalFolder','PidLidSpamOriginalFolder'),(1272,0,258,'00062008-0000-0000-c000-000000000046',37070,34073,NULL,'TaskGlobalObjId','PidLidTaskGlobalId'),(1273,0,3,'00062008-0000-0000-c000-000000000046',37071,34072,NULL,'TaskMode','PidLidTaskMode'),(1274,0,64,'00062008-0000-0000-c000-000000000046',37072,34208,NULL,'ToDoOrdinalDate','PidLidToDoOrdinalDate'),(1275,0,31,'00062008-0000-0000-c000-000000000046',37073,34209,NULL,'ToDoSubOrdinal','PidLidToDoSubOrdinal'),(1276,0,31,'00062008-0000-0000-c000-000000000046',37074,34212,NULL,'ToDoTitle','PidLidToDoTitle'),(1277,0,11,'00062008-0000-0000-c000-000000000046',37075,34178,NULL,'UseTNEF','PidLidUseTnef'),(1278,0,64,'00062008-0000-0000-c000-000000000046',37076,34239,NULL,'ValidFlagStringProof','PidLidValidFlagStringProof'),(1279,0,31,'00062008-0000-0000-c000-000000000046',37077,34084,NULL,'VerbResponse','PidLidVerbResponse'),(1280,0,258,'00062008-0000-0000-c000-000000000046',37078,34080,NULL,'VerbStream','PidLidVerbStream'),(1281,0,11,'0006200a-0000-0000-c000-000000000046',37079,34577,NULL,'LogDocPosted','PidLidLogDocumentPosted'),(1282,0,11,'0006200a-0000-0000-c000-000000000046',37080,34574,NULL,'LogDocPrinted','PidLidLogDocumentPrinted'),(1283,0,11,'0006200a-0000-0000-c000-000000000046',37081,34576,NULL,'LogDocRouted','PidLidLogDocumentRouted'),(1284,0,11,'0006200a-0000-0000-c000-000000000046',37082,34575,NULL,'LogDocSaved','PidLidLogDocumentSaved'),(1285,0,3,'0006200a-0000-0000-c000-000000000046',37083,34567,NULL,'LogDuration','PidLidLogDuration'),(1286,0,64,'0006200a-0000-0000-c000-000000000046',37084,34568,NULL,'LogEnd','PidLidLogEnd'),(1287,0,3,'0006200a-0000-0000-c000-000000000046',37085,34572,NULL,'LogFlags','PidLidLogFlags'),(1288,0,64,'0006200a-0000-0000-c000-000000000046',37086,34566,NULL,'LogStart','PidLidLogStart'),(1289,0,31,'0006200a-0000-0000-c000-000000000046',37087,34560,NULL,'LogType','PidLidLogType'),(1290,0,31,'0006200a-0000-0000-c000-000000000046',37088,34578,NULL,'LogTypeDesc','PidLidLogTypeDesc'),(1291,0,31,'6ed8da90-450b-101b-98da-00aa003f1305',37089,36,NULL,'ApptMessageClass','PidLidAppointmentMessageClass'),(1292,0,64,'6ed8da90-450b-101b-98da-00aa003f1305',37090,1,NULL,'LID_ATTENDEE_CRITICAL_CHANGE','PidLidAttendeeCriticalChange'),(1293,0,3,'6ed8da90-450b-101b-98da-00aa003f1305',37091,28,NULL,'LID_CALENDAR_TYPE','PidLidCalendarType'),(1294,0,258,'6ed8da90-450b-101b-98da-00aa003f1305',37092,35,NULL,'CleanGlobalObjId','PidLidCleanGlobalObjectId'),(1295,0,2,'6ed8da90-450b-101b-98da-00aa003f1305',37093,17,NULL,'LID_DAY_INTERVAL','PidLidDayInterval'),(1296,0,11,'6ed8da90-450b-101b-98da-00aa003f1305',37094,9,NULL,'LID_DELEGATE_MAIL','PidLidDelegateMail'),(1297,0,3,'6ed8da90-450b-101b-98da-00aa003f1305',37095,15,NULL,'LID_END_RECUR_DATE','PidLidEndRecurrenceDate'),(1298,0,3,'6ed8da90-450b-101b-98da-00aa003f1305',37096,16,NULL,'LID_END_RECUR_TIME','PidLidEndRecurrenceTime'),(1299,0,258,'6ed8da90-450b-101b-98da-00aa003f1305',37097,3,NULL,'LID_GLOBAL_OBJID','PidLidGlobalObjectId'),(1300,0,11,'6ed8da90-450b-101b-98da-00aa003f1305',37098,10,NULL,'LID_IS_EXCEPTION','PidLidIsException'),(1301,0,11,'6ed8da90-450b-101b-98da-00aa003f1305',37099,5,NULL,'LID_IS_RECURRING','PidLidIsRecurring'),(1302,0,11,'6ed8da90-450b-101b-98da-00aa003f1305',37100,4,NULL,'LID_IS_SILENT','PidLidIsSilent'),(1303,0,3,'6ed8da90-450b-101b-98da-00aa003f1305',37101,38,NULL,'MeetingType','PidLidMeetingType'),(1304,0,2,'6ed8da90-450b-101b-98da-00aa003f1305',37102,19,NULL,'LID_MONTH_INTERVAL','PidLidMonthInterval'),(1305,0,3,'6ed8da90-450b-101b-98da-00aa003f1305',37103,23,NULL,'LID_MOY_MASK','PidLidMonthOfYearMask'),(1306,0,31,'6ed8da90-450b-101b-98da-00aa003f1305',37104,40,NULL,'OldLocation','PidLidOldLocation'),(1307,0,2,'6ed8da90-450b-101b-98da-00aa003f1305',37105,24,NULL,'LID_RECUR_TYPE','PidLidOldRecurrenceType'),(1308,0,64,'6ed8da90-450b-101b-98da-00aa003f1305',37106,42,NULL,'OldWhenEndWhole','PidLidOldWhenEndWhole'),(1309,0,64,'6ed8da90-450b-101b-98da-00aa003f1305',37107,41,NULL,'OldWhenStartWhole','PidLidOldWhenStartWhole'),(1310,0,31,'6ed8da90-450b-101b-98da-00aa003f1305',37108,7,NULL,'LID_OPTIONAL_ATTENDEES','PidLidOptionalAttendees'),(1311,0,64,'6ed8da90-450b-101b-98da-00aa003f1305',37109,26,NULL,'LID_OWNER_CRITICAL_CHANGE','PidLidOwnerCriticalChange'),(1312,0,31,'6ed8da90-450b-101b-98da-00aa003f1305',37110,6,NULL,'LID_REQUIRED_ATTENDEES','PidLidRequiredAttendees'),(1313,0,31,'6ed8da90-450b-101b-98da-00aa003f1305',37111,8,NULL,'LID_RESOURCE_ATTENDEES','PidLidResourceAttendees'),(1314,0,3,'6ed8da90-450b-101b-98da-00aa003f1305',37112,13,NULL,'LID_START_RECUR_DATE','PidLidStartRecurrenceDate'),(1315,0,3,'6ed8da90-450b-101b-98da-00aa003f1305',37113,14,NULL,'LID_START_RECUR_TIME','PidLidStartRecurrenceTime'),(1316,0,3,'6ed8da90-450b-101b-98da-00aa003f1305',37114,12,NULL,'LID_TIME_ZONE','PidLidTimeZone'),(1317,0,2,'6ed8da90-450b-101b-98da-00aa003f1305',37115,18,NULL,'LID_WEEK_INTERVAL','PidLidWeekInterval'),(1318,0,31,'6ed8da90-450b-101b-98da-00aa003f1305',37116,2,NULL,'LID_WHERE','PidLidWhere'),(1319,0,2,'6ed8da90-450b-101b-98da-00aa003f1305',37117,20,NULL,'LID_YEAR_INTERVAL','PidLidYearInterval'),(1320,0,3,'0006200e-0000-0000-c000-000000000046',37118,35584,NULL,'NoteColor','PidLidNoteColor'),(1321,0,3,'0006200e-0000-0000-c000-000000000046',37119,35587,NULL,'NoteHeight','PidLidNoteHeight'),(1322,0,3,'0006200e-0000-0000-c000-000000000046',37120,35586,NULL,'NoteWidth','PidLidNoteWidth'),(1323,0,3,'0006200e-0000-0000-c000-000000000046',37121,35588,NULL,'NoteX','PidLidNoteX'),(1324,0,3,'0006200e-0000-0000-c000-000000000046',37122,35589,NULL,'NoteY','PidLidNoteY'),(1325,0,31,'00062041-0000-0000-c000-000000000046',37123,35076,NULL,'PostRssChannel','PidLidPostRssChannel'),(1326,0,31,'00062041-0000-0000-c000-000000000046',37124,35072,NULL,'PostRssChannelLink','PidLidPostRssChannelLink'),(1327,0,31,'00062041-0000-0000-c000-000000000046',37125,35075,NULL,'PostRssItemGuid','PidLidPostRssItemGuid'),(1328,0,3,'00062041-0000-0000-c000-000000000046',37126,35074,NULL,'PostRssItemHash','PidLidPostRssItemHash'),(1329,0,31,'00062041-0000-0000-c000-000000000046',37127,35073,NULL,'PostRssItemLink','PidLidPostRssItemLink'),(1330,0,31,'00062041-0000-0000-c000-000000000046',37128,35077,NULL,'PostRssItemXml','PidLidPostRssItemXml'),(1331,0,31,'00062041-0000-0000-c000-000000000046',37129,35078,NULL,'PostRssSubscription','PidLidPostRssSubscription'),(1332,0,3,'00062040-0000-0000-c000-000000000046',37130,35353,NULL,'SharingAnonymity','PidLidSharingAnonymity'),(1333,0,258,'00062040-0000-0000-c000-000000000046',37131,35373,NULL,'SharingBindingEid','PidLidSharingBindingEntryId'),(1334,0,31,'00062040-0000-0000-c000-000000000046',37132,35409,NULL,'SharingBrowseUrl','PidLidSharingBrowseUrl'),(1335,0,3,'00062040-0000-0000-c000-000000000046',37133,35351,NULL,'SharingCaps','PidLidSharingCapabilities'),(1336,0,31,'00062040-0000-0000-c000-000000000046',37134,35364,NULL,'SharingConfigUrl','PidLidSharingConfigurationUrl'),(1337,0,64,'00062040-0000-0000-c000-000000000046',37135,35397,NULL,'SharingDataRangeEnd','PidLidSharingDataRangeEnd'),(1338,0,64,'00062040-0000-0000-c000-000000000046',37136,35396,NULL,'SharingDataRangeStart','PidLidSharingDataRangeStart'),(1339,0,3,'00062040-0000-0000-c000-000000000046',37137,35371,NULL,'SharingDetail','PidLidSharingDetail'),(1340,0,31,'00062040-0000-0000-c000-000000000046',37138,35361,NULL,'SharingExtXml','PidLidSharingExtensionXml'),(1341,0,258,'00062040-0000-0000-c000-000000000046',37139,35347,NULL,'SharingFilter','PidLidSharingFilter'),(1342,0,3,'00062040-0000-0000-c000-000000000046',37140,35338,NULL,'SharingFlags','PidLidSharingFlags'),(1343,0,3,'00062040-0000-0000-c000-000000000046',37141,35352,NULL,'SharingFlavor','PidLidSharingFlavor'),(1344,0,258,'00062040-0000-0000-c000-000000000046',37142,35349,NULL,'SharingFolderEid','PidLidSharingFolderEntryId'),(1345,0,258,'00062040-0000-0000-c000-000000000046',37143,35374,NULL,'SharingIndexEid','PidLidSharingIndexEntryId'),(1346,0,258,'00062040-0000-0000-c000-000000000046',37144,35337,NULL,'SharingInitiatorEid','PidLidSharingInitiatorEntryId'),(1347,0,31,'00062040-0000-0000-c000-000000000046',37145,35335,NULL,'SharingInitiatorName','PidLidSharingInitiatorName'),(1348,0,31,'00062040-0000-0000-c000-000000000046',37146,35336,NULL,'SharingInitiatorSmtp','PidLidSharingInitiatorSmtp'),(1349,0,258,'00062040-0000-0000-c000-000000000046',37147,35356,NULL,'SharingInstanceGuid','PidLidSharingInstanceGuid'),(1350,0,64,'00062040-0000-0000-c000-000000000046',37148,35413,NULL,'SharingLastAutoSync','PidLidSharingLastAutoSyncTime'),(1351,0,64,'00062040-0000-0000-c000-000000000046',37149,35359,NULL,'SharingLastSync','PidLidSharingLastSyncTime'),(1352,0,31,'00062040-0000-0000-c000-000000000046',37150,35405,NULL,'SharingLocalComment','PidLidSharingLocalComment'),(1353,0,64,'00062040-0000-0000-c000-000000000046',37151,35363,NULL,'SharingLocalLastMod','PidLidSharingLocalLastModificationTime'),(1354,0,31,'00062040-0000-0000-c000-000000000046',37152,35343,NULL,'SharingLocalName','PidLidSharingLocalName'),(1355,0,31,'00062040-0000-0000-c000-000000000046',37153,35342,NULL,'SharingLocalPath','PidLidSharingLocalPath'),(1356,0,31,'00062040-0000-0000-c000-000000000046',37154,35401,NULL,'SharingLocalStoreUid','PidLidSharingLocalStoreUid'),(1357,0,31,'00062040-0000-0000-c000-000000000046',37155,35348,NULL,'SharingLocalType','PidLidSharingLocalType'),(1358,0,31,'00062040-0000-0000-c000-000000000046',37156,35344,NULL,'SharingLocalUid','PidLidSharingLocalUid'),(1359,0,258,'00062040-0000-0000-c000-000000000046',37157,35369,NULL,'SharingOriginalMessageEid','PidLidSharingOriginalMessageEntryId'),(1360,0,258,'00062040-0000-0000-c000-000000000046',37158,35420,NULL,'SharingParentBindingEid','PidLidSharingParentBindingEntryId'),(1361,0,31,'00062040-0000-0000-c000-000000000046',37159,35358,NULL,'SharingParticipants','PidLidSharingParticipants'),(1362,0,3,'00062040-0000-0000-c000-000000000046',37160,35355,NULL,'SharingPermissions','PidLidSharingPermissions'),(1363,0,31,'00062040-0000-0000-c000-000000000046',37161,35339,NULL,'SharingProviderExtension','PidLidSharingProviderExtension'),(1364,0,258,'00062040-0000-0000-c000-000000000046',37162,35329,NULL,'SharingProviderGuid','PidLidSharingProviderGuid'),(1365,0,31,'00062040-0000-0000-c000-000000000046',37163,35330,NULL,'SharingProviderName','PidLidSharingProviderName'),(1366,0,31,'00062040-0000-0000-c000-000000000046',37164,35331,NULL,'SharingProviderUrl','PidLidSharingProviderUrl'),(1367,0,3,'00062040-0000-0000-c000-000000000046',37165,35399,NULL,'SharingRangeEnd','PidLidSharingRangeEnd'),(1368,0,3,'00062040-0000-0000-c000-000000000046',37166,35398,NULL,'SharingRangeStart','PidLidSharingRangeStart'),(1369,0,3,'00062040-0000-0000-c000-000000000046',37167,35354,NULL,'SharingReciprocation','PidLidSharingReciprocation'),(1370,0,3,'00062040-0000-0000-c000-000000000046',37168,35403,NULL,'SharingRemoteByteSize','PidLidSharingRemoteByteSize'),(1371,0,31,'00062040-0000-0000-c000-000000000046',37169,35375,NULL,'SharingRemoteComment','PidLidSharingRemoteComment'),(1372,0,3,'00062040-0000-0000-c000-000000000046',37170,35404,NULL,'SharingRemoteCrc','PidLidSharingRemoteCrc'),(1373,0,64,'00062040-0000-0000-c000-000000000046',37171,35362,NULL,'SharingRemoteLastMod','PidLidSharingRemoteLastModificationTime'),(1374,0,3,'00062040-0000-0000-c000-000000000046',37172,35407,NULL,'SharingRemoteMsgCount','PidLidSharingRemoteMessageCount'),(1375,0,31,'00062040-0000-0000-c000-000000000046',37173,35333,NULL,'SharingRemoteName','PidLidSharingRemoteName'),(1376,0,31,'00062040-0000-0000-c000-000000000046',37174,35341,NULL,'SharingRemotePass','PidLidSharingRemotePass'),(1377,0,31,'00062040-0000-0000-c000-000000000046',37175,35332,NULL,'SharingRemotePath','PidLidSharingRemotePath'),(1378,0,31,'00062040-0000-0000-c000-000000000046',37176,35400,NULL,'SharingRemoteStoreUid','PidLidSharingRemoteStoreUid'),(1379,0,31,'00062040-0000-0000-c000-000000000046',37177,35357,NULL,'SharingRemoteType','PidLidSharingRemoteType'),(1380,0,31,'00062040-0000-0000-c000-000000000046',37178,35334,NULL,'SharingRemoteUid','PidLidSharingRemoteUid'),(1381,0,31,'00062040-0000-0000-c000-000000000046',37179,35340,NULL,'SharingRemoteUser','PidLidSharingRemoteUser'),(1382,0,31,'00062040-0000-0000-c000-000000000046',37180,35419,NULL,'SharingRemoteVersion','PidLidSharingRemoteVersion'),(1383,0,64,'00062040-0000-0000-c000-000000000046',37181,35368,NULL,'SharingResponseTime','PidLidSharingResponseTime'),(1384,0,3,'00062040-0000-0000-c000-000000000046',37182,35367,NULL,'SharingResponseType','PidLidSharingResponseType'),(1385,0,3,'00062040-0000-0000-c000-000000000046',37183,35406,NULL,'SharingRoamLog','PidLidSharingRoamLog'),(1386,0,64,'00062040-0000-0000-c000-000000000046',37184,35365,NULL,'SharingStart','PidLidSharingStart'),(1387,0,3,'00062040-0000-0000-c000-000000000046',37185,35328,NULL,'SharingStatus','PidLidSharingStatus'),(1388,0,64,'00062040-0000-0000-c000-000000000046',37186,35366,NULL,'SharingStop','PidLidSharingStop'),(1389,0,3,'00062040-0000-0000-c000-000000000046',37187,35424,NULL,'SharingSyncFlags','PidLidSharingSyncFlags'),(1390,0,3,'00062040-0000-0000-c000-000000000046',37188,35370,NULL,'SharingSyncInterval','PidLidSharingSyncInterval'),(1391,0,3,'00062040-0000-0000-c000-000000000046',37189,35372,NULL,'SharingTimeToLive','PidLidSharingTimeToLive'),(1392,0,3,'00062040-0000-0000-c000-000000000046',37190,35414,NULL,'SharingTimeToLiveAuto','PidLidSharingTimeToLiveAuto'),(1393,0,3,'00062040-0000-0000-c000-000000000046',37191,35394,NULL,'SharingWorkingHoursDays','PidLidSharingWorkingHoursDays'),(1394,0,64,'00062040-0000-0000-c000-000000000046',37192,35393,NULL,'SharingWorkingHoursEnd','PidLidSharingWorkingHoursEnd'),(1395,0,64,'00062040-0000-0000-c000-000000000046',37193,35392,NULL,'SharingWorkingHoursStart','PidLidSharingWorkingHoursStart'),(1396,0,258,'00062040-0000-0000-c000-000000000046',37194,35395,NULL,'SharingWorkingHoursTZ','PidLidSharingWorkingHoursTimeZone'),(1397,0,5,'00062003-0000-0000-c000-000000000046',37195,33026,NULL,'PercentComplete','PidLidPercentComplete'),(1398,0,3,'00062003-0000-0000-c000-000000000046',37196,33066,NULL,'TaskDelegValue','PidLidTaskAcceptanceState'),(1399,0,11,'00062003-0000-0000-c000-000000000046',37197,33032,NULL,'TaskAccepted','PidLidTaskAccepted'),(1400,0,3,'00062003-0000-0000-c000-000000000046',37198,33040,NULL,'TaskActualEffort','PidLidTaskActualEffort'),(1401,0,31,'00062003-0000-0000-c000-000000000046',37199,33057,NULL,'TaskDelegator','PidLidTaskAssigner'),(1402,0,258,'00062003-0000-0000-c000-000000000046',37200,33047,NULL,'TaskMyDelegators','PidLidTaskAssigners'),(1403,0,11,'00062003-0000-0000-c000-000000000046',37201,33052,NULL,'TaskComplete','PidLidTaskComplete'),(1404,0,3,'00062003-0000-0000-c000-000000000046',37202,33081,NULL,'TaskCustomFlags','PidLidTaskCustomFlags'),(1405,0,64,'00062003-0000-0000-c000-000000000046',37203,33039,NULL,'TaskDateCompleted','PidLidTaskDateCompleted'),(1406,0,11,'00062003-0000-0000-c000-000000000046',37204,33033,NULL,'TaskDeadOccur','PidLidTaskDeadOccurrence'),(1407,0,64,'00062003-0000-0000-c000-000000000046',37205,33029,NULL,'TaskDueDate','PidLidTaskDueDate'),(1408,0,3,'00062003-0000-0000-c000-000000000046',37206,33041,NULL,'TaskEstimatedEffort','PidLidTaskEstimatedEffort'),(1409,0,11,'00062003-0000-0000-c000-000000000046',37207,33054,NULL,'TaskFCreator','PidLidTaskFCreator'),(1410,0,11,'00062003-0000-0000-c000-000000000046',37208,33068,NULL,'TaskFFixOffline','PidLidTaskFFixOffline'),(1411,0,11,'00062003-0000-0000-c000-000000000046',37209,33062,NULL,'TaskFRecur','PidLidTaskFRecurring'),(1412,0,3,'00062003-0000-0000-c000-000000000046',37210,33050,NULL,'TaskHistory','PidLidTaskHistory'),(1413,0,31,'00062003-0000-0000-c000-000000000046',37211,33061,NULL,'TaskLastDelegate','PidLidTaskLastDelegate'),(1414,0,64,'00062003-0000-0000-c000-000000000046',37212,33045,NULL,'TaskLastUpdate','PidLidTaskLastUpdate'),(1415,0,31,'00062003-0000-0000-c000-000000000046',37213,33058,NULL,'TaskLastUser','PidLidTaskLastUser'),(1416,0,3,'00062003-0000-0000-c000-000000000046',37214,33056,NULL,'TaskMultRecips','PidLidTaskMultipleRecipients'),(1417,0,11,'00062003-0000-0000-c000-000000000046',37215,33060,NULL,'TaskNoCompute','PidLidTaskNoCompute'),(1418,0,3,'00062003-0000-0000-c000-000000000046',37216,33059,NULL,'TaskOrdinal','PidLidTaskOrdinal'),(1419,0,31,'00062003-0000-0000-c000-000000000046',37217,33055,NULL,'TaskOwner','PidLidTaskOwner'),(1420,0,3,'00062003-0000-0000-c000-000000000046',37218,33065,NULL,'TaskOwnership','PidLidTaskOwnership'),(1421,0,258,'00062003-0000-0000-c000-000000000046',37219,33046,NULL,'TaskRecur','PidLidTaskRecurrence'),(1422,0,11,'00062003-0000-0000-c000-000000000046',37220,33031,NULL,'TaskResetReminder','PidLidTaskResetReminder'),(1423,0,31,'00062003-0000-0000-c000-000000000046',37221,33063,NULL,'TaskRole','PidLidTaskRole'),(1424,0,64,'00062003-0000-0000-c000-000000000046',37222,33028,NULL,'TaskStartDate','PidLidTaskStartDate'),(1425,0,3,'00062003-0000-0000-c000-000000000046',37223,33043,NULL,'TaskState','PidLidTaskState'),(1426,0,3,'00062003-0000-0000-c000-000000000046',37224,33025,NULL,'TaskStatus','PidLidTaskStatus'),(1427,0,11,'00062003-0000-0000-c000-000000000046',37225,33049,NULL,'TaskSOC','PidLidTaskStatusOnComplete'),(1428,0,11,'00062003-0000-0000-c000-000000000046',37226,33051,NULL,'TaskUpdates','PidLidTaskUpdates'),(1429,0,3,'00062003-0000-0000-c000-000000000046',37227,33042,NULL,'TaskVersion','PidLidTaskVersion'),(1430,0,11,'00062003-0000-0000-c000-000000000046',37228,33027,NULL,'TeamTask','PidLidTeamTask'),(1431,1,31,'4442858e-a9e3-4e80-b900-317a210cc15b',37229,0,'UMAudioNotes',NULL,'PidNameAudioNotes'),(1432,1,258,'4442858e-a9e3-4e80-b900-317a210cc15b',37230,0,'AsrData',NULL,'PidNameAutomaticSpeechRecognitionData'),(1433,1,31,'23239608-685d-4732-9c55-4c95cb4e8e33',37231,0,'XmlExtractedAddresses',NULL,'PidNameExtractedAddresses'),(1434,1,31,'23239608-685d-4732-9c55-4c95cb4e8e33',37232,0,'XmlExtractedContacts',NULL,'PidNameExtractedContacts'),(1435,1,31,'23239608-685d-4732-9c55-4c95cb4e8e33',37233,0,'XmlExtractedEmails',NULL,'PidNameExtractedEmails'),(1436,1,31,'23239608-685d-4732-9c55-4c95cb4e8e33',37234,0,'XmlExtractedMeetings',NULL,'PidNameExtractedMeetings'),(1437,1,31,'23239608-685d-4732-9c55-4c95cb4e8e33',37235,0,'XmlExtractedPhones',NULL,'PidNameExtractedPhones'),(1438,1,31,'23239608-685d-4732-9c55-4c95cb4e8e33',37236,0,'XmlExtractedTasks',NULL,'PidNameExtractedTasks'),(1439,1,31,'23239608-685d-4732-9c55-4c95cb4e8e33',37237,0,'XmlExtractedUrls',NULL,'PidNameExtractedUrls'),(1440,1,31,'00020386-0000-0000-c000-000000000046',37238,0,'Accept-Language',NULL,'PidNameAcceptLanguage'),(1441,1,31,'00020386-0000-0000-c000-000000000046',37239,0,'Content-Base',NULL,'PidNameContentBase'),(1442,1,31,'00020386-0000-0000-c000-000000000046',37240,0,'Content-Class',NULL,'PidNameContentClass'),(1443,1,31,'00020386-0000-0000-c000-000000000046',37241,0,'Content-Type',NULL,'PidNameContentType'),(1444,1,31,'00020386-0000-0000-c000-000000000046',37242,0,'Xref',NULL,'PidNameCrossReference'),(1445,1,31,'00020386-0000-0000-c000-000000000046',37243,0,'From',NULL,'PidNameFrom'),(1446,1,31,'00020386-0000-0000-c000-000000000046',37244,0,'Subject',NULL,'PidNameInternetSubject'),(1447,1,31,'00020386-0000-0000-c000-000000000046',37245,0,'X-CallID',NULL,'PidNameXCallId'),(1448,1,2,'00020386-0000-0000-c000-000000000046',37246,0,'X-FaxNumberOfPages',NULL,'PidNameXFaxNumberOfPages'),(1449,1,11,'00020386-0000-0000-c000-000000000046',37247,0,'X-RequireProtectedPlayOnPhone',NULL,'PidNameXRequireProtectedPlayOnPhone'),(1450,1,31,'00020386-0000-0000-c000-000000000046',37248,0,'X-CallingTelephoneNumber',NULL,'PidNameXSenderTelephoneNumber'),(1451,1,31,'00020386-0000-0000-c000-000000000046',37249,0,'X-Sharing-Browse-Url',NULL,'PidNameXSharingBrowseUrl'),(1452,1,31,'00020386-0000-0000-c000-000000000046',37250,0,'X-Sharing-Capabilities',NULL,'PidNameXSharingCapabilities'),(1453,1,31,'00020386-0000-0000-c000-000000000046',37251,0,'X-Sharing-Config-Url',NULL,'PidNameXSharingConfigUrl'),(1454,1,31,'00020386-0000-0000-c000-000000000046',37252,0,'X-Sharing-Exended-Caps',NULL,'PidNameXSharingExendedCaps'),(1455,1,31,'00020386-0000-0000-c000-000000000046',37253,0,'X-Sharing-Flavor',NULL,'PidNameXSharingFlavor'),(1456,1,31,'00020386-0000-0000-c000-000000000046',37254,0,'X-Sharing-Instance-Guid',NULL,'PidNameXSharingInstanceGuid'),(1457,1,31,'00020386-0000-0000-c000-000000000046',37255,0,'X-Sharing-Local-Type',NULL,'PidNameXSharingLocalType'),(1458,1,31,'00020386-0000-0000-c000-000000000046',37256,0,'X-Sharing-Provider-Guid',NULL,'PidNameXSharingProviderGuid'),(1459,1,31,'00020386-0000-0000-c000-000000000046',37257,0,'X-Sharing-Provider-Name',NULL,'PidNameXSharingProviderName'),(1460,1,31,'00020386-0000-0000-c000-000000000046',37258,0,'X-Sharing-Provider-Url',NULL,'PidNameXSharingProviderUrl'),(1461,1,31,'00020386-0000-0000-c000-000000000046',37259,0,'X-Sharing-Remote-Name',NULL,'PidNameXSharingRemoteName'),(1462,1,31,'00020386-0000-0000-c000-000000000046',37260,0,'X-Sharing-Remote-Path',NULL,'PidNameXSharingRemotePath'),(1463,1,31,'00020386-0000-0000-c000-000000000046',37261,0,'X-Sharing-Remote-Store-Uid',NULL,'PidNameXSharingRemoteStoreUid'),(1464,1,31,'00020386-0000-0000-c000-000000000046',37262,0,'X-Sharing-Remote-Type',NULL,'PidNameXSharingRemoteType'),(1465,1,31,'00020386-0000-0000-c000-000000000046',37263,0,'X-Sharing-Remote-Uid',NULL,'PidNameXSharingRemoteUid'),(1466,1,31,'00020386-0000-0000-c000-000000000046',37264,0,'X-AttachmentOrder',NULL,'PidNameXVoiceMessageAttachmentOrder'),(1467,1,2,'00020386-0000-0000-c000-000000000046',37265,0,'X-VoiceMessageDuration',NULL,'PidNameXVoiceMessageDuration'),(1468,1,31,'00020386-0000-0000-c000-000000000046',37266,0,'X-VoiceMessageSenderName',NULL,'PidNameXVoiceMessageSenderName'),(1469,0,4127,'00020329-0000-0000-c000-000000000046',37267,36864,NULL,'Categories','PidLidCategories'),(1470,1,31,'00020329-0000-0000-c000-000000000046',37268,0,'AppName',NULL,'PidNameApplicationName'),(1471,1,31,'00020329-0000-0000-c000-000000000046',37269,0,'Author',NULL,'PidNameAuthor'),(1472,1,3,'00020329-0000-0000-c000-000000000046',37270,0,'ByteCount',NULL,'PidNameByteCount'),(1473,1,3,'00020329-0000-0000-c000-000000000046',37271,0,'urn:schemas:calendar:attendeerole',NULL,'PidNameCalendarAttendeeRole'),(1474,1,31,'00020329-0000-0000-c000-000000000046',37272,0,'urn:schemas:calendar:busystatus',NULL,'PidNameCalendarBusystatus'),(1475,1,31,'00020329-0000-0000-c000-000000000046',37273,0,'urn:schemas:calendar:contact',NULL,'PidNameCalendarContact'),(1476,1,31,'00020329-0000-0000-c000-000000000046',37274,0,'urn:schemas:calendar:contacturl',NULL,'PidNameCalendarContactUrl'),(1477,1,64,'00020329-0000-0000-c000-000000000046',37275,0,'urn:schemas:calendar:created',NULL,'PidNameCalendarCreated'),(1478,1,31,'00020329-0000-0000-c000-000000000046',37276,0,'urn:schemas:calendar:descriptionurl',NULL,'PidNameCalendarDescriptionUrl'),(1479,1,3,'00020329-0000-0000-c000-000000000046',37277,0,'urn:schemas:calendar:duration',NULL,'PidNameCalendarDuration'),(1480,1,4160,'00020329-0000-0000-c000-000000000046',37278,0,'urn:schemas:calendar:exdate',NULL,'PidNameCalendarExceptionDate'),(1481,1,4127,'00020329-0000-0000-c000-000000000046',37279,0,'urn:schemas:calendar:exrule',NULL,'PidNameCalendarExceptionRule'),(1482,1,5,'00020329-0000-0000-c000-000000000046',37280,0,'urn:schemas:calendar:geolatitude',NULL,'PidNameCalendarGeoLatitude'),(1483,1,5,'00020329-0000-0000-c000-000000000046',37281,0,'urn:schemas:calendar:geolongitude',NULL,'PidNameCalendarGeoLongitude'),(1484,1,3,'00020329-0000-0000-c000-000000000046',37282,0,'urn:schemas:calendar:instancetype',NULL,'PidNameCalendarInstanceType'),(1485,1,11,'00020329-0000-0000-c000-000000000046',37283,0,'urn:schemas:calendar:isorganizer',NULL,'PidNameCalendarIsOrganizer'),(1486,1,64,'00020329-0000-0000-c000-000000000046',37284,0,'urn:schemas:calendar:lastmodified',NULL,'PidNameCalendarLastModified'),(1487,1,31,'00020329-0000-0000-c000-000000000046',37285,0,'urn:schemas:calendar:locationurl',NULL,'PidNameCalendarLocationUrl'),(1488,1,31,'00020329-0000-0000-c000-000000000046',37286,0,'urn:schemas:calendar:meetingstatus',NULL,'PidNameCalendarMeetingStatus'),(1489,1,31,'00020329-0000-0000-c000-000000000046',37287,0,'urn:schemas:calendar:method',NULL,'PidNameCalendarMethod'),(1490,1,31,'00020329-0000-0000-c000-000000000046',37288,0,'urn:schemas:calendar:prodid',NULL,'PidNameCalendarProductId'),(1491,1,31,'00020329-0000-0000-c000-000000000046',37289,0,'urn:schemas:calendar:recurrenceidrange',NULL,'PidNameCalendarRecurrenceIdRange'),(1492,1,3,'00020329-0000-0000-c000-000000000046',37290,0,'urn:schemas:calendar:reminderoffset',NULL,'PidNameCalendarReminderOffset'),(1493,1,31,'00020329-0000-0000-c000-000000000046',37291,0,'urn:schemas:calendar:resources',NULL,'PidNameCalendarResources'),(1494,1,11,'00020329-0000-0000-c000-000000000046',37292,0,'urn:schemas:calendar:rsvp',NULL,'PidNameCalendarRsvp'),(1495,1,3,'00020329-0000-0000-c000-000000000046',37293,0,'urn:schemas:calendar:sequence',NULL,'PidNameCalendarSequence'),(1496,1,31,'00020329-0000-0000-c000-000000000046',37294,0,'urn:schemas:calendar:timezone',NULL,'PidNameCalendarTimeZone'),(1497,1,3,'00020329-0000-0000-c000-000000000046',37295,0,'urn:schemas:calendar:timezoneid',NULL,'PidNameCalendarTimeZoneId'),(1498,1,31,'00020329-0000-0000-c000-000000000046',37296,0,'urn:schemas:calendar:transparent',NULL,'PidNameCalendarTransparent'),(1499,1,31,'00020329-0000-0000-c000-000000000046',37297,0,'urn:schemas:calendar:uid',NULL,'PidNameCalendarUid'),(1500,1,31,'00020329-0000-0000-c000-000000000046',37298,0,'urn:schemas:calendar:version',NULL,'PidNameCalendarVersion'),(1501,1,31,'00020329-0000-0000-c000-000000000046',37299,0,'Category',NULL,'PidNameCategory'),(1502,1,3,'00020329-0000-0000-c000-000000000046',37300,0,'CharCount',NULL,'PidNameCharacterCount'),(1503,1,31,'00020329-0000-0000-c000-000000000046',37301,0,'Comments',NULL,'PidNameComments'),(1504,1,31,'00020329-0000-0000-c000-000000000046',37302,0,'Company',NULL,'PidNameCompany'),(1505,1,64,'00020329-0000-0000-c000-000000000046',37303,0,'CreateDtmRo',NULL,'PidNameCreateDateTimeReadOnly'),(1506,1,31,'00020329-0000-0000-c000-000000000046',37304,0,'DAV:id',NULL,'PidNameDavId'),(1507,1,11,'00020329-0000-0000-c000-000000000046',37305,0,'DAV:iscollection',NULL,'PidNameDavIsCollection'),(1508,1,11,'00020329-0000-0000-c000-000000000046',37306,0,'DAV:isstructureddocument',NULL,'PidNameDavIsStructuredDocument'),(1509,1,31,'00020329-0000-0000-c000-000000000046',37307,0,'DAV:parentname',NULL,'PidNameDavParentName'),(1510,1,31,'00020329-0000-0000-c000-000000000046',37308,0,'DAV:uid',NULL,'PidNameDavUid'),(1511,1,4127,'00020329-0000-0000-c000-000000000046',37309,0,'DocParts',NULL,'PidNameDocumentParts'),(1512,1,31,'00020329-0000-0000-c000-000000000046',37310,0,'EditTime',NULL,'PidNameEditTime'),(1513,1,31,'00020329-0000-0000-c000-000000000046',37311,0,'http://schemas.microsoft.com/exchange/intendedbusystatus',NULL,'PidNameExchangeIntendedBusyStatus'),(1514,1,3,'00020329-0000-0000-c000-000000000046',37312,0,'http://schemas.microsoft.com/exchange/junkemailmovestamp',NULL,'PidNameExchangeJunkEmailMoveStamp'),(1515,1,258,'00020329-0000-0000-c000-000000000046',37313,0,'http://schemas.microsoft.com/exchange/modifyexceptionstruct',NULL,'PidNameExchangeModifyExceptionStructure'),(1516,1,11,'00020329-0000-0000-c000-000000000046',37314,0,'http://schemas.microsoft.com/exchange/nomodifyexceptions',NULL,'PidNameExchangeNoModifyExceptions'),(1517,1,64,'00020329-0000-0000-c000-000000000046',37315,0,'http://schemas.microsoft.com/exchange/patternend',NULL,'PidNameExchangePatternEnd'),(1518,1,64,'00020329-0000-0000-c000-000000000046',37316,0,'http://schemas.microsoft.com/exchange/patternstart',NULL,'PidNameExchangePatternStart'),(1519,1,3,'00020329-0000-0000-c000-000000000046',37317,0,'http://schemas.microsoft.com/exchange/reminderinterval',NULL,'PidNameExchangeReminderInterval'),(1520,1,4127,'00020329-0000-0000-c000-000000000046',37318,0,'urn:schemas-microsoft-com:exch-data:baseschema',NULL,'PidNameExchDatabaseSchema'),(1521,1,4127,'00020329-0000-0000-c000-000000000046',37319,0,'urn:schemas-microsoft-com:exch-data:expected-content-class',NULL,'PidNameExchDataExpectedContentClass'),(1522,1,31,'00020329-0000-0000-c000-000000000046',37320,0,'urn:schemas-microsoft-com:exch-data:schema-collection-ref',NULL,'PidNameExchDataSchemaCollectionReference'),(1523,1,258,'00020329-0000-0000-c000-000000000046',37321,0,'HeadingPairs',NULL,'PidNameHeadingPairs'),(1524,1,3,'00020329-0000-0000-c000-000000000046',37322,0,'HiddenCount',NULL,'PidNameHiddenCount'),(1525,1,31,'00020329-0000-0000-c000-000000000046',37323,0,'urn:schemas:httpmail:calendar',NULL,'PidNameHttpmailCalendar'),(1526,1,31,'00020329-0000-0000-c000-000000000046',37324,0,'urn:schemas:httpmail:htmldescription',NULL,'PidNameHttpmailHtmlDescription'),(1527,1,31,'00020329-0000-0000-c000-000000000046',37325,0,'urn:schemas:httpmail:sendmsg',NULL,'PidNameHttpmailSendMessage'),(1528,1,4160,'00020329-0000-0000-c000-000000000046',37326,0,'urn:schemas:calendar:rdate',NULL,'PidNameICalendarRecurrenceDate'),(1529,1,4127,'00020329-0000-0000-c000-000000000046',37327,0,'urn:schemas:calendar:rrule',NULL,'PidNameICalendarRecurrenceRule'),(1530,1,4127,'00020329-0000-0000-c000-000000000046',37328,0,'Keywords',NULL,'PidNameKeywords'),(1531,1,31,'00020329-0000-0000-c000-000000000046',37329,0,'LastAuthor',NULL,'PidNameLastAuthor'),(1532,1,64,'00020329-0000-0000-c000-000000000046',37330,0,'LastPrinted',NULL,'PidNameLastPrinted'),(1533,1,64,'00020329-0000-0000-c000-000000000046',37331,0,'LastSaveDtm',NULL,'PidNameLastSaveDateTime'),(1534,1,3,'00020329-0000-0000-c000-000000000046',37332,0,'LineCount',NULL,'PidNameLineCount'),(1535,1,11,'00020329-0000-0000-c000-000000000046',37333,0,'LinksDirty',NULL,'PidNameLinksDirty'),(1536,1,31,'00020329-0000-0000-c000-000000000046',37334,0,'Manager',NULL,'PidNameManager'),(1537,1,3,'00020329-0000-0000-c000-000000000046',37335,0,'MMClipCount',NULL,'PidNameMultimediaClipCount'),(1538,1,3,'00020329-0000-0000-c000-000000000046',37336,0,'NoteCount',NULL,'PidNameNoteCount'),(1539,1,31,'00020329-0000-0000-c000-000000000046',37337,0,'OMSAccountGuid',NULL,'PidNameOMSAccountGuid'),(1540,1,31,'00020329-0000-0000-c000-000000000046',37338,0,'OMSMobileModel',NULL,'PidNameOMSMobileModel'),(1541,1,64,'00020329-0000-0000-c000-000000000046',37339,0,'OMSScheduleTime',NULL,'PidNameOMSScheduleTime'),(1542,1,3,'00020329-0000-0000-c000-000000000046',37340,0,'OMSServiceType',NULL,'PidNameOMSServiceType'),(1543,1,3,'00020329-0000-0000-c000-000000000046',37341,0,'OMSSourceType',NULL,'PidNameOMSSourceType'),(1544,1,3,'00020329-0000-0000-c000-000000000046',37342,0,'PageCount',NULL,'PidNamePageCount'),(1545,1,3,'00020329-0000-0000-c000-000000000046',37343,0,'ParCount',NULL,'PidNameParagraphCount'),(1546,1,3,'00020329-0000-0000-c000-000000000046',37344,0,'http://schemas.microsoft.com/outlook/phishingstamp',NULL,'PidNamePhishingStamp'),(1547,1,31,'00020329-0000-0000-c000-000000000046',37345,0,'PresFormat',NULL,'PidNamePresentationFormat'),(1548,1,31,'00020329-0000-0000-c000-000000000046',37346,0,'quarantine-original-sender',NULL,'PidNameQuarantineOriginalSender'),(1549,1,31,'00020329-0000-0000-c000-000000000046',37347,0,'RevNumber',NULL,'PidNameRevisionNumber'),(1550,1,4354,'00020329-0000-0000-c000-000000000046',37348,0,'DRMLicense',NULL,'PidNameRightsManagementLicense'),(1551,1,11,'00020329-0000-0000-c000-000000000046',37349,0,'Scale',NULL,'PidNameScale'),(1552,1,3,'00020329-0000-0000-c000-000000000046',37350,0,'Security',NULL,'PidNameSecurity'),(1553,1,3,'00020329-0000-0000-c000-000000000046',37351,0,'SlideCount',NULL,'PidNameSlideCount'),(1554,1,31,'00020329-0000-0000-c000-000000000046',37352,0,'Subject',NULL,'PidNameSubject'),(1555,1,31,'00020329-0000-0000-c000-000000000046',37353,0,'Template',NULL,'PidNameTemplate'),(1556,1,258,'00020329-0000-0000-c000-000000000046',37354,0,'Thumbnail',NULL,'PidNameThumbnail'),(1557,1,31,'00020329-0000-0000-c000-000000000046',37355,0,'Title',NULL,'PidNameTitle'),(1558,1,3,'00020329-0000-0000-c000-000000000046',37356,0,'WordCount',NULL,'PidNameWordCount'),(1559,0,1,'00062008-0000-0000-c000-000000000046',37357,34168,NULL,NULL,NULL),(1560,0,1,'00062008-0000-0000-c000-000000000046',37358,34216,NULL,NULL,NULL),(1561,0,1,'00062003-0000-0000-c000-000000000046',37359,33079,NULL,NULL,NULL),(1562,0,1,'00062008-0000-0000-c000-000000000046',37360,34160,NULL,NULL,NULL),(1563,1,1,'00020329-0000-0000-c000-000000000046',37361,NULL,'urn:schemas-microsoft-com:office:outlook#noaclui',NULL,NULL),(1564,0,1,'00062014-0000-0000-c000-000000000046',37362,36615,NULL,NULL,NULL),(1565,0,1,'00062014-0000-0000-c000-000000000046',37363,36613,NULL,NULL,NULL),(1566,1,1,'00020386-0000-0000-c000-000000000046',37364,NULL,'X-MS-Exchange-Organization-AuthDomain',NULL,NULL),(1567,0,1,'00062040-0000-0000-c000-000000000046',37365,35422,NULL,NULL,NULL),(1568,0,1,'00062040-0000-0000-c000-000000000046',37366,35376,NULL,NULL,NULL),(1569,0,1,'00062040-0000-0000-c000-000000000046',37367,35377,NULL,NULL,NULL),(1570,0,1,'00062040-0000-0000-c000-000000000046',37368,35379,NULL,NULL,NULL),(1571,0,1,'00062040-0000-0000-c000-000000000046',37369,35378,NULL,NULL,NULL),(1572,0,1,'00062040-0000-0000-c000-000000000046',37370,35415,NULL,NULL,NULL),(1573,0,1,'00062040-0000-0000-c000-000000000046',37371,35425,NULL,NULL,NULL),(1574,0,1,'00062040-0000-0000-c000-000000000046',37372,35426,NULL,NULL,NULL),(1575,0,1,'00062040-0000-0000-c000-000000000046',37373,35418,NULL,NULL,NULL),(1576,0,1,'00062040-0000-0000-c000-000000000046',37374,35421,NULL,NULL,NULL),(1577,0,1,'00062040-0000-0000-c000-000000000046',37375,35423,NULL,NULL,NULL),(1578,0,1,'00062040-0000-0000-c000-000000000046',37376,35428,NULL,NULL,NULL),(1579,0,1,'00062040-0000-0000-c000-000000000046',37377,35360,NULL,NULL,NULL),(1580,0,1,'00062040-0000-0000-c000-000000000046',37378,35429,NULL,NULL,NULL),(1581,0,1,'00062040-0000-0000-c000-000000000046',37379,35430,NULL,NULL,NULL),(1582,0,1,'00062008-0000-0000-c000-000000000046',37380,34189,NULL,NULL,NULL),(1583,0,1,'00062003-0000-0000-c000-000000000046',37381,33067,NULL,NULL,NULL),(1584,0,1,'00062003-0000-0000-c000-000000000046',37382,33071,NULL,NULL,NULL),(1585,0,1,'00062003-0000-0000-c000-000000000046',37383,33080,NULL,NULL,NULL),(1586,0,1,'00062003-0000-0000-c000-000000000046',37384,33074,NULL,NULL,NULL),(1587,0,1,'00062003-0000-0000-c000-000000000046',37385,33076,NULL,NULL,NULL),(1588,0,1,'00062003-0000-0000-c000-000000000046',37386,33053,NULL,NULL,NULL),(1589,0,1,'00062002-0000-0000-c000-000000000046',37387,33349,NULL,NULL,NULL),(1590,0,1,'00062002-0000-0000-c000-000000000046',37388,33280,NULL,NULL,NULL),(1591,0,1,'00062002-0000-0000-c000-000000000046',37389,33342,NULL,NULL,NULL),(1592,0,1,'00062002-0000-0000-c000-000000000046',37390,33407,NULL,NULL,NULL),(1593,0,1,'00062008-0000-0000-c000-000000000046',37391,34128,NULL,NULL,NULL),(1594,0,1,'00062008-0000-0000-c000-000000000046',37392,34129,NULL,NULL,NULL),(1595,0,1,'00062008-0000-0000-c000-000000000046',37393,34069,NULL,NULL,NULL),(1596,0,1,'00062008-0000-0000-c000-000000000046',37394,34114,NULL,NULL,NULL),(1597,0,1,'00062008-0000-0000-c000-000000000046',37395,34063,NULL,NULL,NULL),(1598,0,1,'00062008-0000-0000-c000-000000000046',37396,34075,NULL,NULL,NULL),(1599,0,1,'00062008-0000-0000-c000-000000000046',37397,34067,NULL,NULL,NULL),(1600,0,1,'00062008-0000-0000-c000-000000000046',37398,34112,NULL,NULL,NULL),(1601,0,1,'00062008-0000-0000-c000-000000000046',37399,34113,NULL,NULL,NULL),(1602,0,1,'00062008-0000-0000-c000-000000000046',37400,34100,NULL,NULL,NULL),(1603,0,1,'00062008-0000-0000-c000-000000000046',37401,34121,NULL,NULL,NULL),(1604,0,1,'00062008-0000-0000-c000-000000000046',37402,34179,NULL,NULL,NULL),(1605,0,1,'00062008-0000-0000-c000-000000000046',37403,34188,NULL,NULL,NULL),(1606,0,1,'00062008-0000-0000-c000-000000000046',37404,34190,NULL,NULL,NULL),(1607,0,1,'00062008-0000-0000-c000-000000000046',37405,34195,NULL,NULL,NULL),(1608,0,1,'00062008-0000-0000-c000-000000000046',37406,34192,NULL,NULL,NULL),(1609,0,1,'00062008-0000-0000-c000-000000000046',37407,34197,NULL,NULL,NULL),(1610,0,1,'00062008-0000-0000-c000-000000000046',37408,34199,NULL,NULL,NULL),(1611,0,1,'00062008-0000-0000-c000-000000000046',37409,34193,NULL,NULL,NULL),(1612,0,1,'00062008-0000-0000-c000-000000000046',37410,34198,NULL,NULL,NULL),(1613,0,1,'00062008-0000-0000-c000-000000000046',37411,34203,NULL,NULL,NULL),(1614,0,1,'00062008-0000-0000-c000-000000000046',37412,34207,NULL,NULL,NULL),(1615,1,1,'00020329-0000-0000-c000-000000000046',37413,NULL,'STS_Id',NULL,NULL),(1616,0,1,'00062008-0000-0000-c000-000000000046',37414,34226,NULL,NULL,NULL),(1617,0,1,'00062008-0000-0000-c000-000000000046',37415,34227,NULL,NULL,NULL),(1618,0,1,'00062008-0000-0000-c000-000000000046',37416,34233,NULL,NULL,NULL),(1619,0,1,'00062008-0000-0000-c000-000000000046',37417,34236,NULL,NULL,NULL),(1620,1,1,'00020329-0000-0000-c000-000000000046',37418,NULL,'http://schemas.microsoft.com/outlook/spoofingstamp',NULL,NULL),(1621,0,1,'00062008-0000-0000-c000-000000000046',37419,34238,NULL,NULL,NULL),(1622,0,1,'00062008-0000-0000-c000-000000000046',37420,34241,NULL,NULL,NULL),(1623,0,1,'00062008-0000-0000-c000-000000000046',37421,34242,NULL,NULL,NULL),(1624,0,1,'00062008-0000-0000-c000-000000000046',37422,34243,NULL,NULL,NULL),(1625,1,1,'00020386-0000-0000-c000-000000000046',37423,NULL,'X-MS-Exchange-Organization-AuthAs',NULL,NULL),(1626,0,1,'11000e07-b51b-40d6-af21-caa85edab1d0',37424,1,NULL,NULL,NULL),(1627,0,1,'11000e07-b51b-40d6-af21-caa85edab1d0',37425,3,NULL,NULL,NULL),(1628,0,1,'00062008-0000-0000-c000-000000000046',37426,34254,NULL,NULL,NULL),(1629,0,1,'00062008-0000-0000-c000-000000000046',37427,34264,NULL,NULL,NULL),(1630,1,1,'41f28f13-83f4-4114-a584-eedb5a6b0bff',37428,NULL,'ApprovalDecision',NULL,NULL),(1631,1,1,'41f28f13-83f4-4114-a584-eedb5a6b0bff',37429,NULL,'ApprovalDecisionMaker',NULL,NULL),(1632,1,1,'41f28f13-83f4-4114-a584-eedb5a6b0bff',37430,NULL,'ApprovalDecisionTime',NULL,NULL),(1633,0,1,'6ed8da90-450b-101b-98da-00aa003f1305',37431,11,NULL,NULL,NULL),(1634,0,1,'6ed8da90-450b-101b-98da-00aa003f1305',37432,21,NULL,NULL,NULL),(1635,0,1,'6ed8da90-450b-101b-98da-00aa003f1305',37433,22,NULL,NULL,NULL),(1636,0,1,'6ed8da90-450b-101b-98da-00aa003f1305',37434,25,NULL,NULL,NULL),(1637,0,1,'6ed8da90-450b-101b-98da-00aa003f1305',37435,29,NULL,NULL,NULL),(1638,1,1,'00020329-0000-0000-c000-000000000046',37436,NULL,'OnlineMeetingInternalLink',NULL,NULL),(1639,1,1,'00020329-0000-0000-c000-000000000046',37437,NULL,'OnlineMeetingExternalLink',NULL,NULL),(1640,1,1,'00020329-0000-0000-c000-000000000046',37438,NULL,'urn:schemas-microsoft-com:office:outlook#fixupfbfolder',NULL,NULL),(1641,0,1,'00062004-0000-0000-c000-000000000046',37439,32835,NULL,NULL,NULL);
/*!40000 ALTER TABLE `named_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizational_units`
--

DROP TABLE IF EXISTS `organizational_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizational_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization` varchar(165) DEFAULT NULL,
  `administrative_group` varchar(165) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ou_unique` (`organization`,`administrative_group`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizational_units`
--

LOCK TABLES `organizational_units` WRITE;
/*!40000 ALTER TABLE `organizational_units` DISABLE KEYS */;
INSERT INTO `organizational_units` VALUES (1,'First Organization','First Administrative Group');
/*!40000 ALTER TABLE `organizational_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provisioning_folders`
--

DROP TABLE IF EXISTS `provisioning_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provisioning_folders` (
  `locale` varchar(15) NOT NULL,
  `mailbox` varchar(128) NOT NULL DEFAULT 'OpenChange Mailbox: %s',
  `deferred_action` varchar(128) NOT NULL DEFAULT 'Deferred Action',
  `spooler_queue` varchar(128) NOT NULL DEFAULT 'Spooler Queue',
  `common_views` varchar(128) NOT NULL DEFAULT 'Common Views',
  `schedule` varchar(128) NOT NULL DEFAULT 'Schedule',
  `finder` varchar(128) NOT NULL DEFAULT 'Finder',
  `views` varchar(128) NOT NULL DEFAULT 'Views',
  `shortcuts` varchar(128) NOT NULL DEFAULT 'Shortcuts',
  `reminders` varchar(128) NOT NULL DEFAULT 'Reminders',
  `todo` varchar(128) NOT NULL DEFAULT 'To-Do',
  `tracked_mail_processing` varchar(128) NOT NULL DEFAULT 'Tracked Mail Processing',
  `top_info_store` varchar(128) NOT NULL DEFAULT 'Top of Information Store',
  `inbox` varchar(128) NOT NULL DEFAULT 'Inbox',
  `outbox` varchar(128) NOT NULL DEFAULT 'Outbox',
  `sent_items` varchar(128) NOT NULL DEFAULT 'Sent Items',
  `deleted_items` varchar(128) NOT NULL DEFAULT 'Deleted Items',
  PRIMARY KEY (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provisioning_folders`
--

LOCK TABLES `provisioning_folders` WRITE;
/*!40000 ALTER TABLE `provisioning_folders` DISABLE KEYS */;
INSERT INTO `provisioning_folders` VALUES ('en','OpenChange Mailbox: %s','Deferred Action','Spooler Queue','Common Views','Schedule','Finder','Views','Shortcuts','Reminders','To-Do','Tracked Mail Processing','Top of Information Store','Inbox','Outbox','Sent Items','Deleted Items');
/*!40000 ALTER TABLE `provisioning_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provisioning_special_folders`
--

DROP TABLE IF EXISTS `provisioning_special_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provisioning_special_folders` (
  `locale` varchar(15) NOT NULL,
  `drafts` varchar(128) NOT NULL DEFAULT 'Drafts',
  `calendar` varchar(128) NOT NULL DEFAULT 'Calendar',
  `contacts` varchar(128) NOT NULL DEFAULT 'Contacts',
  `tasks` varchar(128) NOT NULL DEFAULT 'Tasks',
  `notes` varchar(128) NOT NULL DEFAULT 'Notes',
  `journal` varchar(128) NOT NULL DEFAULT 'Journal',
  PRIMARY KEY (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provisioning_special_folders`
--

LOCK TABLES `provisioning_special_folders` WRITE;
/*!40000 ALTER TABLE `provisioning_special_folders` DISABLE KEYS */;
INSERT INTO `provisioning_special_folders` VALUES ('en','Drafts','Calendar','Contacts','Tasks','Notes','Journal');
/*!40000 ALTER TABLE `provisioning_special_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_folders`
--

DROP TABLE IF EXISTS `public_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_folders` (
  `ou_id` int(11) NOT NULL,
  `ReplicaID` int(11) DEFAULT NULL,
  `StoreGUID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ou_id`),
  CONSTRAINT `fk_public_folders_ou_id` FOREIGN KEY (`ou_id`) REFERENCES `organizational_units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_folders`
--

LOCK TABLES `public_folders` WRITE;
/*!40000 ALTER TABLE `public_folders` DISABLE KEYS */;
INSERT INTO `public_folders` VALUES (1,1,'4df4633e-5cfa-4039-9c3e-f3cde172f965');
/*!40000 ALTER TABLE `public_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ou_id` int(11) NOT NULL,
  `replica_id` int(11) NOT NULL DEFAULT '1',
  `change_number` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_servers_1_idx` (`ou_id`),
  CONSTRAINT `fk_servers_ou_id` FOREIGN KEY (`ou_id`) REFERENCES `organizational_units` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
INSERT INTO `servers` VALUES (1,1,1,164);
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-20 17:18:14
