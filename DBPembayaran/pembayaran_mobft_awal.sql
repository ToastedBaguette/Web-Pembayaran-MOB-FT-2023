-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2023 at 10:21 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pembayaran_mobft`
--

-- --------------------------------------------------------

--
-- Table structure for table `batchs`
--

CREATE TABLE `batchs` (
  `id` int(11) NOT NULL,
  `jam` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `batchs`
--

INSERT INTO `batchs` (`id`, `jam`) VALUES
(0, '0'),
(1, '08.00-10.00'),
(2, '10.00-12.00'),
(3, '13.00-15.00'),
(4, '15.00-17.00');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `rekenings`
--

CREATE TABLE `rekenings` (
  `id` int(11) NOT NULL,
  `nama` varchar(99) NOT NULL,
  `nomor` varchar(45) NOT NULL,
  `jenis` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rekenings`
--

INSERT INTO `rekenings` (`id`, `nama`, `nomor`, `jenis`) VALUES
(1, 'Christin Gunawan', '6750753211', 'BCA');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nrp` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jurusan` enum('Informatika','Manufaktur','Kimia','Industri','Elektro') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomor_telpon` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_line` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `is_reset` tinyint(4) DEFAULT 0,
  `status` enum('unpaid','pending','success','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `rekenings_id` int(11) DEFAULT NULL,
  `ukuran` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bukti_pembayaran` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batchs_id` int(11) NOT NULL DEFAULT 0,
  `konfirmasi` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `nrp`, `name`, `jurusan`, `nomor_telpon`, `id_line`, `admin`, `is_reset`, `status`, `rekenings_id`, `ukuran`, `bukti_pembayaran`, `batchs_id`, `konfirmasi`) VALUES
(1, 'ad.christin@ubayamobft.com', '$2y$10$b.jV2mLfuk.HOhHYPEn/8evApX6TaAeHfbyPMdxfQ37ruLjEXFh/e', '160721023', 'Christin', 'Informatika', '12345', '12345', 1, 0, 'unpaid', NULL, NULL, NULL, 0, 0),
(2, 'itd@ubayamobft.com', '$2y$10$EhniM8q4h.GbH6qz7fAf1eJDCZOT/ihs0hXh6JEjQh04/DrSmqR7u', '160420041', 'ITD NIH BOS', 'Informatika', '12345', '12345', 5, 0, 'unpaid', NULL, NULL, NULL, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batchs`
--
ALTER TABLE `batchs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rekenings`
--
ALTER TABLE `rekenings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `fk_users_rekenings_idx` (`rekenings_id`),
  ADD KEY `fk_users_batchs` (`batchs_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `batchs`
--
ALTER TABLE `batchs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rekenings`
--
ALTER TABLE `rekenings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_batchs` FOREIGN KEY (`batchs_id`) REFERENCES `batchs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_rekenings` FOREIGN KEY (`rekenings_id`) REFERENCES `rekenings` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
