-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 15, 2022 at 03:25 PM
-- Server version: 10.3.35-MariaDB-cll-lve
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobftuba_pembayaran_mobft`
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
(1, 'Reynard Nathanael', '0882256411', 'BCA'),
(2, 'Nunung Mardhita Refiga Putri', '6720510934', 'BCA');

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
  `batchs_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `nrp`, `name`, `jurusan`, `nomor_telpon`, `id_line`, `admin`, `is_reset`, `status`, `rekenings_id`, `ukuran`, `bukti_pembayaran`, `batchs_id`) VALUES
(1, 'mardhitanunung@gmail.com', '$2y$10$jKdHb52VXFiFHwjMZtpkleNhdusAeK2j1LdfEwqLqwAKTvRMyEw/S', '160320019', 'Nunung Mardhita', 'Industri', '081332530021', 'nunungmardhita', 2, 0, 'unpaid', NULL, NULL, NULL, 0),
(2, 'reynardnathz07@gmail.com', '$2y$10$qkuoUdUNuYQuzTIexyZwhO7zqL8VjhKd6dH3yJrMVDMgJe3KBd/Lu', '160720034', 'Reynard Nathanael', 'Informatika', '085607616739', 'jiangreynard', 1, 0, 'unpaid', NULL, NULL, NULL, 0),
(3, 'madeyogabrahmantara@gmail.com', '$2y$10$oN/U1M.s9fDoKwAvYNEEbOtZ8ZcMlKeW4wqfzg8753P7YijiVxxe6', '160419045', 'Yobong', 'Informatika', '081353067152', 'yagabrahmantara', 5, 0, 'unpaid', NULL, NULL, NULL, 0),
(4, 'michelle.christabel9@gmail.com', '$2y$10$OFsURn6WJHTeZr3Dgl0h1uUI4Qj.ETGSJDexisDpuaCMO4ro3pKyu', '160422036', 'Michelle Christabel F.S', 'Informatika', '085753361540', 'michellechrist_', NULL, 0, 'success', 2, 'M', '1657624721_160422036_1657624697643.jpg', 3),
(5, 's161022001@student.ubaya.ac.id', '$2y$10$9PUnqCyv7d5pozSElU55DumuDulLBtYybjO1Fa903utEkvBHP0DSe', '161022001', 'Angeline Arista', 'Manufaktur', '085745258888', 'aristaangeline', NULL, 0, 'success', 1, 'M', '1657685326_161022001_161022001_UangBajuMOBFT.jpg', 3),
(6, 'verlita.vectoria16@gmail.com', '$2y$10$U6RWmHCPhmcq3mHtmzTr5..aUb/tGovL7sHTIgye6aDVERQCp9R4C', '160322003', 'Verlita Victoria Hermanto', 'Industri', '082334709162', 'verlitavictoria24', NULL, 0, 'success', 2, 'M', '1657508199_160322003_Screenshot_20220711-095610_BCA mobile.jpg', 2),
(7, 'angelajovv03@gmail.com', '$2y$10$9tOXz4Bh8ZmbmblEqjt2zejZngMgFrdR3DM7sYS7wdvX0ACvXKUv.', '160722013', 'Angela Jovita', 'Informatika', '081392128282', 'angela.jh', NULL, 0, 'success', 1, 'M', '1657885738_160722013_Screenshot_20220715-184732_BCA mobile.jpg', 3),
(8, 'S160322010@student.ubaya.ac.id', '$2y$10$2BKPCwqka2A8/Z8ywCx0v.UvL4rb8P8RA3DEr9QFplRFHE6D2QUAO', '160322010', 'Viviana Cristanty', 'Industri', '085750328871', 'vivianacristanty', NULL, 0, 'success', 1, 'L', '1657513453_160322010_Screenshot_20220711-112410_BCA mobile.jpg', 2),
(9, 'korneliusr23@gmail.com', '$2y$10$.6hMhWtc0DmgLNFdq9NkW.LqLJxx/cQvDQS3f6AanxAzxS69k1BlG', '160322012', 'Kornelius Rusman', 'Industri', '087751270117', 'korneliusrusman', NULL, 0, 'unpaid', NULL, NULL, NULL, 0),
(10, 'fiorelloaustin@gmail.com', '$2y$10$.DAcVFFJtnAfcVg2psrVHO8fU9kTHTGrT/Xy0srfELPSWXDR5WZSa', '160422101', 'Fiorello Austin Ardianto', 'Informatika', '085104914848', 'fioaustin12', NULL, 0, 'success', 1, 'XXL', '1657594904_160422101_Bukti Pembayaran MOB FT 160422101.jpeg', 3),
(11, 'fredericomanuel88@gmail.com', '$2y$10$XnLl.pLcb8Rl6qUo1LwCMumSDKAcUuT5NP3PVoZ5RyH5vw8AQlHs2', '160721056', 'Frederico Manuel', 'Informatika', '085105682222', 'richnuel8', NULL, 0, 'unpaid', NULL, NULL, NULL, 0),
(12, 'sutantodarren@gmail.com', '$2y$10$rCOsdIChBntnoP8qLWcxN.VB81OmkBnNybPMyHQPMjakidBHzq2gG', '160422020', 'Darren', 'Informatika', '08123035752', 'darrengs', NULL, 0, 'success', 1, 'L', '1657514083_160422020_Screenshot_2022-07-11-11-34-26-621_com.bca.jpg', 3),
(13, 'valenjulian65@gmail.com', '$2y$10$cvZ6hxbqup.2MfxCOND7o.U06VXJsV4ptNi7GiOI59OESa40.cP3K', '160122013', 'Valen Julian Manek', 'Elektro', '+6281330306025', 'palenjm', NULL, 0, 'success', 1, 'XL', '1657781113_160122013_Screenshot_20220714-134230_BCA mobile.jpg', 2),
(14, 's160422069@student.ubaya.ac.id', '$2y$10$sCKppLJux51FVcfKTBYld.MPHwqtsOPqzbE.K2DtpgjcqVuMX8Gsq', '160422069', 'Florencia Yang', 'Informatika', '082257000078', 'florencia_yang', NULL, 0, 'success', 2, 'S', '1657516096_160422069_Screenshot_20220711-120759_BCA mobile.jpg', 3),
(15, 'josegenaro@gmail.com', '$2y$10$O.34RRvd0uNhHDuDvIyl4OFPW.EipwRDsXr6MosWhhs1xo07TEkJW', '160719026', 'Jose Genaro Yusha', 'Informatika', '082257076379', 'josegy_', 5, 0, 'unpaid', NULL, NULL, NULL, 0),
(16, 'helenaveronica1184@gmail.com', '$2y$10$spgfVLTJUH2CAYwmT5gAreb9dJYYkPf6offrRveOwBKUFl3tXFvTy', '160322023', 'Helena Veronica Oetomo', 'Industri', '085877831301', 'hvhelena', NULL, 0, 'success', 1, 'M', '1657546623_160322023_Screenshot_2022-07-11-20-36-47-172_com.bca.jpg', 3),
(17, 'nicklausandersen@gmail.com', '$2y$10$ci3kG4UrK2za1RucvFMUY.i2iWQrssw74ATj8H4278v.AOoBArw6m', '160322015', 'Nicklaus Andersen', 'Industri', '081233700028', 'nicklausandersen', NULL, 0, 'success', 1, 'L', '1657552554_160322015_Bukti TF Kaos MOB.jpg', 1),
(18, 'tanujayamarcella29@gmail.com', '$2y$10$P4IhgXB70UEjC6c.QdEsyu/e0BFo4KyTsBnubiaxOvmJzVfEdrhmW', '160922011', 'Marcella', 'Informatika', '081247574980', '_marcellatan', NULL, 0, 'success', 1, 'L', '1657617617_160922011_IMG_20220712_161934.jpg', 3),
(19, 'gabrielnarendra1@gmail.com', '$2y$10$rjkHDxKy80bXJgcVPte80eAMvq/VXL7Wv4eVMfz0DcG0ho2UFm8g6', '160422018', 'Gabriel Narendra Damanik', 'Informatika', '081216339241', 'minecraftlegend1', NULL, 0, 'success', 1, 'XL', '1657631199_160422018_WhatsApp Image 2022-07-12 at 20.06.18.jpeg', 2),
(20, 'eriyanikelsi@gmail.com', '$2y$10$mibJykV3Vs9lRXv3I2A1tOxOKCYTmR5CS6xhEEuYi2sE1nVg.4Tde', '160322054', 'KELSI ERIYANI', 'Industri', '085379128721', '@kelsieryn', NULL, 0, 'success', 2, 'M', '1657787603_160322054_IMG-20220714-WA0003.jpg', 2),
(21, 'aditmetal04@gmail.com', '$2y$10$.TOWIvp/.nuRBk0zxgithe.japXPaCSrr.XVoaPq0aUfnNgeVbhAC', '160422097', 'Aditya valentino bayu krisna', 'Informatika', '089678437185', 'Krisna_vlntn', NULL, 0, 'success', 1, 'XL', '1657839956_160422097_Screenshot_20220715-060241_BCA mobile.jpg', 3),
(22, 'gilbertsaragih5@gmail.com', '$2y$10$ChOOxESFAFpNJe6ORfgKSOenmUfqMeO743SSNDteEwdoZdDQmxc.O', '160422075', 'Gilbert', 'Informatika', '085232939379', 'gilbertms04', NULL, 0, 'success', 1, 'M', '1657798507_160422075_WhatsApp Image 2022-07-14 at 18.34.44.jpeg', 4),
(23, 'michelleangkiriwang2904@gmail.com', '$2y$10$AdayC4L3eyUBOLnaxCfofupS0zF1t0DcOdfiAcOd9im/Al34mwTNu', '160422016', 'Michele Angkiriwang', 'Informatika', '085239559940', 'halomicell', NULL, 0, 'success', 1, 'S', '1657590999_160422016_inbound3414927748827939065.jpg', 3),
(24, 'angelineaurelia123@gmail.com', '$2y$10$9VgBY29O/yvAbADAgSUpLe24zE0WKboOI9O0EBkOSiwCahtgQpADa', '160422031', 'Angeline Aurelia', 'Informatika', '087780452066', 'angelineaa_13', NULL, 0, 'success', 1, 'L', '1657592513_160422031_IMG-20220712-WA0000.jpg', 4),
(25, 'triandazvn@gmail.com', '$2y$10$yDxpSrwhLnaZv..uksWbZOEtdeCAWcrGBXd3pNx74z86JPwpTmi/2', '160422126', 'Trianda Zevania', 'Informatika', '081216601921', 'triandazvn', NULL, 0, 'success', 1, 'S', '1657596694_160422126_IMG-20220712-WA0000.jpg', 2),
(26, 'fannyribowo.2004@gmail.com', '$2y$10$GHcVQLpbSeXpxSDtkJV3vONmwbLoq2VQAnp6AiRvr41XnhxQNKm6e', '160422005', 'Fanny Rorencia Ribowo', 'Informatika', '08558992073', 'fannyribowo290504', NULL, 0, 'success', 2, 'L', '1657603687_160422005_Screenshot_20220712-122056_BCA mobile.jpg', 3),
(27, 'inoruardion@gmail.con', '$2y$10$LpXYkWHgkJ74msCgzKp2NuMUr15ea1N2GjM43/OxziKyqy.Innmoe', '160122020', 'Inoru rijkaard mardiono', 'Elektro', '082232023322', 'inorutampan123', NULL, 0, 'success', 1, 'XL', '1657787080_160122020_IMG-20220714-WA0007.jpg', 2),
(28, 'afitodianova2001@gmail.com', '$2y$10$oLm1kL6lGvysQGN2NC1AHehqxHOz430nBSeoU6.zUyPYnJdxGoLeu', '160420132', 'Afito Dianova Meyvada', 'Informatika', '085861076910', 'afitodianova', NULL, 0, 'success', 1, 'M', '1657627731_160420132_WhatsApp Image 2022-07-12 at 19.08.16.jpeg', 1),
(29, 's160419076@student.ubaya.ac.id', '$2y$10$Jyb1hWnjPwiYLagVwuT5L.jDe8XTQ09aahrUYw4JvaK75NnLzbKLC', '160419076', 'Ricky Andrean Fernanda Gunawan', 'Informatika', '089603661804', 'rickyandrean99', NULL, 0, 'failed', NULL, 'XXL', NULL, 0),
(30, 'bramatyaprio@gmail.com', '$2y$10$CHaJ449k2XV1PRT5aGxHa.hmMGJB5efMF.d.IM8zuLpkYPaXx4bPK', '160422006', 'Bramatya Prio Sembadhi', 'Informatika', '082230801286', 'bramaty20', NULL, 0, 'success', 1, 'L', '1657625475_160422006_Screenshot_20220712-183031_BCA mobile.jpg', 3),
(31, 'jeremiawiyono@gmail.com', '$2y$10$5lEvmCE666oSrcaccDrY8eJIGBUqEHb7gHvMCEZmNE87NUY33Kmry', '160122018', 'Jeremia Eliezer Luvian Wiyono', 'Elektro', '081703367715', 'Jeje2004', NULL, 0, 'success', 1, 'XL', '1657780919_160122018_IMG_20220714_131028.jpg', 4),
(32, 'gaminganjay8@gmail.com', '$2y$10$.dzkOPFeJhuUrlTKSIw0FehU12nSqLnD4CeKweyn68/O6fLRVgBie', '160122019', 'Yosafat Gumilar S. P.', 'Elektro', '085954511641', 'botokaniwakpaus', NULL, 0, 'success', 1, 'L', '1657767109_160122019_IMG-20220714-WA0001.jpg', 2),
(33, 'abel.bernardus@gmail.com', '$2y$10$c09A3Zonnp41PgninY0yluY5uKFGMLrFszrBn72tgYKueVPcrTcaS', '161022012', 'Bernardus Abel', 'Manufaktur', '089678102773', 'poppymollydantiva', NULL, 0, 'success', 1, 'XL', '1657792881_161022012_Screenshot_2022-07-14-16-59-07-92_6d8b9d1e8bdaeba7bfca0c527f495e2d.jpg', 2),
(34, 'eileenaurellia10@gmail.com', '$2y$10$RGvQ5ZZQJeKIi0cG8d922uKGrUPKBYyTs/gWqAQblPawcExgrHMsy', '160322029', 'Eileen Aurellia Evelyn', 'Industri', '085248225115', 'evelynely_', NULL, 0, 'success', 1, 'L', '1657646870_160322029_Screenshot_20220713-002651_BCA mobile.jpg', 1),
(35, 'laurensia.jeanne15@gmail.com', '$2y$10$UYu8SUQyNqnuEfbXOrZsWO6RZ.kj/LBotBQlidMKrBJpADYwmC/ze', '160422079', 'Laurensia Jeanne', 'Informatika', '082332437748', 'jenifel15', NULL, 0, 'success', 2, 'S', '1657770635_160422079_inbound5524959638130189489.jpg', 2),
(36, 'eugeniacaitlyn@gmail.com', '$2y$10$OoroJsn0xftNsCoDRkcgDeFUNR3Anw0ghgj3Y2xu2ZqwSRokDsTsm', '160822009', 'Eugenia Caitlyn Cristabella', 'Informatika', '087858998276', 'ecc2004', NULL, 0, 'success', 1, 'S', '1657685699_160822009_Screenshot_20220713-111443_BCA mobile.jpg', 3),
(37, 'nathangarzyasantoso7@gmail.com', '$2y$10$rGBvVVSNz5mm7LeykKHN4OeM79iijGYT1ku3kHuDT5TJZsRCUc9Yi', '160422041', 'Nathan Garzya Santoso', 'Informatika', '081332600497', 'nathgrz2003', NULL, 0, 'success', 1, '4XL', '1658062052_160422041_Bukti Transfer (160422041).jpg', 2),
(38, 'ignatiushadi1710@gmail.com', '$2y$10$S/9Pc3TFY0Qwv/7GLtopselTwydMPgagitvc3eVJbDdjyhXoYkO42', '160422002', 'Ignatius Hadi', 'Informatika', '087856401652', 'ignatiush03', NULL, 0, 'success', 1, 'XXL', '1657707596_160422002_WhatsApp Image 2022-07-13 at 5.18.47 PM.jpeg', 4),
(39, 'fxsurya27@gmail.com', '$2y$10$PuuLMl9emIDQJx34DUZf4.PxTS9LTAO.Jk8HBGIiGR0buHGll3h4u', '160422003', 'Fransiscus Xaverius Surya Darmawan', 'Informatika', '082138616235', 'darkik2727', NULL, 0, 'success', 1, 'XXL', '1657709464_160422003_Bukti_TF_Baju_Ubaya_2022_160422003.jfif', 2),
(40, 'tasyalao321@gmail.com', '$2y$10$L9yRCbT3kT4cHHhDPpM2dOjBi.f6U2lX4aIWg4jvrLdLDbj0xvlJC', '160122014', 'tasya fla denalao', 'Elektro', '081327240110', 'tasyalao_', NULL, 0, 'success', 1, 'M', '1657786349_160122014_Screenshot_2022-07-14-15-09-17-96.png', 4),
(41, 'jerome.candra@gmail.com', '$2y$10$i2.mQXvquVjGoVaHQkdiNuxxkL2PHw1bZwracsX9H28s5JhBRvQ8O', '160422059', 'Arnold Jerome Candra', 'Informatika', '087855480561', 'arnold.jerome', NULL, 0, 'success', 1, 'XXL', '1657711329_160422059_Screenshot_2022-07-13-18-21-53-50_f339d16c976c0b263d991820e972fb72.jpg', 3),
(42, 'georgewcr16@gmail.com', '$2y$10$NY3ylIrF4TX237bvLlmVze0pKWOIDcZ9rk2u7qK36hn5F81HLpTs.', '160722015', 'George William Christian', 'Informatika', '082142650066', 'gio160504', NULL, 0, 'success', 1, 'M', '1657984502_160722015_Bukti Pembayaran Baju Teknik 2022.jpg', 2),
(43, 'patrickanderson0607@gmail.com', '$2y$10$O.6FApwu.1227FjIQgFDG.rpy1TQRwJ3LHeJdF8pdIdSfEnvKyKbm', '160322007', 'Patrick Anderson Wijaya', 'Industri', '089525105577', 'patrick_aw07', NULL, 0, 'success', 1, 'XXL', '1657769394_160322007_Screenshot_2022-07-14-10-29-16-555_com.bca.jpg', 1),
(44, 'rizkyutomo05@gmail.com', '$2y$10$wIWEhGKt4e1SiMcbPQXlAO913wiv941Czw9Qx04scbYiM.NBDfAWW', '160122008', 'Bagas Rizky Utomo', 'Elektro', '085946138109', 'bagasrizkyutomo', NULL, 0, 'success', 1, 'L', '1658135836_160122008_9E5BA146-4190-456F-99B2-959799BC8998.png', 4),
(45, 'threvysatriya98@gmail.com', '$2y$10$jql2gOUxe0iNgl8HL6iNfuxehaAa4oE763vvxGzzQkQlRywYbQm1K', '160222017', 'Martzel', 'Kimia', '085706181245', 'Azelxyz', NULL, 0, 'success', 2, 'L', '1657770163_160222017_2D537806-8093-4066-B3D3-46B2C4F83188.png', 2),
(46, 'alimnova17@gmail.com', '$2y$10$6If3lCfm270lAuZCkeNtReaCW6BYfwWBNP5h3UVVeXiUHiDjayRmu', '160122009', 'Alim Nova Dianto', 'Elektro', '081234678758', 'Alimnovadianto', NULL, 0, 'success', 1, '4XL', '1657771174_160122009_IMG-20220714-WA0006.jpg', 3),
(47, 'ggiec.2@gmail.com', '$2y$10$tzwlowyMOBnoYKUWHglDheuzDzF3etynWAXDwloTX5HvMcqJKG.VO', '160122006', 'Anggie C', 'Elektro', '08117687882', 'ggie.c', NULL, 0, 'success', 1, 'S', '1657793805_160122006_Screenshot_20220714_171556.jpg', 1),
(48, 'thoriqarsadaa@gmail.com', '$2y$10$9CEt8bqTo57NGrRvF5M3WerUOVy2NMUg5mmWa1ofa0X.bR4NGOHi6', '160422116', 'Mochammad Thoriq Arsada', 'Informatika', '085336470272', 'kuya-ning', NULL, 0, 'success', 1, 'L', '1658147210_160422116_2BFAE00A-627C-452A-8C17-613307601856.png', 2),
(49, 'genando8@gmail.com', '$2y$10$fR6omKU9qmvNSzK/P.3J2eM1wNMjg4bBmF3F7l3AS9e8oU8.LnUVi', '160122002', 'Genando Paylino Siswanto', 'Elektro', '08563371650', 'yunitasalon', NULL, 0, 'success', 1, 'L', '1657901094_160122002_IMG-20220715-WA0017.jpg', 2),
(50, 'naufalf2424@gmail.com', '$2y$10$K7UnpkZbEoKNx8840eEuOe7aLc.l4CzjKqnDh1SrotX71Or3GXmVm', '160322051', 'Muhammad Naufal Fayyadh', 'Industri', '08124243309', 'nfl1241', NULL, 0, 'success', 1, 'L', '1658060477_160322051_1658060424678.png', 3),
(51, 'edwardmarcelino22@gmail.com', '$2y$10$ju0Q50cYLvajpoItJ8Cfd.AQiacBIzzT4F9fxs8rhmOGpBBNpnnsC', '160222004', 'Edward Marcelino', 'Kimia', '081233556245', '01edward22', NULL, 0, 'success', 1, 'XL', '1657778206_160222004_S160222004_Edward Marcelino (TekKim).jpg', 2),
(52, 'trenadipramudia.a@gmail.com', '$2y$10$nOWvrwIQY5Y9ho5D/nUS2OEET/duwLRiJBEIoTaYYlWtM9HVlt6m.', '160222016', 'Trenadi Pramudia', 'Kimia', '081549549932', 'wineren', NULL, 0, 'success', 1, 'L', '1657862597_160222016_IMG_20220715_122205.jpg', 2),
(53, 'laotessa23@gmail.com', '$2y$10$iJtdQVlSLBQLC/.crmC2b.NxC67eqJLGvG6I1FnL7t/pe.HzPv8kC', '160122015', 'Tessa', 'Elektro', '085236193836', 'laotessa', NULL, 1, 'success', 1, 'S', '1657787251_160122015_inbound8023830409960308451.jpg', 1),
(54, 'michaell.lawrence77@gmail.com', '$2y$10$5Ct.tHH/cnga8RLNoXejMugJK/DMIxHNNKs4PcYn4AzKNmUcKbxI6', '160422083', 'Michael Lawrence', 'Informatika', '081222220675', 'michaellawrence07', NULL, 0, 'success', 1, 'L', '1657805115_160422083_Screenshot_20220714-202502_BCA mobile.jpg', 4),
(55, 'zizi.au.az@gmail.com', '$2y$10$e3az7wEBPtTqfl1LotWc8uprWjgG8PHJBvgUl8ViXUUyndUi/jCVa', '160122024', 'Zizi Aulia Azzahra', 'Elektro', '085389369007', 'ziziauliaazzahra1434', NULL, 0, 'success', 2, 'S', '1657875835_160122024_IMG-20220715-WA0004.jpg', 4),
(56, 'emanue.jordan34@gmail.com', '$2y$10$TnGHhO.LjaS13NRKQ1Ty9e1WYdwAgAF5kWYFPbdbMWNZS.8MxL6oG', '160422102', 'Emanuel Jordan Rafhaelino Sanjaya', 'Informatika', '0896410286222', 'emanueljordann', NULL, 0, 'success', 1, 'M', '1657807891_160422102_inbound3091349159334134577.jpg', 3),
(57, 'hitmeup.cornel@gmail.com', '$2y$10$rkkw1gIm4YYo7v/cJKx4aOoOBWwLg1KQRl0L0VPyKbHJdpPSJcNBW', '160122016', 'cornelia laksmi bayu murti', 'Elektro', '082266664338', 'cornelialbm', NULL, 0, 'success', 2, 'M', '1657864174_160122016_Screenshot_20220715-130818_BCA mobile.jpg', 1),
(58, 'mathew.reynald04@gmail.com', '$2y$10$qVikwCTtuml88CrIkc6j5OSfgtPBrPZ3ITqcYR0uvNL.FaRIIpPpm', '160422023', 'Mathew Reynald, Sutanto', 'Informatika', '082232986799', 'mathewrs', NULL, 0, 'success', 1, 'M', '1657896000_160422023_inbound2507934256966513190.jpg', 3),
(59, 'valeriegiannetta@gmail.com', '$2y$10$QYLo9wJYMtM/cxwu/GCFZOsnkHh/V.N4YsBkKOU6Gr23j4.Luy1iy', '160222019', 'Valerie Giannetta', 'Kimia', '081224799407', 'valeriegiannetta', NULL, 0, 'success', 1, 'M', '1657810468_160222019_Screenshot_20220714-215247_WhatsApp.jpg', 2),
(60, 'nathasiapangestu04@gmail.com', '$2y$10$h.b/df1CtMoV9v2GUKagUeByhVRwh8WfmJi3BH5zDimXJ7kbnFhTu', '160322005', 'Nathasia C.P.P', 'Industri', '085843807731', 'nathasia_cpp', NULL, 0, 'success', 1, 'M', '1657816954_160322005_20220714_234143.jpg', 2),
(61, 'lusia.lasakar@yahoo.com', '$2y$10$gF7SPWVbjUGHM8QCKRe0ROQa88EakFFpB4zt/fhHd8KAR9PfZrpf6', '160722029', 'Lucia Selyn Lasakar', 'Informatika', '081338210599', 'lusiaselynl', NULL, 0, 'success', 1, 'M', '1657819521_160722029_473CC375-1645-447F-9568-A05026F7F8E9.jpeg', 1),
(62, 'mchdeby@gmail.com', '$2y$10$ZpJh.UIJOaUN3prXGSivvOp6CbNBSde6jb8cfG/yGteOZS7XscAsW', '160422062', 'Janet Deby M. Manoach', 'Informatika', '081395303142', 'debymch', NULL, 0, 'success', 1, 'L', '1657857217_160422062_Screenshot_20220715_105326.jpg', 3),
(63, 'audry.verly@gmail.com', '$2y$10$HO1pvKPmqL9lVTyJ6dbUpuafW6obsgiV1Z7s7najsTTekIfXwIL2W', '160422127', 'Audry Verly', 'Informatika', '085861800588', 'audryverly88', NULL, 0, 'success', 2, 'L', '1657853471_160422127_Bukti Pembayaran Baju.jpeg', 4),
(64, 'dariusmputra@gmail.com', '$2y$10$3D7C5WmAO75mLCOcFF63JuphQZwMGRW4Y7Eqsk/XDxnJgYtGZV.I2', '160422035', 'Darius Mulyadi Putra', 'Informatika', '081230260085', 'dariusmp8', NULL, 0, 'success', 1, 'L', '1657896250_160422035_A39FE23A-F24D-4E04-954C-4C8555501AC7.png', 4),
(65, 'anthoniusevan@gmail.com', '$2y$10$ibXlI68lPAj8Tbx1P62JCOP4JIIAZvIR7yI78MG3zy2yNxbGL5iLe', '160922001', 'Anthonius Evan', 'Informatika', '087855404863', 'anthonius_evan', NULL, 0, 'success', 1, 'M', '1657896665_160922001_Screenshot_2022-07-15-21-50-39-05_f339d16c976c0b263d991820e972fb72.jpg', 4),
(66, 'chelofrans27@gmail.com', '$2y$10$GzyW3LlFezw9yKC5/S.MI.sQgSGJDIF4G7kjOymq4fB218fN2QXTO', '160322035', 'Charlotie Arliza Chelonia Frans', 'Industri', '085931362870', 'Cheloniafrans', NULL, 0, 'success', 1, 'M', '1658058132_160322035_160322035.jpg', 3),
(67, 'rfarreldi@gmail.com', '$2y$10$QOgskFhnNAxW/XQUv78nFeloPHb4rf7VxaG5bUPZFlOnh.OqCUeRK', '160122029', 'Reyhan Farreldi', 'Elektro', '082143314604', 'reyhan_farreldi', NULL, 0, 'success', 1, 'XL', '1658048533_160122029_2C2681A4-19F8-4310-85E7-3DD48201DEA2.jpeg', 4),
(68, 's160422011@student.ubaya.ac.id', '$2y$10$FxKPZ6h3lZdbOm6PIYlGfOizpXPot9TvC119n57wBubr/OKJa/dp.', '160422011', 'Willy Himawan', 'Informatika', '089677603360', 'wlhmere12345', NULL, 0, 'success', 1, 'XL', '1657941196_160422011_IMG-20220716-WA0000.jpg', 4),
(69, 'brendanoviarista06@gmail.com', '$2y$10$B1NGI2t1PG4rampEKok43erWROVxHhNdzdCgsrlTXVQOPP6ixu43a', '160322021', 'Brenda Noviarista Budiasih', 'Industri', '089687769266', 'brenda06_', NULL, 0, 'success', 1, 'L', '1657952753_160322021_Screenshot_20220716-132542_BCA mobile.jpg', 3),
(70, 'karolin.61104@gmail.com', '$2y$10$8ZiyHXTeKG1eoEdFs7BO9u69fBFErVpyIvgaRRw.tMjVD5RuDCi/i', '160322018', 'Archangela Karolin', 'Industri', '082217864848', 'archaela', NULL, 0, 'success', 1, 'M', '1657899743_160322018_160322018_AK.jpg', 3),
(71, 'himeriusnico03@gmail.com', '$2y$10$zY6mG2gi5tXnAYOXgihah.dnbxgpaGRDajtSjwY2BcFl8ITlIOjTS', '160422019', 'Nico Isao', 'Informatika', '081326489410', 'himeriusnicoo', NULL, 0, 'success', 1, 'XL', '1657902399_160422019_CDD52B58-A918-4ECB-93A2-4B1822E57810.png', 3),
(72, 'natasyaakr@gmail.com', '$2y$10$JzCQKK9N0zuKnVOqhnJ3cuqIt87o5UPjMkf55eYIxChZ4mPR5vSce', '160722044', 'Natasya Aulia Kristya Regita', 'Informatika', '082244226554', 'natasyaauliaregita', NULL, 0, 'success', 2, 'M', '1658060205_160722044_inbound-1169936108.jpeg', 4),
(73, 'fareskakelvien7@gmail.com', '$2y$10$xwN9lovURZzzCIJQMOScaO0HCv2rtptrr1clR.9lUUyf8lE6EaMzS', '160722019', 'Kelvien Fareska', 'Informatika', '082334705012', 'fareska7', NULL, 0, 'success', 1, 'L', '1658042959_160722019_WhatsApp Image 2022-07-17 at 14.27.44.jpeg', 3),
(74, 'nadine.chow.a@gmail.com', '$2y$10$nr2C.vg/d.T/NSyb1WuSI.KkZ.NBSkDpDtZpwYd3pN/xSc5xd5Inm', '160422027', 'Nadine', 'Informatika', '081332936398', 'nadine-winx', NULL, 0, 'success', 1, 'M', '1658043950_160422027_Bukti Transfer Baju Teknik_Nadine.jpg', 3),
(75, 'nellyfurtado2004@gmail.com', '$2y$10$hBd4aOcvZqvw5b5S6Zz9Z.PLyLJgobmF9g27JMEhDd8l01DAjzVD.', '160322040', 'Nelly Euro F', 'Industri', '085236534500', 'Neurofia', NULL, 0, 'success', 1, 'S', '1657960701_160322040_inbound5774905644998018280.jpg', 4),
(76, 'jefriisak042@gmail.com', '$2y$10$e4r8/kxLmvTZ77Gp/RhjKe8iapX/kv7fZeOLjsJNpCv0ImRuJJmka', '160322053', 'Jefri Isak', 'Industri', '081345312638', 'lopeyu4ever', NULL, 0, 'success', 1, 'L', '1658149586_160322053_inbound8903403629116706124.jpg', 1),
(77, 'laurentiusreynards@gmail.com', '$2y$10$Xcfa.mfihvp1Be2JZTnqaeCuko4M/UCUwzKuL8/jB29On4DwV/sqa', '160322016', 'Laurentius Reynard Soetanto', 'Industri', '081335131153', 'reyrytho', NULL, 0, 'success', 1, 'L', '1657976695_160322016_16579766677291541006491763586423.jpg', 3),
(78, 'avn.tantoyo@gmail.con', '$2y$10$WQaQff4yU7oCH1LsLMgC8.Yqq9jDXIVnTnjybUu/F1hA9g6.7xqKW', '160822003', 'Arvin Tantoyo', 'Informatika', '082237171233', 'arvfin', NULL, 0, 'unpaid', NULL, NULL, NULL, 0),
(79, 'adindaseoulita02@gmail.com', '$2y$10$btoICHkyBtzSm4bLPVOnke/MepePgmx/YPR2D3yp89EFgLW.jGOSO', '160122021', 'Adinda Seoulita', 'Elektro', '081334586463', 'Adindadbs', NULL, 0, 'success', 1, 'S', '1658141384_160122021_Screenshot_2022-07-18-17-48-22-034_com.shopee.id.jpg', 1),
(80, 'avn.tantoyo@gmail.com', '$2y$10$24nnwciJTvh7J5rhnDUrweInogcZm2.g5Okq/Wo3ThbRQg8749nXW', '160822003', 'Arvin Tantoyo', 'Informatika', '082237171233', 'arvfin', NULL, 0, 'success', 1, 'XL', '1658027630_160822003_B4DB1839-504B-47E9-AB6C-4CA53145563F.jpeg', 4),
(81, 'laurensia.ofira@gmail.com', '$2y$10$xoEyUfVkewZuRqK9w5LiUeD0FmOBSN2sDihJP102h2FV.beGGP5R6', '16222020', 'Laurensia Kayla Ofira', 'Kimia', '08117178266', 'laurenkayla', NULL, 0, 'success', 1, 'M', '1658076283_16222020_Screenshot_2022-07-17-23-43-31-90_f339d16c976c0b263d991820e972fb72.jpg', 2),
(82, 's160321075@student.ubaya.ac.id', '$2y$10$HKGr/dvvoqcJmsVMywsSU.kwZHnpvuu1Whi5VgKlIKRS3yhYORafy', '160321075', 'Aditya Saputra', 'Industri', '081273246798', 'adtymaster', NULL, 0, 'success', 2, 'XL', '1658375827_160321075_IMG-20220718-WA0024.jpg', 1),
(83, 'putridonna131004@gmail.com', '$2y$10$CdHhxH1qzrWlwvcmvnnKsekIiHPQ14m.iSJWxO45pvCFpCD2qnpKC', '161022015', 'Putri Rahmadonna Priciela', 'Manufaktur', '081348351725', 'rahmadonnaa_', NULL, 0, 'success', 1, 'L', '1658041923_161022015_inbound6120167926517403869.jpg', 1),
(84, 'vilen100804@gmail.com', '$2y$10$Z8rUwh4xhBa6jP4ZuXaImubceHK8TRimxOqyBPMmdhijMrslc9BLW', '160922006', 'Vilen Alycia Holly', 'Informatika', '081314523490', 'vilen1014', NULL, 0, 'success', 2, 'M', '1658045529_160922006_Screenshot_20220717-151134_BCA mobile.jpg', 3),
(85, 'alvinbatubara@gmail.com', '$2y$10$eZoWMoexy02zazhJLOmSCO7ZwZr7pJ4ndYBcVSqhXjTSss8IYsfke', '160322052', 'Alvin Batubara', 'Industri', '081252058075', 'alvinbatubara1805', NULL, 0, 'success', 1, 'M', '1658045728_160322052_1002444.jpg', 4),
(86, 'gregoriuswuli@gmail.com', '$2y$10$d..KhaPpBfjc6YYlxqGN5O/ssLNJ3yeYVnVDQRrvcaZE1HeVb0NKi', '160122028', 'Gregorius', 'Elektro', '081247779028', 'tasm2011', NULL, 0, 'success', 1, 'L', '1658106158_160122028_16581061312408536611090876193202.jpg', 2),
(87, 'matthewclifford08123@gmail.com', '$2y$10$jXyqDb6091c3.45hsEnx3.BLtuS4KxiGteMsvYfMVJVOJ.8O9och2', '160422025', 'Matthew Clifford', 'Informatika', '082233477107', 'hellobestlol', NULL, 0, 'success', 1, 'L', '1658047901_160422025_Bukti Pembayaran Kaos MOB FT_Matthew_160422025.jpeg', 3),
(88, 'dzakiy0404@gmail.com', '$2y$10$vwBcggRUpjgpZeNrx7cgweoh6YwniwUXWb2J.lFJN7X356t5GqAu6', '160722023', 'Muhammad Dzakiy', 'Informatika', '081289090407', 'dzakixx0404', NULL, 0, 'success', 2, 'L', '1658048825_160722023_BUKTI PEMBAYARAN.jpeg', 3),
(89, 'bayusuryadi17@gmail.com', '$2y$10$F4D6bogkEncopyRkHWLSrOO7mQvfanBZdJlZOJyzqIC0O8iQCMcsO', '160322009', 'Bayu', 'Industri', '081330288808', 'Shawnfrosts', NULL, 0, 'success', 2, 'M', '1658050702_160322009_4F1FE216-0AF8-4822-8AD4-45580FF14C01.jpeg', 1),
(90, 'joshuaminex02@gmail.com', '$2y$10$dsUXkI33NC1iAQ8glZzzu.6DMmcoGLLx3RKyqUQXwOdgP4nk53ZHG', '160422042', 'Joshua T', 'Informatika', '082238825781', 'liutentminex', NULL, 0, 'success', 1, 'XL', '1658055707_160422042_IMG-20220717-WA0008.jpg', 4),
(91, 'maarchellaa@gmail.com', '$2y$10$DQbuIDjV7PszWAa.EcYEU.xyPmnOpVNhvAIVfPK0L5DMgv1yhx6iy', '160422056', 'Marchella Permatasari', 'Informatika', '082183988834', 'm4rch3ll4', NULL, 0, 'success', 1, 'M', '1658055865_160422056_bukti.jpeg', 3),
(92, 'gabrielsheyrtian@gmail.com', '$2y$10$G8gaT2fG7DHLHIXYU8QrmeokN/nZbEP1EqV9tYs/TAh.h8ffLsEIi', '160222013', 'gabrielsheyrtian', 'Kimia', '081248286282', 'gbriel16', NULL, 0, 'success', 1, 'M', '1658056902_160222013_1D207A27-4B69-4E1E-AB16-CDC45844FC66.jpeg', 2),
(93, 'myh.ho0924@gmail.com', '$2y$10$Sm3DPzhMzglblPXfq25OtOMoDLAZKBm8wuJJ41QIirj07Bs768p.G', '160122005', 'Matthew Yohannes Ho', 'Elektro', '089680697212', 'mr.lollipop0924', NULL, 0, 'success', 1, 'M', '1658060520_160122005_IMG-20220717-WA0006.jpg', 1),
(94, 's160422057@student.ubaya.ac.id', '$2y$10$Q6TJjyOoarp3GhGXUQ1JduJe1UHWSFdhFt6opzMbVSveQ.kbhu7Eu', '160422057', 'Alexanderkentso', 'Informatika', '085730085339', '@id_39', NULL, 0, 'success', 1, 'M', '1658071385_160422057_Screenshot_2022-07-17-22-17-02-950_com.bca.jpg', 1),
(95, 's160321076@student.ubaya.ac.id', '$2y$10$DPVD8X3qYyvmo..a00KCouDFbqoaGuirmxLtW9JrNY8.XxAxdy2T6', '160321076', 'Michael Ginting', 'Industri', '085658202687', '03g03j', NULL, 0, 'unpaid', NULL, NULL, NULL, 0),
(96, 'djodyelsharon@gmail.com', '$2y$10$bZYDPKBIRTuZLPjpVQIZbOkjNqjKPydMnR5QBTzUdK3BVuyu27QO6', '160122022', 'Djody El Sharon', 'Elektro', '081368608062', '87888071', NULL, 0, 'success', 1, 'XL', '1658082089_160122022_IMG-20220718-WA0000.jpg', 4),
(97, 'deddybala1944@gmail.com', '$2y$10$hP9dX6inORFbyZIMpLQy0eEjFzG8fdmUknUWN7Md8EQkcU7HNX69O', 's160122026', 'Deddy bala pakabu', 'Elektro', '081242656788', '19260403', NULL, 0, 'success', 2, 'L', '1658072793_s160122026_74F3411B-8219-410B-B50F-64E6D8860164.jpeg', 4),
(98, 'meychellapermatasari@gmail.com', '$2y$10$AAnZubUl3zazWHTmBscvn.wNtoesgg8..J5Yzg7hu8Nr1bRw/Uii.', '160422013', 'Meychella Permatasari', 'Informatika', '082183988836', 'missell04y', NULL, 0, 'success', 1, 'M', '1658074257_160422013_eda7eb28-4eb0-4fd3-b619-c6d82a9dc63d.jpg', 3),
(99, 'nsts.dvn947@gmail.com', '$2y$10$.o2XErdUatLH6V0fGiq4x.IwzLIUjOpFKfEPWDCg9ZR0qUeaWXyAa', '160222009', 'Anastasia Devina', 'Kimia', '085694975492', 'nsts.dvn', NULL, 0, 'success', 2, 'XL', '1658127832_160222009_bukti pembayaran baju MOB FT 2022_Anastasia Devina.JPG', 2),
(100, 'infamouslinx112@gmail.com', '$2y$10$xYzmlVJ7rvdpmmNuEvYT1uBs/HF0Nv3L63l5pncKFj5IiTF.Kq2sS', '160122012', 'Felipe Ariel Christnawan', 'Elektro', '089678692749', 'felipesteel', NULL, 0, 'success', 1, 'XL', '1658076549_160122012_Screenshot_20220717-234852_BCA mobile.jpg', 4),
(101, 'latansatahsya@gmail.com', '$2y$10$YzwMbrMkqW9XLRyBU.8nQegcSiLwnxq.0zxc0T0ccq9.kGt/18yn.', '160421149', 'Latansa Tahsya Qonitat', 'Informatika', '085815410194', 'latansa_11', NULL, 0, 'success', 1, 'S', '1658106564_160421149_Screenshot_2022-07-18-08-07-54-41.jpg', 2),
(102, 'jon4th4n.pr4setyo@gmail.com', '$2y$10$XfOJEK1Iavgaw9kp.zL8ku1rFfJktugWNFqcuPuFMYoq7.oandcZy', '161022014', 'Jonathan Pratama Tanaya Prasetyo', 'Manufaktur', '082334285135', 'thaanv', NULL, 0, 'success', 1, 'L', '1658108513_161022014_Screenshot_2022-07-18-08-40-53-634_com.bca.jpg', 1),
(103, 'anggananda344@gmail.com', '$2y$10$Vf8hjznD43R8gOSkyDS/xOcf0hUjaMwipij3DndolLv/blVyQj4IC', '160422114', 'angga', 'Informatika', '081232382299', 'masbrow05', NULL, 0, 'success', 1, 'L', '1658108409_160422114_Screenshot_2022-07-18-08-39-43-00_f339d16c976c0b263d991820e972fb72.jpg', 4),
(104, 'chrnataniel@gmail.com', '$2y$10$e44jHULuuju0v48Pm/iu0OAuGH3yU8uCOeeZkMgGnnbF7M2Kd2ziG', '160722038.', 'Charles Nataniel', 'Informatika', '082359356262', '1394241224', NULL, 0, 'success', 1, 'XL', '1658115514_160722038._77EE5305-0A78-45AC-AAC4-2DDF5C36AD10.png', 1),
(105, 'marshandaphanliana013@gmail.com', '$2y$10$HiuzTREKtczgjhSOAViHS.El1yZTIUxYyi7R6pzcrQxRVcsDZ0Jdy', '160422096', 'Marshanda Phanliana', 'Informatika', '085242818500', 'marshandaphanliana13', NULL, 0, 'success', 2, 'S', '1658119209_160422096_Screenshot_20220718-113910_BCA mobile.jpg', 2),
(106, 'whereisseril@gmail.com', '$2y$10$xnaymfhTJfUePcMYaEO3lOIqTdiVP3F9zaP4MFYHyNaqHSPR01/Ny', '160422026', 'cheryl', 'Informatika', '082244441021', 'cheryl_daniela21', NULL, 0, 'success', 1, 'M', '1658119734_160422026_Screenshot_20220718-114833_BCA mobile.jpg', 1),
(107, 's161021019@student.ubaya.ac.id', '$2y$10$e363oSca6tvnnNfw0qNIRO.PQuBjFv9OZ2WeYP6SnRHAjp2xt1uLG', '161021019', 'Septianus yudha pratama', 'Manufaktur', '0859183905609', '123asdwwe', NULL, 0, 'success', 1, 'L', '1658142445_161021019_IMG-20220718-WA0002.jpg', 1),
(108, 'jamesedwardsiswanto@gmail.com', '$2y$10$K.ggdi0PV8WuhV/GV1Dc9.zsHoBGvvuAbr8U.d8CQq.jUkSrPwAgi', '160422038', 'James Edward Siswanto', 'Informatika', '081931620392', 'jamesedward_s', NULL, 0, 'success', 1, 'M', '1658124697_160422038_11911.jpg', 2),
(109, 'bryanrumuy05@gmail.com', '$2y$10$wibwASiOji1ZxjgSwZktleePMjDP.EqNaYZ2.TXgVm6YgpTKZi7Ce', '160422064', 'Bryan rumuy', 'Informatika', '081215740142', '2604200412345', NULL, 0, 'success', 1, 'L', '1658128271_160422064_Screenshot_20220718-141039.jpg', 2),
(110, 'igedebangkit17@gmail.com', '$2y$10$BFXKVXRTI6HOZtIGmSAr8O1aL40NWQhuHf7ufQSmwxm4xhPeLte2S', '160922007', 'Bangkit Restu', 'Informatika', '081338540129', 'bangkitrestu', NULL, 0, 'success', 1, 'L', '1658145649_160922007_CE9047C5-EAD0-45F2-960D-A82D07CC9E7F.jpeg', 1),
(111, 'natanaelchristanto@gmail.com', '$2y$10$8PfaW233D7j2tULy5HMiS.jRJgp6QN5.FUBiHPtITQFW4BjSenVfy', '160322031', 'Natanael Christanto', 'Industri', '081357061818', 'natanchrist05', NULL, 0, 'success', 2, 'XL', '1658131188_160322031_inbound4940807336285099228.jpg', 1),
(112, 'alvinfersus4@gmail.com', '$2y$10$TJ2wUejpX4nP5PHgHEvLf.3/G8PuGykxKWHi0ZhpnG.Cqmhyl/kh2', '160420013', 'alvin', 'Informatika', '085733181815', 'alvinfernando14', NULL, 0, 'unpaid', NULL, NULL, NULL, 0),
(113, 'devannathaniel04@gmail.co.id', '$2y$10$Nyg0nW4a73bnt/mnx48VSOZsHAQQTgBf65WI.hT/ACoS.vxVF9BTS', '160422115', 'Devan', 'Informatika', '081280210369', 'devnwenz', NULL, 0, 'success', 1, 'L', '1658234526_160422115_inbound6187462714918603288.jpg', 1),
(114, 'cennialieta04@gmail.com', '$2y$10$a9Rn.GacaOLn7i.MxaodWubteiUWw3nZkJ5KZ2quKoqO1esHcM2Ym', '160422037', 'Cennia Lieta', 'Informatika', '087725050575', 'cennialieta', NULL, 0, 'success', 1, 'XL', '1658131715_160422037_8FA8F688-0F48-455B-8E61-3B5B28481BAD.png', 3),
(115, 'lukysutsnto75@gmail.com', '$2y$10$1lSeOby4rLqoi5fktaI1hO.X0o.47OwzMCioqtvi7Sa8GnXJV3q1C', '160422021', 'Luky Sutanto', 'Informatika', '082264699261', 'Lukysutanto75', NULL, 0, 'unpaid', NULL, NULL, NULL, 0),
(116, 'sarahlaura071204@gmail.com', '$2y$10$X6gobg7nusfmdNnHpAUMYeYdfm8O6HKac/GLo51eZErxg5LOgvoeC', '160422015', 'Sarah Laura Sianipar', 'Informatika', '082331015436', 'imlaurasxz', NULL, 0, 'success', 1, 'M', '1658140717_160422015_IMG-20220718-WA0008.jpg', 3),
(117, 'deltrandd@gmail.com', '$2y$10$1LfGKNw5LHeDDKtPrCEhMeZr8FbC9mc6LzNDU2iZkGr.hsXEB5n5S', 'S160722018', 'Deltrand', 'Informatika', '081907063161', 'anjingbeast20', NULL, 0, 'success', 1, 'M', '1658385014_S160722018_Screenshot_2022-07-21-14-29-55-007_com.bca.png', 1),
(118, 'lukysutanto75@gmail.com', '$2y$10$8OGSYt0Rf3nDdGKUPIHSqeA3nx6TNL4FgacwlTyr9PSGDx0KcrN5e', '160422021', 'Luky Sutanto', 'Informatika', '082264699261', 'lukysutanto75', NULL, 0, 'success', 1, 'L', '1658140039_160422021_Bukti Pembayaran Kaos MOB FT.jpg', 2),
(119, 'jasonkurnia32@gmail.com', '$2y$10$fYIpNnuVPV6NJPc4i1KtVeSMl5QTIfYuIP2BvpgsWy/JIKmkNBpl2', '160722036', 'Jason Kurnia', 'Informatika', '087810422674', 'jasonkurniaaa', NULL, 0, 'success', 1, 'M', '1658139710_160722036_A2C45DDF-1116-44ED-95EA-D67A6F71CA1B.png', 4),
(120, 'ryanxd757@gmail.com', '$2y$10$WGyLEu8i.QyJMUzLNMJDB.T.VfMLsBNk4oAlGLdBDzIBo2RPSLyKq', '160422024', 'Ryan Subagia', 'Informatika', '089518711188', 'deathknight396', NULL, 0, 'success', 1, 'XL', '1658145716_160422024_323192.jpg', 2),
(121, 'siggykusuma@gmail.com', '$2y$10$dkD.BqJzKYDyhvJ95qpK2uNeCegRN.gSNsR459AYA.y2iN/6tg8A2', '160322002', 'Siggy Setya Kusuma', 'Industri', '081230572631', 'wufflesclan', NULL, 0, 'success', 1, 'L', '1658146816_160322002_1658146803209.png', 3),
(122, 'christoforus.rafael@gmail.com', '$2y$10$pFy0z0SOF7dxYcW86kkprO55GcG/Yox8bZ9rJEC5k0gF/r3hZMAda', '161022011', 'Christoforus Rafael', 'Manufaktur', '085659007330', 'fafarafael', NULL, 0, 'success', 1, 'XXL', '1658147603_161022011_Bukti Pembayaran Baju.jpg', 4),
(123, 'paulusadi288@gmail.com', '$2y$10$OWRf4HfbId6cvyB6wLGCSOsX4vGWdLGHUqqL0c7OcKaRmfSp3KXRm', '161022007', 'PAULUS ADI CAHYONO', 'Manufaktur', '085646427706', 'adythelavega', NULL, 0, 'unpaid', NULL, NULL, NULL, 0),
(124, 'jasonvincent2004@gmail.com', '$2y$10$otq0PlTKLvu6Bi7GHUURgOFHq/2KeKwy6CCihsgTmieikETCfB87.', '160222018', 'Jason Vincent Elsurya', 'Kimia', '085157877488', 'Jasonelsurya', NULL, 0, 'success', 1, 'XL', '1658206973_160222018_inbound8266295091502337767.jpg', 1),
(125, 's160121009@student.ubaya.ac.id', '$2y$10$Bg/Ip1Q/d9OQuPwlcO/Al.Ed.tLajfRUb3FK/8j4EBoYxInGjfYTi', '160121009', 'Nur Al Manar Haji', 'Elektro', '087825166454', 'almanar30', NULL, 0, 'success', 2, 'L', '1658243048_160121009_1658243008209.png', 2),
(126, 'zefanyaana@gmail.com', '$2y$10$7YRSK0XFWHMaTLnnf.nYreuHeNAxU2mpqJMZd2AdTMCrY0.UQf.R.', '160822004', 'Zefanya Anastasia', 'Informatika', '081247970260', 'anyaz18', NULL, 0, 'success', 1, 'M', '1658373276_160822004_inbound3256784362670638818.jpg', 2),
(127, 'victorioabelnardo@gmail.com', '$2y$10$kwqKtotOO14QRA5/lIf1XOvyesY3F15cUbpjgp4AWlR6d50BctgJW', '160422049', 'Victorio Abelnardo Tjhang', 'Informatika', '082330775739', 'mohkontelo', NULL, 0, 'success', 1, 'M', '1658370735_160422049_Screenshot_2022-07-21-09-31-03-70_f339d16c976c0b263d991820e972fb72.jpg', 1),
(128, 'desbrient.plk@gmail.com', '$2y$10$JjluP6XVi2MbS8BD3uZCbuhNwd5oySZ6GRo97ZTRJ/cvpv6u0BBh6', '160722022', 'Desbrient Jarau Lamuara', 'Informatika', '082255996473', 'des151204', NULL, 0, 'success', 1, 'M', '1658401031_160722022_Screenshot_2022-07-21-17-59-50-37_f339d16c976c0b263d991820e972fb72.jpg', 2),
(129, 'natan.tarigan08@gmail.com', '$2y$10$r8BaG31EYhHOPxh6niRQRugCeZ7XVp/W1S7W2jVJQArGWn31ZF3Oe', '160422118', 'Natan Tarigan', 'Informatika', '081357749624', 'nathan3069', NULL, 0, 'unpaid', NULL, NULL, NULL, 0),
(130, 'shevchenkoberlusconi@gmail.com', '$2y$10$s36MH20Fsv2oVcrqPSHaTenueFrIBBh6VHXAocpSEHtKZjZewfCXq', '160722009', 'shevchenko', 'Informatika', '087855803396', 'shevchenko28', NULL, 0, 'success', 1, 'L', '1658413385_160722009_16584133543957925700273007833155.jpg', 4),
(131, 'louisdevo19@gmail.com', '$2y$10$T7Oa7zFzymi4G/iCxOS0Ke905P8xaRRUc4UPXDPi0II6YhC5DhMOi', '160422077', 'Louis Dewa Voterra', 'Informatika', '085232499399', 'louisdewavt01', NULL, 0, 'unpaid', NULL, NULL, NULL, 0),
(132, 'dustindelroy@gmail.com', '$2y$10$OUp6DeVVTGS..7bqpLOxE.iRfeatpmv2XyEhNT4HB2ofgWZ.vAdeG', '160422138', 'Dustin Delroy', 'Informatika', '085730992999', 'dustin47', NULL, 0, 'success', 1, 'L', '1658416493_160422138_SmartSelect_20220721-221443_BCA mobile.jpg', 4),
(133, 'paulus060202@gmail.com', '$2y$10$HrnoKsAVvgc7pijTMZsNHeFHXwoJE1fe9DFXA4808vpol8Xe5N2Iq', '160421074', 'Paulus Kurnianto Setiawan', 'Informatika', '089653886696', 'pauluskurniantos0602', NULL, 0, 'unpaid', NULL, NULL, NULL, 0),
(134, 'angelayu799@gmail.com', '$2y$10$A.Wdu6rEhJlVGEGT1bw0.ei3LME2iUJOSad5ETgehyfOf2IWNUecS', '160322034', 'Anjelika ayu febriana', 'Industri', '081230055810', 'anjelikaayu', NULL, 0, 'success', 1, 'L', '1658929481_160322034_NRP160322034.jpg', 3),
(135, 'deckyhausyiah1530@gmail.com', '$2y$10$4vVzYJN/rDASP9gWx1Qf0OnbGJymKFO5FWZTHD2DJ5qakF1p8xEz2', '160322011', 'Decky Hausiyah', 'Industri', '081258880778', 'decky.15', NULL, 0, 'success', 1, 'M', '1658925588_160322011_243939.jpg', 2),
(136, 'ersadicki@gmail.com', '$2y$10$47a2GYZS0K7.VbFtNoKmEOhDs.gjWfqcBSiResjX5Lp5MNcMYX0bi', '160722027', 'ersa dicki', 'Informatika', '082231047447', 'ersadwp', NULL, 0, 'unpaid', NULL, NULL, NULL, 0),
(137, 'fx.suhargo@gmail.com', '$2y$10$8Hx2ztRdPqQvbpWY7Epa2ePzUOCOoCLcOl4LEO.X1xKsMbllkCWwG', '160422070', 'Fransiscus Xaverius Petrus Jonathan Suhargo', 'Informatika', '081216510079', 'fx.suhargo', NULL, 0, 'success', 1, 'S', '1658927609_160422070_WhatsApp Image 2022-07-27 at 8.12.50 PM.jpeg', 4),
(138, 'testing@gmail.com', '$2y$10$GDISwf995Sb7oK1wASrc.uB5T.Hvke7mvaIB6Z9DhYy9GhdLLuakK', '123456789', 'jose_testing', 'Informatika', '082212345678', 'testing', NULL, 0, 'pending', 1, 'L', '1658923581_123456789_air support meme.jpg', 0),
(139, 'kdprames24@gmail.com', '$2y$10$fq3vTsI5VnDLQ1bta31AKuTKI67ldK0cKN0qoty2rEbpUezcUnk1K', '160322057', 'Para', 'Industri', '081999084318', 'ebwawawa', NULL, 0, 'success', 1, 'M', '1658925276_160322057_Screenshot_20220727-203410_BCA mobile.jpg', 3),
(140, 'rochelaqilahkorua@gmail.com', '$2y$10$Awnko6GeeW5.iwCkSS2oWurw0PpWOj.Zp.wtVVm1b1ZSStE41tFPy', '160322069', 'Rochel Aqilah Shafa Kheisya Korua', 'Industri', '082151325233', 'terseraah..', NULL, 0, 'success', 2, '4XL', '1658925523_160322069_Screenshot_20220727-193832_Gallery.jpg', 3),
(141, 'havelwildan997@gmail.com', '$2y$10$xKz0TYcCs8oAqv.3Dp4xBuFLr/hnOuo2W6dfCt7/WDTXJhf9cteZG', '160422130', 'Havel Wildan Azmi', 'Informatika', '085933726773', 'hvlwaz', NULL, 0, 'success', 1, '4XL', '1659165464_160422130_IMG-20220730-WA0002.jpg', 3),
(142, 'michaelantolis1205@gmail.com', '$2y$10$hvMw7lfdU.K9nPeZlGsXbeYFmzM5RF6pzck9jOkSo7.8CWBD6f37S', '160422067', 'Michael Febryan Antolis', 'Informatika', '082296373837', 'michaelantolis12', NULL, 0, 'success', 1, 'M', '1659246610_160422067_Screenshot_2022-07-31-12-48-23-281_src.com.bni.jpg', 2),
(143, 'calistaaa04@gmail.com', '$2y$10$QuTYGnBX.lBjxcaCGrRZs.gnZvpVYCGg9viRNIDa/8gUURH60GwdK', '160422151', 'Calista', 'Informatika', '+62895702005649', 'donotkolmewoi', NULL, 0, 'success', 1, 'XXL', '1658979528_160422151_IMG_20220728_103837.jpg', 3),
(144, 'ceciliaingkiriwang@gmail.com', '$2y$10$dRtoKerREB2/sbyjC7De8Orma4h0SeDObsuoTanmIRAFTSqQHv1lK', '160422150', 'Cecilia', 'Informatika', '085657351591', 'cceccilia', NULL, 0, 'success', 1, 'M', '1659094119_160422150_DDB93656-C17B-40FB-ACA1-938B1EE47950.png', 3),
(145, 'handanisanjaya@gmail.com', '$2y$10$5n1G5jzBtxxsnYxE6VPofuq6ePBQLLjietpmh30F13WOT64qxs3Ga', '160422132', 'Handani Sanjaya', 'Informatika', '0895631177720', 'anthonysanjaya', NULL, 0, 'success', 1, 'L', '1659016442_160422132_C115F1B3-993F-4C55-81E7-97353BD341A6.jpeg', 4),
(146, 'johanaongko13@gmail.com', '$2y$10$.Z2D./4pLjsWUVEV.xzty.kAMdnyaSY5GkhHxMOBpifitjYVI2lmi', '160122003', 'Johana Ongko', 'Elektro', '08115401340', 'johanaongko13', NULL, 0, 'success', 1, 'L', '1659001482_160122003_inbound1971537937689472666.jpg', 3),
(147, 'yusrilriziq30@gmail.com', '$2y$10$4H.fj/km6eEJFYuYmiqZ3eKDzkTOklaK0uZXvolxINlB/gxdDEa/y', '160322065', 'Yusril', 'Industri', '081230681141', 'yusrilriziq', NULL, 0, 'success', 1, 'XXL', '1659004864_160322065_IMG_20220728_173742.jpg', 4),
(148, 'justkenny46@gmail.com', '$2y$10$ej15kSXjTSFyT2u5.e7zPeBYfuVYUkvyQaZ0SRxB3NS6hg14tStBC', '160722020', 'KENNY', 'Informatika', '085298630778', 'Kenztrsal', NULL, 0, 'success', 2, 'XL', '1659274571_160722020_20220731_203604.jpg', 2),
(149, 'nobelxzx@gmail.com', '$2y$10$9KI72rJ0jaBf3IQ2G8xSz.DgjeKhr1KK7z7dkDEkQ9H3i4mmPrUnG', '160422135', 'NOBEL HIKMAWAN', 'Informatika', '085730102163', 'n0bel__', NULL, 0, 'success', 1, 'M', '1659010652_160422135_IMG-20220728-WA0014.jpg', 4),
(150, 'evelyntongajaya@gmail.com', '$2y$10$X7o0cq6alvBUahWpHEpNSOM.OUkRmhN..xPcfJTiNRC0uKAcqSZ7C', '160322027', 'evelyn', 'Industri', '085706899919', 'evelyntongajaya', NULL, 0, 'success', 2, 'M', '1659168552_160322027_IMG_20220730_150819.jpg', 2),
(151, 'mcmichael800@gmail.com', '$2y$10$ygM5.vmC0q2Uw6N/pyShp.EbzXf4RRBoFjhvjC849InJtvitAEQye', '160322025', 'Michael Mcfadden', 'Industri', '081260622651', 'mikefadden800', NULL, 0, 'success', 1, 'XXL', '1659005520_160322025_IMG_20220728_175133.jpg', 2),
(152, 'seanandrew337@gmail.com', '$2y$10$NjnqbvPA5CGaLB92UndhS.yIP.6C5xjdfQNuS9.BHvgLJ8qGG4Cei', '160822001', 'sean andrew ristyaputra', 'Informatika', '081247730707', 'loltrooper', NULL, 0, 'success', 1, 'L', '1659009953_160822001_1659009912989.png', 2),
(153, 'nathaniel.glenn21@gmail.com', '$2y$10$vBSyGrncGYb2jzCCzlPY5OnHYIHeEj0r5H//7ClkPM/2KBvKhPo42', '160722001', 'Nathaniel Glenn Hanson', 'Informatika', '089633261212', 'cjz269po57', NULL, 0, 'success', 1, 'L', '1659013163_160722001_WhatsApp Image 2022-07-28 at 19.56.42.jpeg', 1),
(154, 'rclerphael@gmail.com', '$2y$10$THaKyzG2DIjDdIijY89Wc.TeL/ObZdHPGdzfHC/pSvPvvfHybbJXq', '160422080', 'MIRACLE RAPHAEL KHUSUMA', 'Informatika', '082129002690', '180904111', NULL, 0, 'success', 1, 'L', '1659245774_160422080_B5445B32-FCDD-41A3-B880-3029CF178459.png', 2),
(155, 'clarionjkoeswandy@gmail.com', '$2y$10$zDhMuPCaCLT1FfOIA6HmpOg.SsBioK6INvoZg9jCMFcWO8dY/fa5e', '160422063', 'Clarion J Koeswandy', 'Informatika', '082296277979', 'clarionnn', NULL, 0, 'success', 1, 'XXL', '1659094140_160422063_IMG-20220729-WA0009.jpg', 2),
(156, 'lanangrifli9804@gmail.com', '$2y$10$ZFm/YcM1hv5AuGTHn8zdTubjgywdBIgPK6lyK.XkmqgKybZG7GChC', '160422061', 'Lanang Rifli Athallah', 'Informatika', '0895705502118', 'Vgo234', NULL, 0, 'success', 1, 'M', '1659059782_160422061_IMG-20220729-WA0001.jpg', 4),
(157, 'ardhyanzz20@gmail.com', '$2y$10$1ZLyMDFCC7yZKSxvDnt.FObAlOk3DM8xMdd3PEgcZ87TxEtqxMjTG', '160422066', 'Ardhyan Try Putra', 'Informatika', '082234568033', 'ardhyantry', NULL, 0, 'success', 1, 'L', '1659017738_160422066_bukti transfer.jpg', 4),
(158, 'gitaameliac@gmail.com', '$2y$10$sEAiHXMoryBbDxmLbaDZReg.9SXPEGi.IdVCyOFKpxkHJRPI.DVTq', '160322062', 'Gita amelia cuandi', 'Industri', '082291132850', 'gitaameliac', NULL, 0, 'success', 1, 'M', '1659073781_160322062_1466C244-1E99-44B8-B53F-6BEB73904A79.png', 2),
(159, 'kanayakartika2004@gmail.com', '$2y$10$gfHbN9AgX5I5QtbWIRJoJeJKasSzaNl1qmrcaCe7QIGhCYZo/m0We', '160422087', 'Kanaya Kartika Dewi', 'Informatika', '085730793226', 'kanayakartikaa', NULL, 0, 'success', 1, 'L', '1659022102_160422087_IMG-20220728-WA0092.jpg', 3),
(160, 'elizabethputri.tt@gmail.com', '$2y$10$d4Zw0PIA81Ka05iZrZ0sk.Upn/0NSAMmbJSaVYyFl.BExqg86lqbW', '160222006', 'elizabeth', 'Kimia', '0895615266808', 'icazabethh22', NULL, 0, 'success', 2, 'M', '1659025522_160222006_WhatsApp Image 2022-07-28 at 23.24.07.jpeg', 2),
(161, 's160822008@student.ubaya.ac.id', '$2y$10$QDbyJ/FPwCa5ofsI1jdXsukoUiqAC7RaIpdHUSS3jdMKidcywXPTm', '160822008', 'Michelle Angelina', 'Informatika', '081234234390', 'michelle.angelinasa', NULL, 0, 'success', 1, 'S', '1659062438_160822008_Screenshot_2022-07-29-09-38-50-98_f339d16c976c0b263d991820e972fb72.jpg', 3),
(162, 'diodjegaut@gmail.com', '$2y$10$R6FzBhKIc/BnSgiJIO/1p.jJp4jmNmYhGLhVHdKrF2hv0RrQXBgcm', '160122030', 'Dio', 'Elektro', '082145818627', 'diodj012', NULL, 0, 'success', 1, 'L', '1659155815_160122030_IMG-20220730-WA0010.jpg', 1),
(163, 'the4got10rayyandwinugeraha@gmail.com', '$2y$10$HBwOjElYEPUVt4Qc25fTB.w4cBNkPsputWhcUe9RXXlSUNDL9SYg.', '160722043', 'Rayyan Dwi Nugraha', 'Informatika', '082149058109', 'the4got10dwinks', NULL, 0, 'success', 1, 'L', '1659079180_160722043_Screenshot_2022-07-29-14-15-13-856_com.bca.jpg', 1),
(164, 'chindiftk@gmail.com', '$2y$10$CwbAYWPH1FJmjKm2yLEWEeYRab2TOcLWdU6VkSGYjhk3QurG/MDrm', '160322067', 'Chindi Fatika', 'Industri', '0895705801501', 'chindiiiiiii', NULL, 0, 'success', 1, 'S', '1659087981_160322067_Screenshot_20220729-164530_BCA mobile.jpg', 3),
(165, 'hwijaya155@gmail.com', '$2y$10$eoUUGRl/T4G3GCiLLqltYeKzblrqSGfBPEfdEaobu8LfSDnjJYhUO', '160422076', 'Hendra Wijaya', 'Informatika', '0895379931600', '_hendra_155_', NULL, 0, 'success', 1, 'XL', '1659149453_160422076_IMG-20220730-WA0000.jpg', 1),
(166, 'ahmadgilangsetyo@gmail.com', '$2y$10$/p4NDWz6385z.RaXd2zrm.5hyy9uUGJfLyzQtXg/K8aH3pm./fAc6', '160322050', 'ahmad gilang setyo putro', 'Industri', '082140701273', 'ahmadgilang', NULL, 0, 'success', 1, 'L', '1659095298_160322050_IMG-20220729-WA0005.jpg', 3),
(167, 'arielsu40@gmail.com', '$2y$10$cqBJSq1bU.pQ3NCzPmVbh.vqHxAeAKSOhuhpIw9poCl/Wnj6iqSR2', '160222011', 'Ariel sugiono', 'Kimia', '085100592900', 'arielsugiono2', NULL, 0, 'success', 1, 'XL', '1659095900_160222011_inbound5507186309825074773.jpg', 1),
(168, 'evannaufal16@gmail.com', '$2y$10$drjbX.GQrVFYl46QQmmb0O9Cqa7cAlzam//N/s3YXpf4ZZl/dJlbC', '160322073', 'Khansa Evannaufal Raissa Pradana', 'Industri', '085600353053', 'khansaevan', NULL, 0, 'success', 1, 'L', '1659101587_160322073_Screenshot_20220729-203157_blu.jpg', 4),
(169, 'djun.michael@gmail.com', '$2y$10$90JLUzxy6pG6ZyyN3aHknOd2tcYL49DGz5w71Y6w9KbI3Z0eOebC6', '160322024', 'Michael', 'Industri', '082257796198', 'djproxz', NULL, 0, 'success', 1, 'XL', '1659165796_160322024_WhatsApp Image 2022-07-30 at 2.17.41 PM.jpeg', 2),
(170, 'mhdandika0209@gmail.com', '$2y$10$rd1wWbU8wlXYVBhEXxVgquSRu6SJPLJpj4iXf6eEGeMyE04fkTTXe', '160322063', 'MUHAMMAD ANDIKA', 'Industri', '081276910101', 'trevorfranklinmichel', NULL, 0, 'success', 1, 'L', '1659146662_160322063_20220730_090302.jpg', 1),
(171, 'christopher.pengalilla@gmail.com', '$2y$10$n1LuW02VbeZaOdMkYRI1dejX3mqw.xE5LzqJOkNRJtSe42rit2viG', '160422073', 'Christopher', 'Informatika', '082233568206', 'zerox397', NULL, 0, 'success', 1, 'XXL', '1659277424_160422073_Screenshot_20220731_212329.jpg', 4),
(172, 'antoniuskustionop@gmail.com', '$2y$10$08dPXHFVAVE17PKAfVzcj.llk1KAwhoOihPGrEDsJuDmqwLo7.XVq', '160422065', 'Antonius Kustiono Putra', 'Informatika', '081933098324', 'antoniuskp', NULL, 0, 'success', 1, 'L', '1659156413_160422065_Screenshot_2022-07-30-11-46-33-527_com.bca.jpg', 3),
(173, 'alexanderms141@gmail.com', '$2y$10$NI9awk8Hq1EngFEK1WnqDuulkMbjmqcxBlhj2mAwYy2JzPrFNhGO.', '160422052', 'Alexander Matthew Sanjaya', 'Informatika', '081226090286', 'alexanderms141', NULL, 0, 'success', 1, 'XL', '1659110384_160422052_Screenshot_2022-07-29-22-58-17-373_com.bca.jpg', 1),
(174, 'malverickjo12@gmail.com', '$2y$10$GW82aSc/.dN17NmfIz9f/ODQo7Ri3RXO0lzqsdZ0EbksvXS4oDgkG', '160422050', 'Malverick Jocce Tanoto', 'Informatika', '082328728787', 'malverick.jo', NULL, 0, 'success', 1, '3XL', '1659182890_160422050_9E85EBAF-3750-4A84-A013-2C2980BC6073.jpeg', 1),
(175, 'yoxd349@gmail.com', '$2y$10$.WQU7iMRKrqup9diVWtfCOI3pED.qx6Xx5p806smejzAkF8gy.Qd.', '160422107', 'Yovanlie hagai y', 'Informatika', '081335586615', 'yovanlie', NULL, 0, 'success', 1, 'L', '1659111399_160422107_Screenshot_2022-07-29-23-16-22-79_f339d16c976c0b263d991820e972fb72.jpg', 2),
(176, 'ciliadwi12@gmail.com', '$2y$10$GI6ek4x/.Fzv7gZEeRXwguEYLVwmKuhCbrYfX9Fu.Au/RZ9sJStAu', '160422148', 'Cicilia Dwi Palupi', 'Informatika', '+6282280062333', 'cicili_dwi', NULL, 0, 'success', 2, 'S', '1659146117_160422148_Screenshot_2022-07-30-08-54-40-12_f339d16c976c0b263d991820e972fb72.jpg', 3),
(177, 'juankodyleondro14@gmail.com', '$2y$10$J3WgKVLLwi6McY79bj/i8O40Luphm6qGchAQv1HrddAzD66cH.jIK', '160422082', 'Juan Kody Leondro', 'Informatika', '085156278314', 'themaster08', NULL, 0, 'success', 2, 'M', '1659158260_160422082_Screenshot_2022-07-30-12-17-27-370_com.bca.jpg', 2),
(178, 'senaalfa05@gmail.com', '$2y$10$w0QcYavBRf6Al7.ZcWnA3egTFDa1J1fJ5BBMwRBP8etva/XFBJvRG', '160722035', 'Muhammad Avisena Al Taqy', 'Informatika', '081359662535', 'taqy13', NULL, 0, 'success', 1, 'M', '1659270158_160722035_FB904842-2A9E-40D1-A45C-D116F6EA6FB0.png', 1),
(179, 'rianmargen@gmail.com', '$2y$10$56KyBk.TAhk/Lme0LgcHfOxSVpt8MsiIj8p4RU7IPAbpM/sjKD1De', '160222022', 'Christofer Febrian Margen', 'Kimia', '082350533606', 'rianm123', NULL, 0, 'success', 1, 'L', '1659228822_160222022_NRP_160222022.jpg', 1),
(180, 'juliantchundhana@gmail.com', '$2y$10$mQdOtUxXICkrtCZ51kks6uPuFrMfroQz8o9wwRphS8fGCaU1zrnZS', '161022013', 'Juliant', 'Manufaktur', '08115855720', 'juliantc', NULL, 0, 'success', 1, 'M', '1659159436_161022013_Screenshot_20220730-133808_BCA mobile.jpg', 4),
(181, 'dewanbanuyasa25@gmail.com', '$2y$10$xT3RCVgX8h0b3pPcRK4qU./Mw9Pux5MmNb6ztp/YWh0eCgx5wfyPa', '160422145', 'Dewan Banuyasa', 'Informatika', '081916816582', 'banu1903', NULL, 0, 'unpaid', NULL, NULL, NULL, 0),
(182, 'aliyahrheinaa@gmail.com', '$2y$10$hPp9V/c624SkL0gSE.SZl..PDbOXs.JPCATeHhGxd2z0TUPnw858S', '160422091', 'Aliyah Rheina Zifa Maharani', 'Informatika', '085855441191', 'itsmlia', NULL, 0, 'unpaid', NULL, NULL, NULL, 0),
(183, 'aaronshane9@gmail.com', '$2y$10$vRG3viGtbIsDHkXlha70B.2JP4xUVbzed6cMxn.p7p4UmLEOCChmS', '160422034', 'Aaron Shane Candra', 'Informatika', '082132232626', 'aaronshane_01', NULL, 0, 'success', 2, 'XL', '1659161739_160422034_B5AA111D-6704-4D5B-8C44-46B546FD8644.png', 2),
(184, 'sitania.chrisyon@gmail.com', '$2y$10$FMru7nwOqi63QhRbt9HV.u0cgtoXKyAUnr9j9f0TlzXJSen8IHg/y', '160422121', 'Chrisyon Sitania', 'Informatika', '082248920509', 'chrisyonputra', NULL, 0, 'success', 1, 'M', '1659167065_160422121_5B3DEC6F-287B-409A-B92C-CDEC71881612.jpeg', 4),
(185, 'edwinwidigdo35@gmail.com', '$2y$10$3LwuQdJdJZ6pQG61X9SxZOU6kjdLnaKKcQJg4Pf9W8FYpO1g6wONK', '160422058', 'Edwin Raffilio Widigdo', 'Informatika', '081330363461', 'edwin100604', NULL, 0, 'success', 1, 'XXL', '1659167660_160422058_Screenshot_2022-07-30-14-54-02-472_com.bca.jpg', 1),
(186, 'rafaeljulian666@gmail.com', '$2y$10$/1k7H.hC6cjckvNkaht8GuUC/MU.ysXABEIgq85q5nA2GgncRO5y.', '160322048', 'Rafael Julian Sugiarto', 'Industri', '0895710481111', 'rafaeljs44', NULL, 0, 'success', 1, 'L', '1659173250_160322048_Bukti Pembayaran Baju.PNG', 2),
(187, 'mfaiz582@gmail.com', '$2y$10$wi4V0jicmqj7PrQE7YSu8OScs.H4L75UnII6wlIZVEdzXNJsPmL1C', '160422140', 'Nur Muhammad Faiz', 'Informatika', '081338024521', 'theonelumii', NULL, 0, 'success', 1, 'M', '1659175855_160422140_D90BDC2B-291B-4401-806F-4946E14EBF68.jpeg', 3),
(188, 'kevinhw9999@gmail.com', '$2y$10$R1dJ5ztBGDkhf319.Srkb.S.oCsoTMRfinyTe.c0ddwPnwzti4Iyu', '160422134', 'Kevin Hendrawan Wijaya', 'Informatika', '08113072123', 'kevinhw9999', NULL, 0, 'success', 1, 'L', '1659271485_160422134_IMG_20220731_194417.jpg', 2),
(189, 'pedrohariyono961@gmail.com', '$2y$10$MX1irG3hIMdQ0AM5rynF9uA7CkbEjLW/rAqZzBOsGrdNkJ6VbzZxy', '160822006', 'Pedro Hariyono', 'Informatika', '081912600862', 'Dejavumv', NULL, 0, 'success', 1, '3XL', '1659183468_160822006_Screenshot_2022-07-30-19-17-25-42_f339d16c976c0b263d991820e972fb72.jpg', 1),
(190, 'angkurputra@gmail.com', '$2y$10$h9Nzk8lMFM43GolGBFkrpulKbvSj3m7ElMW.soqrEFFiXP4dSguGS', '160322058', 'Leonard Gavin', 'Industri', '082199298205', 'leonardgvn08', NULL, 0, 'success', 1, 'L', '1659196036_160322058_bukti pembayaran baju kaos MOB FT.jpeg', 4);
INSERT INTO `users` (`id`, `email`, `password`, `nrp`, `name`, `jurusan`, `nomor_telpon`, `id_line`, `admin`, `is_reset`, `status`, `rekenings_id`, `ukuran`, `bukti_pembayaran`, `batchs_id`) VALUES
(191, 'anastasyap41@gmail.com', '$2y$10$YhBV6AkFt/QN.NrLuKl.POgr6V515ADkVRUAzRvAFaDSuadupKR6W', '160422078', 'Anastasya Putri M', 'Informatika', '082144360338', 'anastasyaa_mulyani', NULL, 0, 'success', 1, 'M', '1659238682_160422078_inbound8512575802212856302.jpg', 1),
(192, 'elisabetmayaputri8@gmail.com', '$2y$10$QW9DxAuGoqCWK2s1uTrizOyyn9A4/qIHezRbDqY5IePPHGwvDxRAW', '160122031', 'Elisabet Maya Putri', 'Elektro', '081246230168', '171711110404', NULL, 0, 'success', 1, 'S', '1659243680_160022031_4CE9ECE6-FF18-4E04-AF85-C60CFD27153B.jpeg', 1),
(193, 'kevinjoanputratanjung@gmail.com', '$2y$10$sgWYTG9cYVUnaP/igUdm/.vTdl6FoGZez6oOt1wTamrGgKG4rBf.i', '160922014', 'Kevin', 'Informatika', '081339315030', 'ketak2407', NULL, 0, 'success', 1, 'M', '1659243337_160922014_Screenshot_20220731-125526_BCA mobile.jpg', 1),
(194, 'jasmune31@gmail.com', '$2y$10$L6YfBeZUrbn026/egoqqJu3z0F/Tp7mLMAEL0biOcXdqzKhPkh33i', '160322075', 'Mutiara Jasmine Arvinanda', 'Industri', '082228973019', 'raram05', NULL, 0, 'success', 2, 'L', '1659243318_160322075_IMG-20220731-WA0015.jpg', 4),
(195, 'stargohugo@gmail.com', '$2y$10$/1UDJZqaOADMhLZvcifzMegIpTI.NsJqZ1Ub4.BLc1oc9I4jG6ak2', '160422112', 'Hugo Avande', 'Informatika', '081392522935', 'hugo_avande', NULL, 0, 'success', 1, 'M', '1659244429_160422112_IMG-20220731-WA0006[1].jpg', 1),
(196, 'ramacahyane@gmail.com', '$2y$10$B2PNwamr7sEvFJPQZtUVDe9GDfeszQVS0D7nGU03/1osF2NOSYk1W', '160422109', 'Cahyane Rama Wisnu', 'Informatika', '085962362804', '24680156', NULL, 0, 'success', 1, 'XXL', '1659252525_160422109_Screenshot_2022-07-31-14-28-21-53_f339d16c976c0b263d991820e972fb72.jpg', 2),
(197, 'galihlokan@gmail.com', '$2y$10$Uq7wYPVj0.fuv6AJUcw1Xe1D.LNlxkCBJu57uZKcKGXX3bdsngaD6', '160322049', 'Galih Lokantara', 'Industri', '089529964405', 'galihlokantara', NULL, 0, 'success', 1, 'XL', '1659250521_160322049_Screenshot_2022-07-31-13-54-08-93_f339d16c976c0b263d991820e972fb72.jpg', 3),
(198, 'pujianakumalasari365@gmail.com', '$2y$10$GpT7W3M5hcwpYcYsILdFROGG9ZSKo8/RgQ1jpGpXLMba77.iE7Q5u', '12907', 'Pujiana Kumalasari', 'Industri', '089515790378', 'jianthekid', NULL, 0, 'success', 1, 'XL', '1659253716_12907_Screenshot_2022-07-31-14-48-21-430_id.dana.jpg', 1),
(199, 'akhdanaulia4@gmail.com', '$2y$10$S.ruOMbGVwV58N2jaom.lOMebIL7J9Ig2oiIPE4kQMUfw6Odm1yDm', '160122027', 'Akhdan', 'Elektro', '085707579350', 'daniakhdan23', NULL, 0, 'success', 2, 'L', '1659272114_160122027_IMG-20220731-WA0001.jpg', 4),
(200, 'rafiimanggala3@gmail.com', '$2y$10$XE4cbjPoHgJhPBsSHV1tDuNYKqajqm69kA7lI0n6FsTP0.ZNQqSBq', '160422086', 'Rafii manggala japamel', 'Informatika', '081281185321', '..', NULL, 0, 'success', 2, 'XL', '1659266952_160422086_WhatsApp Image 2022-07-31 at 18.28.12.jpeg', 1),
(201, 'amirullahdimas3@gmail.com', '$2y$10$IDXqZCVt.dOVThZBmCbkk.iDLA.2jMDfkUCIp.IaFbAeu3aGMdUae', '12645', 'Dimas Amirullah', 'Informatika', '081357234736', 'dimas_amr', NULL, 0, 'success', 2, 'XL', '1659267367_12645_IMG-20220731-WA0038.jpg', 1),
(202, 'muhammad.ihsan@gmail.com', '$2y$10$Uej.gjfEXJjUb7SP9hkL.euykAwsa9H5c7PkoqQruEXWsUNDQNI8q', '160122032', 'Muhammad Ihsan', 'Elektro', '083141535775', 'Ihsan1001', NULL, 0, 'success', 2, 'XXL', '1659270766_160122032_Screenshot_20220731_203209.jpg', 1),
(203, 'stevanrenwarin@gmail.com', '$2y$10$QD9HnP7POw4JEwdejQPSA.2XlooY19VtEceolWn9oJqOeM844JW0m', '160322059', 'Stevan Wibi', 'Industri', '081270095453', 'stevanwibi', NULL, 0, 'success', 1, 'L', '1659273188_160322059_Screenshot_20220731-201257_Livin\' by Mandiri.jpg', 3),
(204, 'josh.samsung42@gmail.com', '$2y$10$08ZXp2xcsnJY6w.2n8rIgu.xqxLApEdDwIBI1dVSUXVcZYAoi1AMe', '160422085', 'JOSIAS SANADDCHIE CHANDRA', 'Informatika', '082271353855', 'Josh425', NULL, 0, 'unpaid', NULL, NULL, NULL, 0),
(205, 'yongkinatanael22@gmail.com', '$2y$10$RFNF98ZbScRjQvdvCEvF5.XBypXbmB9c6PzyQoLId4gWZaGU6Qnae', '160322045', 'Yongky Natanael', 'Industri', '085889191520', 'Natanael_liem', NULL, 0, 'success', 1, 'XL', '1659274444_160322045_6B0FF88E-AE86-4905-9651-73C4B80A1E14.png', 1),
(206, 'alforjerissusanto@gmail.com', '$2y$10$BW8fTuaOEBjhW3uCpNevTeqFXmBFRkHgtB1LW0MJxXL9tYioTs8YK', '05678', 'Alfor Jeris Susanto', 'Informatika', '081907177771', 'alformen', NULL, 0, 'success', 1, 'L', '1659282158_05678_bukti transaksi baju FT Alfor.jpeg', 4);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

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
