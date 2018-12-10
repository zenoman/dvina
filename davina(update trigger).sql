-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 10, 2018 at 08:34 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `davina`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) DEFAULT NULL,
  `password` text,
  `nama` varchar(100) DEFAULT NULL,
  `telp` varchar(25) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `level` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `nama`, `telp`, `email`, `level`) VALUES
(2, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '085604556715', 'satriosuklun@gmail.com', 'admin'),
(3, 'superadmin', '827ccb0eea8a706c4c34a16891f84e7b', 'super admin', '085682374023', 'satriosuklun@gmail.com', 'super_admin'),
(4, 'devasatrio', '74b213f68f648006a318f52713450f27', 'deva satrio', '085604556714', 'satriosuklun@gmail.com', 'programer');

-- --------------------------------------------------------

--
-- Table structure for table `detail_cancel`
--

DROP TABLE IF EXISTS `detail_cancel`;
CREATE TABLE IF NOT EXISTS `detail_cancel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idwarna` int(11) DEFAULT NULL,
  `iduser` int(11) DEFAULT NULL,
  `kode` text,
  `tgl` varchar(20) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `barang` varchar(100) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `diskon` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_cancel`
--

INSERT INTO `detail_cancel` (`id`, `idwarna`, `iduser`, `kode`, `tgl`, `jumlah`, `harga`, `barang`, `total`, `diskon`) VALUES
(5, 38, 15, 'Cancel00001', '04-12-2018', 3, 12000, 'jilbab malang 3', 36000, 0),
(6, 32, 15, 'Cancel00001', '04-12-2018', 2, 20000, 'jilbab kediri 2', 36000, 10),
(7, 32, 15, 'Cancel00001', '04-12-2018', 4, 20000, 'jilbab kediri 2', 72000, 10);

--
-- Triggers `detail_cancel`
--
DROP TRIGGER IF EXISTS `in_stok`;
DELIMITER $$
CREATE TRIGGER `in_stok` AFTER INSERT ON `detail_cancel` FOR EACH ROW update tb_barangs set stok=stok+new.jumlah where idbarang=new.idwarna
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `gambar`
--

DROP TABLE IF EXISTS `gambar`;
CREATE TABLE IF NOT EXISTS `gambar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(30) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gambar`
--

INSERT INTO `gambar` (`id`, `kode_barang`, `nama`) VALUES
(10, 'BRG00004', '1541847113-download.jpg'),
(11, 'BRG00004', '1541847113-high-quality-muslim-hijab-scarf-cotton-jersey-hijabs-turban-muslim-hijab-infiity-scarf-muslim-head-coverings-92.jpg'),
(12, 'BRG00005', '1541847133-images-(2).jpg'),
(13, 'BRG00005', '1541847133-instant-wear-arabic-head-dress-rayon-hijab.jpg_350x350.jpg'),
(14, 'BRG00006', '1541850464-21220959_b_v1.jpg'),
(15, 'BRG00007', '1541850483-high-quality-muslim-hijab-scarf-cotton-jersey-hijabs-turban-muslim-hijab-infiity-scarf-muslim-head-coverings-92.jpg'),
(16, 'BRG00008', '1542109148-images-(1).jpg'),
(17, 'BRG00008', '1542109149-instant-wear-arabic-head-dress-rayon-hijab.jpg_350x350.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `log_cancel`
--

DROP TABLE IF EXISTS `log_cancel`;
CREATE TABLE IF NOT EXISTS `log_cancel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faktur` varchar(300) DEFAULT NULL,
  `total_akhir` int(11) DEFAULT NULL,
  `tgl` varchar(25) DEFAULT NULL,
  `bulan` int(5) DEFAULT NULL,
  `status` enum('dicancel','ditolak') DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `keterangan` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_cancel`
--

INSERT INTO `log_cancel` (`id`, `faktur`, `total_akhir`, `tgl`, `bulan`, `status`, `id_user`, `id_admin`, `keterangan`) VALUES
(3, 'Cancel00001', 144000, '04-12-2018', 12, 'ditolak', 15, 4, 'GHJHHJK');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2014_10_12_000000_create_users_table', 1),
(5, '2014_10_12_100000_create_password_resets_table', 1),
(6, '2018_10_11_054351_create_pemesanans_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pemesanans`
--

DROP TABLE IF EXISTS `pemesanans`;
CREATE TABLE IF NOT EXISTS `pemesanans` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kodePesan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iduser` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `choiches` enum('belum','sudah','proses') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `idsettings` int(11) NOT NULL AUTO_INCREMENT,
  `webName` varchar(100) DEFAULT NULL,
  `kontak1` varchar(45) DEFAULT NULL,
  `kontak2` varchar(45) DEFAULT NULL,
  `kontak3` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `ico` varchar(45) DEFAULT NULL,
  `meta` text,
  `logo` varchar(50) DEFAULT NULL,
  `keterangan` int(11) DEFAULT NULL,
  `alamat` int(11) DEFAULT NULL,
  `nama_toko` int(11) DEFAULT NULL,
  `max_tgl` int(5) DEFAULT NULL,
  PRIMARY KEY (`idsettings`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`idsettings`, `webName`, `kontak1`, `kontak2`, `kontak3`, `email`, `ico`, `meta`, `logo`, `keterangan`, `alamat`, `nama_toko`, `max_tgl`) VALUES
(1, 'Devina', '085604556777', '089456817354', '085601473652', 'satriosuklun@gmail.com', '1542366882-190835.png', 'toko hijab murah meriah', '1543717647-logo-dvina.png', NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `judul`, `foto`) VALUES
(2, 'ini slide 2 baru gambarnya', '1541552859-20180227_054709.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_bank`
--

DROP TABLE IF EXISTS `tb_bank`;
CREATE TABLE IF NOT EXISTS `tb_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_bank` varchar(40) DEFAULT NULL,
  `rekening` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_bank`
--

INSERT INTO `tb_bank` (`id`, `nama_bank`, `rekening`) VALUES
(1, 'bayar ditoko\r\n', '-'),
(2, 'bri', '009887878'),
(3, 'bni', '0111'),
(4, 'bank jatim', '0222'),
(5, 'mandiri Syariah', '0333');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barangouts`
--

DROP TABLE IF EXISTS `tb_barangouts`;
CREATE TABLE IF NOT EXISTS `tb_barangouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(100) DEFAULT NULL,
  `barang` varchar(100) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `tgl` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_barangs`
--

DROP TABLE IF EXISTS `tb_barangs`;
CREATE TABLE IF NOT EXISTS `tb_barangs` (
  `idbarang` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(100) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `warna` varchar(45) DEFAULT NULL,
  `barang_jenis` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`idbarang`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barangs`
--

INSERT INTO `tb_barangs` (`idbarang`, `kode`, `stok`, `warna`, `barang_jenis`) VALUES
(32, 'BRG00004', 10, 'merah', 'jilbab kediri 2 merah'),
(33, 'BRG00004', 10, 'biru', 'jilbab kediri 2 biru'),
(34, 'BRG00005', 10, 'putih', 'jilbab malang 2 putih'),
(35, 'BRG00005', 2, 'putih merah', 'jilbab malang 2 putih merah'),
(36, 'BRG00006', 10, 'merah', 'jilbab kediri 3 merah'),
(37, 'BRG00006', 12, 'biru', 'jilbab kediri 3 biru'),
(38, 'BRG00007', 10, 'putih', 'jilbab malang 3 putih'),
(39, 'BRG00007', 2, 'putih merah', 'jilbab malang 3 putih merah'),
(40, 'BRG00008', 20, 'hitam', 'jilbab keren hitam'),
(41, 'BRG00008', 10, 'biru', 'jilbab keren biru');

-- --------------------------------------------------------

--
-- Table structure for table `tb_details`
--

DROP TABLE IF EXISTS `tb_details`;
CREATE TABLE IF NOT EXISTS `tb_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idwarna` int(11) DEFAULT NULL,
  `iduser` int(11) DEFAULT NULL,
  `faktur` varchar(100) DEFAULT NULL,
  `tgl` varchar(30) DEFAULT NULL,
  `tgl_kadaluarsa` varchar(30) DEFAULT NULL,
  `kode_barang` varchar(100) DEFAULT NULL,
  `barang` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total_a` int(11) DEFAULT NULL,
  `diskon` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `admin` varchar(100) DEFAULT NULL,
  `metode` enum('langsung','pesan') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_details`
--

INSERT INTO `tb_details` (`id`, `idwarna`, `iduser`, `faktur`, `tgl`, `tgl_kadaluarsa`, `kode_barang`, `barang`, `harga`, `jumlah`, `total_a`, `diskon`, `total`, `admin`, `metode`) VALUES
(6, 34, 15, 'DVINA00003', '04-12-2018', '6-12-2018', 'BRG00005', 'jilbab malang 2', 12000, 2, 24000, 0, 24000, NULL, 'pesan'),
(9, 33, 3213, NULL, NULL, NULL, 'br001', 'mm', 9000, 2, 0, NULL, NULL, NULL, NULL);

--
-- Triggers `tb_details`
--
DROP TRIGGER IF EXISTS `min_stok`;
DELIMITER $$
CREATE TRIGGER `min_stok` AFTER INSERT ON `tb_details` FOR EACH ROW update tb_barangs set stok=stok-new.jumlah where idbarang=new.idwarna
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategoris`
--

DROP TABLE IF EXISTS `tb_kategoris`;
CREATE TABLE IF NOT EXISTS `tb_kategoris` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(100) DEFAULT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kategoris`
--

INSERT INTO `tb_kategoris` (`id`, `kategori`, `gambar`) VALUES
(4, 'kerudung wanita', '1541756913-0056a08d4b2c91f.jpg'),
(5, 'kerudung top', '1541851060-34-android-flat.png'),
(6, 'kerudung mantul', '1541851081-190835.png'),
(7, 'kerudung sip', '1541851116-1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kodes`
--

DROP TABLE IF EXISTS `tb_kodes`;
CREATE TABLE IF NOT EXISTS `tb_kodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kategori` int(11) DEFAULT NULL,
  `kode_barang` varchar(100) DEFAULT NULL,
  `barang` varchar(150) DEFAULT NULL,
  `harga_barang` int(11) DEFAULT NULL,
  `deskripsi` mediumtext,
  `diskon` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kodes`
--

INSERT INTO `tb_kodes` (`id`, `id_kategori`, `kode_barang`, `barang`, `harga_barang`, `deskripsi`, `diskon`) VALUES
(19, 4, 'BRG00004', 'jilbab kediri 2', 20000, 'ini deskripsi jilbab kediri', 10),
(20, 4, 'BRG00005', 'jilbab malang 2', 12000, 'ini deskripsi jilbab malang', 0),
(21, 4, 'BRG00006', 'jilbab kediri 3', 20000, 'ini deskripsi jilbab kediri 3', 5),
(22, 4, 'BRG00007', 'jilbab malang 3', 12000, 'ini deskripsi jilbab malang 3', 0),
(23, 6, 'BRG00008', 'jilbab keren', 25000, 'kerudung mantab untuk sehari hari', 15);

-- --------------------------------------------------------

--
-- Table structure for table `tb_stokawals`
--

DROP TABLE IF EXISTS `tb_stokawals`;
CREATE TABLE IF NOT EXISTS `tb_stokawals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idbarang` int(11) DEFAULT NULL,
  `idwarna` int(11) DEFAULT NULL,
  `kode_barang` varchar(100) DEFAULT NULL,
  `barang` varchar(100) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `tgl` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_stokawals`
--

INSERT INTO `tb_stokawals` (`id`, `idbarang`, `idwarna`, `kode_barang`, `barang`, `jumlah`, `tgl`) VALUES
(39, 19, 32, 'BRG00004', 'jilbab kediri 2', 10, '10-11-2018'),
(40, 19, 33, 'BRG00004', 'jilbab kediri 2', 12, '10-11-2018'),
(41, 20, 34, 'BRG00005', 'jilbab malang 2', 10, '10-11-2018'),
(42, 20, 35, 'BRG00005', 'jilbab malang 2', 2, '10-11-2018'),
(43, 21, 36, 'BRG00006', 'jilbab kediri 3', 10, '10-11-2018'),
(44, 21, 37, 'BRG00006', 'jilbab kediri 3', 12, '10-11-2018'),
(45, 22, 38, 'BRG00007', 'jilbab malang 3', 10, '10-11-2018'),
(46, 22, 39, 'BRG00007', 'jilbab malang 3', 2, '10-11-2018'),
(47, 19, 32, 'BRG00004', 'jilbab kediri 2', 10, '11-11-2018'),
(48, 19, 33, 'BRG00004', 'jilbab kediri 2', 12, '11-11-2018'),
(49, 20, 34, 'BRG00005', 'jilbab malang 2', 10, '11-11-2018'),
(50, 20, 35, 'BRG00005', 'jilbab malang 2', 2, '11-11-2018'),
(51, 21, 36, 'BRG00006', 'jilbab kediri 3', 10, '11-11-2018'),
(52, 21, 37, 'BRG00006', 'jilbab kediri 3', 12, '11-11-2018'),
(53, 22, 38, 'BRG00007', 'jilbab malang 3', 10, '11-11-2018'),
(54, 22, 39, 'BRG00007', 'jilbab malang 3', 2, '11-11-2018'),
(55, 19, 32, 'BRG00004', 'jilbab kediri 2', 10, '12-11-2018'),
(56, 19, 33, 'BRG00004', 'jilbab kediri 2', 12, '12-11-2018'),
(57, 20, 34, 'BRG00005', 'jilbab malang 2', 10, '12-11-2018'),
(58, 20, 35, 'BRG00005', 'jilbab malang 2', 2, '12-11-2018'),
(59, 21, 36, 'BRG00006', 'jilbab kediri 3', 10, '12-11-2018'),
(60, 21, 37, 'BRG00006', 'jilbab kediri 3', 12, '12-11-2018'),
(61, 22, 38, 'BRG00007', 'jilbab malang 3', 10, '12-11-2018'),
(62, 22, 39, 'BRG00007', 'jilbab malang 3', 2, '12-11-2018'),
(63, 19, 32, 'BRG00004', 'jilbab kediri 2', 10, '13-11-2018'),
(64, 19, 33, 'BRG00004', 'jilbab kediri 2', 12, '13-11-2018'),
(65, 20, 34, 'BRG00005', 'jilbab malang 2', 10, '13-11-2018'),
(66, 20, 35, 'BRG00005', 'jilbab malang 2', 2, '13-11-2018'),
(67, 21, 36, 'BRG00006', 'jilbab kediri 3', 10, '13-11-2018'),
(68, 21, 37, 'BRG00006', 'jilbab kediri 3', 12, '13-11-2018'),
(69, 22, 38, 'BRG00007', 'jilbab malang 3', 10, '13-11-2018'),
(70, 22, 39, 'BRG00007', 'jilbab malang 3', 2, '13-11-2018'),
(71, 23, 40, 'BRG00008', 'jilbab keren', 20, '13-11-2018'),
(72, 23, 41, 'BRG00008', 'jilbab keren', 10, '13-11-2018'),
(73, 19, 32, 'BRG00004', 'jilbab kediri 2', 10, '15-11-2018'),
(74, 19, 33, 'BRG00004', 'jilbab kediri 2', 12, '15-11-2018'),
(75, 20, 34, 'BRG00005', 'jilbab malang 2', 10, '15-11-2018'),
(76, 20, 35, 'BRG00005', 'jilbab malang 2', 2, '15-11-2018'),
(77, 21, 36, 'BRG00006', 'jilbab kediri 3', 10, '15-11-2018'),
(78, 21, 37, 'BRG00006', 'jilbab kediri 3', 12, '15-11-2018'),
(79, 22, 38, 'BRG00007', 'jilbab malang 3', 10, '15-11-2018'),
(80, 22, 39, 'BRG00007', 'jilbab malang 3', 2, '15-11-2018'),
(81, 23, 40, 'BRG00008', 'jilbab keren', 20, '15-11-2018'),
(82, 23, 41, 'BRG00008', 'jilbab keren', 10, '15-11-2018'),
(83, 19, 32, 'BRG00004', 'jilbab kediri 2', 10, '16-11-2018'),
(84, 19, 33, 'BRG00004', 'jilbab kediri 2', 12, '16-11-2018'),
(85, 20, 34, 'BRG00005', 'jilbab malang 2', 10, '16-11-2018'),
(86, 20, 35, 'BRG00005', 'jilbab malang 2', 2, '16-11-2018'),
(87, 21, 36, 'BRG00006', 'jilbab kediri 3', 10, '16-11-2018'),
(88, 21, 37, 'BRG00006', 'jilbab kediri 3', 12, '16-11-2018'),
(89, 22, 38, 'BRG00007', 'jilbab malang 3', 10, '16-11-2018'),
(90, 22, 39, 'BRG00007', 'jilbab malang 3', 2, '16-11-2018'),
(91, 23, 40, 'BRG00008', 'jilbab keren', 20, '16-11-2018'),
(92, 23, 41, 'BRG00008', 'jilbab keren', 10, '16-11-2018'),
(93, 19, 32, 'BRG00004', 'jilbab kediri 2', 10, '19-11-2018'),
(94, 19, 33, 'BRG00004', 'jilbab kediri 2', 12, '19-11-2018'),
(95, 20, 34, 'BRG00005', 'jilbab malang 2', 10, '19-11-2018'),
(96, 20, 35, 'BRG00005', 'jilbab malang 2', 2, '19-11-2018'),
(97, 21, 36, 'BRG00006', 'jilbab kediri 3', 10, '19-11-2018'),
(98, 21, 37, 'BRG00006', 'jilbab kediri 3', 12, '19-11-2018'),
(99, 22, 38, 'BRG00007', 'jilbab malang 3', 10, '19-11-2018'),
(100, 22, 39, 'BRG00007', 'jilbab malang 3', 2, '19-11-2018'),
(101, 23, 40, 'BRG00008', 'jilbab keren', 20, '19-11-2018'),
(102, 23, 41, 'BRG00008', 'jilbab keren', 10, '19-11-2018'),
(103, 19, 32, 'BRG00004', 'jilbab kediri 2', 10, '24-11-2018'),
(104, 19, 33, 'BRG00004', 'jilbab kediri 2', 12, '24-11-2018'),
(105, 20, 34, 'BRG00005', 'jilbab malang 2', 10, '24-11-2018'),
(106, 20, 35, 'BRG00005', 'jilbab malang 2', 2, '24-11-2018'),
(107, 21, 36, 'BRG00006', 'jilbab kediri 3', 10, '24-11-2018'),
(108, 21, 37, 'BRG00006', 'jilbab kediri 3', 12, '24-11-2018'),
(109, 22, 38, 'BRG00007', 'jilbab malang 3', 10, '24-11-2018'),
(110, 22, 39, 'BRG00007', 'jilbab malang 3', 2, '24-11-2018'),
(111, 23, 40, 'BRG00008', 'jilbab keren', 20, '24-11-2018'),
(112, 23, 41, 'BRG00008', 'jilbab keren', 10, '24-11-2018'),
(113, 19, 32, 'BRG00004', 'jilbab kediri 2', 10, '25-11-2018'),
(114, 19, 33, 'BRG00004', 'jilbab kediri 2', 12, '25-11-2018'),
(115, 20, 34, 'BRG00005', 'jilbab malang 2', 10, '25-11-2018'),
(116, 20, 35, 'BRG00005', 'jilbab malang 2', 2, '25-11-2018'),
(117, 21, 36, 'BRG00006', 'jilbab kediri 3', 10, '25-11-2018'),
(118, 21, 37, 'BRG00006', 'jilbab kediri 3', 12, '25-11-2018'),
(119, 22, 38, 'BRG00007', 'jilbab malang 3', 10, '25-11-2018'),
(120, 22, 39, 'BRG00007', 'jilbab malang 3', 2, '25-11-2018'),
(121, 23, 40, 'BRG00008', 'jilbab keren', 20, '25-11-2018'),
(122, 23, 41, 'BRG00008', 'jilbab keren', 10, '25-11-2018'),
(123, 19, 32, 'BRG00004', 'jilbab kediri 2', 10, '26-11-2018'),
(124, 19, 33, 'BRG00004', 'jilbab kediri 2', 12, '26-11-2018'),
(125, 20, 34, 'BRG00005', 'jilbab malang 2', 10, '26-11-2018'),
(126, 20, 35, 'BRG00005', 'jilbab malang 2', 2, '26-11-2018'),
(127, 21, 36, 'BRG00006', 'jilbab kediri 3', 10, '26-11-2018'),
(128, 21, 37, 'BRG00006', 'jilbab kediri 3', 12, '26-11-2018'),
(129, 22, 38, 'BRG00007', 'jilbab malang 3', 10, '26-11-2018'),
(130, 22, 39, 'BRG00007', 'jilbab malang 3', 2, '26-11-2018'),
(131, 23, 40, 'BRG00008', 'jilbab keren', 20, '26-11-2018'),
(132, 23, 41, 'BRG00008', 'jilbab keren', 10, '26-11-2018'),
(133, 19, 32, 'BRG00004', 'jilbab kediri 2', 10, '28-11-2018'),
(134, 19, 33, 'BRG00004', 'jilbab kediri 2', 12, '28-11-2018'),
(135, 20, 34, 'BRG00005', 'jilbab malang 2', 10, '28-11-2018'),
(136, 20, 35, 'BRG00005', 'jilbab malang 2', 2, '28-11-2018'),
(137, 21, 36, 'BRG00006', 'jilbab kediri 3', 10, '28-11-2018'),
(138, 21, 37, 'BRG00006', 'jilbab kediri 3', 12, '28-11-2018'),
(139, 22, 38, 'BRG00007', 'jilbab malang 3', 10, '28-11-2018'),
(140, 22, 39, 'BRG00007', 'jilbab malang 3', 2, '28-11-2018'),
(141, 23, 40, 'BRG00008', 'jilbab keren', 20, '28-11-2018'),
(142, 23, 41, 'BRG00008', 'jilbab keren', 10, '28-11-2018'),
(143, 19, 32, 'BRG00004', 'jilbab kediri 2', 10, '29-11-2018'),
(144, 19, 33, 'BRG00004', 'jilbab kediri 2', 12, '29-11-2018'),
(145, 20, 34, 'BRG00005', 'jilbab malang 2', 10, '29-11-2018'),
(146, 20, 35, 'BRG00005', 'jilbab malang 2', 2, '29-11-2018'),
(147, 21, 36, 'BRG00006', 'jilbab kediri 3', 10, '29-11-2018'),
(148, 21, 37, 'BRG00006', 'jilbab kediri 3', 12, '29-11-2018'),
(149, 22, 38, 'BRG00007', 'jilbab malang 3', 10, '29-11-2018'),
(150, 22, 39, 'BRG00007', 'jilbab malang 3', 2, '29-11-2018'),
(151, 23, 40, 'BRG00008', 'jilbab keren', 20, '29-11-2018'),
(152, 23, 41, 'BRG00008', 'jilbab keren', 10, '29-11-2018'),
(153, 19, 32, 'BRG00004', 'jilbab kediri 2', 10, '30-11-2018'),
(154, 19, 33, 'BRG00004', 'jilbab kediri 2', 12, '30-11-2018'),
(155, 20, 34, 'BRG00005', 'jilbab malang 2', 10, '30-11-2018'),
(156, 20, 35, 'BRG00005', 'jilbab malang 2', 2, '30-11-2018'),
(157, 21, 36, 'BRG00006', 'jilbab kediri 3', 10, '30-11-2018'),
(158, 21, 37, 'BRG00006', 'jilbab kediri 3', 12, '30-11-2018'),
(159, 22, 38, 'BRG00007', 'jilbab malang 3', 10, '30-11-2018'),
(160, 22, 39, 'BRG00007', 'jilbab malang 3', 2, '30-11-2018'),
(161, 23, 40, 'BRG00008', 'jilbab keren', 20, '30-11-2018'),
(162, 23, 41, 'BRG00008', 'jilbab keren', 10, '30-11-2018'),
(163, 19, 32, 'BRG00004', 'jilbab kediri 2', 10, '02-12-2018'),
(164, 19, 33, 'BRG00004', 'jilbab kediri 2', 12, '02-12-2018'),
(165, 20, 34, 'BRG00005', 'jilbab malang 2', 10, '02-12-2018'),
(166, 20, 35, 'BRG00005', 'jilbab malang 2', 2, '02-12-2018'),
(167, 21, 36, 'BRG00006', 'jilbab kediri 3', 10, '02-12-2018'),
(168, 21, 37, 'BRG00006', 'jilbab kediri 3', 12, '02-12-2018'),
(169, 22, 38, 'BRG00007', 'jilbab malang 3', 10, '02-12-2018'),
(170, 22, 39, 'BRG00007', 'jilbab malang 3', 2, '02-12-2018'),
(171, 23, 40, 'BRG00008', 'jilbab keren', 20, '02-12-2018'),
(172, 23, 41, 'BRG00008', 'jilbab keren', 10, '02-12-2018'),
(173, 19, 32, 'BRG00004', 'jilbab kediri 2', 10, '03-12-2018'),
(174, 19, 33, 'BRG00004', 'jilbab kediri 2', 12, '03-12-2018'),
(175, 20, 34, 'BRG00005', 'jilbab malang 2', 10, '03-12-2018'),
(176, 20, 35, 'BRG00005', 'jilbab malang 2', 2, '03-12-2018'),
(177, 21, 36, 'BRG00006', 'jilbab kediri 3', 10, '03-12-2018'),
(178, 21, 37, 'BRG00006', 'jilbab kediri 3', 12, '03-12-2018'),
(179, 22, 38, 'BRG00007', 'jilbab malang 3', 10, '03-12-2018'),
(180, 22, 39, 'BRG00007', 'jilbab malang 3', 2, '03-12-2018'),
(181, 23, 40, 'BRG00008', 'jilbab keren', 20, '03-12-2018'),
(182, 23, 41, 'BRG00008', 'jilbab keren', 10, '03-12-2018'),
(183, 19, 32, 'BRG00004', 'jilbab kediri 2', 10, '04-12-2018'),
(184, 19, 33, 'BRG00004', 'jilbab kediri 2', 12, '04-12-2018'),
(185, 20, 34, 'BRG00005', 'jilbab malang 2', 10, '04-12-2018'),
(186, 20, 35, 'BRG00005', 'jilbab malang 2', 2, '04-12-2018'),
(187, 21, 36, 'BRG00006', 'jilbab kediri 3', 10, '04-12-2018'),
(188, 21, 37, 'BRG00006', 'jilbab kediri 3', 12, '04-12-2018'),
(189, 22, 38, 'BRG00007', 'jilbab malang 3', 10, '04-12-2018'),
(190, 22, 39, 'BRG00007', 'jilbab malang 3', 2, '04-12-2018'),
(191, 23, 40, 'BRG00008', 'jilbab keren', 20, '04-12-2018'),
(192, 23, 41, 'BRG00008', 'jilbab keren', 10, '04-12-2018'),
(193, 19, 32, 'BRG00004', 'jilbab kediri 2', 10, '08-12-2018'),
(194, 19, 33, 'BRG00004', 'jilbab kediri 2', 12, '08-12-2018'),
(195, 20, 34, 'BRG00005', 'jilbab malang 2', 10, '08-12-2018'),
(196, 20, 35, 'BRG00005', 'jilbab malang 2', 2, '08-12-2018'),
(197, 21, 36, 'BRG00006', 'jilbab kediri 3', 10, '08-12-2018'),
(198, 21, 37, 'BRG00006', 'jilbab kediri 3', 12, '08-12-2018'),
(199, 22, 38, 'BRG00007', 'jilbab malang 3', 10, '08-12-2018'),
(200, 22, 39, 'BRG00007', 'jilbab malang 3', 2, '08-12-2018'),
(201, 23, 40, 'BRG00008', 'jilbab keren', 20, '08-12-2018'),
(202, 23, 41, 'BRG00008', 'jilbab keren', 10, '08-12-2018'),
(203, 19, 32, 'BRG00004', 'jilbab kediri 2', 10, '09-12-2018'),
(204, 19, 33, 'BRG00004', 'jilbab kediri 2', 12, '09-12-2018'),
(205, 20, 34, 'BRG00005', 'jilbab malang 2', 10, '09-12-2018'),
(206, 20, 35, 'BRG00005', 'jilbab malang 2', 2, '09-12-2018'),
(207, 21, 36, 'BRG00006', 'jilbab kediri 3', 10, '09-12-2018'),
(208, 21, 37, 'BRG00006', 'jilbab kediri 3', 12, '09-12-2018'),
(209, 22, 38, 'BRG00007', 'jilbab malang 3', 10, '09-12-2018'),
(210, 22, 39, 'BRG00007', 'jilbab malang 3', 2, '09-12-2018'),
(211, 23, 40, 'BRG00008', 'jilbab keren', 20, '09-12-2018'),
(212, 23, 41, 'BRG00008', 'jilbab keren', 10, '09-12-2018');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tambahstoks`
--

DROP TABLE IF EXISTS `tb_tambahstoks`;
CREATE TABLE IF NOT EXISTS `tb_tambahstoks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idwarna` int(11) DEFAULT NULL,
  `idadmin` int(11) DEFAULT NULL,
  `kode_barang` varchar(150) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `tgl` varchar(100) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `aksi` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `tb_tambahstoks`
--
DROP TRIGGER IF EXISTS `add_stok`;
DELIMITER $$
CREATE TRIGGER `add_stok` AFTER INSERT ON `tb_tambahstoks` FOR EACH ROW update tb_barangs set stok=stok+new.jumlah where idbarang=new.idwarna
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksis`
--

DROP TABLE IF EXISTS `tb_transaksis`;
CREATE TABLE IF NOT EXISTS `tb_transaksis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) DEFAULT NULL,
  `faktur` varchar(300) DEFAULT NULL,
  `tgl` varchar(100) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `status` enum('terkirim','dibaca','diterima','ditolak','sukses','batal') DEFAULT NULL,
  `alamat_tujuan` text,
  `admin` varchar(100) DEFAULT NULL,
  `ongkir` int(11) DEFAULT '0',
  `total_akhir` int(11) DEFAULT NULL,
  `pembayaran` varchar(50) DEFAULT NULL,
  `keterangan` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_transaksis`
--

INSERT INTO `tb_transaksis` (`id`, `iduser`, `faktur`, `tgl`, `total`, `status`, `alamat_tujuan`, `admin`, `ongkir`, `total_akhir`, `pembayaran`, `keterangan`) VALUES
(3, 15, 'DVINA00003', '04-12-2018', 24000, 'diterima', 'magersari gurah jln pga no 1', NULL, 6000, 30000, '1', 'opopo');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE IF NOT EXISTS `tb_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` text,
  `email` varchar(100) DEFAULT NULL,
  `telp` varchar(45) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` text,
  `kota` varchar(100) DEFAULT NULL,
  `provinsi` varchar(100) DEFAULT NULL,
  `kodepos` varchar(45) DEFAULT NULL,
  `ktp_gmb` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`id`, `username`, `password`, `email`, `telp`, `nama`, `alamat`, `kota`, `provinsi`, `kodepos`, `ktp_gmb`) VALUES
(15, 'damara', '74b213f68f648006a318f52713450f27', 'satriosuklun@gmail.com', '085604556714', 'damara satrio', 'magersari gurah jln pga no 1', 'kediri', 'jawa timur', '14045', '1542359347-21220959_b_v1.jpg'),
(16, 'jianfitri', '121288a5d8785d1ef9aedb82bce753e9', 'jian@gmail.com', '02934820384', 'jian fitri', 'ngancar, kediri', 'kediri', 'aceh', '0002', '1543496839-whatsapp-image-2018-11-29-at-08.34.05.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
