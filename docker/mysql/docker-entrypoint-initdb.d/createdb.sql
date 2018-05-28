
CREATE DATABASE  IF NOT EXISTS `default` /*!40100 DEFAULT CHARACTER SET utf8 */;

GRANT ALL ON `default`.* TO 'default'@'%' ;
FLUSH PRIVILEGES ;

USE `default`;
-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: default
-- ------------------------------------------------------
-- Server version	5.7.22

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Sala de Estar',NULL,NULL),(2,'Escritório',NULL,NULL),(3,'Quarto',NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_product`
--

DROP TABLE IF EXISTS `category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_products_category_id_foreign` (`category_id`),
  KEY `category_products_product_id_foreign` (`product_id`),
  CONSTRAINT `category_products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_product`
--

LOCK TABLES `category_product` WRITE;
/*!40000 ALTER TABLE `category_product` DISABLE KEYS */;
INSERT INTO `category_product` VALUES (4,NULL,NULL,1,1),(5,NULL,NULL,1,2),(6,NULL,NULL,1,3),(7,NULL,NULL,1,4),(8,NULL,NULL,2,5),(9,NULL,NULL,2,6),(10,NULL,NULL,2,7),(11,NULL,NULL,2,8),(12,NULL,NULL,3,9),(13,NULL,NULL,3,10),(14,NULL,NULL,3,11),(15,NULL,NULL,3,12),(16,NULL,NULL,1,5),(17,NULL,NULL,1,7),(18,NULL,NULL,2,1),(19,NULL,NULL,2,3);
/*!40000 ALTER TABLE `category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
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
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_05_18_015230_create_products_table',1),(4,'2018_05_18_015245_create_categories_table',1),(5,'2018_05_18_015300_create_specs_table',1),(6,'2018_05_18_015400_create_category_products_table',1),(7,'2018_05_18_015435_create_product_specs_table',1),(8,'2018_05_18_015447_create_orders_table',2),(9,'2018_05_18_015456_create_order_products_table',2),(10,'2016_06_01_000001_create_oauth_auth_codes_table',3),(11,'2016_06_01_000002_create_oauth_access_tokens_table',3),(12,'2016_06_01_000003_create_oauth_refresh_tokens_table',3),(13,'2016_06_01_000004_create_oauth_clients_table',3),(14,'2016_06_01_000005_create_oauth_personal_access_clients_table',3),(15,'2018_05_27_131338_create_failed_jobs_table',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_product_1_idx` (`order_id`),
  KEY `fk_order_product_2_idx` (`product_id`),
  CONSTRAINT `fk_order_product_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_product_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
INSERT INTO `order_product` VALUES (1,6,1,279.99,1,NULL,NULL),(2,6,2,849.99,1,NULL,NULL);
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total` decimal(8,2) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `suburb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `state` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (6,'2018-05-27 18:15:52','2018-05-27 18:15:52',1129.98,'325','kjgh','kh','kjgh','kjgh',1,'dfg');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `product_spec`
--

DROP TABLE IF EXISTS `product_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_spec` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spec_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_specs_spec_id_foreign` (`spec_id`),
  KEY `product_specs_product_id_foreign` (`product_id`),
  CONSTRAINT `product_specs_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_specs_spec_id_foreign` FOREIGN KEY (`spec_id`) REFERENCES `specs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_spec`
--

LOCK TABLES `product_spec` WRITE;
/*!40000 ALTER TABLE `product_spec` DISABLE KEYS */;
INSERT INTO `product_spec` VALUES (1,'2018-05-27 18:03:02','2018-05-27 18:03:02','Preto',1,1),(2,'2018-05-27 18:03:02','2018-05-27 18:03:02','162 cm',2,1),(3,'2018-05-27 18:03:02','2018-05-27 18:03:02','55 cm',3,1),(4,'2018-05-27 18:03:02','2018-05-27 18:03:02','29,000 kg',4,1),(5,'2018-05-27 18:03:02','2018-05-27 18:03:02','Preto',1,2),(6,'2018-05-27 18:03:02','2018-05-27 18:03:02','200 cm',2,2),(7,'2018-05-27 18:03:02','2018-05-27 18:03:02','90 cm',3,2),(8,'2018-05-27 18:03:02','2018-05-27 18:03:02','38,000 Kg',4,2),(9,'2018-05-27 18:03:02','2018-05-27 18:03:02','Cinza',1,3),(10,'2018-05-27 18:03:02','2018-05-27 18:03:02','57 cm',2,3),(11,'2018-05-27 18:03:02','2018-05-27 18:03:02','87 cm',3,3),(12,'2018-05-27 18:03:02','2018-05-27 18:03:02','7,500 Kg',4,3),(13,'2018-05-27 18:03:02','2018-05-27 18:03:02','Cinza',1,4),(14,'2018-05-27 18:03:02','2018-05-27 18:03:02','142 cm',2,4),(15,'2018-05-27 18:03:02','2018-05-27 18:03:02','52 cm',3,4),(16,'2018-05-27 18:03:02','2018-05-27 18:03:02','26,000 Kg',4,4),(17,'2018-05-27 18:03:02','2018-05-27 18:03:02','Carvalho',1,5),(18,'2018-05-27 18:03:02','2018-05-27 18:03:02','120 cm',2,5),(19,'2018-05-27 18:03:02','2018-05-27 18:03:02','70 cm',3,5),(20,'2018-05-27 18:03:02','2018-05-27 18:03:02','14,000 Kg',4,5),(21,'2018-05-27 18:03:02','2018-05-27 18:03:02','Marron',1,6),(22,'2018-05-27 18:03:02','2018-05-27 18:03:02','60 cm',2,6),(23,'2018-05-27 18:03:02','2018-05-27 18:03:02','155 cm',3,6),(24,'2018-05-27 18:03:02','2018-05-27 18:03:02','17,000 Kg',4,6),(25,'2018-05-27 18:03:02','2018-05-27 18:03:02','Preta',1,7),(26,'2018-05-27 18:03:02','2018-05-27 18:03:02','41 cm',2,7),(27,'2018-05-27 18:03:02','2018-05-27 18:03:02','102 cm',3,7),(28,'2018-05-27 18:03:02','2018-05-27 18:03:02','7,200 Kg',4,7),(29,'2018-05-27 18:03:02','2018-05-27 18:03:02','Branco',1,8),(30,'2018-05-27 18:03:02','2018-05-27 18:03:02','93 cm',2,8),(31,'2018-05-27 18:03:02','2018-05-27 18:03:02','181 cm',3,8),(32,'2018-05-27 18:03:02','2018-05-27 18:03:02','32,300 Kg',4,8),(33,'2018-05-27 18:03:02','2018-05-27 18:03:02','Branco',1,9),(34,'2018-05-27 18:03:02','2018-05-27 18:03:02','198 cm',2,9),(35,'2018-05-27 18:03:02','2018-05-27 18:03:02','175 cm',3,9),(36,'2018-05-27 18:03:02','2018-05-27 18:03:02','55,000 Kg',4,9),(37,'2018-05-27 18:03:02','2018-05-27 18:03:02','Branco',1,10),(38,'2018-05-27 18:03:02','2018-05-27 18:03:02','163 cm',2,10),(39,'2018-05-27 18:03:02','2018-05-27 18:03:02','93 cm',3,10),(40,'2018-05-27 18:03:02','2018-05-27 18:03:02','71,477 Kg',4,10),(41,'2018-05-27 18:03:02','2018-05-27 18:03:02','Branco',1,11),(42,'2018-05-27 18:03:02','2018-05-27 18:03:02','119 cm',2,11),(43,'2018-05-27 18:03:02','2018-05-27 18:03:02','187 cm',3,11),(44,'2018-05-27 18:03:02','2018-05-27 18:03:02','37,900 Kg',4,11),(45,'2018-05-27 18:03:02','2018-05-27 18:03:02','Preto',1,12),(46,'2018-05-27 18:03:02','2018-05-27 18:03:02','43 cm',2,12),(47,'2018-05-27 18:03:02','2018-05-27 18:03:02','67 cm',3,12),(48,'2018-05-27 18:03:02','2018-05-27 18:03:02','11,200 Kg',4,12);
/*!40000 ALTER TABLE `product_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'2018-05-27 17:59:59','2018-05-27 17:59:59','Rack Retrô Goslar Preto 160 cm','Com todo seu charme retrô, não tem como errar na decoração do ambiente. Você surpreenderá todas as suas visitas com muito bom gosto e um estilo único! Bastante espaçoso, nele você poderá organizar sua TV, aparelhos de DVD e muito mais.','https://staticmobly.akamaized.net/p/Mobly-Rack-RetrC3B4-Goslar-Preto-160-cm-7071-451714-2-zoom.jpg',279.99),(2,'2018-05-27 17:59:59','2018-05-27 17:59:59','Sofá 3 Lugares New Passion Couro Sintético Preto','O Sofá New Passion vai conquistar o seu coração. Dono de um design moderno de formas arredondadas, a peça, que é confeccionada com corino, conta com detalhes em captonê e desenho de linhas aparentes vão agregar muito mais charme e sofisticação para a sua decoração. Ele conta com espaço para até 3 pessoas. Demais, não é? Leva!','https://staticmobly.akamaized.net/p/LinoForte-SofC3A1-3-Lugares-New-Passion-Couro-SintC3A9tico-Preto-6058-426484-1-zoom.jpg',849.99),(3,'2018-05-27 17:59:59','2018-05-27 17:59:59','Poltrona Jonh Cinza','Ela promete deixar o seu ambiente ainda mais prático, além de contribuir bastante para a decoração. Confortável e bem estruturada, ela possui base e pernas em metal para tornar a sua experiência de uso ainda melhor. Sem contar sua cor que é fácil de combinar. Cadeira.','https://staticmobly.akamaized.net/p/Mobly-Poltrona-Jonh-Cinza-1496-074115-1-zoom.jpg',279.99),(4,'2018-05-27 17:59:59','2018-05-27 17:59:59','Puff Baú Suede Amassado Cinza','Se você adora adquirir peças versáteis que valorizam o ambiente, dá só uma olhada no Puff Baú Catarina! Produzido com revestimento em suede amassado, ele é perfeito para você que acredita que um ambiente agradável deve oferecer pleno conforto, sendo também um móvel muito prático que pode ser usado como baú para guardar suas coisas.','https://staticmobly.akamaized.net/p/Estofado-Catarina-Puff-BaC3BA-Suede-Amassado-Cinza-5135-470632-1-zoom.jpg',385.99),(5,'2018-05-27 17:59:59','2018-05-27 17:59:59','Escrivaninha Manchester Carvalho e Preto','A Escrivaninha Manchester é a opção ideal para colocar no quarto, sala ou escritório, pois irá garantir um espaço adequado para usufruir melhor de momentos de lazer ou trabalho. Produzida com materiais de excelente resistência e alta qualidade, ela possui tampo de tamburto, o que transmite robustez, ainda que o móvel seja leve, o modelo estilo industrial e a cor leve oferece um visual clássico e discreto, combinando com qualquer espaço.','https://staticmobly.akamaized.net/p/Mobly-Escrivaninha-Manchester-Carvalho-e-Preto-4639-823493-1-zoom.jpg',276.99),(6,'2018-05-27 17:59:59','2018-05-27 17:59:59','Estante Wooden Marron e Preta','O que acha da decoração industrial? A  Estante Wooden é uma boa opção para quem pensa em abusar desse estilo. A combinação entre tubos pretos e a madeira em evidência é um traço marcante da tendência e funciona também como destaque em decorações onde o estilo mais urbano predomina, afinal, na sua casa, o especialista em decoração é você.','https://staticmobly.akamaized.net/p/Mobly-Estante-Wooden-Marrom-e-Preta-0597-205115-1-zoom.jpg',349.99),(7,'2018-05-27 17:59:59','2018-05-27 17:59:59','Cadeira de Escritório Diretor Giratória Marilyn Plus Preta','Olha só que beleza a Cadeira De Escritório Marilyn! Ela é ideal para deixar o ambiente de trabalho mais aconchegante e charmoso! Seu modelo atraente e sóbrio na cor preta conta com rodízios para você se deslocar com facilidade e ajuste para deixá-la mais alta ou baixa - tudo para se adaptar às suas necesidades','https://staticmobly.akamaized.net/p/Mobly-Cadeira-de-EscritC3B3rio-Diretor-GiratC3B3ria-Marilyn-Plus-Preta-9118-592691-1-zoom.jpg',289.99),(8,'2018-05-27 17:59:59','2018-05-27 17:59:59','Estante Livreiro Chico Banco','Se é espaço para os seus livros que está procurando, você vai se apaixonar pela Estante Livreiro Chico. São diversos compartimentos para organizar as suas coisas da maneira que quiser e ainda dar um toque pessoal com objetos decorativos. Ah, também é possível combinar este produto com outros móveis, como uma escrivaninha, e tornar o seu uso muito mais prático para o dia a dia.','https://staticmobly.akamaized.net/p/Hecol-Estante-Livreiro-Chico-Branco-6417-965915-1-zoom.jpg',282.99),(9,'2018-05-27 17:59:59','2018-05-27 17:59:59','Cama de Solteiro Multifunção Bianchi Branca','Procurando um móvel para revolucionar o lar-style do seu quarto? Conte com a Cama Bianchi. Ela é multifuncional e tem detalhes incríveis! Além da clássica cama na parte superior para os momentos de descanso, o produto possui espaços e prateleiras para serem usados como você quiser. Assim fica bem fácil conquistar uma decoração moderna e muita organização.','https://staticmobly.akamaized.net/p/Mobly-Cama-de-Solteiro-MultifunC3A7C3A3o-Bianchi-Branca-0095-604115-1-zoom.jpg',769.99),(10,'2018-05-27 17:59:59','2018-05-27 17:59:59','Cômoda Maggiore Horizontal 6 GV Branco','Precisando de mais espaço para guardar suas roupas? A Cômoda Maggiore é a perfeição em forma de móvel. Ótima para quarto de casal, ela vai te auxiliar a deixar o ambiente organizado, ou seja, vai ficar mais fácil de achar aquele look favorito. Ah, a cor branca permite criar um ambiente moderno e clean.','https://staticmobly.akamaized.net/p/Lopas-CC3B4moda-Maggiore-Horizontal--6-GV-Branco-3702-773154-1-zoom.jpg',586.99),(11,'2018-05-27 17:59:59','2018-05-27 17:59:59','Guarda-Roupa Closet Modulado Barcelona Branco','Olha só que incrível esse Closet Barcelona. Ideal para quem tem um conceito diferente de guarda-roupa e deseja algo mais moderno. Confeccionado com materiais de qualidade, ele ajuda a organizar e embelezar o ambiente. Não é demais? Aproveite!','https://staticmobly.akamaized.net/p/Artefamol-Guarda-Roupa-Closet-Modulado-Barcelona-Branco-1168-529174-1-zoom.jpg',357.99),(12,'2018-05-27 17:59:59','2018-05-27 17:59:59','Criado Mudo Retrô Plus Preta','Para você que gosta de decorar a sua casa com elegância e exclusividade, o Criado-Mudo Retrô é a opção ideal. O design na cor preta complementará o ambiente do seu lar de forma esplêndida, seja para quarto de casal ou solteiro. Perfeito para tornar o seu dia a dia mais prático, ele pode usado para apoiar abajur, livros, garrafas, copos e muito mais.','https://staticmobly.akamaized.net/p/Mobly-Criado-Mudo-RetrC3B4-Plus-Preta-7977-027444-1-zoom.jpg',182.99);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specs`
--

DROP TABLE IF EXISTS `specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specs`
--

LOCK TABLES `specs` WRITE;
/*!40000 ALTER TABLE `specs` DISABLE KEYS */;
INSERT INTO `specs` VALUES (1,'Cor',NULL,NULL),(2,'Largura',NULL,NULL),(3,'Altura',NULL,NULL),(4,'Peso',NULL,NULL);
/*!40000 ALTER TABLE `specs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suburb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Luccas Almeida','luccas641@gmail.com','$2y$10$fn.ng2bbASNJ5NogdX719u6i.KDZKL64.IkB3L1T6IF2ofHRJzv4O','325','kjgh','kh','kjgh','kjgh',NULL,'2018-05-20 13:49:45','2018-05-20 13:49:45'),(3,'luccas almeida','luccas64@msn.com','$2y$10$gv6dRNDOLthWsi.P4jICz.w7C0dWy7y.nBKPV0/9qSmUM4UUZLF3m',NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-20 14:24:20','2018-05-20 14:24:20'),(4,'jh','fjhfg@adf.com','$2y$10$Ds.MNbQ5cV8yDBmqzLOiHec6oHeEiOd0JANjaJRnf8gSC1jBS.OIu',NULL,NULL,NULL,NULL,NULL,NULL,'2018-05-20 15:29:39','2018-05-20 15:29:39');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-27 21:53:51
