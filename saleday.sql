-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 26, 2024 at 06:42 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `saleday`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `name`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Asset', 'Asset', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(2, 'Liability', 'Liability', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(3, 'Equity', 'Equity', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(4, 'Withdrawal', 'Equity', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(5, 'Revenue', 'Equity', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(6, 'Expense', 'Equity', '2024-10-04 11:48:23', '2024-10-04 11:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `adjustInvoice`
--

CREATE TABLE `adjustInvoice` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adjustInvoiceProduct`
--

CREATE TABLE `adjustInvoiceProduct` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `adjustInvoiceId` bigint(20) UNSIGNED NOT NULL,
  `productId` bigint(20) UNSIGNED DEFAULT NULL,
  `adjustQuantity` int(11) NOT NULL,
  `adjustType` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appSetting`
--

CREATE TABLE `appSetting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `companyName` varchar(255) NOT NULL,
  `dashboardType` enum('e-commerce','inventory','both') NOT NULL,
  `tagLine` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `footer` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `currencyId` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appSetting`
--

INSERT INTO `appSetting` (`id`, `companyName`, `dashboardType`, `tagLine`, `address`, `phone`, `email`, `website`, `footer`, `logo`, `currencyId`, `created_at`, `updated_at`) VALUES
(1, 'Lamisol Gadget', 'inventory', 'Manage your Inventory, Sales, Purchases etc', 'House: 139, Road: 13, Sectorr: 10, Uttara, Dhaka-1230', '+880 18 2021 5555', 'solution@omega.ac', 'https://solution.omega.ac', '<p>OS Inventory copyright by Omega Solution LLC</p>', '04588aa4b8f6318bcd79ab7ae4256441fb88a857952acdd3d4f137c3e79ca162.png', 15, '2024-10-04 11:48:23', '2024-10-23 21:58:55');

-- --------------------------------------------------------

--
-- Table structure for table `attachment`
--

CREATE TABLE `attachment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `emailId` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `award`
--

CREATE TABLE `award` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `award`
--

INSERT INTO `award` (`id`, `name`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Demo Award', 'Demo Award Description', 'https://i.imgur.com/3Lm2Wwv.png', 'true', '2024-10-04 11:48:22', '2024-10-04 11:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `awardHistory`
--

CREATE TABLE `awardHistory` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `awardId` bigint(20) UNSIGNED NOT NULL,
  `awardedDate` datetime NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bcc`
--

CREATE TABLE `bcc` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `emailId` bigint(20) UNSIGNED DEFAULT NULL,
  `bccEmail` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customerId` bigint(20) UNSIGNED NOT NULL,
  `totalAmount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cartAttributeValue`
--

CREATE TABLE `cartAttributeValue` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cartProductId` bigint(20) UNSIGNED NOT NULL,
  `productAttributeValueId` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cartOrder`
--

CREATE TABLE `cartOrder` (
  `id` char(36) NOT NULL,
  `date` datetime NOT NULL,
  `totalAmount` double NOT NULL,
  `paidAmount` double DEFAULT NULL,
  `deliveryFee` double DEFAULT NULL,
  `due` double DEFAULT NULL,
  `isPaid` varchar(255) NOT NULL DEFAULT 'false',
  `profit` double NOT NULL,
  `couponId` bigint(20) UNSIGNED DEFAULT NULL,
  `couponAmount` double DEFAULT NULL,
  `customerId` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `deliveryAddress` varchar(255) DEFAULT NULL,
  `customerPhone` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `isReOrdered` varchar(255) NOT NULL DEFAULT 'false',
  `orderStatus` enum('PENDING','RECEIVED','SHIPPED','DELIVERED','RETURNED','CANCELLED') NOT NULL DEFAULT 'PENDING',
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `courierMediumId` bigint(20) UNSIGNED DEFAULT NULL,
  `deliveryFeeId` bigint(20) UNSIGNED DEFAULT NULL,
  `previousCartOrderId` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cartOrderAttributeValue`
--

CREATE TABLE `cartOrderAttributeValue` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cartOrderProductId` bigint(20) UNSIGNED NOT NULL,
  `productAttributeValueId` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cartOrderProduct`
--

CREATE TABLE `cartOrderProduct` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `productId` bigint(20) UNSIGNED NOT NULL,
  `invoiceId` char(36) NOT NULL,
  `colorId` bigint(20) UNSIGNED DEFAULT NULL,
  `productQuantity` int(11) NOT NULL,
  `productSalePrice` double NOT NULL,
  `productVat` int(11) DEFAULT NULL,
  `discountType` varchar(255) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cartProduct`
--

CREATE TABLE `cartProduct` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cartId` bigint(20) UNSIGNED NOT NULL,
  `productId` bigint(20) UNSIGNED NOT NULL,
  `colorId` bigint(20) UNSIGNED DEFAULT NULL,
  `productQuantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cc`
--

CREATE TABLE `cc` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `emailId` bigint(20) UNSIGNED DEFAULT NULL,
  `ccEmail` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `colorCode` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `colorCode`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Black', '#000000', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `couponCode` varchar(255) DEFAULT NULL,
  `type` enum('flat','percentage') NOT NULL DEFAULT 'percentage',
  `value` double NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courierMedium`
--

CREATE TABLE `courierMedium` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `courierMediumName` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `type` enum('courier','deliveryBoy') NOT NULL,
  `subAccountId` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currencyName` varchar(255) NOT NULL,
  `currencySymbol` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `currencyName`, `currencySymbol`, `status`, `created_at`, `updated_at`) VALUES
(1, 'DOLLAR', '&#36;', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(2, 'EURO', '&#8364;', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(3, 'BDT', '&#2547;', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(4, 'POUND', '&#163;', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(5, 'RUPEE', '&#8377;', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(6, 'YEN', '&#165;', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(7, 'WON', '&#8361;', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(8, 'YUAN', '&#165;', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(9, 'PESO', '&#8369;', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(10, 'LIRA', '&#8356;', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(11, 'FRANC', '&#8355;', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(12, 'REAL', '&#8369;', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(13, 'RUBLE', '&#8381;', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(14, 'RINGGIT', '&#8369;', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(15, 'Naira', '₦', 'true', '2024-10-09 10:56:12', '2024-10-09 10:56:12'),
(16, 'Shillings', 'KES', 'true', '2024-10-09 11:00:03', '2024-10-09 11:00:03'),
(17, 'Algerian Dinar', 'DA', 'true', '2024-10-21 00:43:51', '2024-10-21 00:43:51'),
(18, 'Angolan kwanza', 'KZ', 'true', '2024-10-21 00:44:37', '2024-10-21 00:44:37'),
(19, 'Botswana pula', 'P', 'true', '2024-10-21 00:44:55', '2024-10-21 00:45:17'),
(20, 'Burundian franc', 'FBu', 'true', '2024-10-21 05:48:06', '2024-10-21 05:48:06'),
(21, 'Cape Verdean escudo', '$', 'true', '2024-10-21 05:48:58', '2024-10-21 05:48:58'),
(22, 'Comorian franc', 'FC', 'true', '2024-10-21 05:50:04', '2024-10-21 05:50:04'),
(23, 'Congolese franc', 'FC', 'true', '2024-10-21 05:50:34', '2024-10-21 05:50:34'),
(24, 'Djiboutian franc', 'Fdj', 'true', '2024-10-21 05:51:42', '2024-10-21 05:51:42'),
(25, 'Egyptian pound', 'EGP', 'true', '2024-10-21 06:02:45', '2024-10-21 06:02:45'),
(26, 'Eritrean nakfa', 'Nkf', 'true', '2024-10-21 06:03:17', '2024-10-21 06:03:17'),
(27, 'Ethiopian birr', 'ETB', 'true', '2024-10-21 06:04:12', '2024-10-21 06:04:12'),
(28, 'Ghanaian cedi', '₵', 'true', '2024-10-21 06:04:49', '2024-10-21 06:04:49'),
(29, 'Guinean franc', 'FG', 'true', '2024-10-21 06:05:20', '2024-10-21 06:05:20'),
(30, 'Kenyan shilling', 'KES', 'true', '2024-10-21 06:05:45', '2024-10-21 06:05:45'),
(31, 'Lesotho loti', 'LSL', 'true', '2024-10-21 06:06:53', '2024-10-21 06:06:53'),
(32, 'Liberian dollar', '$', 'true', '2024-10-21 06:07:06', '2024-10-21 06:07:06'),
(33, 'Libyan dinar', 'LD', 'true', '2024-10-21 06:07:29', '2024-10-21 06:07:29'),
(34, 'Malagasy ariary', 'Ar', 'true', '2024-10-21 06:08:22', '2024-10-21 06:08:22'),
(35, 'Malawian kwacha', 'KW', 'true', '2024-10-21 06:30:43', '2024-10-21 06:30:43'),
(36, 'Mauritian rupee', 'MUR', 'true', '2024-10-21 06:31:24', '2024-10-21 06:31:24'),
(37, 'Moroccan dirham', 'DH', 'true', '2024-10-21 06:32:01', '2024-10-21 06:32:01'),
(38, 'Namibian dollar', 'N$', 'true', '2024-10-21 06:32:19', '2024-10-21 06:32:19'),
(39, 'Rwandan franc', 'FRw', 'true', '2024-10-21 06:33:06', '2024-10-21 06:33:06'),
(40, 'Sierra Leonean leone', 'Le', 'true', '2024-10-21 06:33:59', '2024-10-21 06:33:59'),
(41, 'South African rand', 'R', 'true', '2024-10-21 06:34:51', '2024-10-21 06:34:51');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profileImage` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `googleId` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `roleId` bigint(20) UNSIGNED NOT NULL DEFAULT 3,
  `isLogin` varchar(255) NOT NULL DEFAULT 'false',
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `profileImage`, `firstName`, `lastName`, `username`, `googleId`, `email`, `phone`, `address`, `password`, `roleId`, `isLogin`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, 'Doe', NULL, 'dev@omega.ac', '1234567890', '123 Main St', '$2y$10$Cbrb6PZ7VYPa81Vdwh0csOqP5b8h.sVbKRX.ZKByDSez2UZh6lcyC', 3, 'false', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `customerPermissions`
--

CREATE TABLE `customerPermissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` varchar(255) NOT NULL,
  `permissions` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryChallan`
--

CREATE TABLE `deliveryChallan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `saleInvoiceId` char(36) NOT NULL,
  `challanNo` varchar(255) NOT NULL,
  `challanDate` varchar(255) NOT NULL,
  `challanNote` varchar(255) NOT NULL,
  `vehicleNo` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryChallanProduct`
--

CREATE TABLE `deliveryChallanProduct` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `deliveryChallanId` varchar(255) NOT NULL,
  `productId` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryFee`
--

CREATE TABLE `deliveryFee` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `deliveryArea` varchar(255) NOT NULL,
  `deliveryFee` double NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliveryFee`
--

INSERT INTO `deliveryFee` (`id`, `deliveryArea`, `deliveryFee`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Demo Area', 50, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Demo Department', 'true', '2024-10-04 11:48:22', '2024-10-04 11:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Demo Designation', 'true', '2024-10-04 11:48:22', '2024-10-04 11:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `designationHistory`
--

CREATE TABLE `designationHistory` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `designationId` bigint(20) UNSIGNED NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designationHistory`
--

INSERT INTO `designationHistory` (`id`, `userId`, `designationId`, `startDate`, `endDate`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2021-01-01 00:00:00', NULL, 'Admin', 'true', '2024-10-04 11:48:22', '2024-10-04 11:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `dimensionUnit`
--

CREATE TABLE `dimensionUnit` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) NOT NULL,
  `type` enum('percentage','flat','flashSale') NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`id`, `value`, `type`, `status`, `startDate`, `endDate`, `created_at`, `updated_at`) VALUES
(1, '10', 'percentage', 'true', '2023-09-10', '2023-10-10', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(2, '20', 'flat', 'true', '2023-09-10', '2023-10-10', '2024-10-04 11:48:23', '2024-10-04 11:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `ecom_setting`
--

CREATE TABLE `ecom_setting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `IsActive` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ecom_setting`
--

INSERT INTO `ecom_setting` (`id`, `IsActive`, `created_at`, `updated_at`) VALUES
(1, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `degree` varchar(255) NOT NULL,
  `institution` varchar(255) NOT NULL,
  `fieldOfStudy` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `studyStartDate` datetime NOT NULL,
  `studyEndDate` datetime DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `userId`, `degree`, `institution`, `fieldOfStudy`, `result`, `studyStartDate`, `studyEndDate`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'BSc in CSE', 'Daffodil International University', 'CSE', '3.5', '2017-01-01 00:00:00', '2021-01-01 00:00:00', 'true', '2024-10-04 11:48:22', '2024-10-04 11:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `senderEmail` varchar(255) NOT NULL,
  `receiverEmail` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `emailStatus` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emailConfig`
--

CREATE TABLE `emailConfig` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `emailConfigName` varchar(255) NOT NULL,
  `emailHost` varchar(255) NOT NULL,
  `emailPort` varchar(255) NOT NULL,
  `emailUser` varchar(255) NOT NULL,
  `emailPass` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `emailConfig`
--

INSERT INTO `emailConfig` (`id`, `emailConfigName`, `emailHost`, `emailPort`, `emailUser`, `emailPass`, `status`, `created_at`, `updated_at`) VALUES
(1, 'InventoryOs', 'mail.lfix.us', '465', 'no-reply@lfix.us', '@omega@2020@omega', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `employmentStatus`
--

CREATE TABLE `employmentStatus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `colourValue` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employmentStatus`
--

INSERT INTO `employmentStatus` (`id`, `name`, `colourValue`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Demo Employment', '#00FF00', 'Demo Employment Description', 'true', '2024-10-04 11:48:22', '2024-10-04 11:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `productId` bigint(20) UNSIGNED DEFAULT NULL,
  `reviewId` bigint(20) UNSIGNED DEFAULT NULL,
  `imageName` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lbs_log`
--

CREATE TABLE `lbs_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider` text NOT NULL,
  `request_json` text NOT NULL,
  `response_json` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manualPayment`
--

CREATE TABLE `manualPayment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `paymentMethodId` bigint(20) UNSIGNED NOT NULL,
  `customerId` bigint(20) UNSIGNED NOT NULL,
  `cartOrderId` char(36) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `manualTransactionId` varchar(255) DEFAULT NULL,
  `CustomerAccount` varchar(255) DEFAULT NULL,
  `CustomerTransactionId` varchar(255) DEFAULT NULL,
  `isVerified` enum('Accept','Reject','Pending') NOT NULL DEFAULT 'Pending',
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_07_10_040532_create_employment_status_table', 1),
(3, '2023_07_10_040552_create_department_table', 1),
(4, '2023_07_10_040609_create_role_table', 1),
(5, '2023_07_10_040624_create_shift_table', 1),
(6, '2023_07_10_040639_create_users_table', 1),
(7, '2023_07_11_071240_create_education_table', 1),
(8, '2023_07_12_065307_create_permission_table', 1),
(9, '2023_07_12_090218_create_role_permission_table', 1),
(10, '2023_07_16_082632_create_designation_table', 1),
(11, '2023_07_16_082811_create_designation_history_table', 1),
(12, '2023_07_16_090929_create_salary_history_table', 1),
(13, '2023_07_17_043454_create_currency_table', 1),
(14, '2023_07_17_043455_create_app_setting_table', 1),
(15, '2023_07_17_080852_create_account_table', 1),
(16, '2023_07_17_081817_create_sub_account_table', 1),
(17, '2023_07_17_101745_create_transaction_table', 1),
(18, '2023_08_15_072853_create_announcement_table', 1),
(19, '2023_08_16_041506_create_award_table', 1),
(20, '2023_08_16_065556_create_award_history_table', 1),
(21, '2023_08_23_083031_create_customer_table', 1),
(22, '2023_08_24_105303_create_quote_table', 1),
(23, '2023_08_29_081018_create_email_config_table', 1),
(24, '2023_08_30_065226_create_email_table', 1),
(25, '2023_09_12_070409_add_foreign_keys_to_users', 1),
(26, '2023_09_12_075853_create_discount_table', 1),
(27, '2023_09_12_085848_create_product_category_table', 1),
(28, '2023_09_12_102045_create_product_sub_category_table', 1),
(29, '2023_09_12_115431_create_product_brand_table', 1),
(30, '2023_09_13_051133_create_product_vat_table', 1),
(31, '2023_09_13_052834_create_uom_table', 1),
(32, '2023_09_13_052838_create_product_table', 1),
(33, '2023_09_13_090355_create_colors_table', 1),
(34, '2023_09_13_090642_create_product_color_table', 1),
(35, '2023_09_14_045604_create_adjust_invoice_table', 1),
(36, '2023_09_14_050114_create_adjust_invoice_product_table', 1),
(37, '2023_09_14_080843_create_supplier_table', 1),
(38, '2023_09_14_081416_create_purchase_invoice_table', 1),
(39, '2023_09_14_083711_create_purchase_invoice_product_table', 1),
(40, '2023_09_14_092035_create_return_purchase_invoice_table', 1),
(41, '2023_09_14_093131_create_return_purchase_invoice_product_table', 1),
(42, '2023_09_14_105322_create_quote_product_table', 1),
(43, '2023_09_17_054805_add_foreign_keys_to_product', 1),
(44, '2023_09_18_110701_create_customer_permissions_table', 1),
(45, '2023_09_19_050349_create_cart_table', 1),
(46, '2023_09_19_050350_create_sale_invoice_table', 1),
(47, '2023_09_19_050400_create_sale_invoice_product_table', 1),
(48, '2023_09_19_054001_create_sale_invoice_vat_table', 1),
(49, '2023_09_19_055200_create_return_sale_invoice_table', 1),
(50, '2023_09_19_055907_create_return_sale_invoice_product_table', 1),
(51, '2023_10_25_095135_create_coupon_table', 1),
(52, '2023_10_26_052811_create_purchase_reorder_invoice_table', 1),
(53, '2023_11_02_050923_create_page_size_table', 1),
(54, '2023_11_04_111759_create_cc_table', 1),
(55, '2023_11_04_111811_create_bcc_table', 1),
(56, '2023_11_25_075831_create_shipping_time_table', 1),
(57, '2023_11_25_075844_create_shipping_charge_table', 1),
(58, '2023_11_28_045336_create_review_rating_table', 1),
(59, '2023_11_28_074248_create_images_table', 1),
(60, '2023_11_29_055852_create_ecom_setting_table', 1),
(61, '2023_11_30_073626_create_password_reset_token_table', 1),
(62, '2023_12_05_063200_create_product_attribute_table', 1),
(63, '2023_12_05_063247_create_product_attribute_value_table', 1),
(64, '2023_12_05_063307_create_product_product_attribute_value_table', 1),
(65, '2023_12_05_063308_create_cart_product_table', 1),
(66, '2023_12_06_061300_create_slider_images_table', 1),
(67, '2023_12_06_080837_create_wishlist_table', 1),
(68, '2023_12_06_080838_create_product_wishlist_table', 1),
(69, '2023_12_12_043339_create_cart_attribute_value_table', 1),
(70, '2023_12_14_093757_create_payment_method_table', 1),
(71, '2023_12_23_082730_create_cart_order_table', 1),
(72, '2023_12_23_082827_create_cart_order_product_table', 1),
(73, '2023_12_28_172619_create_review_reply_table', 1),
(74, '2024_01_04_163014_create_manual_payment_table', 1),
(75, '2024_01_10_044930_create_cart_order_attribute_value_table', 1),
(76, '2024_01_10_060004_create_return_cart_order_table', 1),
(77, '2024_01_10_060057_create_return_cart_order_product_table', 1),
(78, '2024_01_10_060123_create_return_cart_order_attribute_value_table', 1),
(79, '2024_01_13_071032_create_delivery_fees_table', 1),
(80, '2024_01_16_051952_create_courier_medium_table', 1),
(81, '2024_01_16_063157_add_foreign_key_to_cart_order_table', 1),
(82, '2024_01_30_081025_create_terms_and_condition_table', 1),
(83, '2024_01_31_051242_create_laravelbd_sms_table', 1),
(84, '2024_02_14_074916_create_delivery_challan_table', 1),
(85, '2024_02_14_075722_create_delivery_challan_product_table', 1),
(86, '2024_02_14_084340_create_attachment_table', 1),
(87, '2024_02_21_104617_create_manufacturer_table', 1),
(88, '2024_02_21_104719_create_dimension_unit_table', 1),
(89, '2024_02_21_105644_create_weight_unit_table', 1),
(90, '2024_02_21_124856_create_product_variant_table', 1),
(91, '2024_02_28_064547_create_sms_purchase_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pageSize`
--

CREATE TABLE `pageSize` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pageSizeName` varchar(255) NOT NULL,
  `width` double(8,2) NOT NULL,
  `height` double(8,2) NOT NULL,
  `unit` varchar(255) NOT NULL DEFAULT 'inches',
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pageSize`
--

INSERT INTO `pageSize` (`id`, `pageSizeName`, `width`, `height`, `unit`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Demo Page Size', 8.30, 11.70, 'inches', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `PasswordResetToken`
--

CREATE TABLE `PasswordResetToken` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(255) NOT NULL,
  `experiresAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paymentMethod`
--

CREATE TABLE `paymentMethod` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subAccountId` bigint(20) UNSIGNED NOT NULL,
  `methodName` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `ownerAccount` varchar(255) DEFAULT NULL,
  `instruction` longtext DEFAULT NULL,
  `isActive` varchar(255) NOT NULL DEFAULT 'true',
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `paymentMethod`
--

INSERT INTO `paymentMethod` (`id`, `subAccountId`, `methodName`, `logo`, `ownerAccount`, `instruction`, `isActive`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Demo Payment Method', NULL, 'Demo Owner Account', 'Demo Instruction', 'true', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'create-paymentPurchaseInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(2, 'readAll-paymentPurchaseInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(3, 'readSingle-paymentPurchaseInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(4, 'update-paymentPurchaseInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(5, 'delete-paymentPurchaseInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(6, 'create-paymentSaleInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(7, 'readAll-paymentSaleInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(8, 'readSingle-paymentSaleInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(9, 'update-paymentSaleInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(10, 'delete-paymentSaleInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(11, 'create-returnSaleInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(12, 'readAll-returnSaleInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(13, 'readSingle-returnSaleInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(14, 'update-returnSaleInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(15, 'delete-returnSaleInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(16, 'create-purchaseInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(17, 'readAll-purchaseInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(18, 'readSingle-purchaseInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(19, 'update-purchaseInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(20, 'delete-purchaseInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(21, 'create-returnPurchaseInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(22, 'readAll-returnPurchaseInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(23, 'readSingle-returnPurchaseInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(24, 'update-returnPurchaseInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(25, 'delete-returnPurchaseInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(26, 'create-rolePermission', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(27, 'readAll-rolePermission', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(28, 'readSingle-rolePermission', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(29, 'update-rolePermission', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(30, 'delete-rolePermission', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(31, 'create-saleInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(32, 'readAll-saleInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(33, 'readSingle-saleInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(34, 'update-saleInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(35, 'delete-saleInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(36, 'create-transaction', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(37, 'readAll-transaction', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(38, 'readSingle-transaction', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(39, 'update-transaction', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(40, 'delete-transaction', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(41, 'create-permission', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(42, 'readAll-permission', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(43, 'readSingle-permission', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(44, 'update-permission', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(45, 'delete-permission', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(46, 'create-dashboard', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(47, 'readAll-dashboard', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(48, 'readSingle-dashboard', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(49, 'update-dashboard', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(50, 'delete-dashboard', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(51, 'create-customer', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(52, 'readAll-customer', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(53, 'readSingle-customer', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(54, 'update-customer', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(55, 'delete-customer', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(56, 'create-supplier', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(57, 'readAll-supplier', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(58, 'readSingle-supplier', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(59, 'update-supplier', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(60, 'delete-supplier', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(61, 'create-product', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(62, 'readAll-product', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(63, 'readSingle-product', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(64, 'update-product', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(65, 'delete-product', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(66, 'create-user', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(67, 'readAll-user', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(68, 'readSingle-user', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(69, 'update-user', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(70, 'delete-user', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(71, 'create-role', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(72, 'readAll-role', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(73, 'readSingle-role', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(74, 'update-role', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(75, 'delete-role', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(76, 'create-designation', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(77, 'readAll-designation', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(78, 'readSingle-designation', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(79, 'update-designation', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(80, 'delete-designation', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(81, 'create-productCategory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(82, 'readAll-productCategory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(83, 'readSingle-productCategory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(84, 'update-productCategory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(85, 'delete-productCategory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(86, 'create-account', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(87, 'readAll-account', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(88, 'readSingle-account', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(89, 'update-account', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(90, 'delete-account', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(91, 'create-setting', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(92, 'readAll-setting', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(93, 'readSingle-setting', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(94, 'update-setting', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(95, 'delete-setting', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(96, 'create-productSubCategory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(97, 'readAll-productSubCategory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(98, 'readSingle-productSubCategory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(99, 'update-productSubCategory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(100, 'delete-productSubCategory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(101, 'create-productBrand', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(102, 'readAll-productBrand', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(103, 'readSingle-productBrand', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(104, 'update-productBrand', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(105, 'delete-productBrand', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(106, 'create-email', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(107, 'readAll-email', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(108, 'readSingle-email', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(109, 'update-email', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(110, 'delete-email', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(111, 'create-adjust', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(112, 'readAll-adjust', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(113, 'readSingle-adjust', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(114, 'update-adjust', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(115, 'delete-adjust', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(116, 'create-warehouse', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(117, 'readAll-warehouse', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(118, 'readSingle-warehouse', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(119, 'update-warehouse', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(120, 'delete-warehouse', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(121, 'create-stock', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(122, 'readAll-stock', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(123, 'readSingle-stock', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(124, 'update-stock', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(125, 'delete-stock', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(126, 'create-attribute', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(127, 'readAll-attribute', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(128, 'readSingle-attribute', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(129, 'update-attribute', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(130, 'delete-attribute', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(131, 'create-color', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(132, 'readAll-color', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(133, 'readSingle-color', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(134, 'update-color', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(135, 'delete-color', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(136, 'create-meta', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(137, 'readAll-meta', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(138, 'readSingle-meta', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(139, 'update-meta', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(140, 'delete-meta', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(141, 'create-transfer', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(142, 'readAll-transfer', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(143, 'readSingle-transfer', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(144, 'update-transfer', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(145, 'delete-transfer', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(146, 'create-review', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(147, 'readAll-review', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(148, 'readSingle-review', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(149, 'update-review', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(150, 'delete-review', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(151, 'create-slider', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(152, 'readAll-slider', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(153, 'readSingle-slider', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(154, 'update-slider', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(155, 'delete-slider', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(156, 'create-shoppingCart', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(157, 'readAll-shoppingCart', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(158, 'readSingle-shoppingCart', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(159, 'update-shoppingCart', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(160, 'delete-shoppingCart', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(161, 'create-vat', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(162, 'readAll-vat', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(163, 'readSingle-vat', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(164, 'update-vat', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(165, 'delete-vat', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(166, 'create-reorderQuantity', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(167, 'readAll-reorderQuantity', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(168, 'readSingle-reorderQuantity', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(169, 'update-reorderQuantity', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(170, 'delete-reorderQuantity', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(171, 'create-coupon', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(172, 'readAll-coupon', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(173, 'readSingle-coupon', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(174, 'update-coupon', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(175, 'delete-coupon', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(176, 'create-purchaseReorderInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(177, 'readAll-purchaseReorderInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(178, 'readSingle-purchaseReorderInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(179, 'update-purchaseReorderInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(180, 'delete-purchaseReorderInvoice', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(181, 'create-pageSize', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(182, 'readAll-pageSize', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(183, 'readSingle-pageSize', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(184, 'update-pageSize', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(185, 'delete-pageSize', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(186, 'create-quote', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(187, 'readAll-quote', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(188, 'readSingle-quote', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(189, 'update-quote', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(190, 'delete-quote', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(191, 'create-emailConfig', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(192, 'readAll-emailConfig', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(193, 'readSingle-emailConfig', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(194, 'update-emailConfig', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(195, 'delete-emailConfig', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(196, 'create-shift', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(197, 'readAll-shift', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(198, 'readSingle-shift', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(199, 'update-shift', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(200, 'delete-shift', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(201, 'create-award', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(202, 'readAll-award', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(203, 'readSingle-award', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(204, 'update-award', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(205, 'delete-award', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(206, 'create-awardHistory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(207, 'readAll-awardHistory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(208, 'readSingle-awardHistory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(209, 'update-awardHistory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(210, 'delete-awardHistory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(211, 'create-department', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(212, 'readAll-department', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(213, 'readSingle-department', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(214, 'update-department', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(215, 'delete-department', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(216, 'create-designationHistory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(217, 'readAll-designationHistory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(218, 'readSingle-designationHistory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(219, 'update-designationHistory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(220, 'delete-designationHistory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(221, 'create-education', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(222, 'readAll-education', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(223, 'readSingle-education', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(224, 'update-education', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(225, 'delete-education', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(226, 'create-salaryHistory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(227, 'readAll-salaryHistory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(228, 'readSingle-salaryHistory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(229, 'update-salaryHistory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(230, 'delete-salaryHistory', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(231, 'create-employmentStatus', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(232, 'readAll-employmentStatus', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(233, 'readSingle-employmentStatus', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(234, 'update-employmentStatus', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(235, 'delete-employmentStatus', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(236, 'create-announcement', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(237, 'readAll-announcement', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(238, 'readSingle-announcement', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(239, 'update-announcement', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(240, 'delete-announcement', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(241, 'create-shippingCharge', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(242, 'readAll-shippingCharge', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(243, 'readSingle-shippingCharge', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(244, 'update-shippingCharge', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(245, 'delete-shippingCharge', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(246, 'create-discount', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(247, 'readAll-discount', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(248, 'readSingle-discount', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(249, 'update-discount', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(250, 'delete-discount', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(251, 'create-shippingTime', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(252, 'readAll-shippingTime', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(253, 'readSingle-shippingTime', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(254, 'update-shippingTime', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(255, 'delete-shippingTime', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(256, 'create-courier', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(257, 'readAll-courier', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(258, 'readSingle-courier', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(259, 'update-courier', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(260, 'delete-courier', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(261, 'create-courierMedium', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(262, 'readAll-courierMedium', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(263, 'readSingle-courierMedium', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(264, 'update-courierMedium', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(265, 'delete-courierMedium', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(266, 'create-productWishlist', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(267, 'readAll-productWishlist', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(268, 'readSingle-productWishlist', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(269, 'update-productWishlist', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(270, 'delete-productWishlist', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(271, 'create-ecomSetting', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(272, 'readAll-ecomSetting', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(273, 'readSingle-ecomSetting', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(274, 'update-ecomSetting', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(275, 'delete-ecomSetting', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(276, 'create-currency', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(277, 'readAll-currency', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(278, 'readSingle-currency', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(279, 'update-currency', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(280, 'delete-currency', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(281, 'create-productReports', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(282, 'readAll-productReports', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(283, 'readSingle-productReports', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(284, 'update-productReports', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(285, 'delete-productReports', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(286, 'create-cart', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(287, 'readAll-cart', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(288, 'readSingle-cart', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(289, 'update-cart', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(290, 'delete-cart', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(291, 'create-productAttribute', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(292, 'readAll-productAttribute', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(293, 'readSingle-productAttribute', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(294, 'update-productAttribute', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(295, 'delete-productAttribute', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(296, 'create-productAttributeValue', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(297, 'readAll-productAttributeValue', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(298, 'readSingle-productAttributeValue', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(299, 'update-productAttributeValue', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(300, 'delete-productAttributeValue', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(301, 'create-productProductAttributeValue', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(302, 'readAll-productProductAttributeValue', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(303, 'readSingle-productProductAttributeValue', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(304, 'update-productProductAttributeValue', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(305, 'delete-productProductAttributeValue', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(306, 'create-sliderImages', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(307, 'readAll-sliderImages', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(308, 'readSingle-sliderImages', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(309, 'update-sliderImages', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(310, 'delete-sliderImages', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(311, 'create-reviewRating', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(312, 'readAll-reviewRating', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(313, 'readSingle-reviewRating', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(314, 'update-reviewRating', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(315, 'delete-reviewRating', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(316, 'create-cartOrder', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(317, 'readAll-cartOrder', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(318, 'readSingle-cartOrder', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(319, 'update-cartOrder', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(320, 'delete-cartOrder', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(321, 'create-reviewReply', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(322, 'readAll-reviewReply', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(323, 'readSingle-reviewReply', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(324, 'update-reviewReply', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(325, 'delete-reviewReply', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(326, 'create-paymentMethod', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(327, 'readAll-paymentMethod', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(328, 'readSingle-paymentMethod', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(329, 'update-paymentMethod', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(330, 'delete-paymentMethod', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(331, 'create-manualPayment', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(332, 'readAll-manualPayment', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(333, 'readSingle-manualPayment', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(334, 'update-manualPayment', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(335, 'delete-manualPayment', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(336, 'create-returnCartOrder', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(337, 'readAll-returnCartOrder', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(338, 'readSingle-returnCartOrder', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(339, 'update-returnCartOrder', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(340, 'delete-returnCartOrder', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(341, 'create-deliveryFee', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(342, 'readAll-deliveryFee', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(343, 'readSingle-deliveryFee', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(344, 'update-deliveryFee', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(345, 'delete-deliveryFee', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(346, 'create-cartReOrder', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(347, 'readAll-cartReOrder', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(348, 'readSingle-cartReOrder', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(349, 'update-cartReOrder', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(350, 'delete-cartReOrder', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(351, 'create-termsAndCondition', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(352, 'readAll-termsAndCondition', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(353, 'readSingle-termsAndCondition', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(354, 'update-termsAndCondition', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(355, 'delete-termsAndCondition', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(356, 'create-smsConfig', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(357, 'readAll-smsConfig', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(358, 'readSingle-smsConfig', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(359, 'update-smsConfig', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(360, 'delete-smsConfig', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(361, 'create-uom', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(362, 'readAll-uom', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(363, 'readSingle-uom', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(364, 'update-uom', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(365, 'delete-uom', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(366, 'create-sms', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(367, 'readAll-sms', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(368, 'readSingle-sms', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(369, 'update-sms', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(370, 'delete-sms', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(371, 'create-deliveryChallan', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(372, 'readAll-deliveryChallan', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(373, 'readSingle-deliveryChallan', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(374, 'update-deliveryChallan', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(375, 'delete-deliveryChallan', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(376, 'create-wightUnit', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(377, 'readAll-wightUnit', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(378, 'readSingle-wightUnit', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(379, 'update-wightUnit', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(380, 'delete-wightUnit', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(381, 'create-dimensionUnit', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(382, 'readAll-dimensionUnit', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(383, 'readSingle-dimensionUnit', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(384, 'update-dimensionUnit', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(385, 'delete-dimensionUnit', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(386, 'create-manufacturer', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(387, 'readAll-manufacturer', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(388, 'readSingle-manufacturer', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(389, 'update-manufacturer', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(390, 'delete-manufacturer', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(391, 'readAll-onlineOrder', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(392, 'create-onlineOrder', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(393, 'readAll-wallet', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(394, 'create-wallet', '2024-10-04 11:48:22', '2024-10-04 11:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `productThumbnailImage` varchar(255) DEFAULT NULL,
  `productSubCategoryId` bigint(20) UNSIGNED DEFAULT NULL,
  `productBrandId` bigint(20) UNSIGNED DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `sku` varchar(255) NOT NULL,
  `productQuantity` int(11) DEFAULT NULL,
  `productSalePrice` double DEFAULT NULL,
  `productPurchasePrice` double DEFAULT NULL,
  `uomId` bigint(20) UNSIGNED DEFAULT NULL,
  `uomValue` double DEFAULT NULL,
  `reorderQuantity` int(11) DEFAULT NULL,
  `productVatId` bigint(20) UNSIGNED DEFAULT NULL,
  `shippingChargeComment` varchar(255) DEFAULT NULL,
  `discountId` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `purchaseInvoiceId` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `productThumbnailImage`, `productSubCategoryId`, `productBrandId`, `description`, `sku`, `productQuantity`, `productSalePrice`, `productPurchasePrice`, `uomId`, `uomValue`, `reorderQuantity`, `productVatId`, `shippingChargeComment`, `discountId`, `status`, `created_at`, `updated_at`, `purchaseInvoiceId`) VALUES
(1, 'Mr. Brasso Glass & Household Cleaner Mega Refill Pack', 'mr-brasso-cleaner.webp', 1, 1, NULL, 'mr-bra', 10, 1199, 1000, 3, 5, 5, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23', NULL),
(2, 'RFL Economy Bright Milk Pot 16 cm', 'rfl-economy-bright-milk-pot-16-cm-1-pcs.webp', 1, 1, NULL, 'rfl-', 5, 510, 400, 1, 1, 5, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23', NULL),
(3, 'Cotton Duster', 'cotton-duster-1-pcs.webp', 1, 1, NULL, 'cott', 2, 29, 20, 1, 1, 2, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23', NULL),
(4, 'Ariel Washing Powder', 'ariel-washing-powder-25-kg.webp', 1, 1, NULL, 'arie', 10, 1999, 1500, 2, 2.5, 2, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23', NULL),
(5, 'Lizol Floor Cleaner Floral Disinfectant Surface', 'lizol-floor-cleaner-floral-disinfectant-surface-1-ltr.webp', 1, 1, NULL, 'lizo', 12, 259, 200, 3, 1, 10, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23', NULL),
(6, 'Realme 12 Pro Plus 5G', 'Realme-12-Pro-Plus-5G-Official-Image.png', 2, 2, NULL, 'Realme', 6, 45000, 44000, 1, 1, 5, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23', NULL),
(7, 'Apple iPhone 14', 'Apple-iPhone-14-Plus-Official-Image.png', 2, 2, NULL, 'Apple-i', 6, 112000, 110000, 1, 1, 5, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23', NULL),
(8, 'Apple iPhone 13', 'Apple-iPhone-14-Official.png', 2, 2, NULL, 'Apple-', 10, 146999, 146000, 1, 1, 10, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23', NULL),
(9, 'Samsung Galaxy S23', 'Samsung-Galaxy-S23-Plus-Official-Image.png', 2, 2, NULL, 'Samsun', 20, 80000, 78000, 1, 1, 7, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23', NULL),
(10, 'Tecno Spark Go 2024', 'Tecno-Spark-Go-2024-Official-Image.png', 2, 2, NULL, 'Tecno-S', 10, 14000, 10000, 1, 1, 6, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23', NULL),
(11, 'Chest of Drawer- CHEVRON', 'cdh-145.jpg', 3, 3, NULL, 'cdh-', 5, 11900, 11000, 1, 1, 4, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23', NULL),
(12, 'CUPBOARD-FLORIDA-3 DOOR', 'cbh-3713-doorperspective.jpg', 3, 3, NULL, 'cbh-37', 10, 66875, 66000, 1, 1, 10, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23', NULL),
(13, 'CLOTH HANGER/ ALNA-BONZA', 'hch-306-1.jpg', 3, 3, NULL, 'hch-', 30, 5950, 5000, 1, 1, 20, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23', NULL),
(14, 'WOODEN SOFA-VENICE', 'sdc-343-perspecfftivergbcolor.jpg', 3, 3, NULL, 'sdc-34', 10, 21800, 21000, 1, 1, 7, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23', NULL),
(15, 'SINGLE SOFA-BABYLON', 'ssc-361view-01rgbcolor.jpg', 3, 3, NULL, 'ssc-3', 6, 13500, 13000, 1, 1, 5, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23', NULL),
(16, 'HP 250 G8 Core i3 11th Gen 15.6\" 4GB RAM 1TB HDD Laptop', '250-g8-ash-black-01-500x500.webp', 4, 4, NULL, '250-g8', 6, 55000, 50000, 1, 1, 5, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23', NULL),
(17, 'HP 15s-du3611TU Core i3 11th Gen 15.6\" FHD Laptop', '15s-du3022tu-01-500x500.jpg', 4, 4, NULL, '15s-', 10, 58850, 56000, 1, 1, 10, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23', NULL),
(18, 'HP 240 G8 Core i5 11th Gen 14\" FHD Laptop', '240-g8-0001-500x500.jpg', 4, 4, NULL, '240-g8', 10, 71500, 69000, 1, 1, 7, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23', NULL),
(19, 'HP 15s-fq5786TU Core i3 12th Gen 15.6\" FHD Laptop', '15s-fq2644tu-01-500x500.jpg', 4, 4, NULL, '15s-fq26', 7, 63000, 60000, 1, 1, 6, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23', NULL),
(20, 'Apple MacBook Air (2022) Apple M2 Chip 13.6-Inch Liquid Retina Display 8GB RAM 512GB SSD Midnight #MLY43LL/A', 'macbook-air-m2-chip-midnight-01-500x500.webp', 4, 4, NULL, 'macbo', 5, 182000, 180000, 1, 1, 4, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23', NULL),
(21, 'W7 Banana Dreams Loose', 'w7_banana_dreams_loose_powder_-_20gm.jpg', 5, 5, NULL, 'w7_b', 10, 399, 300, 5, 20, 10, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23', NULL),
(22, 'W7 Liquid Eyeliner Pot 8ml - Black', 'unspecified_64.jpg', 5, 5, NULL, 'unspe', 13, 215, 190, 4, 8, 10, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-11 15:57:42', NULL),
(23, 'J.Cat Beauty Lip Lock Mask-Proof Liquid Lip - Positive Mindset', 'j.cat_beauty_lip_lock_mask-proof_liquid_lip_-_positive_mindset.jpg', 5, 5, NULL, 'j.cat', 4, 580, 500, 1, 1, 5, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-11 15:57:42', NULL),
(24, 'Nivea Men Black & White Ivisible Original 48H Anti Perspirant Deodorant', 'nivea_men_black_white_ivisible_original_48h_anti_perspirant_deodorant.jpg', 5, 5, NULL, 'nivea_m', 4, 350, 300, 1, 1, 5, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-11 15:57:42', NULL),
(25, 'Cerave Diabetics Dry Skin Relief Moisturizing Cream 236ml', 'cerave_diabetics_dry_skin_relief_moisturizing_cream_236ml.jpg', 5, 5, NULL, 'cerave_', 7, 2249, 2000, 4, 236, 10, NULL, NULL, NULL, 'true', '2024-10-04 11:48:23', '2024-10-11 15:57:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `productAttribute`
--

CREATE TABLE `productAttribute` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productAttribute`
--

INSERT INTO `productAttribute` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Demo Attribute', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `productAttributeValue`
--

CREATE TABLE `productAttributeValue` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `productAttributeId` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productAttributeValue`
--

INSERT INTO `productAttributeValue` (`id`, `productAttributeId`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Demo Attribute Value', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `productBrand`
--

CREATE TABLE `productBrand` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productBrand`
--

INSERT INTO `productBrand` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Brand 1', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(2, 'Brand 2', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(3, 'Brand 3', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(4, 'Brand 4', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(5, 'Banana Liquid', 'true', '2024-10-04 11:48:23', '2024-10-09 10:48:01');

-- --------------------------------------------------------

--
-- Table structure for table `productCategory`
--

CREATE TABLE `productCategory` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productCategory`
--

INSERT INTO `productCategory` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Category 1', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(2, 'Category 2', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(3, 'Category 3', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(4, 'Category 4', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(5, 'MakeUp', 'true', '2024-10-04 11:48:23', '2024-10-09 10:46:31'),
(6, 'Rubbish', 'true', '2024-10-20 15:58:03', '2024-10-20 15:58:03');

-- --------------------------------------------------------

--
-- Table structure for table `productColor`
--

CREATE TABLE `productColor` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `productId` bigint(20) UNSIGNED NOT NULL,
  `colorId` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productColor`
--

INSERT INTO `productColor` (`id`, `productId`, `colorId`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `productProductAttributeValue`
--

CREATE TABLE `productProductAttributeValue` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `productId` bigint(20) UNSIGNED DEFAULT NULL,
  `productAttributeValueId` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productSubCategory`
--

CREATE TABLE `productSubCategory` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `productCategoryId` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productSubCategory`
--

INSERT INTO `productSubCategory` (`id`, `name`, `productCategoryId`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Household', 1, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(2, 'Mobile', 2, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(3, 'Furniture', 3, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(4, 'Laptop', 4, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(5, 'Cosmetics', 5, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `productVariant`
--

CREATE TABLE `productVariant` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `manufacturerId` bigint(20) UNSIGNED NOT NULL,
  `productBrandId` bigint(20) UNSIGNED NOT NULL,
  `subCategoryId` bigint(20) UNSIGNED NOT NULL,
  `purchaseTaxId` bigint(20) UNSIGNED NOT NULL,
  `salesTaxId` bigint(20) UNSIGNED NOT NULL,
  `uomId` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productVat`
--

CREATE TABLE `productVat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `percentage` double NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productVat`
--

INSERT INTO `productVat` (`id`, `title`, `percentage`, `status`, `created_at`, `updated_at`) VALUES
(1, 'standard', 10, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(2, 'import and supply', 15, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `productWishlist`
--

CREATE TABLE `productWishlist` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `wishlistId` bigint(20) UNSIGNED NOT NULL,
  `productId` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseInvoice`
--

CREATE TABLE `purchaseInvoice` (
  `id` char(36) NOT NULL,
  `date` datetime NOT NULL,
  `totalAmount` double NOT NULL,
  `totalTax` double DEFAULT NULL,
  `paidAmount` double NOT NULL,
  `dueAmount` double NOT NULL,
  `supplierId` bigint(20) UNSIGNED NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `supplierMemoNo` varchar(255) DEFAULT NULL,
  `invoiceMemoNo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseInvoiceProduct`
--

CREATE TABLE `purchaseInvoiceProduct` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoiceId` char(36) NOT NULL,
  `productId` bigint(20) UNSIGNED DEFAULT NULL,
  `productQuantity` int(11) NOT NULL,
  `productUnitPurchasePrice` double NOT NULL,
  `productFinalAmount` double NOT NULL,
  `tax` double DEFAULT NULL,
  `taxAmount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchaseReorderInvoice`
--

CREATE TABLE `purchaseReorderInvoice` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reorderInvoiceId` varchar(255) NOT NULL,
  `productId` bigint(20) UNSIGNED NOT NULL,
  `productQuantity` int(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quote`
--

CREATE TABLE `quote` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quoteOwnerId` bigint(20) UNSIGNED NOT NULL,
  `quoteName` varchar(255) NOT NULL,
  `quoteDate` datetime DEFAULT NULL,
  `expirationDate` datetime DEFAULT NULL,
  `termsAndConditions` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `discount` double(8,2) DEFAULT NULL,
  `totalAmount` double(8,2) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quoteProduct`
--

CREATE TABLE `quoteProduct` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quoteId` bigint(20) UNSIGNED NOT NULL,
  `productId` bigint(20) UNSIGNED NOT NULL,
  `unitPrice` double(8,2) NOT NULL,
  `productQuantity` int(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returnCartOrder`
--

CREATE TABLE `returnCartOrder` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cartOrderId` char(36) NOT NULL,
  `date` datetime NOT NULL,
  `totalAmount` double NOT NULL,
  `totalVatAmount` double DEFAULT NULL,
  `totalDiscountAmount` double DEFAULT NULL,
  `note` text DEFAULT NULL,
  `couponAmount` double DEFAULT NULL,
  `returnType` enum('PRODUCT','REFUND') NOT NULL,
  `returnCartOrderStatus` enum('PENDING','RECEIVED','REFUNDED','RESEND','RESENDED','REJECTED') NOT NULL DEFAULT 'PENDING',
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returnCartOrderAttributeValue`
--

CREATE TABLE `returnCartOrderAttributeValue` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `returnCartOrderProductId` bigint(20) UNSIGNED NOT NULL,
  `productAttributeValueId` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returnCartOrderProduct`
--

CREATE TABLE `returnCartOrderProduct` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `productId` bigint(20) UNSIGNED NOT NULL,
  `cartOrderProductId` bigint(20) UNSIGNED NOT NULL,
  `returnCartOrderId` bigint(20) UNSIGNED NOT NULL,
  `colorId` bigint(20) UNSIGNED DEFAULT NULL,
  `productQuantity` int(11) NOT NULL,
  `productSalePrice` double NOT NULL,
  `productVat` int(11) DEFAULT NULL,
  `discountType` varchar(255) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returnPurchaseInvoice`
--

CREATE TABLE `returnPurchaseInvoice` (
  `id` char(36) NOT NULL,
  `date` datetime NOT NULL,
  `totalAmount` double NOT NULL,
  `instantReturnAmount` double NOT NULL DEFAULT 0,
  `tax` double DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `purchaseInvoiceId` char(36) NOT NULL,
  `invoiceMemoNo` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returnPurchaseInvoiceProduct`
--

CREATE TABLE `returnPurchaseInvoiceProduct` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoiceId` char(36) NOT NULL,
  `purchaseInvoiceProductId` bigint(20) UNSIGNED NOT NULL,
  `productId` bigint(20) UNSIGNED DEFAULT NULL,
  `productQuantity` int(11) NOT NULL,
  `productUnitPurchasePrice` double NOT NULL,
  `productFinalAmount` double NOT NULL,
  `tax` double NOT NULL,
  `taxAmount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returnSaleInvoice`
--

CREATE TABLE `returnSaleInvoice` (
  `id` char(36) NOT NULL,
  `date` datetime NOT NULL,
  `totalAmount` double NOT NULL,
  `instantReturnAmount` double NOT NULL DEFAULT 0,
  `tax` double DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `saleInvoiceId` char(36) NOT NULL,
  `invoiceMemoNo` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returnSaleInvoiceProduct`
--

CREATE TABLE `returnSaleInvoiceProduct` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoiceId` char(36) NOT NULL,
  `productId` bigint(20) UNSIGNED DEFAULT NULL,
  `saleInvoiceProductId` bigint(20) UNSIGNED DEFAULT NULL,
  `productQuantity` int(11) NOT NULL,
  `productUnitSalePrice` double NOT NULL,
  `productFinalAmount` double NOT NULL,
  `tax` double NOT NULL,
  `taxAmount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviewRating`
--

CREATE TABLE `reviewRating` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `productId` bigint(20) UNSIGNED NOT NULL,
  `customerId` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviewReply`
--

CREATE TABLE `reviewReply` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reviewId` bigint(20) UNSIGNED NOT NULL,
  `adminId` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'super-admin', 'true', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(2, 'admin', 'true', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(3, 'customer', 'true', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(4, 'manager', 'true', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(5, 'salesman', 'true', '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(6, 'delivery-boy', 'true', '2024-10-04 11:48:22', '2024-10-04 11:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `rolePermission`
--

CREATE TABLE `rolePermission` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `roleId` bigint(20) UNSIGNED NOT NULL,
  `permissionId` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rolePermission`
--

INSERT INTO `rolePermission` (`id`, `roleId`, `permissionId`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(2, 1, 2, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(3, 1, 3, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(4, 1, 4, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(5, 1, 5, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(6, 1, 6, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(7, 1, 7, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(8, 1, 8, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(9, 1, 9, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(10, 1, 10, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(11, 1, 11, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(12, 1, 12, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(13, 1, 13, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(14, 1, 14, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(15, 1, 15, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(16, 1, 16, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(17, 1, 17, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(18, 1, 18, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(19, 1, 19, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(20, 1, 20, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(21, 1, 21, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(22, 1, 22, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(23, 1, 23, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(24, 1, 24, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(25, 1, 25, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(26, 1, 26, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(27, 1, 27, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(28, 1, 28, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(29, 1, 29, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(30, 1, 30, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(31, 1, 31, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(32, 1, 32, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(33, 1, 33, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(34, 1, 34, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(35, 1, 35, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(36, 1, 36, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(37, 1, 37, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(38, 1, 38, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(39, 1, 39, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(40, 1, 40, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(41, 1, 41, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(42, 1, 42, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(43, 1, 43, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(44, 1, 44, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(45, 1, 45, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(46, 1, 46, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(47, 1, 47, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(48, 1, 48, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(49, 1, 49, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(50, 1, 50, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(51, 1, 51, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(52, 1, 52, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(53, 1, 53, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(54, 1, 54, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(55, 1, 55, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(56, 1, 56, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(57, 1, 57, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(58, 1, 58, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(59, 1, 59, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(60, 1, 60, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(61, 1, 61, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(62, 1, 62, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(63, 1, 63, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(64, 1, 64, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(65, 1, 65, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(66, 1, 66, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(67, 1, 67, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(68, 1, 68, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(69, 1, 69, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(70, 1, 70, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(71, 1, 71, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(72, 1, 72, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(73, 1, 73, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(74, 1, 74, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(75, 1, 75, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(76, 1, 76, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(77, 1, 77, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(78, 1, 78, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(79, 1, 79, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(80, 1, 80, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(81, 1, 81, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(82, 1, 82, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(83, 1, 83, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(84, 1, 84, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(85, 1, 85, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(86, 1, 86, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(87, 1, 87, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(88, 1, 88, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(89, 1, 89, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(90, 1, 90, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(91, 1, 91, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(92, 1, 92, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(93, 1, 93, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(94, 1, 94, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(95, 1, 95, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(96, 1, 96, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(97, 1, 97, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(98, 1, 98, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(99, 1, 99, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(100, 1, 100, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(101, 1, 101, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(102, 1, 102, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(103, 1, 103, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(104, 1, 104, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(105, 1, 105, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(106, 1, 106, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(107, 1, 107, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(108, 1, 108, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(109, 1, 109, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(110, 1, 110, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(111, 1, 111, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(112, 1, 112, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(113, 1, 113, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(114, 1, 114, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(115, 1, 115, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(116, 1, 116, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(117, 1, 117, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(118, 1, 118, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(119, 1, 119, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(120, 1, 120, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(121, 1, 121, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(122, 1, 122, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(123, 1, 123, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(124, 1, 124, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(125, 1, 125, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(126, 1, 126, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(127, 1, 127, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(128, 1, 128, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(129, 1, 129, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(130, 1, 130, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(131, 1, 131, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(132, 1, 132, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(133, 1, 133, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(134, 1, 134, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(135, 1, 135, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(136, 1, 136, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(137, 1, 137, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(138, 1, 138, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(139, 1, 139, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(140, 1, 140, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(141, 1, 141, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(142, 1, 142, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(143, 1, 143, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(144, 1, 144, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(145, 1, 145, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(146, 1, 146, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(147, 1, 147, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(148, 1, 148, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(149, 1, 149, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(150, 1, 150, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(151, 1, 151, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(152, 1, 152, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(153, 1, 153, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(154, 1, 154, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(155, 1, 155, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(156, 1, 156, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(157, 1, 157, '2024-10-04 11:48:22', '2024-10-04 11:48:22'),
(158, 1, 158, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(159, 1, 159, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(160, 1, 160, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(161, 1, 161, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(162, 1, 162, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(163, 1, 163, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(164, 1, 164, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(165, 1, 165, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(166, 1, 166, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(167, 1, 167, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(168, 1, 168, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(169, 1, 169, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(170, 1, 170, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(171, 1, 171, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(172, 1, 172, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(173, 1, 173, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(174, 1, 174, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(175, 1, 175, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(176, 1, 176, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(177, 1, 177, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(178, 1, 178, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(179, 1, 179, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(180, 1, 180, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(181, 1, 181, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(182, 1, 182, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(183, 1, 183, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(184, 1, 184, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(185, 1, 185, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(186, 1, 186, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(187, 1, 187, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(188, 1, 188, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(189, 1, 189, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(190, 1, 190, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(191, 1, 191, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(192, 1, 192, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(193, 1, 193, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(194, 1, 194, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(195, 1, 195, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(196, 1, 196, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(197, 1, 197, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(198, 1, 198, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(199, 1, 199, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(200, 1, 200, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(201, 1, 201, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(202, 1, 202, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(203, 1, 203, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(204, 1, 204, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(205, 1, 205, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(206, 1, 206, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(207, 1, 207, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(208, 1, 208, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(209, 1, 209, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(210, 1, 210, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(211, 1, 211, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(212, 1, 212, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(213, 1, 213, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(214, 1, 214, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(215, 1, 215, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(216, 1, 216, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(217, 1, 217, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(218, 1, 218, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(219, 1, 219, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(220, 1, 220, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(221, 1, 221, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(222, 1, 222, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(223, 1, 223, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(224, 1, 224, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(225, 1, 225, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(226, 1, 226, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(227, 1, 227, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(228, 1, 228, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(229, 1, 229, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(230, 1, 230, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(231, 1, 231, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(232, 1, 232, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(233, 1, 233, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(234, 1, 234, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(235, 1, 235, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(236, 1, 236, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(237, 1, 237, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(238, 1, 238, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(239, 1, 239, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(240, 1, 240, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(241, 1, 241, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(242, 1, 242, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(243, 1, 243, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(244, 1, 244, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(245, 1, 245, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(246, 1, 246, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(247, 1, 247, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(248, 1, 248, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(249, 1, 249, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(250, 1, 250, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(251, 1, 251, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(252, 1, 252, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(253, 1, 253, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(254, 1, 254, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(255, 1, 255, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(256, 1, 256, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(257, 1, 257, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(258, 1, 258, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(259, 1, 259, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(260, 1, 260, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(261, 1, 261, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(262, 1, 262, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(263, 1, 263, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(264, 1, 264, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(265, 1, 265, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(266, 1, 266, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(267, 1, 267, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(268, 1, 268, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(269, 1, 269, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(270, 1, 270, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(271, 1, 271, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(272, 1, 272, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(273, 1, 273, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(274, 1, 274, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(275, 1, 275, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(276, 1, 276, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(277, 1, 277, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(278, 1, 278, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(279, 1, 279, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(280, 1, 280, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(281, 1, 281, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(282, 1, 282, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(283, 1, 283, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(284, 1, 284, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(285, 1, 285, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(286, 1, 286, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(287, 1, 287, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(288, 1, 288, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(289, 1, 289, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(290, 1, 290, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(291, 1, 291, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(292, 1, 292, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(293, 1, 293, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(294, 1, 294, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(295, 1, 295, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(296, 1, 296, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(297, 1, 297, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(298, 1, 298, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(299, 1, 299, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(300, 1, 300, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(301, 1, 301, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(302, 1, 302, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(303, 1, 303, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(304, 1, 304, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(305, 1, 305, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(306, 1, 306, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(307, 1, 307, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(308, 1, 308, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(309, 1, 309, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(310, 1, 310, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(311, 1, 311, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(312, 1, 312, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(313, 1, 313, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(314, 1, 314, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(315, 1, 315, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(316, 1, 316, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(317, 1, 317, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(318, 1, 318, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(319, 1, 319, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(320, 1, 320, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(321, 1, 321, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(322, 1, 322, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(323, 1, 323, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(324, 1, 324, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(325, 1, 325, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(326, 1, 326, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(327, 1, 327, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(328, 1, 328, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(329, 1, 329, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(330, 1, 330, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(331, 1, 331, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(332, 1, 332, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(333, 1, 333, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(334, 1, 334, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(335, 1, 335, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(336, 1, 336, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(337, 1, 337, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(338, 1, 338, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(339, 1, 339, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(340, 1, 340, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(341, 1, 341, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(342, 1, 342, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(343, 1, 343, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(344, 1, 344, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(345, 1, 345, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(346, 1, 346, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(347, 1, 347, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(348, 1, 348, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(349, 1, 349, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(350, 1, 350, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(351, 1, 351, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(352, 1, 352, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(353, 1, 353, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(354, 1, 354, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(355, 1, 355, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(356, 1, 356, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(357, 1, 357, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(358, 1, 358, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(359, 1, 359, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(360, 1, 360, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(361, 1, 361, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(362, 1, 362, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(363, 1, 363, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(364, 1, 364, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(365, 1, 365, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(366, 1, 366, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(367, 1, 367, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(368, 1, 368, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(369, 1, 369, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(370, 1, 370, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(371, 1, 371, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(372, 1, 372, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(373, 1, 373, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(374, 1, 374, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(375, 1, 375, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(376, 1, 376, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(377, 1, 377, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(378, 1, 378, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(379, 1, 379, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(380, 1, 380, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(381, 1, 381, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(382, 1, 382, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(383, 1, 383, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(384, 1, 384, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(385, 1, 385, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(386, 1, 386, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(387, 1, 387, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(388, 1, 388, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(389, 1, 389, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(390, 1, 390, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(391, 3, 31, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(392, 3, 32, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(393, 3, 33, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(394, 3, 53, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(395, 3, 54, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(396, 3, 62, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(397, 3, 63, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(398, 3, 82, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(399, 3, 97, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(400, 3, 102, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(401, 3, 152, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(402, 3, 156, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(403, 3, 158, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(404, 3, 159, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(405, 3, 283, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(406, 3, 266, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(407, 3, 267, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(408, 3, 268, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(409, 3, 269, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(410, 3, 270, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(411, 3, 282, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(412, 3, 286, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(413, 3, 288, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(414, 3, 289, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(415, 3, 306, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(416, 3, 307, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(417, 3, 308, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(418, 3, 309, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(419, 3, 311, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(420, 3, 316, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(421, 3, 317, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(422, 3, 318, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(423, 3, 319, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(424, 3, 320, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(425, 3, 327, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(426, 3, 336, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(427, 3, 337, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(428, 3, 338, '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(429, 3, 342, '2024-10-04 11:48:23', '2024-10-04 11:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `salaryHistory`
--

CREATE TABLE `salaryHistory` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `salary` double(8,2) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salaryHistory`
--

INSERT INTO `salaryHistory` (`id`, `userId`, `salary`, `startDate`, `endDate`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 10000.00, '2021-01-01 00:00:00', NULL, 'Monthly', 'true', '2024-10-04 11:48:22', '2024-10-04 11:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `saleInvoice`
--

CREATE TABLE `saleInvoice` (
  `id` char(36) NOT NULL,
  `date` datetime NOT NULL,
  `invoiceMemoNo` varchar(255) DEFAULT NULL,
  `totalAmount` double NOT NULL,
  `totalTaxAmount` double NOT NULL,
  `totalDiscountAmount` double NOT NULL,
  `paidAmount` double NOT NULL,
  `dueAmount` double NOT NULL,
  `profit` double NOT NULL,
  `dueDate` datetime DEFAULT NULL,
  `termsAndConditions` longtext DEFAULT NULL,
  `customerId` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `orderStatus` enum('PENDING','RECEIVED') NOT NULL DEFAULT 'PENDING',
  `isHold` varchar(255) NOT NULL DEFAULT 'false',
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `saleInvoice`
--

INSERT INTO `saleInvoice` (`id`, `date`, `invoiceMemoNo`, `totalAmount`, `totalTaxAmount`, `totalDiscountAmount`, `paidAmount`, `dueAmount`, `profit`, `dueDate`, `termsAndConditions`, `customerId`, `userId`, `note`, `address`, `orderStatus`, `isHold`, `status`, `created_at`, `updated_at`) VALUES
('S_5A5658E32SJA0', '2024-10-04 15:43:32', NULL, 3394, 0, 0, 0, 3394, 404, '2024-10-11 15:44:15', NULL, 1, 1, NULL, NULL, 'PENDING', 'false', 'true', '2024-10-04 15:44:21', '2024-10-04 15:44:21'),
('S_CY45MN3L0KQOW', '2024-10-11 15:56:26', NULL, 3394, 0, 0, 3394, 0, 404, '2024-10-04 15:57:14', NULL, 1, 1, NULL, NULL, 'RECEIVED', 'false', 'true', '2024-10-11 15:57:42', '2024-10-11 15:57:42'),
('S_ZFFGCU43ZWJWT', '2024-10-09 10:22:42', NULL, 2249, 0, 0, 2249, 0, 249, NULL, NULL, 1, 1, NULL, NULL, 'RECEIVED', 'false', 'true', '2024-10-09 10:24:19', '2024-10-09 10:24:19');

-- --------------------------------------------------------

--
-- Table structure for table `saleInvoiceProduct`
--

CREATE TABLE `saleInvoiceProduct` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `productId` bigint(20) UNSIGNED NOT NULL,
  `invoiceId` char(36) NOT NULL,
  `productQuantity` int(11) NOT NULL,
  `productUnitSalePrice` double NOT NULL,
  `productDiscount` double NOT NULL,
  `productFinalAmount` double NOT NULL,
  `tax` double NOT NULL,
  `taxAmount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `saleInvoiceProduct`
--

INSERT INTO `saleInvoiceProduct` (`id`, `productId`, `invoiceId`, `productQuantity`, `productUnitSalePrice`, `productDiscount`, `productFinalAmount`, `tax`, `taxAmount`, `created_at`, `updated_at`) VALUES
(1, 25, 'S_5A5658E32SJA0', 1, 2249, 0, 2249, 0, 0, '2024-10-04 15:44:21', '2024-10-04 15:44:21'),
(2, 24, 'S_5A5658E32SJA0', 1, 350, 0, 350, 0, 0, '2024-10-04 15:44:21', '2024-10-04 15:44:21'),
(3, 23, 'S_5A5658E32SJA0', 1, 580, 0, 580, 0, 0, '2024-10-04 15:44:21', '2024-10-04 15:44:21'),
(4, 22, 'S_5A5658E32SJA0', 1, 215, 0, 215, 0, 0, '2024-10-04 15:44:21', '2024-10-04 15:44:21'),
(5, 25, 'S_ZFFGCU43ZWJWT', 1, 2249, 0, 2249, 0, 0, '2024-10-09 10:24:19', '2024-10-09 10:24:19'),
(6, 25, 'S_CY45MN3L0KQOW', 1, 2249, 0, 2249, 0, 0, '2024-10-11 15:57:42', '2024-10-11 15:57:42'),
(7, 24, 'S_CY45MN3L0KQOW', 1, 350, 0, 350, 0, 0, '2024-10-11 15:57:42', '2024-10-11 15:57:42'),
(8, 23, 'S_CY45MN3L0KQOW', 1, 580, 0, 580, 0, 0, '2024-10-11 15:57:42', '2024-10-11 15:57:42'),
(9, 22, 'S_CY45MN3L0KQOW', 1, 215, 0, 215, 0, 0, '2024-10-11 15:57:42', '2024-10-11 15:57:42');

-- --------------------------------------------------------

--
-- Table structure for table `saleInvoiceVat`
--

CREATE TABLE `saleInvoiceVat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoiceId` bigint(20) UNSIGNED NOT NULL,
  `productVatId` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `workHour` double DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`id`, `name`, `startTime`, `endTime`, `workHour`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Demo Shift', '09:00:00', '15:00:00', 8, 'true', '2024-10-04 11:48:22', '2024-10-04 11:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `shippingCharge`
--

CREATE TABLE `shippingCharge` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Destination` varchar(255) DEFAULT NULL,
  `charge` double DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shippingTime`
--

CREATE TABLE `shippingTime` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `productId` bigint(20) UNSIGNED NOT NULL,
  `Destination` varchar(255) DEFAULT NULL,
  `EstimatedTimeDays` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliderImages`
--

CREATE TABLE `sliderImages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `linkUrl` varchar(255) DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `smsPurchase`
--

CREATE TABLE `smsPurchase` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchaseTotal` varchar(255) NOT NULL,
  `sendTotal` varchar(255) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subAccount`
--

CREATE TABLE `subAccount` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `accountId` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subAccount`
--

INSERT INTO `subAccount` (`id`, `name`, `accountId`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cash', 1, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(2, 'Bank', 1, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(3, 'Inventory', 1, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(4, 'Accounts Receivable', 1, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(5, 'Accounts Payable', 2, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(6, 'Shareholder 1 Equity', 3, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(7, 'Shareholder 1 Withdrawal', 4, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(8, 'Sales', 5, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(9, 'Cost of Sales', 6, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(10, 'Salary', 6, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(11, 'Rent', 6, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(12, 'Utilities', 6, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(13, 'Discount Earned', 5, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(14, 'Discount Given', 6, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(15, 'Tax', 2, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `phone`, `address`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Demo Supplier', '0101010000', 'Demo Address', NULL, 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `termsAndCondition`
--

CREATE TABLE `termsAndCondition` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `subject` longtext NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `debitId` bigint(20) UNSIGNED NOT NULL,
  `creditId` bigint(20) UNSIGNED NOT NULL,
  `particulars` varchar(255) NOT NULL,
  `amount` double NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `relatedId` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `date`, `debitId`, `creditId`, `particulars`, `amount`, `type`, `relatedId`, `status`, `created_at`, `updated_at`) VALUES
(1, '2024-10-04 15:43:32', 9, 3, 'Cost of sales on Sale Invoice #S_5A5658E32SJA0', 2990, 'sale', 'S_5A5658E32SJA0', 'true', '2024-10-04 15:44:21', '2024-10-04 15:44:21'),
(2, '2024-10-04 15:43:32', 4, 8, 'total sale price with discount on Sale Invoice #S_5A5658E32SJA0', 3394, 'sale', 'S_5A5658E32SJA0', 'true', '2024-10-04 15:44:21', '2024-10-04 15:44:21'),
(3, '2024-10-04 15:43:32', 4, 15, 'Tax on Sale Invoice #S_5A5658E32SJA0', 0, 'sale', 'S_5A5658E32SJA0', 'true', '2024-10-04 15:44:21', '2024-10-04 15:44:21'),
(4, '2024-10-09 10:22:42', 9, 3, 'Cost of sales on Sale Invoice #S_ZFFGCU43ZWJWT', 2000, 'sale', 'S_ZFFGCU43ZWJWT', 'true', '2024-10-09 10:24:19', '2024-10-09 10:24:19'),
(5, '2024-10-09 10:22:42', 4, 8, 'total sale price with discount on Sale Invoice #S_ZFFGCU43ZWJWT', 2249, 'sale', 'S_ZFFGCU43ZWJWT', 'true', '2024-10-09 10:24:19', '2024-10-09 10:24:19'),
(6, '2024-10-09 10:22:42', 4, 15, 'Tax on Sale Invoice #S_ZFFGCU43ZWJWT', 0, 'sale', 'S_ZFFGCU43ZWJWT', 'true', '2024-10-09 10:24:19', '2024-10-09 10:24:19'),
(7, '2024-10-09 10:22:42', 2, 4, 'Payment receive on Sale Invoice #S_ZFFGCU43ZWJWT', 2249, 'sale', 'S_ZFFGCU43ZWJWT', 'true', '2024-10-09 10:24:19', '2024-10-09 10:24:19'),
(8, '2024-10-11 15:56:26', 9, 3, 'Cost of sales on Sale Invoice #S_CY45MN3L0KQOW', 2990, 'sale', 'S_CY45MN3L0KQOW', 'true', '2024-10-11 15:57:42', '2024-10-11 15:57:42'),
(9, '2024-10-11 15:56:26', 4, 8, 'total sale price with discount on Sale Invoice #S_CY45MN3L0KQOW', 3394, 'sale', 'S_CY45MN3L0KQOW', 'true', '2024-10-11 15:57:42', '2024-10-11 15:57:42'),
(10, '2024-10-11 15:56:26', 4, 15, 'Tax on Sale Invoice #S_CY45MN3L0KQOW', 0, 'sale', 'S_CY45MN3L0KQOW', 'true', '2024-10-11 15:57:42', '2024-10-11 15:57:42'),
(11, '2024-10-11 15:56:26', 1, 4, 'Payment receive on Sale Invoice #S_CY45MN3L0KQOW', 3394, 'sale', 'S_CY45MN3L0KQOW', 'true', '2024-10-11 15:57:42', '2024-10-11 15:57:42');

-- --------------------------------------------------------

--
-- Table structure for table `uom`
--

CREATE TABLE `uom` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uom`
--

INSERT INTO `uom` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'pc', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(2, 'kg', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(3, 'ltr', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(4, 'ml', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23'),
(5, 'gm', 'true', '2024-10-04 11:48:23', '2024-10-04 11:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `refreshToken` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `employeeId` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `bloodGroup` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `employmentStatusId` bigint(20) UNSIGNED DEFAULT NULL,
  `departmentId` bigint(20) UNSIGNED DEFAULT NULL,
  `shiftId` bigint(20) UNSIGNED DEFAULT NULL,
  `roleId` bigint(20) UNSIGNED NOT NULL,
  `joinDate` datetime DEFAULT NULL,
  `leaveDate` datetime DEFAULT NULL,
  `isLogin` varchar(255) NOT NULL DEFAULT 'false',
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `designationId` bigint(20) UNSIGNED DEFAULT NULL,
  `businessName` varchar(255) NOT NULL,
  `businessType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `username`, `password`, `refreshToken`, `email`, `employeeId`, `phone`, `street`, `city`, `state`, `zipCode`, `country`, `bloodGroup`, `image`, `employmentStatusId`, `departmentId`, `shiftId`, `roleId`, `joinDate`, `leaveDate`, `isLogin`, `status`, `created_at`, `updated_at`, `designationId`, `businessName`, `businessType`) VALUES
(1, 'John', 'Doe', 'demo', '$2y$10$iHu1zmbishaN/XPq7cgUauqB7gfEATn02N7WvtN.ugqPfTtOoveRi', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzM4NCJ9.eyJzdWIiOjEsInJvbGUiOiJzdXBlci1hZG1pbiIsImV4cCI6MTczMjQ2NTM5NX0.HbQQjzbEz1fo3hcOWUs_CK2giLNjcCYFMSXTm7c766upVjPMOC1H_K7mDGx7ySBd', 'admin@gmail.com', '1001', '01700000000', 'Dhanmondi', 'Dhaka', 'Dhaka', '1205', 'Bangladesh', 'A+', NULL, 1, 1, 1, 1, '2021-07-10 00:00:00', NULL, 'true', 'true', '2024-10-04 11:48:22', '2024-10-25 16:23:15', 1, 'Lamisol Gadget', 'Product'),
(2, 'Mr.', 'Admin', 'admin', '12345678', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzM4NCJ9.eyJzdWIiOjIsInJvbGUiOiJhZG1pbiIsImV4cCI6MTczMDYzNDkzMH0.TD5XO1-fxQYbMQ9MkYPsoF1xZDw_mu5eJud8AbPxpqC_JF4wq3uLyXyzoZqkldQZ', NULL, '1002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 'true', 'true', '2024-10-04 11:48:22', '2024-10-04 11:55:30', NULL, '', ''),
(3, 'Mr.', 'Customer', 'customer', '$2y$10$nQycgTKwar1PZOp5QGMyk.767amflJEcaaWIecgzUhjDmGTXPAWWS', NULL, NULL, '1003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 'false', 'true', '2024-10-04 11:48:22', '2024-10-04 11:48:22', NULL, '', ''),
(4, 'Mrs.', 'Manager', 'manager', '$2y$10$vEXOp3COwrZDe4Lqw2GtmOifsliWKjDeU2Tl3nmIQYPVbAvEjwydG', NULL, NULL, '1004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, 'false', 'true', '2024-10-04 11:48:22', '2024-10-04 11:48:22', NULL, '', ''),
(5, 'Mr.', 'Salesman', 'salesman', '$2y$10$GKa.z32YcG/2sgqrDkdKeO5EfEaCgh4MkyRhXcNOnsBFtx3uTAwnu', NULL, NULL, '1005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 'false', 'true', '2024-10-04 11:48:22', '2024-10-04 11:48:22', NULL, '', ''),
(6, 'Mrs.', 'Delivery', 'delivery', '$2y$10$Q3zDHf8er27pnl7eGEXhpeK2ih.d7QTQc7ThESkP7qzVjml9w7qTy', NULL, NULL, '1006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, 'false', 'true', '2024-10-04 11:48:22', '2024-10-04 11:48:22', NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `weightUnit`
--

CREATE TABLE `weightUnit` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customerId` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adjustInvoice`
--
ALTER TABLE `adjustInvoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustinvoice_userid_foreign` (`userId`);

--
-- Indexes for table `adjustInvoiceProduct`
--
ALTER TABLE `adjustInvoiceProduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustinvoiceproduct_adjustinvoiceid_foreign` (`adjustInvoiceId`),
  ADD KEY `adjustinvoiceproduct_productid_foreign` (`productId`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appSetting`
--
ALTER TABLE `appSetting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appsetting_currencyid_foreign` (`currencyId`);

--
-- Indexes for table `attachment`
--
ALTER TABLE `attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attachment_emailid_foreign` (`emailId`);

--
-- Indexes for table `award`
--
ALTER TABLE `award`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `award_name_unique` (`name`);

--
-- Indexes for table `awardHistory`
--
ALTER TABLE `awardHistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `awardhistory_userid_foreign` (`userId`),
  ADD KEY `awardhistory_awardid_foreign` (`awardId`);

--
-- Indexes for table `bcc`
--
ALTER TABLE `bcc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bcc_emailid_foreign` (`emailId`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_customerid_foreign` (`customerId`);

--
-- Indexes for table `cartAttributeValue`
--
ALTER TABLE `cartAttributeValue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cartattributevalue_cartproductid_foreign` (`cartProductId`),
  ADD KEY `cartattributevalue_productattributevalueid_foreign` (`productAttributeValueId`);

--
-- Indexes for table `cartOrder`
--
ALTER TABLE `cartOrder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cartorder_customerid_foreign` (`customerId`),
  ADD KEY `cartorder_userid_foreign` (`userId`),
  ADD KEY `cartorder_couponid_foreign` (`couponId`),
  ADD KEY `cartorder_couriermediumid_foreign` (`courierMediumId`),
  ADD KEY `cartorder_deliveryfeeid_foreign` (`deliveryFeeId`);

--
-- Indexes for table `cartOrderAttributeValue`
--
ALTER TABLE `cartOrderAttributeValue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cartorderattributevalue_cartorderproductid_foreign` (`cartOrderProductId`),
  ADD KEY `cartorderattributevalue_productattributevalueid_foreign` (`productAttributeValueId`);

--
-- Indexes for table `cartOrderProduct`
--
ALTER TABLE `cartOrderProduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cartorderproduct_productid_foreign` (`productId`),
  ADD KEY `cartorderproduct_invoiceid_foreign` (`invoiceId`),
  ADD KEY `cartorderproduct_colorid_foreign` (`colorId`);

--
-- Indexes for table `cartProduct`
--
ALTER TABLE `cartProduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cartproduct_cartid_foreign` (`cartId`),
  ADD KEY `cartproduct_productid_foreign` (`productId`),
  ADD KEY `cartproduct_colorid_foreign` (`colorId`);

--
-- Indexes for table `cc`
--
ALTER TABLE `cc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cc_emailid_foreign` (`emailId`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courierMedium`
--
ALTER TABLE `courierMedium`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `couriermedium_couriermediumname_unique` (`courierMediumName`),
  ADD UNIQUE KEY `couriermedium_phone_unique` (`phone`),
  ADD UNIQUE KEY `couriermedium_email_unique` (`email`),
  ADD KEY `couriermedium_subaccountid_foreign` (`subAccountId`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_email_unique` (`email`),
  ADD KEY `customer_roleid_foreign` (`roleId`),
  ADD KEY `customer_email_phone_index` (`email`,`phone`);

--
-- Indexes for table `customerPermissions`
--
ALTER TABLE `customerPermissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryChallan`
--
ALTER TABLE `deliveryChallan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deliverychallan_challanno_unique` (`challanNo`),
  ADD KEY `deliverychallan_saleinvoiceid_foreign` (`saleInvoiceId`);

--
-- Indexes for table `deliveryChallanProduct`
--
ALTER TABLE `deliveryChallanProduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deliverychallanproduct_deliverychallanid_foreign` (`deliveryChallanId`);

--
-- Indexes for table `deliveryFee`
--
ALTER TABLE `deliveryFee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `designation_name_unique` (`name`);

--
-- Indexes for table `designationHistory`
--
ALTER TABLE `designationHistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designationhistory_userid_foreign` (`userId`),
  ADD KEY `designationhistory_designationid_foreign` (`designationId`);

--
-- Indexes for table `dimensionUnit`
--
ALTER TABLE `dimensionUnit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dimensionunit_name_unique` (`name`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecom_setting`
--
ALTER TABLE `ecom_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `education_userid_foreign` (`userId`);

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emailConfig`
--
ALTER TABLE `emailConfig`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employmentStatus`
--
ALTER TABLE `employmentStatus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employmentstatus_name_unique` (`name`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_productid_foreign` (`productId`),
  ADD KEY `images_reviewid_foreign` (`reviewId`);

--
-- Indexes for table `lbs_log`
--
ALTER TABLE `lbs_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manualPayment`
--
ALTER TABLE `manualPayment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `manualpayment_manualtransactionid_unique` (`manualTransactionId`),
  ADD KEY `manualpayment_customerid_foreign` (`customerId`),
  ADD KEY `manualpayment_cartorderid_foreign` (`cartOrderId`),
  ADD KEY `manualpayment_paymentmethodid_foreign` (`paymentMethodId`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `manufacturer_name_unique` (`name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pageSize`
--
ALTER TABLE `pageSize`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `PasswordResetToken`
--
ALTER TABLE `PasswordResetToken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `passwordresettoken_token_unique` (`token`),
  ADD KEY `passwordresettoken_userid_foreign` (`userId`);

--
-- Indexes for table `paymentMethod`
--
ALTER TABLE `paymentMethod`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paymentmethod_subaccountid_foreign` (`subAccountId`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permission_name_unique` (`name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_name_unique` (`name`),
  ADD UNIQUE KEY `product_sku_unique` (`sku`),
  ADD KEY `product_name_index` (`name`),
  ADD KEY `product_productsubcategoryid_foreign` (`productSubCategoryId`),
  ADD KEY `product_productbrandid_foreign` (`productBrandId`),
  ADD KEY `product_discountid_foreign` (`discountId`),
  ADD KEY `product_productvatid_foreign` (`productVatId`),
  ADD KEY `product_uomid_foreign` (`uomId`),
  ADD KEY `product_purchaseinvoiceid_foreign` (`purchaseInvoiceId`);

--
-- Indexes for table `productAttribute`
--
ALTER TABLE `productAttribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productAttributeValue`
--
ALTER TABLE `productAttributeValue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productattributevalue_productattributeid_foreign` (`productAttributeId`);

--
-- Indexes for table `productBrand`
--
ALTER TABLE `productBrand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `productbrand_name_unique` (`name`);

--
-- Indexes for table `productCategory`
--
ALTER TABLE `productCategory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `productcategory_name_unique` (`name`);

--
-- Indexes for table `productColor`
--
ALTER TABLE `productColor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productcolor_productid_foreign` (`productId`),
  ADD KEY `productcolor_colorid_foreign` (`colorId`);

--
-- Indexes for table `productProductAttributeValue`
--
ALTER TABLE `productProductAttributeValue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productproductattributevalue_productid_foreign` (`productId`),
  ADD KEY `productproductattributevalue_productattributevalueid_foreign` (`productAttributeValueId`);

--
-- Indexes for table `productSubCategory`
--
ALTER TABLE `productSubCategory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `productsubcategory_name_unique` (`name`),
  ADD KEY `productsubcategory_productcategoryid_foreign` (`productCategoryId`);

--
-- Indexes for table `productVariant`
--
ALTER TABLE `productVariant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productVat`
--
ALTER TABLE `productVat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productWishlist`
--
ALTER TABLE `productWishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productwishlist_wishlistid_foreign` (`wishlistId`),
  ADD KEY `productwishlist_productid_foreign` (`productId`);

--
-- Indexes for table `purchaseInvoice`
--
ALTER TABLE `purchaseInvoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchaseinvoice_supplierid_foreign` (`supplierId`);

--
-- Indexes for table `purchaseInvoiceProduct`
--
ALTER TABLE `purchaseInvoiceProduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchaseinvoiceproduct_invoiceid_foreign` (`invoiceId`),
  ADD KEY `purchaseinvoiceproduct_productid_foreign` (`productId`);

--
-- Indexes for table `purchaseReorderInvoice`
--
ALTER TABLE `purchaseReorderInvoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchasereorderinvoice_productid_foreign` (`productId`);

--
-- Indexes for table `quote`
--
ALTER TABLE `quote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_quoteownerid_foreign` (`quoteOwnerId`);

--
-- Indexes for table `quoteProduct`
--
ALTER TABLE `quoteProduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quoteproduct_quoteid_foreign` (`quoteId`),
  ADD KEY `quoteproduct_productid_foreign` (`productId`);

--
-- Indexes for table `returnCartOrder`
--
ALTER TABLE `returnCartOrder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `returncartorder_cartorderid_foreign` (`cartOrderId`);

--
-- Indexes for table `returnCartOrderAttributeValue`
--
ALTER TABLE `returnCartOrderAttributeValue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `returncartorderattributevalue_returncartorderproductid_foreign` (`returnCartOrderProductId`),
  ADD KEY `returncartorderattributevalue_productattributevalueid_foreign` (`productAttributeValueId`);

--
-- Indexes for table `returnCartOrderProduct`
--
ALTER TABLE `returnCartOrderProduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `returncartorderproduct_productid_foreign` (`productId`),
  ADD KEY `returncartorderproduct_cartorderproductid_foreign` (`cartOrderProductId`),
  ADD KEY `returncartorderproduct_returncartorderid_foreign` (`returnCartOrderId`),
  ADD KEY `returncartorderproduct_colorid_foreign` (`colorId`);

--
-- Indexes for table `returnPurchaseInvoice`
--
ALTER TABLE `returnPurchaseInvoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `returnpurchaseinvoice_purchaseinvoiceid_foreign` (`purchaseInvoiceId`);

--
-- Indexes for table `returnPurchaseInvoiceProduct`
--
ALTER TABLE `returnPurchaseInvoiceProduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `returnpurchaseinvoiceproduct_invoiceid_foreign` (`invoiceId`),
  ADD KEY `returnpurchaseinvoiceproduct_productid_foreign` (`productId`),
  ADD KEY `returnpurchaseinvoiceproduct_purchaseinvoiceproductid_foreign` (`purchaseInvoiceProductId`);

--
-- Indexes for table `returnSaleInvoice`
--
ALTER TABLE `returnSaleInvoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `returnsaleinvoice_saleinvoiceid_foreign` (`saleInvoiceId`);

--
-- Indexes for table `returnSaleInvoiceProduct`
--
ALTER TABLE `returnSaleInvoiceProduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `returnsaleinvoiceproduct_invoiceid_foreign` (`invoiceId`),
  ADD KEY `returnsaleinvoiceproduct_productid_foreign` (`productId`),
  ADD KEY `returnsaleinvoiceproduct_saleinvoiceproductid_foreign` (`saleInvoiceProductId`);

--
-- Indexes for table `reviewRating`
--
ALTER TABLE `reviewRating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviewrating_productid_foreign` (`productId`),
  ADD KEY `reviewrating_customerid_foreign` (`customerId`);

--
-- Indexes for table `reviewReply`
--
ALTER TABLE `reviewReply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviewreply_reviewid_foreign` (`reviewId`),
  ADD KEY `reviewreply_adminid_foreign` (`adminId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rolePermission`
--
ALTER TABLE `rolePermission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rolepermission_roleid_foreign` (`roleId`),
  ADD KEY `rolepermission_permissionid_foreign` (`permissionId`);

--
-- Indexes for table `salaryHistory`
--
ALTER TABLE `salaryHistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salaryhistory_userid_foreign` (`userId`);

--
-- Indexes for table `saleInvoice`
--
ALTER TABLE `saleInvoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saleinvoice_customerid_foreign` (`customerId`),
  ADD KEY `saleinvoice_userid_foreign` (`userId`);

--
-- Indexes for table `saleInvoiceProduct`
--
ALTER TABLE `saleInvoiceProduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saleinvoiceproduct_productid_foreign` (`productId`),
  ADD KEY `saleinvoiceproduct_invoiceid_foreign` (`invoiceId`);

--
-- Indexes for table `saleInvoiceVat`
--
ALTER TABLE `saleInvoiceVat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saleinvoicevat_productvatid_foreign` (`productVatId`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shift_name_unique` (`name`);

--
-- Indexes for table `shippingCharge`
--
ALTER TABLE `shippingCharge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippingTime`
--
ALTER TABLE `shippingTime`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shippingtime_productid_foreign` (`productId`);

--
-- Indexes for table `sliderImages`
--
ALTER TABLE `sliderImages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smsPurchase`
--
ALTER TABLE `smsPurchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subAccount`
--
ALTER TABLE `subAccount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subaccount_accountid_foreign` (`accountId`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `supplier_phone_unique` (`phone`),
  ADD UNIQUE KEY `supplier_email_unique` (`email`);

--
-- Indexes for table `termsAndCondition`
--
ALTER TABLE `termsAndCondition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_debitid_foreign` (`debitId`),
  ADD KEY `transaction_creditid_foreign` (`creditId`);

--
-- Indexes for table `uom`
--
ALTER TABLE `uom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_employeeid_unique` (`employeeId`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_roleid_foreign` (`roleId`),
  ADD KEY `users_employmentstatusid_foreign` (`employmentStatusId`),
  ADD KEY `users_departmentid_foreign` (`departmentId`),
  ADD KEY `users_shiftid_foreign` (`shiftId`),
  ADD KEY `users_designationid_foreign` (`designationId`);

--
-- Indexes for table `weightUnit`
--
ALTER TABLE `weightUnit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `weightunit_name_unique` (`name`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_customerid_foreign` (`customerId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `adjustInvoice`
--
ALTER TABLE `adjustInvoice`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adjustInvoiceProduct`
--
ALTER TABLE `adjustInvoiceProduct`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appSetting`
--
ALTER TABLE `appSetting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attachment`
--
ALTER TABLE `attachment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `award`
--
ALTER TABLE `award`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `awardHistory`
--
ALTER TABLE `awardHistory`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bcc`
--
ALTER TABLE `bcc`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cartAttributeValue`
--
ALTER TABLE `cartAttributeValue`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cartOrderAttributeValue`
--
ALTER TABLE `cartOrderAttributeValue`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cartOrderProduct`
--
ALTER TABLE `cartOrderProduct`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cartProduct`
--
ALTER TABLE `cartProduct`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cc`
--
ALTER TABLE `cc`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courierMedium`
--
ALTER TABLE `courierMedium`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customerPermissions`
--
ALTER TABLE `customerPermissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveryChallan`
--
ALTER TABLE `deliveryChallan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveryChallanProduct`
--
ALTER TABLE `deliveryChallanProduct`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveryFee`
--
ALTER TABLE `deliveryFee`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `designationHistory`
--
ALTER TABLE `designationHistory`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dimensionUnit`
--
ALTER TABLE `dimensionUnit`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ecom_setting`
--
ALTER TABLE `ecom_setting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emailConfig`
--
ALTER TABLE `emailConfig`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employmentStatus`
--
ALTER TABLE `employmentStatus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lbs_log`
--
ALTER TABLE `lbs_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manualPayment`
--
ALTER TABLE `manualPayment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `pageSize`
--
ALTER TABLE `pageSize`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `PasswordResetToken`
--
ALTER TABLE `PasswordResetToken`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paymentMethod`
--
ALTER TABLE `paymentMethod`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=395;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `productAttribute`
--
ALTER TABLE `productAttribute`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `productAttributeValue`
--
ALTER TABLE `productAttributeValue`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `productBrand`
--
ALTER TABLE `productBrand`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `productCategory`
--
ALTER TABLE `productCategory`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `productColor`
--
ALTER TABLE `productColor`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `productProductAttributeValue`
--
ALTER TABLE `productProductAttributeValue`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productSubCategory`
--
ALTER TABLE `productSubCategory`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `productVariant`
--
ALTER TABLE `productVariant`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productVat`
--
ALTER TABLE `productVat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `productWishlist`
--
ALTER TABLE `productWishlist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseInvoiceProduct`
--
ALTER TABLE `purchaseInvoiceProduct`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchaseReorderInvoice`
--
ALTER TABLE `purchaseReorderInvoice`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quote`
--
ALTER TABLE `quote`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quoteProduct`
--
ALTER TABLE `quoteProduct`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returnCartOrder`
--
ALTER TABLE `returnCartOrder`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returnCartOrderAttributeValue`
--
ALTER TABLE `returnCartOrderAttributeValue`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returnCartOrderProduct`
--
ALTER TABLE `returnCartOrderProduct`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returnPurchaseInvoiceProduct`
--
ALTER TABLE `returnPurchaseInvoiceProduct`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returnSaleInvoiceProduct`
--
ALTER TABLE `returnSaleInvoiceProduct`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviewRating`
--
ALTER TABLE `reviewRating`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviewReply`
--
ALTER TABLE `reviewReply`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rolePermission`
--
ALTER TABLE `rolePermission`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=430;

--
-- AUTO_INCREMENT for table `salaryHistory`
--
ALTER TABLE `salaryHistory`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `saleInvoiceProduct`
--
ALTER TABLE `saleInvoiceProduct`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `saleInvoiceVat`
--
ALTER TABLE `saleInvoiceVat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippingCharge`
--
ALTER TABLE `shippingCharge`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shippingTime`
--
ALTER TABLE `shippingTime`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliderImages`
--
ALTER TABLE `sliderImages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `smsPurchase`
--
ALTER TABLE `smsPurchase`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subAccount`
--
ALTER TABLE `subAccount`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `termsAndCondition`
--
ALTER TABLE `termsAndCondition`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `uom`
--
ALTER TABLE `uom`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `weightUnit`
--
ALTER TABLE `weightUnit`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adjustInvoice`
--
ALTER TABLE `adjustInvoice`
  ADD CONSTRAINT `adjustinvoice_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `adjustInvoiceProduct`
--
ALTER TABLE `adjustInvoiceProduct`
  ADD CONSTRAINT `adjustinvoiceproduct_adjustinvoiceid_foreign` FOREIGN KEY (`adjustInvoiceId`) REFERENCES `adjustInvoice` (`id`),
  ADD CONSTRAINT `adjustinvoiceproduct_productid_foreign` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Constraints for table `appSetting`
--
ALTER TABLE `appSetting`
  ADD CONSTRAINT `appsetting_currencyid_foreign` FOREIGN KEY (`currencyId`) REFERENCES `currency` (`id`);

--
-- Constraints for table `attachment`
--
ALTER TABLE `attachment`
  ADD CONSTRAINT `attachment_emailid_foreign` FOREIGN KEY (`emailId`) REFERENCES `email` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `awardHistory`
--
ALTER TABLE `awardHistory`
  ADD CONSTRAINT `awardhistory_awardid_foreign` FOREIGN KEY (`awardId`) REFERENCES `award` (`id`),
  ADD CONSTRAINT `awardhistory_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `bcc`
--
ALTER TABLE `bcc`
  ADD CONSTRAINT `bcc_emailid_foreign` FOREIGN KEY (`emailId`) REFERENCES `email` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_customerid_foreign` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`);

--
-- Constraints for table `cartAttributeValue`
--
ALTER TABLE `cartAttributeValue`
  ADD CONSTRAINT `cartattributevalue_cartproductid_foreign` FOREIGN KEY (`cartProductId`) REFERENCES `cartProduct` (`id`),
  ADD CONSTRAINT `cartattributevalue_productattributevalueid_foreign` FOREIGN KEY (`productAttributeValueId`) REFERENCES `productAttributeValue` (`id`);

--
-- Constraints for table `cartOrder`
--
ALTER TABLE `cartOrder`
  ADD CONSTRAINT `cartorder_couponid_foreign` FOREIGN KEY (`couponId`) REFERENCES `coupon` (`id`),
  ADD CONSTRAINT `cartorder_couriermediumid_foreign` FOREIGN KEY (`courierMediumId`) REFERENCES `courierMedium` (`id`),
  ADD CONSTRAINT `cartorder_customerid_foreign` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cartorder_deliveryfeeid_foreign` FOREIGN KEY (`deliveryFeeId`) REFERENCES `deliveryFee` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cartorder_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cartOrderAttributeValue`
--
ALTER TABLE `cartOrderAttributeValue`
  ADD CONSTRAINT `cartorderattributevalue_cartorderproductid_foreign` FOREIGN KEY (`cartOrderProductId`) REFERENCES `cartOrderProduct` (`id`),
  ADD CONSTRAINT `cartorderattributevalue_productattributevalueid_foreign` FOREIGN KEY (`productAttributeValueId`) REFERENCES `productAttributeValue` (`id`);

--
-- Constraints for table `cartOrderProduct`
--
ALTER TABLE `cartOrderProduct`
  ADD CONSTRAINT `cartorderproduct_colorid_foreign` FOREIGN KEY (`colorId`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `cartorderproduct_invoiceid_foreign` FOREIGN KEY (`invoiceId`) REFERENCES `cartOrder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cartorderproduct_productid_foreign` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Constraints for table `cartProduct`
--
ALTER TABLE `cartProduct`
  ADD CONSTRAINT `cartproduct_cartid_foreign` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `cartproduct_colorid_foreign` FOREIGN KEY (`colorId`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `cartproduct_productid_foreign` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Constraints for table `cc`
--
ALTER TABLE `cc`
  ADD CONSTRAINT `cc_emailid_foreign` FOREIGN KEY (`emailId`) REFERENCES `email` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `courierMedium`
--
ALTER TABLE `courierMedium`
  ADD CONSTRAINT `couriermedium_subaccountid_foreign` FOREIGN KEY (`subAccountId`) REFERENCES `subAccount` (`id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_roleid_foreign` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`);

--
-- Constraints for table `deliveryChallan`
--
ALTER TABLE `deliveryChallan`
  ADD CONSTRAINT `deliverychallan_saleinvoiceid_foreign` FOREIGN KEY (`saleInvoiceId`) REFERENCES `saleInvoice` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `deliveryChallanProduct`
--
ALTER TABLE `deliveryChallanProduct`
  ADD CONSTRAINT `deliverychallanproduct_deliverychallanid_foreign` FOREIGN KEY (`deliveryChallanId`) REFERENCES `deliveryChallan` (`challanNo`) ON DELETE CASCADE;

--
-- Constraints for table `designationHistory`
--
ALTER TABLE `designationHistory`
  ADD CONSTRAINT `designationhistory_designationid_foreign` FOREIGN KEY (`designationId`) REFERENCES `designation` (`id`),
  ADD CONSTRAINT `designationhistory_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `education_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_productid_foreign` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `images_reviewid_foreign` FOREIGN KEY (`reviewId`) REFERENCES `reviewRating` (`id`);

--
-- Constraints for table `manualPayment`
--
ALTER TABLE `manualPayment`
  ADD CONSTRAINT `manualpayment_cartorderid_foreign` FOREIGN KEY (`cartOrderId`) REFERENCES `cartOrder` (`id`),
  ADD CONSTRAINT `manualpayment_customerid_foreign` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `manualpayment_paymentmethodid_foreign` FOREIGN KEY (`paymentMethodId`) REFERENCES `paymentMethod` (`id`);

--
-- Constraints for table `PasswordResetToken`
--
ALTER TABLE `PasswordResetToken`
  ADD CONSTRAINT `passwordresettoken_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `paymentMethod`
--
ALTER TABLE `paymentMethod`
  ADD CONSTRAINT `paymentmethod_subaccountid_foreign` FOREIGN KEY (`subAccountId`) REFERENCES `subAccount` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_discountid_foreign` FOREIGN KEY (`discountId`) REFERENCES `discount` (`id`),
  ADD CONSTRAINT `product_productbrandid_foreign` FOREIGN KEY (`productBrandId`) REFERENCES `productBrand` (`id`),
  ADD CONSTRAINT `product_productsubcategoryid_foreign` FOREIGN KEY (`productSubCategoryId`) REFERENCES `productSubCategory` (`id`),
  ADD CONSTRAINT `product_productvatid_foreign` FOREIGN KEY (`productVatId`) REFERENCES `productVat` (`id`),
  ADD CONSTRAINT `product_purchaseinvoiceid_foreign` FOREIGN KEY (`purchaseInvoiceId`) REFERENCES `purchaseInvoice` (`id`),
  ADD CONSTRAINT `product_uomid_foreign` FOREIGN KEY (`uomId`) REFERENCES `uom` (`id`);

--
-- Constraints for table `productAttributeValue`
--
ALTER TABLE `productAttributeValue`
  ADD CONSTRAINT `productattributevalue_productattributeid_foreign` FOREIGN KEY (`productAttributeId`) REFERENCES `productAttribute` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `productColor`
--
ALTER TABLE `productColor`
  ADD CONSTRAINT `productcolor_colorid_foreign` FOREIGN KEY (`colorId`) REFERENCES `colors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `productcolor_productid_foreign` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `productProductAttributeValue`
--
ALTER TABLE `productProductAttributeValue`
  ADD CONSTRAINT `productproductattributevalue_productattributevalueid_foreign` FOREIGN KEY (`productAttributeValueId`) REFERENCES `productAttributeValue` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `productproductattributevalue_productid_foreign` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `productSubCategory`
--
ALTER TABLE `productSubCategory`
  ADD CONSTRAINT `productsubcategory_productcategoryid_foreign` FOREIGN KEY (`productCategoryId`) REFERENCES `productCategory` (`id`);

--
-- Constraints for table `productWishlist`
--
ALTER TABLE `productWishlist`
  ADD CONSTRAINT `productwishlist_productid_foreign` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `productwishlist_wishlistid_foreign` FOREIGN KEY (`wishlistId`) REFERENCES `wishlist` (`id`);

--
-- Constraints for table `purchaseInvoice`
--
ALTER TABLE `purchaseInvoice`
  ADD CONSTRAINT `purchaseinvoice_supplierid_foreign` FOREIGN KEY (`supplierId`) REFERENCES `supplier` (`id`);

--
-- Constraints for table `purchaseInvoiceProduct`
--
ALTER TABLE `purchaseInvoiceProduct`
  ADD CONSTRAINT `purchaseinvoiceproduct_invoiceid_foreign` FOREIGN KEY (`invoiceId`) REFERENCES `purchaseInvoice` (`id`),
  ADD CONSTRAINT `purchaseinvoiceproduct_productid_foreign` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Constraints for table `purchaseReorderInvoice`
--
ALTER TABLE `purchaseReorderInvoice`
  ADD CONSTRAINT `purchasereorderinvoice_productid_foreign` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Constraints for table `quote`
--
ALTER TABLE `quote`
  ADD CONSTRAINT `quote_quoteownerid_foreign` FOREIGN KEY (`quoteOwnerId`) REFERENCES `users` (`id`);

--
-- Constraints for table `quoteProduct`
--
ALTER TABLE `quoteProduct`
  ADD CONSTRAINT `quoteproduct_productid_foreign` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quoteproduct_quoteid_foreign` FOREIGN KEY (`quoteId`) REFERENCES `quote` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `returnCartOrder`
--
ALTER TABLE `returnCartOrder`
  ADD CONSTRAINT `returncartorder_cartorderid_foreign` FOREIGN KEY (`cartOrderId`) REFERENCES `cartOrder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `returnCartOrderAttributeValue`
--
ALTER TABLE `returnCartOrderAttributeValue`
  ADD CONSTRAINT `returncartorderattributevalue_productattributevalueid_foreign` FOREIGN KEY (`productAttributeValueId`) REFERENCES `productAttributeValue` (`id`),
  ADD CONSTRAINT `returncartorderattributevalue_returncartorderproductid_foreign` FOREIGN KEY (`returnCartOrderProductId`) REFERENCES `returnCartOrderProduct` (`id`);

--
-- Constraints for table `returnCartOrderProduct`
--
ALTER TABLE `returnCartOrderProduct`
  ADD CONSTRAINT `returncartorderproduct_cartorderproductid_foreign` FOREIGN KEY (`cartOrderProductId`) REFERENCES `cartOrderProduct` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `returncartorderproduct_colorid_foreign` FOREIGN KEY (`colorId`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `returncartorderproduct_productid_foreign` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `returncartorderproduct_returncartorderid_foreign` FOREIGN KEY (`returnCartOrderId`) REFERENCES `returnCartOrder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `returnPurchaseInvoice`
--
ALTER TABLE `returnPurchaseInvoice`
  ADD CONSTRAINT `returnpurchaseinvoice_purchaseinvoiceid_foreign` FOREIGN KEY (`purchaseInvoiceId`) REFERENCES `purchaseInvoice` (`id`);

--
-- Constraints for table `returnPurchaseInvoiceProduct`
--
ALTER TABLE `returnPurchaseInvoiceProduct`
  ADD CONSTRAINT `returnpurchaseinvoiceproduct_invoiceid_foreign` FOREIGN KEY (`invoiceId`) REFERENCES `returnPurchaseInvoice` (`id`),
  ADD CONSTRAINT `returnpurchaseinvoiceproduct_productid_foreign` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `returnpurchaseinvoiceproduct_purchaseinvoiceproductid_foreign` FOREIGN KEY (`purchaseInvoiceProductId`) REFERENCES `purchaseInvoiceProduct` (`id`);

--
-- Constraints for table `returnSaleInvoice`
--
ALTER TABLE `returnSaleInvoice`
  ADD CONSTRAINT `returnsaleinvoice_saleinvoiceid_foreign` FOREIGN KEY (`saleInvoiceId`) REFERENCES `saleInvoice` (`id`);

--
-- Constraints for table `returnSaleInvoiceProduct`
--
ALTER TABLE `returnSaleInvoiceProduct`
  ADD CONSTRAINT `returnsaleinvoiceproduct_invoiceid_foreign` FOREIGN KEY (`invoiceId`) REFERENCES `returnSaleInvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `returnsaleinvoiceproduct_productid_foreign` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `returnsaleinvoiceproduct_saleinvoiceproductid_foreign` FOREIGN KEY (`saleInvoiceProductId`) REFERENCES `saleInvoiceProduct` (`id`);

--
-- Constraints for table `reviewRating`
--
ALTER TABLE `reviewRating`
  ADD CONSTRAINT `reviewrating_customerid_foreign` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `reviewrating_productid_foreign` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Constraints for table `reviewReply`
--
ALTER TABLE `reviewReply`
  ADD CONSTRAINT `reviewreply_adminid_foreign` FOREIGN KEY (`adminId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviewreply_reviewid_foreign` FOREIGN KEY (`reviewId`) REFERENCES `reviewRating` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rolePermission`
--
ALTER TABLE `rolePermission`
  ADD CONSTRAINT `rolepermission_permissionid_foreign` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`),
  ADD CONSTRAINT `rolepermission_roleid_foreign` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`);

--
-- Constraints for table `salaryHistory`
--
ALTER TABLE `salaryHistory`
  ADD CONSTRAINT `salaryhistory_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `saleInvoice`
--
ALTER TABLE `saleInvoice`
  ADD CONSTRAINT `saleinvoice_customerid_foreign` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `saleinvoice_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `saleInvoiceProduct`
--
ALTER TABLE `saleInvoiceProduct`
  ADD CONSTRAINT `saleinvoiceproduct_invoiceid_foreign` FOREIGN KEY (`invoiceId`) REFERENCES `saleInvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `saleinvoiceproduct_productid_foreign` FOREIGN KEY (`productId`) REFERENCES `product` (`id`);

--
-- Constraints for table `saleInvoiceVat`
--
ALTER TABLE `saleInvoiceVat`
  ADD CONSTRAINT `saleinvoicevat_productvatid_foreign` FOREIGN KEY (`productVatId`) REFERENCES `productVat` (`id`);

--
-- Constraints for table `shippingTime`
--
ALTER TABLE `shippingTime`
  ADD CONSTRAINT `shippingtime_productid_foreign` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subAccount`
--
ALTER TABLE `subAccount`
  ADD CONSTRAINT `subaccount_accountid_foreign` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_creditid_foreign` FOREIGN KEY (`creditId`) REFERENCES `subAccount` (`id`),
  ADD CONSTRAINT `transaction_debitid_foreign` FOREIGN KEY (`debitId`) REFERENCES `subAccount` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_departmentid_foreign` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`),
  ADD CONSTRAINT `users_designationid_foreign` FOREIGN KEY (`designationId`) REFERENCES `designation` (`id`),
  ADD CONSTRAINT `users_employmentstatusid_foreign` FOREIGN KEY (`employmentStatusId`) REFERENCES `employmentStatus` (`id`),
  ADD CONSTRAINT `users_roleid_foreign` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `users_shiftid_foreign` FOREIGN KEY (`shiftId`) REFERENCES `shift` (`id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_customerid_foreign` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
