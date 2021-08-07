-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Agu 2021 pada 09.07
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cuanku_backend`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tokenfcms`
--

DROP TABLE IF EXISTS `tokenfcms`;
CREATE TABLE `tokenfcms` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tokenfcms`
--

INSERT INTO `tokenfcms` (`id`, `userId`, `token`, `createdAt`, `updatedAt`) VALUES
(5, 19, 'e3hb7QwpRvG3ngj_GngK_L:APA91bGKcsExWUsjsr9A4NgTzBDO_MNcbDOqZWUc-XowhmGzRGj-LGUZDKO6cYfD0dZSgYTEXhLEdwSBoSucQI3BT4r8S3HkIZicWgOIp6O13YFll7gAmiwMdguUr260ScyaLEydSFOP', '2021-07-21 10:30:18', '2021-07-21 10:53:10'),
(6, 14, 'eb6EN0qxRMiIaYNENduogV:APA91bFGQGTRnczDjCrclayCjB3ZxMcX34hLMzy9qtJhMsfdkVW52OebQXxUaAp34hidhWnnrIVNAoHAhYFWhuYONQp5RE2rnY27oP9oYe9C-DyrXJLDqfWYotGWDB3MRVs382gLHxxY', '2021-07-21 13:20:28', '2021-07-21 13:28:32'),
(7, 18, 'e_Z23kJiSlSZXCW9mFNfZg:APA91bEx-Vj0yF79N5WBc13vP7lQ8JyS-RE3FHV6JT7SCgj-THiwsKoatVM1X7Ni_-lppuRqTX4jkHTiyLIV5NTFbDomJ2C3S5TyG9MS3PpTVy3MGaOfE8A-mLnY48VeYyqUxi92BaJI', '2021-07-24 14:28:56', '2021-07-31 03:14:41'),
(8, 27, 'eojM9t9iQDWCOx9zIP8pYb:APA91bEOhNEOhY1iZInEkoDtY-eAGgG6BBGYdTCHacZXseqi4fim1EqmSmgzAGUcbHFlkvrUycryUWeyuczwGjUUPGUaRm5G_u3YxY3sqtB4gUEqS7nrxfrl7m9Z2Hq34g2S2CcKNWJu', '2021-08-05 13:12:12', '2021-08-06 13:37:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `refNo` varchar(255) DEFAULT NULL,
  `phoneRecipient` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `userId`, `refNo`, `phoneRecipient`, `amount`, `description`, `createdAt`, `updatedAt`) VALUES
(1, 18, '1626776481639', '085266724523', 2500, 'Top up balance', '2021-07-20 10:21:21', '2021-07-20 10:21:21'),
(2, 18, '1626776873523', '089636597045', 100000, 'Transfer balance', '2021-07-20 10:27:53', '2021-07-20 10:27:53'),
(3, 18, '1626777365809', '089636597045', 12000, 'Mobile topup', '2021-07-20 10:36:05', '2021-07-20 10:36:05'),
(4, 18, '1626777504952', '085266724523', 300000, 'Top up balance', '2021-07-20 10:38:24', '2021-07-20 10:38:24'),
(5, 18, '1626777531629', '089636597045', 10000, 'Transfer balance', '2021-07-20 10:38:51', '2021-07-20 10:38:51'),
(6, 18, '1626778011176', '089636597045', 12000, 'Mobile topup', '2021-07-20 10:46:51', '2021-07-20 10:46:51'),
(7, 18, '1626778012397', '089636597045', 12000, 'Mobile topup', '2021-07-20 10:46:52', '2021-07-20 10:46:52'),
(8, 18, '1626778013430', '089636597045', 12000, 'Mobile topup', '2021-07-20 10:46:53', '2021-07-20 10:46:53'),
(9, 18, '1626778016158', '089636597045', 100000, 'Transfer balance', '2021-07-20 10:46:56', '2021-07-20 10:46:56'),
(10, 18, '1626778016946', '089636597045', 100000, 'Transfer balance', '2021-07-20 10:46:56', '2021-07-20 10:46:56'),
(11, 18, '1626778017689', '089636597045', 100000, 'Transfer balance', '2021-07-20 10:46:57', '2021-07-20 10:46:57'),
(12, 18, '1626778018589', '089636597045', 100000, 'Transfer balance', '2021-07-20 10:46:58', '2021-07-20 10:46:58'),
(13, 18, '1626778021403', '085266724523', 2500, 'Top up balance', '2021-07-20 10:47:01', '2021-07-20 10:47:01'),
(14, 18, '1626778022040', '085266724523', 2500, 'Top up balance', '2021-07-20 10:47:02', '2021-07-20 10:47:02'),
(15, 18, '1626778022644', '085266724523', 2500, 'Top up balance', '2021-07-20 10:47:02', '2021-07-20 10:47:02'),
(16, 18, '1626778023130', '085266724523', 2500, 'Top up balance', '2021-07-20 10:47:03', '2021-07-20 10:47:03'),
(17, 18, '1626779403497', '089636597045', 3200, 'Transfer balance', '2021-07-20 11:10:03', '2021-07-20 11:10:03'),
(18, 18, '1626779544842', '085266724523', 10000, 'Top up balance', '2021-07-20 11:12:24', '2021-07-20 11:12:24'),
(19, 18, '1626780221557', '089636597045', 12000, 'Mobile topup', '2021-07-20 11:23:41', '2021-07-20 11:23:41'),
(20, 18, '1626780329062', '1205458465', 25000, 'Mobile topup', '2021-07-20 11:25:29', '2021-07-20 11:25:29'),
(21, 18, '1626858160423', '089636597045', 10000, 'Transfer balance', '2021-07-21 09:02:40', '2021-07-21 09:02:40'),
(22, 18, '1626858225372', '089636597045', 10000, 'Transfer balance', '2021-07-21 09:03:45', '2021-07-21 09:03:45'),
(23, 18, '1626858317558', '089636597045', 10000, 'Transfer balance', '2021-07-21 09:05:17', '2021-07-21 09:05:17'),
(24, 18, '1626858439208', '089636597045', 10000, 'Transfer balance', '2021-07-21 09:07:19', '2021-07-21 09:07:19'),
(25, 18, '1626858440170', '089636597045', 10000, 'Transfer balance', '2021-07-21 09:07:20', '2021-07-21 09:07:20'),
(26, 18, '1626858441137', '089636597045', 10000, 'Transfer balance', '2021-07-21 09:07:21', '2021-07-21 09:07:21'),
(27, 18, '1626863493851', '089636597045', 10000, 'Transfer balance', '2021-07-21 10:31:33', '2021-07-21 10:31:33'),
(28, 18, '1626863748541', '089636597045', 10000, 'Transfer balance', '2021-07-21 10:35:48', '2021-07-21 10:35:48'),
(29, 18, '1626863977513', '089636597045', 10000, 'Transfer balance', '2021-07-21 10:39:37', '2021-07-21 10:39:37'),
(30, 18, '1626863988960', '089636597045', 10000, 'Transfer balance', '2021-07-21 10:39:48', '2021-07-21 10:39:48'),
(31, 18, '1626864008706', '089636597045', 10000, 'Transfer balance', '2021-07-21 10:40:08', '2021-07-21 10:40:08'),
(32, 18, '1626864083903', '089636597045', 10000, 'Transfer balance', '2021-07-21 10:41:23', '2021-07-21 10:41:23'),
(33, 18, '1626864422723', '089636597045', 10000, 'Transfer balance', '2021-07-21 10:47:02', '2021-07-21 10:47:02'),
(34, 18, '1626864505369', '085266724523', 500000, 'Top up balance', '2021-07-21 10:48:25', '2021-07-21 10:48:25'),
(35, 18, '1626864510519', '089636597045', 10000, 'Transfer balance', '2021-07-21 10:48:30', '2021-07-21 10:48:30'),
(36, 18, '1626864554682', '089636597045', 10000, 'Transfer balance', '2021-07-21 10:49:14', '2021-07-21 10:49:14'),
(37, 14, '1626864573018', '089636597045', 300000, 'Top up balance', '2021-07-21 10:49:33', '2021-07-21 10:49:33'),
(38, 18, '1626864594650', '085266724523', 500000, 'Top up balance', '2021-07-21 10:49:54', '2021-07-21 10:49:54'),
(39, 18, '1626864621076', '089636597045', 25000, 'Transfer balance', '2021-07-21 10:50:21', '2021-07-21 10:50:21'),
(40, 19, '1626865191683', '085266724522', 300000, 'Top up balance', '2021-07-21 10:59:51', '2021-07-21 10:59:51'),
(41, 19, '1626865218822', '089636597045', 25000, 'Transfer balance', '2021-07-21 11:00:18', '2021-07-21 11:00:18'),
(42, 18, '1626873658189', '085266724523', 10000, 'Top up balance', '2021-07-21 13:20:58', '2021-07-21 13:20:58'),
(43, 20, '1626873854256', '089636597044', 300000, 'Top up balance', '2021-07-21 13:24:14', '2021-07-21 13:24:14'),
(44, 14, '1626875306363', '089636597045', 10000, 'Top up balance', '2021-07-21 13:48:26', '2021-07-21 13:48:26'),
(45, 14, '1627573107597', '089636597045', 10000, 'Top up balance', '2021-07-29 15:38:27', '2021-07-29 15:38:27'),
(46, 25, '1628169151256', '089636597046', 500000, 'Top up balance', '2021-08-05 13:12:31', '2021-08-05 13:12:31'),
(47, 25, '1628169245050', '089636597046', 25000, 'Mobile topup', '2021-08-05 13:14:05', '2021-08-05 13:14:05'),
(48, 25, '1628169987964', '089636597046', 10000, 'Top up balance', '2021-08-05 13:26:27', '2021-08-05 13:26:27'),
(52, 25, '1628171471635', '089636597046', 1000, 'Top up balance', '2021-08-05 13:51:11', '2021-08-05 13:51:11'),
(60, 25, '1628171901273', '089636597045', 1000, 'Transfer balance', '2021-08-05 13:58:21', '2021-08-05 13:58:21'),
(61, 14, '1628172105675', '089636597046', 12000, 'Transfer balance', '2021-08-05 14:01:45', '2021-08-05 14:01:45'),
(62, 14, '1628172220471', '089636597045', 500000, 'Top up balance', '2021-08-05 14:03:40', '2021-08-05 14:03:40'),
(63, 14, '1628172222152', '089636597045', 500000, 'Top up balance', '2021-08-05 14:03:42', '2021-08-05 14:03:42'),
(64, 14, '1628172222888', '089636597045', 500000, 'Top up balance', '2021-08-05 14:03:42', '2021-08-05 14:03:42'),
(65, 14, '1628172223666', '089636597045', 500000, 'Top up balance', '2021-08-05 14:03:43', '2021-08-05 14:03:43'),
(66, 14, '1628172224340', '089636597045', 500000, 'Top up balance', '2021-08-05 14:03:44', '2021-08-05 14:03:44'),
(67, 14, '1628172225057', '089636597045', 500000, 'Top up balance', '2021-08-05 14:03:45', '2021-08-05 14:03:45'),
(68, 25, '1628175500014', '089636597045', 25000, 'Transfer balance', '2021-08-05 14:58:20', '2021-08-05 14:58:20'),
(69, 25, '1628217163468', '089636597046', 100000, 'Top up balance', '2021-08-06 02:32:43', '2021-08-06 02:32:43'),
(70, 25, '1628217188327', '085266724522', 50000, 'Mobile topup', '2021-08-06 02:33:08', '2021-08-06 02:33:08'),
(71, 25, '1628217215524', '085266724522', 1000, 'Transfer balance', '2021-08-06 02:33:35', '2021-08-06 02:33:35'),
(72, 14, '1628217442243', '089636597045', NULL, 'Top up balance', '2021-08-06 02:37:22', '2021-08-06 02:37:22'),
(73, 14, '1628217509945', '089636597046', 25000, 'Transfer balance', '2021-08-06 02:38:29', '2021-08-06 02:38:29'),
(74, 27, '1628221698734', '089636597043', 25000, 'Top up balance', '2021-08-06 03:48:18', '2021-08-06 03:48:18'),
(75, 27, '1628221729666', '089636597045', 10000, 'Mobile topup', '2021-08-06 03:48:49', '2021-08-06 03:48:49'),
(76, 27, '1628221763459', '089636597045', 1000, 'Transfer balance', '2021-08-06 03:49:23', '2021-08-06 03:49:23'),
(77, 14, '1628221866452', '089636597043', 25000, 'Transfer balance', '2021-08-06 03:51:06', '2021-08-06 03:51:06'),
(78, 14, '1628222406151', '089636597043', 25000, 'Transfer balance', '2021-08-06 04:00:06', '2021-08-06 04:00:06'),
(79, 27, '1628222467922', '089636597043', 10000, 'Top up balance', '2021-08-06 04:01:07', '2021-08-06 04:01:07'),
(80, 27, '1628222477079', '089636597043', 10000, 'Top up balance', '2021-08-06 04:01:17', '2021-08-06 04:01:17'),
(81, 27, '1628222482978', '089636597043', 10000, 'Top up balance', '2021-08-06 04:01:22', '2021-08-06 04:01:22'),
(82, 27, '1628222488290', '089636597043', 10000, 'Top up balance', '2021-08-06 04:01:28', '2021-08-06 04:01:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'General',
  `email` varchar(255) DEFAULT NULL,
  `pin` varchar(255) DEFAULT NULL,
  `balance` int(11) DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `role`, `email`, `pin`, `balance`, `name`, `phone`, `picture`, `createdAt`, `updatedAt`) VALUES
(14, 'General', 'coba1@gmail.com', '$2b$10$w8aAVrBf2cYdhA4L36MrWO6ITPa.0sZED6E54WdysasynjEmpAkNa', 5491201, 'akun coba 1', '089636597045', '/upload/1627573260859.jpg', '2021-07-19 12:18:41', '2021-08-06 04:00:06'),
(18, 'General', 'fiqry@gmail.com', '$2b$10$jC3LwF5D5/QGWCs01tvQM.MnwZpc8MLC4VeDMO6CYfai//uTuoosq', 968000, 'coba2', '085266724523', '/upload/1626770127428.jpg', '2021-07-19 13:32:58', '2021-07-21 13:20:58'),
(19, 'General', 'Coba@gmail.com', '$2b$10$6Q4RbabrK30XTYNuFqp0muqXKEy5Ex2fNfJSy556phD7NLOadiUx.', 276000, 'Cobaoo', '085266724522', '/upload/1626865379397.jpg', '2021-07-21 10:52:52', '2021-08-06 02:33:35'),
(20, 'General', 'coba99@gmail.com', '$2b$10$p4Hze6KlbQh6JM7QvEYAfuQHG1vm6.F5OS8qOk/TePDSPAfv4Bveu', 300000, 'coba', '089636597044', NULL, '2021-07-21 13:22:37', '2021-07-21 13:24:14'),
(25, 'General', 'muhamfiqry@gmail.com', '$2b$10$YgUgQQmMEg/G8TkFwZ3l/.0cRGh1HiugFip9xCxSoU1ki6yqTCZby', 546000, 'muham fiqry ', '089636597046', '/upload/1628169217063.jpg', '2021-08-05 13:12:01', '2021-08-06 02:38:30'),
(26, 'General', 'fiqry@gmail.com', '$2b$10$85PqKYxImdT0QReUTVGuieJWg8ZbDBJ7UZR9jZSIBhE9rBNR.Wy06', 0, 'fiqry', '089646597044', NULL, '2021-08-06 03:46:48', '2021-08-06 03:46:48'),
(27, 'General', 'fiqry1@gmail.com', '$2b$10$o2fcDbJA4JcKsrdjwE7rM.Bnshsp7K4hAoo3UN2XOCxzM92jwPR.u', 104000, 'fiqry', '089636597043', '/upload/1628252237804.jpg', '2021-08-06 03:47:34', '2021-08-06 13:39:12');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tokenfcms`
--
ALTER TABLE `tokenfcms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tokenfcms`
--
ALTER TABLE `tokenfcms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tokenfcms`
--
ALTER TABLE `tokenfcms`
  ADD CONSTRAINT `tokenfcms_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
