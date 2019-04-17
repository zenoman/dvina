-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 15, 2019 at 10:11 AM
-- Server version: 10.2.21-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u5946403_dvina`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(80) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `telp` varchar(25) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `level` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `nama`, `telp`, `email`, `level`) VALUES
(10, 'devasatrio', '$2y$10$7d6KjJtH/GfK.45S1R9JAefDZgcCF3CW0DiW68a4FoTjiyGM/yUBS', 'deva satrio damara', '023934820948', 'satriosuklun@gmail.com', 'programer'),
(11, 'diansetiawan', '$2y$10$CpKmLECL3v8nVnL37Tb20ugH8QMjugXapUyuTpEhuXxziVvqddiWm', 'dian ade setiawan', '085623497800', 'dianade@gmail.com', 'programer'),
(13, 'abiihsan', '$2y$10$HtZx6PUklxwaaFntiHqV5.4BZiXNEXdF1eA/J.ce701M5Thi7RLki', 'abi ihsan fadli', '2093482903480', 'abi@gmail.com', 'programer'),
(14, 'taufiqperdana', '$2y$10$734GwOfWOeNB6gdtZqR7ZutUB8FzjPaupBypdRsFjypj3RFnQMKFa', 'M. taufiq perdana', '023984290380', 'taufiq@gmail.com', 'programer'),
(17, 'adminnoor', '$2y$10$2t7bfLcxd3./SD6NHVTQY.beNx9GgHLaeDBPUfvlCWnjlcz3Zyp/a', 'Admin NOOR', '+6282231300279', 'triwahyuni070179@gmail.com', 'admin'),
(19, 'owner354', '$2y$10$dPsnc6uREY7NFkZxsKUNfuHxbBYuoZHme64oV2MbUIqMF0H/ASfN2', 'Muhammad Royani', '+6281259001354', 'rayhan.elfaza@gmail.com', 'super_admin'),
(20, 'adminkiky', '$2y$10$UWP0iDjbT50.mh0PQo8sbOZHql7e7IyCpsQTimBjO/tpRJkYxLjp6', 'Admin Kiky', '+6281333881979', 'dvina070179@gmail.com', 'admin'),
(21, 'adminluluk', '$2y$10$riHLJq1bLV6C4dM.C.vVROYLjTW1y5.PHgV6ePj4BXLRyjy58dfYW', 'Admin Luluk', '+6282230384005', 'dvinacollection354@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `detail_cancel`
--

CREATE TABLE `detail_cancel` (
  `id` int(11) NOT NULL,
  `idwarna` int(11) DEFAULT NULL,
  `iduser` int(11) DEFAULT NULL,
  `kode` text DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `barang` varchar(100) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `diskon` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `detail_cancel`
--
DELIMITER $$
CREATE TRIGGER `in_stok` AFTER INSERT ON `detail_cancel` FOR EACH ROW update tb_barangs set stok=stok+new.jumlah where idbarang=new.idwarna
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `gambar`
--

CREATE TABLE `gambar` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(30) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gambar`
--

INSERT INTO `gambar` (`id`, `kode_barang`, `nama`) VALUES
(52, 'BRG00001', '1552730970-photo_2019-03-11_09-42-11.png'),
(59, 'BRG00003', '1553329444-trivia-marun.jpg'),
(60, 'BRG00003', '1553329444-trivia-navy.jpg'),
(61, 'BRG00003', '1553329444-trivia-peach.jpg'),
(62, 'BRG00003', '1553330614-trivia.png'),
(66, 'BRG00006', '1553659811-syafira.jpg'),
(67, 'BRG00006', '1553659843-nayla-kancing.jpg'),
(73, 'BRG00008', '1553662611-radea.jpg'),
(74, 'BRG00008', '1553663482-khimar-radea.jpg'),
(75, 'BRG00009', '1553684519-khimar-bella-tie.jpg'),
(76, 'BRG00009', '1553684535-bella-tie.jpg'),
(77, 'BRG00001', '1553684584-khimar-raisha-combi.jpg'),
(78, 'BRG00001', '1553684610-raisha-combi-2.jpg'),
(79, 'BRG00001', '1553684610-raisha-combi.jpg'),
(80, 'BRG00004', '1553685816-khimar-marsya-model.jpg'),
(81, 'BRG00004', '1553685817-khimar-marsya.jpg'),
(82, 'BRG00011', '1553686782-divia.jpg'),
(83, 'BRG00010', '1553686843-khimar-rafella-kunyit.jpg'),
(84, 'BRG00010', '1553686843-khimar-rafella.jpg'),
(85, 'BRG00010', '1553686869-khimar-rafella.jpg'),
(86, 'BRG00011', '1553687195-seri-divia.jpg'),
(91, 'BRG00018', '1553690312-arafah-plus.jpg'),
(92, 'BRG00018', '1553690336-arafah-salem.jpg'),
(93, 'BRG00018', '1553744529-seri-arafah.jpg'),
(95, 'BRG00012', '1553748204-raya-logo.jpg'),
(96, 'BRG00012', '1553748204-raya-navy.jpg'),
(97, 'BRG00012', '1553748224-al-qia-raya.jpg'),
(98, 'BRG00013', '1553748267-al-qia-salma-fix.jpg'),
(99, 'BRG00013', '1553748289-al-qia-salma.jpg'),
(100, 'BRG00014', '1553748316-al-qia-adiba-fix.jpg'),
(101, 'BRG00014', '1553748329-al-qia-adiba.jpg'),
(102, 'BRG00015', '1553748357-reva-fix.jpg'),
(103, 'BRG00015', '1553748369-al-qia-reva.jpg'),
(104, 'BRG00016', '1553748405-polka-hitam.jpg'),
(105, 'BRG00016', '1553748405-polka-salem.jpg'),
(106, 'BRG00016', '1553748419-polka-plisket.jpg'),
(107, 'BRG00017', '1553748473-sakira-haina.jpg'),
(108, 'BRG00017', '1553748492-seri-sakira.jpg'),
(109, 'BRG00007', '1553749217-pastan-adella.jpg'),
(110, 'BRG00007', '1553749239-photo_2019-03-11_10-01-25.png'),
(111, 'BRG00007', '1553749255-pastan.jpg'),
(112, 'BRG00005', '1553749302-rumana-fix.jpg'),
(113, 'BRG00005', '1553749323-rumana-permata-cerruti.png'),
(114, 'BRG00019', '1553752354-gotic-rd.jpg'),
(115, 'BRG00019', '1553752368-seri-gotik-rd.jpg'),
(116, 'BRG00020', '1553752438-miranda-pink-fix.jpg'),
(117, 'BRG00020', '1553752450-miranda-pink.png'),
(118, 'BRG00020', '1553752468-seri-miranda-kombi.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang_cancel`
--

CREATE TABLE `keranjang_cancel` (
  `id` int(11) NOT NULL,
  `tgl` date DEFAULT NULL,
  `idbarang` int(11) NOT NULL DEFAULT 0,
  `jumlah` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keranjang_cancel`
--

INSERT INTO `keranjang_cancel` (`id`, `tgl`, `idbarang`, `jumlah`) VALUES
(27, '2019-04-01', 72, 1),
(28, '2019-04-01', 130, 1),
(29, '2019-04-07', 240, 1),
(30, '2019-04-07', 180, 1),
(31, '2019-04-07', 187, 1),
(32, '2019-04-07', 223, 1),
(33, '2019-04-07', 198, 1),
(34, '2019-04-07', 112, 1);

-- --------------------------------------------------------

--
-- Table structure for table `log_cancel`
--

CREATE TABLE `log_cancel` (
  `id` int(11) NOT NULL,
  `faktur` varchar(300) DEFAULT NULL,
  `total_akhir` int(11) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `bulan` int(5) DEFAULT NULL,
  `status` enum('dicancel','ditolak') DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `omset`
--

CREATE TABLE `omset` (
  `id` int(11) NOT NULL,
  `pemasukan_online` int(11) DEFAULT NULL,
  `pemasukan_offline` int(11) DEFAULT NULL,
  `pemasukan_lain` int(11) DEFAULT NULL,
  `pengeluaran` int(11) DEFAULT NULL,
  `omset` int(11) DEFAULT NULL,
  `bulan` int(11) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `omset`
--

INSERT INTO `omset` (`id`, `pemasukan_online`, `pemasukan_offline`, `pemasukan_lain`, `pengeluaran`, `omset`, `bulan`, `tahun`) VALUES
(1, 191600, NULL, 100000, 5490000, -5198400, 1, 2019),
(2, 42000, 242800, 120000, 2326000, -1921200, 2, 2019),
(3, 0, 524000, NULL, 10759000, -10235000, 3, 2019);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `idsettings` int(11) NOT NULL,
  `webName` varchar(100) DEFAULT NULL,
  `kontak1` varchar(45) DEFAULT NULL,
  `kontak2` varchar(45) DEFAULT NULL,
  `kontak3` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `ico` varchar(45) DEFAULT NULL,
  `meta` text DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `nama_toko` int(11) DEFAULT NULL,
  `max_tgl` int(5) DEFAULT NULL,
  `peraturan` text DEFAULT NULL,
  `bulansistem` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`idsettings`, `webName`, `kontak1`, `kontak2`, `kontak3`, `email`, `ico`, `meta`, `logo`, `keterangan`, `alamat`, `nama_toko`, `max_tgl`, `peraturan`, `bulansistem`) VALUES
(1, 'D\'vina Collection', '+6282231300279', '+6281333881979', '+6282230384005', 'triwahyuni070179@gmail.com', '1549191792-dvinafavicon.png', 'Grosir hijab murah dan berkualitas.', '1549191952-logo-dvina.png', 'PUSAT HIJAB TERBARU, TERMURAH, DAN BERKUALITAS.\r\nAMANAH, JUJUR, DAN TERPERCAYA.\r\nPELAYANAN RAMAH DAN PRIMA. \r\nSEMUA BARANG YANG DIJUAL REALPICT, ASLI SESUAI GAMBAR.', 'Pasar Bandar No. Kios 155 Kel. Bandar Lor Kec. Mojoroto Kota Kediri 64114', NULL, 3, '<ol><li>Siapkan<strong> User Name dan Pasword </strong>yg mudah diingat untuk mendaftar<strong>. </strong></li><li>Setelah berhasil <strong>LOGIN, segera lengkapi Profil di aplikasi. </strong>Isi Biodata Diri secara lengkap. <i><strong>Nama asli sesuai KTP dan alamat lengkap. </strong></i><strong>Kode Pos wajib ada</strong>. Jika tidak tahu kode Pos bisa browsing di google, dicari berdasarkan Kelurahan untuk wilayah Kota, Kecamatan untuk wilayah Kabupaten.<i><strong> </strong></i>Guna memudahkan kami dalam proses pengiriman barang.</li><li><strong>SIAPA CEPAT DIA DAPAT</strong>. Dengan memasukkan barang ke dalam keranjang, <strong>bukan berarti KEEP. </strong>Karena tidak mengurangi stok barang. Setelah anda <strong>CHECK OUT / membuat pesanan, </strong>baru stok barang berkurang.</li><li>Pastikan segera melakukan <strong>PEMBAYARAN</strong> setelah <strong>CHECKOUT</strong>/<i><strong>membuatpesanan</strong></i>. Segera hubungi <strong>ADMIN </strong>untuk konfirmasi pembayaran, pengambilan barang di toko, maupun ONGKIR jika barang dikirim.</li></ol><p> </p>', 4);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `judul`, `foto`) VALUES
(2, 'ini slide 2', '1553329226-3.png'),
(3, 'ini slide 3', '1553329260-1.jpg'),
(4, 'ini slider 1', '1553329281-4.png'),
(5, 'halo halo', '1553329298-2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_bank`
--

CREATE TABLE `tb_bank` (
  `id` int(11) NOT NULL,
  `nama_bank` varchar(40) DEFAULT NULL,
  `rekening` varchar(40) DEFAULT NULL,
  `atasnama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_bank`
--

INSERT INTO `tb_bank` (`id`, `nama_bank`, `rekening`, `atasnama`) VALUES
(1, 'bayar ditoko\r\n', '-', '-'),
(5, 'BCA', '0331927456', 'Tri Wahyuni'),
(6, 'BRI', '055501022914503', 'Tri Wahyuni'),
(7, 'BNI', '0495045367', 'Tri Wahyuni'),
(8, 'Mandiri', '1710002430380', 'Tri Wahyuni');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barangs`
--

CREATE TABLE `tb_barangs` (
  `idbarang` int(11) NOT NULL,
  `kode` varchar(100) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `warna` varchar(45) DEFAULT NULL,
  `barang_jenis` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barangs`
--

INSERT INTO `tb_barangs` (`idbarang`, `kode`, `stok`, `warna`, `barang_jenis`) VALUES
(29, 'BRG00001', 2, 'navy', 'Khimar Raisya Kombi navy'),
(30, 'BRG00001', 1, 'Lemon', 'Khimar Raisya Kombi Lemon'),
(31, 'BRG00001', 2, 'Wardah', 'Khimar Raisya Kombi Wardah'),
(32, 'BRG00001', 2, 'Hitam', 'Khimar Raisya Kombi Hitam'),
(33, 'BRG00001', 3, 'Ungsal', 'Khimar Raisya Kombi Ungsal'),
(34, 'BRG00001', 2, 'Coksu', 'Khimar Raisya Kombi Coksu'),
(35, 'BRG00001', 3, 'peach/wardah', 'Khimar Raisya Kombi peach/wardah'),
(36, 'BRG00001', 1, 'kunyit', 'Khimar Raisya Kombi kunyit'),
(37, 'BRG00001', 3, 'Silver/Navy', 'Khimar Raisya Kombi Silver/Navy'),
(38, 'BRG00001', 2, 'Peach/Silver', 'Khimar Raisya Kombi Peach/Silver'),
(39, 'BRG00001', 1, 'Silver/peach', 'Khimar Raisya Kombi Silver/peach'),
(49, 'BRG00003', 2, 'salem', 'Khimar Trivia salem'),
(50, 'BRG00003', 2, 'marun', 'Khimar Trivia marun'),
(51, 'BRG00003', 2, 'silver', 'Khimar Trivia silver'),
(52, 'BRG00003', 2, 'kopsu', 'Khimar Trivia kopsu'),
(53, 'BRG00003', 2, 'cream', 'Khimar Trivia cream'),
(54, 'BRG00003', 2, 'kunyit', 'Khimar Trivia kunyit'),
(55, 'BRG00003', 2, 'navy', 'Khimar Trivia navy'),
(56, 'BRG00003', 2, 'softpeach', 'Khimar Trivia softpeach'),
(57, 'BRG00004', 3, 'hitam', 'Khimar Marsya hitam'),
(58, 'BRG00004', 2, 'laven', 'Khimar Marsya laven'),
(59, 'BRG00004', 2, 'dusty', 'Khimar Marsya dusty'),
(60, 'BRG00004', 1, 'kunyit', 'Khimar Marsya kunyit'),
(61, 'BRG00004', 2, 'tosmud', 'Khimar Marsya tosmud'),
(62, 'BRG00004', 1, 'kopsu', 'Khimar Marsya kopsu'),
(63, 'BRG00004', 3, 'marun', 'Khimar Marsya marun'),
(64, 'BRG00004', 2, 'abu', 'Khimar Marsya abu'),
(65, 'BRG00004', 2, 'toska', 'Khimar Marsya toska'),
(66, 'BRG00004', 2, 'fanta', 'Khimar Marsya fanta'),
(67, 'BRG00005', 1, 'salem', 'Rumana Permata salem'),
(68, 'BRG00005', 1, 'navy', 'Rumana Permata navy'),
(69, 'BRG00005', 1, 'kopsu', 'Rumana Permata kopsu'),
(70, 'BRG00005', 1, 'coklat', 'Rumana Permata coklat'),
(71, 'BRG00005', 1, 'silver', 'Rumana Permata silver'),
(72, 'BRG00005', 1, 'hitam', 'Rumana Permata hitam'),
(73, 'BRG00005', 1, 'hijau', 'Rumana Permata hijau'),
(74, 'BRG00006', 2, 'kuning', 'Khimar Syafina kuning'),
(75, 'BRG00006', 1, 'ungsal', 'Khimar Syafina ungsal'),
(76, 'BRG00006', 1, 'abu', 'Khimar Syafina abu'),
(77, 'BRG00006', 1, 'salmon', 'Khimar Syafina salmon'),
(78, 'BRG00006', 2, 'marun', 'Khimar Syafina marun'),
(79, 'BRG00006', 2, 'toska', 'Khimar Syafina toska'),
(80, 'BRG00006', 1, 'kopsu', 'Khimar Syafina kopsu'),
(81, 'BRG00006', 1, 'peach', 'Khimar Syafina peach'),
(82, 'BRG00006', 1, 'jolum tua', 'Khimar Syafina jolum tua'),
(83, 'BRG00006', 0, 'hitam', 'Khimar Syafina hitam'),
(84, 'BRG00006', 1, 'hijau', 'Khimar Syafina hijau'),
(95, 'BRG00007', 1, 'salem', 'Pastan Adella salem'),
(96, 'BRG00007', 1, 'marun', 'Pastan Adella marun'),
(97, 'BRG00007', 1, 'krem', 'Pastan Adella krem'),
(98, 'BRG00007', 2, 'navy', 'Pastan Adella navy'),
(99, 'BRG00007', 1, 'lemon', 'Pastan Adella lemon'),
(100, 'BRG00007', 2, 'kunyit', 'Pastan Adella kunyit'),
(101, 'BRG00007', 2, 'coksu', 'Pastan Adella coksu'),
(102, 'BRG00007', 2, 'ungsal', 'Pastan Adella ungsal'),
(103, 'BRG00007', 2, 'silver', 'Pastan Adella silver'),
(104, 'BRG00007', 2, 'hitam', 'Pastan Adella hitam'),
(105, 'BRG00008', 2, 'krem', NULL),
(106, 'BRG00008', 1, 'abu tua', NULL),
(107, 'BRG00008', 2, 'dark olive', NULL),
(108, 'BRG00008', 3, 'silver', NULL),
(109, 'BRG00008', 1, 'toska', NULL),
(110, 'BRG00008', 1, 'cokmud', NULL),
(111, 'BRG00008', 1, 'laven', NULL),
(112, 'BRG00008', 2, 'kunyit', NULL),
(113, 'BRG00008', 1, 'coksu', NULL),
(114, 'BRG00008', 1, 'mint', NULL),
(115, 'BRG00008', 1, 'milo', NULL),
(116, 'BRG00008', 1, 'peach tua', NULL),
(117, 'BRG00008', 1, 'hijau', NULL),
(118, 'BRG00008', 4, 'biru', NULL),
(119, 'BRG00008', 2, 'lime', NULL),
(120, 'BRG00008', 1, 'abu', NULL),
(121, 'BRG00008', 2, 'pink', NULL),
(122, 'BRG00008', 1, 'salem', NULL),
(123, 'BRG00008', 1, 'tasin', NULL),
(124, 'BRG00009', 1, 'merah', NULL),
(125, 'BRG00009', 0, 'lemon', NULL),
(126, 'BRG00009', 1, 'kunyit', NULL),
(127, 'BRG00009', 2, 'silver', NULL),
(128, 'BRG00009', 2, 'abu tua', NULL),
(129, 'BRG00009', 4, 'coktu', NULL),
(130, 'BRG00009', 1, 'peach', NULL),
(131, 'BRG00009', 1, 'pink', NULL),
(132, 'BRG00009', 1, 'mint', NULL),
(133, 'BRG00009', 2, 'coksu', NULL),
(134, 'BRG00009', 2, 'cokmud', NULL),
(135, 'BRG00009', 0, 'laven', NULL),
(136, 'BRG00009', 2, 'wardah 1', NULL),
(137, 'BRG00009', 1, 'ungsal', NULL),
(138, 'BRG00009', 1, 'hijau', NULL),
(139, 'BRG00009', 1, 'wardah 2', NULL),
(140, 'BRG00009', 1, 'putlang', NULL),
(141, 'BRG00009', 1, 'birel', NULL),
(142, 'BRG00009', 1, 'abu', NULL),
(143, 'BRG00009', 1, 'navy', NULL),
(144, 'BRG00009', 1, 'toska', NULL),
(145, 'BRG00010', 3, 'toska', 'Khimar Rafella toska'),
(146, 'BRG00010', 2, 'putih', 'Khimar Rafella putih'),
(147, 'BRG00010', 2, 'abu', 'Khimar Rafella abu'),
(148, 'BRG00010', 2, 'hitam', 'Khimar Rafella hitam'),
(149, 'BRG00010', 3, 'ungsal', 'Khimar Rafella ungsal'),
(150, 'BRG00010', 3, 'kunyit', 'Khimar Rafella kunyit'),
(151, 'BRG00010', 2, 'merah', 'Khimar Rafella merah'),
(152, 'BRG00010', 3, 'laven', 'Khimar Rafella laven'),
(153, 'BRG00010', 2, 'peach', 'Khimar Rafella peach'),
(154, 'BRG00010', 2, 'olive', 'Khimar Rafella olive'),
(155, 'BRG00011', 1, 'fanta', 'Khimar El-nisha 2 Layer fanta'),
(156, 'BRG00011', 1, 'hijau', 'Khimar El-nisha 2 Layer hijau'),
(157, 'BRG00011', 1, 'hitam', 'Khimar El-nisha 2 Layer hitam'),
(158, 'BRG00011', 1, 'coksu', 'Khimar El-nisha 2 Layer coksu'),
(159, 'BRG00011', 1, 'abu', 'Khimar El-nisha 2 Layer abu'),
(160, 'BRG00011', 1, 'birel', 'Khimar El-nisha 2 Layer birel'),
(161, 'BRG00011', 0, 'lemon', 'Khimar El-nisha 2 Layer lemon'),
(162, 'BRG00011', 1, 'peach', 'Khimar El-nisha 2 Layer peach'),
(163, 'BRG00011', 1, 'coktu', 'Khimar El-nisha 2 Layer coktu'),
(164, 'BRG00011', 1, 'wardah', 'Khimar El-nisha 2 Layer wardah'),
(165, 'BRG00012', 1, 'peach', 'Al-Qia Raya peach'),
(166, 'BRG00012', 0, 'silver', 'Al-Qia Raya silver'),
(167, 'BRG00012', 1, 'pink', 'Al-Qia Raya pink'),
(168, 'BRG00012', 1, 'kunyit', 'Al-Qia Raya kunyit'),
(169, 'BRG00012', 1, 'toska', 'Al-Qia Raya toska'),
(170, 'BRG00012', 2, 'hitam', 'Al-Qia Raya hitam'),
(171, 'BRG00012', 2, 'coksu', 'Al-Qia Raya coksu'),
(172, 'BRG00012', 1, 'marun', 'Al-Qia Raya marun'),
(173, 'BRG00012', 1, 'navy', 'Al-Qia Raya navy'),
(174, 'BRG00013', 1, 'pink', 'Al-Qia Salma pink'),
(175, 'BRG00013', 0, 'ungsal', 'Al-Qia Salma ungsal'),
(176, 'BRG00013', 0, 'kunyit', 'Al-Qia Salma kunyit'),
(177, 'BRG00013', 1, 'silver', 'Al-Qia Salma silver'),
(178, 'BRG00013', 1, 'navy', 'Al-Qia Salma navy'),
(179, 'BRG00013', 1, 'peach', 'Al-Qia Salma peach'),
(180, 'BRG00013', 1, 'toska', 'Al-Qia Salma toska'),
(181, 'BRG00013', 1, 'marun', 'Al-Qia Salma marun'),
(182, 'BRG00013', 1, 'coksu', 'Al-Qia Salma coksu'),
(183, 'BRG00013', 1, 'hitam', 'Al-Qia Salma hitam'),
(184, 'BRG00014', 2, 'bata', 'Al-Qia Adiba bata'),
(185, 'BRG00014', 1, 'silver', 'Al-Qia Adiba silver'),
(186, 'BRG00014', 2, 'hitam', 'Al-Qia Adiba hitam'),
(187, 'BRG00014', 2, 'kunyit', 'Al-Qia Adiba kunyit'),
(188, 'BRG00014', 2, 'kopsu', 'Al-Qia Adiba kopsu'),
(189, 'BRG00014', 3, 'tosmud', 'Al-Qia Adiba tosmud'),
(190, 'BRG00014', 2, 'marun', 'Al-Qia Adiba marun'),
(191, 'BRG00014', 2, 'toska', 'Al-Qia Adiba toska'),
(192, 'BRG00014', 1, 'navy', 'Al-Qia Adiba navy'),
(193, 'BRG00014', 2, 'pink', 'Al-Qia Adiba pink'),
(194, 'BRG00015', 0, 'coksu', 'Al-Qia Reva coksu'),
(195, 'BRG00015', 1, 'silver', 'Al-Qia Reva silver'),
(196, 'BRG00015', 2, 'marun', 'Al-Qia Reva marun'),
(197, 'BRG00015', 1, 'toska', 'Al-Qia Reva toska'),
(198, 'BRG00015', 1, 'ungsal', 'Al-Qia Reva ungsal'),
(199, 'BRG00015', 1, 'kunyit', 'Al-Qia Reva kunyit'),
(200, 'BRG00015', 1, 'pink', 'Al-Qia Reva pink'),
(201, 'BRG00015', 1, 'hitam', 'Al-Qia Reva hitam'),
(202, 'BRG00015', 1, 'bata', 'Al-Qia Reva bata'),
(203, 'BRG00016', 4, 'salem', 'Polka Pliskita salem'),
(204, 'BRG00016', 2, 'navy', 'Polka Pliskita navy'),
(205, 'BRG00016', 2, 'marun', 'Polka Pliskita marun'),
(206, 'BRG00016', 5, 'hitam', 'Polka Pliskita hitam'),
(207, 'BRG00016', 3, 'mint', 'Polka Pliskita mint'),
(208, 'BRG00017', 0, 'kunyit', 'Sakira Haina kunyit'),
(209, 'BRG00017', 1, 'salem', 'Sakira Haina salem'),
(210, 'BRG00017', 1, 'marun', 'Sakira Haina marun'),
(211, 'BRG00017', 1, 'hitam', 'Sakira Haina hitam'),
(212, 'BRG00017', 1, 'lemon', 'Sakira Haina lemon'),
(213, 'BRG00017', 1, 'milo', 'Sakira Haina milo'),
(214, 'BRG00017', 1, 'silver', 'Sakira Haina silver'),
(215, 'BRG00017', 1, 'navy', 'Sakira Haina navy'),
(216, 'BRG00017', 1, 'toska', 'Sakira Haina toska'),
(217, 'BRG00018', 3, 'toska', 'Khimar Arafah toska'),
(218, 'BRG00018', 5, 'fanta', 'Khimar Arafah fanta'),
(219, 'BRG00018', 1, 'bata', 'Khimar Arafah bata'),
(220, 'BRG00018', 2, 'coksu', 'Khimar Arafah coksu'),
(221, 'BRG00018', 5, 'silver', 'Khimar Arafah silver'),
(222, 'BRG00018', 4, 'dusty', 'Khimar Arafah dusty'),
(223, 'BRG00018', 2, 'marun', 'Khimar Arafah marun'),
(224, 'BRG00019', 0, 'navy', 'Khimar Gotic RD navy'),
(225, 'BRG00019', 0, 'dusty', 'Khimar Gotic RD dusty'),
(226, 'BRG00019', 1, 'coksu', 'Khimar Gotic RD coksu'),
(227, 'BRG00019', 1, 'kopsu', 'Khimar Gotic RD kopsu'),
(228, 'BRG00019', 1, 'ungsal', 'Khimar Gotic RD ungsal'),
(229, 'BRG00019', 1, 'fanta', 'Khimar Gotic RD fanta'),
(230, 'BRG00019', 1, 'silver', 'Khimar Gotic RD silver'),
(231, 'BRG00019', 2, 'abu', 'Khimar Gotic RD abu'),
(232, 'BRG00019', 0, 'lemon', 'Khimar Gotic RD lemon'),
(233, 'BRG00019', 1, 'hitam', 'Khimar Gotic RD hitam'),
(234, 'BRG00020', 3, 'wardah', 'Miranda Combi wardah'),
(235, 'BRG00020', 1, ' krem 1', 'Miranda Combi krem 1'),
(236, 'BRG00020', 1, 'krem 2', 'Miranda Combi krem 2'),
(237, 'BRG00020', 3, 'navy', 'Miranda Combi navy'),
(238, 'BRG00020', 2, 'fanta', 'Miranda Combi fanta'),
(239, 'BRG00020', 4, 'salem', 'Miranda Combi salem'),
(240, 'BRG00020', 3, 'pink', 'Miranda Combi pink'),
(241, 'BRG00020', 1, 'ungsal 1', 'Miranda Combi ungsal 1'),
(242, 'BRG00020', 4, 'kuning', 'Miranda Combi kuning'),
(243, 'BRG00020', 1, 'coksu', 'Miranda Combi coksu'),
(244, 'BRG00020', 2, 'hitam', 'Miranda Combi hitam'),
(245, 'BRG00020', 2, 'ungsal 2', 'Miranda Combi ungsal 2'),
(246, 'BRG00020', 2, 'marun', 'Miranda Combi marun');

-- --------------------------------------------------------

--
-- Table structure for table `tb_details`
--

CREATE TABLE `tb_details` (
  `id` int(11) NOT NULL,
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
  `sb` enum('1','0') NOT NULL DEFAULT '0',
  `admin` varchar(100) DEFAULT NULL,
  `metode` enum('langsung','pesan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_details`
--

INSERT INTO `tb_details` (`id`, `idwarna`, `iduser`, `faktur`, `tgl`, `tgl_kadaluarsa`, `kode_barang`, `barang`, `harga`, `jumlah`, `total_a`, `diskon`, `total`, `sb`, `admin`, `metode`) VALUES
(50, 219, 35, 'STA29031900002', '2019-03-29', '2019-04-01', 'BRG00018', 'Khimar Arafah', 49000, 1, 49000, 0, 49000, '1', NULL, 'pesan'),
(51, 223, 35, 'STA29031900002', '2019-03-29', '2019-04-01', 'BRG00018', 'Khimar Arafah', 49000, 1, 49000, 0, 49000, '1', NULL, 'pesan'),
(52, 217, 35, 'STA29031900002', '2019-03-29', '2019-04-01', 'BRG00018', 'Khimar Arafah', 49000, 1, 49000, 0, 49000, '1', NULL, 'pesan'),
(53, 246, 22, 'STA29031900004', '2019-03-29', '2019-04-01', 'BRG00020', 'Miranda Combi', 26000, 1, 26000, 0, 26000, '1', NULL, 'pesan'),
(55, 83, 21, 'STA29031900005', '2019-03-29', '2019-04-01', 'BRG00006', 'Khimar Syafina', 52000, 1, 52000, 0, 52000, '1', NULL, 'pesan'),
(56, 217, 9, 'STA29031900003', '2019-03-29', '2019-04-01', 'BRG00018', 'Khimar Arafah', 49000, 1, 49000, 0, 49000, '1', NULL, 'pesan'),
(61, 148, 8, 'STA29031900006', '2019-03-29', '2019-04-01', 'BRG00010', 'Khimar Rafella', 40000, 1, 40000, 0, 40000, '1', NULL, 'pesan'),
(62, 232, 8, 'STA29031900006', '2019-03-29', '2019-04-01', 'BRG00019', 'Khimar Gotic RD', 43000, 1, 43000, 0, 43000, '1', NULL, 'pesan'),
(63, 135, 8, 'STA29031900007', '2019-03-29', '2019-04-01', 'BRG00009', 'Khimar Bella Tie', 48000, 1, 48000, 0, 48000, '1', NULL, 'pesan'),
(65, 161, 35, 'STA29031900008', '2019-03-29', '2019-04-01', 'BRG00011', 'Khimar El-nisha 2 Layer', 46000, 1, 46000, 0, 46000, '1', NULL, 'pesan'),
(66, 125, 35, 'STA29031900008', '2019-03-29', '2019-04-01', 'BRG00009', 'Khimar Bella Tie', 48000, 1, 48000, 0, 48000, '1', NULL, 'pesan'),
(67, 175, 22, 'STA29031900009', '2019-03-29', '2019-04-01', 'BRG00013', 'Al-Qia Salma', 25000, 1, 25000, 0, 25000, '1', NULL, 'pesan'),
(71, 106, 8, 'STA07041900010', '2019-04-07', '2019-04-10', 'BRG00008', 'Khimar Radea', 48000, 1, 48000, 0, 48000, '1', NULL, 'pesan'),
(78, 208, 8, 'STA10041900011', '2019-04-10', '2019-04-13', 'BRG00017', 'Sakira Haina', 30000, 1, 30000, 0, 30000, '1', NULL, 'pesan'),
(79, 194, 8, 'STA10041900012', '2019-04-10', '2019-04-13', 'BRG00015', 'Al-Qia Reva', 25000, 1, 25000, 0, 25000, '1', NULL, 'pesan'),
(80, 106, 8, 'STA13041900013', '2019-04-13', '2019-04-16', 'BRG00008', 'Khimar Radea', 48000, 1, 48000, 0, 48000, '1', NULL, 'pesan'),
(81, 225, 8, 'STA13041900014', '2019-04-13', '2019-04-16', 'BRG00019', 'Khimar Gotic RD', 43000, 1, 43000, 0, 43000, '1', NULL, 'pesan'),
(82, 96, 8, 'STA13041900015', '2019-04-13', '2019-04-16', 'BRG00007', 'Pastan Adella', 26000, 1, 26000, 0, 26000, '1', NULL, 'pesan'),
(83, 97, 8, 'STA13041900016', '2019-04-13', '2019-04-16', 'BRG00007', 'Pastan Adella', 26000, 1, 26000, 0, 26000, '1', NULL, 'pesan'),
(84, 166, 8, 'STA14041900017', '2019-04-14', '2019-04-17', 'BRG00012', 'Al-Qia Raya', 25000, 1, 25000, 0, 25000, '1', NULL, 'pesan');

--
-- Triggers `tb_details`
--
DELIMITER $$
CREATE TRIGGER `min_stok` AFTER UPDATE ON `tb_details` FOR EACH ROW update tb_barangs set stok=stok-new.jumlah where idbarang=new.idwarna
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategoris`
--

CREATE TABLE `tb_kategoris` (
  `id` int(11) NOT NULL,
  `kategori` varchar(100) DEFAULT NULL,
  `gambar` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kategoris`
--

INSERT INTO `tb_kategoris` (`id`, `kategori`, `gambar`) VALUES
(6, 'KHIMAR', '1552730154-photo_2018-09-25_05-14-38.png'),
(7, 'HIJAB INSTAN', '1552730292-photo_2018-09-30_06-14-41.png'),
(8, 'INNER', '1552730342-photo_2018-08-18_05-44-20.png'),
(9, 'PASTAN', '1553660732-pastan-kolong.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kodes`
--

CREATE TABLE `tb_kodes` (
  `id` int(11) NOT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `kode_barang` varchar(100) DEFAULT NULL,
  `barang` varchar(150) DEFAULT NULL,
  `harga_beli` int(11) DEFAULT NULL,
  `harga_barang` int(11) DEFAULT NULL,
  `deskripsi` mediumtext DEFAULT NULL,
  `diskon` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kodes`
--

INSERT INTO `tb_kodes` (`id`, `id_kategori`, `kode_barang`, `barang`, `harga_beli`, `harga_barang`, `deskripsi`, `diskon`) VALUES
(12, 6, 'BRG00001', 'Khimar Raisya Kombi', 37000, 42000, '<p><strong>Premium Quality</strong>, bahan Ceruty Baby Doll, mini pet.</p>', 0),
(14, 6, 'BRG00003', 'Khimar Trivia', 45000, 55000, '<p>Bahan Ceruty Baby Doll ,3 layer model oval softped</p>', 0),
(15, 6, 'BRG00004', 'Khimar Marsya', 32000, 37000, 'Bahan cerruti baby doll, model oval dengan inner unik dan cantik', 0),
(16, 7, 'BRG00005', 'Rumana Permata', 27000, 32000, '<p>Khimar model oval size Standart Bahan cerruti Baby Doll.</p>', 0),
(17, 6, 'BRG00006', 'Khimar Syafina', 48500, 52000, '<p>Khimar cantik dengan variasi kancing. Bahan cerruti baby doll. Ukuran besar dan syar\'i.</p>', 0),
(19, 6, 'BRG00007', 'Pastan Adella', 22000, 26000, '<p>Pastan simple dengan bahan buble crepe</p>', 0),
(20, 6, 'BRG00008', 'Khimar Radea', 43000, 48000, 'Khimar simple bahan cerruti baby doll', 0),
(21, 6, 'BRG00009', 'Khimar Bella Tie', 41500, 48000, 'Khimar model Rumbai dengan bahan Cerruti Baby Doll', 0),
(22, 6, 'BRG00010', 'Khimar Rafella', 34500, 40000, 'Khimar Simple dengan hiasan rempel ukuran sedang bahan cerruti', 0),
(23, 6, 'BRG00011', 'Khimar El-nisha 2 Layer', 39500, 46000, '<p>Khimar model oval 2 layer simple bahan cerruti baby doll</p>', 0),
(24, 7, 'BRG00012', 'Al-Qia Raya', 21000, 25000, 'Hijab Instan model rumbai ukuran standart bahan misbee', 0),
(25, 7, 'BRG00013', 'Al-Qia Salma', 21000, 25000, 'Hijab instan ukuran standart bahan misbee dengan variasi gotic depan dan mutiara', 0),
(26, 7, 'BRG00014', 'Al-Qia Adiba', 21000, 25000, 'Hijab Instan ukuran standart bahan misbee ', 0),
(27, 7, 'BRG00015', 'Al-Qia Reva', 21000, 25000, 'Hijab Instan ukuran standart bahan misbee ', 0),
(28, 7, 'BRG00016', 'Polka Pliskita', 22000, 26000, 'Hijab instan motif bahan buble crepe ukuran standart', 0),
(29, 7, 'BRG00017', 'Sakira Haina', 25000, 30000, '<p>Hijab instan bahan misbee exclusive lembut ukuran standart</p>', 0),
(30, 6, 'BRG00018', 'Khimar Arafah', 43500, 49000, 'Khimar Oval dengan variasi bordir cantik bahan cerruti super', 0),
(31, 6, 'BRG00019', 'Khimar Gotic RD', 38000, 43000, 'Khimar kekinian model pinguin dengan variasi gotic  bahan cerruti super', 0),
(32, 7, 'BRG00020', 'Miranda Combi', 22000, 26000, 'Hijab instan ukuran standart bahan buble crepe dengan kombinasi rempel', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_stokawals`
--

CREATE TABLE `tb_stokawals` (
  `id` int(11) NOT NULL,
  `idbarang` int(11) DEFAULT NULL,
  `idwarna` int(11) DEFAULT NULL,
  `kode_barang` varchar(100) DEFAULT NULL,
  `barang` varchar(100) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `tgl` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_tambahstoks`
--

CREATE TABLE `tb_tambahstoks` (
  `id` int(11) NOT NULL,
  `idwarna` int(11) DEFAULT NULL,
  `idadmin` int(11) DEFAULT NULL,
  `kode_barang` varchar(150) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `aksi` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_tambahstoks`
--

INSERT INTO `tb_tambahstoks` (`id`, `idwarna`, `idadmin`, `kode_barang`, `jumlah`, `total`, `tgl`, `keterangan`, `aksi`) VALUES
(53, 49, 19, 'BRG00003', 2, 90000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(54, 50, 19, 'BRG00003', 2, 90000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(55, 51, 19, 'BRG00003', 2, 90000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(56, 52, 19, 'BRG00003', 2, 90000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(57, 53, 19, 'BRG00003', 2, 90000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(58, 54, 19, 'BRG00003', 2, 90000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(59, 55, 19, 'BRG00003', 2, 90000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(60, 56, 19, 'BRG00003', 2, 90000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(61, 57, 19, 'BRG00004', 3, 96000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(62, 58, 19, 'BRG00004', 2, 64000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(63, 59, 19, 'BRG00004', 2, 64000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(64, 60, 19, 'BRG00004', 1, 32000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(65, 61, 19, 'BRG00004', 2, 64000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(66, 62, 19, 'BRG00004', 1, 32000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(67, 63, 19, 'BRG00004', 3, 96000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(68, 64, 19, 'BRG00004', 2, 64000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(69, 65, 19, 'BRG00004', 2, 64000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(70, 66, 19, 'BRG00004', 2, 64000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(71, 67, 19, 'BRG00005', 1, 27000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(72, 68, 19, 'BRG00005', 1, 27000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(73, 69, 19, 'BRG00005', 1, 27000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(74, 70, 19, 'BRG00005', 1, 27000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(75, 71, 19, 'BRG00005', 1, 27000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(76, 72, 19, 'BRG00005', 1, 27000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(77, 73, 19, 'BRG00005', 1, 27000, '2019-03-21', 'menambah pertama kali', 'tambah'),
(78, 74, 19, 'BRG00006', 2, 97000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(79, 75, 19, 'BRG00006', 1, 48500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(80, 76, 19, 'BRG00006', 1, 48500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(81, 77, 19, 'BRG00006', 1, 48500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(82, 78, 19, 'BRG00006', 2, 97000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(83, 79, 19, 'BRG00006', 2, 97000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(84, 80, 19, 'BRG00006', 1, 48500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(85, 81, 19, 'BRG00006', 1, 48500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(86, 82, 19, 'BRG00006', 1, 48500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(87, 83, 19, 'BRG00006', 1, 48500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(88, 84, 19, 'BRG00006', 1, 48500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(89, 85, 19, 'BRG00007', 2, 44000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(90, 86, 19, 'BRG00007', 2, 44000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(91, 87, 19, 'BRG00007', 2, 44000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(92, 88, 19, 'BRG00007', 2, 44000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(93, 89, 19, 'BRG00007', 1, 22000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(94, 90, 19, 'BRG00007', 2, 44000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(95, 91, 19, 'BRG00007', 2, 44000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(96, 92, 19, 'BRG00007', 2, 44000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(97, 93, 19, 'BRG00007', 2, 44000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(98, 94, 19, 'BRG00007', 2, 44000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(99, 95, 19, 'BRG00007', 2, 44000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(100, 96, 19, 'BRG00007', 2, 44000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(101, 97, 19, 'BRG00007', 2, 44000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(102, 98, 19, 'BRG00007', 2, 44000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(103, 99, 19, 'BRG00007', 1, 22000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(104, 100, 19, 'BRG00007', 2, 44000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(105, 101, 19, 'BRG00007', 2, 44000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(106, 102, 19, 'BRG00007', 2, 44000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(107, 103, 19, 'BRG00007', 2, 44000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(108, 104, 19, 'BRG00007', 2, 44000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(109, 105, 19, 'BRG00008', 2, 86000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(110, 106, 19, 'BRG00008', 3, 129000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(111, 107, 19, 'BRG00008', 2, 86000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(112, 108, 19, 'BRG00008', 3, 129000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(113, 109, 19, 'BRG00008', 1, 43000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(114, 110, 19, 'BRG00008', 1, 43000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(115, 111, 19, 'BRG00008', 1, 43000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(116, 112, 19, 'BRG00008', 2, 86000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(117, 113, 19, 'BRG00008', 1, 43000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(118, 114, 19, 'BRG00008', 1, 43000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(119, 115, 19, 'BRG00008', 1, 43000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(120, 116, 19, 'BRG00008', 1, 43000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(121, 117, 19, 'BRG00008', 1, 43000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(122, 118, 19, 'BRG00008', 4, 172000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(123, 119, 19, 'BRG00008', 2, 86000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(124, 120, 19, 'BRG00008', 1, 43000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(125, 121, 19, 'BRG00008', 2, 86000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(126, 122, 19, 'BRG00008', 1, 43000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(127, 123, 19, 'BRG00008', 1, 43000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(128, 124, 19, 'BRG00009', 1, 41500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(129, 125, 19, 'BRG00009', 1, 41500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(130, 126, 19, 'BRG00009', 1, 41500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(131, 127, 19, 'BRG00009', 2, 83000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(132, 128, 19, 'BRG00009', 2, 83000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(133, 129, 19, 'BRG00009', 4, 166000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(134, 130, 19, 'BRG00009', 1, 41500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(135, 131, 19, 'BRG00009', 1, 41500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(136, 132, 19, 'BRG00009', 1, 41500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(137, 133, 19, 'BRG00009', 2, 83000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(138, 134, 19, 'BRG00009', 2, 83000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(139, 135, 19, 'BRG00009', 1, 41500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(140, 136, 19, 'BRG00009', 2, 83000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(141, 137, 19, 'BRG00009', 1, 41500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(142, 138, 19, 'BRG00009', 1, 41500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(143, 139, 19, 'BRG00009', 1, 41500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(144, 140, 19, 'BRG00009', 1, 41500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(145, 141, 19, 'BRG00009', 1, 41500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(146, 142, 19, 'BRG00009', 1, 41500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(147, 143, 19, 'BRG00009', 1, 41500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(148, 144, 19, 'BRG00009', 1, 41500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(149, 145, 19, 'BRG00010', 3, 103500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(150, 146, 19, 'BRG00010', 2, 69000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(151, 147, 19, 'BRG00010', 2, 69000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(152, 148, 19, 'BRG00010', 3, 103500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(153, 149, 19, 'BRG00010', 3, 103500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(154, 150, 19, 'BRG00010', 3, 103500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(155, 151, 19, 'BRG00010', 2, 69000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(156, 152, 19, 'BRG00010', 3, 103500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(157, 153, 19, 'BRG00010', 2, 69000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(158, 154, 19, 'BRG00010', 2, 69000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(159, 155, 19, 'BRG00011', 1, 39500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(160, 156, 19, 'BRG00011', 1, 39500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(161, 157, 19, 'BRG00011', 1, 39500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(162, 158, 19, 'BRG00011', 1, 39500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(163, 159, 19, 'BRG00011', 1, 39500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(164, 160, 19, 'BRG00011', 1, 39500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(165, 161, 19, 'BRG00011', 1, 39500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(166, 162, 19, 'BRG00011', 1, 39500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(167, 163, 19, 'BRG00011', 1, 39500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(168, 164, 19, 'BRG00011', 1, 39500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(169, 165, 19, 'BRG00012', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(170, 166, 19, 'BRG00012', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(171, 167, 19, 'BRG00012', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(172, 168, 19, 'BRG00012', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(173, 169, 19, 'BRG00012', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(174, 170, 19, 'BRG00012', 2, 42000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(175, 171, 19, 'BRG00012', 2, 42000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(176, 172, 19, 'BRG00012', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(177, 173, 19, 'BRG00012', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(178, 174, 19, 'BRG00013', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(179, 175, 19, 'BRG00013', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(180, 176, 19, 'BRG00013', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(181, 177, 19, 'BRG00013', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(182, 178, 19, 'BRG00013', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(183, 179, 19, 'BRG00013', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(184, 180, 19, 'BRG00013', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(185, 181, 19, 'BRG00013', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(186, 182, 19, 'BRG00013', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(187, 183, 19, 'BRG00013', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(188, 184, 19, 'BRG00014', 2, 42000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(189, 185, 19, 'BRG00014', 2, 42000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(190, 186, 19, 'BRG00014', 2, 42000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(191, 187, 19, 'BRG00014', 2, 42000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(192, 188, 19, 'BRG00014', 2, 42000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(193, 189, 19, 'BRG00014', 3, 63000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(194, 190, 19, 'BRG00014', 2, 42000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(195, 191, 19, 'BRG00014', 2, 42000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(196, 192, 19, 'BRG00014', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(197, 193, 19, 'BRG00014', 2, 42000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(198, 194, 19, 'BRG00015', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(199, 195, 19, 'BRG00015', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(200, 196, 19, 'BRG00015', 2, 42000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(201, 197, 19, 'BRG00015', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(202, 198, 19, 'BRG00015', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(203, 199, 19, 'BRG00015', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(204, 200, 19, 'BRG00015', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(205, 201, 19, 'BRG00015', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(206, 202, 19, 'BRG00015', 1, 21000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(207, 203, 19, 'BRG00016', 4, 88000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(208, 204, 19, 'BRG00016', 2, 44000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(209, 205, 19, 'BRG00016', 2, 44000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(210, 206, 19, 'BRG00016', 5, 110000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(211, 207, 19, 'BRG00016', 3, 66000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(212, 208, 19, 'BRG00017', 1, 25000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(213, 209, 19, 'BRG00017', 1, 25000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(214, 210, 19, 'BRG00017', 1, 25000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(215, 211, 19, 'BRG00017', 1, 25000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(216, 212, 19, 'BRG00017', 1, 25000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(217, 213, 19, 'BRG00017', 1, 25000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(218, 214, 19, 'BRG00017', 1, 25000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(219, 215, 19, 'BRG00017', 1, 25000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(220, 216, 19, 'BRG00017', 1, 25000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(221, 217, 19, 'BRG00018', 5, 217500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(222, 218, 19, 'BRG00018', 5, 217500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(223, 219, 19, 'BRG00018', 2, 87000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(224, 220, 19, 'BRG00018', 2, 87000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(225, 221, 19, 'BRG00018', 5, 217500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(226, 222, 19, 'BRG00018', 4, 174000, '2019-03-27', 'menambah pertama kali', 'tambah'),
(227, 223, 19, 'BRG00018', 3, 130500, '2019-03-27', 'menambah pertama kali', 'tambah'),
(228, 224, 19, 'BRG00019', 1, 38000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(229, 225, 19, 'BRG00019', 1, 38000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(230, 226, 19, 'BRG00019', 1, 38000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(231, 227, 19, 'BRG00019', 1, 38000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(232, 228, 19, 'BRG00019', 1, 38000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(233, 229, 19, 'BRG00019', 1, 38000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(234, 230, 19, 'BRG00019', 1, 38000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(235, 231, 19, 'BRG00019', 2, 76000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(236, 232, 19, 'BRG00019', 1, 38000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(237, 233, 19, 'BRG00019', 1, 38000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(238, 234, 19, 'BRG00020', 3, 66000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(239, 235, 19, 'BRG00020', 3, 66000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(240, 236, 19, 'BRG00020', 1, 22000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(241, 237, 19, 'BRG00020', 3, 66000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(242, 238, 19, 'BRG00020', 2, 44000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(243, 239, 19, 'BRG00020', 4, 88000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(244, 240, 19, 'BRG00020', 3, 66000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(245, 241, 19, 'BRG00020', 1, 22000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(246, 242, 19, 'BRG00020', 4, 88000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(247, 243, 19, 'BRG00020', 1, 22000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(248, 244, 19, 'BRG00020', 2, 44000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(249, 245, 19, 'BRG00020', 2, 44000, '2019-03-28', 'menambah pertama kali', 'tambah'),
(250, 246, 19, 'BRG00020', 3, 66000, '2019-03-28', 'menambah pertama kali', 'tambah');

--
-- Triggers `tb_tambahstoks`
--
DELIMITER $$
CREATE TRIGGER `add_stok` AFTER INSERT ON `tb_tambahstoks` FOR EACH ROW update tb_barangs set stok=stok+new.jumlah where idbarang=new.idwarna
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksis`
--

CREATE TABLE `tb_transaksis` (
  `id` int(11) NOT NULL,
  `iduser` int(11) DEFAULT NULL,
  `faktur` varchar(300) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `status` enum('terkirim','dibaca','diterima','ditolak','sukses','batal') DEFAULT NULL,
  `alamat_tujuan` text DEFAULT NULL,
  `admin` varchar(100) DEFAULT NULL,
  `ongkir` int(11) DEFAULT 0,
  `total_akhir` int(11) DEFAULT NULL,
  `pembayaran` varchar(50) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `metode` enum('pesan','langsung') DEFAULT 'pesan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_transaksis`
--

INSERT INTO `tb_transaksis` (`id`, `iduser`, `faktur`, `tgl`, `total`, `status`, `alamat_tujuan`, `admin`, `ongkir`, `total_akhir`, `pembayaran`, `keterangan`, `metode`) VALUES
(29, 35, 'STA29031900002', '2019-03-29', 147000, 'terkirim', 'Nama : Muhibatul Masnunin Alamat : Bandar kidul gg 2 mojoroto 64114 Kota : kediri Provinsi: Jawa timur', NULL, 0, 147000, '1', NULL, 'langsung'),
(30, 9, 'STA29031900003', '2019-03-29', 49000, 'terkirim', 'Nama : Admin Luluk Alamat : Pasar Bandar no kios 155 Kec.Mojoroto 64114 Kota : Kediri Provinsi: Jawa timur', NULL, 0, 49000, '1', NULL, 'langsung'),
(31, 22, 'STA29031900004', '2019-03-29', 26000, 'terkirim', 'Nama : ratih perwita sari Alamat : dusun kedungrejo rt 2 rw 2, kec bringin 63285 Kota : ngawi Provinsi: jawa timur', NULL, 0, 26000, '1', NULL, 'langsung'),
(32, 21, 'STA29031900005', '2019-03-29', 52000, 'terkirim', 'Nama : Lilik Maghfiroh Alamat : Jl Kh Hasyim Asyari no.21-B Rt. 11 Rw. 02 Kel. Bandar kidul Kec. Mojoroto 64118 Kota : Kota Kediri Provinsi: Jawa Timur', NULL, 0, 52000, '1', NULL, 'langsung'),
(33, 8, 'STA29031900006', '2019-03-29', 83000, 'terkirim', 'Nama : Tri Wahyuni  Alamat : Jl. KH Wakhid Hasyim II/42 B Bandar Kidul Mojoroto  64118 Kota : Kediri  Provinsi: Jawa Timur', NULL, 0, 83000, '1', NULL, 'langsung'),
(34, 8, 'STA29031900007', '2019-03-29', 48000, 'terkirim', 'Nama : Tri Wahyuni  Alamat : Jl. KH Wakhid Hasyim II/42 B Bandar Kidul Mojoroto  64118 Kota : Kediri  Provinsi: Jawa Timur', NULL, 0, 48000, '1', NULL, 'langsung'),
(35, 35, 'STA29031900008', '2019-03-29', 94000, 'terkirim', 'Nama : Muhibatul Masnunin Alamat : Bandar kidul gg 2 mojoroto 64114 Kota : kediri Provinsi: Jawa timur', NULL, 0, 94000, '1', NULL, 'langsung'),
(36, 22, 'STA29031900009', '2019-03-29', 25000, 'terkirim', 'Nama : ratih perwita sari Alamat : dusun kedungrejo rt 2 rw 2, kec bringin 63285 Kota : ngawi Provinsi: jawa timur', NULL, 0, 25000, '1', NULL, 'langsung'),
(37, 8, 'STA07041900010', '2019-04-07', 48000, 'terkirim', 'Nama : Tri Wahyuni  Alamat : Jl. KH Wakhid Hasyim II/42 B Bandar Kidul Mojoroto  64118 Kota : Kediri  Provinsi: Jawa Timur', NULL, 0, 48000, '1', NULL, 'langsung'),
(44, 8, 'STA10041900011', '2019-04-10', 30000, 'terkirim', 'Nama : Tri Wahyuni  Alamat : Jl. KH Wakhid Hasyim II/42 B Bandar Kidul Mojoroto  64118 Kota : Kediri  Provinsi: Jawa Timur', NULL, 0, 30000, '1', NULL, 'langsung'),
(45, 8, 'STA10041900012', '2019-04-10', 25000, 'dibaca', 'Tri Wahyuni  Jl. KH Wakhid Hasyim II/42 B Bandar Kidul Mojoroto  64118\nKediri  Jawa Timur', NULL, 0, 25000, '1', NULL, 'pesan'),
(46, 8, 'STA13041900013', '2019-04-13', 48000, 'dibaca', 'Tri Wahyuni  Jl. KH Wakhid Hasyim II/42 B Bandar Kidul Mojoroto  64118\nKediri  Jawa Timur', NULL, 0, 48000, '1', NULL, 'pesan'),
(47, 8, 'STA13041900014', '2019-04-13', 43000, 'dibaca', 'Tri Wahyuni  Jl. KH Wakhid Hasyim II/42 B Bandar Kidul Mojoroto  64118\nKediri  Jawa Timur', NULL, 0, 43000, '1', NULL, 'pesan'),
(48, 8, 'STA13041900015', '2019-04-13', 26000, 'dibaca', 'Tri Wahyuni  Jl. KH Wakhid Hasyim II/42 B Bandar Kidul Mojoroto  64118\nKediri  Jawa Timur', NULL, 0, 26000, '1', NULL, 'pesan'),
(49, 8, 'STA13041900016', '2019-04-13', 26000, 'dibaca', 'Tri Wahyuni  Jl. KH Wakhid Hasyim II/42 B Bandar Kidul Mojoroto  64118\nKediri  Jawa Timur', NULL, 0, 26000, '1', NULL, 'pesan'),
(50, 8, 'STA14041900017', '2019-04-14', 25000, 'terkirim', 'Tri Wahyuni  Jl. KH Wakhid Hasyim II/42 B Bandar Kidul Mojoroto  64118\nKediri  Jawa Timur', NULL, 0, 25000, '1', NULL, 'pesan');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telp` varchar(45) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `kota` varchar(100) DEFAULT NULL,
  `provinsi` varchar(100) DEFAULT NULL,
  `kodepos` varchar(45) DEFAULT NULL,
  `ktp_gmb` varchar(100) DEFAULT NULL,
  `cancel` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`id`, `username`, `password`, `email`, `telp`, `nama`, `alamat`, `kota`, `provinsi`, `kodepos`, `ktp_gmb`, `cancel`) VALUES
(7, 'nurafifah', '$2y$10$HC3qbR2qNpnhP08yznZOquHUJ9BPQlrbYfpVcvraVzDNcLu5SElJS', 'sitii_nhuer@yahoo.com', '085736934828', 'nur afifah', 'dsn keniten rt 04 rw02 ds keniten', 'kediri', 'aceh', '64165', '1552729499-screenshot-(2).png', 0),
(8, 'unee79', '$2y$10$uFhZDNuhUJM4EbSHNxfeXO.9u3jiriVfMpb2LiWtwFeV66vsMOzOW', 'triwahyuni070179@gmail.com', '082231300279', 'Tri Wahyuni', 'Jl. KH Wakhid Hasyim II/42 B Bandar Kidul Mojoroto', 'Kediri', 'Jawa Timur', '64118', NULL, 0),
(9, 'adminluluk', '$2y$10$ziqmEA8jDajSLOfN9sZOyubu2DdsLGtUOXoK.lXTJzeozzaf3A/dC', 'dvinacollection@gmail.com', '082230384005', 'Admin Luluk', 'Pasar Bandar no kios 155 Kec.Mojoroto', 'Kediri', 'Jawa timur', '64114', NULL, 0),
(10, 'Hijabsiti/Siti rukanah', '$2y$10$F5jrq0Ugh3O4JoAGxYf8w.phgB4q92hyfytkQAsscO./NnkRzoJ8u', 'sitiali sayur.com.id', '085748743304', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(11, 'Christina Dewi Permata', '$2y$10$ZGvb78ZJzpSaIAAeRweXluhlByeQhgQnth5kxxTxrgNcE4CDrnu2u', 'sukses.christina@gmail.com', '085755755978', 'Christina Dewi Permata', 'Dsn. Kuncung RT. 024/RW. 009, Ds. Banyuarang,  Kec. Ngoro - Kab. Jombang', 'Jombang', 'Jawa Timur', '61473', NULL, 0),
(12, 'LIKA KRISMAYANI', '$2y$10$vtv2q3j8fKLxs8kWw0GnCeRmZIwzQV2NxJdqxV0FbOdLu/E4IU7x2', 'lika.krismayani89@gmail.com', '085784796663', 'LIKA KRISMAYANI MEI DASANTI', 'Ds.Tamanan', 'Kota Kediri', 'Jawa Timur', '64116', NULL, 0),
(13, 'MULTAZAM', '$2y$10$MHi/F9LVCXKte7npjXapZ.jlE4rKBsjjyZSqMHZIYXZu6SIRv38iS', 'umulcoiroh@yahoo.com', '0895378016878', 'UMMUL/ibu Mariyam', 'Tenggulunan rt.15/ rw.06', 'Sidoarjo', 'JAWA TIMUR', '61271', NULL, 0),
(14, 'laela mardiyah', '$2y$10$4i2GXwL0oK7B7xlHJl4lZ.NFo1QWPacOE0oZvKgGVubZxKGWLL6y.', 'laila17mardiah@gmail.com', '0811360313', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(15, 'Hernik', '$2y$10$rCOWoIVQP2.Hapx1Hr1tOOko0ywMSOLfNyEqIeSyAv2VV3/EWMJei', 'indahwildani2@gmail.com', '085785574299', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(16, 'enggar', '$2y$10$GkXSMqmcSCAWOTEf1oLiQufJDc1/O/gqT15VrNnL5uIr44oxYdkRy', 'enggarrozikin93@gmail.com', '085645745354', 'enggar weninging galih', 'bandar kidul gg 2 rt 03 rw 01 kec mojoroto', 'kediri kota', 'jawa timur', '64114', NULL, 0),
(17, 'zakiya', '$2y$10$mk6/wuOTGGuQx4ZJ3/AkcOFiH/WIiXZGWWO6BskFjBlKbdijHWXSu', 'zakiyaafifah83722@gmail.com', '08155611302', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(18, 'erika yunita', '$2y$10$CLvVPYLJ6NhyeMHL98CA8.O0sGfOEyqV8jMPOT8p2phJOtjJSRCYG', 'erikayunitasari59@yahoo.co.id', '085280753711', 'erika yunita', 'bujel gg tengah no 2 rt 4 rw 1', 'kota kediri', 'jawa timur', '64113', NULL, 0),
(19, 'uria rita', '$2y$10$npcC5S.ayHmc5lw7SKToa.KmaG6.Na14qtnDQgpkJTLNc3F1vZajK', 'uriarita89@gmail.com', '085855155051', 'uria rita', 'Bandar kidul gg 8 Rt04 rw06 no 54b', 'kediri', 'jawa timur', '64118', NULL, 0),
(20, 'ikafat1808', '$2y$10$EE5/Hh7zxEWjf6lO9C8BIezzFNVMKpB1.dfInQE.Hx8Ubl9wDR9jC', 'ikafat1808@gmail.com', '082131041442', 'ika fatmawati', 'dsn baran rt/rw : 003/004-besuk-gurah-kediri', 'kediri', 'jawa timur', '64181', NULL, 0),
(21, 'Lily_Kirana Collection', '$2y$10$WC1KgP5EaAoTUD.ylZLeYuqp8Nf/JG45iXJCC7vw657UQxrZoD33y', 'lily.mf89@gmail.com', '085655525089', 'Lilik Maghfiroh', 'Jl Kh Hasyim Asyari no.21-B Rt. 11 Rw. 02 Kel. Bandar kidul Kec. Mojoroto', 'Kota Kediri', 'Jawa Timur', '64118', NULL, 0),
(22, 'RATIH PERWITA SARI', '$2y$10$JQHJXkjnu7IPEyeOehv1hOYQIk2SSOdVBwl7XoTatpH7AvKeS01e.', 'aanbaga@gmail.com', '082232147618', 'ratih perwita sari', 'dusun kedungrejo rt 2 rw 2, kec bringin', 'ngawi', 'jawa timur', '63285', NULL, 0),
(23, 'CoCoM', '$2y$10$P.glxmhaBaDehz8Jauu8UeCm28zzvxzS4DTZFN2QWcUuEY61.iNxa', 'natadecocom88@gmail.com', '085649303317', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(24, 'sari', '$2y$10$xNGo4QKGjqe/5XhrNDeudOZRZNfWJZChXd4zpKpLR.h/.JxRZ1chm', 'sari06505@gmail.com', '081554939180', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(25, 'ambar', '$2y$10$fhZLyFpIlZXWJpBMgYspleDrDruzk99SYClyOuW5By8LW0RtDYKiW', 'ambarutami17@gmail.com', '082143148781', 'ambar utami', 'jl.melati gang 3 rt8 rw2 ( bu bambang ), kel.ngampel, kec.mojoroto', 'kota kediri', 'jawa timur', '64112', NULL, 0),
(26, 'adian rindi mariska', '$2y$10$ntlQ3xaivJV8SKYgjv1U1O3Uxs2flJ.5N2METpIPd9OjYiDWIE4gm', 'rindimariska@gmail.com', '082323328844', 'adian rindi mariska', 'pasar bandar lor gg 1a no 51', 'kota kediri', 'jawa timur', '64114', NULL, 0),
(27, 'ria kediri', '$2y$10$.eWSZmUriz/qiet7H/0R4.tJwE99F8hTYDvpSzjbD0iKE7CjCK6u2', 'betaria.ria@gmail.com', '085259049922', 'beta naharia', 'jalan imam bonjol nomor 148 kota kediri', 'kediri kota', 'jawatimur', '64122', NULL, 0),
(28, 'laela', '$2y$10$93/9GQzc8C1gRrdwuK/buu2DFBl87JJaKi0Cfr7Y.OhrhxMWXb5Ri', 'laelamardiyah@mail.com', '085331220050', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(29, 'adminkiky', '$2y$10$0NyRqMnibvLI7BLDLtHNvOSM3B/0YzqiHkk.E5B5kMo9VRqKyAFdq', 'dvina070179@gmail.com', '081333881979', 'admin kiky', 'pasar bandar no kios 155 kec.mojoroto', 'kediri', 'jawa timur', '64114', NULL, 0),
(30, 'Lilik', '$2y$10$3VrQujT5Uprlya62yFBI/OLVEBw7xV/g/ujHa4l8DeI8N4oMypfkK', 'arjunalion66@gmail.com', '081515786828', 'Lilik Kiptiyah', 'Jln. Dewi starting rt. 02/rw. 01 Dsn. Padangan tengah Ds. padangan Kec. Kayen kidul_Kediri', 'Kediri', 'Java timur', '64183', NULL, 0),
(31, 'ella', '$2y$10$Uo92L8u4ysIhSsb/Sa0LIu2K5oZuQEawAfega4OZlIpogbIUhaD.O', 'ella82@mail.com', '082333133354', 'laela mardiyah', 'bandar kidul 2/22 rt 03 rw 01', 'kota kediri', 'jawa timur', '64118', NULL, 0),
(32, 'puji', '$2y$10$m0ravZNoX5GxsXoPXujwI.HMDJUU1ey.peJkWAF5d.6ot.kHRj3LO', 'pujirahayu338587@gmail.com', '085755314106', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(33, 'Leni Tri Wahyuni', '$2y$10$41wH8mEt20xSZXyEC8WLVO76LyVtdmMRvFdMZrk64qeKyd4jAsqL2', 'rakalestiyo2009@gmail.com', '082156389152', 'LENI TRI WAHYUNI', 'DSN.SIDOMULYO DS.SIDOMULYO RT:07 RW:01 KEC.WATES', 'KEDIRI', 'JAWA TIMUR', '64174', NULL, 0),
(34, 'ilyaskhil colection', '$2y$10$Ew4gFtbkdYBsNMqpr7R2IeG8OsWU0yogusxUukBrt/1f/pbV3Obcm', 'anikk354@gmail.com', '085647040706', 'anik wahyuni/ilyaskhil colection', 'bandar lor gg 1d no 27 mojoroto', 'kediri', 'jawa timur', '64113', NULL, 0),
(35, 'Nunin', '$2y$10$fQaGKekch5ZZE8eHWVEdp.RZZlrFXmlGVHrXz4FfsEAN.3epmYN8u', 'nuninbluerose@gmail.com', '085850970303', 'Muhibatul Masnunin', 'Bandar kidul gg 2 mojoroto', 'kediri', 'Jawa timur', '64114', NULL, 0),
(36, 'harti', '$2y$10$T0c3B5b8kzeSotyQBGySY.2eWTzu86AK9WvFFUFIaZ6.THHnsJxnS', 'shila', '081336588183', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(37, 'kholisprima', '$2y$10$jZUdqhaYyINA796a4G2eVuGCHm57PdSGdjz4o/guJOx99Ez1DPXSi', 'choliez.prima@gmail.com', '081217270837', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(38, 'Alaina Sari Arifin', '$2y$10$Riqi1ixq2R6EyNjVszJh5O4Cl5dJ2.uXhF2UzzKB5NG4ALFDSrysu', 'lenscollection369@gmail.com', '085790744063', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(39, 'rizki oktafiani', '$2y$10$br./QDR9ItBv9/1FW4AusOPbeCgfSBVGe5Vn4RrTYWf1HPr5w49Wm', 'akhdan87', '085820391875', 'rizki oktafiani', 'jln puntir dsn pakem rt/rw: 02/15', 'kec  martopuro kota purwosari kab pasuruan', 'jawa timur', '67153', NULL, 0),
(40, 'yuliani', '$2y$10$1GExTZ9FCS2AFRBPzpeoY.s98BV3yDfKPn7kl.1rMDjf20rAEX0ve', 'jhosuaoutnimai@gmail.com', '085704773331', 'yuliani', 'dsn. teleng rt01/rw11 ds. kampungbaru tanjunganom nganjuk', 'nganjuk', 'jawa timur', '64483', NULL, 0),
(41, 'Apip Roidatul Aminin', '$2y$10$niEJVj2Mu0OQjyNGoQqX3eDKCTXTJKO3WBpZSe8o/w6RFo0THU5AW', 'www.usaid@yahoo.com', '082234436892', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(42, 'lia bence', '$2y$10$Rbj1Ln/cYrkHW6/TfknRc.tSLADEElGfacvoEwU90GDt/mkOH4VXe', 'liafrentiana@gamail.com', '085749134169', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(43, 'Dwi Lilis Tiana', '$2y$10$7NFRNPkDhSkzGJiJRrdbquEJDdxwuQZS58386rxXQOCp19mgLoCnq', 'Dwililistiana@gmail.com', '082232403602', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(44, 'srianah', '$2y$10$ebe2XHQE6AYbkdHjbSl2tOrmwKFBz.IQ.07T3qMjatOqWmwJFcvny', '@gmail.com', '085736813464', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(45, 'Linda Amrillah', '$2y$10$cq0QNlFLNYBxry16fzwbjOqzFkGtzEJ469hF8vbXxP489gEcnb4wC', 'amrillaharifin@gmail.com', '081555382121', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(46, 'riska', '$2y$10$EIjl2Q8KEIPGpgCCBiREaeEJ2VmCONCPj9bCJNQowasUmw.7/VV2S', 'trisnaquinby@yahoo.com', '085784157889', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(47, 'via', '$2y$10$TC3WkuxKGqhvtk4eAGCfeOmRFNIyMQ.xRy8oVph/RwVR/19.Nznpy', 'ririnviadana@gmail.com', '081331258696', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(48, 'Fifin Rochmawati', '$2y$10$ecxMgJUw7EvI8tS6owAkx.P8Q2m8YvbLOvSvGDDep2grhZGmaJYhG', 'frochmawati@gmail.com', '085853293256', 'Fifin Rochmawati', 'Griya Lirboyo Harmoni A4 kec. mojoroto', 'Kediri', 'Jawa Timur', '64117', NULL, 0),
(49, 'luluk muzayyanah', '$2y$10$6SNKVvJloybNfqp82QJm.Ok2NEUIHdMORYgxtiAIt2fODbJLmhJSq', 'azulmumtazuljos@gmail.com', '085755044627', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(50, 'eka rini', '$2y$10$.rKEHvwyZWFILp38MCNXq.l8zCdZGAMYEcb8jpghlpXEY/e00nal6', 'ekarini9b.07@gmail.com', '085735686613', 'eka rini', 'ds. paron', 'kediri', 'jawa timur', '64181', NULL, 0),
(51, 'Dista Eka', '$2y$10$HTDOZAdiMCJhSnNK0HpTGuUbY45FYrc8VKKDu9T1TFP17OGoOUTmy', 'distaekaerlinawati@gmail.com', '085736796340', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(52, 'ayu sadira', '$2y$10$LnqF7WXIFaclXErs8YlsCevJ5pDMfsi7PHc6fK38vVrNh7wGGQTFa', '@gmail.ayutaek', '085736281811', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(53, 'silvi aulia', '$2y$10$/UeJfieycoTv9SPdVoPCAOEkJzk1YljddAoHGl.DpILhxbi3f9iBu', 'sleepylatte@live.com', '081234271259', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(54, 'levina', '$2y$10$B80oY.K6hbArswkG5gQsp.t6lygeCg7ev8swBnZixX/2MUZSabqHq', 'levina795@gmail.com', '085736415487', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(55, 'Anis azizah', '$2y$10$PcNVIkwp0PWl6p07cj7W0.ve8SSBUGOX30Zca5yiOQ7SSQcVdPwr6', 'aniesazizah44@g.mail.com', '085649287033', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(56, 'Anies azizah', '$2y$10$PoBpex5ma87PpnYIeSlUw.10GW9IezJ5SjWp9S88wD3cnGIk6gWTm', 'anieaisyah44@g.mail.com', '082139436507', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(57, 'Imala', '$2y$10$DGG4AF4u9ItMj0QouUmYg.elY.UtVTxoZZtF7woeiRpppBCecMB12', 'imala_ima@yahoo.com', '085645898151', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(58, 'imalukmawati', '$2y$10$bAZ4Y0XLqpKZ3WlEedDLCumTo0cFSjvptKVZY7MHFGxHihJKUTMZa', 'imaelvinocta@yahoo.com', '085748908250', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(59, 'Anif Shella', '$2y$10$sKGPOvK0sq1J9ViCiJlTceliqJ6jw4V2QftTWyJK34NU1fc80kkbu', 'aniphida@gmail.com', '085648863544', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(60, 'arum cahya', '$2y$10$ZxbAtvTHoKI7ueprKWBN9O7XJKd8kLOOv0Cqai5LQKs.PxiGGrYOC', 'arumcahyawatu16@gmail.com', '082174515172', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(61, 'febri ria pawes triana', '$2y$10$CJXtzGWoAR0rLVv3cC39Tux2du2aADR9Tv3HhxSPZRfLiTi6VIWcK', 'callula.joy@gmail.com', '081554387705', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(62, 'Bunda Atik Mustika', '$2y$10$y1JaileYfe.AKKZxwZIeEewsKq0m0gDk7Ipy7Xa9n0pE46v2eH5uy', 'Atikpuspita09@gmail.com', '0857777777761', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(63, 'RINA KRISNA', '$2y$10$W2WXv3QMGdoHU3V/Xjzs4ejZwUPfAiBDcmc4LJs29mkYjf532TxSm', 'rinakrisna63@gmail.com', '085755536060', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(64, 'Diana N', '$2y$10$Pgv0ElQOboDpsHtURObZ8udzuV8yvH25WXbVaRPI5MdR5aVq73aLW', 'diananugrahani75@gmail.com', '081331246394', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(65, 'nice', '$2y$10$etMrGtC6mlWoiHGFMVk3X.4QlaEzxSlVz2p5Ho3ML2aJ7T4kfAaOm', 'nicemawati5@gmail.com', '08124919467', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(66, 'Dhenok', '$2y$10$E1aFD.GfBZte1k9q3JQ/Y.hLM7xC8/8WAJV0lDUglhYm0DkFiKDFe', 'ayukoned@gmail.com', '085258665481', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(67, 'Manda', '$2y$10$bAEVQKvWq.2soBR25fctOeWzRthj.XnBDa2fNd0DVz1llFg3ExQmC', 'yuni201987@gmail.com', '085298387055', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(68, 'lala', '$2y$10$tPld0jG0QrftueKVrGE6B.4epQPYu/OiBQW0xVqGssgAeZjpqiyNy', 'lailatulsiti29@gmail.com', '085604986105', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(69, 'ismirosidah', '$2y$10$K9gGwymt5I/UHTcHKmiXBuiiknzK8gpup5GbkyI8TUH1dusjuZ4im', 'ismirosidah@gmail.com', '082232687080', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(70, 'umy kulsum', '$2y$10$fCJwy5J.Ytow3FRz6KQ40.nnF6eogkCw7PtQBRv3VIyPR6CPW8mhO', 'tomt72438@gmail.com', '085655898153', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(71, '@munaosk', '$2y$10$aHsTJE/RVW3G9IwpFG7OXOVc./4Lr9U.LEwQEBladpui/T32fpvre', 'munafaza07@gmail.com', '085646473799', NULL, NULL, NULL, NULL, NULL, NULL, 0),
(72, 'ira', '$2y$10$nZ.jsN6wkY4C6xBZDYqgfeOs.16c08sqZWgo8MUT1sf9tPKdykg7W', 'anakmbarep999@gmail.com', '087432463266', 'Ira Oktaviani', 'jln Mbah Abang', 'Kediri', 'Jawa Timur', '62344', NULL, 0),
(73, 'Risma', '$2y$10$kQ0C/RAEFuZEMYryk1DacurtNYn0TWdzWYJ5gp3OZ2nAWiS7EiZo6', '.', '085648881380', NULL, NULL, NULL, NULL, NULL, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_cancel`
--
ALTER TABLE `detail_cancel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gambar`
--
ALTER TABLE `gambar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keranjang_cancel`
--
ALTER TABLE `keranjang_cancel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_cancel`
--
ALTER TABLE `log_cancel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `omset`
--
ALTER TABLE `omset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`idsettings`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_bank`
--
ALTER TABLE `tb_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_barangs`
--
ALTER TABLE `tb_barangs`
  ADD PRIMARY KEY (`idbarang`);

--
-- Indexes for table `tb_details`
--
ALTER TABLE `tb_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_kategoris`
--
ALTER TABLE `tb_kategoris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_kodes`
--
ALTER TABLE `tb_kodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_stokawals`
--
ALTER TABLE `tb_stokawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_tambahstoks`
--
ALTER TABLE `tb_tambahstoks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_transaksis`
--
ALTER TABLE `tb_transaksis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `detail_cancel`
--
ALTER TABLE `detail_cancel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `gambar`
--
ALTER TABLE `gambar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `keranjang_cancel`
--
ALTER TABLE `keranjang_cancel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `log_cancel`
--
ALTER TABLE `log_cancel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `omset`
--
ALTER TABLE `omset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `idsettings` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_bank`
--
ALTER TABLE `tb_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_barangs`
--
ALTER TABLE `tb_barangs`
  MODIFY `idbarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `tb_details`
--
ALTER TABLE `tb_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `tb_kategoris`
--
ALTER TABLE `tb_kategoris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_kodes`
--
ALTER TABLE `tb_kodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tb_stokawals`
--
ALTER TABLE `tb_stokawals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_tambahstoks`
--
ALTER TABLE `tb_tambahstoks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `tb_transaksis`
--
ALTER TABLE `tb_transaksis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
