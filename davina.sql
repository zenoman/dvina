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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.admins: ~6 rows (approximately)
DELETE FROM `admins`;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` (`id`, `username`, `password`, `nama`, `telp`, `email`, `level`) VALUES
	(10, 'devasatrio', '$2y$10$7d6KjJtH/GfK.45S1R9JAefDZgcCF3CW0DiW68a4FoTjiyGM/yUBS', 'deva satrio damara', '023934820948', 'satriosuklun@gmail.com', 'programer'),
	(11, 'diansetiawan', '$2y$10$CpKmLECL3v8nVnL37Tb20ugH8QMjugXapUyuTpEhuXxziVvqddiWm', 'dian ade setiawan', '085623497800', 'dianade@gmail.com', 'programer'),
	(12, 'adminsatu', '$2y$10$./4I24ToWf90yexH24nNr.C.hUtaTewshvVENi9d8bvHYxxNY/rsq', 'admin ke satu', '08529487289333', 'admin1@gmail.com', 'admin'),
	(13, 'abiihsan', '$2y$10$HtZx6PUklxwaaFntiHqV5.4BZiXNEXdF1eA/J.ce701M5Thi7RLki', 'abi ihsan fadli', '2093482903480', 'abi@gmail.com', 'programer'),
	(14, 'taufiqperdana', '$2y$10$734GwOfWOeNB6gdtZqR7ZutUB8FzjPaupBypdRsFjypj3RFnQMKFa', 'M. taufiq perdana', '023984290380', 'taufiq@gmail.com', 'programer'),
	(15, 'admindua', '$2y$10$0/s.qgxDCDscTqNc42wdseaI.CaHYuv4z2gqYkG7xMLRxPTO.KVt6', 'admin ke dua', '20348239048902', 'admin@gmail.com', 'admin');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.detail_cancel: ~0 rows (approximately)
DELETE FROM `detail_cancel`;
/*!40000 ALTER TABLE `detail_cancel` DISABLE KEYS */;
INSERT INTO `detail_cancel` (`id`, `idwarna`, `iduser`, `kode`, `tgl`, `jumlah`, `harga`, `barang`, `total`, `diskon`) VALUES
	(1, 11, 5, 'Cancel00001', '2019-01-18', 3, 25000, 'instan salwa sherin', 75000, 0);
/*!40000 ALTER TABLE `detail_cancel` ENABLE KEYS */;

-- Dumping structure for table davina.gambar
DROP TABLE IF EXISTS `gambar`;
CREATE TABLE IF NOT EXISTS `gambar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(30) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.gambar: ~14 rows (approximately)
DELETE FROM `gambar`;
/*!40000 ALTER TABLE `gambar` DISABLE KEYS */;
INSERT INTO `gambar` (`id`, `kode_barang`, `nama`) VALUES
	(1, 'BRG00001', '1547710707-he.jpg'),
	(2, 'BRG00001', '1547710708-hehe.jpg'),
	(3, 'BRG00001', '1547710708-images-(1).jpg'),
	(4, 'BRG00001', '1547710708-images-(2).jpg'),
	(5, 'BRG00004', '1547711644-hah.jpeg'),
	(6, 'BRG00004', '1547711644-he.jpg'),
	(7, 'BRG00004', '1547711644-hehe.jpg'),
	(8, 'BRG00003', '1547711669-heyy.jpg'),
	(9, 'BRG00003', '1547711670-images-(2).jpg'),
	(10, 'BRG00003', '1547711670-images.jpg'),
	(11, 'BRG00002', '1547711706-he.jpg'),
	(12, 'BRG00002', '1547711706-images-(1).jpg'),
	(13, 'BRG00002', '1547711706-images-(2).jpg'),
	(14, 'BRG00005', '1547711951-he.jpg'),
	(15, 'BRG00005', '1547711951-holo.jpg'),
	(16, 'BRG00005', '1547711951-images-(2).jpg');
/*!40000 ALTER TABLE `gambar` ENABLE KEYS */;

-- Dumping structure for table davina.keranjang_cancel
DROP TABLE IF EXISTS `keranjang_cancel`;
CREATE TABLE IF NOT EXISTS `keranjang_cancel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tgl` date DEFAULT NULL,
  `idbarang` int(11) NOT NULL DEFAULT '0',
  `jumlah` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.keranjang_cancel: ~0 rows (approximately)
DELETE FROM `keranjang_cancel`;
/*!40000 ALTER TABLE `keranjang_cancel` DISABLE KEYS */;
INSERT INTO `keranjang_cancel` (`id`, `tgl`, `idbarang`, `jumlah`) VALUES
	(1, '2019-01-18', 7, 9),
	(2, '2019-01-18', 7, 5);
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

-- Dumping data for table davina.log_cancel: ~0 rows (approximately)
DELETE FROM `log_cancel`;
/*!40000 ALTER TABLE `log_cancel` DISABLE KEYS */;
INSERT INTO `log_cancel` (`id`, `faktur`, `total_akhir`, `tgl`, `bulan`, `status`, `id_user`, `id_admin`, `keterangan`) VALUES
	(1, 'Cancel00001', 75000, '2019-01-18', 1, 'dicancel', 5, NULL, NULL);
/*!40000 ALTER TABLE `log_cancel` ENABLE KEYS */;

-- Dumping structure for table davina.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table davina.migrations: ~0 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
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
	(1, 'Devina', '085604556777', '089456817354', '085601473652', 'satriosuklun@gmail.com', '1547722245-dvinafavicon.png', 'toko hijab murah meriah', '1543717647-logo-dvina.png', 'dvina adalah toko hijab grosir yang telah terbukti memiliki harga dan kwalitas terbaik se karisidenan kediri', 'magersari, gurah kediri, jln pga no 1', NULL, 2, '<p>1. pastikan telah menjadi member devina hijab kediri</p>\r\n<p>2. jangan lupa bayar setelah beli produk</p>\r\n<p>3. setiap barang yang telah di masukan keranjang akan hilang secara otomatis apabila tidak di beli dalam jangka waktu 3 hari</p>\r\n<p>4. Happy Shopping gengs</p>');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table davina.sliders
DROP TABLE IF EXISTS `sliders`;
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.sliders: ~2 rows (approximately)
DELETE FROM `sliders`;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` (`id`, `judul`, `foto`) VALUES
	(1, 'ini slide 1', '1547719152-slider1.jpg'),
	(2, 'ini slide 2', '1547719305-banner2.jpg'),
	(3, 'ini slide 3', '1547719341-banner3.jpg');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;

-- Dumping structure for table davina.tb_bank
DROP TABLE IF EXISTS `tb_bank`;
CREATE TABLE IF NOT EXISTS `tb_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_bank` varchar(40) DEFAULT NULL,
  `rekening` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_bank: ~1 rows (approximately)
DELETE FROM `tb_bank`;
/*!40000 ALTER TABLE `tb_bank` DISABLE KEYS */;
INSERT INTO `tb_bank` (`id`, `nama_bank`, `rekening`) VALUES
	(1, 'bayar ditoko\r\n', '-'),
	(2, 'mandiri Syariah', '09737897890'),
	(3, 'BRI', '902890890'),
	(4, 'bank jatim', '09890890890');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_barangs: ~13 rows (approximately)
DELETE FROM `tb_barangs`;
/*!40000 ALTER TABLE `tb_barangs` DISABLE KEYS */;
INSERT INTO `tb_barangs` (`idbarang`, `kode`, `stok`, `warna`, `barang_jenis`) VALUES
	(1, 'BRG00001', 10, 'merah', 'bella square merah'),
	(2, 'BRG00001', 13, 'hijau telor asin', 'bella square hijau telor asin'),
	(3, 'BRG00001', 17, 'biru muda', 'bella square biru muda'),
	(4, 'BRG00002', 10, 'merah', 'Syar\'I khimar hilwa merah'),
	(5, 'BRG00002', 19, 'biru', 'Syar\'I khimar hilwa biru'),
	(6, 'BRG00003', 30, 'putih', 'instan minipad moonflower putih'),
	(7, 'BRG00003', 10, 'merah', 'instan minipad moonflower merah'),
	(8, 'BRG00003', 18, 'abu-abu', 'instan minipad moonflower abu-abu'),
	(9, 'BRG00004', 10, 'merah', 'instan salwa sherin merah'),
	(10, 'BRG00004', 20, 'biru', 'instan salwa sherin biru'),
	(11, 'BRG00004', 10, 'hijau', 'instan salwa sherin hijau'),
	(12, 'BRG00005', 12, 'merah putih', 'segitiga instan livy merah putih'),
	(13, 'BRG00005', 13, 'biru gelap', 'segitiga instan livy biru gelap');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_details: ~0 rows (approximately)
DELETE FROM `tb_details`;
/*!40000 ALTER TABLE `tb_details` DISABLE KEYS */;
INSERT INTO `tb_details` (`id`, `idwarna`, `iduser`, `faktur`, `tgl`, `tgl_kadaluarsa`, `kode_barang`, `barang`, `harga`, `jumlah`, `total_a`, `diskon`, `total`, `admin`, `metode`) VALUES
	(1, 8, 5, 'DVINA00001', '2019-01-18', '2019-01-20', 'BRG00003', 'instan minipad moonflower', 35000, 2, 70000, 0, 70000, NULL, 'pesan'),
	(2, 2, 5, 'DVINA00001', '2019-01-18', '2019-01-20', 'BRG00001', 'bella square', 23000, 2, 46000, 10, 41400, NULL, 'pesan'),
	(4, 5, 5, 'DVINA00001', '2019-01-18', '2019-01-20', 'BRG00002', 'Syar\'I khimar hilwa', 40000, 1, 40000, 0, 40000, NULL, 'pesan');
/*!40000 ALTER TABLE `tb_details` ENABLE KEYS */;

-- Dumping structure for table davina.tb_kategoris
DROP TABLE IF EXISTS `tb_kategoris`;
CREATE TABLE IF NOT EXISTS `tb_kategoris` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(100) DEFAULT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_kategoris: ~2 rows (approximately)
DELETE FROM `tb_kategoris`;
/*!40000 ALTER TABLE `tb_kategoris` DISABLE KEYS */;
INSERT INTO `tb_kategoris` (`id`, `kategori`, `gambar`) VALUES
	(1, 'jilbab 2019', '1547686700-v1.jpg'),
	(2, 'jilbab abg', '1547686744-heyy.jpg'),
	(3, 'jilbab terbaru', '1547686901-hah.jpeg');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_kodes: ~4 rows (approximately)
DELETE FROM `tb_kodes`;
/*!40000 ALTER TABLE `tb_kodes` DISABLE KEYS */;
INSERT INTO `tb_kodes` (`id`, `id_kategori`, `kode_barang`, `barang`, `harga_beli`, `harga_barang`, `deskripsi`, `diskon`) VALUES
	(1, 2, 'BRG00001', 'bella square', 20000, 23000, 'jilbab mantab dipake kalo buat jalan - jalan, bahan nyaman plus aman\r\n\r\n-dijamin ori\r\n-packing aman', 10),
	(2, 1, 'BRG00002', 'Syar\'I khimar hilwa', 38000, 40000, 'hijab mantab untuk keseharian', 0),
	(3, 1, 'BRG00003', 'instan minipad moonflower', 32000, 35000, '<blockquote><p>Ada banyak variasi tulisan</p></blockquote><p><strong>Lorem Ipsum yang tersedia, tapi kebanyakan sudah mengalami perubahan</strong> </p><p>bentuk, entah karena unsur humor atau kalimat yang diacak hingga nampak sangat tidak masuk akal. Jika anda ingin menggunakan tulisan Lorem Ipsum, anda harus yakin tidak ada bagian yang memalukan yang tersembunyi di tengah naskah tersebut. Semua generator Lorem Ipsum di internet cenderung untuk mengulang bagian-bagian tertentu. Karena itu inilah generator pertama yang sebenarnya di internet. Ia menggunakan kamus perbendaharaan yang terdiri dari 200 kata Latin, yang digabung dengan banyak contoh struktur kalimat untuk menghasilkan Lorem Ipsun yang nampak masuk akal. Karena itu Lorem Ipsun yang dihasilkan akan selalu bebas dari pengulangan, unsur humor yang sengaja dimasukkan, kata yang tidak sesuai dengan karakteristiknya dan lain sebagainya.</p>', 0),
	(4, 2, 'BRG00004', 'instan salwa sherin', 22000, 25000, '<h1>Ada banyak variasi</h1><p><strong>tulisan Lorem Ipsum yang tersedia</strong>, </p><p>tapi kebanyakan sudah mengalami perubahan bentuk, entah karena unsur humor atau kalimat yang diacak hingga nampak sangat tidak masuk akal. Jika anda ingin menggunakan tulisan Lorem Ipsum, anda harus yakin tidak ada bagian yang memalukan yang tersembunyi di tengah naskah tersebut. Semua generator Lorem Ipsum di internet cenderung untuk mengulang bagian-bagian tertentu. </p><ol><li>Karena itu inilah generator pertama yang sebenarnya di internet.</li><li>Ia menggunakan kamus perbendaharaan yang terdiri dari 200 kata Latin,</li></ol><p>yang digabung dengan banyak contoh struktur kalimat untuk menghasilkan Lorem Ipsun yang nampak masuk akal. Karena itu Lorem Ipsun yang dihasilkan akan selalu bebas dari pengulangan, unsur humor yang sengaja dimasukkan, kata yang tidak sesuai dengan karakteristiknya dan lain sebagainya.</p>', 0),
	(5, 3, 'BRG00005', 'segitiga instan livy', 20000, 22000, '<h2>Lorem Ipsum </h2><p><strong>adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting</strong></p><p>Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf. Ia tidak hanya bertahan selama 5 abad, tapi juga telah beralih ke penataan huruf elektronik, tanpa ada perubahan apapun. Ia mulai dipopulerkan pada tahun 1960 dengan diluncurkannya lembaran-lembaran Letraset yang menggunakan kalimat-kalimat dari Lorem Ipsum, dan seiring munculnya perangkat lunak Desktop Publishing seperti Aldus PageMaker juga memiliki versi Lorem Ipsum.</p>', 10);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_tambahstoks: ~11 rows (approximately)
DELETE FROM `tb_tambahstoks`;
/*!40000 ALTER TABLE `tb_tambahstoks` DISABLE KEYS */;
INSERT INTO `tb_tambahstoks` (`id`, `idwarna`, `idadmin`, `kode_barang`, `jumlah`, `total`, `tgl`, `keterangan`, `aksi`) VALUES
	(1, 1, 10, 'BRG00001', 10, 200000, '2019-01-17', 'menambah pertama kali', 'tambah'),
	(2, 2, 10, 'BRG00001', 15, 300000, '2019-01-17', 'menambah pertama kali', 'tambah'),
	(3, 3, 10, 'BRG00001', 20, 400000, '2019-01-17', 'menambah pertama kali', 'tambah'),
	(4, 4, 10, 'BRG00002', 10, 380000, '2019-01-17', 'menambah pertama kali', 'tambah'),
	(5, 5, 10, 'BRG00002', 20, 760000, '2019-01-17', 'menambah pertama kali', 'tambah'),
	(6, 6, 10, 'BRG00003', 30, 960000, '2019-01-17', 'menambah pertama kali', 'tambah'),
	(7, 7, 10, 'BRG00003', 10, 320000, '2019-01-17', 'menambah pertama kali', 'tambah'),
	(8, 8, 10, 'BRG00003', 20, 640000, '2019-01-17', 'menambah pertama kali', 'tambah'),
	(9, 9, 10, 'BRG00004', 10, 220000, '2019-01-17', 'menambah pertama kali', 'tambah'),
	(10, 10, 10, 'BRG00004', 20, 440000, '2019-01-17', 'menambah pertama kali', 'tambah'),
	(11, 11, 10, 'BRG00004', 10, 220000, '2019-01-17', 'menambah pertama kali', 'tambah'),
	(12, 12, 10, 'BRG00005', 10, 200000, '2019-01-17', 'menambah pertama kali', 'tambah'),
	(13, 13, 10, 'BRG00005', 15, 300000, '2019-01-17', 'menambah pertama kali', 'tambah'),
	(14, 12, 10, 'BRG00005', 2, 40000, '2019-01-18', 'kemaren lupa di hitung', 'tambah'),
	(15, 13, 10, 'BRG00005', 2, 40000, '2019-01-18', 'di beli tetangga', 'kurangi'),
	(16, 3, 10, 'BRG00001', 3, 60000, '2019-01-18', 'di pindah ke stok offline', 'kurangi');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_transaksis: ~1 rows (approximately)
DELETE FROM `tb_transaksis`;
/*!40000 ALTER TABLE `tb_transaksis` DISABLE KEYS */;
INSERT INTO `tb_transaksis` (`id`, `iduser`, `faktur`, `tgl`, `total`, `status`, `alamat_tujuan`, `admin`, `ongkir`, `total_akhir`, `pembayaran`, `keterangan`) VALUES
	(1, 5, 'DVINA00001', '2019-01-18', 151400, 'diterima', 'babatan, JLN iwak enak no 1', NULL, 10000, 161400, '2', 'cepet ya gan');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table davina.tb_users: ~3 rows (approximately)
DELETE FROM `tb_users`;
/*!40000 ALTER TABLE `tb_users` DISABLE KEYS */;
INSERT INTO `tb_users` (`id`, `username`, `password`, `email`, `telp`, `nama`, `alamat`, `kota`, `provinsi`, `kodepos`, `ktp_gmb`, `cancel`) VALUES
	(1, 'jianfitri', '$2y$10$7OFfX7UYIFIg5eZqfHEm/.kGniFHkqVE6/Avzcze7GuOfVjxB3n9e', 'jian@gmail.com', '023498290348', 'jian fitri aprilia', 'gurah kediri', 'kediri lagi', 'aceh', '09348', '1547635500-2.jpg', 0),
	(3, 'fauziahmad', '$2y$10$w/H3R1TZdbwYWAGas981seTeBK02UqvEf53lyddI92yeDxy4N7C0K', 'ahmad@gmail.com', '023899009', 'ahmad fauzi tamvan', 'loceret ngnyuk', 'loceret', 'jakarta', '00002', '1547641123-13.jpg', 0),
	(4, 'adisasmito', '$2y$10$gNTRQ2/NHO2AA.lhJ/lbu.H6Arh/RxFJyT3Tyw2Bg2QhUp8VnxNJe', 'heru@gmail.com', '0238490238', 'heru adi sasmito', 'kediri gurah', 'kediri', 'aceh', '023948', '1547646632-10.jpg', 0),
	(5, 'rinookta', '$2y$10$1fnkv00urRNJCtod6izMYuB2kj9LTScqNxWS27RmhXdiAqD6w4t7q', 'rino@gmail.com', '0859874929890', 'rino oktavian', 'babatan, JLN iwak enak no 1', 'kediri', 'jawa timur', '03498', '1547814815-contohktp.png', 1);
/*!40000 ALTER TABLE `tb_users` ENABLE KEYS */;

-- Dumping structure for trigger davina.add_stok
DROP TRIGGER IF EXISTS `add_stok`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `add_stok` AFTER INSERT ON `tb_tambahstoks` FOR EACH ROW update tb_barangs set stok=stok+new.jumlah where idbarang=new.idwarna//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger davina.in_stok
DROP TRIGGER IF EXISTS `in_stok`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
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
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `min_stok` AFTER INSERT ON `tb_details` FOR EACH ROW update tb_barangs set stok=stok-new.jumlah where idbarang=new.idwarna//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
