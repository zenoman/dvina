-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2018 at 11:31 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

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

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(80) DEFAULT NULL,
  `password` text,
  `nama` varchar(100) DEFAULT NULL,
  `telp` varchar(25) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `level` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `nama`, `telp`, `email`, `level`) VALUES
(2, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '085604556715', 'satriosuklun@gmail.com', 'admin'),
(3, 'superadmin', '827ccb0eea8a706c4c34a16891f84e7b', 'super admin', '085682374023', 'satriosuklun@gmail.com', 'super_admin'),
(4, 'devasatrio', '74b213f68f648006a318f52713450f27', 'deva satrio', '085604556714', 'satriosuklun@gmail.com', 'programer');

-- --------------------------------------------------------

--
-- Table structure for table `gambar`
--

CREATE TABLE `gambar` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(30) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `idroles` int(11) NOT NULL,
  `akses` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `meta` text,
  `logo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`idsettings`, `webName`, `kontak1`, `kontak2`, `kontak3`, `email`, `ico`, `meta`, `logo`) VALUES
(1, 'nama webnya 12', '123451112', '123451112', '123451112', 'devatamvan@gmail.com', '1539867788-pencil-icon.png', 'ini metanya 12', '1539867788-icons8_flat_ruler.svg.png');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barangouts`
--

CREATE TABLE `tb_barangouts` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(100) DEFAULT NULL,
  `barang` varchar(100) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `tgl` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_barangs`
--

CREATE TABLE `tb_barangs` (
  `idbarang` int(11) NOT NULL,
  `idkategori` int(11) DEFAULT NULL,
  `kode` varchar(100) DEFAULT NULL,
  `barang` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `diskon` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `warna` varchar(45) DEFAULT NULL,
  `kategori` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barangs`
--

INSERT INTO `tb_barangs` (`idbarang`, `idkategori`, `kode`, `barang`, `harga`, `diskon`, `stok`, `warna`, `kategori`) VALUES
(20, 4, 'BRG00001', 'kerudung ok', 12000, 1000, 5, 'merah', 'kategori 3'),
(21, 4, 'BRG00001', 'kerudung ok', 12000, 1000, 10, 'biru', 'kategori 3'),
(22, 5, 'BRG00002', 'kerudung baru', 15000, 5000, 10, 'biru', 'kategori 5'),
(23, 5, 'BRG00002', 'kerudung baru', 18000, 1500, 9, 'biru putih', 'kategori 6'),
(24, 4, 'BRG00003', 'kerudung korea', 20000, 2500, 20, 'putih', 'kategori 3'),
(25, 4, 'BRG00003', 'kerudung korea', 22000, 0, 11, 'abu abu', 'kategori 3');

-- --------------------------------------------------------

--
-- Table structure for table `tb_details`
--

CREATE TABLE `tb_details` (
  `id` int(11) NOT NULL,
  `faktur` varchar(100) DEFAULT NULL,
  `tgl` varchar(100) DEFAULT NULL,
  `kode_barang` varchar(100) DEFAULT NULL,
  `barang` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total_a` int(11) DEFAULT NULL,
  `diskon` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `admin` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_details`
--

INSERT INTO `tb_details` (`id`, `faktur`, `tgl`, `kode_barang`, `barang`, `harga`, `jumlah`, `total_a`, `diskon`, `total`, `admin`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 'admin');

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
(4, 'kategori 3', '1538008083-dd.PNG'),
(5, 'kategori 2', '1539923152-wreanch.png');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kodes`
--

CREATE TABLE `tb_kodes` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(100) DEFAULT NULL,
  `barang` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kodes`
--

INSERT INTO `tb_kodes` (`id`, `kode_barang`, `barang`) VALUES
(6, 'BRG00001', 'kerudung ok'),
(7, 'BRG00002', 'kerudung baru'),
(8, 'BRG00003', 'kerudung korea');

-- --------------------------------------------------------

--
-- Table structure for table `tb_stokawals`
--

CREATE TABLE `tb_stokawals` (
  `id` int(11) NOT NULL,
  `idbarang` int(11) DEFAULT NULL,
  `kode_barang` varchar(100) DEFAULT NULL,
  `barang` varchar(100) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `tgl` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_stokawals`
--

INSERT INTO `tb_stokawals` (`id`, `idbarang`, `kode_barang`, `barang`, `jumlah`, `tgl`) VALUES
(1, 20, 'BRG00001', 'kerudung ok', 5, '22-10-2018'),
(2, 21, 'BRG00001', 'kerudung ok', 10, '22-10-2018'),
(3, 22, 'BRG00002', 'kerudung baru', 10, '22-10-2018'),
(4, 23, 'BRG00002', 'kerudung baru', 9, '22-10-2018'),
(5, 24, 'BRG00003', 'kerudung korea', 20, '22-10-2018'),
(6, 25, 'BRG00003', 'kerudung korea', 11, '22-10-2018');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tambahstoks`
--

CREATE TABLE `tb_tambahstoks` (
  `id` int(11) NOT NULL,
  `idbarang` int(11) DEFAULT NULL,
  `barang` varchar(100) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `tgl` varchar(100) DEFAULT NULL,
  `admin` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_tambahstoks`
--

INSERT INTO `tb_tambahstoks` (`id`, `idbarang`, `barang`, `jumlah`, `total`, `tgl`, `admin`) VALUES
(1, 5, 'kerudung ok', 5, 125000, '05-10-18', NULL),
(2, 5, 'kerudung ok', 5, 125000, '0606-1010-18181818', NULL),
(3, 6, 'kerudung ok', 5, 125000, '06-10-2018', NULL),
(4, 3, 'kerudung cantik', 5, 1000015, '18-10-2018', NULL),
(5, 1, 'kerudung cantik', 6, 1200018, '18-10-2018', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksis`
--

CREATE TABLE `tb_transaksis` (
  `id` int(11) NOT NULL,
  `faktur` varchar(100) DEFAULT NULL,
  `tgl` varchar(100) DEFAULT NULL,
  `total_a` int(11) DEFAULT NULL,
  `diskon` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `admin` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` text,
  `email` varchar(100) DEFAULT NULL,
  `telp` varchar(45) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` text,
  `kota` varchar(100) DEFAULT NULL,
  `provinsi` varchar(100) DEFAULT NULL,
  `kodepos` varchar(45) DEFAULT NULL,
  `ktp_gmb` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`id`, `username`, `password`, `email`, `telp`, `nama`, `alamat`, `kota`, `provinsi`, `kodepos`, `ktp_gmb`) VALUES
(5, 'devasatrio', 'd7676543', 'satriodamara1@gmail.com', '098590283490', 'deva satrio damara', 'gurah kediri', 'kediri', 'yogyakarta', '04759839', '1539862037-joy-full-team.png'),
(6, 'superadmin', '827ccb0eea8a706c4c34a16891f84e7b', 'satriodamara1@gmail.com', '304958903458', 'satrio damara', 'sdfsdf', 'sdfgsdfg', 'banten', '356456', ''),
(7, 'heruadi', '827ccb0eea8a706c4c34a16891f84e7b', 'satriodamara1@gmail.com', '0987892345892', 'heru adi', 'gurah kediri', 'kedir', 'NTB', '0909', '1540102983-konco-dewe-logo.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gambar`
--
ALTER TABLE `gambar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idroles`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`idsettings`);

--
-- Indexes for table `tb_barangouts`
--
ALTER TABLE `tb_barangouts`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gambar`
--
ALTER TABLE `gambar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `idsettings` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_barangouts`
--
ALTER TABLE `tb_barangouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_barangs`
--
ALTER TABLE `tb_barangs`
  MODIFY `idbarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tb_details`
--
ALTER TABLE `tb_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_kategoris`
--
ALTER TABLE `tb_kategoris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_kodes`
--
ALTER TABLE `tb_kodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_stokawals`
--
ALTER TABLE `tb_stokawals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_tambahstoks`
--
ALTER TABLE `tb_tambahstoks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_transaksis`
--
ALTER TABLE `tb_transaksis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
