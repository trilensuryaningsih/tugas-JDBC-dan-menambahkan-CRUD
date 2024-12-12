-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2024 at 08:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_supermarket`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kode_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `harga_barang` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode_barang`, `nama_barang`, `harga_barang`) VALUES
('k-001', 'pensil', 4000),
('k-002', 'penghapus', 4000),
('k-003', 'penggaris', 6000),
('k-004', 'lem', 10000),
('k-005', 'baju', 50000),
('k-006', 'kaos kaki', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` bigint(20) NOT NULL,
  `nama_pelanggan` varchar(30) NOT NULL,
  `no_hp_pelanggan` varchar(20) NOT NULL,
  `alamat_pelanggan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `no_hp_pelanggan`, `alamat_pelanggan`) VALUES
(3, 'ningsih', '08653527533', 'jalan moh hatta'),
(4, 'rahma', '086427643265', 'jalan kuranji'),
(5, 'pera', '086325334', 'jalan limau manis');

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `no_faktur` varchar(20) NOT NULL,
  `nama_pelanggan` varchar(30) NOT NULL,
  `no_hp_pelanggan` varchar(20) NOT NULL,
  `alamat_pelanggan` varchar(50) NOT NULL,
  `kode_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `harga_barang` int(50) NOT NULL,
  `jumlah_beli` int(50) NOT NULL,
  `total_bayar` int(50) NOT NULL,
  `kasir` varchar(30) NOT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`no_faktur`, `nama_pelanggan`, `no_hp_pelanggan`, `alamat_pelanggan`, `kode_barang`, `nama_barang`, `harga_barang`, `jumlah_beli`, `total_bayar`, `kasir`, `tanggal`) VALUES
('f-001', 'ningsih', '08653527533', 'jalan moh hatta', 'k-002', 'penghapus', 4000, 3, 12000, 'trilen', '2024-12-12 09:46:54'),
('f-002', 'rahma', '086427643265', 'jalan kuranji', 'k-005', 'baju', 50000, 2, 100000, 'trilen', '2024-12-12 09:50:02'),
('f-003', 'pera', '086325334', 'jalan limau manis', 'k-006', 'kaos kaki', 10000, 4, 40000, 'trilen', '2024-12-12 09:51:17');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `no_faktur` int(20) NOT NULL,
  `nama_pelanggan` varchar(30) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `alamat_pelanggan` varchar(50) NOT NULL,
  `kode barang` int(20) NOT NULL,
  `nama barang` varchar(30) NOT NULL,
  `harga barang` int(30) NOT NULL,
  `jumlah_beli` int(50) NOT NULL,
  `total_bayar` int(50) NOT NULL,
  `kasir` varchar(30) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
