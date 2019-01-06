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

-- Dumping data for table davina.admins: ~3 rows (approximately)
DELETE FROM `admins`;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` (`id`, `username`, `password`, `nama`, `telp`, `email`, `level`) VALUES
	(2, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '085604556715', 'satriosuklun@gmail.com', 'admin'),
	(3, 'superadmin', '827ccb0eea8a706c4c34a16891f84e7b', 'super admin', '085682374023', 'satriosuklun@gmail.com', 'super_admin'),
	(4, 'devasatrio', '74b213f68f648006a318f52713450f27', 'deva satrio', '085604556714', 'satriosuklun@gmail.com', 'programer');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;

-- Dumping structure for table davina.detail_cancel
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.detail_cancel: ~0 rows (approximately)
DELETE FROM `detail_cancel`;
/*!40000 ALTER TABLE `detail_cancel` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_cancel` ENABLE KEYS */;

-- Dumping structure for table davina.gambar
DROP TABLE IF EXISTS `gambar`;
CREATE TABLE IF NOT EXISTS `gambar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(30) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.gambar: ~12 rows (approximately)
DELETE FROM `gambar`;
/*!40000 ALTER TABLE `gambar` DISABLE KEYS */;
INSERT INTO `gambar` (`id`, `kode_barang`, `nama`) VALUES
	(16, 'BRG00008', '1542109148-images-(1).jpg'),
	(17, 'BRG00008', '1542109149-instant-wear-arabic-head-dress-rayon-hijab.jpg_350x350.jpg'),
	(18, 'BRG00009', '1544874148-download.jpg'),
	(20, 'BRG00009', '1544874148-hijab-headscarf-apple-green.jpg'),
	(21, 'BRG00009', '1544874148-hot-sale-muslim-hijab-scarves-8-color-scarf.jpg'),
	(22, 'BRG00009', '1544874258-21220959_b_v1.jpg'),
	(23, 'BRG00010', '1546773196-images-(1).jpg'),
	(24, 'BRG00010', '1546773196-images-(2).jpg'),
	(25, 'BRG00010', '1546773196-images.jpg'),
	(26, 'BRG00010', '1546774002-download.jpg');
/*!40000 ALTER TABLE `gambar` ENABLE KEYS */;

-- Dumping structure for table davina.log_cancel
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.log_cancel: ~0 rows (approximately)
DELETE FROM `log_cancel`;
/*!40000 ALTER TABLE `log_cancel` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_cancel` ENABLE KEYS */;

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
  `keterangan` text,
  `alamat` text,
  `nama_toko` int(11) DEFAULT NULL,
  `max_tgl` int(5) DEFAULT NULL,
  PRIMARY KEY (`idsettings`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.settings: ~0 rows (approximately)
DELETE FROM `settings`;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`idsettings`, `webName`, `kontak1`, `kontak2`, `kontak3`, `email`, `ico`, `meta`, `logo`, `keterangan`, `alamat`, `nama_toko`, `max_tgl`) VALUES
	(1, 'Devina', '085604556777', '089456817354', '085601473652', 'satriosuklun@gmail.com', '1542366882-190835.png', 'toko hijab murah meriah', '1543717647-logo-dvina.png', 'dvina adalah toko hijab grosir yang telah terbukti memiliki harga dan kwalitas terbaik se karisidenan kediri', 'magersari, gurah kediri, jln pga no 1', NULL, 2);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table davina.sliders
DROP TABLE IF EXISTS `sliders`;
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.sliders: ~2 rows (approximately)
DELETE FROM `sliders`;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` (`id`, `judul`, `foto`) VALUES
	(2, 'ini slide 2 baru gambarnya', '1544842891-1544675484-diskon.jpg'),
	(3, 'slider 1', '1544842954-1544675574-hijab-muslimah-murah-ramadhan.jpg'),
	(4, 'slider 3', '1544842996-1544675632-voucher-50rb-blog.png');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;

-- Dumping structure for table davina.tb_bank
DROP TABLE IF EXISTS `tb_bank`;
CREATE TABLE IF NOT EXISTS `tb_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_bank` varchar(40) DEFAULT NULL,
  `rekening` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_bank: ~5 rows (approximately)
DELETE FROM `tb_bank`;
/*!40000 ALTER TABLE `tb_bank` DISABLE KEYS */;
INSERT INTO `tb_bank` (`id`, `nama_bank`, `rekening`) VALUES
	(1, 'bayar ditoko\r\n', '-'),
	(2, 'bri', '009887878'),
	(3, 'bni', '0111'),
	(4, 'bank jatim', '0222'),
	(5, 'mandiri Syariah', '0333');
/*!40000 ALTER TABLE `tb_bank` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_barangs: ~15 rows (approximately)
DELETE FROM `tb_barangs`;
/*!40000 ALTER TABLE `tb_barangs` DISABLE KEYS */;
INSERT INTO `tb_barangs` (`idbarang`, `kode`, `stok`, `warna`, `barang_jenis`) VALUES
	(40, 'BRG00008', 20, 'hitam', 'instan gayatri hitam'),
	(41, 'BRG00008', 10, 'biru', 'instan gayatri biru'),
	(44, 'BRG00009', 10, 'merah', 'kerudung mantab merah'),
	(45, 'BRG00009', 20, 'biru', 'kerudung mantab biru'),
	(46, 'BRG00009', 7, 'kuning', 'kerudung mantab kuning'),
	(47, 'BRG00009', 20, 'hitam', 'kerudung mantab hitam'),
	(48, 'BRG00010', 15, 'merah', 'kerudung manis merah'),
	(49, 'BRG00010', 18, 'biru', 'kerudung manis biru');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_details: ~5 rows (approximately)
DELETE FROM `tb_details`;
/*!40000 ALTER TABLE `tb_details` DISABLE KEYS */;
INSERT INTO `tb_details` (`id`, `idwarna`, `iduser`, `faktur`, `tgl`, `tgl_kadaluarsa`, `kode_barang`, `barang`, `harga`, `jumlah`, `total_a`, `diskon`, `total`, `admin`, `metode`) VALUES
	(6, 34, 15, 'DVINA00003', '04-12-2018', '6-12-2018', 'BRG00005', 'jilbab malang 2', 12000, 2, 24000, 0, 24000, NULL, 'pesan'),
	(11, 37, 17, 'DVINA00005', '14-12-2018', '16-12-2018', 'BRG00006', 'jilbab kediri 3', 20000, 3, 60000, 5, 57000, NULL, 'pesan'),
	(12, 32, 17, 'DVINA00005', '14-12-2018', '16-12-2018', 'BRG00004', 'jilbab kediri 2', 20000, 1, 20000, 10, 18000, NULL, 'pesan'),
	(13, 46, 15, 'DVINA00006', '15-12-2018', '17-12-2018', 'BRG00009', 'kerudung mantab', 27000, 3, 81000, 10, 72900, NULL, 'pesan'),
	(14, 37, 15, 'DVINA00006', '15-12-2018', '17-12-2018', 'BRG00006', 'instan ranting', 20000, 2, 40000, 5, 38000, NULL, 'pesan');
/*!40000 ALTER TABLE `tb_details` ENABLE KEYS */;

-- Dumping structure for table davina.tb_kategoris
DROP TABLE IF EXISTS `tb_kategoris`;
CREATE TABLE IF NOT EXISTS `tb_kategoris` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(100) DEFAULT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_kategoris: ~4 rows (approximately)
DELETE FROM `tb_kategoris`;
/*!40000 ALTER TABLE `tb_kategoris` DISABLE KEYS */;
INSERT INTO `tb_kategoris` (`id`, `kategori`, `gambar`) VALUES
	(5, 'kerudung top', '1541851060-34-android-flat.png'),
	(6, 'kerudung mantul', '1541851081-190835.png'),
	(7, 'kerudung sip', '1541851116-1.jpg'),
	(8, 'jilbab hot banget', '1544873842-images-(1).jpg');
/*!40000 ALTER TABLE `tb_kategoris` ENABLE KEYS */;

-- Dumping structure for table davina.tb_kodes
DROP TABLE IF EXISTS `tb_kodes`;
CREATE TABLE IF NOT EXISTS `tb_kodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kategori` int(11) DEFAULT NULL,
  `kode_barang` varchar(100) DEFAULT NULL,
  `barang` varchar(150) DEFAULT NULL,
  `harga_beli` int(11) DEFAULT NULL,
  `harga_barang` int(11) DEFAULT NULL,
  `deskripsi` mediumtext,
  `diskon` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_kodes: ~6 rows (approximately)
DELETE FROM `tb_kodes`;
/*!40000 ALTER TABLE `tb_kodes` DISABLE KEYS */;
INSERT INTO `tb_kodes` (`id`, `id_kategori`, `kode_barang`, `barang`, `harga_beli`, `harga_barang`, `deskripsi`, `diskon`) VALUES
	(23, 6, 'BRG00008', 'instan gayatri', 22000, 25000, 'kerudung mantab untuk sehari hari', 15),
	(24, 7, 'BRG00009', 'kerudung mantab', 20000, 27000, 'kerudung murah meriah', 10),
	(25, 6, 'BRG00010', 'kerudung manis', 15000, 20000, 'kerudung ntabs jiwa raga', 0);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_stokawals: ~0 rows (approximately)
DELETE FROM `tb_stokawals`;
/*!40000 ALTER TABLE `tb_stokawals` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_tambahstoks: ~2 rows (approximately)
DELETE FROM `tb_tambahstoks`;
/*!40000 ALTER TABLE `tb_tambahstoks` DISABLE KEYS */;
INSERT INTO `tb_tambahstoks` (`id`, `idwarna`, `idadmin`, `kode_barang`, `jumlah`, `total`, `tgl`, `keterangan`, `aksi`) VALUES
	(1, 32, 2, 'BRG00004', 1, 20000, '15-12-2018', 'ntabs', 'tambah'),
	(2, 43, 2, 'BRG00006', 1, 20000, '15-12-2018', NULL, 'tambah'),
	(3, 48, 4, 'BRG00010', 5, 75000, '06-01-2019', 'kulak', 'tambah'),
	(4, 49, 4, 'BRG00010', 2, 30000, '06-01-2019', 'dipijem temen', 'kurangi'),
	(10, 32, 4, 'BRG00004', 10, 0, '06-01-2019', 're stock', 'tambah');
/*!40000 ALTER TABLE `tb_tambahstoks` ENABLE KEYS */;

-- Dumping structure for table davina.tb_transaksis
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_transaksis: ~3 rows (approximately)
DELETE FROM `tb_transaksis`;
/*!40000 ALTER TABLE `tb_transaksis` DISABLE KEYS */;
INSERT INTO `tb_transaksis` (`id`, `iduser`, `faktur`, `tgl`, `total`, `status`, `alamat_tujuan`, `admin`, `ongkir`, `total_akhir`, `pembayaran`, `keterangan`) VALUES
	(3, 15, 'DVINA00003', '14-12-2018', 24000, 'sukses', 'magersari gurah jln pga no 1', NULL, 6000, 30000, '2', 'opopo'),
	(5, 17, 'DVINA00005', '14-12-2018', 75000, 'sukses', 'gur', NULL, 25000, 100000, '1', 'saya adalah reseller'),
	(6, 15, 'DVINA00006', '15-12-2018', 110900, 'sukses', 'magersari gurah jln pga no 1', NULL, 2000, 112900, '2', 'cepet ya');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_users: ~3 rows (approximately)
DELETE FROM `tb_users`;
/*!40000 ALTER TABLE `tb_users` DISABLE KEYS */;
INSERT INTO `tb_users` (`id`, `username`, `password`, `email`, `telp`, `nama`, `alamat`, `kota`, `provinsi`, `kodepos`, `ktp_gmb`) VALUES
	(16, 'jianfitri', '121288a5d8785d1ef9aedb82bce753e9', 'jian@gmail.com', '02934820384', 'jian fitri', 'ngancar, kediri', 'kediri', 'aceh', '0002', '1543496839-whatsapp-image-2018-11-29-at-08.34.05.jpeg'),
	(17, 'abiihsan', '25d55ad283aa400af464c76d713c07ad', 'abiihsan4@gmail.com', '0865546748676765678', 'abi ihsan fadli', 'gur', 'kediri', 'aceh', '64181', '1544792743-22310196_833901743438799_7008136422851244887_n.jpg'),
	(18, 'dian_ade00', '85064efb60a9601805dcea56ec5402f7', 'blackwolf2103@outlook.com', '43546435634534', 'testing', 'dasdsadsadas', 'askdjaskjd', 'jawa timur', '897239', '1544792950-295311_ilustrasi-hujan-uang_663_382.jpg');
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

-- Dumping structure for trigger davina.add_stok
DROP TRIGGER IF EXISTS `add_stok`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `add_stok` AFTER INSERT ON `tb_tambahstoks` FOR EACH ROW update tb_barangs set stok=stok+new.jumlah where idbarang=new.idwarna//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger davina.in_stok
DROP TRIGGER IF EXISTS `in_stok`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `in_stok` AFTER INSERT ON `detail_cancel` FOR EACH ROW update tb_barangs set stok=stok+new.jumlah where idbarang=new.idwarna//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger davina.min_stok
DROP TRIGGER IF EXISTS `min_stok`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `min_stok` AFTER INSERT ON `tb_details` FOR EACH ROW update tb_barangs set stok=stok-new.jumlah where idbarang=new.idwarna//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
