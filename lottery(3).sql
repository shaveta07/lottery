-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 20, 2021 at 11:08 AM
-- Server version: 8.0.23-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lottery`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int NOT NULL,
  `race_id` int NOT NULL DEFAULT '0',
  `carname` varchar(50) DEFAULT NULL COMMENT 'carName is carnumber',
  `model` varchar(50) NOT NULL DEFAULT '',
  `maker` varchar(50) NOT NULL DEFAULT '',
  `color` varchar(50) NOT NULL DEFAULT '',
  `photo` varchar(400) NOT NULL DEFAULT '',
  `status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'open',
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `race_id`, `carname`, `model`, `maker`, `color`, `photo`, `status`, `description`, `created_at`) VALUES
(6, 3, 'pb65T4491', 'VXI', 'Maruti', 'whitecolor', 'public/cars/q5.jpg', 'open', 'Suspendisse quos? Tempus cras iure temporibus? Eu laudantium cubilia sem sem! Repudiandae et! Massa senectus enim minim sociosqu delectus posuere.', '2020-09-29 09:39:51'),
(7, 3, 'XF14524', 'Q3', 'AUDI', 'red', '', '', 'Suspendisse quos? Tempus cras iure temporibus? Eu laudantium cubilia sem sem! Repudiandae et! Massa senectus enim minim so', '2020-09-29 09:39:51'),
(8, 3, 'XF78658', 'Q5', 'AUDI', 'black', '', '', '', '2020-09-29 09:39:51'),
(9, 5, 'test', 'test', 'test', 'whitegreenyellow', '', 'open', NULL, '2020-10-29 01:12:20'),
(10, 5, 'test2', 'test2', 'test2', 'testingdata', '', 'open', NULL, '2020-10-29 01:13:12'),
(11, 6, 'xyz1', 'xyz', 'xyz', 'dfffdgdgg', 'public/cars/logo-fold.png', 'open', 'fddgdfgdg gfdgfdgdg', '2020-10-29 07:03:46');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int NOT NULL,
  `code` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'Afghanistan', 1, NULL, NULL),
(2, 'AL', 'Albania', 1, NULL, NULL),
(3, 'DZ', 'Algeria', 1, NULL, NULL),
(4, 'DS', 'American Samoa', 1, NULL, NULL),
(5, 'AD', 'Andorra', 1, NULL, NULL),
(6, 'AO', 'Angola', 1, NULL, NULL),
(7, 'AI', 'Anguilla', 1, NULL, NULL),
(8, 'AQ', 'Antarctica', 1, NULL, NULL),
(9, 'AG', 'Antigua and Barbuda', 1, NULL, NULL),
(10, 'AR', 'Argentina', 1, NULL, NULL),
(11, 'AM', 'Armenia', 1, NULL, NULL),
(12, 'AW', 'Aruba', 1, NULL, NULL),
(13, 'AU', 'Australia', 1, NULL, NULL),
(14, 'AT', 'Austria', 1, NULL, NULL),
(15, 'AZ', 'Azerbaijan', 1, NULL, NULL),
(16, 'BS', 'Bahamas', 1, NULL, NULL),
(17, 'BH', 'Bahrain', 1, NULL, NULL),
(18, 'BD', 'Bangladesh', 1, NULL, NULL),
(19, 'BB', 'Barbados', 1, NULL, NULL),
(20, 'BY', 'Belarus', 1, NULL, NULL),
(21, 'BE', 'Belgium', 1, NULL, NULL),
(22, 'BZ', 'Belize', 1, NULL, NULL),
(23, 'BJ', 'Benin', 1, NULL, NULL),
(24, 'BM', 'Bermuda', 1, NULL, NULL),
(25, 'BT', 'Bhutan', 1, NULL, NULL),
(26, 'BO', 'Bolivia', 1, NULL, NULL),
(27, 'BA', 'Bosnia and Herzegovina', 1, NULL, NULL),
(28, 'BW', 'Botswana', 1, NULL, NULL),
(29, 'BV', 'Bouvet Island', 1, NULL, NULL),
(30, 'BR', 'Brazil', 1, NULL, NULL),
(31, 'IO', 'British Indian Ocean Territory', 1, NULL, NULL),
(32, 'BN', 'Brunei Darussalam', 1, NULL, NULL),
(33, 'BG', 'Bulgaria', 1, NULL, NULL),
(34, 'BF', 'Burkina Faso', 1, NULL, NULL),
(35, 'BI', 'Burundi', 1, NULL, NULL),
(36, 'KH', 'Cambodia', 1, NULL, NULL),
(37, 'CM', 'Cameroon', 1, NULL, NULL),
(38, 'CA', 'Canada', 1, NULL, NULL),
(39, 'CV', 'Cape Verde', 1, NULL, NULL),
(40, 'KY', 'Cayman Islands', 1, NULL, NULL),
(41, 'CF', 'Central African Republic', 1, NULL, NULL),
(42, 'TD', 'Chad', 1, NULL, NULL),
(43, 'CL', 'Chile', 1, NULL, NULL),
(44, 'CN', 'China', 1, NULL, NULL),
(45, 'CX', 'Christmas Island', 1, NULL, NULL),
(46, 'CC', 'Cocos (Keeling) Islands', 1, NULL, NULL),
(47, 'CO', 'Colombia', 1, NULL, NULL),
(48, 'KM', 'Comoros', 1, NULL, NULL),
(49, 'CG', 'Congo', 1, NULL, NULL),
(50, 'CK', 'Cook Islands', 1, NULL, NULL),
(51, 'CR', 'Costa Rica', 1, NULL, NULL),
(52, 'HR', 'Croatia (Hrvatska)', 1, NULL, NULL),
(53, 'CU', 'Cuba', 1, NULL, NULL),
(54, 'CY', 'Cyprus', 1, NULL, NULL),
(55, 'CZ', 'Czech Republic', 1, NULL, NULL),
(56, 'DK', 'Denmark', 1, NULL, NULL),
(57, 'DJ', 'Djibouti', 1, NULL, NULL),
(58, 'DM', 'Dominica', 1, NULL, NULL),
(59, 'DO', 'Dominican Republic', 1, NULL, NULL),
(60, 'TP', 'East Timor', 1, NULL, NULL),
(61, 'EC', 'Ecuador', 1, NULL, NULL),
(62, 'EG', 'Egypt', 1, NULL, NULL),
(63, 'SV', 'El Salvador', 1, NULL, NULL),
(64, 'GQ', 'Equatorial Guinea', 1, NULL, NULL),
(65, 'ER', 'Eritrea', 1, NULL, NULL),
(66, 'EE', 'Estonia', 1, NULL, NULL),
(67, 'ET', 'Ethiopia', 1, NULL, NULL),
(68, 'FK', 'Falkland Islands (Malvinas)', 1, NULL, NULL),
(69, 'FO', 'Faroe Islands', 1, NULL, NULL),
(70, 'FJ', 'Fiji', 1, NULL, NULL),
(71, 'FI', 'Finland', 1, NULL, NULL),
(72, 'FR', 'France', 1, NULL, NULL),
(73, 'FX', 'France, Metropolitan', 1, NULL, NULL),
(74, 'GF', 'French Guiana', 1, NULL, NULL),
(75, 'PF', 'French Polynesia', 1, NULL, NULL),
(76, 'TF', 'French Southern Territories', 1, NULL, NULL),
(77, 'GA', 'Gabon', 1, NULL, NULL),
(78, 'GM', 'Gambia', 1, NULL, NULL),
(79, 'GE', 'Georgia', 1, NULL, NULL),
(80, 'DE', 'Germany', 1, NULL, NULL),
(81, 'GH', 'Ghana', 1, NULL, NULL),
(82, 'GI', 'Gibraltar', 1, NULL, NULL),
(83, 'GK', 'Guernsey', 1, NULL, NULL),
(84, 'GR', 'Greece', 1, NULL, NULL),
(85, 'GL', 'Greenland', 1, NULL, NULL),
(86, 'GD', 'Grenada', 1, NULL, NULL),
(87, 'GP', 'Guadeloupe', 1, NULL, NULL),
(88, 'GU', 'Guam', 1, NULL, NULL),
(89, 'GT', 'Guatemala', 1, NULL, NULL),
(90, 'GN', 'Guinea', 1, NULL, NULL),
(91, 'GW', 'Guinea-Bissau', 1, NULL, NULL),
(92, 'GY', 'Guyana', 1, NULL, NULL),
(93, 'HT', 'Haiti', 1, NULL, NULL),
(94, 'HM', 'Heard and Mc Donald Islands', 1, NULL, NULL),
(95, 'HN', 'Honduras', 1, NULL, NULL),
(96, 'HK', 'Hong Kong', 1, NULL, NULL),
(97, 'HU', 'Hungary', 1, NULL, NULL),
(98, 'IS', 'Iceland', 1, NULL, NULL),
(99, 'IN', 'India', 1, NULL, NULL),
(100, 'IM', 'Isle of Man', 1, NULL, NULL),
(101, 'ID', 'Indonesia', 1, NULL, NULL),
(102, 'IR', 'Iran (Islamic Republic of)', 1, NULL, NULL),
(103, 'IQ', 'Iraq', 1, NULL, NULL),
(104, 'IE', 'Ireland', 1, NULL, NULL),
(105, 'IL', 'Israel', 1, NULL, NULL),
(106, 'IT', 'Italy', 1, NULL, NULL),
(107, 'CI', 'Ivory Coast', 1, NULL, NULL),
(108, 'JE', 'Jersey', 1, NULL, NULL),
(109, 'JM', 'Jamaica', 1, NULL, NULL),
(110, 'JP', 'Japan', 1, NULL, NULL),
(111, 'JO', 'Jordan', 1, NULL, NULL),
(112, 'KZ', 'Kazakhstan', 1, NULL, NULL),
(113, 'KE', 'Kenya', 1, NULL, NULL),
(114, 'KI', 'Kiribati', 1, NULL, NULL),
(115, 'KP', 'Korea, Democratic People\'s Republic of', 1, NULL, NULL),
(116, 'KR', 'Korea, Republic of', 1, NULL, NULL),
(117, 'XK', 'Kosovo', 1, NULL, NULL),
(118, 'KW', 'Kuwait', 1, NULL, NULL),
(119, 'KG', 'Kyrgyzstan', 1, NULL, NULL),
(120, 'LA', 'Lao People\'s Democratic Republic', 1, NULL, NULL),
(121, 'LV', 'Latvia', 1, NULL, NULL),
(122, 'LB', 'Lebanon', 1, NULL, NULL),
(123, 'LS', 'Lesotho', 1, NULL, NULL),
(124, 'LR', 'Liberia', 1, NULL, NULL),
(125, 'LY', 'Libyan Arab Jamahiriya', 1, NULL, NULL),
(126, 'LI', 'Liechtenstein', 1, NULL, NULL),
(127, 'LT', 'Lithuania', 1, NULL, NULL),
(128, 'LU', 'Luxembourg', 1, NULL, NULL),
(129, 'MO', 'Macau', 1, NULL, NULL),
(130, 'MK', 'Macedonia', 1, NULL, NULL),
(131, 'MG', 'Madagascar', 1, NULL, NULL),
(132, 'MW', 'Malawi', 1, NULL, NULL),
(133, 'MY', 'Malaysia', 1, NULL, NULL),
(134, 'MV', 'Maldives', 1, NULL, NULL),
(135, 'ML', 'Mali', 1, NULL, NULL),
(136, 'MT', 'Malta', 1, NULL, NULL),
(137, 'MH', 'Marshall Islands', 1, NULL, NULL),
(138, 'MQ', 'Martinique', 1, NULL, NULL),
(139, 'MR', 'Mauritania', 1, NULL, NULL),
(140, 'MU', 'Mauritius', 1, NULL, NULL),
(141, 'TY', 'Mayotte', 1, NULL, NULL),
(142, 'MX', 'Mexico', 1, NULL, NULL),
(143, 'FM', 'Micronesia, Federated States of', 1, NULL, NULL),
(144, 'MD', 'Moldova, Republic of', 1, NULL, NULL),
(145, 'MC', 'Monaco', 1, NULL, NULL),
(146, 'MN', 'Mongolia', 1, NULL, NULL),
(147, 'ME', 'Montenegro', 1, NULL, NULL),
(148, 'MS', 'Montserrat', 1, NULL, NULL),
(149, 'MA', 'Morocco', 1, NULL, NULL),
(150, 'MZ', 'Mozambique', 1, NULL, NULL),
(151, 'MM', 'Myanmar', 1, NULL, NULL),
(152, 'NA', 'Namibia', 1, NULL, NULL),
(153, 'NR', 'Nauru', 1, NULL, NULL),
(154, 'NP', 'Nepal', 1, NULL, NULL),
(155, 'NL', 'Netherlands', 1, NULL, NULL),
(156, 'AN', 'Netherlands Antilles', 1, NULL, NULL),
(157, 'NC', 'New Caledonia', 1, NULL, NULL),
(158, 'NZ', 'New Zealand', 1, NULL, NULL),
(159, 'NI', 'Nicaragua', 1, NULL, NULL),
(160, 'NE', 'Niger', 1, NULL, NULL),
(161, 'NG', 'Nigeria', 1, NULL, NULL),
(162, 'NU', 'Niue', 1, NULL, NULL),
(163, 'NF', 'Norfolk Island', 1, NULL, NULL),
(164, 'MP', 'Northern Mariana Islands', 1, NULL, NULL),
(165, 'NO', 'Norway', 1, NULL, NULL),
(166, 'OM', 'Oman', 1, NULL, NULL),
(167, 'PK', 'Pakistan', 1, NULL, NULL),
(168, 'PW', 'Palau', 1, NULL, NULL),
(169, 'PS', 'Palestine', 1, NULL, NULL),
(170, 'PA', 'Panama', 1, NULL, NULL),
(171, 'PG', 'Papua New Guinea', 1, NULL, NULL),
(172, 'PY', 'Paraguay', 1, NULL, NULL),
(173, 'PE', 'Peru', 1, NULL, NULL),
(174, 'PH', 'Philippines', 1, NULL, NULL),
(175, 'PN', 'Pitcairn', 1, NULL, NULL),
(176, 'PL', 'Poland', 1, NULL, NULL),
(177, 'PT', 'Portugal', 1, NULL, NULL),
(178, 'PR', 'Puerto Rico', 1, NULL, NULL),
(179, 'QA', 'Qatar', 1, NULL, NULL),
(180, 'RE', 'Reunion', 1, NULL, NULL),
(181, 'RO', 'Romania', 1, NULL, NULL),
(182, 'RU', 'Russian Federation', 1, NULL, NULL),
(183, 'RW', 'Rwanda', 1, NULL, NULL),
(184, 'KN', 'Saint Kitts and Nevis', 1, NULL, NULL),
(185, 'LC', 'Saint Lucia', 1, NULL, NULL),
(186, 'VC', 'Saint Vincent and the Grenadines', 1, NULL, NULL),
(187, 'WS', 'Samoa', 1, NULL, NULL),
(188, 'SM', 'San Marino', 1, NULL, NULL),
(189, 'ST', 'Sao Tome and Principe', 1, NULL, NULL),
(190, 'SA', 'Saudi Arabia', 1, NULL, NULL),
(191, 'SN', 'Senegal', 1, NULL, NULL),
(192, 'RS', 'Serbia', 1, NULL, NULL),
(193, 'SC', 'Seychelles', 1, NULL, NULL),
(194, 'SL', 'Sierra Leone', 1, NULL, NULL),
(195, 'SG', 'Singapore', 1, NULL, NULL),
(196, 'SK', 'Slovakia', 1, NULL, NULL),
(197, 'SI', 'Slovenia', 1, NULL, NULL),
(198, 'SB', 'Solomon Islands', 1, NULL, NULL),
(199, 'SO', 'Somalia', 1, NULL, NULL),
(200, 'ZA', 'South Africa', 1, NULL, NULL),
(201, 'GS', 'South Georgia South Sandwich Islands', 1, NULL, NULL),
(202, 'SS', 'South Sudan', 1, NULL, NULL),
(203, 'ES', 'Spain', 1, NULL, NULL),
(204, 'LK', 'Sri Lanka', 1, NULL, NULL),
(205, 'SH', 'St. Helena', 1, NULL, NULL),
(206, 'PM', 'St. Pierre and Miquelon', 1, NULL, NULL),
(207, 'SD', 'Sudan', 1, NULL, NULL),
(208, 'SR', 'Suriname', 1, NULL, NULL),
(209, 'SJ', 'Svalbard and Jan Mayen Islands', 1, NULL, NULL),
(210, 'SZ', 'Swaziland', 1, NULL, NULL),
(211, 'SE', 'Sweden', 1, NULL, NULL),
(212, 'CH', 'Switzerland', 1, NULL, NULL),
(213, 'SY', 'Syrian Arab Republic', 1, NULL, NULL),
(214, 'TW', 'Taiwan', 1, NULL, NULL),
(215, 'TJ', 'Tajikistan', 1, NULL, NULL),
(216, 'TZ', 'Tanzania, United Republic of', 1, NULL, NULL),
(217, 'TH', 'Thailand', 1, NULL, NULL),
(218, 'TG', 'Togo', 1, NULL, NULL),
(219, 'TK', 'Tokelau', 1, NULL, NULL),
(220, 'TO', 'Tonga', 1, NULL, NULL),
(221, 'TT', 'Trinidad and Tobago', 1, NULL, NULL),
(222, 'TN', 'Tunisia', 1, NULL, NULL),
(223, 'TR', 'Turkey', 1, NULL, NULL),
(224, 'TM', 'Turkmenistan', 1, NULL, NULL),
(225, 'TC', 'Turks and Caicos Islands', 1, NULL, NULL),
(226, 'TV', 'Tuvalu', 1, NULL, NULL),
(227, 'UG', 'Uganda', 1, NULL, NULL),
(228, 'UA', 'Ukraine', 1, NULL, NULL),
(229, 'AE', 'United Arab Emirates', 1, NULL, NULL),
(230, 'GB', 'United Kingdom', 1, NULL, NULL),
(231, 'US', 'United States', 1, NULL, NULL),
(232, 'UM', 'United States minor outlying islands', 1, NULL, NULL),
(233, 'UY', 'Uruguay', 1, NULL, NULL),
(234, 'UZ', 'Uzbekistan', 1, NULL, NULL),
(235, 'VU', 'Vanuatu', 1, NULL, NULL),
(236, 'VA', 'Vatican City State', 1, NULL, NULL),
(237, 'VE', 'Venezuela', 1, NULL, NULL),
(238, 'VN', 'Vietnam', 1, NULL, NULL),
(239, 'VG', 'Virgin Islands (British)', 1, NULL, NULL),
(240, 'VI', 'Virgin Islands (U.S.)', 1, NULL, NULL),
(241, 'WF', 'Wallis and Futuna Islands', 1, NULL, NULL),
(242, 'EH', 'Western Sahara', 1, NULL, NULL),
(243, 'YE', 'Yemen', 1, NULL, NULL),
(244, 'ZR', 'Zaire', 1, NULL, NULL),
(245, 'ZM', 'Zambia', 1, NULL, NULL),
(246, 'ZW', 'Zimbabwe', 1, NULL, NULL),
(247, 'AF', 'Afghanistan', 1, NULL, NULL),
(248, 'AL', 'Albania', 1, NULL, NULL),
(249, 'DZ', 'Algeria', 1, NULL, NULL),
(250, 'DS', 'American Samoa', 1, NULL, NULL),
(251, 'AD', 'Andorra', 1, NULL, NULL),
(252, 'AO', 'Angola', 1, NULL, NULL),
(253, 'AI', 'Anguilla', 1, NULL, NULL),
(254, 'AQ', 'Antarctica', 1, NULL, NULL),
(255, 'AG', 'Antigua and Barbuda', 1, NULL, NULL),
(256, 'AR', 'Argentina', 1, NULL, NULL),
(257, 'AM', 'Armenia', 1, NULL, NULL),
(258, 'AW', 'Aruba', 1, NULL, NULL),
(259, 'AU', 'Australia', 1, NULL, NULL),
(260, 'AT', 'Austria', 1, NULL, NULL),
(261, 'AZ', 'Azerbaijan', 1, NULL, NULL),
(262, 'BS', 'Bahamas', 1, NULL, NULL),
(263, 'BH', 'Bahrain', 1, NULL, NULL),
(264, 'BD', 'Bangladesh', 1, NULL, NULL),
(265, 'BB', 'Barbados', 1, NULL, NULL),
(266, 'BY', 'Belarus', 1, NULL, NULL),
(267, 'BE', 'Belgium', 1, NULL, NULL),
(268, 'BZ', 'Belize', 1, NULL, NULL),
(269, 'BJ', 'Benin', 1, NULL, NULL),
(270, 'BM', 'Bermuda', 1, NULL, NULL),
(271, 'BT', 'Bhutan', 1, NULL, NULL),
(272, 'BO', 'Bolivia', 1, NULL, NULL),
(273, 'BA', 'Bosnia and Herzegovina', 1, NULL, NULL),
(274, 'BW', 'Botswana', 1, NULL, NULL),
(275, 'BV', 'Bouvet Island', 1, NULL, NULL),
(276, 'BR', 'Brazil', 1, NULL, NULL),
(277, 'IO', 'British Indian Ocean Territory', 1, NULL, NULL),
(278, 'BN', 'Brunei Darussalam', 1, NULL, NULL),
(279, 'BG', 'Bulgaria', 1, NULL, NULL),
(280, 'BF', 'Burkina Faso', 1, NULL, NULL),
(281, 'BI', 'Burundi', 1, NULL, NULL),
(282, 'KH', 'Cambodia', 1, NULL, NULL),
(283, 'CM', 'Cameroon', 1, NULL, NULL),
(284, 'CA', 'Canada', 1, NULL, NULL),
(285, 'CV', 'Cape Verde', 1, NULL, NULL),
(286, 'KY', 'Cayman Islands', 1, NULL, NULL),
(287, 'CF', 'Central African Republic', 1, NULL, NULL),
(288, 'TD', 'Chad', 1, NULL, NULL),
(289, 'CL', 'Chile', 1, NULL, NULL),
(290, 'CN', 'China', 1, NULL, NULL),
(291, 'CX', 'Christmas Island', 1, NULL, NULL),
(292, 'CC', 'Cocos (Keeling) Islands', 1, NULL, NULL),
(293, 'CO', 'Colombia', 1, NULL, NULL),
(294, 'KM', 'Comoros', 1, NULL, NULL),
(295, 'CG', 'Congo', 1, NULL, NULL),
(296, 'CK', 'Cook Islands', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(5, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(7, '2016_06_01_000004_create_oauth_clients_table', 2),
(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'pfcyuRN2aIogQHM8E3K8Z7skf9Gpqq8m1PmBOiWj', NULL, 'http://localhost', 1, 0, 0, '2020-09-11 00:58:46', '2020-09-11 00:58:46'),
(2, NULL, 'Laravel Password Grant Client', 'uvhPJPRhddm8GOHhueWEPVt2VZ5ZMYuH63pqpIxf', 'users', 'http://localhost', 0, 1, 0, '2020-09-11 00:58:46', '2020-09-11 00:58:46');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-09-11 00:58:46', '2020-09-11 00:58:46');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `race_id` int NOT NULL DEFAULT '0',
  `car_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` enum('paid','pending') NOT NULL DEFAULT 'pending',
  `quantity` int NOT NULL DEFAULT '1',
  `deposit` enum('yes','no') NOT NULL DEFAULT 'no',
  `depositamount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `isrefunded` enum('yes','no') NOT NULL DEFAULT 'no',
  `orderdate` varchar(20) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `iswinner` enum('yes','no') NOT NULL DEFAULT 'no',
  `claimed` enum('yes','no') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `race_id`, `car_id`, `user_id`, `amount`, `status`, `quantity`, `deposit`, `depositamount`, `isrefunded`, `orderdate`, `iswinner`, `claimed`, `created_at`) VALUES
(1, 3, 0, 9, '240.00', 'pending', 2, 'no', '0.00', 'no', '0000-00-00 00:00:00', 'no', 'yes', '2020-10-30 09:33:53'),
(2, 3, 0, 9, '120.00', 'pending', 1, 'no', '8000.00', 'no', '2020-10-30 09:47:40', 'no', 'yes', '2020-10-30 09:47:40'),
(3, 3, 0, 12, '120.00', 'pending', 1, 'yes', '8000.00', 'no', '2020-10-30 09:50:59', 'no', 'yes', '2020-10-30 09:50:59'),
(4, 3, 0, 9, '240.00', 'pending', 2, 'yes', '8000.00', 'no', '2020-10-30 09:58:32', 'no', 'yes', '2020-10-30 09:58:32'),
(5, 3, 0, 13, '120.00', 'pending', 1, 'yes', '8000.00', 'no', '2020-10-30 10:01:32', 'no', 'yes', '2020-10-30 10:01:32'),
(6, 3, 0, 14, '240.00', 'pending', 2, 'yes', '8000.00', 'no', '2020-10-30 10:02:10', 'no', 'yes', '2020-10-30 10:02:10'),
(7, 3, 0, 9, '120.00', 'pending', 1, 'yes', '8000.00', 'no', '2020-10-30 10:02:39', 'no', 'yes', '2020-10-30 10:02:39');

-- --------------------------------------------------------

--
-- Table structure for table `organizerfiles`
--

CREATE TABLE `organizerfiles` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `filename` varchar(100) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organizerfiles`
--

INSERT INTO `organizerfiles` (`id`, `user_id`, `filename`, `created_at`) VALUES
(4, 8, 'uploads/car.csv', '2020-09-29 09:39:51');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('shavetakatyal@yahoo.com', '$2y$10$VCyVmwHTUWyY7yUUxJfZWerQVyrzSk58E6LNXQGRGGmKlVhWa6CWu', '2020-12-04 00:58:12');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int NOT NULL,
  `race_id` int NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL,
  `status` enum('paid','unpaid') NOT NULL,
  `paymentdate` varchar(20) NOT NULL DEFAULT '0000-00-00',
  `user_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `racergroups`
--

CREATE TABLE `racergroups` (
  `id` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL DEFAULT '',
  `racingdate` varchar(50) NOT NULL DEFAULT '',
  `racingtiming` varchar(20) NOT NULL DEFAULT '',
  `ticketprice` varchar(10) NOT NULL DEFAULT '0.00',
  `depositprice` varchar(10) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `racergroups`
--

INSERT INTO `racergroups` (`id`, `user_id`, `name`, `racingdate`, `racingtiming`, `ticketprice`, `depositprice`, `created_at`) VALUES
(5, 8, 'brajgroup', '2020-12-12', '03:30:00', '120', '8000', '2020-09-29 09:39:51');

-- --------------------------------------------------------

--
-- Table structure for table `races`
--

CREATE TABLE `races` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `user_id` int NOT NULL DEFAULT '0',
  `race_date` varchar(30) NOT NULL,
  `ticketcost` varchar(50) NOT NULL DEFAULT '0.00',
  `deposit` varchar(50) NOT NULL DEFAULT '0.00',
  `images` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'open',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `races`
--

INSERT INTO `races` (`id`, `name`, `user_id`, `race_date`, `ticketcost`, `deposit`, `images`, `status`, `created_at`) VALUES
(3, 'Cristmas race', 8, '25-12-2020', '120', '8000', 'public/races/logo-fold.png', '', '2020-09-29 09:39:52'),
(4, 'New Year', 8, '01-01-2021', '110', '8500', '', '', '2020-09-29 09:39:52'),
(5, 'Race1', 8, '2020-10-31', '342', '122', '', '', '2020-10-28 08:52:35'),
(6, 'Race2', 9, '2020-10-28', '200', '100', '', '', '2020-10-28 09:11:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `firstname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `zipcode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `device_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateofbirth` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `name`, `email`, `email_verified_at`, `password`, `user_type`, `remember_token`, `phone`, `city`, `state`, `zipcode`, `address1`, `address2`, `device_token`, `dateofbirth`, `countries`, `created_at`, `updated_at`) VALUES
(8, '', '', 'braj', 'brajkishorpandey@gmail.com', NULL, '$2y$10$YOTmYsfPlrfCSaQRx5KJYeIR3d5wN675GXFrJ5I7U1/2Ko6RT7.6q', 'admin', 'rwnlq4zoZ46li4k07ZvDmy0tnGE0AlYf5pP9pYlyKJ1yPLM5p3Aj9QXeVpzc', '', '', '', '', '', '', '', '', '', '2020-09-11 01:52:50', '2020-09-17 11:43:25'),
(9, '', '', 'braj 1', 'me@bkpandey.com', NULL, '$2y$10$YOTmYsfPlrfCSaQRx5KJYeIR3d5wN675GXFrJ5I7U1/2Ko6RT7.6q', 'user', 'qFpjvCvC2dxRBLkcf0ZbKkdaUpNJZqGdeYK42BRO', '9569843766', 'chandigarh', 'chandigarh', '160034', 'chandigarh1', 'chandigarh2', NULL, '', '', NULL, '2020-12-03 23:31:24'),
(10, '', '', 'braj23', 'brajtest@gmail.com', NULL, '$2y$10$VX63DdEj2Y1x.lyPUjIHZepGcfWEtCBw.0Bp9V5kfDXHzax8OMC8O', 'user', NULL, '9876543210', 'Chandigarh', 'chandigarh', '160022', 'chandigarh', 'chd2', '', '', '', NULL, NULL),
(11, '', '', 'shaveta', 'shavetakatyal@yahoo.com', NULL, '$2y$10$yMtElqvN5IaSkNG3rzVRveF9Prl.C8zq4E5aMCOjLcYD7meZj7UYS', 'user', NULL, '', '', '', '', '', '', '', '', '', '2020-10-28 04:33:20', '2020-10-28 04:33:20'),
(12, '', '', 'test', 'test@gmail.com', NULL, '$2y$10$pCnkl3x/KZUNAkO.zV6rJ.JPb7likR7IcewY5.oI4km/RtGPUzcfe', 'user', NULL, '8437413705', '', '', '', '', '', '', '', '', NULL, NULL),
(13, '', '', 'TEST_PRODUCT', 'ttt@cfv.lol', NULL, '$2y$10$qNZWHxMKMBvV7lzLUMv00.bqphl0s/C5CIgPBgRv7HCu3xfIwiI6q', 'user', '1vBvwuxwekeFiMLv4q0jCf72ZG61BTnieIDBnFO6Agmm2w66gVcqtsyzMjOQ', '1234', '', '', '', '', '', '', '', '', NULL, NULL),
(14, '', '', 'adada asda', 'fd@fff.yy', NULL, '$2y$10$Bx8v1DoHCtfA2H7eO/eaFuSu4u67SYyOg5Q6zp9n8QQbL6PHRttTK', 'user', 'pPRZerscOTgZ03kflNCEFYaOo43QpYwJLjrcbTglmwEnYqX8x5HTfbA43nSs', '2312', '', '', '', '', '', '', '', '', NULL, NULL),
(15, '', '', 'test123', 'test123@gmail.com', NULL, '$2y$10$y7GNZ6IK6L4RHeItXT3y9eMARrENbRCG6CNKJY3YmkedVxTYRFKIa', '', NULL, '', '', '', '', '', '', '', '', '', '2020-10-30 14:57:39', '2020-10-30 14:57:39'),
(16, '', '', 'dgdf', 'fffd@gmail.com', NULL, '$2y$10$L9Gw/pzqOffFdfS5LZxdWe0D8kL3hDn0Wj7F33/6Dttas.GZmhbSu', '', NULL, '', '', '', '', '', '', NULL, '', '', '2020-12-04 00:51:46', '2020-12-04 00:51:46'),
(19, '', '', 'fghf', 'bgfd@ff.hh', NULL, '$2y$10$psFcrNobn0u3gWiivkN4R.KpjMHVhaFMuOV1NoD01hfiaUf02cZHC', '', NULL, '', '', '', '', '', '', NULL, '', '', '2020-12-04 00:52:47', '2020-12-04 00:52:47'),
(20, '', '', 'fghf', 'bgdfd@ff.hh', NULL, '$2y$10$yW14D0kaLmgnJXDTQ2v/ken/GBhASAXRtmUkWI/Sx.fZ4iusS0aWC', '', NULL, '', '', '', '', '', '', NULL, '', '', '2020-12-04 00:53:31', '2020-12-04 00:53:31'),
(21, '', '', 'fssghf', 'bgssdfd@ff.hh', NULL, '$2y$10$JPavTk6HdQT5ITqi1Quug.CLcwXV9DGpga1BMNLDRtO.o2XuxN3YW', '', NULL, '', '', '', '', '', '', NULL, '', '', '2020-12-04 00:53:42', '2020-12-04 00:53:42'),
(23, '', '', 'fssghf', 'bgddssdfd@ff.hh', NULL, '$2y$10$ON.kdR2dcCQDUd6RBIzkDuF6yQyTblrAmnEhbG2NwMZJ0RmZNrJLC', '', NULL, '', '', '', '', '', '', NULL, '', '', '2020-12-04 00:54:07', '2020-12-04 00:54:07'),
(24, '', '', 'gfd', 'fdf@dd.dd', NULL, '$2y$10$nbNHJT2.5.KuzxnusJEdouBOOupefOEGAWp2SiOAUagjkCBmQRSzW', '', NULL, '', '', '', '', '', '', NULL, '', '', '2020-12-04 01:06:15', '2020-12-04 01:06:15'),
(26, '', '', 'gfd', 'fssdf@dd.dd', NULL, '$2y$10$DGAONGBuGztqXh92E6TYLu5FI9UaufaB1AEjhLQs0T0vxkrceBDCm', '', NULL, '', '', '', '', '', '', NULL, '', '', '2020-12-04 02:55:43', '2020-12-04 02:55:43'),
(27, '', '', 'ishi', 'ishi@gmail.com', NULL, '$2y$10$MXtctTMyO3uzBPY/FVk0H.6sRrS6M8vUw77MW8GRq7mMKCd8sVPZa', '', NULL, '', '', '', '', '', '', NULL, '', '', '2020-12-04 03:09:58', '2020-12-04 03:09:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `carname` (`carname`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organizerfiles`
--
ALTER TABLE `organizerfiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `racergroups`
--
ALTER TABLE `racergroups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `races`
--
ALTER TABLE `races`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `organizerfiles`
--
ALTER TABLE `organizerfiles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `racergroups`
--
ALTER TABLE `racergroups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `races`
--
ALTER TABLE `races`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
