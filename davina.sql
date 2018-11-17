-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.30-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5174
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for davina
DROP DATABASE IF EXISTS `davina`;
CREATE DATABASE IF NOT EXISTS `davina` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `davina`;

-- Dumping structure for table davina.admins
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

-- Dumping data for table davina.admins: ~2 rows (approximately)
DELETE FROM `admins`;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` (`id`, `username`, `password`, `nama`, `telp`, `email`, `level`) VALUES
	(2, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '085604556715', 'satriosuklun@gmail.com', 'admin'),
	(3, 'superadmin', '827ccb0eea8a706c4c34a16891f84e7b', 'super admin', '085682374023', 'satriosuklun@gmail.com', 'super_admin'),
	(4, 'devasatrio', '74b213f68f648006a318f52713450f27', 'deva satrio', '085604556714', 'satriosuklun@gmail.com', 'programer');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;

-- Dumping structure for table davina.gambar
DROP TABLE IF EXISTS `gambar`;
CREATE TABLE IF NOT EXISTS `gambar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(30) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.gambar: ~8 rows (approximately)
DELETE FROM `gambar`;
/*!40000 ALTER TABLE `gambar` DISABLE KEYS */;
INSERT INTO `gambar` (`id`, `kode_barang`, `nama`) VALUES
	(10, 'BRG00004', '1541847113-download.jpg'),
	(11, 'BRG00004', '1541847113-high-quality-muslim-hijab-scarf-cotton-jersey-hijabs-turban-muslim-hijab-infiity-scarf-muslim-head-coverings-92.jpg'),
	(12, 'BRG00005', '1541847133-images-(2).jpg'),
	(13, 'BRG00005', '1541847133-instant-wear-arabic-head-dress-rayon-hijab.jpg_350x350.jpg'),
	(14, 'BRG00006', '1541850464-21220959_b_v1.jpg'),
	(15, 'BRG00007', '1541850483-high-quality-muslim-hijab-scarf-cotton-jersey-hijabs-turban-muslim-hijab-infiity-scarf-muslim-head-coverings-92.jpg'),
	(16, 'BRG00008', '1542109148-images-(1).jpg'),
	(17, 'BRG00008', '1542109149-instant-wear-arabic-head-dress-rayon-hijab.jpg_350x350.jpg');
/*!40000 ALTER TABLE `gambar` ENABLE KEYS */;

-- Dumping structure for table davina.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table davina.migrations: ~3 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(4, '2014_10_12_000000_create_users_table', 1),
	(5, '2014_10_12_100000_create_password_resets_table', 1),
	(6, '2018_10_11_054351_create_pemesanans_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table davina.pemesanans
DROP TABLE IF EXISTS `pemesanans`;
CREATE TABLE IF NOT EXISTS `pemesanans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kodePesan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iduser` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `choiches` enum('belum','sudah','proses') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table davina.pemesanans: ~0 rows (approximately)
DELETE FROM `pemesanans`;
/*!40000 ALTER TABLE `pemesanans` DISABLE KEYS */;
/*!40000 ALTER TABLE `pemesanans` ENABLE KEYS */;

-- Dumping structure for table davina.settings
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
  PRIMARY KEY (`idsettings`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.settings: ~1 rows (approximately)
DELETE FROM `settings`;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`idsettings`, `webName`, `kontak1`, `kontak2`, `kontak3`, `email`, `ico`, `meta`, `logo`, `keterangan`, `alamat`, `nama_toko`) VALUES
	(1, 'nama webnya 12', '123451112', '123451112', '123451112', 'devatamvan@gmail.com', '1539867788-pencil-icon.png', 'ini metanya 12', '1539867788-icons8_flat_ruler.svg.png', NULL, NULL, NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table davina.sliders
DROP TABLE IF EXISTS `sliders`;
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.sliders: ~2 rows (approximately)
DELETE FROM `sliders`;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` (`id`, `judul`, `foto`) VALUES
	(2, 'ini slide 2 baru gambarnya', '1541552859-20180227_054709.jpg');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;

-- Dumping structure for table davina.tb_barangouts
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

-- Dumping data for table davina.tb_barangouts: ~0 rows (approximately)
DELETE FROM `tb_barangouts`;
/*!40000 ALTER TABLE `tb_barangouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_barangouts` ENABLE KEYS */;

-- Dumping structure for table davina.tb_barangs
DROP TABLE IF EXISTS `tb_barangs`;
CREATE TABLE IF NOT EXISTS `tb_barangs` (
  `idbarang` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(100) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `warna` varchar(45) DEFAULT NULL,
  `barang_jenis` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`idbarang`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_barangs: ~8 rows (approximately)
DELETE FROM `tb_barangs`;
/*!40000 ALTER TABLE `tb_barangs` DISABLE KEYS */;
INSERT INTO `tb_barangs` (`idbarang`, `kode`, `stok`, `warna`, `barang_jenis`) VALUES
	(32, 'BRG00004', 10, 'merah', 'jilbab kediri 2 merah'),
	(33, 'BRG00004', 12, 'biru', 'jilbab kediri 2 biru'),
	(34, 'BRG00005', 10, 'putih', 'jilbab malang 2 putih'),
	(35, 'BRG00005', 2, 'putih merah', 'jilbab malang 2 putih merah'),
	(36, 'BRG00006', 10, 'merah', 'jilbab kediri 3 merah'),
	(37, 'BRG00006', 12, 'biru', 'jilbab kediri 3 biru'),
	(38, 'BRG00007', 10, 'putih', 'jilbab malang 3 putih'),
	(39, 'BRG00007', 2, 'putih merah', 'jilbab malang 3 putih merah'),
	(40, 'BRG00008', 20, 'hitam', 'jilbab keren hitam'),
	(41, 'BRG00008', 10, 'biru', 'jilbab keren biru');
/*!40000 ALTER TABLE `tb_barangs` ENABLE KEYS */;

-- Dumping structure for table davina.tb_details
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_details: ~0 rows (approximately)
DELETE FROM `tb_details`;
/*!40000 ALTER TABLE `tb_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_details` ENABLE KEYS */;

-- Dumping structure for table davina.tb_kategoris
DROP TABLE IF EXISTS `tb_kategoris`;
CREATE TABLE IF NOT EXISTS `tb_kategoris` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(100) DEFAULT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_kategoris: ~3 rows (approximately)
DELETE FROM `tb_kategoris`;
/*!40000 ALTER TABLE `tb_kategoris` DISABLE KEYS */;
INSERT INTO `tb_kategoris` (`id`, `kategori`, `gambar`) VALUES
	(4, 'kerudung wanita', '1541756913-0056a08d4b2c91f.jpg'),
	(5, 'kerudung top', '1541851060-34-android-flat.png'),
	(6, 'kerudung mantul', '1541851081-190835.png'),
	(7, 'kerudung sip', '1541851116-1.jpg');
/*!40000 ALTER TABLE `tb_kategoris` ENABLE KEYS */;

-- Dumping structure for table davina.tb_kodes
DROP TABLE IF EXISTS `tb_kodes`;
CREATE TABLE IF NOT EXISTS `tb_kodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kategori` int(11) DEFAULT NULL,
  `kode_barang` varchar(100) DEFAULT NULL,
  `barang` varchar(150) DEFAULT NULL,
  `harga_barang` int(11) DEFAULT NULL,
  `deskripsi` mediumtext,
  `diskon` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_kodes: ~5 rows (approximately)
DELETE FROM `tb_kodes`;
/*!40000 ALTER TABLE `tb_kodes` DISABLE KEYS */;
INSERT INTO `tb_kodes` (`id`, `id_kategori`, `kode_barang`, `barang`, `harga_barang`, `deskripsi`, `diskon`) VALUES
	(19, 4, 'BRG00004', 'jilbab kediri 2', 20000, 'ini deskripsi jilbab kediri', 10),
	(20, 4, 'BRG00005', 'jilbab malang 2', 12000, 'ini deskripsi jilbab malang', 0),
	(21, 4, 'BRG00006', 'jilbab kediri 3', 20000, 'ini deskripsi jilbab kediri 3', 5),
	(22, 4, 'BRG00007', 'jilbab malang 3', 12000, 'ini deskripsi jilbab malang 3', 0),
	(23, 6, 'BRG00008', 'jilbab keren', 25000, 'kerudung mantab untuk sehari hari', 15);
/*!40000 ALTER TABLE `tb_kodes` ENABLE KEYS */;

-- Dumping structure for table davina.tb_stokawals
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_stokawals: ~34 rows (approximately)
DELETE FROM `tb_stokawals`;
/*!40000 ALTER TABLE `tb_stokawals` DISABLE KEYS */;
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
	(72, 23, 41, 'BRG00008', 'jilbab keren', 10, '13-11-2018');
/*!40000 ALTER TABLE `tb_stokawals` ENABLE KEYS */;

-- Dumping structure for table davina.tb_tambahstoks
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

-- Dumping data for table davina.tb_tambahstoks: ~0 rows (approximately)
DELETE FROM `tb_tambahstoks`;
/*!40000 ALTER TABLE `tb_tambahstoks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tambahstoks` ENABLE KEYS */;

-- Dumping structure for table davina.tb_transaksis
DROP TABLE IF EXISTS `tb_transaksis`;
CREATE TABLE IF NOT EXISTS `tb_transaksis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) DEFAULT NULL,
  `faktur` varchar(100) DEFAULT NULL,
  `tgl` varchar(100) DEFAULT NULL,
  `total_a` int(11) DEFAULT NULL,
  `diskon` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `admin` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_transaksis: ~0 rows (approximately)
DELETE FROM `tb_transaksis`;
/*!40000 ALTER TABLE `tb_transaksis` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_transaksis` ENABLE KEYS */;

-- Dumping structure for table davina.tb_users
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_users: ~1 rows (approximately)
DELETE FROM `tb_users`;
/*!40000 ALTER TABLE `tb_users` DISABLE KEYS */;
INSERT INTO `tb_users` (`id`, `username`, `password`, `email`, `telp`, `nama`, `alamat`, `kota`, `provinsi`, `kodepos`, `ktp_gmb`) VALUES
	(13, 'damara', '25d55ad283aa400af464c76d713c07ad', 'satriosuklun@gmail.com', '0984590348590', 'damara', 'gurah magersari', 'kediri', 'Jawa Timur', '89789', '1541943751-34-android-flat.png'),
	(14, 'damara', 'e10adc3949ba59abbe56e057f20f883e', 'satriosuklun@gmail.com', '0982509280493', 'damara', 'magersari gurah', 'kediri', 'Jawa Timur', '123123', '1541977782-190835.png');
/*!40000 ALTER TABLE `tb_users` ENABLE KEYS */;

-- Dumping structure for table davina.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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

-- Dumping data for table davina.users: ~0 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
