/*
SQLyog Community v13.1.2 (64 bit)
MySQL - 5.5.29 : Database - encryption
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`encryption` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `encryption`;

/*Table structure for table `encrypted` */

DROP TABLE IF EXISTS `encrypted`;

CREATE TABLE `encrypted` (
  `id` INT(100) NOT NULL AUTO_INCREMENT,
  `imgpath` VARCHAR(100) DEFAULT NULL,
  `identifier` VARCHAR(100) NOT NULL,
  `status` VARCHAR(100) DEFAULT 'Encrypted',
  PRIMARY KEY (`id`,`identifier`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
ALTER TABLE `encrypted` ADD UNIQUE (`imgpath`,`identifier`);

DROP TABLE IF EXISTS `decrypted`;

CREATE TABLE `decrypted` (
  `id` INT(100) NOT NULL AUTO_INCREMENT,
  `imgpath` VARCHAR(100) DEFAULT NULL,
  `identifier` VARCHAR(100) NOT NULL,
  `status` VARCHAR(100) DEFAULT 'Decrypted',
  `email` VARCHAR(100) NOT NULL,
  
  PRIMARY KEY (`id`,`identifier`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `encrypted` 

LOCK TABLES `encrypted` WRITE;

insert  into `encrypted`(`id`,`imgpath`,`identifier`,`status`) values 
(1,'Decrypted Images\\as.jpg','ce4gP3E9','Decrypted');

UNLOCK TABLES;

/*Table structure for table `lsbimgs` */

DROP TABLE IF EXISTS `lsbimgs`;

CREATE TABLE `lsbimgs` (
  `id` INT(100) NOT NULL AUTO_INCREMENT,
  `imgname` VARCHAR(100) DEFAULT NULL,
  `imgpath` VARCHAR(100) DEFAULT NULL,
  `status` VARCHAR(100) DEFAULT NULL,
  `identifier` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

ALTER TABLE `lsbimgs` ADD UNIQUE (`identifier`);
/*Data for the table `lsbimgs` 

LOCK TABLES `lsbimgs` WRITE;

insert  into `lsbimgs`(`id`,`imgname`,`imgpath`,`status`,`identifier`) values 
`upload`(1,'bb.jpg','Applied LSB Images\\bb.jpg','Applied LSB','ce4gP3E9');

UNLOCK TABLES;

/*Table structure for table `requests` */

DROP TABLE IF EXISTS `requests`;

CREATE TABLE `requests` (
  `id` INT(100) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) DEFAULT NULL,
  `email` VARCHAR(100) DEFAULT NULL,
  `mob` VARCHAR(100) DEFAULT NULL,
  `add` VARCHAR(100) DEFAULT NULL,
  `identifier` VARCHAR(100) NOT NULL,
  `skey` VARCHAR(100) DEFAULT NULL,
  `imgpath` VARCHAR(100) DEFAULT NULL,
  `status` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`identifier`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


/*Data for the table `requests` 

LOCK TABLES `requests` WRITE;

insert  into `requests`(`id`,`name`,`email`,`mob`,`add`,`identifier`,`skey`,`imgpath`,`status`) values 
(1,'Harekrishna Jena','hk@gmail.com','7978418005','Hyderabad','ce4gP3E9','hbN+YuHTLkA6ACxEScIGGg==','bb.jpg','Accepted');

UNLOCK TABLES;

/*Table structure for table `upload` */

DROP TABLE IF EXISTS `upload`;

CREATE TABLE `upload` (
  `id` INT(100) NOT NULL AUTO_INCREMENT,
  `imgname` VARCHAR(100) DEFAULT NULL,
  `imgpath` VARCHAR(100) DEFAULT NULL,
  `skey` VARCHAR(300) DEFAULT NULL,
  `status` VARCHAR(100) DEFAULT NULL,
  `identifier` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`,`identifier`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

ALTER TABLE `upload` ADD UNIQUE (`identifier`);
/*Data for the table `upload` 

LOCK TABLES `upload` WRITE;

insert  into `upload`(`id`,`imgname`,`imgpath`,`skey`,`status`,`identifier`) values 
(1,'as.jpg','Encrypted Images\\as.jpg','hbN+YuHTLkA6ACxEScIGGg==','Encrypted','ce4gP3E9');

UNLOCK TABLES;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` INT(100) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) DEFAULT NULL,
  `email` VARCHAR(100) DEFAULT NULL,
  `password` VARCHAR(512) DEFAULT NULL,
  `mob` VARCHAR(100) DEFAULT NULL,
  `address` VARBINARY(100) DEFAULT NULL,
  `pin` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

ALTER TABLE `user` ADD UNIQUE (`email`);
/*Data for the table `user` 

LOCK TABLES `user` WRITE;

insert  into `user`(`id`,`name`,`email`,`password`,`mob`,`address`,`pin`) values 
(3,'mohan','mms@gmail.com','1234','9010819768','Hyderabad','500070');

UNLOCK TABLES;
*/
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
