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

-- Dumping data for table davina.admins: ~2 rows (approximately)
DELETE FROM `admins`;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` (`id`, `username`, `password`, `nama`, `telp`, `email`, `level`) VALUES
	(2, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '085604556715', 'satriosuklun@gmail.com', 'admin'),
	(3, 'superadmin', '827ccb0eea8a706c4c34a16891f84e7b', 'super admin', '085682374023', 'satriosuklun@gmail.com', 'super_admin'),
	(4, 'devasatrio', '74b213f68f648006a318f52713450f27', 'deva satrio', '085604556714', 'satriosuklun@gmail.com', 'programer');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;

-- Dumping data for table davina.gambar: ~0 rows (approximately)
DELETE FROM `gambar`;
/*!40000 ALTER TABLE `gambar` DISABLE KEYS */;
INSERT INTO `gambar` (`id`, `kode_barang`, `nama`) VALUES
	(1, 'BRG00001', '1541774769-download.jpg'),
	(2, 'BRG00001', '1541774769-high-quality-muslim-hijab-scarf-cotton-jersey-hijabs-turban-muslim-hijab-infiity-scarf-muslim-head-coverings-92.jpg'),
	(3, 'BRG00001', '1541774769-images.jpg');
/*!40000 ALTER TABLE `gambar` ENABLE KEYS */;

-- Dumping data for table davina.migrations: ~3 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(4, '2014_10_12_000000_create_users_table', 1),
	(5, '2014_10_12_100000_create_password_resets_table', 1),
	(6, '2018_10_11_054351_create_pemesanans_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping data for table davina.pemesanans: ~0 rows (approximately)
DELETE FROM `pemesanans`;
/*!40000 ALTER TABLE `pemesanans` DISABLE KEYS */;
/*!40000 ALTER TABLE `pemesanans` ENABLE KEYS */;

-- Dumping data for table davina.settings: ~0 rows (approximately)
DELETE FROM `settings`;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`idsettings`, `webName`, `kontak1`, `kontak2`, `kontak3`, `email`, `ico`, `meta`, `logo`) VALUES
	(1, 'nama webnya 12', '123451112', '123451112', '123451112', 'devatamvan@gmail.com', '1539867788-pencil-icon.png', 'ini metanya 12', '1539867788-icons8_flat_ruler.svg.png');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping data for table davina.sliders: ~2 rows (approximately)
DELETE FROM `sliders`;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` (`id`, `judul`, `foto`) VALUES
	(2, 'ini slide 2 baru gambarnya', '1541552859-20180227_054709.jpg');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;

-- Dumping data for table davina.tb_barangouts: ~0 rows (approximately)
DELETE FROM `tb_barangouts`;
/*!40000 ALTER TABLE `tb_barangouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_barangouts` ENABLE KEYS */;

-- Dumping data for table davina.tb_barangs: ~0 rows (approximately)
DELETE FROM `tb_barangs`;
/*!40000 ALTER TABLE `tb_barangs` DISABLE KEYS */;
INSERT INTO `tb_barangs` (`idbarang`, `kode`, `stok`, `warna`, `barang_jenis`) VALUES
	(1, 'BRG00001', 10, 'merah', 'jilbab kediri merah'),
	(2, 'BRG00001', 12, 'biru', 'jilbab kediri biru'),
	(3, 'BRG00002', 10, 'putih', 'jilbab malang putih'),
	(4, 'BRG00002', NULL, NULL, NULL);
/*!40000 ALTER TABLE `tb_barangs` ENABLE KEYS */;

-- Dumping data for table davina.tb_details: ~1 rows (approximately)
DELETE FROM `tb_details`;
/*!40000 ALTER TABLE `tb_details` DISABLE KEYS */;
INSERT INTO `tb_details` (`id`, `faktur`, `tgl`, `kode_barang`, `barang`, `harga`, `jumlah`, `total_a`, `diskon`, `total`, `admin`) VALUES
	(2, NULL, NULL, 'BRG00002', 'kerudung baru', 15000, 1, 15000, 0, 15000, 'admin');
/*!40000 ALTER TABLE `tb_details` ENABLE KEYS */;

-- Dumping data for table davina.tb_kategoris: ~1 rows (approximately)
DELETE FROM `tb_kategoris`;
/*!40000 ALTER TABLE `tb_kategoris` DISABLE KEYS */;
INSERT INTO `tb_kategoris` (`id`, `kategori`, `gambar`) VALUES
	(4, 'kerudung wanita', '1541756913-0056a08d4b2c91f.jpg');
/*!40000 ALTER TABLE `tb_kategoris` ENABLE KEYS */;

-- Dumping data for table davina.tb_kodes: ~1 rows (approximately)
DELETE FROM `tb_kodes`;
/*!40000 ALTER TABLE `tb_kodes` DISABLE KEYS */;
INSERT INTO `tb_kodes` (`id`, `id_kategori`, `kode_barang`, `barang`, `harga_barang`, `deskripsi`, `diskon`) VALUES
	(1, 4, 'BRG00001', 'jilbab kediri', 20000, 'ini deskripsi jilbab kediri', 1000),
	(2, 4, 'BRG00002', 'jilbab malang', 12000, 'ini deskripsi jilbab malang', 0);
/*!40000 ALTER TABLE `tb_kodes` ENABLE KEYS */;

-- Dumping data for table davina.tb_stokawals: ~0 rows (approximately)
DELETE FROM `tb_stokawals`;
/*!40000 ALTER TABLE `tb_stokawals` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_stokawals` ENABLE KEYS */;

-- Dumping data for table davina.tb_tambahstoks: ~0 rows (approximately)
DELETE FROM `tb_tambahstoks`;
/*!40000 ALTER TABLE `tb_tambahstoks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tambahstoks` ENABLE KEYS */;

-- Dumping data for table davina.tb_transaksis: ~0 rows (approximately)
DELETE FROM `tb_transaksis`;
/*!40000 ALTER TABLE `tb_transaksis` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_transaksis` ENABLE KEYS */;

-- Dumping data for table davina.tb_users: ~2 rows (approximately)
DELETE FROM `tb_users`;
/*!40000 ALTER TABLE `tb_users` DISABLE KEYS */;
INSERT INTO `tb_users` (`id`, `username`, `password`, `email`, `telp`, `nama`, `alamat`, `kota`, `provinsi`, `kodepos`, `ktp_gmb`) VALUES
	(5, 'devasatrio', 'd7676543', 'satriodamara1@gmail.com', '098590283490', 'deva satrio damara', 'gurah kediri', 'kediri', 'yogyakarta', '04759839', '1539862037-joy-full-team.png'),
	(6, 'superadmin', '827ccb0eea8a706c4c34a16891f84e7b', 'satriodamara1@gmail.com', '304958903458', 'satrio damara', 'sdfsdf', 'sdfgsdfg', 'banten', '356456', ''),
	(7, 'heruadi', '827ccb0eea8a706c4c34a16891f84e7b', 'satriodamara1@gmail.com', '0987892345892', 'heru adi', 'gurah kediri', 'kedir', 'NTB', '0909', '1540102983-konco-dewe-logo.png');
/*!40000 ALTER TABLE `tb_users` ENABLE KEYS */;

-- Dumping data for table davina.users: ~0 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
