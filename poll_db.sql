-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 02, 2021 at 01:14 AM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poll_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2021_10_30_032410_create_polls_table', 1),
(3, '2021_10_30_032436_create_options_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `poll_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`option_id`, `option_description`, `qty`, `poll_id`, `created_at`, `updated_at`) VALUES
(3, 'Option 1', 4, 2, '2021-11-02 04:06:28', '2021-11-02 04:12:09'),
(4, 'Option 2', 2, 2, '2021-11-02 04:06:28', '2021-11-02 04:12:07'),
(5, 'Option 3', 1, 2, '2021-11-02 04:06:28', '2021-11-02 04:12:02'),
(6, 'Option 4', 0, 3, '2021-11-02 04:07:27', '2021-11-02 04:07:27'),
(7, 'Option5', 0, 3, '2021-11-02 04:07:27', '2021-11-02 04:07:27'),
(8, 'Option6', 0, 3, '2021-11-02 04:07:27', '2021-11-02 04:07:27'),
(9, 'Option 7', 0, 3, '2021-11-02 04:07:27', '2021-11-02 04:07:27'),
(10, 'Option 1', 0, 4, '2021-11-02 04:07:48', '2021-11-02 04:07:48'),
(11, 'Option 2', 0, 4, '2021-11-02 04:07:48', '2021-11-02 04:07:48'),
(12, 'Option 8', 0, 5, '2021-11-02 04:08:24', '2021-11-02 04:08:24'),
(13, 'Option 9', 0, 5, '2021-11-02 04:08:24', '2021-11-02 04:08:24'),
(14, 'Option 10', 0, 5, '2021-11-02 04:08:24', '2021-11-02 04:08:24'),
(15, 'Option 10', 0, 6, '2021-11-02 04:09:12', '2021-11-02 04:09:12'),
(16, 'Option 11', 0, 6, '2021-11-02 04:09:12', '2021-11-02 04:09:12'),
(17, 'Option 12', 0, 7, '2021-11-02 04:09:39', '2021-11-02 04:09:39'),
(18, 'Option 13', 0, 7, '2021-11-02 04:09:39', '2021-11-02 04:09:39'),
(19, 'Option 14', 0, 7, '2021-11-02 04:09:39', '2021-11-02 04:09:39'),
(20, 'Option 17', 0, 8, '2021-11-02 04:10:20', '2021-11-02 04:10:20'),
(21, 'Option 18', 0, 8, '2021-11-02 04:10:20', '2021-11-02 04:10:20'),
(22, 'Option 19', 0, 8, '2021-11-02 04:10:20', '2021-11-02 04:10:20'),
(23, 'Option 20', 0, 8, '2021-11-02 04:10:20', '2021-11-02 04:10:20');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `polls`
--

CREATE TABLE `polls` (
  `poll_id` bigint(20) UNSIGNED NOT NULL,
  `poll_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `polls`
--

INSERT INTO `polls` (`poll_id`, `poll_description`, `views`, `created_at`, `updated_at`) VALUES
(2, 'Poll 1', 10, '2021-11-02 04:06:28', '2021-11-02 04:12:10'),
(3, 'Poll 2', 0, '2021-11-02 04:07:27', '2021-11-02 04:07:27'),
(4, 'Poll 3', 2, '2021-11-02 04:07:48', '2021-11-02 04:07:53'),
(5, 'Poll 4', 0, '2021-11-02 04:08:24', '2021-11-02 04:08:24'),
(6, 'Poll 5', 0, '2021-11-02 04:09:12', '2021-11-02 04:09:12'),
(7, 'Poll 6', 0, '2021-11-02 04:09:39', '2021-11-02 04:09:39'),
(8, 'Poll 7', 1, '2021-11-02 04:10:20', '2021-11-02 04:10:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `options_poll_id_foreign` (`poll_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `polls`
--
ALTER TABLE `polls`
  ADD PRIMARY KEY (`poll_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `polls`
--
ALTER TABLE `polls`
  MODIFY `poll_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_poll_id_foreign` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`poll_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
