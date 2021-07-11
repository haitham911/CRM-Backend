-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2021 at 06:31 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crm`
--

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `common_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `company_type_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `nip` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regon` char(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `krs` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street_prefix_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `house_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apartment_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip_code` char(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `borough` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `county` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `voivodship` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `web_page` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coordinates_lat` double DEFAULT NULL,
  `coordinates_lng` double DEFAULT NULL,
  `coordinates_checked` tinyint(1) DEFAULT NULL,
  `google_map_place` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_company_id` int(11) DEFAULT NULL,
  `correspondence_street_prefix_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `correspondence_street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `correspondence_house_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `correspondence_apartment_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `correspondence_zip_code` char(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `correspondence_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `correspondence_borough` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `correspondence_county` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `correspondence_voivodship` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_comments`
--

CREATE TABLE `company_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `company_comment_type_id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_comment_types`
--

CREATE TABLE `company_comment_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company_comment_types`
--

INSERT INTO `company_comment_types` (`id`, `name`, `active`, `created_at`, `updated_at`) VALUES
(1, 'egirna', 1, '2020-05-22 03:08:54', '2020-05-22 03:08:54');

-- --------------------------------------------------------

--
-- Table structure for table `company_files`
--

CREATE TABLE `company_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `file` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `file_2` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_types`
--

CREATE TABLE `company_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `code` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company_types`
--

INSERT INTO `company_types` (`id`, `name`, `code`, `active`, `created_at`, `updated_at`) VALUES
(1, 'IT tec', '111', 1, '2020-05-22 03:06:08', '2020-05-22 03:10:49');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_12_27_090000_create_company_comment_types_table', 1),
(4, '2017_12_27_090000_create_company_types_table', 1),
(5, '2017_12_27_090000_create_languages_table', 1),
(6, '2017_12_27_090000_create_permissions_table', 1),
(7, '2017_12_27_090000_create_person_comment_types_table', 1),
(8, '2017_12_27_090000_create_sexes_table', 1),
(9, '2017_12_27_090000_create_street_prefixes_table', 1),
(10, '2017_12_27_090000_create_tasks_table', 1),
(11, '2017_12_27_090001_create_companies_table', 1),
(12, '2017_12_27_090001_create_people_table', 1),
(13, '2017_12_27_090001_create_user_permissions_table', 1),
(14, '2017_12_27_090002_create_company_comments_table', 1),
(15, '2017_12_27_090002_create_company_files_table', 1),
(16, '2017_12_27_090002_create_person_comments_table', 1),
(17, '2017_12_27_090002_create_positions_table', 1),
(18, '2017_12_27_090003_create_position_tasks_table', 1),
(19, '2018_01_22_165725_add_initial_password_column_to_users_table', 1),
(20, '2018_12_01_090003_create_user_types_table', 1),
(21, '2018_12_01_090004_add_user_type_id_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `id` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `distinction` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `language_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `code`, `path`, `active`, `created_at`, `updated_at`) VALUES
(1, 'CRM', 'CRM', 'crm', 1, '2020-05-21 03:44:31', '2020-05-30 03:44:31'),
(2, 'ADMIN', 'ADMIN', 'admin', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `person_comments`
--

CREATE TABLE `person_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `person_id` int(10) UNSIGNED NOT NULL,
  `person_comment_type_id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `person_comment_types`
--

CREATE TABLE `person_comment_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` int(10) UNSIGNED NOT NULL,
  `person_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_3` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `position_tasks`
--

CREATE TABLE `position_tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `position_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sexes`
--

CREATE TABLE `sexes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `code` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `eng_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `eng_code` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `street_prefixes`
--

CREATE TABLE `street_prefixes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `name`, `active`, `created_at`, `updated_at`) VALUES
(1, 'test', 1, '2021-06-20 14:53:22', '2021-06-20 14:53:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `initial_password` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `active`, `created_at`, `updated_at`, `initial_password`, `user_type_id`) VALUES
(1, 'haitham', 'haitham911eg@gmail.com', '$2a$04$I9fvxvu..6j9K/RaFJAExud3ZogtK.UWhvotUYhaqbOO0VAZl6a2e', '12', 1, NULL, NULL, '$2a$04$I9fvxvu..6j9K/RaFJAExud3ZogtK.UWhvotUYhaqbOO0VAZl6a2e', 1),
(2, 'admin', 'admin@admin.com', '$2y$10$7XDvFODAQJyVjwuUEFSWTO.TekRBhGLPju5HAjUVHvoWAfX7iUtHy', NULL, 1, '2021-06-20 15:18:02', '2021-06-20 15:18:02', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`id`, `user_id`, `permission_id`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2020-05-22 03:50:29', NULL),
(2, 1, 2, 1, NULL, NULL),
(3, 2, 1, 1, '2021-06-20 15:18:25', '2021-06-20 15:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `insert` tinyint(1) NOT NULL DEFAULT 1,
  `update` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `admin` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `name`, `read`, `insert`, `update`, `delete`, `admin`, `active`, `created_at`, `updated_at`) VALUES
(1, 'admin', 1, 1, 1, 1, 1, 1, NULL, NULL),
(2, 'admin', 1, 1, 1, 1, 1, 1, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `companies_common_name_unique` (`common_name`),
  ADD KEY `companies_company_type_id_foreign` (`company_type_id`),
  ADD KEY `companies_street_prefix_id_foreign` (`street_prefix_id`),
  ADD KEY `companies_correspondence_street_prefix_id_foreign` (`correspondence_street_prefix_id`);

--
-- Indexes for table `company_comments`
--
ALTER TABLE `company_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_comments_user_id_foreign` (`user_id`),
  ADD KEY `company_comments_company_id_foreign` (`company_id`),
  ADD KEY `company_comments_company_comment_type_id_foreign` (`company_comment_type_id`);

--
-- Indexes for table `company_comment_types`
--
ALTER TABLE `company_comment_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_comment_types_name_unique` (`name`);

--
-- Indexes for table `company_files`
--
ALTER TABLE `company_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_files_company_id_foreign` (`company_id`);

--
-- Indexes for table `company_types`
--
ALTER TABLE `company_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_types_name_unique` (`name`),
  ADD UNIQUE KEY `company_types_code_unique` (`code`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_name_unique` (`name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `people_firstname_lastname_distinction_unique` (`firstname`,`lastname`,`distinction`),
  ADD KEY `people_sex_id_foreign` (`sex_id`),
  ADD KEY `people_language_id_foreign` (`language_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`),
  ADD UNIQUE KEY `permissions_code_unique` (`code`),
  ADD UNIQUE KEY `permissions_path_unique` (`path`);

--
-- Indexes for table `person_comments`
--
ALTER TABLE `person_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_comments_user_id_foreign` (`user_id`),
  ADD KEY `person_comments_person_id_foreign` (`person_id`),
  ADD KEY `person_comments_person_comment_type_id_foreign` (`person_comment_type_id`);

--
-- Indexes for table `person_comment_types`
--
ALTER TABLE `person_comment_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `person_comment_types_name_unique` (`name`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `positions_person_id_foreign` (`person_id`),
  ADD KEY `positions_company_id_foreign` (`company_id`);

--
-- Indexes for table `position_tasks`
--
ALTER TABLE `position_tasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `position_tasks_position_id_task_id_unique` (`position_id`,`task_id`),
  ADD KEY `position_tasks_task_id_foreign` (`task_id`);

--
-- Indexes for table `sexes`
--
ALTER TABLE `sexes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sexes_name_unique` (`name`),
  ADD UNIQUE KEY `sexes_code_unique` (`code`),
  ADD UNIQUE KEY `sexes_eng_name_unique` (`eng_name`),
  ADD UNIQUE KEY `sexes_eng_code_unique` (`eng_code`);

--
-- Indexes for table `street_prefixes`
--
ALTER TABLE `street_prefixes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `street_prefixes_name_unique` (`name`),
  ADD UNIQUE KEY `street_prefixes_description_unique` (`description`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tasks_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_user_type_id_foreign` (`user_type_id`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_permissions_user_id_permission_id_unique` (`user_id`,`permission_id`),
  ADD KEY `user_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `company_comments`
--
ALTER TABLE `company_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_comment_types`
--
ALTER TABLE `company_comment_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company_files`
--
ALTER TABLE `company_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_types`
--
ALTER TABLE `company_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `person_comments`
--
ALTER TABLE `person_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `person_comment_types`
--
ALTER TABLE `person_comment_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `position_tasks`
--
ALTER TABLE `position_tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sexes`
--
ALTER TABLE `sexes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `street_prefixes`
--
ALTER TABLE `street_prefixes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_company_type_id_foreign` FOREIGN KEY (`company_type_id`) REFERENCES `company_types` (`id`),
  ADD CONSTRAINT `companies_correspondence_street_prefix_id_foreign` FOREIGN KEY (`correspondence_street_prefix_id`) REFERENCES `street_prefixes` (`id`),
  ADD CONSTRAINT `companies_street_prefix_id_foreign` FOREIGN KEY (`street_prefix_id`) REFERENCES `street_prefixes` (`id`);

--
-- Constraints for table `company_comments`
--
ALTER TABLE `company_comments`
  ADD CONSTRAINT `company_comments_company_comment_type_id_foreign` FOREIGN KEY (`company_comment_type_id`) REFERENCES `company_comment_types` (`id`),
  ADD CONSTRAINT `company_comments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `company_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `company_files`
--
ALTER TABLE `company_files`
  ADD CONSTRAINT `company_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `people`
--
ALTER TABLE `people`
  ADD CONSTRAINT `people_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  ADD CONSTRAINT `people_sex_id_foreign` FOREIGN KEY (`sex_id`) REFERENCES `sexes` (`id`);

--
-- Constraints for table `person_comments`
--
ALTER TABLE `person_comments`
  ADD CONSTRAINT `person_comments_person_comment_type_id_foreign` FOREIGN KEY (`person_comment_type_id`) REFERENCES `person_comment_types` (`id`),
  ADD CONSTRAINT `person_comments_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `person_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `positions`
--
ALTER TABLE `positions`
  ADD CONSTRAINT `positions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `positions_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`);

--
-- Constraints for table `position_tasks`
--
ALTER TABLE `position_tasks`
  ADD CONSTRAINT `position_tasks_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`),
  ADD CONSTRAINT `position_tasks_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_user_type_id_foreign` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`);

--
-- Constraints for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD CONSTRAINT `user_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `user_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
