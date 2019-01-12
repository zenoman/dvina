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
	(3, 'superadmin', '827ccb0eea8a706c4c34a16891f84e7b', 'super admin', '085682374023', 'satriosuklun@gmail.com', 'super_admin'),
	(4, 'devasatrio', '74b213f68f648006a318f52713450f27', 'deifa satrio damara', '085604556715', 'satrio@gmail.com', 'programer');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;

-- Dumping structure for table davina.detail_cancel
DROP TABLE IF EXISTS `detail_cancel`;
CREATE TABLE IF NOT EXISTS `detail_cancel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idwarna` int(11) DEFAULT NULL,
  `iduser` int(11) DEFAULT NULL,
  `kode` text,
  `tgl` date DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `barang` varchar(100) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `diskon` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.detail_cancel: ~2 rows (approximately)
DELETE FROM `detail_cancel`;
/*!40000 ALTER TABLE `detail_cancel` DISABLE KEYS */;
INSERT INTO `detail_cancel` (`id`, `idwarna`, `iduser`, `kode`, `tgl`, `jumlah`, `harga`, `barang`, `total`, `diskon`) VALUES
	(1, 48, 16, 'Cancel00001', '2019-01-12', 3, 20000, 'kerudung manis', 57000, 5),
	(2, 45, 16, 'Cancel00001', '2019-01-12', 1, 27000, 'kerudung mantab', 24300, 10);
/*!40000 ALTER TABLE `detail_cancel` ENABLE KEYS */;

-- Dumping structure for table davina.gambar
DROP TABLE IF EXISTS `gambar`;
CREATE TABLE IF NOT EXISTS `gambar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(30) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.gambar: ~10 rows (approximately)
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

-- Dumping structure for table davina.keranjang_cancel
DROP TABLE IF EXISTS `keranjang_cancel`;
CREATE TABLE IF NOT EXISTS `keranjang_cancel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tgl` date DEFAULT NULL,
  `idbarang` int(11) NOT NULL DEFAULT '0',
  `jumlah` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.keranjang_cancel: ~3 rows (approximately)
DELETE FROM `keranjang_cancel`;
/*!40000 ALTER TABLE `keranjang_cancel` DISABLE KEYS */;
INSERT INTO `keranjang_cancel` (`id`, `tgl`, `idbarang`, `jumlah`) VALUES
	(1, '2019-01-12', 40, 3),
	(2, '2019-01-12', 41, 2),
	(3, '2019-01-12', 40, 2);
/*!40000 ALTER TABLE `keranjang_cancel` ENABLE KEYS */;

-- Dumping structure for table davina.log_cancel
DROP TABLE IF EXISTS `log_cancel`;
CREATE TABLE IF NOT EXISTS `log_cancel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faktur` varchar(300) DEFAULT NULL,
  `total_akhir` int(11) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `bulan` int(5) DEFAULT NULL,
  `status` enum('dicancel','ditolak') DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `keterangan` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.log_cancel: ~1 rows (approximately)
DELETE FROM `log_cancel`;
/*!40000 ALTER TABLE `log_cancel` DISABLE KEYS */;
INSERT INTO `log_cancel` (`id`, `faktur`, `total_akhir`, `tgl`, `bulan`, `status`, `id_user`, `id_admin`, `keterangan`) VALUES
	(1, 'Cancel00001', 81300, '2019-01-12', 1, 'dicancel', 16, NULL, 'mahal');
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
  `peraturan` text,
  PRIMARY KEY (`idsettings`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.settings: ~1 rows (approximately)
DELETE FROM `settings`;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`idsettings`, `webName`, `kontak1`, `kontak2`, `kontak3`, `email`, `ico`, `meta`, `logo`, `keterangan`, `alamat`, `nama_toko`, `max_tgl`, `peraturan`) VALUES
	(1, 'Devina', '085604556777', '089456817354', '085601473652', 'satriosuklun@gmail.com', '1542366882-190835.png', 'toko hijab murah meriah', '1543717647-logo-dvina.png', 'dvina adalah toko hijab grosir yang telah terbukti memiliki harga dan kwalitas terbaik se karisidenan kediri', 'magersari, gurah kediri, jln pga no 1', NULL, 2, '<p>1. pastikan telah menjadi member devina hijab kediri</p>\r\n<p>2. jangan lupa bayar setelah beli produk</p>\r\n<p>3. setiap barang yang telah di masukan keranjang akan hilang secara otomatis apabila tidak di beli dalam jangka waktu 3 hari</p>\r\n<p>4. Happy Shopping gengs</p>');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table davina.sliders
DROP TABLE IF EXISTS `sliders`;
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.sliders: ~3 rows (approximately)
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

-- Dumping structure for table davina.tb_barangs
DROP TABLE IF EXISTS `tb_barangs`;
CREATE TABLE IF NOT EXISTS `tb_barangs` (
  `idbarang` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(100) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `warna` varchar(45) DEFAULT NULL,
  `barang_jenis` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`idbarang`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_barangs: ~8 rows (approximately)
DELETE FROM `tb_barangs`;
/*!40000 ALTER TABLE `tb_barangs` DISABLE KEYS */;
INSERT INTO `tb_barangs` (`idbarang`, `kode`, `stok`, `warna`, `barang_jenis`) VALUES
	(40, 'BRG00008', 15, 'hitam', 'instan gayatri hitam'),
	(41, 'BRG00008', 10, 'biru', 'instan gayatri biru'),
	(44, 'BRG00009', 8, 'merah', 'kerudung mantab merah'),
	(45, 'BRG00009', 17, 'biru', 'kerudung mantab biru'),
	(46, 'BRG00009', 3, 'kuning', 'kerudung mantab kuning'),
	(47, 'BRG00009', 17, 'hitam', 'kerudung mantab hitam'),
	(48, 'BRG00010', 13, 'merah', 'kerudung manis merah'),
	(49, 'BRG00010', 10, 'biru', 'kerudung manis biru');
/*!40000 ALTER TABLE `tb_barangs` ENABLE KEYS */;

-- Dumping structure for table davina.tb_details
DROP TABLE IF EXISTS `tb_details`;
CREATE TABLE IF NOT EXISTS `tb_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idwarna` int(11) DEFAULT NULL,
  `iduser` int(11) DEFAULT NULL,
  `faktur` varchar(100) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `tgl_kadaluarsa` date DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_details: ~11 rows (approximately)
DELETE FROM `tb_details`;
/*!40000 ALTER TABLE `tb_details` DISABLE KEYS */;
INSERT INTO `tb_details` (`id`, `idwarna`, `iduser`, `faktur`, `tgl`, `tgl_kadaluarsa`, `kode_barang`, `barang`, `harga`, `jumlah`, `total_a`, `diskon`, `total`, `admin`, `metode`) VALUES
	(1, 41, 16, 'DVINA00001', '2019-01-07', '2019-01-09', 'BRG00008', 'instan gayatri', 25000, 2, 50000, 15, 42500, NULL, 'pesan'),
	(2, 49, 16, 'DVINA00002', '2019-01-07', '2019-01-09', 'BRG00010', 'kerudung manis', 20000, 3, 60000, 0, 60000, NULL, 'pesan'),
	(3, 48, 16, 'DVINA00002', '2019-02-07', '2019-02-09', 'BRG00010', 'kerudung manis', 20000, 2, 40000, 0, 40000, NULL, 'pesan'),
	(4, 46, 16, 'DVINA00003', '2019-01-07', '2019-01-09', 'BRG00009', 'kerudung mantab', 27000, 2, 54000, 10, 48600, NULL, 'pesan'),
	(5, 48, 16, 'DVINA00003', '2019-01-07', '2019-01-09', 'BRG00010', 'kerudung manis', 20000, 3, 60000, 0, 60000, NULL, 'pesan'),
	(6, 41, 16, 'DVINA00004', '2019-01-07', '2019-01-09', 'BRG00008', 'instan gayatri', 25000, 3, 75000, 15, 63750, NULL, 'pesan'),
	(7, 40, 16, 'DVINA00004', '2019-01-07', '2019-01-09', 'BRG00008', 'instan gayatri', 25000, 2, 50000, 15, 42500, NULL, 'pesan'),
	(8, 47, 16, 'DVINA00005', '2019-01-07', '2019-01-09', 'BRG00009', 'kerudung mantab', 27000, 3, 81000, 10, 72900, NULL, 'pesan'),
	(9, 45, 16, 'DVINA00005', '2019-01-07', '2019-01-09', 'BRG00009', 'kerudung mantab', 27000, 3, 81000, 10, 72900, NULL, 'pesan'),
	(10, 46, 17, 'DVINA00006', '2019-01-08', '2019-01-10', 'BRG00009', 'kerudung mantab', 27000, 2, 54000, 10, 48600, NULL, 'pesan'),
	(11, 48, 17, 'DVINA00006', '2019-01-08', '2019-01-10', 'BRG00010', 'kerudung manis', 20000, 2, 40000, 0, 40000, NULL, 'pesan');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_kodes: ~3 rows (approximately)
DELETE FROM `tb_kodes`;
/*!40000 ALTER TABLE `tb_kodes` DISABLE KEYS */;
INSERT INTO `tb_kodes` (`id`, `id_kategori`, `kode_barang`, `barang`, `harga_beli`, `harga_barang`, `deskripsi`, `diskon`) VALUES
	(23, 6, 'BRG00008', 'instan gayatri', 22000, 25000, 'kerudung mantab untuk sehari hari', 15),
	(24, 7, 'BRG00009', 'kerudung mantab', 20000, 27000, 'kerudung murah meriah', 10),
	(25, 6, 'BRG00010', 'kerudung manis', 15000, 20000, 'kerudung ntabs jiwa raga', 5);
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
  `tgl` date DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `aksi` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_tambahstoks: ~11 rows (approximately)
DELETE FROM `tb_tambahstoks`;
/*!40000 ALTER TABLE `tb_tambahstoks` DISABLE KEYS */;
INSERT INTO `tb_tambahstoks` (`id`, `idwarna`, `idadmin`, `kode_barang`, `jumlah`, `total`, `tgl`, `keterangan`, `aksi`) VALUES
	(1, 48, 4, 'BRG00010', 2, 30000, '2019-01-07', 're stock', 'tambah'),
	(2, 49, 4, 'BRG00010', 3, 45000, '2019-02-07', 'halo halo', 'tambah'),
	(3, 48, 4, 'BRG00010', 2, 30000, '2019-01-08', 'tambah barang', 'tambah'),
	(4, 41, 4, 'BRG00008', 10, 220000, '2019-01-08', 'restock', 'tambah'),
	(5, 40, 4, 'BRG00008', 4, 88000, '2019-01-08', 'restock', 'tambah'),
	(6, 48, 4, 'BRG00010', 3, 45000, '2019-01-08', 'tambah barang', 'tambah'),
	(7, 48, 4, 'BRG00010', 2, 30000, '2019-01-10', 'di beli sama dulur', 'kurangi'),
	(8, 49, 4, 'BRG00010', 5, 75000, '2019-01-10', 'di pindah ke offline', 'kurangi'),
	(9, 40, 4, 'BRG00008', 2, 44000, '2019-01-10', 'di beli tetangga', 'kurangi'),
	(10, 41, 4, 'BRG00008', 3, 66000, '2019-01-10', 'di beli temen', 'kurangi'),
	(11, 44, 4, 'BRG00009', 2, 40000, '2019-01-10', 'di beli temen', 'kurangi');
/*!40000 ALTER TABLE `tb_tambahstoks` ENABLE KEYS */;

-- Dumping structure for table davina.tb_transaksis
DROP TABLE IF EXISTS `tb_transaksis`;
CREATE TABLE IF NOT EXISTS `tb_transaksis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) DEFAULT NULL,
  `faktur` varchar(300) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `status` enum('terkirim','dibaca','diterima','ditolak','sukses','batal') DEFAULT NULL,
  `alamat_tujuan` text,
  `admin` varchar(100) DEFAULT NULL,
  `ongkir` int(11) DEFAULT '0',
  `total_akhir` int(11) DEFAULT NULL,
  `pembayaran` varchar(50) DEFAULT NULL,
  `keterangan` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_transaksis: ~6 rows (approximately)
DELETE FROM `tb_transaksis`;
/*!40000 ALTER TABLE `tb_transaksis` DISABLE KEYS */;
INSERT INTO `tb_transaksis` (`id`, `iduser`, `faktur`, `tgl`, `total`, `status`, `alamat_tujuan`, `admin`, `ongkir`, `total_akhir`, `pembayaran`, `keterangan`) VALUES
	(1, 16, 'DVINA00001', '2019-01-07', 42500, 'sukses', 'ngancar, kediri', NULL, 0, 42500, '1', 'cepet ya'),
	(2, 16, 'DVINA00002', '2019-01-07', 100000, 'sukses', 'ngancar, kediri', NULL, 10000, 110000, '5', 'di tunggun ya'),
	(3, 16, 'DVINA00003', '2019-01-07', 108600, 'sukses', 'ngancar, kediri', NULL, 2400, 111000, '1', 'halo halo'),
	(4, 16, 'DVINA00004', '2019-01-07', 106250, 'sukses', 'ngancar, kediri', NULL, 0, 106250, '1', 'cepet ya'),
	(5, 16, 'DVINA00005', '2019-01-07', 145800, 'sukses', 'ngancar, kediri', NULL, 0, 145800, '1', 'halo halo'),
	(6, 17, 'DVINA00006', '2019-02-08', 88600, 'sukses', 'gur', NULL, 0, 88600, '1', 'cepet ya gan');
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
  `cancel` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_users: ~3 rows (approximately)
DELETE FROM `tb_users`;
/*!40000 ALTER TABLE `tb_users` DISABLE KEYS */;
INSERT INTO `tb_users` (`id`, `username`, `password`, `email`, `telp`, `nama`, `alamat`, `kota`, `provinsi`, `kodepos`, `ktp_gmb`, `cancel`) VALUES
	(16, 'jianfitri', '74b213f68f648006a318f52713450f27', 'jian@gmail.com', '02934820384', 'jian fitri', 'ngancar, kediri', 'kediri', 'jawa timur', '0002', '1543496839-whatsapp-image-2018-11-29-at-08.34.05.jpeg', 0),
	(17, 'abiihsan', '74b213f68f648006a318f52713450f27', 'abiihsan4@gmail.com', '0865546748676765678', 'abi ihsan fadli', 'gur', 'kediri', 'aceh', '64181', '1544792743-22310196_833901743438799_7008136422851244887_n.jpg', 0),
	(18, 'dian_ade00', '85064efb60a9601805dcea56ec5402f7', 'blackwolf2103@outlook.com', '43546435634534', 'testing', 'dasdsadsadas', 'askdjaskjd', 'jawa timur', '897239', '1544792950-295311_ilustrasi-hujan-uang_663_382.jpg', 0);
/*!40000 ALTER TABLE `tb_users` ENABLE KEYS */;

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

-- Dumping structure for trigger davina.keranjang_dihapus
DROP TRIGGER IF EXISTS `keranjang_dihapus`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `keranjang_dihapus` AFTER INSERT ON `keranjang_cancel` FOR EACH ROW BEGIN
update tb_barangs set stok=stok+new.jumlah where idbarang=new.idbarang;
END//
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
