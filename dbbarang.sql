-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2020 at 02:27 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbbarang`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_brg` varchar(255) NOT NULL,
  `nama_brg` char(255) NOT NULL,
  `harga_brg` int(15) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `stok_brg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_brg`, `nama_brg`, `harga_brg`, `tgl_masuk`, `stok_brg`) VALUES
('1', 'Gula', 2000, '2019-12-11', 160),
('2', 'Roti', 2000, '2018-12-03', 5),
('3', 'Minyak Goreng', 30000, '2019-12-12', 45),
('4', 'Masako', 10000, '2019-12-12', 5),
('5', 'Tolak Angin', 30000, '2019-12-12', 15),
('6', 'Antangin', 40000, '2019-01-01', 10),
('7', 'Aqua', 20000, '2019-01-01', 80),
('8', 'Sosro', 20000, '2019-01-01', 3000),
('9', 'Tea Jus', 2000, '2020-01-01', 40);

-- --------------------------------------------------------

--
-- Table structure for table `barangkeluar`
--

CREATE TABLE `barangkeluar` (
  `id_brg` varchar(255) NOT NULL,
  `nama_barang` char(255) NOT NULL,
  `harga_barang` int(15) NOT NULL,
  `tgl_keluar` date NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barangkeluar`
--

INSERT INTO `barangkeluar` (`id_brg`, `nama_barang`, `harga_barang`, `tgl_keluar`, `stok`) VALUES
('3', 'Minyak Goreng', 30000, '2020-01-14', 10);

--
-- Triggers `barangkeluar`
--
DELIMITER $$
CREATE TRIGGER `Pengurangan Stok` AFTER INSERT ON `barangkeluar` FOR EACH ROW BEGIN
	UPDATE barang SET stok_brg = stok_brg - new.stok
    WHERE id_brg = new.id_brg;
  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `password` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`password`) VALUES
('12345678');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `barangkeluar`
--
ALTER TABLE `barangkeluar`
  ADD KEY `id_brg` (`id_brg`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barangkeluar`
--
ALTER TABLE `barangkeluar`
  ADD CONSTRAINT `barangkeluar_ibfk_1` FOREIGN KEY (`id_brg`) REFERENCES `barang` (`id_brg`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
