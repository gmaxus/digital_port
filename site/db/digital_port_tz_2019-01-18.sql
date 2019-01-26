# ************************************************************
# Sequel Pro SQL dump
# Версия 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Адрес: localhost (MySQL 5.7.21)
# Схема: digital_port_tz
# Время создания: 2019-01-17 14:19:34 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Дамп таблицы todos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `todos`;

CREATE TABLE `todos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `done` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `todos` WRITE;
/*!40000 ALTER TABLE `todos` DISABLE KEYS */;

INSERT INTO `todos` (`id`, `name`, `priority`, `done`, `created_at`, `updated_at`)
VALUES
	(1,'Iure dolor culpa dolor vel.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(2,'Omnis vero neque et corrupti.',0,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(3,'Ipsum et nam sequi quia.',2,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(4,'Odit at est iste ex.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(5,'Ut doloribus velit expedita.',0,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(6,'Est aliquam occaecati natus.',2,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(7,'Est porro ut ipsa est.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(8,'Molestias enim et totam in.',0,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(9,'Totam nihil et eos harum non.',0,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(10,'Et et ex neque tenetur.',0,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(11,'Et et quisquam sed et.',1,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(12,'Qui mollitia quia eligendi.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(13,'Amet neque earum nulla.',1,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(14,'Vel aut placeat rerum quo.',2,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(15,'Qui numquam qui nihil aut.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(16,'Voluptas sequi fuga ut.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(17,'Rem neque ipsa illum sint.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(18,'Fugit est suscipit ut culpa.',0,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(19,'Fuga ipsam dolore sunt.',0,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(20,'Vitae nulla possimus rem.',1,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(21,'Et voluptatem aut quis velit.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(22,'Eos qui corrupti illo.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(23,'Aut et earum eligendi et.',2,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(24,'Ullam quod ut velit sed.',0,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(25,'Ut doloremque et aut nostrum.',0,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(26,'Culpa qui quia mollitia rem.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(27,'Minima quis sit quam.',2,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(28,'Enim sunt non ab.',1,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(29,'Voluptas est recusandae et.',1,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(30,'Cum excepturi et aut.',1,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(31,'Sunt quidem enim eos id.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(32,'Non est nesciunt qui nihil.',2,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(33,'Dolore veritatis amet rem.',1,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(34,'Ea amet iure est.',2,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(35,'Sed aut ex ut ut aliquid.',0,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(36,'Voluptate et soluta nesciunt.',0,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(37,'Magni incidunt totam maxime.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(38,'Et sequi vel voluptas.',1,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(39,'Dolores laudantium qui id.',0,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(40,'Commodi ea quidem itaque qui.',2,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(41,'Vel ex illum perspiciatis ut.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(42,'Dolorum odit fugit in ullam.',1,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(43,'Qui eum nobis cumque.',2,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(44,'Unde asperiores delectus qui.',2,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(45,'Eligendi eum vel at ab nihil.',2,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(46,'Et deserunt eum commodi non.',1,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(47,'Omnis non minus natus ut.',1,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(48,'Eius ut voluptas ex unde est.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(49,'Est omnis facilis dolorum ad.',0,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(50,'Vel et architecto culpa est.',1,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(51,'Amet quas et asperiores a.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(52,'Officiis quos ab eum.',2,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(53,'Qui praesentium libero nobis.',1,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(54,'Dolores a vel rerum magni.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(55,'Aut quia autem porro.',0,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(56,'Vel neque optio sit nemo.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(57,'Id cum expedita aut fugiat.',2,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(58,'Dolorum aut temporibus quia.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(59,'Tenetur et dolores et et.',2,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(60,'Non maxime quidem iste neque.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(61,'Eos quam ut hic quod nam.',2,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(62,'Et sed est ut illo.',2,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(63,'Vel ipsum quae alias ut.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(64,'Aut vero sed ipsum et.',0,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(65,'Optio est aut aut sed nam.',0,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(66,'Dolorem quis et tenetur fuga.',2,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(67,'Placeat ut est aut quod amet.',1,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(68,'Neque aut veniam vel.',0,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(69,'Autem quia non et qui quae.',2,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(70,'Reiciendis id eum dolores.',2,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(71,'Minima minima unde aut eum.',0,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(72,'Atque magnam distinctio et.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(73,'Ut quod odio ipsum et sit.',0,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(74,'Ullam sint soluta esse.',0,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(75,'Et beatae rem velit non.',0,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(76,'Ea ut at maiores incidunt.',0,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(77,'Numquam distinctio in nulla.',2,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(78,'Quas possimus qui et ab.',1,1,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(79,'Qui ea maiores qui ut.',1,0,'2019-01-17 09:03:03','2019-01-17 09:03:03'),
	(80,'Sed delectus unde minus.',2,0,'2019-01-17 09:03:03','2019-01-17 09:03:03');

/*!40000 ALTER TABLE `todos` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
