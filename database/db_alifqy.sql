-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 31, 2024 at 11:07 AM
-- Server version: 8.3.0
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_alifqy`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_nama` varchar(100) NOT NULL,
  `admin_username` varchar(100) NOT NULL,
  `admin_password` varchar(100) NOT NULL,
  `admin_foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_nama`, `admin_username`, `admin_password`, `admin_foto`) VALUES
(1, 'Iren', 'admin', 'e7a69bc15ac5087cd8fcea6c0f17fa83', '1352025327_avatar.png');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_nama` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_hp` varchar(20) NOT NULL,
  `customer_alamat` text NOT NULL,
  `customer_password` varchar(255) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_nama`, `customer_email`, `customer_hp`, `customer_alamat`, `customer_password`) VALUES
(9, 'iren', 'iren@gmail.com', '1234', 'Mamuju', '76e1c150019a9193180de238527fb512');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` int NOT NULL AUTO_INCREMENT,
  `invoice_tanggal` date NOT NULL,
  `invoice_customer` int NOT NULL,
  `invoice_nama` varchar(255) NOT NULL,
  `invoice_hp` varchar(255) NOT NULL,
  `invoice_alamat` text NOT NULL,
  `invoice_provinsi` varchar(255) NOT NULL,
  `invoice_kabupaten` varchar(255) NOT NULL,
  `invoice_kurir` varchar(255) NOT NULL,
  `invoice_berat` int NOT NULL,
  `invoice_ongkir` int NOT NULL,
  `invoice_total_bayar` int NOT NULL,
  `invoice_status` int NOT NULL,
  `invoice_resi` varchar(255) NOT NULL,
  `invoice_bukti` text NOT NULL,
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `invoice_tanggal`, `invoice_customer`, `invoice_nama`, `invoice_hp`, `invoice_alamat`, `invoice_provinsi`, `invoice_kabupaten`, `invoice_kurir`, `invoice_berat`, `invoice_ongkir`, `invoice_total_bayar`, `invoice_status`, `invoice_resi`, `invoice_bukti`) VALUES
(12, '2024-08-06', 9, 'Donatur', '354453534', 'Rangas, Kabupaten Mamuju', 'Sulawesi Barat', 'Mamasa', 'Pos Indonesia - Pos Reguler', 200, 12000, 212000, 0, '', ''),
(14, '2023-02-15', 9, 'Customer B', '082234567890', 'Alamat B', 'Provinsi B', 'Kabupaten B', 'J&T', 1500, 15000, 250000, 4, 'RESI124', ''),
(16, '2023-03-20', 9, 'Customer D', '084234567890', 'Alamat D', 'Provinsi D', 'Kabupaten D', 'Tiki', 2500, 25000, 350000, 2, 'RESI126', ''),
(18, '2023-06-05', 9, 'Customer F', '086234567890', 'Alamat F', 'Provinsi F', 'Kabupaten F', 'JNE', 3500, 35000, 450000, 0, 'RESI128', ''),
(20, '2023-08-15', 9, 'Customer H', '088234567890', 'Alamat H', 'Provinsi H', 'Kabupaten H', 'Pos Indonesia', 4500, 45000, 550000, 4, 'RESI130', ''),
(22, '2023-10-25', 9, 'Customer J', '081034567890', 'Alamat J', 'Provinsi J', 'Kabupaten J', 'SiCepat', 5500, 55000, 650000, 2, 'RESI132', '');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
CREATE TABLE IF NOT EXISTS `kategori` (
  `kategori_id` int NOT NULL AUTO_INCREMENT,
  `kategori_nama` varchar(255) NOT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori_nama`) VALUES
(1, 'Tidak Berkategori'),
(3, 'Baju'),
(4, 'Celana'),
(5, 'Tas Selempang'),
(6, 'Sepatu'),
(7, 'Celana Pendek'),
(8, 'Jaket'),
(9, 'Aksesoris'),
(10, 'Hoodie');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

DROP TABLE IF EXISTS `produk`;
CREATE TABLE IF NOT EXISTS `produk` (
  `produk_id` int NOT NULL AUTO_INCREMENT,
  `produk_nama` varchar(255) NOT NULL,
  `produk_kategori` int NOT NULL,
  `produk_harga` int NOT NULL,
  `produk_keterangan` text NOT NULL,
  `produk_jumlah` int NOT NULL,
  `produk_berat` int NOT NULL,
  `produk_foto1` varchar(255) DEFAULT NULL,
  `produk_foto2` varchar(255) DEFAULT NULL,
  `produk_foto3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`produk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`produk_id`, `produk_nama`, `produk_kategori`, `produk_harga`, `produk_keterangan`, `produk_jumlah`, `produk_berat`, `produk_foto1`, `produk_foto2`, `produk_foto3`) VALUES
(8, 'Sepatu Converse Allstar', 6, 1000000, '<p>Keren bla bla<br></p>', 2, 3000, '2025018106_sepatu converse.jpg', '', ''),
(10, 'Kaos Kaki', 9, 400000, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br>tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,<br>quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo<br>consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse<br>cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non<br>proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br></p>', 4, 100, '237374360_kaos kaki.jpg', '', ''),
(11, 'Hoody Air Jordan', 3, 80000, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br>tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,<br>quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo<br>consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse<br>cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non<br>proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br></p>', 20, 100, '1167893117_hoodie.jpg', '', ''),
(12, 'BajuBasket Dry', 3, 120000, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br>tempor incididunt ut labore et dolore mag Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br>tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,<br>quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo<br>consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse<br>cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non<br>proident, sunt in culpa qui officia deserunt mollit anim id est laborum. na aliqua. Ut enim ad minim veniam,<br>quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo<br>consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse<br>cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non<br>proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br></p>', 2, 100, '427256309_baju basket.jpg', '427256309_baju basket.jpg', ''),
(13, 'Baju Basket', 3, 130000, '<p>Sangat nyaman di gunakan</p>', 20, 1000, '1806768874_baju.jpg', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
CREATE TABLE IF NOT EXISTS `transaksi` (
  `transaksi_id` int NOT NULL AUTO_INCREMENT,
  `transaksi_invoice` int NOT NULL,
  `transaksi_produk` int NOT NULL,
  `transaksi_jumlah` int NOT NULL,
  `transaksi_harga` int NOT NULL,
  PRIMARY KEY (`transaksi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`transaksi_id`, `transaksi_invoice`, `transaksi_produk`, `transaksi_jumlah`, `transaksi_harga`) VALUES
(1, 0, 3, 1, 120000),
(2, 0, 1, 1, 1234),
(3, 0, 3, 1, 120000),
(4, 0, 1, 1, 1234),
(5, 1, 3, 1, 120000),
(6, 1, 1, 1, 1234),
(9, 3, 3, 1, 120000),
(10, 4, 4, 1, 123000),
(26, 12, 12, 1, 120000),
(27, 12, 11, 1, 80000);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
