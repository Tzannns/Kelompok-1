-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 18, 2024 at 06:01 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_produksi`
--

-- --------------------------------------------------------

--
-- Table structure for table `bahan_baku`
--

CREATE TABLE `bahan_baku` (
  `id_bahan` int NOT NULL,
  `id_supplier` int DEFAULT NULL,
  `tanggal_barang_datang` date NOT NULL,
  `kode_bahan` varchar(50) NOT NULL,
  `nama_bahan` varchar(100) NOT NULL,
  `jenis_bahan` varchar(50) DEFAULT NULL,
  `jumlah_bahan` int NOT NULL,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bahan_baku`
--

INSERT INTO `bahan_baku` (`id_bahan`, `id_supplier`, `tanggal_barang_datang`, `kode_bahan`, `nama_bahan`, `jenis_bahan`, `jumlah_bahan`, `keterangan`) VALUES
(1, 1, '2024-12-21', 'BAH001', 'Kain Katun', 'Tekstil', 500, 'Kualitas premium'),
(2, 2, '2024-12-23', 'BAH002', 'Benang', 'Tekstil', 300, 'Stok baru');

-- --------------------------------------------------------

--
-- Table structure for table `hasil_produksi`
--

CREATE TABLE `hasil_produksi` (
  `id_hasil` int NOT NULL,
  `tanggal_produksi` date NOT NULL,
  `kode_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `qty` int NOT NULL,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hasil_produksi`
--

INSERT INTO `hasil_produksi` (`id_hasil`, `tanggal_produksi`, `kode_barang`, `nama_barang`, `kategori`, `qty`, `keterangan`) VALUES
(1, '2024-12-20', 'BRG001', 'Kaos Polos', 'Pakaian', 100, 'Produksi pertama'),
(2, '2024-12-21', 'BRG002', 'Jaket Hoodie', 'Pakaian', 50, 'Stok terbatas');

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_produksi`
--

CREATE TABLE `permintaan_produksi` (
  `id_permintaan` int NOT NULL,
  `kode_bahan` varchar(50) NOT NULL,
  `nama_bahan` varchar(100) NOT NULL,
  `jenis_bahan` varchar(50) DEFAULT NULL,
  `jumlah_bahan` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `permintaan_produksi`
--

INSERT INTO `permintaan_produksi` (`id_permintaan`, `kode_bahan`, `nama_bahan`, `jenis_bahan`, `jumlah_bahan`) VALUES
(1, 'BAH001', 'Kain Katun', 'Tekstil', 200),
(2, 'BAH002', 'Benang', 'Tekstil', 150);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `kode_supplier` varchar(50) NOT NULL,
  `nama_supplier` varchar(100) NOT NULL,
  `alamat` text,
  `telepon` varchar(20) DEFAULT NULL,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `tanggal_masuk`, `kode_supplier`, `nama_supplier`, `alamat`, `telepon`, `keterangan`) VALUES
(1, '2024-12-20', 'SUP001', 'PT. Abadi Jaya', 'Jakarta Selatan', '08123456789', 'Supplier tetap'),
(2, '2024-12-22', 'SUP002', 'CV. Sukses Makmur', 'Bandung Barat', '08198765432', 'Baru bergabung');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`) VALUES
(1, 'admin', '123456'),
(2, 'staff', 'password123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bahan_baku`
--
ALTER TABLE `bahan_baku`
  ADD PRIMARY KEY (`id_bahan`),
  ADD UNIQUE KEY `kode_bahan` (`kode_bahan`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `hasil_produksi`
--
ALTER TABLE `hasil_produksi`
  ADD PRIMARY KEY (`id_hasil`),
  ADD UNIQUE KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `permintaan_produksi`
--
ALTER TABLE `permintaan_produksi`
  ADD PRIMARY KEY (`id_permintaan`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`),
  ADD UNIQUE KEY `kode_supplier` (`kode_supplier`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bahan_baku`
--
ALTER TABLE `bahan_baku`
  MODIFY `id_bahan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hasil_produksi`
--
ALTER TABLE `hasil_produksi`
  MODIFY `id_hasil` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permintaan_produksi`
--
ALTER TABLE `permintaan_produksi`
  MODIFY `id_permintaan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bahan_baku`
--
ALTER TABLE `bahan_baku`
  ADD CONSTRAINT `bahan_baku_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
