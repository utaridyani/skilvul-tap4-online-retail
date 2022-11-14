/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.24-MariaDB : Database - tap4_online_retail
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tap4_online_retail` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `tap4_online_retail`;

/*Table structure for table `barang` */

DROP TABLE IF EXISTS `barang`;

CREATE TABLE `barang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `harga` bigint(20) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `id_supplier` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_kategori` (`id_kategori`),
  KEY `id_supplier` (`id_supplier`),
  CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_barang` (`id`),
  CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

/*Data for the table `barang` */

insert  into `barang`(`id`,`nama`,`harga`,`stok`,`id_kategori`,`id_supplier`) values 
(1,'Nike Classic Cortez',3000000,5,6,1),
(2,'Nike Air Force 1 Mid 07',5000000,2,6,6),
(3,'Nike Air Max 95',2500000,20,6,1),
(4,'Eiger Equinox Carrier 45L',300000,5,5,3),
(5,'Eiger Riding Legato',250000,5,5,3),
(6,'Eiger Focus Camera Backpack',350000,1,5,3),
(7,'Avoskin Perfect Hydrating Treatment Essence',180000,30,11,10),
(8,'Avoskin Miraculous Refining Toner',150000,40,11,10),
(9,'Avoskin Miraculous Retinol Ampoule',120000,50,11,10),
(10,'Avoskin Intensive Nourishing Eye Cream',90000,14,11,10),
(11,'Cardigan 001',80000,10,12,9),
(12,'Crop Top 12',40000,5,12,9),
(13,'Corset',75000,7,12,9),
(14,'Hoodie',200000,15,12,9),
(15,'Korean Shirt',150000,18,12,9),
(16,'Buku Tulis',5000,100,3,7),
(17,'Pensil Mekanik',7000,70,3,7),
(18,'Pulpen Gliter',3000,85,3,7),
(19,'Notebook',25000,15,3,7),
(20,'Correction Pen',8000,75,3,7);

/*Table structure for table `kategori_barang` */

DROP TABLE IF EXISTS `kategori_barang`;

CREATE TABLE `kategori_barang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `satuan` varchar(50) DEFAULT NULL,
  `ket` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

/*Data for the table `kategori_barang` */

insert  into `kategori_barang`(`id`,`nama`,`satuan`,`ket`) values 
(1,'sandal','pasang','produk alas kaki'),
(2,'barang elektronik','buah','produk yang memerlukan listrik'),
(3,'alat tulis','buah','peralatan sekolah dan kantor'),
(4,'minuman','botol','minuman botolan'),
(5,'tas','buah','tas wanita dan pria'),
(6,'sepatu','pasang','alas kaki'),
(7,'obat-obatan','kaplet','vitamin berbentuk tablet'),
(8,'barang pecah-belah','buah','peralatan dan dekorasi pecah belah'),
(9,'peralatan rumah','buah','peralatan rumah tangga'),
(10,'skincare','buah','alat-alat perawatan kecantikan'),
(11,'make up','buah','alat-alat kecantikan'),
(12,'baju','buah','baju wanita dan pria');

/*Table structure for table `pembeli` */

DROP TABLE IF EXISTS `pembeli`;

CREATE TABLE `pembeli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` varchar(150) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

/*Data for the table `pembeli` */

insert  into `pembeli`(`id`,`nama`,`alamat`,`username`,`password`,`email`) values 
(1,'utari','denpasar','utari','utari1','utari@gmail.com'),
(2,'dyani','badung','dyani','dyani1','dyani@gmail.com'),
(3,'laksmi','tabanan','laksmi','laksmi1','laksmi@gmail.com'),
(4,'paramitha','denpasar','paramitha','paramitha1','putu@gmail.com'),
(5,'utama','bangli','utama','utama1','utama@gmail.com'),
(6,'dyana','gianyar','dyana','dyana1','dyana@gmail.com'),
(7,'putri','karangasem','putri','putri1','putri@gmail.com'),
(8,'kirana','denpasar','kirana','kirana1','kirana@gmail.com'),
(9,'gita','badung','gita','gita1','gita@gmail.com'),
(10,'nadia','dalung','nadia','nadia1','nadia@gmail.com'),
(11,'friska','tabanan','friska','friska1','friska@gmail.com'),
(12,'jennita','denpasar','jennita','jennita1','jennita@gmail.com'),
(13,'hrida','gianyar','hrida','hrida1','hrida@gmail.com');

/*Table structure for table `pesanan` */

DROP TABLE IF EXISTS `pesanan`;

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pembeli` int(11) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `total_pembelian` bigint(20) DEFAULT NULL,
  `metode_pembayaran` enum('transfer_bank','indomaret') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pembeli` (`id_pembeli`),
  CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`id_pembeli`) REFERENCES `pembeli` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

/*Data for the table `pesanan` */

insert  into `pesanan`(`id`,`id_pembeli`,`tgl`,`total_pembelian`,`metode_pembayaran`) values 
(13,1,'2022-10-01',400000,'transfer_bank'),
(14,1,'2022-10-01',500000,'transfer_bank'),
(15,2,'2022-10-01',1000000,'transfer_bank'),
(16,3,'2022-10-01',400000,'transfer_bank'),
(17,7,'2022-10-02',100000,'transfer_bank'),
(18,7,'2022-10-02',200000,'transfer_bank'),
(19,6,'2022-10-07',3000000,'transfer_bank'),
(20,5,'2022-11-01',200000,'indomaret'),
(21,2,'2022-11-01',100000,'transfer_bank'),
(22,10,'2022-11-02',3000000,'transfer_bank'),
(23,1,'2022-11-03',400000,'transfer_bank'),
(24,2,'2022-11-04',200000,'indomaret');

/*Table structure for table `pesanan_detail` */

DROP TABLE IF EXISTS `pesanan_detail`;

CREATE TABLE `pesanan_detail` (
  `id_pesanan` int(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  KEY `id_pesanan` (`id_pesanan`),
  KEY `id_barang` (`id_barang`),
  CONSTRAINT `pesanan_detail_ibfk_1` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id`),
  CONSTRAINT `pesanan_detail_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `pesanan_detail` */

insert  into `pesanan_detail`(`id_pesanan`,`id_barang`,`jumlah`) values 
(21,1,2),
(22,19,1),
(13,4,2),
(13,1,2),
(13,11,1),
(14,12,1),
(15,2,1),
(15,5,1),
(16,3,2),
(17,1,3),
(18,6,1),
(19,4,1),
(19,5,2),
(20,1,2),
(21,2,3),
(21,5,4),
(22,7,1);

/*Table structure for table `suppliers` */

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` varchar(150) DEFAULT NULL,
  `kontak` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

/*Data for the table `suppliers` */

insert  into `suppliers`(`id`,`nama`,`alamat`,`kontak`) values 
(1,'PT. Suka Sari','Surabaya','sukasari@gmail.com'),
(2,'PT. Suka Bumi','Medan','sukabumi@gmail.com'),
(3,'PT. Putra Jaya','Surabaya','putrajaya@gmail.com'),
(4,'PT. Merta Jaya','Bali','mertajasa@gmail.com'),
(5,'PT. Anugrah Indah','Jakarta','anugrahindah@gmail.com'),
(6,'PT. Citra Dua','Pondok Indah','mcitradua@gmail.com'),
(7,'UD Hijau','Denpasar','udhijau@gmail.com'),
(8,'UD Mulia Utama','Bandung','muliautama@gmail.com'),
(9,'UD Barat Daya','Semarang','baratdaya@gmail.com'),
(10,'UD Dua Kelinci','Lombok','duakelinci@gmail.com'),
(11,'UD Indah Dua','Semarang','indahdua@gmail.com'),
(12,'UD Amerta Bumi','Jakarta','amertabumi@gmail.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
