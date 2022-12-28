-- MariaDB dump 10.19  Distrib 10.8.6-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: ecomm
-- ------------------------------------------------------
-- Server version	10.8.6-MariaDB-log

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
-- Table structure for table `attribute_value_product_attribute`
--

DROP TABLE IF EXISTS `attribute_value_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_value_product_attribute` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_value_id` bigint(20) unsigned DEFAULT NULL,
  `product_attribute_id` bigint(20) unsigned NOT NULL,
  `product_custom_value` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_value_product_attribute_attribute_value_id_index` (`attribute_value_id`),
  KEY `attribute_value_product_attribute_product_attribute_id_index` (`product_attribute_id`),
  CONSTRAINT `attribute_value_product_attribute_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE SET NULL,
  CONSTRAINT `attribute_value_product_attribute_product_attribute_id_foreign` FOREIGN KEY (`product_attribute_id`) REFERENCES `product_attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_value_product_attribute`
--

LOCK TABLES `attribute_value_product_attribute` WRITE;
/*!40000 ALTER TABLE `attribute_value_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_value_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_values`
--

DROP TABLE IF EXISTS `attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_values` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(50) NOT NULL,
  `key` varchar(255) NOT NULL,
  `position` smallint(5) unsigned DEFAULT 1,
  `attribute_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_values_key_unique` (`key`),
  KEY `attribute_values_attribute_id_index` (`attribute_id`),
  CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_values`
--

LOCK TABLES `attribute_values` WRITE;
/*!40000 ALTER TABLE `attribute_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `is_searchable` tinyint(1) NOT NULL DEFAULT 0,
  `is_filterable` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `position` smallint(5) unsigned NOT NULL DEFAULT 0,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `seo_title` varchar(60) DEFAULT NULL,
  `seo_description` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES
(1,'2022-12-27 07:50:04','2022-12-27 07:50:04','Tiga Lima','tiga-lima',NULL,'<div><strong>Tiger Limer</strong></div>',0,1,NULL,NULL);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carriers`
--

DROP TABLE IF EXISTS `carriers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carriers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `carriers_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carriers`
--

LOCK TABLES `carriers` WRITE;
/*!40000 ALTER TABLE `carriers` DISABLE KEYS */;
/*!40000 ALTER TABLE `carriers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `position` smallint(5) unsigned NOT NULL DEFAULT 0,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `seo_title` varchar(60) DEFAULT NULL,
  `seo_description` varchar(160) DEFAULT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_index` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(1,'2022-12-27 07:47:18','2022-12-27 07:47:18','Buku Kecil','buku-kecil','<div><strong>Utensils</strong></div>',0,1,NULL,NULL,NULL),
(2,'2022-12-27 07:47:18','2022-12-27 07:47:18','Buku Besar','buku-besar','<div><strong>Utensils</strong></div>',0,1,NULL,NULL,NULL),
(3,'2022-12-27 07:47:18','2022-12-27 07:47:18','Mekdi','mekdi','<div><strong>Utensils</strong></div>',0,1,NULL,NULL,NULL),
(4,'2022-12-27 07:47:18','2022-12-27 07:47:18','Kopi','kopi','<div><strong>Utensils</strong></div>',0,1,NULL,NULL,NULL),
(5,'2022-12-27 07:47:18','2022-12-27 07:47:18','Tool','tool','<div><strong>Utensils</strong></div>',0,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channels_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES
(1,'2022-12-27 07:41:22','2022-12-27 07:41:22','Web Store','web-store',NULL,NULL,'http://ecommerce.test',1);
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_rules`
--

DROP TABLE IF EXISTS `collection_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_rules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rule` varchar(255) NOT NULL,
  `operator` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `collection_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `collection_rules_collection_id_index` (`collection_id`),
  CONSTRAINT `collection_rules_collection_id_foreign` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_rules`
--

LOCK TABLES `collection_rules` WRITE;
/*!40000 ALTER TABLE `collection_rules` DISABLE KEYS */;
INSERT INTO `collection_rules` VALUES
(1,'2022-12-27 07:51:01','2022-12-27 07:51:01','product_title','equals_to','lima',1);
/*!40000 ALTER TABLE `collection_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `type` enum('manual','auto') NOT NULL,
  `sort` varchar(255) DEFAULT NULL,
  `match_conditions` enum('all','any') DEFAULT NULL,
  `published_at` datetime NOT NULL DEFAULT '2022-12-27 15:35:12',
  `seo_title` varchar(60) DEFAULT NULL,
  `seo_description` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collections_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
INSERT INTO `collections` VALUES
(1,'2022-12-27 07:51:01','2022-12-27 07:51:01','version 1.1','version-11','<div><strong>version 1.1</strong></div>','auto',NULL,'all','2022-12-28 15:51:00',NULL,NULL);
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discountables`
--

DROP TABLE IF EXISTS `discountables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discountables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `condition` varchar(255) DEFAULT NULL,
  `total_use` int(10) unsigned NOT NULL DEFAULT 0,
  `discountable_type` varchar(255) NOT NULL,
  `discountable_id` bigint(20) unsigned NOT NULL,
  `discount_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `discountables_discountable_type_discountable_id_index` (`discountable_type`,`discountable_id`),
  KEY `discountables_discount_id_index` (`discount_id`),
  CONSTRAINT `discountables_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discountables`
--

LOCK TABLES `discountables` WRITE;
/*!40000 ALTER TABLE `discountables` DISABLE KEYS */;
/*!40000 ALTER TABLE `discountables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  `apply_to` varchar(255) NOT NULL,
  `min_required` varchar(255) NOT NULL,
  `min_required_value` varchar(255) DEFAULT NULL,
  `eligibility` varchar(255) NOT NULL,
  `usage_limit` int(10) unsigned DEFAULT NULL,
  `usage_limit_per_user` tinyint(1) NOT NULL DEFAULT 0,
  `total_use` int(10) unsigned NOT NULL DEFAULT 0,
  `start_at` datetime NOT NULL,
  `end_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `discounts_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventories`
--

DROP TABLE IF EXISTS `inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `street_address` varchar(255) NOT NULL,
  `street_address_plus` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventories_code_unique` (`code`),
  UNIQUE KEY `inventories_email_unique` (`email`),
  KEY `inventories_country_id_index` (`country_id`),
  CONSTRAINT `inventories_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `system_countries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventories`
--

LOCK TABLES `inventories` WRITE;
/*!40000 ALTER TABLE `inventories` DISABLE KEYS */;
INSERT INTO `inventories` VALUES
(1,'2022-12-27 07:41:21','2022-12-27 07:41:21','Kedai Buku 555','kedai-buku-555',NULL,'inrafilus@gmail.com','No 3 Lot 6368',NULL,'71000','Port Dickson','+60189746509',0,NULL,NULL,1,160),
(2,'2022-12-27 07:41:21','2022-12-27 07:41:21','Chicken Chop','chicken-chop',NULL,'first@customer.com','No 3 Lot 6368',NULL,'71000','Port Dickson','+60189746509',0,NULL,NULL,1,160),
(3,'2022-12-27 07:41:21','2022-12-27 07:41:21','Coffe','coffee',NULL,'second@customer.com','No 3 Lot 6368',NULL,'71000','Port Dickson','+60189746509',0,NULL,NULL,1,160);
/*!40000 ALTER TABLE `inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_histories`
--

DROP TABLE IF EXISTS `inventory_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stockable_type` varchar(255) NOT NULL,
  `stockable_id` bigint(20) unsigned NOT NULL,
  `reference_type` varchar(255) DEFAULT NULL,
  `reference_id` bigint(20) unsigned DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `old_quantity` int(11) NOT NULL DEFAULT 0,
  `event` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `inventory_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_histories_stockable_type_stockable_id_index` (`stockable_type`,`stockable_id`),
  KEY `inventory_histories_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `inventory_histories_inventory_id_index` (`inventory_id`),
  KEY `inventory_histories_user_id_index` (`user_id`),
  CONSTRAINT `inventory_histories_inventory_id_foreign` FOREIGN KEY (`inventory_id`) REFERENCES `inventories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `inventory_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_histories`
--

LOCK TABLES `inventory_histories` WRITE;
/*!40000 ALTER TABLE `inventory_histories` DISABLE KEYS */;
INSERT INTO `inventory_histories` VALUES
(1,'2022-12-27 07:48:22','2022-12-27 07:48:22','product',1,NULL,NULL,10,10,'Initial inventory',NULL,1,1);
/*!40000 ALTER TABLE `inventory_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legals`
--

DROP TABLE IF EXISTS `legals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `legals_title_unique` (`title`),
  UNIQUE KEY `legals_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legals`
--

LOCK TABLES `legals` WRITE;
/*!40000 ALTER TABLE `legals` DISABLE KEYS */;
INSERT INTO `legals` VALUES
(1,'Refund policy','refund-policy',NULL,1,'2022-12-27 07:38:10','2022-12-27 07:38:10'),
(2,'Privacy policy','privacy-policy',NULL,1,'2022-12-27 07:38:10','2022-12-27 07:38:10'),
(3,'Terms of use','terms-of-use',NULL,1,'2022-12-27 07:38:10','2022-12-27 07:38:10'),
(4,'Shipping policy','shipping-policy',NULL,1,'2022-12-27 07:38:10','2022-12-27 07:38:10');
/*!40000 ALTER TABLE `legals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `media_order_column_index` (`order_column`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES
(1,'category',1,'2bf1a62e-c996-4789-a512-bde2bdd8a260','uploads','MaoGd2ckFlOrhwWjqY2FvAHSJNMyUJ-metadG9vbmxpbmsuanBn-','MaoGd2ckFlOrhwWjqY2FvAHSJNMyUJ-metadG9vbmxpbmsuanBn-.jpg','image/jpeg','public','public',63593,'[]','[]','{\"thumb200x200\":true}','[]',1,'2022-12-27 07:47:18','2022-12-27 07:47:19'),
(2,'product',1,'82174051-19e7-4f86-85a7-bbf82d1e6b51','uploads','RofKOro5Y8iO6sHqjHoNgenBguZUSs-metadG9vbmxpbmstYW5neS5qcGc=-','RofKOro5Y8iO6sHqjHoNgenBguZUSs-metadG9vbmxpbmstYW5neS5qcGc=-.png','image/png','public','public',46821,'[]','[]','{\"thumb200x200\":true}','[]',1,'2022-12-27 07:48:21','2022-12-27 07:48:22'),
(3,'brand',1,'7ca13b21-e35b-425a-9a5c-ba2ed17168ec','uploads','q2zOTeP3tbnnNm0xTW2f48u1GpFe61-metadGlnZXItbGltZXIuanBlZw==-','q2zOTeP3tbnnNm0xTW2f48u1GpFe61-metadGlnZXItbGltZXIuanBlZw==-.jpg','image/jpeg','public','public',7155,'[]','[]','{\"thumb200x200\":true}','[]',1,'2022-12-27 07:50:04','2022-12-27 07:50:05'),
(4,'product',2,'b15093c6-4eec-4161-8bd4-1a5f2c85f302','uploads','pUFIxFVujRjg5r58dk1znqXh9lu1g3-metadG9vbmxpbmsuanBn-','pUFIxFVujRjg5r58dk1znqXh9lu1g3-metadG9vbmxpbmsuanBn-.jpg','image/jpeg','public','public',63593,'[]','[]','{\"thumb200x200\":true}','[]',1,'2022-12-28 05:53:14','2022-12-28 05:53:18');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_05_03_000001_create_customer_columns',1),
(4,'2019_05_03_000002_create_subscriptions_table',1),
(5,'2019_05_03_000003_create_subscription_items_table',1),
(6,'2019_08_19_000000_create_failed_jobs_table',1),
(7,'2019_11_18_220125_create_permission_tables',1),
(8,'2019_12_14_000001_create_personal_access_tokens_table',1),
(9,'2020_00_00_000001_create_system_countries_table',1),
(10,'2020_00_00_000001_create_system_currencies_table',1),
(11,'2020_00_00_000001_create_system_settings_table',1),
(12,'2020_00_01_000000_create_user_addresses_table',1),
(13,'2020_00_02_000001_add_two_factor_columns_to_users_table',1),
(14,'2020_00_02_000001_create_channels_table',1),
(15,'2020_00_02_000002_create_inventories_table',1),
(16,'2020_00_02_000003_create_categories_table',1),
(17,'2020_00_02_000004_create_brands_table',1),
(18,'2020_00_02_000005_create_collections_table',1),
(19,'2020_00_02_000006_create_products_table',1),
(20,'2020_00_02_000007_create_attributes_table',1),
(21,'2020_00_02_000007_create_carriers_table',1),
(22,'2020_00_02_000008_create_payment_methods_table',1),
(23,'2020_00_02_000009_create_discounts_table',1),
(24,'2020_00_02_000010_create_reviews_table',1),
(25,'2020_00_03_000001_create_orders_table',1),
(26,'2020_00_03_000002_create_order_shippings_table',1),
(27,'2020_00_03_000002_create_users_geolocation_history_table',1),
(28,'2020_00_03_000003_create_order_items_table',1),
(29,'2020_00_03_000004_create_order_refunds_table',1),
(30,'2021_01_18_174504_create_legals_table',1),
(31,'2021_02_10_153239_create_product_has_relations_table',1),
(32,'2022_06_14_224741_update_gender_columns_on_users_table',1),
(33,'2022_12_14_121528_create_media_table',1),
(34,'2022_12_27_161628_alter_users_lastname',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES
(1,'App\\Models\\User',1),
(1,'App\\Models\\User',4),
(3,'App\\Models\\User',3);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT 'The product name at the moment of buying',
  `sku` varchar(255) DEFAULT NULL,
  `product_type` varchar(255) NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price_amount` int(11) NOT NULL,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_product_type_product_id_index` (`product_type`,`product_id`),
  KEY `order_items_sku_index` (`sku`),
  KEY `order_items_order_id_index` (`order_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_refunds`
--

DROP TABLE IF EXISTS `order_refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_refunds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_reason` longtext DEFAULT NULL,
  `refund_amount` varchar(255) DEFAULT NULL,
  `status` enum('pending','treatment','partial-refund','refunded','cancelled','rejected') NOT NULL DEFAULT 'pending',
  `notes` longtext NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_refunds_order_id_index` (`order_id`),
  KEY `order_refunds_user_id_index` (`user_id`),
  CONSTRAINT `order_refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_refunds_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_refunds`
--

LOCK TABLES `order_refunds` WRITE;
/*!40000 ALTER TABLE `order_refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shippings`
--

DROP TABLE IF EXISTS `order_shippings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_shippings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipped_at` date NOT NULL,
  `received_at` date NOT NULL,
  `returned_at` date NOT NULL,
  `tracking_number` varchar(255) DEFAULT NULL,
  `tracking_number_url` varchar(255) DEFAULT NULL,
  `voucher` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`voucher`)),
  `order_id` bigint(20) unsigned NOT NULL,
  `carrier_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_shippings_order_id_index` (`order_id`),
  KEY `order_shippings_carrier_id_index` (`carrier_id`),
  CONSTRAINT `order_shippings_carrier_id_foreign` FOREIGN KEY (`carrier_id`) REFERENCES `carriers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `order_shippings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shippings`
--

LOCK TABLES `order_shippings` WRITE;
/*!40000 ALTER TABLE `order_shippings` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_shippings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `number` varchar(32) NOT NULL,
  `price_amount` int(11) DEFAULT NULL,
  `status` varchar(32) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `shipping_total` int(11) DEFAULT NULL,
  `shipping_method` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `parent_order_id` bigint(20) unsigned DEFAULT NULL,
  `payment_method_id` bigint(20) unsigned DEFAULT NULL,
  `shipping_address_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_parent_order_id_index` (`parent_order_id`),
  KEY `orders_payment_method_id_index` (`payment_method_id`),
  KEY `orders_shipping_address_id_index` (`shipping_address_id`),
  KEY `orders_user_id_index` (`user_id`),
  CONSTRAINT `orders_parent_order_id_foreign` FOREIGN KEY (`parent_order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_shipping_address_id_foreign` FOREIGN KEY (`shipping_address_id`) REFERENCES `user_addresses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_methods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_methods_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `can_be_removed` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES
(1,'access_dashboard','web','system','Access Dashboard','This permission allow user to access to the dashboard.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(2,'access_setting','web','system','Access Setting','This permission allow user to view the setting page.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(3,'view_users','web','system','Views Users','This permission allow user to access to the administrator area.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(4,'manage_mail','web','system','Manage mail setting','This permission allow user to manage the mail configuration with template.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(5,'impersonate','web','system','Impersonate User','This permission allow user to logged with the account of another user.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(6,'view_analytics','web','system','Views & Reports analytics','This permission allow user to view, analyze and make reports statistics for shop.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(7,'setting_analytics','web','system','Manage Analytics setting','This permission allow user to add, update, and remove analytics settings such as Google Analytics, Facebook Pixel and more.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(8,'browse_brands','web','brands','Browse Brands','This permission allow you to browse all the brands, with actions as search, filters and more.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(9,'read_brands','web','brands','Read Brands','This permission allow you to read the content of a record of brands.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(10,'edit_brands','web','brands','Edit Brands','This permission allow you to edit the content of a record of brands.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(11,'add_brands','web','brands','Add Brands','This permission allow you to add a new record of brands.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(12,'delete_brands','web','brands','Delete Brands','This permission allow you to removed a record of brands.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(13,'browse_categories','web','categories','Browse Categories','This permission allow you to browse all the categories, with actions as search, filters and more.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(14,'read_categories','web','categories','Read Categories','This permission allow you to read the content of a record of categories.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(15,'edit_categories','web','categories','Edit Categories','This permission allow you to edit the content of a record of categories.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(16,'add_categories','web','categories','Add Categories','This permission allow you to add a new record of categories.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(17,'delete_categories','web','categories','Delete Categories','This permission allow you to removed a record of categories.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(18,'browse_collections','web','collections','Browse Collections','This permission allow you to browse all the collections, with actions as search, filters and more.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(19,'read_collections','web','collections','Read Collections','This permission allow you to read the content of a record of collections.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(20,'edit_collections','web','collections','Edit Collections','This permission allow you to edit the content of a record of collections.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(21,'add_collections','web','collections','Add Collections','This permission allow you to add a new record of collections.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(22,'delete_collections','web','collections','Delete Collections','This permission allow you to removed a record of collections.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(23,'browse_products','web','products','Browse Products','This permission allow you to browse all the products, with actions as search, filters and more.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(24,'read_products','web','products','Read Products','This permission allow you to read the content of a record of products.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(25,'edit_products','web','products','Edit Products','This permission allow you to edit the content of a record of products.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(26,'add_products','web','products','Add Products','This permission allow you to add a new record of products.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(27,'delete_products','web','products','Delete Products','This permission allow you to removed a record of products.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(28,'browse_customers','web','customers','Browse Customers','This permission allow you to browse all the customers, with actions as search, filters and more.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(29,'read_customers','web','customers','Read Customers','This permission allow you to read the content of a record of customers.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(30,'edit_customers','web','customers','Edit Customers','This permission allow you to edit the content of a record of customers.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(31,'add_customers','web','customers','Add Customers','This permission allow you to add a new record of customers.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(32,'delete_customers','web','customers','Delete Customers','This permission allow you to removed a record of customers.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(33,'browse_orders','web','orders','Browse Orders','This permission allow you to browse all the orders, with actions as search, filters and more.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(34,'read_orders','web','orders','Read Orders','This permission allow you to read the content of a record of orders.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(35,'edit_orders','web','orders','Edit Orders','This permission allow you to edit the content of a record of orders.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(36,'add_orders','web','orders','Add Orders','This permission allow you to add a new record of orders.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(37,'delete_orders','web','orders','Delete Orders','This permission allow you to removed a record of orders.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(38,'browse_discounts','web','discounts','Browse Discounts','This permission allow you to browse all the discounts, with actions as search, filters and more.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(39,'read_discounts','web','discounts','Read Discounts','This permission allow you to read the content of a record of discounts.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(40,'edit_discounts','web','discounts','Edit Discounts','This permission allow you to edit the content of a record of discounts.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(41,'add_discounts','web','discounts','Add Discounts','This permission allow you to add a new record of discounts.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(42,'delete_discounts','web','discounts','Delete Discounts','This permission allow you to removed a record of discounts.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(43,'browse_inventories','web','products','Browse Inventories','This permission allow you to browse all the inventories, with actions as search, filters and more.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(44,'read_inventories','web','products','Read Inventories','This permission allow you to read the content of a record of inventories.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(45,'edit_inventories','web','products','Edit Inventories','This permission allow you to edit the content of a record of inventories.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(46,'add_inventories','web','products','Add Inventories','This permission allow you to add a new record of inventories.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(47,'delete_inventories','web','products','Delete Inventories','This permission allow you to removed a record of inventories.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(48,'browse_attributes','web','products','Browse Attributes','This permission allow you to browse all the attributes, with actions as search, filters and more.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(49,'read_attributes','web','products','Read Attributes','This permission allow you to read the content of a record of attributes.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(50,'edit_attributes','web','products','Edit Attributes','This permission allow you to edit the content of a record of attributes.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(51,'add_attributes','web','products','Add Attributes','This permission allow you to add a new record of attributes.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(52,'delete_attributes','web','products','Delete Attributes','This permission allow you to removed a record of attributes.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attributes`
--

DROP TABLE IF EXISTS `product_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `attribute_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attributes_product_id_index` (`product_id`),
  KEY `product_attributes_attribute_id_index` (`attribute_id`),
  CONSTRAINT `product_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attributes`
--

LOCK TABLES `product_attributes` WRITE;
/*!40000 ALTER TABLE `product_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_has_relations`
--

DROP TABLE IF EXISTS `product_has_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_has_relations` (
  `product_id` bigint(20) unsigned NOT NULL,
  `productable_type` varchar(255) NOT NULL,
  `productable_id` bigint(20) unsigned NOT NULL,
  KEY `product_has_relations_productable_type_productable_id_index` (`productable_type`,`productable_id`),
  KEY `product_has_relations_product_id_index` (`product_id`),
  CONSTRAINT `product_has_relations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_has_relations`
--

LOCK TABLES `product_has_relations` WRITE;
/*!40000 ALTER TABLE `product_has_relations` DISABLE KEYS */;
INSERT INTO `product_has_relations` VALUES
(1,'category',1),
(1,'channel',1),
(2,'category',1),
(2,'collection',1),
(2,'channel',1);
/*!40000 ALTER TABLE `product_has_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `security_stock` int(11) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `is_visible` tinyint(1) NOT NULL DEFAULT 0,
  `old_price_amount` int(11) DEFAULT NULL,
  `price_amount` int(11) DEFAULT NULL,
  `cost_amount` int(11) DEFAULT NULL,
  `type` enum('deliverable','downloadable') DEFAULT NULL,
  `backorder` tinyint(1) NOT NULL DEFAULT 0,
  `requires_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `published_at` datetime DEFAULT '2022-12-27 15:35:12',
  `seo_title` varchar(60) DEFAULT NULL,
  `seo_description` varchar(160) DEFAULT NULL,
  `weight_value` decimal(10,5) unsigned DEFAULT 0.00000,
  `weight_unit` varchar(255) NOT NULL DEFAULT 'kg',
  `height_value` decimal(10,5) unsigned DEFAULT 0.00000,
  `height_unit` varchar(255) NOT NULL DEFAULT 'cm',
  `width_value` decimal(10,5) unsigned DEFAULT 0.00000,
  `width_unit` varchar(255) NOT NULL DEFAULT 'cm',
  `depth_value` decimal(10,5) unsigned DEFAULT 0.00000,
  `depth_unit` varchar(255) NOT NULL DEFAULT 'cm',
  `volume_value` decimal(10,5) unsigned DEFAULT 0.00000,
  `volume_unit` varchar(255) NOT NULL DEFAULT 'l',
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `brand_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  UNIQUE KEY `products_barcode_unique` (`barcode`),
  KEY `products_parent_id_index` (`parent_id`),
  KEY `products_brand_id_index` (`brand_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES
(1,'2022-12-27 07:48:21','2022-12-27 07:48:21',NULL,'Buku Tiga Lima','buku-tiga-lima','15',NULL,'<div><strong>555</strong></div>',0,0,1,0,1,1,'deliverable',1,1,'2022-12-27 15:47:00',NULL,NULL,1.00000,'kg',1.00000,'cm',1.00000,'cm',0.00000,'cm',1.00000,'l',NULL,NULL),
(2,'2022-12-28 05:53:13','2022-12-28 05:53:13',NULL,'Mc Dondal','mc-dondal',NULL,NULL,'<div><strong>Mc Dondal</strong></div>',0,0,1,123,123,23,'deliverable',0,0,'2022-12-28 13:53:00',NULL,NULL,NULL,'kg',NULL,'cm',NULL,'cm',0.00000,'cm',NULL,'l',NULL,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_recommended` tinyint(1) NOT NULL DEFAULT 0,
  `rating` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `reviewrateable_type` varchar(255) NOT NULL,
  `reviewrateable_id` bigint(20) unsigned NOT NULL,
  `author_type` varchar(255) NOT NULL,
  `author_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_reviewrateable_type_reviewrateable_id_index` (`reviewrateable_type`,`reviewrateable_id`),
  KEY `reviews_author_type_author_id_index` (`author_type`,`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1),
(11,1),
(12,1),
(13,1),
(14,1),
(15,1),
(16,1),
(17,1),
(18,1),
(19,1),
(20,1),
(21,1),
(22,1),
(23,1),
(24,1),
(25,1),
(26,1),
(27,1),
(28,1),
(29,1),
(30,1),
(31,1),
(32,1),
(33,1),
(34,1),
(35,1),
(36,1),
(37,1),
(38,1),
(39,1),
(40,1),
(41,1),
(42,1),
(43,1),
(44,1),
(45,1),
(46,1),
(47,1),
(48,1),
(49,1),
(50,1),
(51,1),
(52,1);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `can_be_removed` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'administrator','web','Administrator','Site administrator with access to shop admin panel and developer tools.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(2,'manager','web','Manager','Site manager with access to shop admin panel and publishing menus.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(3,'user','web','User','Site customer role with access on front site.',0,'2022-12-27 07:38:09','2022-12-27 07:38:09'),
(4,'vendor','web','Vendor','vendor',1,'2022-12-28 07:02:37','2022-12-28 07:02:37');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_items`
--

DROP TABLE IF EXISTS `subscription_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) unsigned NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_plan` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscription_items_subscription_id_stripe_plan_unique` (`subscription_id`,`stripe_plan`),
  KEY `subscription_items_stripe_id_index` (`stripe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_items`
--

LOCK TABLES `subscription_items` WRITE;
/*!40000 ALTER TABLE `subscription_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_status` varchar(255) NOT NULL,
  `stripe_plan` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_countries`
--

DROP TABLE IF EXISTS `system_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `name_official` varchar(255) NOT NULL,
  `cca2` varchar(255) NOT NULL,
  `cca3` varchar(255) NOT NULL,
  `flag` varchar(255) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `currencies` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`currencies`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_countries`
--

LOCK TABLES `system_countries` WRITE;
/*!40000 ALTER TABLE `system_countries` DISABLE KEYS */;
INSERT INTO `system_countries` VALUES
(1,'Aruba','Aruba','AW','ABW','🇦🇼',12.50000000,-69.96666666,'{\"AWG\":{\"name\":\"Aruban florin\",\"symbol\":\"\\u0192\"}}'),
(2,'Afghanistan','Islamic Republic of Afghanistan','AF','AFG','🇦🇫',33.00000000,65.00000000,'{\"AFN\":{\"name\":\"Afghan afghani\",\"symbol\":\"\\u060b\"}}'),
(3,'Angola','Republic of Angola','AO','AGO','🇦🇴',-12.50000000,18.50000000,'{\"AOA\":{\"name\":\"Angolan kwanza\",\"symbol\":\"Kz\"}}'),
(4,'Anguilla','Anguilla','AI','AIA','🇦🇮',18.25000000,-63.16666666,'{\"XCD\":{\"name\":\"Eastern Caribbean dollar\",\"symbol\":\"$\"}}'),
(5,'Åland Islands','Åland Islands','AX','ALA','🇦🇽',60.11666700,19.90000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(6,'Albania','Republic of Albania','AL','ALB','🇦🇱',41.00000000,20.00000000,'{\"ALL\":{\"name\":\"Albanian lek\",\"symbol\":\"L\"}}'),
(7,'Andorra','Principality of Andorra','AD','AND','🇦🇩',42.50000000,1.50000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(8,'United Arab Emirates','United Arab Emirates','AE','ARE','🇦🇪',24.00000000,54.00000000,'{\"AED\":{\"name\":\"United Arab Emirates dirham\",\"symbol\":\"\\u062f.\\u0625\"}}'),
(9,'Argentina','Argentine Republic','AR','ARG','🇦🇷',-34.00000000,-64.00000000,'{\"ARS\":{\"name\":\"Argentine peso\",\"symbol\":\"$\"}}'),
(10,'Armenia','Republic of Armenia','AM','ARM','🇦🇲',40.00000000,45.00000000,'{\"AMD\":{\"name\":\"Armenian dram\",\"symbol\":\"\\u058f\"}}'),
(11,'American Samoa','American Samoa','AS','ASM','🇦🇸',-14.33333333,-170.00000000,'{\"USD\":{\"name\":\"United States dollar\",\"symbol\":\"$\"}}'),
(12,'Antarctica','Antarctica','AQ','ATA','🇦🇶',-90.00000000,0.00000000,'[]'),
(13,'French Southern and Antarctic Lands','Territory of the French Southern and Antarctic Lands','TF','ATF','🇹🇫',-49.25000000,69.16700000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(14,'Antigua and Barbuda','Antigua and Barbuda','AG','ATG','🇦🇬',17.05000000,-61.80000000,'{\"XCD\":{\"name\":\"Eastern Caribbean dollar\",\"symbol\":\"$\"}}'),
(15,'Australia','Commonwealth of Australia','AU','AUS','🇦🇺',-27.00000000,133.00000000,'{\"AUD\":{\"name\":\"Australian dollar\",\"symbol\":\"$\"}}'),
(16,'Austria','Republic of Austria','AT','AUT','🇦🇹',47.33333333,13.33333333,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(17,'Azerbaijan','Republic of Azerbaijan','AZ','AZE','🇦🇿',40.50000000,47.50000000,'{\"AZN\":{\"name\":\"Azerbaijani manat\",\"symbol\":\"\\u20bc\"}}'),
(18,'Burundi','Republic of Burundi','BI','BDI','🇧🇮',-3.50000000,30.00000000,'{\"BIF\":{\"name\":\"Burundian franc\",\"symbol\":\"Fr\"}}'),
(19,'Belgium','Kingdom of Belgium','BE','BEL','🇧🇪',50.83333333,4.00000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(20,'Benin','Republic of Benin','BJ','BEN','🇧🇯',9.50000000,2.25000000,'{\"XOF\":{\"name\":\"West African CFA franc\",\"symbol\":\"Fr\"}}'),
(21,'Burkina Faso','Burkina Faso','BF','BFA','🇧🇫',13.00000000,-2.00000000,'{\"XOF\":{\"name\":\"West African CFA franc\",\"symbol\":\"Fr\"}}'),
(22,'Bangladesh','People\'s Republic of Bangladesh','BD','BGD','🇧🇩',24.00000000,90.00000000,'{\"BDT\":{\"name\":\"Bangladeshi taka\",\"symbol\":\"\\u09f3\"}}'),
(23,'Bulgaria','Republic of Bulgaria','BG','BGR','🇧🇬',43.00000000,25.00000000,'{\"BGN\":{\"name\":\"Bulgarian lev\",\"symbol\":\"\\u043b\\u0432\"}}'),
(24,'Bahrain','Kingdom of Bahrain','BH','BHR','🇧🇭',26.00000000,50.55000000,'{\"BHD\":{\"name\":\"Bahraini dinar\",\"symbol\":\".\\u062f.\\u0628\"}}'),
(25,'Bahamas','Commonwealth of the Bahamas','BS','BHS','🇧🇸',24.25000000,-76.00000000,'{\"BSD\":{\"name\":\"Bahamian dollar\",\"symbol\":\"$\"},\"USD\":{\"name\":\"United States dollar\",\"symbol\":\"$\"}}'),
(26,'Bosnia and Herzegovina','Bosnia and Herzegovina','BA','BIH','🇧🇦',44.00000000,18.00000000,'{\"BAM\":{\"name\":\"Bosnia and Herzegovina convertible mark\",\"symbol\":\"\"}}'),
(27,'Saint Barthélemy','Collectivity of Saint Barthélemy','BL','BLM','🇧🇱',18.50000000,-63.41666666,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(28,'Saint Helena, Ascension and Tristan da Cunha','Saint Helena, Ascension and Tristan da Cunha','SH','SHN','🇸🇭',-15.95000000,-5.72000000,'{\"GBP\":{\"name\":\"Pound sterling\",\"symbol\":\"\\u00a3\"},\"SHP\":{\"name\":\"Saint Helena pound\",\"symbol\":\"\\u00a3\"}}'),
(29,'Belarus','Republic of Belarus','BY','BLR','🇧🇾',53.00000000,28.00000000,'{\"BYN\":{\"name\":\"Belarusian ruble\",\"symbol\":\"Br\"}}'),
(30,'Belize','Belize','BZ','BLZ','🇧🇿',17.25000000,-88.75000000,'{\"BZD\":{\"name\":\"Belize dollar\",\"symbol\":\"$\"}}'),
(31,'Bermuda','Bermuda','BM','BMU','🇧🇲',32.33333333,-64.75000000,'{\"BMD\":{\"name\":\"Bermudian dollar\",\"symbol\":\"$\"}}'),
(32,'Bolivia','Plurinational State of Bolivia','BO','BOL','🇧🇴',-17.00000000,-65.00000000,'{\"BOB\":{\"name\":\"Bolivian boliviano\",\"symbol\":\"Bs.\"}}'),
(33,'Caribbean Netherlands','Bonaire, Sint Eustatius and Saba','BQ','BES','',12.18000000,-68.25000000,'{\"USD\":{\"name\":\"United States dollar\",\"symbol\":\"$\"}}'),
(34,'Brazil','Federative Republic of Brazil','BR','BRA','🇧🇷',-10.00000000,-55.00000000,'{\"BRL\":{\"name\":\"Brazilian real\",\"symbol\":\"R$\"}}'),
(35,'Barbados','Barbados','BB','BRB','🇧🇧',13.16666666,-59.53333333,'{\"BBD\":{\"name\":\"Barbadian dollar\",\"symbol\":\"$\"}}'),
(36,'Brunei','Nation of Brunei, Abode of Peace','BN','BRN','🇧🇳',4.50000000,114.66666666,'{\"BND\":{\"name\":\"Brunei dollar\",\"symbol\":\"$\"},\"SGD\":{\"name\":\"Singapore dollar\",\"symbol\":\"$\"}}'),
(37,'Bhutan','Kingdom of Bhutan','BT','BTN','🇧🇹',27.50000000,90.50000000,'{\"BTN\":{\"name\":\"Bhutanese ngultrum\",\"symbol\":\"Nu.\"},\"INR\":{\"name\":\"Indian rupee\",\"symbol\":\"\\u20b9\"}}'),
(38,'Bouvet Island','Bouvet Island','BV','BVT','🇧🇻',-54.43333333,3.40000000,'[]'),
(39,'Botswana','Republic of Botswana','BW','BWA','🇧🇼',-22.00000000,24.00000000,'{\"BWP\":{\"name\":\"Botswana pula\",\"symbol\":\"P\"}}'),
(40,'Central African Republic','Central African Republic','CF','CAF','🇨🇫',7.00000000,21.00000000,'{\"XAF\":{\"name\":\"Central African CFA franc\",\"symbol\":\"Fr\"}}'),
(41,'Canada','Canada','CA','CAN','🇨🇦',60.00000000,-95.00000000,'{\"CAD\":{\"name\":\"Canadian dollar\",\"symbol\":\"$\"}}'),
(42,'Cocos (Keeling) Islands','Territory of the Cocos (Keeling) Islands','CC','CCK','🇨🇨',-12.50000000,96.83333333,'{\"AUD\":{\"name\":\"Australian dollar\",\"symbol\":\"$\"}}'),
(43,'Switzerland','Swiss Confederation','CH','CHE','🇨🇭',47.00000000,8.00000000,'{\"CHF\":{\"name\":\"Swiss franc\",\"symbol\":\"Fr.\"}}'),
(44,'Chile','Republic of Chile','CL','CHL','🇨🇱',-30.00000000,-71.00000000,'{\"CLP\":{\"name\":\"Chilean peso\",\"symbol\":\"$\"}}'),
(45,'China','People\'s Republic of China','CN','CHN','🇨🇳',35.00000000,105.00000000,'{\"CNY\":{\"name\":\"Chinese yuan\",\"symbol\":\"\\u00a5\"}}'),
(46,'Ivory Coast','Republic of Côte d\'Ivoire','CI','CIV','🇨🇮',8.00000000,-5.00000000,'{\"XOF\":{\"name\":\"West African CFA franc\",\"symbol\":\"Fr\"}}'),
(47,'Cameroon','Republic of Cameroon','CM','CMR','🇨🇲',6.00000000,12.00000000,'{\"XAF\":{\"name\":\"Central African CFA franc\",\"symbol\":\"Fr\"}}'),
(48,'DR Congo','Democratic Republic of the Congo','CD','COD','🇨🇩',0.00000000,25.00000000,'{\"CDF\":{\"name\":\"Congolese franc\",\"symbol\":\"FC\"}}'),
(49,'Republic of the Congo','Republic of the Congo','CG','COG','🇨🇬',-1.00000000,15.00000000,'{\"XAF\":{\"name\":\"Central African CFA franc\",\"symbol\":\"Fr\"}}'),
(50,'Cook Islands','Cook Islands','CK','COK','🇨🇰',-21.23333333,-159.76666666,'{\"CKD\":{\"name\":\"Cook Islands dollar\",\"symbol\":\"$\"},\"NZD\":{\"name\":\"New Zealand dollar\",\"symbol\":\"$\"}}'),
(51,'Colombia','Republic of Colombia','CO','COL','🇨🇴',4.00000000,-72.00000000,'{\"COP\":{\"name\":\"Colombian peso\",\"symbol\":\"$\"}}'),
(52,'Comoros','Union of the Comoros','KM','COM','🇰🇲',-12.16666666,44.25000000,'{\"KMF\":{\"name\":\"Comorian franc\",\"symbol\":\"Fr\"}}'),
(53,'Cape Verde','Republic of Cabo Verde','CV','CPV','🇨🇻',16.00000000,-24.00000000,'{\"CVE\":{\"name\":\"Cape Verdean escudo\",\"symbol\":\"Esc\"}}'),
(54,'Costa Rica','Republic of Costa Rica','CR','CRI','🇨🇷',10.00000000,-84.00000000,'{\"CRC\":{\"name\":\"Costa Rican col\\u00f3n\",\"symbol\":\"\\u20a1\"}}'),
(55,'Cuba','Republic of Cuba','CU','CUB','🇨🇺',21.50000000,-80.00000000,'{\"CUC\":{\"name\":\"Cuban convertible peso\",\"symbol\":\"$\"},\"CUP\":{\"name\":\"Cuban peso\",\"symbol\":\"$\"}}'),
(56,'Curaçao','Country of Curaçao','CW','CUW','🇨🇼',12.11666700,-68.93333300,'{\"ANG\":{\"name\":\"Netherlands Antillean guilder\",\"symbol\":\"\\u0192\"}}'),
(57,'Christmas Island','Territory of Christmas Island','CX','CXR','🇨🇽',-10.50000000,105.66666666,'{\"AUD\":{\"name\":\"Australian dollar\",\"symbol\":\"$\"}}'),
(58,'Cayman Islands','Cayman Islands','KY','CYM','🇰🇾',19.50000000,-80.50000000,'{\"KYD\":{\"name\":\"Cayman Islands dollar\",\"symbol\":\"$\"}}'),
(59,'Cyprus','Republic of Cyprus','CY','CYP','🇨🇾',35.00000000,33.00000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(60,'Czechia','Czech Republic','CZ','CZE','🇨🇿',49.75000000,15.50000000,'{\"CZK\":{\"name\":\"Czech koruna\",\"symbol\":\"K\\u010d\"}}'),
(61,'Germany','Federal Republic of Germany','DE','DEU','🇩🇪',51.00000000,9.00000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(62,'Djibouti','Republic of Djibouti','DJ','DJI','🇩🇯',11.50000000,43.00000000,'{\"DJF\":{\"name\":\"Djiboutian franc\",\"symbol\":\"Fr\"}}'),
(63,'Dominica','Commonwealth of Dominica','DM','DMA','🇩🇲',15.41666666,-61.33333333,'{\"XCD\":{\"name\":\"Eastern Caribbean dollar\",\"symbol\":\"$\"}}'),
(64,'Denmark','Kingdom of Denmark','DK','DNK','🇩🇰',56.00000000,10.00000000,'{\"DKK\":{\"name\":\"Danish krone\",\"symbol\":\"kr\"}}'),
(65,'Dominican Republic','Dominican Republic','DO','DOM','🇩🇴',19.00000000,-70.66666666,'{\"DOP\":{\"name\":\"Dominican peso\",\"symbol\":\"$\"}}'),
(66,'Algeria','People\'s Democratic Republic of Algeria','DZ','DZA','🇩🇿',28.00000000,3.00000000,'{\"DZD\":{\"name\":\"Algerian dinar\",\"symbol\":\"\\u062f.\\u062c\"}}'),
(67,'Ecuador','Republic of Ecuador','EC','ECU','🇪🇨',-2.00000000,-77.50000000,'{\"USD\":{\"name\":\"United States dollar\",\"symbol\":\"$\"}}'),
(68,'Egypt','Arab Republic of Egypt','EG','EGY','🇪🇬',27.00000000,30.00000000,'{\"EGP\":{\"name\":\"Egyptian pound\",\"symbol\":\"\\u00a3\"}}'),
(69,'Eritrea','State of Eritrea','ER','ERI','🇪🇷',15.00000000,39.00000000,'{\"ERN\":{\"name\":\"Eritrean nakfa\",\"symbol\":\"Nfk\"}}'),
(70,'Western Sahara','Sahrawi Arab Democratic Republic','EH','ESH','🇪🇭',24.50000000,-13.00000000,'{\"DZD\":{\"name\":\"Algerian dinar\",\"symbol\":\"\\u062f\\u062c\"},\"MAD\":{\"name\":\"Moroccan dirham\",\"symbol\":\"DH\"},\"MRU\":{\"name\":\"Mauritanian ouguiya\",\"symbol\":\"UM\"}}'),
(71,'Spain','Kingdom of Spain','ES','ESP','🇪🇸',40.00000000,-4.00000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(72,'Estonia','Republic of Estonia','EE','EST','🇪🇪',59.00000000,26.00000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(73,'Ethiopia','Federal Democratic Republic of Ethiopia','ET','ETH','🇪🇹',8.00000000,38.00000000,'{\"ETB\":{\"name\":\"Ethiopian birr\",\"symbol\":\"Br\"}}'),
(74,'Finland','Republic of Finland','FI','FIN','🇫🇮',64.00000000,26.00000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(75,'Fiji','Republic of Fiji','FJ','FJI','🇫🇯',-18.00000000,175.00000000,'{\"FJD\":{\"name\":\"Fijian dollar\",\"symbol\":\"$\"}}'),
(76,'Falkland Islands','Falkland Islands','FK','FLK','🇫🇰',-51.75000000,-59.00000000,'{\"FKP\":{\"name\":\"Falkland Islands pound\",\"symbol\":\"\\u00a3\"}}'),
(77,'France','French Republic','FR','FRA','🇫🇷',46.00000000,2.00000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(78,'Faroe Islands','Faroe Islands','FO','FRO','🇫🇴',62.00000000,-7.00000000,'{\"DKK\":{\"name\":\"Danish krone\",\"symbol\":\"kr\"},\"FOK\":{\"name\":\"Faroese kr\\u00f3na\",\"symbol\":\"kr\"}}'),
(79,'Micronesia','Federated States of Micronesia','FM','FSM','🇫🇲',6.91666666,158.25000000,'[]'),
(80,'Gabon','Gabonese Republic','GA','GAB','🇬🇦',-1.00000000,11.75000000,'{\"XAF\":{\"name\":\"Central African CFA franc\",\"symbol\":\"Fr\"}}'),
(81,'United Kingdom','United Kingdom of Great Britain and Northern Ireland','GB','GBR','🇬🇧',54.00000000,-2.00000000,'{\"GBP\":{\"name\":\"British pound\",\"symbol\":\"\\u00a3\"}}'),
(82,'Georgia','Georgia','GE','GEO','🇬🇪',42.00000000,43.50000000,'{\"GEL\":{\"name\":\"lari\",\"symbol\":\"\\u20be\"}}'),
(83,'Guernsey','Bailiwick of Guernsey','GG','GGY','🇬🇬',49.46666666,-2.58333333,'{\"GBP\":{\"name\":\"British pound\",\"symbol\":\"\\u00a3\"},\"GGP\":{\"name\":\"Guernsey pound\",\"symbol\":\"\\u00a3\"}}'),
(84,'Ghana','Republic of Ghana','GH','GHA','🇬🇭',8.00000000,-2.00000000,'{\"GHS\":{\"name\":\"Ghanaian cedi\",\"symbol\":\"\\u20b5\"}}'),
(85,'Gibraltar','Gibraltar','GI','GIB','🇬🇮',36.13333333,-5.35000000,'{\"GIP\":{\"name\":\"Gibraltar pound\",\"symbol\":\"\\u00a3\"}}'),
(86,'Guinea','Republic of Guinea','GN','GIN','🇬🇳',11.00000000,-10.00000000,'{\"GNF\":{\"name\":\"Guinean franc\",\"symbol\":\"Fr\"}}'),
(87,'Guadeloupe','Guadeloupe','GP','GLP','🇬🇵',16.25000000,-61.58333300,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(88,'Gambia','Republic of the Gambia','GM','GMB','🇬🇲',13.46666666,-16.56666666,'{\"GMD\":{\"name\":\"dalasi\",\"symbol\":\"D\"}}'),
(89,'Guinea-Bissau','Republic of Guinea-Bissau','GW','GNB','🇬🇼',12.00000000,-15.00000000,'{\"XOF\":{\"name\":\"West African CFA franc\",\"symbol\":\"Fr\"}}'),
(90,'Equatorial Guinea','Republic of Equatorial Guinea','GQ','GNQ','🇬🇶',2.00000000,10.00000000,'{\"XAF\":{\"name\":\"Central African CFA franc\",\"symbol\":\"Fr\"}}'),
(91,'Greece','Hellenic Republic','GR','GRC','🇬🇷',39.00000000,22.00000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(92,'Grenada','Grenada','GD','GRD','🇬🇩',12.11666666,-61.66666666,'{\"XCD\":{\"name\":\"Eastern Caribbean dollar\",\"symbol\":\"$\"}}'),
(93,'Greenland','Greenland','GL','GRL','🇬🇱',72.00000000,-40.00000000,'{\"DKK\":{\"name\":\"krone\",\"symbol\":\"kr.\"}}'),
(94,'Guatemala','Republic of Guatemala','GT','GTM','🇬🇹',15.50000000,-90.25000000,'{\"GTQ\":{\"name\":\"Guatemalan quetzal\",\"symbol\":\"Q\"}}'),
(95,'French Guiana','Guiana','GF','GUF','🇬🇫',4.00000000,-53.00000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(96,'Guam','Guam','GU','GUM','🇬🇺',13.46666666,144.78333333,'{\"USD\":{\"name\":\"United States dollar\",\"symbol\":\"$\"}}'),
(97,'Guyana','Co-operative Republic of Guyana','GY','GUY','🇬🇾',5.00000000,-59.00000000,'{\"GYD\":{\"name\":\"Guyanese dollar\",\"symbol\":\"$\"}}'),
(98,'Hong Kong','Hong Kong Special Administrative Region of the People\'s Republic of China','HK','HKG','🇭🇰',22.26700000,114.18800000,'{\"HKD\":{\"name\":\"Hong Kong dollar\",\"symbol\":\"$\"}}'),
(99,'Heard Island and McDonald Islands','Heard Island and McDonald Islands','HM','HMD','🇭🇲',-53.10000000,72.51666666,'[]'),
(100,'Honduras','Republic of Honduras','HN','HND','🇭🇳',15.00000000,-86.50000000,'{\"HNL\":{\"name\":\"Honduran lempira\",\"symbol\":\"L\"}}'),
(101,'Croatia','Republic of Croatia','HR','HRV','🇭🇷',45.16666666,15.50000000,'{\"HRK\":{\"name\":\"Croatian kuna\",\"symbol\":\"kn\"}}'),
(102,'Haiti','Republic of Haiti','HT','HTI','🇭🇹',19.00000000,-72.41666666,'{\"HTG\":{\"name\":\"Haitian gourde\",\"symbol\":\"G\"}}'),
(103,'Hungary','Hungary','HU','HUN','🇭🇺',47.00000000,20.00000000,'{\"HUF\":{\"name\":\"Hungarian forint\",\"symbol\":\"Ft\"}}'),
(104,'Indonesia','Republic of Indonesia','ID','IDN','🇮🇩',-5.00000000,120.00000000,'{\"IDR\":{\"name\":\"Indonesian rupiah\",\"symbol\":\"Rp\"}}'),
(105,'Isle of Man','Isle of Man','IM','IMN','🇮🇲',54.25000000,-4.50000000,'{\"GBP\":{\"name\":\"British pound\",\"symbol\":\"\\u00a3\"},\"IMP\":{\"name\":\"Manx pound\",\"symbol\":\"\\u00a3\"}}'),
(106,'India','Republic of India','IN','IND','🇮🇳',20.00000000,77.00000000,'{\"INR\":{\"name\":\"Indian rupee\",\"symbol\":\"\\u20b9\"}}'),
(107,'British Indian Ocean Territory','British Indian Ocean Territory','IO','IOT','🇮🇴',-6.00000000,71.50000000,'{\"USD\":{\"name\":\"United States dollar\",\"symbol\":\"$\"}}'),
(108,'Ireland','Republic of Ireland','IE','IRL','🇮🇪',53.00000000,-8.00000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(109,'Iran','Islamic Republic of Iran','IR','IRN','🇮🇷',32.00000000,53.00000000,'{\"IRR\":{\"name\":\"Iranian rial\",\"symbol\":\"\\ufdfc\"}}'),
(110,'Iraq','Republic of Iraq','IQ','IRQ','🇮🇶',33.00000000,44.00000000,'{\"IQD\":{\"name\":\"Iraqi dinar\",\"symbol\":\"\\u0639.\\u062f\"}}'),
(111,'Iceland','Iceland','IS','ISL','🇮🇸',65.00000000,-18.00000000,'{\"ISK\":{\"name\":\"Icelandic kr\\u00f3na\",\"symbol\":\"kr\"}}'),
(112,'Israel','State of Israel','IL','ISR','🇮🇱',31.47000000,35.13000000,'{\"ILS\":{\"name\":\"Israeli new shekel\",\"symbol\":\"\\u20aa\"}}'),
(113,'Italy','Italian Republic','IT','ITA','🇮🇹',42.83333333,12.83333333,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(114,'Jamaica','Jamaica','JM','JAM','🇯🇲',18.25000000,-77.50000000,'{\"JMD\":{\"name\":\"Jamaican dollar\",\"symbol\":\"$\"}}'),
(115,'Jersey','Bailiwick of Jersey','JE','JEY','🇯🇪',49.25000000,-2.16666666,'{\"GBP\":{\"name\":\"British pound\",\"symbol\":\"\\u00a3\"},\"JEP\":{\"name\":\"Jersey pound\",\"symbol\":\"\\u00a3\"}}'),
(116,'Jordan','Hashemite Kingdom of Jordan','JO','JOR','🇯🇴',31.00000000,36.00000000,'{\"JOD\":{\"name\":\"Jordanian dinar\",\"symbol\":\"\\u062f.\\u0627\"}}'),
(117,'Japan','Japan','JP','JPN','🇯🇵',36.00000000,138.00000000,'{\"JPY\":{\"name\":\"Japanese yen\",\"symbol\":\"\\u00a5\"}}'),
(118,'Kazakhstan','Republic of Kazakhstan','KZ','KAZ','🇰🇿',48.00000000,68.00000000,'{\"KZT\":{\"name\":\"Kazakhstani tenge\",\"symbol\":\"\\u20b8\"}}'),
(119,'Kenya','Republic of Kenya','KE','KEN','🇰🇪',1.00000000,38.00000000,'{\"KES\":{\"name\":\"Kenyan shilling\",\"symbol\":\"Sh\"}}'),
(120,'Kyrgyzstan','Kyrgyz Republic','KG','KGZ','🇰🇬',41.00000000,75.00000000,'{\"KGS\":{\"name\":\"Kyrgyzstani som\",\"symbol\":\"\\u0441\"}}'),
(121,'Cambodia','Kingdom of Cambodia','KH','KHM','🇰🇭',13.00000000,105.00000000,'{\"KHR\":{\"name\":\"Cambodian riel\",\"symbol\":\"\\u17db\"},\"USD\":{\"name\":\"United States dollar\",\"symbol\":\"$\"}}'),
(122,'Kiribati','Independent and Sovereign Republic of Kiribati','KI','KIR','🇰🇮',1.41666666,173.00000000,'{\"AUD\":{\"name\":\"Australian dollar\",\"symbol\":\"$\"},\"KID\":{\"name\":\"Kiribati dollar\",\"symbol\":\"$\"}}'),
(123,'Saint Kitts and Nevis','Federation of Saint Christopher and Nevis','KN','KNA','🇰🇳',17.33333333,-62.75000000,'{\"XCD\":{\"name\":\"Eastern Caribbean dollar\",\"symbol\":\"$\"}}'),
(124,'South Korea','Republic of Korea','KR','KOR','🇰🇷',37.00000000,127.50000000,'{\"KRW\":{\"name\":\"South Korean won\",\"symbol\":\"\\u20a9\"}}'),
(125,'Kosovo','Republic of Kosovo','XK','UNK','🇽🇰',42.66666700,21.16666700,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(126,'Kuwait','State of Kuwait','KW','KWT','🇰🇼',29.50000000,45.75000000,'{\"KWD\":{\"name\":\"Kuwaiti dinar\",\"symbol\":\"\\u062f.\\u0643\"}}'),
(127,'Laos','Lao People\'s Democratic Republic','LA','LAO','🇱🇦',18.00000000,105.00000000,'{\"LAK\":{\"name\":\"Lao kip\",\"symbol\":\"\\u20ad\"}}'),
(128,'Lebanon','Lebanese Republic','LB','LBN','🇱🇧',33.83333333,35.83333333,'{\"LBP\":{\"name\":\"Lebanese pound\",\"symbol\":\"\\u0644.\\u0644\"}}'),
(129,'Liberia','Republic of Liberia','LR','LBR','🇱🇷',6.50000000,-9.50000000,'{\"LRD\":{\"name\":\"Liberian dollar\",\"symbol\":\"$\"}}'),
(130,'Libya','State of Libya','LY','LBY','🇱🇾',25.00000000,17.00000000,'{\"LYD\":{\"name\":\"Libyan dinar\",\"symbol\":\"\\u0644.\\u062f\"}}'),
(131,'Saint Lucia','Saint Lucia','LC','LCA','🇱🇨',13.88333333,-60.96666666,'{\"XCD\":{\"name\":\"Eastern Caribbean dollar\",\"symbol\":\"$\"}}'),
(132,'Liechtenstein','Principality of Liechtenstein','LI','LIE','🇱🇮',47.26666666,9.53333333,'{\"CHF\":{\"name\":\"Swiss franc\",\"symbol\":\"Fr\"}}'),
(133,'Sri Lanka','Democratic Socialist Republic of Sri Lanka','LK','LKA','🇱🇰',7.00000000,81.00000000,'{\"LKR\":{\"name\":\"Sri Lankan rupee\",\"symbol\":\"Rs  \\u0dbb\\u0dd4\"}}'),
(134,'Lesotho','Kingdom of Lesotho','LS','LSO','🇱🇸',-29.50000000,28.50000000,'{\"LSL\":{\"name\":\"Lesotho loti\",\"symbol\":\"L\"},\"ZAR\":{\"name\":\"South African rand\",\"symbol\":\"R\"}}'),
(135,'Lithuania','Republic of Lithuania','LT','LTU','🇱🇹',56.00000000,24.00000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(136,'Luxembourg','Grand Duchy of Luxembourg','LU','LUX','🇱🇺',49.75000000,6.16666666,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(137,'Latvia','Republic of Latvia','LV','LVA','🇱🇻',57.00000000,25.00000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(138,'Macau','Macao Special Administrative Region of the People\'s Republic of China','MO','MAC','🇲🇴',22.16666666,113.55000000,'{\"MOP\":{\"name\":\"Macanese pataca\",\"symbol\":\"P\"}}'),
(139,'Saint Martin','Saint Martin','MF','MAF','🇲🇫',18.08333333,-63.95000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(140,'Morocco','Kingdom of Morocco','MA','MAR','🇲🇦',32.00000000,-5.00000000,'{\"MAD\":{\"name\":\"Moroccan dirham\",\"symbol\":\"\\u062f.\\u0645.\"}}'),
(141,'Monaco','Principality of Monaco','MC','MCO','🇲🇨',43.73333333,7.40000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(142,'Moldova','Republic of Moldova','MD','MDA','🇲🇩',47.00000000,29.00000000,'{\"MDL\":{\"name\":\"Moldovan leu\",\"symbol\":\"L\"}}'),
(143,'Madagascar','Republic of Madagascar','MG','MDG','🇲🇬',-20.00000000,47.00000000,'{\"MGA\":{\"name\":\"Malagasy ariary\",\"symbol\":\"Ar\"}}'),
(144,'Maldives','Republic of the Maldives','MV','MDV','🇲🇻',3.25000000,73.00000000,'{\"MVR\":{\"name\":\"Maldivian rufiyaa\",\"symbol\":\".\\u0783\"}}'),
(145,'Mexico','United Mexican States','MX','MEX','🇲🇽',23.00000000,-102.00000000,'{\"MXN\":{\"name\":\"Mexican peso\",\"symbol\":\"$\"}}'),
(146,'Marshall Islands','Republic of the Marshall Islands','MH','MHL','🇲🇭',9.00000000,168.00000000,'{\"USD\":{\"name\":\"United States dollar\",\"symbol\":\"$\"}}'),
(147,'North Macedonia','Republic of North Macedonia','MK','MKD','🇲🇰',41.83333333,22.00000000,'{\"MKD\":{\"name\":\"denar\",\"symbol\":\"den\"}}'),
(148,'Mali','Republic of Mali','ML','MLI','🇲🇱',17.00000000,-4.00000000,'{\"XOF\":{\"name\":\"West African CFA franc\",\"symbol\":\"Fr\"}}'),
(149,'Malta','Republic of Malta','MT','MLT','🇲🇹',35.83333333,14.58333333,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(150,'Myanmar','Republic of the Union of Myanmar','MM','MMR','🇲🇲',22.00000000,98.00000000,'{\"MMK\":{\"name\":\"Burmese kyat\",\"symbol\":\"Ks\"}}'),
(151,'Montenegro','Montenegro','ME','MNE','🇲🇪',42.50000000,19.30000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(152,'Mongolia','Mongolia','MN','MNG','🇲🇳',46.00000000,105.00000000,'{\"MNT\":{\"name\":\"Mongolian t\\u00f6gr\\u00f6g\",\"symbol\":\"\\u20ae\"}}'),
(153,'Northern Mariana Islands','Commonwealth of the Northern Mariana Islands','MP','MNP','🇲🇵',15.20000000,145.75000000,'{\"USD\":{\"name\":\"United States dollar\",\"symbol\":\"$\"}}'),
(154,'Mozambique','Republic of Mozambique','MZ','MOZ','🇲🇿',-18.25000000,35.00000000,'{\"MZN\":{\"name\":\"Mozambican metical\",\"symbol\":\"MT\"}}'),
(155,'Mauritania','Islamic Republic of Mauritania','MR','MRT','🇲🇷',20.00000000,-12.00000000,'{\"MRU\":{\"name\":\"Mauritanian ouguiya\",\"symbol\":\"UM\"}}'),
(156,'Montserrat','Montserrat','MS','MSR','🇲🇸',16.75000000,-62.20000000,'{\"XCD\":{\"name\":\"Eastern Caribbean dollar\",\"symbol\":\"$\"}}'),
(157,'Martinique','Martinique','MQ','MTQ','🇲🇶',14.66666700,-61.00000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(158,'Mauritius','Republic of Mauritius','MU','MUS','🇲🇺',-20.28333333,57.55000000,'{\"MUR\":{\"name\":\"Mauritian rupee\",\"symbol\":\"\\u20a8\"}}'),
(159,'Malawi','Republic of Malawi','MW','MWI','🇲🇼',-13.50000000,34.00000000,'{\"MWK\":{\"name\":\"Malawian kwacha\",\"symbol\":\"MK\"}}'),
(160,'Malaysia','Malaysia','MY','MYS','🇲🇾',2.50000000,112.50000000,'{\"MYR\":{\"name\":\"Malaysian ringgit\",\"symbol\":\"RM\"}}'),
(161,'Mayotte','Department of Mayotte','YT','MYT','🇾🇹',-12.83333333,45.16666666,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(162,'Namibia','Republic of Namibia','NA','NAM','🇳🇦',-22.00000000,17.00000000,'{\"NAD\":{\"name\":\"Namibian dollar\",\"symbol\":\"$\"},\"ZAR\":{\"name\":\"South African rand\",\"symbol\":\"R\"}}'),
(163,'New Caledonia','New Caledonia','NC','NCL','🇳🇨',-21.50000000,165.50000000,'{\"XPF\":{\"name\":\"CFP franc\",\"symbol\":\"\\u20a3\"}}'),
(164,'Niger','Republic of Niger','NE','NER','🇳🇪',16.00000000,8.00000000,'{\"XOF\":{\"name\":\"West African CFA franc\",\"symbol\":\"Fr\"}}'),
(165,'Norfolk Island','Territory of Norfolk Island','NF','NFK','🇳🇫',-29.03333333,167.95000000,'{\"AUD\":{\"name\":\"Australian dollar\",\"symbol\":\"$\"}}'),
(166,'Nigeria','Federal Republic of Nigeria','NG','NGA','🇳🇬',10.00000000,8.00000000,'{\"NGN\":{\"name\":\"Nigerian naira\",\"symbol\":\"\\u20a6\"}}'),
(167,'Nicaragua','Republic of Nicaragua','NI','NIC','🇳🇮',13.00000000,-85.00000000,'{\"NIO\":{\"name\":\"Nicaraguan c\\u00f3rdoba\",\"symbol\":\"C$\"}}'),
(168,'Niue','Niue','NU','NIU','🇳🇺',-19.03333333,-169.86666666,'{\"NZD\":{\"name\":\"New Zealand dollar\",\"symbol\":\"$\"}}'),
(169,'Netherlands','Kingdom of the Netherlands','NL','NLD','🇳🇱',52.50000000,5.75000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(170,'Norway','Kingdom of Norway','NO','NOR','🇳🇴',62.00000000,10.00000000,'{\"NOK\":{\"name\":\"Norwegian krone\",\"symbol\":\"kr\"}}'),
(171,'Nepal','Federal Democratic Republic of Nepal','NP','NPL','🇳🇵',28.00000000,84.00000000,'{\"NPR\":{\"name\":\"Nepalese rupee\",\"symbol\":\"\\u20a8\"}}'),
(172,'Nauru','Republic of Nauru','NR','NRU','🇳🇷',-0.53333333,166.91666666,'{\"AUD\":{\"name\":\"Australian dollar\",\"symbol\":\"$\"}}'),
(173,'New Zealand','New Zealand','NZ','NZL','🇳🇿',-41.00000000,174.00000000,'{\"NZD\":{\"name\":\"New Zealand dollar\",\"symbol\":\"$\"}}'),
(174,'Oman','Sultanate of Oman','OM','OMN','🇴🇲',21.00000000,57.00000000,'{\"OMR\":{\"name\":\"Omani rial\",\"symbol\":\"\\u0631.\\u0639.\"}}'),
(175,'Pakistan','Islamic Republic of Pakistan','PK','PAK','🇵🇰',30.00000000,70.00000000,'{\"PKR\":{\"name\":\"Pakistani rupee\",\"symbol\":\"\\u20a8\"}}'),
(176,'Panama','Republic of Panama','PA','PAN','🇵🇦',9.00000000,-80.00000000,'{\"PAB\":{\"name\":\"Panamanian balboa\",\"symbol\":\"B\\/.\"},\"USD\":{\"name\":\"United States dollar\",\"symbol\":\"$\"}}'),
(177,'Pitcairn Islands','Pitcairn Group of Islands','PN','PCN','🇵🇳',-25.06666666,-130.10000000,'{\"NZD\":{\"name\":\"New Zealand dollar\",\"symbol\":\"$\"}}'),
(178,'Peru','Republic of Peru','PE','PER','🇵🇪',-10.00000000,-76.00000000,'{\"PEN\":{\"name\":\"Peruvian sol\",\"symbol\":\"S\\/.\"}}'),
(179,'Philippines','Republic of the Philippines','PH','PHL','🇵🇭',13.00000000,122.00000000,'{\"PHP\":{\"name\":\"Philippine peso\",\"symbol\":\"\\u20b1\"}}'),
(180,'Palau','Republic of Palau','PW','PLW','🇵🇼',7.50000000,134.50000000,'{\"USD\":{\"name\":\"United States dollar\",\"symbol\":\"$\"}}'),
(181,'Papua New Guinea','Independent State of Papua New Guinea','PG','PNG','🇵🇬',-6.00000000,147.00000000,'{\"PGK\":{\"name\":\"Papua New Guinean kina\",\"symbol\":\"K\"}}'),
(182,'Poland','Republic of Poland','PL','POL','🇵🇱',52.00000000,20.00000000,'{\"PLN\":{\"name\":\"Polish z\\u0142oty\",\"symbol\":\"z\\u0142\"}}'),
(183,'Puerto Rico','Commonwealth of Puerto Rico','PR','PRI','🇵🇷',18.25000000,-66.50000000,'{\"USD\":{\"name\":\"United States dollar\",\"symbol\":\"$\"}}'),
(184,'North Korea','Democratic People\'s Republic of Korea','KP','PRK','🇰🇵',40.00000000,127.00000000,'{\"KPW\":{\"name\":\"North Korean won\",\"symbol\":\"\\u20a9\"}}'),
(185,'Portugal','Portuguese Republic','PT','PRT','🇵🇹',39.50000000,-8.00000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(186,'Paraguay','Republic of Paraguay','PY','PRY','🇵🇾',-23.00000000,-58.00000000,'{\"PYG\":{\"name\":\"Paraguayan guaran\\u00ed\",\"symbol\":\"\\u20b2\"}}'),
(187,'Palestine','State of Palestine','PS','PSE','🇵🇸',31.90000000,35.20000000,'{\"EGP\":{\"name\":\"Egyptian pound\",\"symbol\":\"E\\u00a3\"},\"ILS\":{\"name\":\"Israeli new shekel\",\"symbol\":\"\\u20aa\"},\"JOD\":{\"name\":\"Jordanian dinar\",\"symbol\":\"JD\"}}'),
(188,'French Polynesia','French Polynesia','PF','PYF','🇵🇫',-15.00000000,-140.00000000,'{\"XPF\":{\"name\":\"CFP franc\",\"symbol\":\"\\u20a3\"}}'),
(189,'Qatar','State of Qatar','QA','QAT','🇶🇦',25.50000000,51.25000000,'{\"QAR\":{\"name\":\"Qatari riyal\",\"symbol\":\"\\u0631.\\u0642\"}}'),
(190,'Réunion','Réunion Island','RE','REU','🇷🇪',-21.15000000,55.50000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(191,'Romania','Romania','RO','ROU','🇷🇴',46.00000000,25.00000000,'{\"RON\":{\"name\":\"Romanian leu\",\"symbol\":\"lei\"}}'),
(192,'Russia','Russian Federation','RU','RUS','🇷🇺',60.00000000,100.00000000,'{\"RUB\":{\"name\":\"Russian ruble\",\"symbol\":\"\\u20bd\"}}'),
(193,'Rwanda','Republic of Rwanda','RW','RWA','🇷🇼',-2.00000000,30.00000000,'{\"RWF\":{\"name\":\"Rwandan franc\",\"symbol\":\"Fr\"}}'),
(194,'Saudi Arabia','Kingdom of Saudi Arabia','SA','SAU','🇸🇦',25.00000000,45.00000000,'{\"SAR\":{\"name\":\"Saudi riyal\",\"symbol\":\"\\u0631.\\u0633\"}}'),
(195,'Sudan','Republic of the Sudan','SD','SDN','🇸🇩',15.00000000,30.00000000,'{\"SDG\":{\"name\":\"Sudanese pound\",\"symbol\":\"\"}}'),
(196,'Senegal','Republic of Senegal','SN','SEN','🇸🇳',14.00000000,-14.00000000,'{\"XOF\":{\"name\":\"West African CFA franc\",\"symbol\":\"Fr\"}}'),
(197,'Singapore','Republic of Singapore','SG','SGP','🇸🇬',1.36666666,103.80000000,'{\"SGD\":{\"name\":\"Singapore dollar\",\"symbol\":\"$\"}}'),
(198,'South Georgia','South Georgia and the South Sandwich Islands','GS','SGS','🇬🇸',-54.50000000,-37.00000000,'{\"SHP\":{\"name\":\"Saint Helena pound\",\"symbol\":\"\\u00a3\"}}'),
(199,'Svalbard and Jan Mayen','Svalbard og Jan Mayen','SJ','SJM','🇸🇯',78.00000000,20.00000000,'{\"NOK\":{\"name\":\"krone\",\"symbol\":\"kr\"}}'),
(200,'Solomon Islands','Solomon Islands','SB','SLB','🇸🇧',-8.00000000,159.00000000,'{\"SBD\":{\"name\":\"Solomon Islands dollar\",\"symbol\":\"$\"}}'),
(201,'Sierra Leone','Republic of Sierra Leone','SL','SLE','🇸🇱',8.50000000,-11.50000000,'{\"SLL\":{\"name\":\"Sierra Leonean leone\",\"symbol\":\"Le\"}}'),
(202,'El Salvador','Republic of El Salvador','SV','SLV','🇸🇻',13.83333333,-88.91666666,'{\"USD\":{\"name\":\"United States dollar\",\"symbol\":\"$\"}}'),
(203,'San Marino','Most Serene Republic of San Marino','SM','SMR','🇸🇲',43.76666666,12.41666666,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(204,'Somalia','Federal Republic of Somalia','SO','SOM','🇸🇴',10.00000000,49.00000000,'{\"SOS\":{\"name\":\"Somali shilling\",\"symbol\":\"Sh\"}}'),
(205,'Saint Pierre and Miquelon','Saint Pierre and Miquelon','PM','SPM','🇵🇲',46.83333333,-56.33333333,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(206,'Serbia','Republic of Serbia','RS','SRB','🇷🇸',44.00000000,21.00000000,'{\"RSD\":{\"name\":\"Serbian dinar\",\"symbol\":\"\\u0434\\u0438\\u043d.\"}}'),
(207,'South Sudan','Republic of South Sudan','SS','SSD','🇸🇸',7.00000000,30.00000000,'{\"SSP\":{\"name\":\"South Sudanese pound\",\"symbol\":\"\\u00a3\"}}'),
(208,'São Tomé and Príncipe','Democratic Republic of São Tomé and Príncipe','ST','STP','🇸🇹',1.00000000,7.00000000,'{\"STN\":{\"name\":\"S\\u00e3o Tom\\u00e9 and Pr\\u00edncipe dobra\",\"symbol\":\"Db\"}}'),
(209,'Suriname','Republic of Suriname','SR','SUR','🇸🇷',4.00000000,-56.00000000,'{\"SRD\":{\"name\":\"Surinamese dollar\",\"symbol\":\"$\"}}'),
(210,'Slovakia','Slovak Republic','SK','SVK','🇸🇰',48.66666666,19.50000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(211,'Slovenia','Republic of Slovenia','SI','SVN','🇸🇮',46.11666666,14.81666666,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(212,'Sweden','Kingdom of Sweden','SE','SWE','🇸🇪',62.00000000,15.00000000,'{\"SEK\":{\"name\":\"Swedish krona\",\"symbol\":\"kr\"}}'),
(213,'Eswatini','Kingdom of Eswatini','SZ','SWZ','🇸🇿',-26.50000000,31.50000000,'{\"SZL\":{\"name\":\"Swazi lilangeni\",\"symbol\":\"L\"},\"ZAR\":{\"name\":\"South African rand\",\"symbol\":\"R\"}}'),
(214,'Sint Maarten','Sint Maarten','SX','SXM','🇸🇽',18.03333300,-63.05000000,'{\"ANG\":{\"name\":\"Netherlands Antillean guilder\",\"symbol\":\"\\u0192\"}}'),
(215,'Seychelles','Republic of Seychelles','SC','SYC','🇸🇨',-4.58333333,55.66666666,'{\"SCR\":{\"name\":\"Seychellois rupee\",\"symbol\":\"\\u20a8\"}}'),
(216,'Syria','Syrian Arab Republic','SY','SYR','🇸🇾',35.00000000,38.00000000,'{\"SYP\":{\"name\":\"Syrian pound\",\"symbol\":\"\\u00a3\"}}'),
(217,'Turks and Caicos Islands','Turks and Caicos Islands','TC','TCA','🇹🇨',21.75000000,-71.58333333,'{\"USD\":{\"name\":\"United States dollar\",\"symbol\":\"$\"}}'),
(218,'Chad','Republic of Chad','TD','TCD','🇹🇩',15.00000000,19.00000000,'{\"XAF\":{\"name\":\"Central African CFA franc\",\"symbol\":\"Fr\"}}'),
(219,'Togo','Togolese Republic','TG','TGO','🇹🇬',8.00000000,1.16666666,'{\"XOF\":{\"name\":\"West African CFA franc\",\"symbol\":\"Fr\"}}'),
(220,'Thailand','Kingdom of Thailand','TH','THA','🇹🇭',15.00000000,100.00000000,'{\"THB\":{\"name\":\"Thai baht\",\"symbol\":\"\\u0e3f\"}}'),
(221,'Tajikistan','Republic of Tajikistan','TJ','TJK','🇹🇯',39.00000000,71.00000000,'{\"TJS\":{\"name\":\"Tajikistani somoni\",\"symbol\":\"\\u0405\\u041c\"}}'),
(222,'Tokelau','Tokelau','TK','TKL','🇹🇰',-9.00000000,-172.00000000,'{\"NZD\":{\"name\":\"New Zealand dollar\",\"symbol\":\"$\"}}'),
(223,'Turkmenistan','Turkmenistan','TM','TKM','🇹🇲',40.00000000,60.00000000,'{\"TMT\":{\"name\":\"Turkmenistan manat\",\"symbol\":\"m\"}}'),
(224,'Timor-Leste','Democratic Republic of Timor-Leste','TL','TLS','🇹🇱',-8.83333333,125.91666666,'{\"USD\":{\"name\":\"United States dollar\",\"symbol\":\"$\"}}'),
(225,'Tonga','Kingdom of Tonga','TO','TON','🇹🇴',-20.00000000,-175.00000000,'{\"TOP\":{\"name\":\"Tongan pa\\u02bbanga\",\"symbol\":\"T$\"}}'),
(226,'Trinidad and Tobago','Republic of Trinidad and Tobago','TT','TTO','🇹🇹',11.00000000,-61.00000000,'{\"TTD\":{\"name\":\"Trinidad and Tobago dollar\",\"symbol\":\"$\"}}'),
(227,'Tunisia','Tunisian Republic','TN','TUN','🇹🇳',34.00000000,9.00000000,'{\"TND\":{\"name\":\"Tunisian dinar\",\"symbol\":\"\\u062f.\\u062a\"}}'),
(228,'Turkey','Republic of Turkey','TR','TUR','🇹🇷',39.00000000,35.00000000,'{\"TRY\":{\"name\":\"Turkish lira\",\"symbol\":\"\\u20ba\"}}'),
(229,'Tuvalu','Tuvalu','TV','TUV','🇹🇻',-8.00000000,178.00000000,'{\"AUD\":{\"name\":\"Australian dollar\",\"symbol\":\"$\"},\"TVD\":{\"name\":\"Tuvaluan dollar\",\"symbol\":\"$\"}}'),
(230,'Taiwan','Republic of China (Taiwan)','TW','TWN','🇹🇼',23.50000000,121.00000000,'{\"TWD\":{\"name\":\"New Taiwan dollar\",\"symbol\":\"$\"}}'),
(231,'Tanzania','United Republic of Tanzania','TZ','TZA','🇹🇿',-6.00000000,35.00000000,'{\"TZS\":{\"name\":\"Tanzanian shilling\",\"symbol\":\"Sh\"}}'),
(232,'Uganda','Republic of Uganda','UG','UGA','🇺🇬',1.00000000,32.00000000,'{\"UGX\":{\"name\":\"Ugandan shilling\",\"symbol\":\"Sh\"}}'),
(233,'Ukraine','Ukraine','UA','UKR','🇺🇦',49.00000000,32.00000000,'{\"UAH\":{\"name\":\"Ukrainian hryvnia\",\"symbol\":\"\\u20b4\"}}'),
(234,'United States Minor Outlying Islands','United States Minor Outlying Islands','UM','UMI','🇺🇲',19.30000000,166.63333300,'{\"USD\":{\"name\":\"United States dollar\",\"symbol\":\"$\"}}'),
(235,'Uruguay','Oriental Republic of Uruguay','UY','URY','🇺🇾',-33.00000000,-56.00000000,'{\"UYU\":{\"name\":\"Uruguayan peso\",\"symbol\":\"$\"}}'),
(236,'United States','United States of America','US','USA','🇺🇸',38.00000000,-97.00000000,'{\"USD\":{\"name\":\"United States dollar\",\"symbol\":\"$\"}}'),
(237,'Uzbekistan','Republic of Uzbekistan','UZ','UZB','🇺🇿',41.00000000,64.00000000,'{\"UZS\":{\"name\":\"Uzbekistani so\\u02bbm\",\"symbol\":\"so\'m\"}}'),
(238,'Vatican City','Vatican City State','VA','VAT','🇻🇦',41.90000000,12.45000000,'{\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"}}'),
(239,'Saint Vincent and the Grenadines','Saint Vincent and the Grenadines','VC','VCT','🇻🇨',13.25000000,-61.20000000,'{\"XCD\":{\"name\":\"Eastern Caribbean dollar\",\"symbol\":\"$\"}}'),
(240,'Venezuela','Bolivarian Republic of Venezuela','VE','VEN','🇻🇪',8.00000000,-66.00000000,'{\"VES\":{\"name\":\"Venezuelan bol\\u00edvar soberano\",\"symbol\":\"Bs.S.\"}}'),
(241,'British Virgin Islands','Virgin Islands','VG','VGB','🇻🇬',18.43138300,-64.62305000,'{\"USD\":{\"name\":\"United States dollar\",\"symbol\":\"$\"}}'),
(242,'United States Virgin Islands','Virgin Islands of the United States','VI','VIR','🇻🇮',18.35000000,-64.93333300,'{\"USD\":{\"name\":\"United States dollar\",\"symbol\":\"$\"}}'),
(243,'Vietnam','Socialist Republic of Vietnam','VN','VNM','🇻🇳',16.16666666,107.83333333,'{\"VND\":{\"name\":\"Vietnamese \\u0111\\u1ed3ng\",\"symbol\":\"\\u20ab\"}}'),
(244,'Vanuatu','Republic of Vanuatu','VU','VUT','🇻🇺',-16.00000000,167.00000000,'{\"VUV\":{\"name\":\"Vanuatu vatu\",\"symbol\":\"Vt\"}}'),
(245,'Wallis and Futuna','Territory of the Wallis and Futuna Islands','WF','WLF','🇼🇫',-13.30000000,-176.20000000,'{\"XPF\":{\"name\":\"CFP franc\",\"symbol\":\"\\u20a3\"}}'),
(246,'Samoa','Independent State of Samoa','WS','WSM','🇼🇸',-13.58333333,-172.33333333,'{\"WST\":{\"name\":\"Samoan t\\u0101l\\u0101\",\"symbol\":\"T\"}}'),
(247,'Yemen','Republic of Yemen','YE','YEM','🇾🇪',15.00000000,48.00000000,'{\"YER\":{\"name\":\"Yemeni rial\",\"symbol\":\"\\ufdfc\"}}'),
(248,'South Africa','Republic of South Africa','ZA','ZAF','🇿🇦',-29.00000000,24.00000000,'{\"ZAR\":{\"name\":\"South African rand\",\"symbol\":\"R\"}}'),
(249,'Zambia','Republic of Zambia','ZM','ZMB','🇿🇲',-15.00000000,30.00000000,'{\"ZMW\":{\"name\":\"Zambian kwacha\",\"symbol\":\"ZK\"}}'),
(250,'Zimbabwe','Republic of Zimbabwe','ZW','ZWE','🇿🇼',-20.00000000,30.00000000,'{\"BWP\":{\"name\":\"Botswana pula\",\"symbol\":\"P\"},\"CNY\":{\"name\":\"Chinese yuan\",\"symbol\":\"\\u00a5\"},\"EUR\":{\"name\":\"Euro\",\"symbol\":\"\\u20ac\"},\"GBP\":{\"name\":\"British pound\",\"symbol\":\"\\u00a3\"},\"INR\":{\"name\":\"Indian rupee\",\"symbol\":\"\\u20b9\"},\"JPY\":{\"name\":\"Japanese yen\",\"symbol\":\"\\u00a5\"},\"USD\":{\"name\":\"United States dollar\",\"symbol\":\"$\"},\"ZAR\":{\"name\":\"South African rand\",\"symbol\":\"Rs\"},\"ZWB\":{\"name\":\"Zimbabwean bonds\",\"symbol\":\"$\"}}');
/*!40000 ALTER TABLE `system_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_currencies`
--

DROP TABLE IF EXISTS `system_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `symbol` varchar(25) NOT NULL,
  `format` varchar(50) NOT NULL,
  `exchange_rate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_currencies_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_currencies`
--

LOCK TABLES `system_currencies` WRITE;
/*!40000 ALTER TABLE `system_currencies` DISABLE KEYS */;
INSERT INTO `system_currencies` VALUES
(1,'UAE Dirham','AED','دإ‏','دإ‏ 1,0.00','0'),
(2,'Afghanistan, Afghani','AFN','؋','؋1,0.00','0'),
(3,'Albania, Lek','ALL','Lek','1,0.00Lek','0'),
(4,'Armenian Dram','AMD','&#1423;','1,0.00 &#1423;','0'),
(5,'Netherlands Antillian Guilder','ANG','ƒ','ƒ1,0.00','0'),
(6,'Angola, Kwanza','AOA','Kz','Kz1,0.00','0'),
(7,'Argentine Peso','ARS','$','$ 1,0.00','0'),
(8,'Australian Dollar','AUD','$','$1,0.00','0'),
(9,'Aruban Guilder','AWG','ƒ','ƒ1,0.00','0'),
(10,'Azerbaijanian Manat','AZN','₼','1 0,00 ₼','0'),
(11,'Bosnia and Herzegovina, Convertible Marks','BAM','КМ','1,0.00 КМ','0'),
(12,'Barbados Dollar','BBD','$','$1,0.00','0'),
(13,'Bangladesh, Taka','BDT','৳','৳ 1,0.','0'),
(14,'Bulgarian Lev','BGN','лв.','1 0,00 лв.','0'),
(15,'Bahraini Dinar','BHD','.د.','.د. 1,0.000','0'),
(16,'Burundi Franc','BIF','FBu','1,0.FBu','0'),
(17,'Bermudian Dollar','BMD','$','$1,0.00','0'),
(18,'Brunei Dollar','BND','$','$1,0.','0'),
(19,'Bolivia, Boliviano','BOB','Bs','Bs 1,0.00','0'),
(20,'Brazilian Real','BRL','R$','R$ 1,0.00','0'),
(21,'Bahamian Dollar','BSD','$','$1,0.00','0'),
(22,'Bhutan, Ngultrum','BTN','Nu.','Nu. 1,0.0','0'),
(23,'Botswana, Pula','BWP','P','P1,0.00','0'),
(24,'Belarussian Ruble','BYN','р.','1 0,00 р.','0'),
(25,'Belize Dollar','BZD','BZ$','BZ$1,0.00','0'),
(26,'Canadian Dollar','CAD','$','$1,0.00','0'),
(27,'Franc Congolais','CDF','FC','1,0.00FC','0'),
(28,'Swiss Franc','CHF','CHF','1\'0.00 CHF','0'),
(29,'Chilean Peso','CLP','$','$ 1,0.00','0'),
(30,'China Yuan Renminbi','CNY','¥','¥1,0.00','0'),
(31,'Colombian Peso','COP','$','$ 1,0.00','0'),
(32,'Costa Rican Colon','CRC','₡','₡1,0.00','0'),
(33,'Cuban Convertible Peso','CUC','CUC','CUC1,0.00','0'),
(34,'Cuban Peso','CUP','$MN','$MN1,0.00','0'),
(35,'Cape Verde Escudo','CVE','$','$1,0.00','0'),
(36,'Czech Koruna','CZK','Kč','1 0,00 Kč','0'),
(37,'Djibouti Franc','DJF','Fdj','1,0.Fdj','0'),
(38,'Danish Krone','DKK','kr.','1 0,00 kr.','0'),
(39,'Dominican Peso','DOP','RD$','RD$1,0.00','0'),
(40,'Algerian Dinar','DZD','د.ج‏','د.ج‏ 1,0.00','0'),
(41,'Egyptian Pound','EGP','ج.م','ج.م 1,0.00','0'),
(42,'Eritrea, Nakfa','ERN','Nfk','1,0.00Nfk','0'),
(43,'Ethiopian Birr','ETB','ETB','ETB1,0.00','0'),
(44,'Euro','EUR','€','1.0,00 €','0'),
(45,'Fiji Dollar','FJD','$','$1,0.00','0'),
(46,'Falkland Islands Pound','FKP','£','£1,0.00','0'),
(47,'Pound Sterling','GBP','£','£1,0.00','0'),
(48,'Georgia, Lari','GEL','Lari','1 0,00 Lari','0'),
(49,'Ghana Cedi','GHS','₵','₵1,0.00','0'),
(50,'Gibraltar Pound','GIP','£','£1,0.00','0'),
(51,'Gambia, Dalasi','GMD','D','1,0.00D','0'),
(52,'Guinean franc','GNF','FG','1,0.00FG','0'),
(53,'Guatemala, Quetzal','GTQ','Q','Q1,0.00','0'),
(54,'Guyana Dollar','GYD','$','$1,0.00','0'),
(55,'Hong Kong Dollar','HKD','HK$','HK$1,0.00','0'),
(56,'Honduras, Lempira','HNL','L.','L. 1,0.00','0'),
(57,'Croatian Kuna','HRK','kn','1,0.00 kn','0'),
(58,'Haiti, Gourde','HTG','G','G1,0.00','0'),
(59,'Hungary, Forint','HUF','Ft','1 0,00 Ft','0'),
(60,'Indonesia, Rupiah','IDR','Rp','Rp1,0.','0'),
(61,'New Israeli Shekel','ILS','₪','₪ 1,0.00','0'),
(62,'Indian Rupee','INR','₹','1,0.00₹','0'),
(63,'Iraqi Dinar','IQD','د.ع.‏','د.ع.‏ 1,0.00','0'),
(64,'Iranian Rial','IRR','﷼','﷼ 1,0/00','0'),
(65,'Iceland Krona','ISK','kr.','1,0. kr.','0'),
(66,'Jamaican Dollar','JMD','J$','J$1,0.00','0'),
(67,'Jordanian Dinar','JOD','د.ا.‏','د.ا.‏ 1,0.000','0'),
(68,'Japan, Yen','JPY','¥','¥1,0.','0'),
(69,'Kenyan Shilling','KES','S','S1,0.00','0'),
(70,'Kyrgyzstan, Som','KGS','сом','1 0-00 сом','0'),
(71,'Cambodia, Riel','KHR','៛','1,0.៛','0'),
(72,'Comoro Franc','KMF','CF','1,0.00CF','0'),
(73,'North Korean Won','KPW','₩','₩1,0.','0'),
(74,'South Korea, Won','KRW','₩','₩1,0.','0'),
(75,'Kuwaiti Dinar','KWD','دينار‎‎‏','دينار‎‎‏ 1,0.000','0'),
(76,'Cayman Islands Dollar','KYD','$','$1,0.00','0'),
(77,'Kazakhstan, Tenge','KZT','₸','₸1 0-00','0'),
(78,'Laos, Kip','LAK','₭','1,0.₭','0'),
(79,'Lebanese Pound','LBP','ل.ل.‏','ل.ل.‏ 1,0.00','0'),
(80,'Sri Lanka Rupee','LKR','₨','₨ 1,0.','0'),
(81,'Liberian Dollar','LRD','$','$1,0.00','0'),
(82,'Lesotho, Loti','LSL','M','1,0.00M','0'),
(83,'Libyan Dinar','LYD','د.ل.‏','د.ل.‏1,0.000','0'),
(84,'Moroccan Dirham','MAD','د.م.‏','د.م.‏ 1,0.00','0'),
(85,'Moldovan Leu','MDL','lei','1,0.00 lei','0'),
(86,'Malagasy Ariary','MGA','Ar','Ar1,0.','0'),
(87,'Macedonia, Denar','MKD','ден.','1,0.00 ден.','0'),
(88,'Myanmar, Kyat','MMK','K','K1,0.00','0'),
(89,'Mongolia, Tugrik','MNT','₮','₮1 0,00','0'),
(90,'Macao, Pataca','MOP','MOP$','MOP$1,0.00','0'),
(91,'Mauritania, Ouguiya','MRU','UM','1,0.00UM','0'),
(92,'Maltese Lira','MTL','₤','₤1,0.00','0'),
(93,'Mauritius Rupee','MUR','₨','₨1,0.00','0'),
(94,'Maldives, Rufiyaa','MVR','MVR','1,0.0 MVR','0'),
(95,'Malawi, Kwacha','MWK','MK','MK1,0.00','0'),
(96,'Mexican Peso','MXN','$','$1,0.00','0'),
(97,'Malaysian Ringgit','MYR','RM','RM1,0.00','0'),
(98,'Mozambique Metical','MZN','MT','MT1,0.','0'),
(99,'Namibian Dollar','NAD','$','$1,0.00','0'),
(100,'Nigeria, Naira','NGN','₦','₦1,0.00','0'),
(101,'Nicaragua, Cordoba Oro','NIO','C$','C$ 1,0.00','0'),
(102,'Norwegian Krone','NOK','kr','1.0,00 kr','0'),
(103,'Nepalese Rupee','NPR','₨','₨1,0.00','0'),
(104,'New Zealand Dollar','NZD','$','$1,0.00','0'),
(105,'Rial Omani','OMR','﷼','﷼ 1,0.000','0'),
(106,'Panama, Balboa','PAB','B/.','B/. 1,0.00','0'),
(107,'Peru, Nuevo Sol','PEN','S/.','S/. 1,0.00','0'),
(108,'Papua New Guinea, Kina','PGK','K','K1,0.00','0'),
(109,'Philippine Peso','PHP','₱','₱1,0.00','0'),
(110,'Pakistan Rupee','PKR','₨','₨1,0.00','0'),
(111,'Poland, Zloty','PLN','zł','1 0,00 zł','0'),
(112,'Paraguay, Guarani','PYG','₲','₲ 1,0.00','0'),
(113,'Qatari Rial','QAR','﷼','﷼ 1,0.00','0'),
(114,'Romania, New Leu','RON','lei','1,0.00 lei','0'),
(115,'Serbian Dinar','RSD','Дин.','1,0.00 Дин.','0'),
(116,'Russian Ruble','RUB','₽','1 0,00 ₽','0'),
(117,'Rwanda Franc','RWF','RWF','RWF 1 0,00','0'),
(118,'Saudi Riyal','SAR','﷼','﷼ 1,0.00','0'),
(119,'Solomon Islands Dollar','SBD','$','$1,0.00','0'),
(120,'Seychelles Rupee','SCR','₨','₨1,0.00','0'),
(121,'Sudanese Pound','SDG','ج.س','1,0.00 Sd','0'),
(122,'Swedish Krona','SEK','kr','1 0,00 kr','0'),
(123,'Singapore Dollar','SGD','$','$1,0.00','0'),
(124,'Saint Helena Pound','SHP','£','£1,0.00','0'),
(125,'Sierra Leone, Leone','SLL','Le','Le1,0.00','0'),
(126,'Somali Shilling','SOS','S','S1,0.00','0'),
(127,'Surinam Dollar','SRD','$','$1,0.00','0'),
(128,'South Sudanese pound','SSP','SS£','SS £1,0.00','0'),
(129,'Sao Tome and Principe, Dobra','STN','Db','Db1,0.00','0'),
(130,'El Salvador Colon','SVC','₡','₡1,0.00','0'),
(131,'Syrian Pound','SYP','£','£ 1,0.00','0'),
(132,'Swaziland, Lilangeni','SZL','E','E1,0.00','0'),
(133,'Thailand, Baht','THB','฿','฿1,0.00','0'),
(134,'Tajikistan, Somoni','TJS','TJS','1 0;00 TJS','0'),
(135,'Turkmenistani New Manat','TMT','m','1 0,m','0'),
(136,'Tunisian Dinar','TND','د.ت.‏','د.ت.‏ 1,0.000','0'),
(137,'Tonga, Paanga','TOP','T$','T$1,0.00','0'),
(138,'Turkish Lira','TRY','TL','₺1,0.00','0'),
(139,'Trinidad and Tobago Dollar','TTD','TT$','TT$1,0.00','0'),
(140,'New Taiwan Dollar','TWD','NT$','NT$1,0.00','0'),
(141,'Tanzanian Shilling','TZS','TSh','TSh1,0.00','0'),
(142,'Ukraine, Hryvnia','UAH','₴','1 0,00₴','0'),
(143,'Uganda Shilling','UGX','USh','USh1,0.00','0'),
(144,'US Dollar','USD','$','$1,0.00','0'),
(145,'Peso Uruguayo','UYU','$U','$U 1,0.00','0'),
(146,'Uzbekistan Sum','UZS','сўм','1 0,00 сўм','0'),
(147,'Venezuela Bolivares soberano','VES','Bs. S.','Bs. S. 1,0.00','0'),
(148,'Viet Nam, Dong','VND','₫','1,0.0 ₫','0'),
(149,'Vanuatu, Vatu','VUV','VT','1,0.VT','0'),
(150,'Samoa, Tala','WST','WS$','WS$1,0.00','0'),
(151,'Central African CFA Franc','XAF','FCFA','1,0.00 FCFA','0'),
(152,'East Caribbean Dollar','XCD','$','$1,0.00','0'),
(153,'West African CFA Franc','XOF','FCFA','1,0.00 FCFA','0'),
(154,'CFP Franc','XPF','F','1,0.00F','0'),
(155,'Yemeni Rial','YER','﷼','﷼ 1,0.00','0'),
(156,'South Africa, Rand','ZAR','R','R 1,0.00','0'),
(157,'Zambia Kwacha','ZMW','ZK','ZK1,0.00','0'),
(158,'Zimbabwean dollar','ZWL','$','$1,0.00','0');
/*!40000 ALTER TABLE `system_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `key` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`value`)),
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` VALUES
(1,'2022-12-27 07:41:21','2022-12-27 07:41:21','shop_name','Store name','\"Kedai Buku 555\"',1),
(2,'2022-12-27 07:41:21','2022-12-27 07:41:21','shop_email','Store email','\"inrafilus@gmail.com\"',1),
(3,'2022-12-27 07:41:21','2022-12-27 07:41:21','shop_about','Store description','\"<pre>while (true) {<\\/pre><div>&nbsp; &nbsp; &nbsp;console.log(true)<\\/div><pre>}<\\/pre>\"',1),
(4,'2022-12-27 07:41:21','2022-12-27 07:41:21','shop_country_id','Country','160',1),
(5,'2022-12-27 07:41:21','2022-12-27 07:41:21','shop_currency_id','Store Currency','97',1),
(6,'2022-12-27 07:41:21','2022-12-27 07:41:21','shop_street_address','Store street address','\"No 3 Lot 6368\"',1),
(7,'2022-12-27 07:41:21','2022-12-27 07:41:21','shop_zipcode','Zip Code','\"71000\"',1),
(8,'2022-12-27 07:41:21','2022-12-27 07:41:21','shop_city','Store city','\"Port Dickson\"',1),
(9,'2022-12-27 07:41:21','2022-12-27 07:41:21','shop_phone_number','Store phone number','\"+60189746509\"',1),
(10,'2022-12-27 07:41:21','2022-12-27 07:41:21','shop_lng','Longitude',NULL,1),
(11,'2022-12-27 07:41:21','2022-12-27 07:41:21','shop_lat','Latitude',NULL,1),
(12,'2022-12-27 07:41:21','2022-12-27 07:41:21','shop_facebook_link','Facebook Page',NULL,1),
(13,'2022-12-27 07:41:21','2022-12-27 07:41:21','shop_instagram_link','Twitter account',NULL,1),
(14,'2022-12-27 07:41:21','2022-12-27 07:41:21','shop_twitter_link','Instagram account',NULL,1),
(15,'2022-12-28 07:20:23','2022-12-28 07:20:23','shop_legal_name','Store Legal name','\"Test\"',1),
(16,'2022-12-28 07:21:57','2022-12-28 07:21:57','shop_cover','Store Cover Image','\"A5fqC6kpI5fX4vW8cOsvSRLqvViVcKpzsO4FZrA6.jpg\"',1);
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_addresses`
--

DROP TABLE IF EXISTS `user_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `street_address` varchar(255) NOT NULL,
  `street_address_plus` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `type` enum('billing','shipping') NOT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_addresses_country_id_index` (`country_id`),
  KEY `user_addresses_user_id_index` (`user_id`),
  CONSTRAINT `user_addresses_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `system_countries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_addresses`
--

LOCK TABLES `user_addresses` WRITE;
/*!40000 ALTER TABLE `user_addresses` DISABLE KEYS */;
INSERT INTO `user_addresses` VALUES
(1,'2022-12-27 08:18:50','2022-12-27 08:18:50','555','Kedai',NULL,'No 3 Lot 6368',NULL,'71000','Port Dickson',NULL,1,'shipping',160,3);
/*!40000 ALTER TABLE `user_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT 'male',
  `phone_number` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `avatar_type` varchar(255) NOT NULL DEFAULT 'gravatar',
  `avatar_location` varchar(255) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `opt_in` tinyint(1) NOT NULL DEFAULT 0,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Filus','Inra','male',NULL,NULL,'gravatar',NULL,NULL,0,'2022-12-27 07:38:48','127.0.0.1','admin@admin.com','2022-12-27 07:38:48','$2y$10$qL/Xz5RCkZn.c4lQIyBJKOS1lkpkz13F6w4iuK/XtmC9sVY2dyE72',NULL,NULL,NULL,'2022-12-27 07:38:48','2022-12-27 07:38:48',NULL),
(3,'Customer','First','male',NULL,NULL,'gravatar',NULL,NULL,0,NULL,NULL,'customer@example.com','2022-12-27 07:38:48','$2y$10$3WSiU8CKdwKLtZMatii7m.PLWfZFl36WCzlw3qhfXaxy0FsOdm67O',NULL,NULL,NULL,'2022-12-27 08:18:50','2022-12-27 08:18:50',NULL),
(4,'Faresh','Amir','male',NULL,NULL,'gravatar',NULL,NULL,0,'2022-12-28 05:51:08','127.0.0.1','farish@gmail.com','2022-12-28 05:51:08','$2y$10$COFRnBijbAz6L20AmYKeee6R5lmS4j.0iXHJxcWWww/2dW4k35r/y',NULL,NULL,NULL,'2022-12-28 05:51:08','2022-12-28 05:51:08',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_geolocation_history`
--

DROP TABLE IF EXISTS `users_geolocation_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_geolocation_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `ip_api` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`ip_api`)),
  `extreme_ip_lookup` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`extreme_ip_lookup`)),
  `user_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_geolocation_history_user_id_index` (`user_id`),
  KEY `users_geolocation_history_order_id_index` (`order_id`),
  CONSTRAINT `users_geolocation_history_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_geolocation_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_geolocation_history`
--

LOCK TABLES `users_geolocation_history` WRITE;
/*!40000 ALTER TABLE `users_geolocation_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_geolocation_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ecomm'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-29  1:11:00
