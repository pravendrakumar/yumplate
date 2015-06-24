-- phpMyAdmin SQL Dump
-- version 4.0.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 18, 2015 at 11:53 AM
-- Server version: 5.5.33-cll-lve
-- PHP Version: 5.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `meal_order`
--
CREATE DATABASE IF NOT EXISTS `meal_order` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `meal_order`;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE IF NOT EXISTS `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=7 ;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `active`, `created`, `modified`) VALUES
(1, 'Burton', 'burton', 1, '2012-12-06 00:00:00', '2012-12-06 00:00:00'),
(2, 'Celtek', 'celtek', 1, '2012-12-06 00:00:00', '2012-12-06 00:00:00'),
(3, 'Dakine', 'dakine', 1, '2012-12-06 00:00:00', '2012-12-06 00:00:00'),
(4, 'DC', 'dc', 1, '2012-12-06 00:00:00', '2012-12-06 00:00:00'),
(5, 'Electric', 'electric', 1, '2012-12-06 00:00:00', '2012-12-06 00:00:00'),
(6, 'Forum', 'forum', 1, '2012-12-06 00:00:00', '2012-12-06 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE IF NOT EXISTS `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cook_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `discount` float NOT NULL DEFAULT '0',
  `pick_up_day` varchar(255) DEFAULT NULL,
  `comment` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `carts_old`
--

CREATE TABLE IF NOT EXISTS `carts_old` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sessionid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` decimal(6,2) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `weight_total` decimal(6,2) DEFAULT NULL,
  `subtotal` decimal(6,2) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `carts_old`
--

INSERT INTO `carts_old` (`id`, `sessionid`, `product_id`, `name`, `weight`, `price`, `quantity`, `weight_total`, `subtotal`, `created`, `modified`) VALUES
(1, 'drbuu1i1v77gopie3osbtrdda0', 14, 'Dakine Scrambler Jr. Toddler Mittens Walrus', '7.00', '23.00', 1, '7.00', '23.00', '2015-02-06 18:39:30', '2015-02-06 18:39:30');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `lft` int(10) unsigned DEFAULT NULL,
  `rght` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `active` tinyint(1) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `lft`, `rght`, `name`, `slug`, `description`, `active`, `created`, `modified`) VALUES
(3, NULL, 1, 2, 'North Indian', 'north-indian', 'There is a category of north Indian dishes', 0, '2015-02-09 09:33:37', '2015-03-15 23:43:29'),
(4, NULL, 3, 4, 'South Indian', 'south-indian', 'list of south indian dishes', 1, '2015-02-09 09:34:27', '2015-02-09 09:34:27'),
(5, NULL, 5, 6, 'Mexican', 'punjabi', 'All foods mexican', 0, '2015-02-09 09:47:12', '2015-03-06 14:44:02'),
(6, NULL, 7, 8, 'Sri Lankan', 'sri-lankan', 'all things Sri Lankan - Tamil, Sinhalese, Dutch, fusion', 1, '2015-02-15 15:59:12', '2015-03-14 19:20:26'),
(7, NULL, 9, 10, 'bbq', 'bbq', 'Enjoy southern style bbq', 1, '2015-02-16 01:00:35', '2015-03-06 14:44:29'),
(10, NULL, 11, 12, 'Middle Eastern', 'middle-eastern', 'Afgan, Pakistani, middle eastern', 1, '2015-02-24 08:51:40', '2015-02-24 08:51:40'),
(11, NULL, 13, 14, 'Desserts', 'desserts', 'Cakes, chocolates, cookies, and other confections', 0, '2015-03-06 14:41:06', '2015-03-06 14:41:06'),
(12, NULL, 15, 16, 'Italian', 'italian', 'Antipasti , Soup and sauce recipes, Pane, ', 1, '2015-03-06 20:56:03', '2015-03-06 20:56:03');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `discount_limit` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `name`, `user_id`, `discount_limit`, `discount`, `start_date`, `end_date`, `active`, `created`, `modified`) VALUES
(2, 'testing', 32, 100, 10, '2015-03-11', '2015-03-31', 0, '2015-03-09 08:18:02', '2015-03-12 06:16:38'),
(3, 'raj', 32, 30, 10, '2015-03-10', '2015-03-31', 1, '2015-03-10 19:21:45', '2015-03-11 12:34:16'),
(4, 'sofia', 57, 90, 10, '2015-03-11', '2015-03-30', 1, '2015-03-11 07:17:01', '2015-03-11 07:17:01');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` decimal(8,2) unsigned DEFAULT '0.00',
  `order_item_count` int(11) DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `tax` decimal(8,2) DEFAULT NULL,
  `shipping` decimal(8,2) DEFAULT NULL,
  `discount` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total` decimal(8,2) unsigned DEFAULT NULL,
  `order_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorization` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '2=>success,1=>failure',
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=35 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `first_name`, `last_name`, `email`, `phone`, `billing_address`, `billing_address2`, `billing_city`, `billing_zip`, `billing_state`, `billing_country`, `shipping_address`, `shipping_address2`, `shipping_city`, `shipping_zip`, `shipping_state`, `shipping_country`, `weight`, `order_item_count`, `subtotal`, `tax`, `shipping`, `discount`, `total`, `order_type`, `authorization`, `transaction`, `status`, `ip_address`, `created`, `modified`) VALUES
(28, 5, 'mohd', 'sayeed', 'mohd.sayeed@webenturetech.com', '888-888-8888', '1 Main St', '', 'San Jose', '95131', 'CA', 'United States', '1 Main St', '', 'San Jose', '95131', 'CA', 'United States', '0.00', 4, '5.77', NULL, NULL, '3.6', '50.17', 'paypal', 'Failure', NULL, '1', NULL, '2015-03-17 06:07:40', '2015-03-17 06:07:44'),
(29, 5, 'mohd', 'sayeed', 'mohd.sayeed@webenturetech.com', '888-888-8888', '1 Main St', '', 'San Jose', '95131', 'CA', 'United States', '1 Main St', '', 'San Jose', '95131', 'CA', 'United States', '0.00', 4, '5.77', NULL, NULL, '3.6', '50.17', 'paypal', 'Failure', NULL, '1', NULL, '2015-03-17 06:08:41', '2015-03-17 06:08:46'),
(30, 5, 'mohd', 'sayeed', 'mohd.sayeed@webenturetech.com', '888-888-8888', '1 Main St', '', 'San Jose', '95131', 'CA', 'United States', '1 Main St', '', 'San Jose', '95131', 'CA', 'United States', '0.00', 2, '5.77', NULL, NULL, '3.6', '50.17', 'paypal', 'Failure', NULL, '1', NULL, '2015-03-17 06:09:16', '2015-03-17 06:09:16'),
(31, 72, 'mohd', 'sayeed', 'mohd.sayeed@webenturetech.com', '888-888-8888', '1 Main St', '', 'San Jose', '95131', 'CA', 'United States', '1 Main St', '', 'San Jose', '95131', 'CA', 'United States', '0.00', 2, '15.08', NULL, NULL, '0', '131.08', 'paypal', 'Success', NULL, '2', NULL, '2015-03-17 07:15:36', '2015-03-17 07:15:36'),
(32, 72, 'mohd', 'sayeed', 'mohd.sayeed@webenturetech.com', '888-888-8888', '1 Main St', '', 'San Jose', '95131', 'CA', 'United States', '1 Main St', '', 'San Jose', '95131', 'CA', 'United States', '0.00', 2, '17.55', NULL, NULL, '15', '152.55', 'paypal', 'Success', NULL, '2', NULL, '2015-03-17 08:05:20', '2015-03-17 08:05:20'),
(33, 5, 'mohd', 'sayeed', 'mohd.sayeed@webenturetech.com', '888-888-8888', '1 Main St', '', 'San Jose', '95131', 'CA', 'United States', '1 Main St', '', 'San Jose', '95131', 'CA', 'United States', '0.00', 2, '6.24', NULL, NULL, '0', '54.24', 'paypal', 'Success', NULL, '2', NULL, '2015-03-17 08:16:34', '2015-03-17 08:16:34'),
(34, 80, 'mohd', 'sayeed', 'mohd.sayeed@webenturetech.com', '888-888-8888', '1 Main St', '', 'San Jose', '95131', 'CA', 'United States', '1 Main St', '', 'San Jose', '95131', 'CA', 'United States', '0.00', 4, '23.40', NULL, NULL, '20', '203.40', 'paypal', 'Success', NULL, '2', NULL, '2015-03-18 00:01:23', '2015-03-18 00:01:23');

-- --------------------------------------------------------

--
-- Table structure for table `order_infos`
--

CREATE TABLE IF NOT EXISTS `order_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `order_infos`
--

INSERT INTO `order_infos` (`id`, `order_id`, `phone`, `email`, `created`, `modified`) VALUES
(1, 30, '747890-0099', 'pravendra.kumar@webenturetech.com', '2015-03-17 06:09:25', 1426590565),
(2, 31, '1234567890', 'mohd.zuhed@webenturetech.com', '2015-03-17 07:16:18', 1426594578);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `cook_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `pick_up_day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `weight` decimal(8,2) unsigned DEFAULT '0.00',
  `price` decimal(8,2) unsigned DEFAULT NULL,
  `subtotal` decimal(8,2) unsigned DEFAULT NULL,
  `discount` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=72 ;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `cook_name`, `name`, `pick_up_day`, `quantity`, `weight`, `price`, `subtotal`, `discount`, `created`, `modified`) VALUES
(52, 28, 66, 'Jimmy Long', 'Spaghetti and Meatballs', 'tuesday', 1, '0.00', '12.00', '12.00', '0', '2015-03-17 06:07:40', '2015-03-17 06:07:40'),
(53, 28, 48, 'Raj kumar', 'Spicy Coconut Beef', 'tuesday', 3, '0.00', '12.00', '32.40', '3.6', '2015-03-17 06:07:40', '2015-03-17 06:07:40'),
(54, 28, 66, 'Jimmy Long', 'Spaghetti and Meatballs', 'tuesday', 1, '0.00', '12.00', '12.00', '0', '2015-03-17 06:07:44', '2015-03-17 06:07:44'),
(55, 28, 48, 'Raj kumar', 'Spicy Coconut Beef', 'tuesday', 3, '0.00', '12.00', '32.40', '3.6', '2015-03-17 06:07:44', '2015-03-17 06:07:44'),
(56, 29, 66, 'Jimmy Long', 'Spaghetti and Meatballs', 'tuesday', 1, '0.00', '12.00', '12.00', '0', '2015-03-17 06:08:41', '2015-03-17 06:08:41'),
(57, 29, 48, 'Raj kumar', 'Spicy Coconut Beef', 'tuesday', 3, '0.00', '12.00', '32.40', '3.6', '2015-03-17 06:08:41', '2015-03-17 06:08:41'),
(58, 29, 66, 'Jimmy Long', 'Spaghetti and Meatballs', 'tuesday', 1, '0.00', '12.00', '12.00', '0', '2015-03-17 06:08:46', '2015-03-17 06:08:46'),
(59, 29, 48, 'Raj kumar', 'Spicy Coconut Beef', 'tuesday', 3, '0.00', '12.00', '32.40', '3.6', '2015-03-17 06:08:46', '2015-03-17 06:08:46'),
(60, 30, 66, 'Jimmy Long', 'Spaghetti and Meatballs', 'tuesday', 1, '0.00', '12.00', '12.00', '0', '2015-03-17 06:09:16', '2015-03-17 06:09:16'),
(61, 30, 48, 'Raj kumar', 'Spicy Coconut Beef', 'tuesday', 3, '0.00', '12.00', '32.40', '3.6', '2015-03-17 06:09:16', '2015-03-17 06:09:16'),
(62, 31, 46, 'Joseph last', 'Coconut Roti (3 servings)', 'thursday', 4, '0.00', '8.00', '32.00', '0', '2015-03-17 07:15:36', '2015-03-17 07:15:36'),
(63, 31, 47, 'Joseph last', 'Green beans curry (10 servings)', 'friday', 7, '0.00', '12.00', '84.00', '0', '2015-03-17 07:15:36', '2015-03-17 07:15:36'),
(64, 32, 48, 'Raj kumar', 'Spicy Coconut Beef', 'tuesday', 5, '0.00', '12.00', '54.00', '6', '2015-03-17 08:05:20', '2015-03-17 08:05:20'),
(65, 32, 49, 'Raj kumar', 'Chicken curry & Rice', 'wednesday', 5, '0.00', '18.00', '81.00', '9', '2015-03-17 08:05:20', '2015-03-17 08:05:20'),
(66, 33, 66, 'Jimmy Long', 'Spaghetti and Meatballs', 'tuesday', 2, '0.00', '12.00', '24.00', '0', '2015-03-17 08:16:34', '2015-03-17 08:16:34'),
(67, 33, 65, 'Jimmy Long', 'Eggs and Italian Sausages ', 'monday', 2, '0.00', '12.00', '24.00', '0', '2015-03-17 08:16:34', '2015-03-17 08:16:34'),
(68, 34, 42, 'Raj kumar', 'Sri Lankan Crab Curry', 'wednesday', 3, '0.00', '15.00', '40.50', '4.5', '2015-03-18 00:01:23', '2015-03-18 00:01:23'),
(69, 34, 49, 'Raj kumar', 'Chicken curry & Rice', 'wednesday', 2, '0.00', '18.00', '32.40', '3.6', '2015-03-18 00:01:23', '2015-03-18 00:01:23'),
(70, 34, 50, 'Raj kumar', 'Chicken Kottu Roti (Serves 4)', 'thursday', 2, '0.00', '22.00', '39.60', '4.4', '2015-03-18 00:01:23', '2015-03-18 00:01:23'),
(71, 34, 51, 'Raj kumar', 'Spicy Prawn Curry', 'sunday', 3, '0.00', '25.00', '67.50', '7.5', '2015-03-18 00:01:23', '2015-03-18 00:01:23');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(255) NOT NULL,
  `page_content` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `image_link` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `page_name`, `page_content`, `active`, `image_link`, `created`, `modified`) VALUES
(1, 'ourstory', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, NULL, '2012-12-06 00:00:00', '2015-03-03 08:31:37'),
(2, 'howitworks', '<h1>How It Works</h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h1 class="text-center"><img alt="" src="/yumplate/app/webroot/upload/files/how-it-works.png" style="height:263px; width:834px" /></h1>\r\n\r\n<p>It has survived not only five centuries,but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n', 1, '', '2012-12-06 00:00:00', '2015-03-12 23:23:27'),
(3, 'contact', '<h1>Contact Yumcook</h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n', 1, '', '2012-12-06 00:00:00', '2015-03-12 02:05:17'),
(4, 'help', '<h1>Help</h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n', 1, NULL, '2012-12-06 00:00:00', '2015-02-16 03:01:33'),
(5, 'privacypolicy', '<h1>Privacy Policy</h1>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n', 1, NULL, '2012-12-06 00:00:00', '2015-02-16 02:59:15'),
(6, 'term', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n', 1, NULL, '2012-12-06 00:00:00', '2015-02-13 14:07:59'),
(7, 'instruction', '<h1>Become a YumCook</h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n\r\n<p><img alt="" src="/yumplate/app/webroot/upload/files/product1.png" style="float:left; height:327px; width:368px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, '', '2015-02-07 00:00:00', '2015-02-20 06:01:37'),
(8, '', '', 1, NULL, '2015-03-17 07:21:52', '2015-03-17 07:21:52');

-- --------------------------------------------------------

--
-- Table structure for table `productmods`
--

CREATE TABLE IF NOT EXISTS `productmods` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product_id` int(10) DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `weight` decimal(8,2) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modified` (`modified`),
  KEY `category_id` (`product_id`),
  KEY `brand_id` (`value`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=3 ;

--
-- Dumping data for table `productmods`
--

INSERT INTO `productmods` (`id`, `product_id`, `sku`, `name`, `value`, `price`, `weight`, `active`, `views`, `created`, `modified`) VALUES
(1, 19, 'aura_boot_8', 'Size  8 US', 'Size  8 US', '68.95', '5.00', 1, 0, '2013-10-30 00:11:30', '2013-10-30 00:11:30'),
(2, 19, 'aura_boot_9', 'Size  9 US', 'Size  9 US', '74.95', '5.00', 1, 0, '2013-10-30 00:11:30', '2013-10-30 00:11:30');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned DEFAULT NULL,
  `brand_id` int(11) unsigned DEFAULT NULL,
  `user_id` int(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pick_time_to` time NOT NULL,
  `pick_time_from` time NOT NULL,
  `order_time` time NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `story` text COLLATE utf8_unicode_ci,
  `ingredients` text COLLATE utf8_unicode_ci,
  `contains` text COLLATE utf8_unicode_ci,
  `serving` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `weight` decimal(8,2) DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `active` int(1) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `day` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` int(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `modified` (`modified`),
  KEY `name_slug` (`slug`),
  KEY `category_id` (`category_id`),
  KEY `brand_id` (`brand_id`) USING BTREE,
  KEY `active` (`active`),
  KEY `day` (`day`),
  KEY `user_id` (`user_id`),
  KEY `name_2` (`name`),
  KEY `user_id_2` (`user_id`),
  KEY `name_3` (`name`),
  FULLTEXT KEY `day_2` (`day`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=69 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `brand_id`, `user_id`, `name`, `pick_time_to`, `pick_time_from`, `order_time`, `slug`, `story`, `ingredients`, `contains`, `serving`, `image`, `price`, `weight`, `tags`, `views`, `active`, `rating`, `day`, `featured`, `created`, `modified`) VALUES
(42, 6, NULL, 32, 'Sri Lankan Crab Curry', '10:00:00', '08:00:00', '11:00:00', 'Sri-Lanan-Crab-Curry', '<p>Calling this dish &#39;crab curry&#39; is a little disrespectful as this is more than just a curry. This is a gateway to seafood heaven from where you wouldn&#39;t want to come back. This dish is the best way to appreciate the full flavour of these amazing crustaceans &ndash; it also happens to be Joseph&#39;s favourite. The Sri lankan crab curry is best served with basmati rice</p>\r\n', 'Lorem, ipsum dolor, sit amet, consectetur, adipiscing elit.', 'nut free, vegetarian', 'Heat 2-3 minutes (timing varies depending on your microwave).\r\n', 'meal1426030066.jpg', '15.00', NULL, NULL, 243, 1, NULL, 'wednesday', 1, '2015-03-06 16:03:54', '2015-03-14 19:36:22'),
(43, 6, NULL, 54, 'Sri Lankan vegetarian Lumpreys', '08:00:00', '04:00:00', '12:00:00', 'Sri-Lankan-vegetarian-Lampreys', '<p>This is an ideal meal for those who are vegetarians. &nbsp; Cooked in the same style as Sri Lankan beef lumprey, this meal comes wrapped in a banana leaf and slow baked for 4 hours.</p>\r\n', 'Yellow Rice, lamb curry , Vegetables, Seeni Sambol, fish Cutlet, Fried Ash Plantain curry', '<b>nut free, vegetarian</b> ', '<b>Serving size</b>: Serves 1 person <br> Bake in a 350F oven for 30 minutes. Serve hot.', 'meal1426031430.jpg', '15.00', NULL, NULL, 265, 1, 5, 'sunday', 1, '2015-03-06 17:04:21', '2015-03-15 09:24:19'),
(44, 6, NULL, 54, 'Sri  Lankan Mutton Lumpreys', '19:00:00', '16:00:00', '09:00:00', 'Sri--Lankan-Mutton-Lampreys', '<p>Wrapped in banana leaf and slow baked for perfection for more than 5 hours, this meals tells the story of Sri Lanka.&nbsp;Wrapped in banana leaf and slow baked for perfection for more than 5 hours, this meals tells the story of Sri Lanka.&nbsp;</p>\r\n', 'Mutton, Eggplant, Spinach ,Dhal, Cache, chilly powder, sugar, turmeric powder, Green Chilies, green onions, red onions, rice\r\n', '<b>nut free, mutton</b>', '<b>Serving size</b>: Serves 1 person <br> Bake in a 350F oven for 30 minutes. Serve hot.', 'meal1426029585.jpg', '15.00', NULL, NULL, 14, 1, 3.6667, 'tuesday', 0, '2015-03-06 17:10:06', '2015-03-17 07:08:43'),
(45, 6, NULL, 54, 'Rice & vegetables in banana leaf', '08:00:00', '05:00:00', '12:00:00', 'Rice-&-vegetables-in-banana-leaf', '<p>Sri Lankan cooking has evolved around rice. The national meal is not referred to as &ldquo;curry&rdquo; but as &ldquo;rice and curry&rdquo;: a mountainous plate of rice generally accompanied by assorted meat and/or vegetable curries, various pickles, (sambols), and a handful of tiny poppadum.</p>\r\n', 'Eggplant, Spinach ,Dhal, Cache, chilly powder, sugar, turmeric powder, Green Chilies, green onions, red onions, rice', '<b>nut free, vegetarian</b> ', 'In The Oven\r\nPreheat to 350 degrees. Heat 12-14 minutes, or until heated through.\r\n\r\nIn The Microwave\r\nHeat 2-3 minutes (timing varies depending on your microwave).\r\n', 'meal1426031344.jpg', '12.00', NULL, NULL, 189, 1, NULL, 'monday', 1, '2015-03-06 17:29:06', '2015-03-10 18:49:05'),
(46, 6, NULL, 54, 'Coconut Roti (3 servings)', '08:00:00', '04:00:00', '12:00:00', 'Coconut-Roti-(3-servings)', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean fringilla faucibus est sed rhoncus. Praesent ac mi blandit, rhoncus risus vitae, facilisis quam. Nulla id erat nisl. Donec pulvinar at lacus vel iaculis. Curabitur nisi sapien, vestibulum fermentum quam vel, ultrices efficitur augue. Praesent aliquam id diam quis facilisis. Etiam porta sagittis aliquam. Sed nulla quam, placerat at iaculis pretium, viverra sed purus.</p>\r\n', 'Lorem, ipsum dolor, sit amet, consectetur, adipiscing elit.', 'nut free, vegetarian', 'In The Oven<b>\r\nPreheat to 350 degrees. Heat 12-14 minutes, or until heated through.\r\n\r\nIn The Microwave\r\nHeat 2-3 minutes (timing varies depending on your microwave).\r\n', 'meal1426030572.jpg', '8.00', NULL, NULL, 169, 1, 3.5, 'thursday', 1, '2015-03-06 17:49:23', '2015-03-10 18:36:13'),
(47, 6, NULL, 54, 'Green beans curry (10 servings)', '08:00:00', '04:00:00', '01:00:00', 'Green-beans-curry-(10-servings)', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean fringilla faucibus est sed rhoncus. Praesent ac mi blandit, rhoncus risus vitae, facilisis quam. Nulla id erat nisl. Donec pulvinar at lacus vel iaculis. Curabitur nisi sapien, vestibulum fermentum quam vel, ultrices efficitur augue. Praesent aliquam id diam quis facilisis. Etiam porta sagittis aliquam. Sed nulla quam, placerat at iaculis pretium, viverra sed purus.</p>\r\n', 'Lorem, ipsum dolor, sit amet, consectetur, adipiscing elit.', '<b>nut free, vegetarian</b> ', '<b>In The Oven<b><br>\r\nPreheat to 350 degrees. Heat 12-14 minutes, or until heated through.\r\n\r\n<b>In The Microwave<b><br>\r\nHeat 2-3 minutes (timing varies depending on your microwave).\r\n', 'meal1426031038.jpg', '12.00', NULL, NULL, 119, 1, NULL, 'friday', 1, '2015-03-06 18:11:42', '2015-03-10 18:43:58'),
(48, 6, NULL, 32, 'Spicy Coconut Beef', '12:00:00', '12:00:00', '12:00:00', 'Spicy-Coconut-Beef', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean fringilla faucibus est sed rhoncus. Praesent ac mi blandit, rhoncus risus vitae, facilisis quam. Nulla id erat nisl. Donec pulvinar</p>\r\n', 'Lorem, ipsum dolor, sit amet, consectetur, adipiscing elit.', '<b>nut free, vegetarian</b> ', '<b>Servers 2</br><br>\r\n\r\n<b>In The Oven<b><br>\r\nPreheat to 350 degrees. Heat 12-14 minutes, or until heated through.\r\n\r\n<b>In The Microwave<b><br>\r\nHeat 2-3 minutes (timing varies depending on your microwave).\r\n', 'meal1426030659.jpg', '12.00', NULL, NULL, 167, 1, 4, 'monday,tuesday,wednesday', 1, '2015-03-06 19:13:25', '2015-03-16 22:43:23'),
(49, 6, NULL, 32, 'Chicken curry & Rice', '12:00:00', '12:00:00', '15:00:00', 'Chicken-curry-&-Rice', '<p>Donec pulvinar at lacus vel iaculis. Curabitur nisi sapien, vestibulum fermentum quam vel, ultrices efficitur augue. Praesent aliquam id diam quis facilisis. Etiam porta sagittis aliquam. Sed nulla quam, placerat at iaculis pretium, viverra sed purus.</p>\r\n', 'Lorem, ipsum dolor, sit amet, consectetur, adipiscing elit.', '<b>nut free, vegetarian</b> ', '<b>Servers 2</br><br>\r\n\r\n<b>In The Oven<b><br>\r\nPreheat to 350 degrees. Heat 12-14 minutes, or until heated through.\r\n\r\n<b>In The Microwave<b><br>\r\nHeat 2-3 minutes (timing varies depending on your microwave).\r\n', 'meal1426030498.jpg', '18.00', NULL, NULL, 154, 1, 3, 'wednesday', 1, '2015-03-06 19:17:24', '2015-03-11 02:03:21'),
(50, 6, NULL, 32, 'Chicken Kottu Roti (Serves 4)', '00:00:00', '00:00:00', '00:00:00', 'Chicken-Kottu-Roti-(Severs-4)', '<p>Praesent aliquam id diam quis facilisis. Etiam porta sagittis aliquam. Sed nulla quam, placerat at iaculis pretium, viverra sed purus.</p>\r\n', 'Lorem, ipsum dolor, sit amet, consectetur, adipiscing elit.', '<b>nut free, vegetarian</b> ', '<b>Servers 2</br><br>\r\n\r\n<b>In The Oven<b><br>\r\nPreheat to 350 degrees. Heat 12-14 minutes, or until heated through.\r\n\r\n<b>In The Microwave<b><br>\r\nHeat 2-3 minutes (timing varies depending on your microwave).\r\n', 'meal1426031278.jpg', '22.00', NULL, NULL, 141, 1, 4, 'thursday', 1, '2015-03-06 19:19:34', '2015-03-14 19:40:32'),
(51, 6, NULL, 32, 'Spicy Prawn Curry', '12:00:00', '12:00:00', '12:00:00', 'Spicy-prawn-curry', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean fringilla faucibus est sed rhoncus. Praesent ac mi blandit, rhoncus risus vitae, facilisis quam. Nulla id erat nisl. Donec pulvinar at&nbsp;</p>\r\n', 'Lorem, ipsum dolor, sit amet, consectetur, adipiscing elit.', '<b>nut free, vegetarian</b> ', '<b>Servers 2</br><br>\r\n\r\n<b>In The Oven<b><br>\r\nPreheat to 350 degrees. Heat 12-14 minutes, or until heated through.\r\n\r\n<b>In The Microwave<b><br>\r\nHeat 2-3 minutes (timing varies depending on your microwave).\r\n', 'meal1426031088.jpg', '25.00', NULL, NULL, 179, 1, 4, 'sunday', 1, '2015-03-06 19:21:36', '2015-03-15 09:25:18'),
(52, 6, NULL, 32, 'Cashew chicken curry', '00:00:00', '00:00:00', '00:00:00', 'Cashew-chicken-curry', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean fringilla faucibus est sed rhoncus. Praesent ac mi blandit, rhoncus risus vitae, facilisis quam. Nulla id erat nisl.</p>\r\n', 'Lorem, ipsum dolor, sit amet, consectetur, adipiscing elit.', '<b>nut free, vegetarian</b> ', 'b>Servers 2</br><br>\r\n\r\n<b>In The Oven<b><br>\r\nPreheat to 350 degrees. Heat 12-14 minutes, or until heated through.\r\n\r\n<b>In The Microwave<b><br>\r\nHeat 2-3 minutes (timing varies depending on your microwave).\r\n', 'meal1426031166.jpg', '22.00', NULL, NULL, 323, 1, NULL, 'tuesday', 1, '2015-03-06 19:36:32', '2015-03-10 18:46:06'),
(53, 7, NULL, 55, 'Texas style Ribs (6 Servings)', '02:30:00', '02:00:00', '11:00:00', 'Texas-style-Ribs-(6-Servings)', '<p>Praesent aliquam id diam quis facilisis. Etiam porta sagittis aliquam. Sed nulla quam, placerat at iaculis pretium, viverra sed purus.</p>\r\n', 'Lorem, ipsum dolor, sit amet, consectetur, adipiscing elit.', 'Lorem, ipsum ', '<b>In The Oven<b><br>\r\nPreheat to 350 degrees. Heat 12-14 minutes, or until heated through.\r\n\r\n<b>In The Microwave<b><br>\r\nHeat 2-3 minutes (timing varies depending on your microwave).\r\n', 'meal1426030979.jpg', '40.00', NULL, NULL, 121, 1, NULL, 'friday', 1, '2015-03-06 20:30:36', '2015-03-10 18:42:59'),
(54, 7, NULL, 55, 'Slow cooked honey Ribs (4 Servings)', '00:00:00', '00:00:00', '00:00:00', 'Slow-cooked-honey-Ribs-(4-Servings)', '<p>Curabitur nisi sapien, vestibulum fermentum quam vel, ultrices efficitur augue. Praesent aliquam id diam quis facilisis. Etiam porta sagittis aliquam. Sed nulla quam, placerat at iaculis pretium, viverra sed purus.</p>\r\n', 'Lorem, ipsum dolor, sit amet, consectetur, adipiscing elit.', '<b>nut free, pork</b> ', '<b>In The Oven<b><br>\r\nPreheat to 350 degrees. Heat 12-14 minutes, or until heated through.\r\n\r\n<b>In The Microwave<b><br>\r\nHeat 2-3 minutes (timing varies depending on your microwave).\r\n', 'meal1426030353.jpg', '22.00', NULL, NULL, 252, 1, 5, 'thursday', 1, '2015-03-06 20:35:09', '2015-03-10 18:32:34'),
(55, 7, NULL, 55, 'Big brisket (20 Servings)', '12:00:00', '12:00:00', '12:00:00', 'Big-brisket-(20-Servings)', '<p>Praesent aliquam id diam quis facilisis. Etiam porta sagittis aliquam. Sed nulla quam, placerat at iaculis pretium, viverra sed purus.</p>\r\n', 'Lorem, ipsum dolor, sit amet, consectetur, adipiscing elit.', '<b>nut free, vegetarian</b> ', '<b>In The Oven<b><br>\r\nPreheat to 350 degrees. Heat 12-14 minutes, or until heated through.\r\n\r\n<b>In The Microwave<b><br>\r\nHeat 2-3 minutes (timing varies depending on your microwave).\r\n', 'meal1426030116.jpg', '60.00', NULL, NULL, 29, 1, 3, 'wednesday', 0, '2015-03-06 20:47:25', '2015-03-10 18:29:07'),
(56, 7, NULL, 55, 'Louisiana BBQ', '12:00:00', '12:00:00', '12:00:00', 'Louisiana-BBQ', '<p>Curabitur nisi sapien, vestibulum fermentum quam vel, ultrices efficitur augue. Praesent aliquam id diam quis facilisis. Etiam porta sagittis aliquam. Sed nulla quam, placerat at iaculis pretium, viverra sed purus.</p>\r\n', 'Curabitur nisi sapien, vestibulum', '<b>nut free, meat </b> ', '<b>In The Oven<b><br>\r\nPreheat to 350 degrees. Heat 12-14 minutes, or until heated through.\r\n\r\n<b>In The Microwave<b><br>\r\nHeat 2-3 minutes (timing varies depending on your microwave).\r\n', 'meal1426030856.jpg', '20.00', NULL, NULL, 173, 1, NULL, 'monday', 1, '2015-03-06 20:50:17', '2015-03-10 18:40:56'),
(57, 5, NULL, 56, 'Tamales (6 servings)', '12:00:00', '12:00:00', '12:00:00', 'Tamales-(6-servings)', '<p>A tamale is a traditional Mesoamerican dish made of masa, which is steamed or boiled in a leaf wrapper. The wrapping is discarded before eating.</p>\r\n', 'Curabitur nisi sapien, vestibulum fermentum quam vel, ultrices efficitur augue. Praesent aliquam id diam ', 'Curabitur nisi sapien, vestibulum fermentum quam vel, ultrices efficitur augue. Praesent aliquam id diam ', 'Curabitur nisi sapien, vestibulum fermentum quam vel, ultrices efficitur augue. Praesent aliquam id diam ', 'meal1426030931.jpg', '18.00', NULL, NULL, 115, 1, NULL, 'friday', 1, '2015-03-06 21:54:00', '2015-03-10 18:42:11'),
(58, 5, NULL, 56, 'Fresh tacos (3 Servings)', '00:00:00', '00:00:00', '00:00:00', 'Fresh-tacos-(3-Servings)', '<p>Curabitur nisi sapien, vestibulum fermentum quam vel, ultrices efficitur augue. Praesent aliquam id diam quis facilisis. Etiam porta sagittis aliquam. Sed nulla quam, placerat at iaculis pretium, viverra sed purus.</p>\r\n', 'Sed nulla quam, placerat at iaculis pretium, viverra sed purus.  ', 'Curabitur nisi sapien', 'Curabitur nisi sapien, vestibulum fermentum quam vel, ultrices efficitur augue. Praesent aliquam id diam quis facilisis. Etiam porta sagittis aliquam. Sed nulla quam, placerat at iaculis pretium, viverra sed purus.  ', 'meal1426030415.jpg', '15.00', NULL, NULL, 156, 1, 5, 'saturday', 1, '2015-03-06 21:56:17', '2015-03-10 18:33:35'),
(59, 5, NULL, 56, 'Mexican Lentil Soup (3 Servings)', '23:00:00', '20:00:00', '05:30:00', 'Mexican-Lentil-Soup-(3-Servings)', '<p>Curabitur nisi sapien, vestibulum fermentum quam vel, ultrices efficitur augue. Praesent aliquam id diam quis facilisis. Etiam porta sagittis aliquam. Sed nulla quam, placerat at iaculis pretium, viverra sed purus.</p>\r\n', '  Sed nulla quam, placerat at iaculis pretium, viverra sed purus.  ', ' aliquam id diam quis facilisis. Etiam porta sagittis aliquam. Sed nulla quam, placerat at iaculis pretium, viverra sed purus.  ', 'Curabitur nisi sapien, vestibulum fermentum quam vel, ultrices efficitur augue.  ', 'meal1426030813.jpg', '20.00', NULL, 'avacado', 148, 1, NULL, 'sunday', 1, '2015-03-06 22:04:23', '2015-03-15 09:24:54'),
(60, 10, NULL, 57, 'Moroccan Tagine (Serves 2)', '17:00:00', '13:00:00', '20:00:00', 'Moroccan-Tagine-(Serves-2)', '<p>Curabitur nisi sapien, vestibulum fermentum quam vel, ultrices efficitur augue. Praesent aliquam id diam quis facilisis. Etiam porta sagittis aliquam. Sed nulla quam, placerat at iaculis pretium, viverra sed purus.</p>\r\n', 'Curabitur nisi sapien, vestibulum fermentum quam vel, ultrices efficitur augue. Praesent aliquam ', ' placerat at iaculis pretium, viverra sed purus.  ', 'Curabitur nisi sapien, vestibulum fermentum quam vel, ultrices efficitur augue. Praesent ', 'meal1426030615.jpg', '25.00', NULL, NULL, 156, 1, NULL, 'saturday', 1, '2015-03-06 22:10:15', '2015-03-11 02:12:16'),
(61, 10, NULL, 57, 'Lamb tajine (serves 3)', '00:00:00', '00:00:00', '00:00:00', 'Lamb-tajine-(serves-3)', '<p>Praesent aliquam id diam quis facilisis. Etiam porta sagittis aliquam. Sed nulla quam, placerat at iaculis pretium, viverra sed purus.</p>\r\n', 'Sed nulla quam, placerat at iaculis pretium, viverra sed purus.  ', 'Curabitur nisi sapien', 'A placerat at iaculis pretium, viverra sed purus.  ', 'meal1426030034.jpg', '19.99', NULL, NULL, 189, 1, 1, 'wednesday', 1, '2015-03-06 22:13:51', '2015-03-10 18:27:14'),
(62, 10, NULL, 57, 'Beef Kafta (12 Servings)', '00:00:00', '00:00:00', '00:00:00', 'Beef-Kafta-(12-Servings)', '<p>Mauris id dui eu nunc congue dictum quis ut ipsum. Curabitur in dolor arcu. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer interdum enim felis, at venenatis libero varius vitae. Sed tincidunt dictum faucibus. Nulla neque erat, elementum</p>\r\n', 'Venenatis libero varius vitae. Sed tincidunt dictum faucibus. Nulla neque erat, elementum', 'malesuada fames ac ante ipsum primis in faucibus. Integer interdum enim felis', 'Mauris id dui eu nunc congue dictum quis ut ipsum. Curabitur in dolor arcu. ', 'meal1426030309.jpg', '25.00', NULL, NULL, 203, 1, 1, 'sunday,tuesday', 1, '2015-03-06 22:18:37', '2015-03-16 00:24:37'),
(63, 10, NULL, 57, 'Beef Tagine', '20:00:00', '16:00:00', '12:00:00', 'Veggie-Pizza', '<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested</p>\r\n', 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested', 'Veggie-Pizza', 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested', 'meal1426030225.jpg', '25.00', NULL, NULL, 2, 1, 5, 'wednesday', 0, '2015-03-09 00:55:04', '2015-03-10 18:30:25'),
(65, 12, NULL, 60, 'Eggs and Italian Sausages ', '21:30:00', '15:00:00', '06:00:00', 'Eggs-and-Italian-Sausages-', '<p>To season, I use a generous amount of cracked pepper, a little dijon mustard, freshly grated parmesan (though I feel I should be calling it parmigiano), and some finely chopped parsley.</p>\r\n', 'eggs, Italian Sausages, pepper, salt', 'meat', 'servings: 2', 'meal1425992154.jpg', '12.00', NULL, NULL, 147, 1, 5, 'monday', 1, '2015-03-10 06:39:41', '2015-03-10 18:51:21'),
(66, 12, NULL, 60, 'Spaghetti and Meatballs', '15:00:00', '16:00:00', '08:30:00', 'Spaghetti-and-Meatballs', '<p>There are three elements to a good meatball &ndash; the texture, the seasoning and the cook. I like a looser texture on my meatball &ndash; there&rsquo;s nothing worse than a compacted, tough mouthful. So I use the old Italian trick of bread soaked in milk.</p>\r\n', 'Not only does this add tenderness, but also a little fat, and it compensates for the potentially toughening egg.', 'beef', 'serves 2', 'meal1425992131.jpg', '12.00', NULL, NULL, 289, 1, 5, 'tuesday', 1, '2015-03-10 06:46:21', '2015-03-10 07:55:31');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) DEFAULT NULL,
  `product_id` int(20) DEFAULT NULL,
  `cook_id` int(11) NOT NULL,
  `comments` text,
  `meal_rating` int(11) NOT NULL,
  `val_rating` int(11) NOT NULL,
  `ontime_rating` int(11) NOT NULL,
  `easyfind_rating` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `cook_id`, `comments`, `meal_rating`, `val_rating`, `ontime_rating`, `easyfind_rating`, `created`, `modified`) VALUES
(1, 51, 43, 54, 'Great tasking lumprey', 0, 5, 5, 5, '2015-03-06 17:59:22', '2015-03-06 17:59:22'),
(4, 5, 46, 54, 'yummy Roti ;)', 0, 2, 3, 3, '2015-03-07 07:41:10', '2015-03-07 07:41:10'),
(5, 5, 46, 54, 'awesome', 0, 5, 3, 2, '2015-03-07 08:02:57', '2015-03-07 08:02:57'),
(6, 5, 49, 32, 'good :)', 0, 4, 2, 3, '2015-03-07 08:09:59', '2015-03-07 08:09:59'),
(7, 5, 49, 32, 'good one!', 0, 2, 3, 3, '2015-03-07 08:11:03', '2015-03-07 08:11:03'),
(8, 51, 58, 56, 'wonderful meal', 0, 5, 5, 5, '2015-03-07 08:48:25', '2015-03-07 08:48:25'),
(9, 1, 54, 55, 'Great food. Highly recommend it.', 0, 5, 5, 5, '2015-03-07 10:52:28', '2015-03-07 10:52:28'),
(10, 30, 44, 54, 'I love Joe''s mutton lampries - I will be definitely ordering from YumPlate again :)', 0, 1, 1, 1, '2015-03-08 15:37:55', '2015-03-08 15:37:55'),
(11, 5, 61, 57, 'good one', 0, 1, 3, 3, '2015-03-08 23:26:08', '2015-03-08 23:26:08'),
(12, 5, 62, 57, 'yummy', 0, 1, 2, 4, '2015-03-08 23:27:38', '2015-03-08 23:27:38'),
(13, 1, 55, 55, 'sxhgvdyg', 0, 1, 1, 1, '2015-03-09 08:29:42', '2015-03-09 08:29:42'),
(14, 59, 63, 57, 'really authentic', 0, 5, 5, 5, '2015-03-09 09:56:45', '2015-03-09 09:56:45'),
(15, 51, 55, 55, 'great', 0, 5, 5, 5, '2015-03-09 19:58:41', '2015-03-09 19:58:41'),
(16, 51, 65, 60, 'great tasting italian', 0, 5, 5, 5, '2015-03-10 06:55:08', '2015-03-10 06:55:08'),
(17, 51, 66, 60, 'excellente!!', 0, 5, 5, 5, '2015-03-10 06:57:28', '2015-03-10 06:57:28'),
(18, 51, 44, 54, 'better than unclue Babu''s lumprey ', 0, 5, 5, 5, '2015-03-10 19:17:34', '2015-03-10 19:17:34'),
(19, 63, 50, 32, 'this is good in all manners- i.e. Value, timing and find', 0, 4, 4, 4, '2015-03-12 01:15:18', '2015-03-12 01:15:18'),
(20, 63, 51, 32, 'this is yummy', 0, 4, 4, 4, '2015-03-12 01:17:57', '2015-03-12 01:17:57'),
(21, 63, 51, 32, 'this is too good', 0, 4, 4, 4, '2015-03-12 01:18:09', '2015-03-12 01:18:09'),
(22, 72, 48, 32, 'this is so delicious', 0, 4, 3, 4, '2015-03-16 00:44:58', '2015-03-16 00:44:58'),
(23, 72, 44, 54, 'This is so delicious', 0, 5, 4, 5, '2015-03-17 07:08:43', '2015-03-17 07:08:43');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hst` float DEFAULT NULL,
  `support_mail` varchar(255) DEFAULT NULL,
  `order_mail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `hst`, `support_mail`, `order_mail`) VALUES
(1, 13, 'jadhu@yumplate.com', 'support@yumplate.com');

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE IF NOT EXISTS `stories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `story` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `stories`
--

INSERT INTO `stories` (`id`, `title`, `story`, `image`, `active`, `featured`, `created`, `modified`) VALUES
(3, 'Empowering immigrant women', '<p>Empowering immigrant women- Read&nbsp;how YumPlate is playing a big part in&nbsp;your local community</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '1424052200_empower_women.png', 1, 1, '2015-02-12 18:23:16', '2015-03-17 00:01:37'),
(6, 'Help YumPlate grow', '<p>Have suggestions on how to grow YumPlate in your community? We&#39;d love to hear from you.</p>\r\n\r\n<p>All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined&nbsp;</p>\r\n', '1426035938_ideas.png', 1, 1, '2015-02-13 12:16:32', '2015-03-14 19:18:57'),
(7, 'Yum story', '<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n', '1423829845_index.jpeg', 1, 0, '2015-02-13 12:17:26', '2015-02-13 12:17:26'),
(8, 'Yum experience story', '<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n', '1423829891_index3.jpeg', 1, 0, '2015-02-13 12:18:11', '2015-02-13 12:18:11'),
(9, 'Yumchef story', '<p>Yum Chef of the month- meet Raj,&nbsp;a full time dad and part time South Indian chef extraordinare.</p>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text</p>\r\n', '1424052844_featured.png', 1, 1, '2015-02-13 12:19:42', '2015-03-14 19:19:33');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=19 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created`, `modified`) VALUES
(1, 'fusion', '2013-11-03 15:18:13', '2015-02-15 16:53:14'),
(2, 'spicy', '2013-11-03 15:18:33', '2015-02-15 16:54:04'),
(3, 'toronto', '2013-11-03 15:18:36', '2015-02-15 16:53:38'),
(4, 'scarborough', '2013-11-03 15:18:41', '2015-02-15 16:53:27'),
(6, 'indian', '2013-11-03 15:39:39', '2015-02-15 16:53:47'),
(7, 'sri lankan', '2015-02-15 16:51:59', '2015-02-15 16:51:59'),
(8, 'seafood', '2015-02-15 16:54:22', '2015-02-15 16:54:22'),
(9, 'chilli', '2015-02-15 16:54:36', '2015-02-15 16:54:36'),
(10, 'crab', '2015-02-15 16:54:40', '2015-02-15 16:54:40'),
(11, 'pork', '2015-02-15 16:54:45', '2015-02-15 16:54:45'),
(12, 'chicken', '2015-02-15 16:54:49', '2015-02-15 16:54:49'),
(13, 'beef', '2015-02-15 16:54:54', '2015-02-15 16:54:54'),
(14, 'shrimps', '2015-02-15 16:55:04', '2015-02-15 16:55:04'),
(15, 'vegan', '2015-02-15 16:55:11', '2015-02-15 16:55:11'),
(16, 'vegitarian', '2015-02-15 16:55:18', '2015-02-15 16:55:18'),
(18, 'avacado', '2015-03-11 05:31:02', '2015-03-11 05:31:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT '1',
  `city` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parking` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reviews_avg_val_rating` int(11) NOT NULL,
  `reviews_avg_ontime_rating` int(11) NOT NULL,
  `reviews_avg_easyfind_rating` int(11) NOT NULL,
  `social_login` tinyint(1) NOT NULL DEFAULT '0',
  `forget_link_time` datetime DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'loggedin user s/m ip address',
  `last_login` datetime NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=83 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `first_name`, `last_name`, `username`, `password`, `description`, `email`, `active`, `city`, `country`, `image`, `image_link`, `address_type`, `delivery`, `parking`, `reviews_avg_val_rating`, `reviews_avg_ontime_rating`, `reviews_avg_easyfind_rating`, `social_login`, `forget_link_time`, `ip_address`, `last_login`, `created`, `modified`) VALUES
(1, 'admin', 'admin', NULL, 'admin', 'e4b93d46b915b203d091339f83a1364196d4258f', '', 'admin@admin.com', 1, 'delhi', 'india', 'chef3.jpg', NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, '182.69.210.79', '2015-03-18 04:47:21', '2011-09-26 00:34:07', '2015-03-18 04:47:21'),
(3, 'admin', 'mohi', NULL, 'mohi', 'bb31d782140325d69010c10c401b5d1aecd22519', NULL, NULL, 1, 'Scarborough', 'Ontario', 'img5.png', NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-02-09 10:23:12', '2015-02-13 13:15:03'),
(5, 'customer', 'pravendra kumar', NULL, 'pravendra.k', '85ff1212c814bbef92c1d5ea2f1f8c7a09c05253', NULL, 'pravendra.kumar@webenturetech.com', 1, 'Delhi', 'India', 'featured.png', NULL, NULL, NULL, NULL, 2, 2, 2, 0, '2015-03-16 08:21:07', '182.73.182.194', '2015-03-18 05:38:38', '2015-02-09 11:03:09', '2015-03-18 05:38:38'),
(24, 'customer', 'kumar', 'praveen', 'kumar', 'f8b697cdb6798bb547e49fe2e2cda404a58f23e9', NULL, 'pradeep.singh@webenturetech.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, '182.73.182.194', '2015-03-13 00:22:52', '2015-02-19 04:41:04', '2015-03-13 00:22:52'),
(25, 'customer', 'Nikhil Tiwari', 'Tiwari', 'Nikhil Tiwari.Tiwari', NULL, NULL, 'nickrock302@gmail.com', 1, NULL, NULL, NULL, 'http://graph.facebook.com/919864201378246/picture?type=large', NULL, NULL, NULL, 0, 0, 0, 1, NULL, NULL, '2015-03-02 06:07:46', '2015-02-20 08:50:15', '2015-03-02 06:07:46'),
(28, 'customer', 'Pravendra Kumar Prajapati', 'Prajapati', 'Pravendra Kumar Prajapati', NULL, NULL, 'prvndrkumar55@gmail.com', 1, NULL, NULL, NULL, 'http://graph.facebook.com/870270226373715/picture?type=large', NULL, NULL, NULL, 0, 0, 0, 1, NULL, NULL, '2015-03-17 06:42:58', '2015-02-20 12:04:28', '2015-03-17 06:42:58'),
(30, 'customer', 'Kumaran', 'Nadesan', 'Kumaran Nadesan', NULL, NULL, 'kumaran.nadesan@gmail.com', 1, NULL, NULL, NULL, 'http://graph.facebook.com/742626495520/picture?type=large', NULL, NULL, NULL, 0, 0, 0, 1, NULL, NULL, '2015-03-08 15:37:04', '2015-02-21 14:54:40', '2015-03-08 15:37:04'),
(32, 'cook', 'Raj', 'kumar', 'Raj', '0b3d0dc8b10facac6db3b2255a4909363751772c', 'Raj was born in Sri Lanka and left to India at the age of 13.  Raj still remembers the time when his mom packed his bag with his clothes along with a sachet of the finest Sri lankan cinnamon and cardamom and sent him off to India.  He says it was the smell of the spices that had always connected him to his home and family.  \r\n<br><br>\r\nWhen Raj arrived in India, he went to school during the day and worked for his uncle at the Madras Mahal restaurant,  famous for it''s spicy vegetarian meals. \r\n<br><br>\r\nRaj migrated to Canada in 1998 with his family looking for a better future.  He now works in the Banking sector, but still enjoys his love of cooking traditional vegetarian  meals in his spare time.  He says his best reward so far has been the hundreds of positive comments he''s gotten from the Yumplaters. ', 'raj@hotmail.com', 1, 'Scarborough', 'ON', 'chef1.jpg', NULL, 'Apartment', 'yes', 'no', 4, 3, 4, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-02-22 15:25:22', '2015-03-16 00:44:58'),
(38, 'customer', 'Jadhu Nadarajah', 'Nadarajah', 'Jadhu Nadarajah', 'af93143c9019cb7c0290a5b7f23279774cf371a7', '', 'jnadaraj@hotmail.com', 1, '', '', '', 'http://graph.facebook.com/10155225221830585/picture?type=large', '', 'yes', '', 0, 0, 0, 1, NULL, '129.137.147.238', '2015-03-10 20:29:50', '2015-02-24 08:47:34', '2015-03-10 20:29:50'),
(41, 'admin', 'sandeep', 'kundu', 'sandeepkundu', '949c12a653819f180d8c43e8e5b9c1f16d3a648e', 'sandeep', 'sandeepkundu4344@gmail.com', 0, '', '', '', NULL, '', 'yes', '', 0, 0, 0, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-02-25 06:37:06', '2015-02-25 06:37:06'),
(42, 'customer', 'ravi', 'prajapati', 'ravi', 'b7163a989959f326dd7ef8fafa132598f3aa3769', NULL, 'pravendra.kumar@webenturetech.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-02-26 01:01:31', '2015-02-26 01:01:31'),
(48, 'customer', 'vahid', 'ali', 'vahid', '8646a203199aaa1f458ff4a57f5eaa291b5bb911', NULL, 'vahid.ali@webenturetech.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, '2015-03-03 01:36:58', '2015-03-03 00:30:27', '2015-03-03 01:36:58'),
(51, 'admin', 'jadhu', 'nadarajah', 'jadhu@yumplate.com', 'de2768ed34b73b73c451bfdd4c4dd923045ef6f8', '', 'jadhu@yumplate.com', 1, 'Toronto', 'Ontario', 'DSC00377.JPG', NULL, 'House', 'yes', 'yes', 0, 0, 0, 0, NULL, '216.4.8.17', '2015-03-15 09:22:46', '2015-03-06 11:57:18', '2015-03-15 09:22:46'),
(52, 'admin', 'Kumaran', 'Nadesan', 'kumaran@yumplate.com', '7d49d837f1974635cafdebd52a9a61594f72de20', '', 'kumaran@yumplate.com', 1, 'Scaroborough', 'Ontario', '17d9450.jpg', NULL, 'House', 'no', 'no', 0, 0, 0, 0, NULL, '99.237.153.25', '2015-03-06 12:42:21', '2015-03-06 12:10:48', '2015-03-06 12:42:21'),
(53, 'admin', 'Shivanee', 'Nadarajah', 'shivanee@yumplate.com', 'bd397d2fb03748225fad275cbdac2ca1c990cec1', '', 'shivanee@yumplate.com', 1, 'Toronto', 'Ontario', '17d9450.jpg', NULL, 'house', 'yes', '', 0, 0, 0, 0, NULL, '99.237.153.25', '2015-03-15 07:27:20', '2015-03-06 12:41:13', '2015-03-15 07:27:20'),
(54, 'cook', 'Joseph', 'last', 'joseph@yumplate.com', 'cc2d3fb26df407ed00903efdd2c5aaf23c7510cf', '<p>Cooking with my grandmothers and with my mum was part of my earliest childhood memories. At home, as a five year old, I would cook with my mum and pretty much take over the kitchen. I would plan out family dinners, and when we visited my grandparents, the most exciting thing for me was to run straight to the kitchen and watch and help with the cooking. </p>\r\n\r\n \r\n\r\n<p>My dad worked in shipping and so we were lucky enough to grow up in many fascinating countries including France, Italy and Holland.  My favorite past time is experimenting with the different, often forgotten, Sri Lankan-Dutch cuisine that were popular during the colonial period. I am a part time chef and a full time dad and I would love for you to try out my creations.\r\n</p>', 'joseph@yumplate.com', 1, 'Scarborough', 'Ontario', 'chef2.jpg', NULL, 'House', 'no', 'No', 4, 4, 4, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-03-06 16:33:00', '2015-03-17 07:08:43'),
(55, 'cook', 'Joe', 'Miler', 'joe', '584d49670b69d62a80abe9ee9b5c39ff759873c0', 'Take a stroll with me with some sweet iced tea in hand down the streets of Memphis. Take a whiff of that tangy, sweet BBQ sauce.  Letâ€™s stop and sample the mouthwatering, fall off the bone, sweet succulent ribs. \r\n\r\nI may not have been born in the South, but I sure feel like I was.  BBQ means different things in different places.  In Texas, BBQ is brisket, and in Memphis itâ€™s ribs.\r\n\r\nFor many folks, cooking from a recipe is something they do with the same vigor as if they were reading aloud from the good book at church.  That is NOT how I make my ribs. So relax a bit, loosen your tie, listen to some Blues and try my Joeâ€™s BBQ specialsâ€¦itâ€™s gonna be worth your wait.\r\n', 'Joe@yumplate.com', 1, 'Ajax', 'Ontario', 'southernbbq.jpg', NULL, 'Condo', 'yes', 'Yes', 4, 4, 4, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-03-06 20:21:25', '2015-03-14 19:26:16'),
(56, 'cook', 'Isabella', 'king', 'isabella', '584d49670b69d62a80abe9ee9b5c39ff759873c0', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo', 'isabella@yumplate.com', 1, 'Toronto', 'Ontario', 'Isabella.jpg', NULL, 'House', 'yes', 'Yes', 5, 5, 5, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-03-06 21:46:29', '2015-03-14 19:32:57'),
(57, 'cook', 'Sofia', 'El Marikh', 'Sofia', '584d49670b69d62a80abe9ee9b5c39ff759873c0', 'Sofia was born in Lebanon and moved to Canada to start a better life. Her passion for freshly made Middle Eastern food is nothing new as she hails from a generation of restauranteurs.  Sofia''s dad owned one of Lebanon''s famous eateries and with that experience, Sofia cooks the most delicious and authentic meals right in her kitchen to bring to you.\r\n', 'sofia@yumplate.com', 1, 'Scarborough', 'Ontario', 'Sofia.jpg', NULL, 'Apartment', 'no', 'yes', 2, 3, 4, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-03-06 22:08:35', '2015-03-14 19:30:09'),
(58, 'customer', 'test2', 'test2', 'test2', '584d49670b69d62a80abe9ee9b5c39ff759873c0', NULL, 'test3@hotmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-03-07 00:07:28', '2015-03-12 19:13:39'),
(59, 'customer', 'Yum Plate', 'Plate', 'Yum Plate', NULL, NULL, 'yumplate365@gmail.com', 1, NULL, NULL, NULL, 'http://graph.facebook.com/1394309180884550/picture?type=large', NULL, NULL, NULL, 0, 0, 0, 1, NULL, NULL, '2015-03-09 10:23:33', '2015-03-09 09:55:17', '2015-03-09 10:23:33'),
(60, 'cook', 'Jimmy', 'Long', 'jimmy@yumplate.com', '584d49670b69d62a80abe9ee9b5c39ff759873c0', 'Jimmy  grew up in a predominately Sicilian and Moroccan kitchen under the watchful eye of his two grandmothers. This upbringing has inspired him to create dishes that are based on very old and authentic family recipes with a modern Sicilian twist. Jimmy was raised in Toronto and he graduated from Humber College. As a teen, he grew up in his family''s local Germantown Italian restaurant. He started as a bus boy and dishwasher and worked his way up to server then eventually manager and cook. After getting a taste of the restaurant world, Jimmy decided to make it his life and enrolled in L''ecole Culinaire. During his studies he decided he wanted follow his passions to Italy to learn traditional cooking techniques from the kitchens of the Sicilian masters.\r\n\r\nLet Jimmy introduce you to the world of Sicilian cuisine which is based on fresh ingredients with a light touch at YUMplate! ', 'jimmy@yumplate.com', 1, 'Toronto', 'Ontario', 'Joe.jpg', NULL, 'House', 'yes', 'Yes', 5, 5, 5, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-03-10 06:28:40', '2015-03-14 19:31:18'),
(61, 'customer', 'Rishi', 'Sankar', 'Rishi', 'a9a4e43f1808eb747f35f01c1803098e64b800f2', NULL, 'rishi@rishiray.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-03-11 10:57:03', '2015-03-11 10:57:03'),
(62, 'customer', 'test23', 'test5', 'test23', '584d49670b69d62a80abe9ee9b5c39ff759873c0', NULL, 'acc@hotmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-03-11 18:50:21', '2015-03-11 18:50:21'),
(63, 'customer', 'test', 'tester', 'test', 'f3d852ae06369d5c9dea2781fe01bde0f0bbadee', NULL, 'z.anwar333@gmail.com', 1, NULL, NULL, NULL, 'http://graph.facebook.com/902689726441442/picture?type=large', NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, '2015-03-18 01:01:33', '2015-03-12 00:33:15', '2015-03-18 01:01:33'),
(64, 'customer', 'tester', 'testing', 'tester', '4f470778513e0ba092fa7e4ce3467f3468f511da', NULL, 'zuhed.anwar@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '2015-03-17 05:53:44', NULL, '0000-00-00 00:00:00', '2015-03-12 01:41:00', '2015-03-17 05:53:44'),
(65, 'cook', 'Zuhed', 'Test', 'zuhedtester', '4f470778513e0ba092fa7e4ce3467f3468f511da', 'this is for testing the functionality', 'mohd.zuhed@webenturetech.com', 1, 'Noida', 'U.P', 'DG0152-350x300-350x292.jpg', NULL, 'house 1212', 'yes', 'sec-212', 0, 0, 0, 0, '2015-03-17 05:55:55', NULL, '0000-00-00 00:00:00', '2015-03-12 02:10:14', '2015-03-17 05:55:56'),
(66, 'customer', 'testere', 'testers', 'testere', '4f470778513e0ba092fa7e4ce3467f3468f511da', NULL, 'zuhed.anwar@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-03-12 03:38:57', '2015-03-12 03:38:57'),
(67, 'customer', 'bijendra', 'sharma', 'bijendra', '5241be845f2487541705d9274d50204c7fb93f14', NULL, 'bijendra@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-03-12 08:24:48', '2015-03-12 08:24:48'),
(68, 'customer', 'Bijendra Sharma', 'Sharma', 'Bijendra Sharma', 'f8b697cdb6798bb547e49fe2e2cda404a58f23e9', NULL, 'bijendra109@gmail.com', 1, NULL, NULL, NULL, 'http://graph.facebook.com/690262197762730/picture?type=large', NULL, NULL, NULL, 0, 0, 0, 1, NULL, NULL, '2015-03-12 08:28:45', '2015-03-12 08:27:56', '2015-03-13 00:24:10'),
(70, 'customer', 'jay', 'guru', 'jay', '584d49670b69d62a80abe9ee9b5c39ff759873c0', NULL, 'jay@testuser.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-03-14 18:07:54', '2015-03-14 18:07:54'),
(71, 'customer', 'Satyen', 'Rajendra', 'Satyen', '3709435e77ad97546c59e48dace45a1f31bb610e', NULL, 'Satyen_rajendra@yahoo.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, '99.230.29.10', '2015-03-15 13:25:38', '2015-03-15 07:13:45', '2015-03-15 13:25:38'),
(72, 'customer', 'teste', 'testers', 'abc@mail.com', '5241be845f2487541705d9274d50204c7fb93f14', NULL, 'abc@mail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, '182.69.210.79', '2015-03-18 04:55:19', '2015-03-16 00:33:57', '2015-03-18 04:55:19'),
(73, 'customer', 'test', 'test3', 'test@as.com', '584d49670b69d62a80abe9ee9b5c39ff759873c0', NULL, 'test@as.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-03-16 22:36:05', '2015-03-16 22:36:05'),
(74, 'customer', 'zuhedtest', 'tester', 'zuhed.anwar@gmail.com', '4f470778513e0ba092fa7e4ce3467f3468f511da', NULL, 'zuhed.anwar@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-03-17 00:54:28', '2015-03-17 00:54:28'),
(75, 'customer', 'sddsfsd', 'dsfsdf', 'zuhedds@sd.hfgd', 'b9cdb826d65e3816f01768417b4f6c5a18c2ac0d', NULL, 'zuhedds@sd.hfgd', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-03-17 06:08:29', '2015-03-17 06:08:29'),
(76, 'customer', 'Anshu Prasad', 'Prasad', 'Anshu Prasad', NULL, NULL, 'sudansu.16@gmail.com', 1, NULL, NULL, NULL, 'http://graph.facebook.com/809923469082377/picture?type=large', NULL, NULL, NULL, 0, 0, 0, 1, NULL, NULL, '2015-03-17 07:20:12', '2015-03-17 07:17:23', '2015-03-17 07:20:12'),
(77, 'customer', 'Zuhed', 'Tester', 'zuhed@gmail.com', 'ad1083e472802593ff75d0fae2341ad93b28a80f', NULL, 'zuhed@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-03-17 23:42:39', '2015-03-17 23:50:32'),
(78, 'customer', 'sdfsd', 'dsfds', 'test@gmail.com', '4b49d97403e9f91c950d7ac978b423962f6adbdf', NULL, 'test@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-03-17 23:45:56', '2015-03-17 23:46:38'),
(79, 'customer', 'fsdf', 'dsf', 'fsd@fsd.gdfh', '4f470778513e0ba092fa7e4ce3467f3468f511da', NULL, 'fsd@fsd.gdfh', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-03-17 23:49:52', '2015-03-17 23:49:52'),
(80, 'customer', 'firstname', 'lastname', 'first@last.con', '4f470778513e0ba092fa7e4ce3467f3468f511da', NULL, 'first@last.con', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-03-17 23:50:16', '2015-03-17 23:50:16'),
(81, 'customer', 'sdfsdf', 'fsdfsd', 'sdf@sdf.dfg', '3a73b4a10f4898a859bca914be29c7fef0f7fca5', NULL, 'sdf@sdf.dfg', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, '0000-00-00 00:00:00', '2015-03-18 01:24:08', '2015-03-18 01:24:08'),
(82, 'customer', 'tester1', 'tester2', 'tester12', '4f470778513e0ba092fa7e4ce3467f3468f511da', 'this is for testing the functionality', 'zuhed@mail.com', 1, 'noida', 'up', 'DG0152-350x300-350x292.jpg', NULL, 'Home', 'yes', 'Yes', 0, 0, 0, 0, NULL, '182.69.210.79', '2015-03-18 04:54:24', '2015-03-18 04:48:41', '2015-03-18 04:54:24');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
