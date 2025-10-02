-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 02, 2025 at 09:27 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Recipe_web_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Starter', '2025-09-27 22:06:14', NULL),
(2, 'Main', '2025-09-27 22:06:14', NULL),
(3, 'Dessert', '2025-09-27 22:06:14', NULL),
(4, 'Quick', '2025-09-27 22:06:14', NULL),
(5, 'Budget', '2025-09-27 22:06:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dietary_attributes`
--

CREATE TABLE `dietary_attributes` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `display_order` int(11) DEFAULT 0,
  `category` enum('diet','allergen','lifestyle','nutrition') DEFAULT 'diet',
  `severity` enum('preference','restriction','allergy') DEFAULT 'preference',
  `is_exclusion` tinyint(1) DEFAULT 0,
  `icon` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dietary_attributes`
--

INSERT INTO `dietary_attributes` (`id`, `name`, `description`, `display_order`, `category`, `severity`, `is_exclusion`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Vegetarian', 'Contains no meat, fish, or poultry', 10, 'diet', 'preference', 1, '🌱', '2025-09-27 22:06:14', NULL),
(2, 'Vegan', 'Contains no animal products including dairy and eggs', 20, 'diet', 'restriction', 1, '🌿', '2025-09-27 22:06:14', NULL),
(3, 'Pescatarian', 'Vegetarian diet that includes fish and seafood', 30, 'diet', 'preference', 0, '🐟', '2025-09-27 22:06:14', NULL),
(4, 'Paleo', 'Follows paleo diet principles - no grains, legumes, dairy', 40, 'lifestyle', 'preference', 1, '🥩', '2025-09-27 22:06:14', NULL),
(5, 'Keto-Friendly', 'Very low carb (under 20g), high fat', 50, 'nutrition', 'restriction', 0, '🥑', '2025-09-27 22:06:14', NULL),
(6, 'Low-Carb', 'Lower in carbohydrates (under 30g per serving)', 60, 'nutrition', 'preference', 0, '📉', '2025-09-27 22:06:14', NULL),
(7, 'High-Protein', 'High in protein (over 25g per serving)', 70, 'nutrition', 'preference', 0, '💪', '2025-09-27 22:06:14', NULL),
(8, 'Gluten-Free', 'Contains no wheat, barley, rye, or gluten ingredients', 100, 'allergen', 'allergy', 1, '🌾', '2025-09-27 22:06:14', NULL),
(9, 'Dairy-Free', 'Contains no milk, cheese, butter, or dairy products', 110, 'allergen', 'allergy', 1, '🥛', '2025-09-27 22:06:14', NULL),
(10, 'Egg-Free', 'Contains no eggs or egg-derived ingredients', 120, 'allergen', 'allergy', 1, '🥚', '2025-09-27 22:06:14', NULL),
(11, 'Nut-Free', 'Contains no tree nuts (almonds, walnuts, etc.)', 130, 'allergen', 'allergy', 1, '🥜', '2025-09-27 22:06:14', NULL),
(12, 'Peanut-Free', 'Contains no peanuts or peanut-derived products', 140, 'allergen', 'allergy', 1, '🥜', '2025-09-27 22:06:14', NULL),
(13, 'Shellfish-Free', 'Contains no shellfish (shrimp, crab, lobster, etc.)', 150, 'allergen', 'allergy', 1, '🦐', '2025-09-27 22:06:14', NULL),
(14, 'Fish-Free', 'Contains no fish or fish-derived ingredients', 160, 'allergen', 'allergy', 1, '🐟', '2025-09-27 22:06:14', NULL),
(15, 'Soy-Free', 'Contains no soybeans or soy-derived products', 170, 'allergen', 'allergy', 1, '🫘', '2025-09-27 22:06:14', NULL),
(16, 'Sesame-Free', 'Contains no sesame seeds or sesame oil', 180, 'allergen', 'allergy', 1, '🌰', '2025-09-27 22:06:14', NULL),
(17, 'Halal', 'Prepared according to Islamic dietary laws', 200, 'lifestyle', 'restriction', 0, '☪️', '2025-09-27 22:06:14', NULL),
(18, 'Kosher', 'Prepared according to Jewish dietary laws', 210, 'lifestyle', 'restriction', 0, '✡️', '2025-09-27 22:06:14', NULL),
(19, 'Raw Food', 'Not heated above 118°F (48°C)', 220, 'lifestyle', 'preference', 0, '🥗', '2025-09-27 22:06:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `user_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`user_id`, `recipe_id`, `created_at`) VALUES
(1, 1, '2025-09-27 22:51:27'),
(1, 2, '2025-09-27 22:51:27');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Spaghetti', '2025-09-27 22:06:14', NULL),
(2, 'Minced beef', '2025-09-27 22:06:14', NULL),
(3, 'Tomato sauce', '2025-09-27 22:06:14', NULL),
(4, 'Onion', '2025-09-27 22:06:14', NULL),
(5, 'Garlic', '2025-09-27 22:06:14', NULL),
(6, 'Olive oil', '2025-09-27 22:06:14', NULL),
(7, 'Dried oregano', '2025-09-27 22:06:14', NULL),
(8, 'Salt', '2025-09-27 22:06:14', NULL),
(9, 'Black pepper', '2025-09-27 22:06:14', NULL),
(10, 'Plain flour', '2025-09-27 22:06:14', NULL),
(11, 'Plant milk', '2025-09-27 22:06:14', NULL),
(12, 'Baking powder', '2025-09-27 22:06:14', NULL),
(13, 'Maple syrup', '2025-09-27 22:06:14', NULL),
(14, 'Wholemeal base', '2025-09-27 22:06:14', NULL),
(15, 'Mozzarella', '2025-09-27 22:06:14', NULL),
(16, 'Bell pepper', '2025-09-27 22:06:14', NULL),
(17, 'Mushroom', '2025-09-27 22:06:14', NULL),
(18, 'Basmati rice', '2025-09-27 22:06:14', NULL),
(19, 'Lamb', '2025-09-27 22:06:14', NULL),
(20, 'Curry powder', '2025-09-27 22:06:14', NULL),
(21, 'Yogurt', '2025-09-27 22:06:14', NULL),
(22, 'Couscous', '2025-09-27 22:06:14', NULL),
(23, 'Chickpeas', '2025-09-27 22:06:14', NULL),
(24, 'Cucumber', '2025-09-27 22:06:14', NULL),
(25, 'Lemon', '2025-09-27 22:06:14', NULL),
(26, 'Plums', '2025-09-27 22:06:14', NULL),
(27, 'Eggs', '2025-09-27 22:06:14', NULL),
(28, 'Sugar', '2025-09-27 22:06:14', NULL),
(29, 'Butter', '2025-09-27 22:06:14', NULL),
(146, 'Mango', '2025-09-27 22:51:27', NULL),
(147, 'Pie crust', '2025-09-27 22:51:27', NULL),
(148, 'Lime', '2025-09-27 22:51:27', NULL),
(149, 'Cornflour', '2025-09-27 22:51:27', NULL),
(150, 'Coconut cream', '2025-09-27 22:51:27', NULL),
(151, 'Vanilla', '2025-09-27 22:51:27', NULL),
(152, 'Flatbread', '2025-09-27 22:51:27', NULL),
(153, 'Paprika', '2025-09-27 22:51:27', NULL),
(154, 'Ground cumin', '2025-09-27 22:51:27', NULL),
(155, 'Tahini', '2025-09-27 22:51:27', NULL),
(156, 'Lettuce', '2025-09-27 22:51:27', NULL),
(157, 'Tomato', '2025-09-27 22:51:27', NULL),
(240, 'Tomatoes', '2025-09-27 23:03:42', NULL),
(241, 'Vegetable stock', '2025-09-27 23:03:42', NULL),
(242, 'Basil', '2025-09-27 23:03:42', NULL),
(243, 'Cream', '2025-09-27 23:03:42', NULL),
(244, 'Chicken breast', '2025-09-27 23:03:42', NULL),
(245, 'Mixed salad leaves', '2025-09-27 23:03:42', NULL),
(246, 'Olives', '2025-09-27 23:03:42', NULL),
(247, 'Feta', '2025-09-27 23:03:42', NULL),
(248, 'Balsamic vinegar', '2025-09-27 23:03:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_allergens`
--

CREATE TABLE `ingredient_allergens` (
  `ingredient_id` int(11) NOT NULL,
  `dietary_attribute_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredient_allergens`
--

INSERT INTO `ingredient_allergens` (`ingredient_id`, `dietary_attribute_id`) VALUES
(1, 8),
(10, 8),
(14, 8),
(15, 9),
(21, 9),
(27, 10),
(29, 9),
(147, 8),
(152, 8),
(243, 9),
(247, 9);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_categories`
--

CREATE TABLE `ingredient_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredient_categories`
--

INSERT INTO `ingredient_categories` (`id`, `name`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Grains & Cereals', NULL, '2025-09-28 09:22:59', NULL),
(2, 'Proteins', NULL, '2025-09-28 09:22:59', NULL),
(3, 'Dairy & Alternatives', NULL, '2025-09-28 09:22:59', NULL),
(4, 'Vegetables', NULL, '2025-09-28 09:22:59', NULL),
(5, 'Fruits', NULL, '2025-09-28 09:22:59', NULL),
(6, 'Herbs & Spices', NULL, '2025-09-28 09:22:59', NULL),
(7, 'Fats & Oils', NULL, '2025-09-28 09:22:59', NULL),
(8, 'Condiments & Sauces', NULL, '2025-09-28 09:22:59', NULL),
(9, 'Baking', NULL, '2025-09-28 09:22:59', NULL),
(10, 'Nuts & Seeds', NULL, '2025-09-28 09:22:59', NULL),
(11, 'Pasta', 1, '2025-09-28 09:22:59', NULL),
(12, 'Rice', 1, '2025-09-28 09:22:59', NULL),
(13, 'Flour & Baking Bases', 1, '2025-09-28 09:22:59', NULL),
(14, 'Bread & Wraps', 1, '2025-09-28 09:22:59', NULL),
(15, 'Meat', 2, '2025-09-28 09:22:59', NULL),
(16, 'Poultry', 2, '2025-09-28 09:22:59', NULL),
(17, 'Legumes', 2, '2025-09-28 09:22:59', NULL),
(18, 'Alliums', 4, '2025-09-28 09:22:59', NULL),
(19, 'Leafy Greens', 4, '2025-09-28 09:22:59', NULL),
(20, 'Nightshades', 4, '2025-09-28 09:22:59', NULL),
(21, 'Mushrooms', 4, '2025-09-28 09:22:59', NULL),
(22, 'Stone Fruits', 5, '2025-09-28 09:22:59', NULL),
(23, 'Tropical Fruits', 5, '2025-09-28 09:22:59', NULL),
(24, 'Citrus', 5, '2025-09-28 09:22:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_category_map`
--

CREATE TABLE `ingredient_category_map` (
  `ingredient_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredient_category_map`
--

INSERT INTO `ingredient_category_map` (`ingredient_id`, `category_id`) VALUES
(1, 11),
(2, 15),
(3, 20),
(4, 18),
(5, 18),
(6, 7),
(7, 6),
(8, 6),
(9, 6),
(10, 13),
(11, 3),
(12, 9),
(13, 8),
(14, 13),
(15, 3),
(16, 20),
(17, 21),
(18, 12),
(19, 15),
(20, 6),
(21, 3),
(22, 1),
(23, 17),
(24, 4),
(25, 24),
(26, 22),
(27, 9),
(28, 9),
(29, 3),
(146, 23),
(147, 13),
(148, 24),
(149, 9),
(150, 3),
(151, 9),
(152, 14),
(153, 6),
(154, 6),
(155, 8),
(156, 19),
(157, 20),
(240, 20),
(241, 8),
(242, 19),
(243, 3),
(244, 16),
(245, 19),
(246, 8),
(247, 3),
(248, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_synonyms`
--

CREATE TABLE `ingredient_synonyms` (
  `ingredient_id` int(11) NOT NULL,
  `synonym` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredient_synonyms`
--

INSERT INTO `ingredient_synonyms` (`ingredient_id`, `synonym`) VALUES
(1, 'pasta'),
(2, 'beef mince'),
(2, 'ground beef'),
(2, 'hamburger meat'),
(3, 'marinara'),
(3, 'passata'),
(5, 'fresh garlic'),
(5, 'garlic cloves'),
(6, 'EVOO'),
(6, 'extra virgin olive oil'),
(7, 'oregano'),
(10, 'all-purpose flour'),
(10, 'white flour'),
(11, 'almond milk'),
(11, 'coconut milk'),
(11, 'non-dairy milk'),
(11, 'oat milk'),
(11, 'soy milk'),
(12, 'baking soda'),
(13, 'pure maple syrup'),
(14, 'brown base'),
(14, 'whole wheat base'),
(15, 'buffalo mozzarella'),
(15, 'fresh mozzarella'),
(16, 'capsicum'),
(16, 'sweet pepper'),
(17, 'mushrooms'),
(18, 'long grain rice'),
(20, 'curry spice'),
(22, 'pearl couscous'),
(23, 'canned chickpeas'),
(23, 'garbanzo beans'),
(25, 'fresh lemon'),
(146, 'ripe mango'),
(148, 'fresh lime'),
(151, 'vanilla extract'),
(154, 'cumin powder'),
(157, 'cherry tomatoes'),
(240, 'fresh tomatoes'),
(240, 'ripe tomatoes'),
(244, 'chicken breasts'),
(244, 'chicken fillets'),
(245, 'lettuce mix'),
(245, 'salad mix'),
(247, 'feta cheese');

-- --------------------------------------------------------

--
-- Table structure for table `nutrition`
--

CREATE TABLE `nutrition` (
  `recipe_id` int(11) NOT NULL,
  `calories_kcal` int(11) NOT NULL,
  `protein_g` decimal(6,2) NOT NULL,
  `carbs_g` decimal(6,2) NOT NULL,
  `fat_g` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nutrition`
--

INSERT INTO `nutrition` (`recipe_id`, `calories_kcal`, `protein_g`, `carbs_g`, `fat_g`) VALUES
(1, 620, 32.00, 75.00, 22.00),
(2, 280, 6.00, 48.00, 7.00),
(3, 510, 24.00, 60.00, 18.00),
(4, 700, 35.00, 80.00, 25.00),
(5, 420, 14.00, 60.00, 12.00),
(6, 360, 7.00, 48.00, 14.00),
(7, 620, 32.00, 75.00, 22.00),
(8, 280, 6.00, 48.00, 7.00),
(9, 510, 24.00, 60.00, 18.00),
(10, 700, 35.00, 80.00, 25.00),
(11, 420, 14.00, 60.00, 12.00),
(12, 360, 7.00, 48.00, 14.00),
(13, 620, 32.00, 75.00, 22.00),
(14, 280, 6.00, 48.00, 7.00),
(15, 510, 24.00, 60.00, 18.00),
(16, 700, 35.00, 80.00, 25.00),
(17, 420, 14.00, 60.00, 12.00),
(18, 360, 7.00, 48.00, 14.00),
(19, 620, 32.00, 75.00, 22.00),
(20, 280, 6.00, 48.00, 7.00),
(21, 510, 24.00, 60.00, 18.00),
(22, 700, 35.00, 80.00, 25.00),
(23, 420, 14.00, 60.00, 12.00),
(24, 360, 7.00, 48.00, 14.00),
(25, 620, 32.00, 75.00, 22.00),
(26, 280, 6.00, 48.00, 7.00),
(27, 510, 24.00, 60.00, 18.00),
(28, 700, 35.00, 80.00, 25.00),
(29, 420, 14.00, 60.00, 12.00),
(30, 360, 7.00, 48.00, 14.00),
(31, 420, 5.00, 55.00, 18.00),
(32, 520, 16.00, 20.00, 20.00),
(33, 620, 32.00, 75.00, 22.00),
(34, 280, 6.00, 48.00, 7.00),
(35, 510, 24.00, 60.00, 18.00),
(36, 700, 35.00, 80.00, 25.00),
(37, 420, 14.00, 60.00, 12.00),
(38, 360, 7.00, 48.00, 14.00),
(39, 420, 5.00, 55.00, 18.00),
(40, 520, 16.00, 20.00, 20.00),
(41, 620, 32.00, 75.00, 22.00),
(42, 280, 6.00, 48.00, 7.00),
(43, 510, 24.00, 60.00, 18.00),
(44, 700, 35.00, 80.00, 25.00),
(45, 420, 14.00, 60.00, 12.00),
(46, 360, 7.00, 48.00, 14.00),
(47, 420, 5.00, 55.00, 18.00),
(48, 520, 16.00, 20.00, 20.00),
(49, 180, 4.00, 20.00, 9.00),
(50, 620, 32.00, 75.00, 22.00),
(51, 280, 6.00, 48.00, 7.00),
(52, 510, 24.00, 60.00, 18.00),
(53, 700, 35.00, 80.00, 25.00),
(54, 420, 14.00, 60.00, 12.00),
(55, 360, 7.00, 48.00, 14.00),
(56, 420, 5.00, 55.00, 18.00),
(57, 520, 16.00, 20.00, 20.00),
(58, 180, 4.00, 20.00, 9.00),
(59, 620, 32.00, 75.00, 22.00),
(60, 280, 6.00, 48.00, 7.00),
(61, 510, 24.00, 60.00, 18.00),
(62, 700, 35.00, 80.00, 25.00),
(63, 420, 14.00, 60.00, 12.00),
(64, 360, 7.00, 48.00, 14.00),
(65, 420, 5.00, 55.00, 18.00),
(66, 520, 16.00, 20.00, 20.00),
(67, 180, 4.00, 20.00, 9.00),
(68, 620, 32.00, 75.00, 22.00),
(69, 280, 6.00, 48.00, 7.00),
(70, 510, 24.00, 60.00, 18.00),
(71, 700, 35.00, 80.00, 25.00),
(72, 420, 14.00, 60.00, 12.00),
(73, 360, 7.00, 48.00, 14.00),
(74, 420, 5.00, 55.00, 18.00),
(75, 520, 16.00, 20.00, 20.00),
(76, 180, 4.00, 20.00, 9.00),
(77, 430, 38.00, 10.00, 24.00),
(78, 620, 32.00, 75.00, 22.00),
(79, 280, 6.00, 48.00, 7.00),
(80, 510, 24.00, 60.00, 18.00),
(81, 700, 35.00, 80.00, 25.00),
(82, 420, 14.00, 60.00, 12.00),
(83, 360, 7.00, 48.00, 14.00),
(84, 420, 5.00, 55.00, 18.00),
(85, 520, 16.00, 20.00, 20.00),
(86, 180, 4.00, 20.00, 9.00),
(87, 430, 38.00, 10.00, 24.00),
(88, 620, 32.00, 75.00, 22.00),
(89, 280, 6.00, 48.00, 7.00),
(90, 510, 24.00, 60.00, 18.00),
(91, 700, 35.00, 80.00, 25.00),
(92, 420, 14.00, 60.00, 12.00),
(93, 360, 7.00, 48.00, 14.00),
(94, 620, 32.00, 75.00, 22.00),
(95, 280, 6.00, 48.00, 7.00),
(96, 510, 24.00, 60.00, 18.00),
(97, 700, 35.00, 80.00, 25.00),
(98, 420, 14.00, 60.00, 12.00),
(99, 360, 7.00, 48.00, 14.00),
(100, 420, 5.00, 55.00, 18.00),
(101, 520, 16.00, 60.00, 20.00),
(102, 180, 4.00, 20.00, 9.00),
(103, 430, 38.00, 10.00, 24.00);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `user_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `overall` tinyint(4) NOT NULL CHECK (`overall` between 1 and 5),
  `taste` tinyint(4) DEFAULT NULL CHECK (`taste` between 0 and 5),
  `aesthetics` tinyint(4) DEFAULT NULL CHECK (`aesthetics` between 0 and 5),
  `difficulty_score` tinyint(4) DEFAULT NULL CHECK (`difficulty_score` between 0 and 5),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`user_id`, `recipe_id`, `overall`, `taste`, `aesthetics`, `difficulty_score`, `updated_at`) VALUES
(1, 1, 5, 5, 4, 2, '2025-09-27 22:51:27'),
(1, 2, 4, 4, 4, 1, '2025-09-27 22:51:27');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `summary` text DEFAULT NULL,
  `difficulty` enum('Easy','Medium','Hard') DEFAULT 'Easy',
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `title`, `summary`, `difficulty`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 'Spaghetti Bolognese', 'A comforting pasta with a rich tomato-beef sauce.', 'Easy', '/assets/images/spaghetti.jpg', '2025-09-27 22:06:14', '2025-09-28 08:33:49'),
(2, 'Vegan Pancakes', 'Fluffy pancakes without dairy or eggs, perfect for brunch.', 'Easy', '/assets/images/vegan_pancakes.jpg', '2025-09-27 22:06:14', '2025-09-28 08:33:49'),
(3, 'Healthy Pizza', 'A lighter pizza with wholemeal base and colorful veg.', 'Medium', '/assets/images/healthy_pizza.jpg', '2025-09-27 22:06:14', '2025-09-28 08:33:49'),
(4, 'Easy Lamb Biryani', 'Fragrant rice cooked with tender lamb and spices.', 'Medium', '/assets/images/lamb_biryani.jpg', '2025-09-27 22:06:14', '2025-09-28 08:33:49'),
(5, 'Couscous Salad', 'Zesty couscous tossed with chickpeas and crisp veg.', 'Easy', '/assets/images/couscous_salad.jpg', '2025-09-27 22:06:14', '2025-09-28 08:37:58'),
(6, 'Plum clafoutis', 'Custardy baked dessert studded with ripe plums.', 'Medium', '/assets/images/plum_clafoutis.jpg', '2025-09-27 22:06:14', '2025-09-28 08:37:58'),
(7, 'Spaghetti Bolognese', 'A comforting pasta with a rich tomato-beef sauce.', 'Easy', '/assets/images/spaghetti.jpg', '2025-09-27 22:08:03', '2025-09-28 08:33:49'),
(8, 'Vegan Pancakes', 'Fluffy pancakes without dairy or eggs, perfect for brunch.', 'Easy', '/assets/images/vegan_pancakes.jpg', '2025-09-27 22:08:03', '2025-09-28 08:33:49'),
(9, 'Healthy Pizza', 'A lighter pizza with wholemeal base and colorful veg.', 'Medium', '/assets/images/healthy_pizza.jpg', '2025-09-27 22:08:03', '2025-09-28 08:33:49'),
(10, 'Easy Lamb Biryani', 'Fragrant rice cooked with tender lamb and spices.', 'Medium', '/assets/images/lamb_biryani.jpg', '2025-09-27 22:08:03', '2025-09-28 08:33:49'),
(11, 'Couscous Salad', 'Zesty couscous tossed with chickpeas and crisp veg.', 'Easy', '/assets/images/couscous_salad.jpg', '2025-09-27 22:08:03', '2025-09-28 08:37:58'),
(12, 'Plum clafoutis', 'Custardy baked dessert studded with ripe plums.', 'Medium', '/assets/images/plum_clafoutis.jpg', '2025-09-27 22:08:03', '2025-09-28 08:37:58'),
(13, 'Spaghetti Bolognese', 'A comforting pasta with a rich tomato-beef sauce.', 'Easy', '/assets/images/spaghetti.jpg', '2025-09-27 22:22:31', '2025-09-28 08:33:49'),
(14, 'Vegan Pancakes', 'Fluffy pancakes without dairy or eggs, perfect for brunch.', 'Easy', '/assets/images/vegan_pancakes.jpg', '2025-09-27 22:22:31', '2025-09-28 08:33:49'),
(15, 'Healthy Pizza', 'A lighter pizza with wholemeal base and colorful veg.', 'Medium', '/assets/images/healthy_pizza.jpg', '2025-09-27 22:22:31', '2025-09-28 08:33:49'),
(16, 'Easy Lamb Biryani', 'Fragrant rice cooked with tender lamb and spices.', 'Medium', '/assets/images/lamb_biryani.jpg', '2025-09-27 22:22:31', '2025-09-28 08:33:49'),
(17, 'Couscous Salad', 'Zesty couscous tossed with chickpeas and crisp veg.', 'Easy', '/assets/images/couscous_salad.jpg', '2025-09-27 22:22:31', '2025-09-28 08:37:58'),
(18, 'Plum clafoutis', 'Custardy baked dessert studded with ripe plums.', 'Medium', '/assets/images/plum_clafoutis.jpg', '2025-09-27 22:22:31', '2025-09-28 08:37:58'),
(19, 'Spaghetti Bolognese', 'A comforting pasta with a rich tomato-beef sauce.', 'Easy', '/assets/images/spaghetti.jpg', '2025-09-27 22:46:32', '2025-09-28 08:33:49'),
(20, 'Vegan Pancakes', 'Fluffy pancakes without dairy or eggs, perfect for brunch.', 'Easy', '/assets/images/vegan_pancakes.jpg', '2025-09-27 22:46:32', '2025-09-28 08:33:49'),
(21, 'Healthy Pizza', 'A lighter pizza with wholemeal base and colorful veg.', 'Medium', '/assets/images/healthy_pizza.jpg', '2025-09-27 22:46:32', '2025-09-28 08:33:49'),
(22, 'Easy Lamb Biryani', 'Fragrant rice cooked with tender lamb and spices.', 'Medium', '/assets/images/lamb_biryani.jpg', '2025-09-27 22:46:32', '2025-09-28 08:33:49'),
(23, 'Couscous Salad', 'Zesty couscous tossed with chickpeas and crisp veg.', 'Easy', '/assets/images/couscous_salad.jpg', '2025-09-27 22:46:32', '2025-09-28 08:37:58'),
(24, 'Plum clafoutis', 'Custardy baked dessert studded with ripe plums.', 'Medium', '/assets/images/plum_clafoutis.jpg', '2025-09-27 22:46:32', '2025-09-28 08:37:58'),
(25, 'Spaghetti Bolognese', 'A comforting pasta with a rich tomato-beef sauce.', 'Easy', '/assets/images/spaghetti.jpg', '2025-09-27 22:51:27', '2025-09-28 08:33:49'),
(26, 'Vegan Pancakes', 'Fluffy pancakes without dairy or eggs, perfect for brunch.', 'Easy', '/assets/images/vegan_pancakes.jpg', '2025-09-27 22:51:27', '2025-09-28 08:33:49'),
(27, 'Healthy Pizza', 'A lighter pizza with wholemeal base and colorful veg.', 'Medium', '/assets/images/healthy_pizza.jpg', '2025-09-27 22:51:27', '2025-09-28 08:33:49'),
(28, 'Easy Lamb Biryani', 'Fragrant rice cooked with tender lamb and spices.', 'Medium', '/assets/images/lamb_biryani.jpg', '2025-09-27 22:51:27', '2025-09-28 08:33:49'),
(29, 'Couscous Salad', 'Zesty couscous tossed with chickpeas and crisp veg.', 'Easy', '/assets/images/couscous_salad.jpg', '2025-09-27 22:51:27', '2025-09-28 08:37:58'),
(30, 'Plum clafoutis', 'Custardy baked dessert studded with ripe plums.', 'Medium', '/assets/images/plum_clafoutis.jpg', '2025-09-27 22:51:27', '2025-09-28 08:37:58'),
(31, 'Mango Pie', 'Bright, creamy mango filling in a crisp crust.', 'Medium', '/assets/images/mango_pie.jpg', '2025-09-27 22:51:27', '2025-09-28 08:37:58'),
(32, 'Mushroom Doner', 'Herbed mushrooms piled into warm flatbread with fresh veg.', 'Easy', '/assets/images/mushroom_doner.jpg', '2025-09-27 22:51:27', '2025-09-28 08:37:58'),
(33, 'Spaghetti Bolognese', 'A comforting pasta with a rich tomato-beef sauce.', 'Easy', '/assets/images/spaghetti.jpg', '2025-09-27 22:52:16', '2025-09-28 08:33:49'),
(34, 'Vegan Pancakes', 'Fluffy pancakes without dairy or eggs, perfect for brunch.', 'Easy', '/assets/images/vegan_pancakes.jpg', '2025-09-27 22:52:16', '2025-09-28 08:33:49'),
(35, 'Healthy Pizza', 'A lighter pizza with wholemeal base and colorful veg.', 'Medium', '/assets/images/healthy_pizza.jpg', '2025-09-27 22:52:16', '2025-09-28 08:33:49'),
(36, 'Easy Lamb Biryani', 'Fragrant rice cooked with tender lamb and spices.', 'Medium', '/assets/images/lamb_biryani.jpg', '2025-09-27 22:52:16', '2025-09-28 08:33:49'),
(37, 'Couscous Salad', 'Zesty couscous tossed with chickpeas and crisp veg.', 'Easy', '/assets/images/couscous_salad.jpg', '2025-09-27 22:52:16', '2025-09-28 08:37:58'),
(38, 'Plum clafoutis', 'Custardy baked dessert studded with ripe plums.', 'Medium', '/assets/images/plum_clafoutis.jpg', '2025-09-27 22:52:16', '2025-09-28 08:37:58'),
(39, 'Mango Pie', 'Bright, creamy mango filling in a crisp crust.', 'Medium', '/assets/images/mango_pie.jpg', '2025-09-27 22:52:16', '2025-09-28 08:37:58'),
(40, 'Mushroom Doner', 'Herbed mushrooms piled into warm flatbread with fresh veg.', 'Easy', '/assets/images/mushroom_doner.jpg', '2025-09-27 22:52:16', '2025-09-28 08:37:58'),
(41, 'Spaghetti Bolognese', 'A comforting pasta with a rich tomato-beef sauce.', 'Easy', '/assets/images/spaghetti.jpg', '2025-09-27 23:03:42', '2025-09-28 08:33:49'),
(42, 'Vegan Pancakes', 'Fluffy pancakes without dairy or eggs, perfect for brunch.', 'Easy', '/assets/images/vegan_pancakes.jpg', '2025-09-27 23:03:42', '2025-09-28 08:33:49'),
(43, 'Healthy Pizza', 'A lighter pizza with wholemeal base and colorful veg.', 'Medium', '/assets/images/healthy_pizza.jpg', '2025-09-27 23:03:42', '2025-09-28 08:33:49'),
(44, 'Easy Lamb Biryani', 'Fragrant rice cooked with tender lamb and spices.', 'Medium', '/assets/images/lamb_biryani.jpg', '2025-09-27 23:03:42', '2025-09-28 08:33:49'),
(45, 'Couscous Salad', 'Zesty couscous tossed with chickpeas and crisp veg.', 'Easy', '/assets/images/couscous_salad.jpg', '2025-09-27 23:03:42', '2025-09-28 08:37:58'),
(46, 'Plum clafoutis', 'Custardy baked dessert studded with ripe plums.', 'Medium', '/assets/images/plum_clafoutis.jpg', '2025-09-27 23:03:42', '2025-09-28 08:37:58'),
(47, 'Mango Pie', 'Bright, creamy mango filling in a crisp crust.', 'Medium', '/assets/images/mango_pie.jpg', '2025-09-27 23:03:42', '2025-09-28 08:37:58'),
(48, 'Mushroom Doner', 'Herbed mushrooms piled into warm flatbread with fresh veg.', 'Easy', '/assets/images/mushroom_doner.jpg', '2025-09-27 23:03:42', '2025-09-28 08:37:58'),
(49, 'Tomato Basil Soup', 'Simple, vibrant soup with fresh basil. Great starter.', 'Easy', '/assets/images/tomato_basil_soup.jpg', '2025-09-27 23:03:42', NULL),
(50, 'Spaghetti Bolognese', 'A comforting pasta with a rich tomato-beef sauce.', 'Easy', '/assets/images/spaghetti.jpg', '2025-09-28 08:18:10', '2025-09-28 08:33:49'),
(51, 'Vegan Pancakes', 'Fluffy pancakes without dairy or eggs, perfect for brunch.', 'Easy', '/assets/images/vegan_pancakes.jpg', '2025-09-28 08:18:10', '2025-09-28 08:33:49'),
(52, 'Healthy Pizza', 'A lighter pizza with wholemeal base and colorful veg.', 'Medium', '/assets/images/healthy_pizza.jpg', '2025-09-28 08:18:10', '2025-09-28 08:33:49'),
(53, 'Easy Lamb Biryani', 'Fragrant rice cooked with tender lamb and spices.', 'Medium', '/assets/images/lamb_biryani.jpg', '2025-09-28 08:18:10', '2025-09-28 08:33:49'),
(54, 'Couscous Salad', 'Zesty couscous tossed with chickpeas and crisp veg.', 'Easy', '/assets/images/couscous_salad.jpg', '2025-09-28 08:18:10', '2025-09-28 08:37:58'),
(55, 'Plum clafoutis', 'Custardy baked dessert studded with ripe plums.', 'Medium', '/assets/images/plum_clafoutis.jpg', '2025-09-28 08:18:10', '2025-09-28 08:37:58'),
(56, 'Mango Pie', 'Bright, creamy mango filling in a crisp crust.', 'Medium', '/assets/images/mango_pie.jpg', '2025-09-28 08:18:10', '2025-09-28 08:37:58'),
(57, 'Mushroom Doner', 'Herbed mushrooms piled into warm flatbread with fresh veg.', 'Easy', '/assets/images/mushroom_doner.jpg', '2025-09-28 08:18:10', '2025-09-28 08:37:58'),
(58, 'Tomato Basil Soup', 'Simple, vibrant soup with fresh basil. Great starter.', 'Easy', '/assets/images/tomato_basil_soup.jpg', '2025-09-28 08:18:10', NULL),
(59, 'Spaghetti Bolognese', 'A comforting pasta with a rich tomato-beef sauce.', 'Easy', '/assets/images/spaghetti.jpg', '2025-09-28 08:18:49', '2025-09-28 08:33:49'),
(60, 'Vegan Pancakes', 'Fluffy pancakes without dairy or eggs, perfect for brunch.', 'Easy', '/assets/images/vegan_pancakes.jpg', '2025-09-28 08:18:49', '2025-09-28 08:33:49'),
(61, 'Healthy Pizza', 'A lighter pizza with wholemeal base and colorful veg.', 'Medium', '/assets/images/healthy_pizza.jpg', '2025-09-28 08:18:49', '2025-09-28 08:33:49'),
(62, 'Easy Lamb Biryani', 'Fragrant rice cooked with tender lamb and spices.', 'Medium', '/assets/images/lamb_biryani.jpg', '2025-09-28 08:18:49', '2025-09-28 08:33:49'),
(63, 'Couscous Salad', 'Zesty couscous tossed with chickpeas and crisp veg.', 'Easy', '/assets/images/couscous_salad.jpg', '2025-09-28 08:18:49', '2025-09-28 08:37:58'),
(64, 'Plum clafoutis', 'Custardy baked dessert studded with ripe plums.', 'Medium', '/assets/images/plum_clafoutis.jpg', '2025-09-28 08:18:49', '2025-09-28 08:37:58'),
(65, 'Mango Pie', 'Bright, creamy mango filling in a crisp crust.', 'Medium', '/assets/images/mango_pie.jpg', '2025-09-28 08:18:49', '2025-09-28 08:37:58'),
(66, 'Mushroom Doner', 'Herbed mushrooms piled into warm flatbread with fresh veg.', 'Easy', '/assets/images/mushroom_doner.jpg', '2025-09-28 08:18:49', '2025-09-28 08:37:58'),
(67, 'Tomato Basil Soup', 'Simple, vibrant soup with fresh basil. Great starter.', 'Easy', '/assets/images/tomato_basil_soup.jpg', '2025-09-28 08:18:49', NULL),
(68, 'Spaghetti Bolognese', 'A comforting pasta with a rich tomato-beef sauce.', 'Easy', '/assets/images/spaghetti.jpg', '2025-09-28 08:33:49', '2025-09-28 08:33:49'),
(69, 'Vegan Pancakes', 'Fluffy pancakes without dairy or eggs, perfect for brunch.', 'Easy', '/assets/images/vegan_pancakes.jpg', '2025-09-28 08:33:49', '2025-09-28 08:33:49'),
(70, 'Healthy Pizza', 'A lighter pizza with wholemeal base and colorful veg.', 'Medium', '/assets/images/healthy_pizza.jpg', '2025-09-28 08:33:49', '2025-09-28 08:33:49'),
(71, 'Easy Lamb Biryani', 'Fragrant rice cooked with tender lamb and spices.', 'Medium', '/assets/images/lamb_biryani.jpg', '2025-09-28 08:33:49', '2025-09-28 08:33:49'),
(72, 'Couscous Salad', 'Zesty couscous tossed with chickpeas and crisp veg.', 'Easy', '/assets/images/couscous_salad.jpg', '2025-09-28 08:33:49', '2025-09-28 08:37:58'),
(73, 'Plum clafoutis', 'Custardy baked dessert studded with ripe plums.', 'Medium', '/assets/images/plum_clafoutis.jpg', '2025-09-28 08:33:49', '2025-09-28 08:37:58'),
(74, 'Mango Pie', 'Bright, creamy mango filling in a crisp crust.', 'Medium', '/assets/images/mango_pie.jpg', '2025-09-28 08:33:49', '2025-09-28 08:37:58'),
(75, 'Mushroom Doner', 'Herbed mushrooms piled into warm flatbread with fresh veg.', 'Easy', '/assets/images/mushroom_doner.jpg', '2025-09-28 08:33:49', '2025-09-28 08:37:58'),
(76, 'Tomato Basil Soup', 'Simple, vibrant soup with fresh basil. Great starter.', 'Easy', '/assets/images/tomato_basil_soup.jpg', '2025-09-28 08:33:49', NULL),
(77, 'Grilled Chicken Salad', 'Protein-forward salad with crisp veg and balsamic drizzle.', 'Easy', '/assets/images/grilled_chicken_salad.jpg', '2025-09-28 08:33:49', NULL),
(78, 'Spaghetti Bolognese', 'A comforting pasta with a rich tomato-beef sauce.', 'Easy', '/assets/images/spaghetti.jpg', '2025-09-28 08:37:57', '2025-09-28 08:37:58'),
(79, 'Vegan Pancakes', 'Fluffy pancakes without dairy or eggs, perfect for brunch.', 'Easy', '/assets/images/vegan_pancakes.jpg', '2025-09-28 08:37:57', '2025-09-28 08:37:58'),
(80, 'Healthy Pizza', 'A lighter pizza with wholemeal base and colorful veg.', 'Medium', '/assets/images/healthy_pizza.jpg', '2025-09-28 08:37:57', '2025-09-28 08:37:58'),
(81, 'Easy Lamb Biryani', 'Fragrant rice cooked with tender lamb and spices.', 'Medium', '/assets/images/lamb_biryani.jpg', '2025-09-28 08:37:57', '2025-09-28 08:37:58'),
(82, 'Couscous Salad', 'Zesty couscous tossed with chickpeas and crisp veg.', 'Easy', '/assets/images/couscous_salad.jpg', '2025-09-28 08:37:57', '2025-09-28 08:37:58'),
(83, 'Plum clafoutis', 'Custardy baked dessert studded with ripe plums.', 'Medium', '/assets/images/plum_clafoutis.jpg', '2025-09-28 08:37:57', '2025-09-28 08:37:58'),
(84, 'Mango Pie', 'Bright, creamy mango filling in a crisp crust.', 'Medium', '/assets/images/mango_pie.jpg', '2025-09-28 08:37:57', '2025-09-28 08:37:58'),
(85, 'Mushroom Doner', 'Herbed mushrooms piled into warm flatbread with fresh veg.', 'Easy', '/assets/images/mushroom_doner.jpg', '2025-09-28 08:37:57', '2025-09-28 08:37:58'),
(86, 'Tomato Basil Soup', 'Simple, vibrant soup with fresh basil. Great starter.', 'Easy', '/assets/images/tomato_basil_soup.jpg', '2025-09-28 08:37:57', NULL),
(87, 'Grilled Chicken Salad', 'Protein-forward salad with crisp veg and balsamic drizzle.', 'Easy', '/assets/images/grilled_chicken_salad.jpg', '2025-09-28 08:37:57', NULL),
(88, 'Spaghetti Bolognese', 'A comforting pasta with a rich tomato-beef sauce.', 'Easy', '/assets/images/spaghetti.jpg', '2025-09-28 09:31:56', '2025-09-28 09:46:08'),
(89, 'Vegan Pancakes', 'Fluffy pancakes without dairy or eggs, perfect for brunch.', 'Easy', '/assets/images/vegan_pancakes.jpg', '2025-09-28 09:31:56', '2025-09-28 09:46:08'),
(90, 'Healthy Pizza', 'A lighter pizza with wholemeal base and colorful veg.', 'Medium', '/assets/images/healthy_pizza.jpg', '2025-09-28 09:31:56', '2025-09-28 09:46:08'),
(91, 'Easy Lamb Biryani', 'Fragrant rice cooked with tender lamb and spices.', 'Medium', '/assets/images/lamb_biryani.jpg', '2025-09-28 09:31:56', '2025-09-28 09:46:08'),
(92, 'Couscous Salad', 'Zesty couscous tossed with chickpeas and crisp veg.', 'Easy', '/assets/images/couscous_salad.jpg', '2025-09-28 09:31:56', '2025-09-28 09:46:08'),
(93, 'Plum clafoutis', 'Custardy baked dessert studded with ripe plums.', 'Medium', '/assets/images/plum_clafoutis.jpg', '2025-09-28 09:31:56', '2025-09-28 09:46:08'),
(94, 'Spaghetti Bolognese', 'A comforting pasta with a rich tomato-beef sauce.', 'Easy', '/assets/images/spaghetti.jpg', '2025-09-28 09:46:08', '2025-09-28 09:46:08'),
(95, 'Vegan Pancakes', 'Fluffy pancakes without dairy or eggs, perfect for brunch.', 'Easy', '/assets/images/vegan_pancakes.jpg', '2025-09-28 09:46:08', '2025-09-28 09:46:08'),
(96, 'Healthy Pizza', 'A lighter pizza with wholemeal base and colorful veg.', 'Medium', '/assets/images/healthy_pizza.jpg', '2025-09-28 09:46:08', '2025-09-28 09:46:08'),
(97, 'Easy Lamb Biryani', 'Fragrant rice cooked with tender lamb and spices.', 'Medium', '/assets/images/lamb_biryani.jpg', '2025-09-28 09:46:08', '2025-09-28 09:46:08'),
(98, 'Couscous Salad', 'Zesty couscous tossed with chickpeas and crisp veg.', 'Easy', '/assets/images/couscous_salad.jpg', '2025-09-28 09:46:08', '2025-09-28 09:46:08'),
(99, 'Plum clafoutis', 'Custardy baked dessert studded with ripe plums.', 'Medium', '/assets/images/plum_clafoutis.jpg', '2025-09-28 09:46:08', '2025-09-28 09:46:08'),
(100, 'Mango Pie', 'Bright, creamy mango filling in a crisp crust.', 'Medium', '/assets/images/mango_pie.jpg', '2025-09-28 09:46:08', '2025-09-28 09:46:08'),
(101, 'Mushroom Doner', 'Herbed mushrooms piled into warm flatbread with fresh veg.', 'Easy', '/assets/images/mushroom_doner.jpg', '2025-09-28 09:46:08', '2025-09-28 09:46:08'),
(102, 'Tomato Basil Soup', 'Simple, vibrant soup with fresh basil. Great starter.', 'Easy', '/assets/images/tomato_basil_soup.jpg', '2025-09-28 09:46:08', NULL),
(103, 'Grilled Chicken Salad', 'Protein-forward salad with crisp veg and balsamic drizzle.', 'Easy', '/assets/images/grilled_chicken_salad.jpg', '2025-09-28 09:46:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_categories`
--

CREATE TABLE `recipe_categories` (
  `recipe_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_categories`
--

INSERT INTO `recipe_categories` (`recipe_id`, `category_id`, `created_at`) VALUES
(1, 2, '2025-09-27 22:51:27'),
(2, 3, '2025-09-27 22:51:27'),
(2, 4, '2025-09-27 22:51:27'),
(3, 2, '2025-09-27 22:51:27'),
(4, 2, '2025-09-27 22:51:27'),
(5, 1, '2025-09-27 22:51:27'),
(5, 4, '2025-09-27 22:51:27'),
(6, 3, '2025-09-27 22:51:27'),
(31, 3, '2025-09-27 22:51:27'),
(32, 2, '2025-09-27 22:51:27'),
(32, 4, '2025-09-27 22:51:27'),
(39, 3, '2025-09-27 22:52:16'),
(40, 2, '2025-09-27 22:52:16'),
(40, 4, '2025-09-27 22:52:16'),
(47, 3, '2025-09-27 23:03:42'),
(48, 2, '2025-09-27 23:03:42'),
(48, 4, '2025-09-27 23:03:42'),
(49, 1, '2025-09-27 23:03:42'),
(49, 4, '2025-09-27 23:03:42'),
(56, 3, '2025-09-28 08:18:10'),
(57, 2, '2025-09-28 08:18:10'),
(57, 4, '2025-09-28 08:18:10'),
(58, 1, '2025-09-28 08:18:10'),
(58, 4, '2025-09-28 08:18:10'),
(65, 3, '2025-09-28 08:18:49'),
(66, 2, '2025-09-28 08:18:49'),
(66, 4, '2025-09-28 08:18:49'),
(67, 1, '2025-09-28 08:18:49'),
(67, 4, '2025-09-28 08:18:49'),
(74, 3, '2025-09-28 08:33:49'),
(75, 2, '2025-09-28 08:33:49'),
(75, 4, '2025-09-28 08:33:49'),
(76, 1, '2025-09-28 08:33:49'),
(76, 4, '2025-09-28 08:33:49'),
(77, 2, '2025-09-28 08:33:49'),
(84, 3, '2025-09-28 08:37:57'),
(85, 2, '2025-09-28 08:37:57'),
(85, 4, '2025-09-28 08:37:57'),
(86, 1, '2025-09-28 08:37:57'),
(86, 4, '2025-09-28 08:37:57'),
(87, 2, '2025-09-28 08:37:57'),
(100, 3, '2025-09-28 09:46:08'),
(101, 2, '2025-09-28 09:46:08'),
(101, 4, '2025-09-28 09:46:08'),
(102, 1, '2025-09-28 09:46:08'),
(102, 4, '2025-09-28 09:46:08'),
(103, 2, '2025-09-28 09:46:08');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_dietary_attributes`
--

CREATE TABLE `recipe_dietary_attributes` (
  `recipe_id` int(11) NOT NULL,
  `dietary_attribute_id` int(11) NOT NULL,
  `confidence` enum('verified','likely','possible') DEFAULT 'verified',
  `notes` text DEFAULT NULL,
  `verified_by` int(11) DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_dietary_attributes`
--

INSERT INTO `recipe_dietary_attributes` (`recipe_id`, `dietary_attribute_id`, `confidence`, `notes`, `verified_by`, `verified_at`, `created_at`) VALUES
(2, 2, 'verified', NULL, NULL, NULL, '2025-09-27 22:51:27'),
(2, 9, 'verified', NULL, NULL, NULL, '2025-09-27 22:51:27'),
(2, 10, 'verified', NULL, NULL, NULL, '2025-09-27 22:51:27'),
(3, 1, 'verified', NULL, NULL, NULL, '2025-09-27 22:51:27'),
(4, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(5, 1, 'verified', NULL, NULL, NULL, '2025-09-27 22:51:27'),
(5, 7, 'verified', NULL, NULL, NULL, '2025-09-27 22:51:27'),
(6, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(8, 2, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(8, 9, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(8, 10, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(9, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(10, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(11, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(11, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(12, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(14, 2, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(14, 9, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(14, 10, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(15, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(16, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(17, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(17, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(18, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(20, 2, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(20, 9, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(20, 10, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(21, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(22, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(23, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(23, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(24, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(26, 2, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(26, 9, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(26, 10, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(27, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(28, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(29, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(29, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(30, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(31, 1, 'verified', NULL, NULL, NULL, '2025-09-27 23:03:42'),
(32, 1, 'verified', NULL, NULL, NULL, '2025-09-27 23:03:42'),
(32, 9, 'verified', NULL, NULL, NULL, '2025-09-27 23:03:42'),
(34, 2, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(34, 9, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(34, 10, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(35, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(36, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(37, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(37, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(38, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(39, 1, 'verified', NULL, NULL, NULL, '2025-09-27 23:03:42'),
(40, 1, 'verified', NULL, NULL, NULL, '2025-09-27 23:03:42'),
(40, 9, 'verified', NULL, NULL, NULL, '2025-09-27 23:03:42'),
(42, 2, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(42, 9, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(42, 10, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(43, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(44, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(45, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(45, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(46, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(47, 1, 'verified', NULL, NULL, NULL, '2025-09-27 23:03:42'),
(48, 1, 'verified', NULL, NULL, NULL, '2025-09-27 23:03:42'),
(48, 9, 'verified', NULL, NULL, NULL, '2025-09-27 23:03:42'),
(49, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(49, 8, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(49, 9, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(51, 2, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(51, 9, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(51, 10, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(52, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(53, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(54, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(54, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(55, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(56, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(57, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(57, 9, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:10'),
(58, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(58, 8, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(58, 9, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(60, 2, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:49'),
(60, 9, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:49'),
(60, 10, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:49'),
(61, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:49'),
(62, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(63, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:49'),
(63, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:49'),
(64, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(65, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:49'),
(66, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:49'),
(66, 9, 'verified', NULL, NULL, NULL, '2025-09-28 08:18:49'),
(67, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(67, 8, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(67, 9, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(69, 2, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(69, 9, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(69, 10, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(70, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(71, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(72, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(72, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(73, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(74, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(75, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(75, 9, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(76, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(76, 8, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(76, 9, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(77, 6, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(77, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(77, 8, 'verified', NULL, NULL, NULL, '2025-09-28 08:33:49'),
(79, 2, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:57'),
(79, 9, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:57'),
(79, 10, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:57'),
(80, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:57'),
(81, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(82, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:57'),
(82, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:57'),
(83, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:58'),
(84, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:57'),
(85, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:57'),
(85, 9, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:57'),
(86, 1, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:57'),
(86, 8, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:57'),
(86, 9, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:57'),
(87, 6, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:57'),
(87, 7, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:57'),
(87, 8, 'verified', NULL, NULL, NULL, '2025-09-28 08:37:57'),
(89, 2, 'verified', NULL, NULL, NULL, '2025-09-28 09:31:56'),
(89, 9, 'verified', NULL, NULL, NULL, '2025-09-28 09:31:56'),
(89, 10, 'verified', NULL, NULL, NULL, '2025-09-28 09:31:56'),
(90, 1, 'verified', NULL, NULL, NULL, '2025-09-28 09:31:56'),
(91, 7, 'verified', NULL, NULL, NULL, '2025-09-28 09:46:08'),
(92, 1, 'verified', NULL, NULL, NULL, '2025-09-28 09:31:56'),
(92, 7, 'verified', NULL, NULL, NULL, '2025-09-28 09:31:56'),
(93, 1, 'verified', NULL, NULL, NULL, '2025-09-28 09:46:08'),
(95, 2, 'verified', NULL, NULL, NULL, '2025-09-28 09:46:08'),
(95, 9, 'verified', NULL, NULL, NULL, '2025-09-28 09:46:08'),
(95, 10, 'verified', NULL, NULL, NULL, '2025-09-28 09:46:08'),
(96, 1, 'verified', NULL, NULL, NULL, '2025-09-28 09:46:08'),
(97, 7, 'verified', NULL, NULL, NULL, '2025-09-28 09:46:08'),
(98, 1, 'verified', NULL, NULL, NULL, '2025-09-28 09:46:08'),
(98, 7, 'verified', NULL, NULL, NULL, '2025-09-28 09:46:08'),
(99, 1, 'verified', NULL, NULL, NULL, '2025-09-28 09:46:08'),
(100, 1, 'verified', NULL, NULL, NULL, '2025-09-28 09:46:08'),
(101, 1, 'verified', NULL, NULL, NULL, '2025-09-28 09:46:08'),
(101, 9, 'verified', NULL, NULL, NULL, '2025-09-28 09:46:08'),
(102, 1, 'verified', NULL, NULL, NULL, '2025-09-28 09:46:08'),
(102, 8, 'verified', NULL, NULL, NULL, '2025-09-28 09:46:08'),
(102, 9, 'verified', NULL, NULL, NULL, '2025-09-28 09:46:08'),
(103, 6, 'verified', NULL, NULL, NULL, '2025-09-28 09:46:08'),
(103, 7, 'verified', NULL, NULL, NULL, '2025-09-28 09:46:08'),
(103, 8, 'verified', NULL, NULL, NULL, '2025-09-28 09:46:08');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` decimal(8,3) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `quantity_text` varchar(100) DEFAULT NULL,
  `preparation` varchar(150) DEFAULT NULL,
  `ingredient_group` varchar(100) DEFAULT 'Main',
  `is_optional` tinyint(1) DEFAULT 0,
  `display_order` int(11) DEFAULT 0,
  `notes` text DEFAULT NULL,
  `substitutions` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`recipe_id`, `ingredient_id`, `quantity`, `unit`, `quantity_text`, `preparation`, `ingredient_group`, `is_optional`, `display_order`, `notes`, `substitutions`, `created_at`) VALUES
(1, 1, NULL, NULL, '200g', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(1, 2, NULL, NULL, '300g', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(1, 3, NULL, NULL, '400ml', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(1, 4, NULL, NULL, '1 small, diced', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(1, 5, NULL, NULL, '2 cloves, minced', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(1, 6, NULL, NULL, '1 tbsp', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(1, 7, NULL, NULL, '1 tsp', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(1, 8, NULL, NULL, 'to taste', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(1, 9, NULL, NULL, 'to taste', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(2, 8, NULL, NULL, 'pinch', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(2, 10, NULL, NULL, '150g', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(2, 11, NULL, NULL, '250ml', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(2, 12, NULL, NULL, '1 tsp', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(2, 13, NULL, NULL, '1 tbsp', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(3, 3, NULL, NULL, '4 tbsp', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(3, 14, NULL, NULL, '1 medium', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(3, 15, NULL, NULL, '80g', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(3, 16, NULL, NULL, '1 small, sliced', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(3, 17, NULL, NULL, '4, sliced', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(4, 4, NULL, NULL, '1 large, sliced', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(4, 8, NULL, NULL, 'to taste', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(4, 18, NULL, NULL, '300g', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(4, 19, NULL, NULL, '400g', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(4, 20, NULL, NULL, '2 tsp', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(4, 21, NULL, NULL, '100g', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(5, 6, NULL, NULL, '2 tbsp', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(5, 8, NULL, NULL, 'to taste', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(5, 9, NULL, NULL, 'to taste', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(5, 22, NULL, NULL, '200g (dry)', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(5, 23, NULL, NULL, '200g, drained', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(5, 24, NULL, NULL, '1/2, diced', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(5, 25, NULL, NULL, '1, juiced', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(6, 10, NULL, NULL, '60g', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(6, 11, NULL, NULL, '250ml', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(6, 26, NULL, NULL, '6, halved', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(6, 27, NULL, NULL, '3', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(6, 28, NULL, NULL, '60g', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(6, 29, NULL, NULL, '20g, melted', NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 22:51:27'),
(31, 28, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(31, 146, 3.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(31, 147, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(31, 148, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(31, 149, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(31, 150, 200.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(31, 151, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(32, 6, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(32, 8, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(32, 9, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(32, 17, 300.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(32, 152, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(32, 153, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(32, 154, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(32, 155, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(32, 156, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(32, 157, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(39, 28, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(39, 146, 3.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(39, 147, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(39, 148, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(39, 149, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(39, 150, 200.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(39, 151, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(40, 6, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(40, 8, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(40, 9, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(40, 17, 300.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(40, 152, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(40, 153, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(40, 154, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(40, 155, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(40, 156, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(40, 157, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(47, 28, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(47, 146, 3.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(47, 147, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(47, 148, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(47, 149, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(47, 150, 200.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(47, 151, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(48, 6, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(48, 8, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(48, 9, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(48, 17, 300.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(48, 152, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(48, 153, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(48, 154, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(48, 155, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(48, 156, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(48, 157, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-27 23:03:42'),
(49, 6, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(49, 8, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(49, 9, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(49, 240, 500.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(49, 241, 500.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(49, 242, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(56, 28, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:10'),
(56, 146, 3.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:10'),
(56, 147, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:10'),
(56, 148, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:10'),
(56, 149, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:10'),
(56, 150, 200.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:10'),
(56, 151, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:10'),
(57, 6, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:10'),
(57, 8, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:10'),
(57, 9, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:10'),
(57, 17, 300.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:10'),
(57, 152, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:10'),
(57, 153, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:10'),
(57, 154, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:10'),
(57, 155, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:10'),
(57, 156, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:10'),
(57, 157, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:10'),
(58, 6, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(58, 8, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(58, 9, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(58, 240, 500.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(58, 241, 500.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(58, 242, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(65, 28, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:49'),
(65, 146, 3.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:49'),
(65, 147, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:49'),
(65, 148, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:49'),
(65, 149, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:49'),
(65, 150, 200.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:49'),
(65, 151, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:49'),
(66, 6, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:49'),
(66, 8, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:49'),
(66, 9, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:49'),
(66, 17, 300.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:49'),
(66, 152, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:49'),
(66, 153, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:49'),
(66, 154, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:49'),
(66, 155, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:49'),
(66, 156, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:49'),
(66, 157, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:18:49'),
(67, 6, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(67, 8, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(67, 9, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(67, 240, 500.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(67, 241, 500.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(67, 242, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(74, 28, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(74, 146, 3.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(74, 147, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(74, 148, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(74, 149, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(74, 150, 200.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(74, 151, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(75, 6, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(75, 8, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(75, 9, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(75, 17, 300.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(75, 152, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(75, 153, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(75, 154, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(75, 155, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(75, 156, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(75, 157, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(76, 6, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(76, 8, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(76, 9, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(76, 240, 500.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(76, 241, 500.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(76, 242, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(77, 6, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(77, 8, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(77, 9, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(77, 157, 8.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(77, 244, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(77, 245, 3.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(77, 246, 8.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(77, 247, 50.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(77, 248, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:33:49'),
(84, 28, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(84, 146, 3.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(84, 147, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(84, 148, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(84, 149, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(84, 150, 200.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(84, 151, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(85, 6, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(85, 8, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(85, 9, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(85, 17, 300.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(85, 152, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(85, 153, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(85, 154, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(85, 155, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(85, 156, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(85, 157, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(86, 6, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(86, 8, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(86, 9, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(86, 240, 500.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(86, 241, 500.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(86, 242, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:57'),
(87, 6, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:58'),
(87, 8, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:58'),
(87, 9, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:58'),
(87, 157, 8.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:58'),
(87, 244, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:58'),
(87, 245, 3.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:58'),
(87, 246, 8.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:58'),
(87, 247, 50.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:58'),
(87, 248, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 08:37:58'),
(100, 28, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(100, 146, 3.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(100, 147, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(100, 148, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(100, 149, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(100, 150, 200.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(100, 151, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(101, 6, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(101, 8, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(101, 9, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(101, 17, 300.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(101, 152, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(101, 153, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(101, 154, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(101, 155, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(101, 156, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(101, 157, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(102, 6, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(102, 8, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(102, 9, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(102, 240, 500.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(102, 241, 500.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(102, 242, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(103, 6, 1.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(103, 8, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(103, 9, 0.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(103, 157, 8.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(103, 244, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(103, 245, 3.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(103, 246, 8.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(103, 247, 50.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08'),
(103, 248, 2.000, NULL, NULL, NULL, 'Main', 0, 0, NULL, NULL, '2025-09-28 09:46:08');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_steps`
--

CREATE TABLE `recipe_steps` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `step_no` int(11) NOT NULL,
  `instruction` text NOT NULL,
  `minutes` int(11) NOT NULL DEFAULT 5,
  `step_group` int(11) DEFAULT 1,
  `is_parallel` tinyint(1) DEFAULT 0,
  `parallel_parent_step` int(11) DEFAULT NULL,
  `step_type` enum('prep','cook','combine','wait','serve') DEFAULT 'cook',
  `temperature` varchar(50) DEFAULT NULL,
  `equipment` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_steps`
--

INSERT INTO `recipe_steps` (`id`, `recipe_id`, `step_no`, `instruction`, `minutes`, `step_group`, `is_parallel`, `parallel_parent_step`, `step_type`, `temperature`, `equipment`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Sauté onion and garlic in olive oil until soft.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:06:14', NULL),
(2, 1, 2, 'Brown minced beef.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:06:14', NULL),
(3, 1, 3, 'Stir in tomato sauce, oregano; simmer.', 15, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:06:14', NULL),
(4, 1, 4, 'Cook spaghetti; combine with sauce and season.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:06:14', NULL),
(5, 2, 1, 'Whisk dry ingredients, then add plant milk and syrup.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:06:14', NULL),
(6, 2, 2, 'Rest batter briefly.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:06:14', NULL),
(7, 2, 3, 'Cook small ladles on a hot pan; flip when bubbles form.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:06:14', NULL),
(8, 3, 1, 'Spread tomato sauce on the base.', 2, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:06:14', NULL),
(9, 3, 2, 'Top with vegetables and mozzarella.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:06:14', NULL),
(10, 3, 3, 'Bake in hot oven until cheese melts.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:06:14', NULL),
(11, 4, 1, 'Rinse rice; soak briefly.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:06:14', NULL),
(12, 4, 2, 'Sauté onion; brown lamb with curry powder.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:06:14', NULL),
(13, 4, 3, 'Layer lamb and rice; add yogurt and water, steam until tender.', 25, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:06:14', NULL),
(14, 1, 1, 'Sauté onion and garlic in olive oil until soft.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:08:03', NULL),
(15, 1, 2, 'Brown minced beef.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:08:03', NULL),
(16, 1, 3, 'Stir in tomato sauce, oregano; simmer.', 15, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:08:03', NULL),
(17, 1, 4, 'Cook spaghetti; combine with sauce and season.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:08:03', NULL),
(18, 2, 1, 'Whisk dry ingredients, then add plant milk and syrup.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:08:03', NULL),
(19, 2, 2, 'Rest batter briefly.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:08:03', NULL),
(20, 2, 3, 'Cook small ladles on a hot pan; flip when bubbles form.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:08:03', NULL),
(21, 3, 1, 'Spread tomato sauce on the base.', 2, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:08:03', NULL),
(22, 3, 2, 'Top with vegetables and mozzarella.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:08:03', NULL),
(23, 3, 3, 'Bake in hot oven until cheese melts.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:08:03', NULL),
(24, 4, 1, 'Rinse rice; soak briefly.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:08:03', NULL),
(25, 4, 2, 'Sauté onion; brown lamb with curry powder.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:08:03', NULL),
(26, 4, 3, 'Layer lamb and rice; add yogurt and water, steam until tender.', 25, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:08:03', NULL),
(27, 1, 1, 'Sauté onion and garlic in olive oil until soft.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:22:31', NULL),
(28, 1, 2, 'Brown minced beef.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:22:31', NULL),
(29, 1, 3, 'Stir in tomato sauce, oregano; simmer.', 15, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:22:31', NULL),
(30, 1, 4, 'Cook spaghetti; combine with sauce and season.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:22:31', NULL),
(31, 2, 1, 'Whisk dry ingredients, then add plant milk and syrup.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:22:31', NULL),
(32, 2, 2, 'Rest batter briefly.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:22:31', NULL),
(33, 2, 3, 'Cook small ladles on a hot pan; flip when bubbles form.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:22:31', NULL),
(34, 3, 1, 'Spread tomato sauce on the base.', 2, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:22:31', NULL),
(35, 3, 2, 'Top with vegetables and mozzarella.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:22:31', NULL),
(36, 3, 3, 'Bake in hot oven until cheese melts.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:22:31', NULL),
(37, 4, 1, 'Rinse rice; soak briefly.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:22:31', NULL),
(38, 4, 2, 'Sauté onion; brown lamb with curry powder.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:22:31', NULL),
(39, 4, 3, 'Layer lamb and rice; add yogurt and water, steam until tender.', 25, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:22:31', NULL),
(40, 1, 1, 'Sauté onion and garlic in olive oil until soft.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:46:32', NULL),
(41, 1, 2, 'Brown minced beef.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:46:32', NULL),
(42, 1, 3, 'Stir in tomato sauce, oregano; simmer.', 15, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:46:32', NULL),
(43, 1, 4, 'Cook spaghetti; combine with sauce and season.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:46:32', NULL),
(44, 2, 1, 'Whisk dry ingredients, then add plant milk and syrup.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:46:32', NULL),
(45, 2, 2, 'Rest batter briefly.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:46:32', NULL),
(46, 2, 3, 'Cook small ladles on a hot pan; flip when bubbles form.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:46:32', NULL),
(47, 3, 1, 'Spread tomato sauce on the base.', 2, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:46:32', NULL),
(48, 3, 2, 'Top with vegetables and mozzarella.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:46:32', NULL),
(49, 3, 3, 'Bake in hot oven until cheese melts.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:46:32', NULL),
(50, 4, 1, 'Rinse rice; soak briefly.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:46:32', NULL),
(51, 4, 2, 'Sauté onion; brown lamb with curry powder.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:46:32', NULL),
(52, 4, 3, 'Layer lamb and rice; add yogurt and water, steam until tender.', 25, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:46:32', NULL),
(53, 1, 1, 'Sauté onion and garlic in olive oil until soft.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:51:27', NULL),
(54, 1, 2, 'Brown minced beef.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:51:27', NULL),
(55, 1, 3, 'Stir in tomato sauce, oregano; simmer.', 15, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:51:27', NULL),
(56, 1, 4, 'Cook spaghetti; combine with sauce and season.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:51:27', NULL),
(57, 2, 1, 'Whisk dry ingredients, then add plant milk and syrup.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:51:27', NULL),
(58, 2, 2, 'Rest batter briefly.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:51:27', NULL),
(59, 2, 3, 'Cook small ladles on a hot pan; flip when bubbles form.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:51:27', NULL),
(60, 3, 1, 'Spread tomato sauce on the base.', 2, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:51:27', NULL),
(61, 3, 2, 'Top with vegetables and mozzarella.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:51:27', NULL),
(62, 3, 3, 'Bake in hot oven until cheese melts.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:51:27', NULL),
(63, 4, 1, 'Rinse rice; soak briefly.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:51:27', NULL),
(64, 4, 2, 'Sauté onion; brown lamb with curry powder.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:51:27', NULL),
(65, 4, 3, 'Layer lamb and rice; add yogurt and water, steam until tender.', 25, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:51:27', NULL),
(66, 5, 1, 'Hydrate couscous with hot water; fluff.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:51:27', NULL),
(67, 5, 2, 'Toss with chickpeas, cucumber, lemon, oil, and seasoning.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:51:27', NULL),
(68, 6, 1, 'Arrange plums in a buttered dish.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:51:27', NULL),
(69, 6, 2, 'Blend eggs, sugar, flour, milk, and butter.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:51:27', NULL),
(70, 6, 3, 'Pour over plums and bake until set.', 30, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:51:27', NULL),
(71, 1, 1, 'Sauté onion and garlic in olive oil until soft.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:52:16', NULL),
(72, 1, 2, 'Brown minced beef.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:52:16', NULL),
(73, 1, 3, 'Stir in tomato sauce, oregano; simmer.', 15, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:52:16', NULL),
(74, 1, 4, 'Cook spaghetti; combine with sauce and season.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:52:16', NULL),
(75, 2, 1, 'Whisk dry ingredients, then add plant milk and syrup.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:52:16', NULL),
(76, 2, 2, 'Rest batter briefly.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:52:16', NULL),
(77, 2, 3, 'Cook small ladles on a hot pan; flip when bubbles form.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:52:16', NULL),
(78, 3, 1, 'Spread tomato sauce on the base.', 2, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:52:16', NULL),
(79, 3, 2, 'Top with vegetables and mozzarella.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:52:16', NULL),
(80, 3, 3, 'Bake in hot oven until cheese melts.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:52:16', NULL),
(81, 4, 1, 'Rinse rice; soak briefly.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:52:16', NULL),
(82, 4, 2, 'Sauté onion; brown lamb with curry powder.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:52:16', NULL),
(83, 4, 3, 'Layer lamb and rice; add yogurt and water, steam until tender.', 25, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:52:16', NULL),
(84, 5, 1, 'Hydrate couscous with hot water; fluff.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:52:16', NULL),
(85, 5, 2, 'Toss with chickpeas, cucumber, lemon, oil, and seasoning.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:52:16', NULL),
(86, 6, 1, 'Arrange plums in a buttered dish.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:52:16', NULL),
(87, 6, 2, 'Blend eggs, sugar, flour, milk, and butter.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:52:16', NULL),
(88, 6, 3, 'Pour over plums and bake until set.', 30, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 22:52:16', NULL),
(89, 1, 1, 'Sauté onion and garlic in olive oil until soft.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(90, 1, 2, 'Brown minced beef.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(91, 1, 3, 'Stir in tomato sauce, oregano; simmer.', 15, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(92, 1, 4, 'Cook spaghetti; combine with sauce and season.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(93, 2, 1, 'Whisk dry ingredients, then add plant milk and syrup.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(94, 2, 2, 'Rest batter briefly.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(95, 2, 3, 'Cook small ladles on a hot pan; flip when bubbles form.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(96, 3, 1, 'Spread tomato sauce on the base.', 2, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(97, 3, 2, 'Top with vegetables and mozzarella.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(98, 3, 3, 'Bake in hot oven until cheese melts.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(99, 4, 1, 'Rinse rice; soak briefly.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(100, 4, 2, 'Sauté onion; brown lamb with curry powder.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(101, 4, 3, 'Layer lamb and rice; add yogurt and water, steam until tender.', 25, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(102, 5, 1, 'Hydrate couscous with hot water; fluff.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(103, 5, 2, 'Toss with chickpeas, cucumber, lemon, oil, and seasoning.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(104, 6, 1, 'Arrange plums in a buttered dish.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(105, 6, 2, 'Blend eggs, sugar, flour, milk, and butter.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(106, 6, 3, 'Pour over plums and bake until set.', 30, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(107, 31, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(108, 39, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(109, 47, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(110, 31, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(111, 39, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(112, 47, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(113, 31, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(114, 39, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(115, 47, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(116, 32, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(117, 40, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(118, 48, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(119, 32, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(120, 40, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(121, 48, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(122, 32, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(123, 40, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(124, 48, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-27 23:03:42', NULL),
(125, 1, 1, 'Sauté onion and garlic in olive oil until soft.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(126, 1, 2, 'Brown minced beef.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(127, 1, 3, 'Stir in tomato sauce, oregano; simmer.', 15, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(128, 1, 4, 'Cook spaghetti; combine with sauce and season.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(129, 2, 1, 'Whisk dry ingredients, then add plant milk and syrup.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(130, 2, 2, 'Rest batter briefly.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(131, 2, 3, 'Cook small ladles on a hot pan; flip when bubbles form.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(132, 3, 1, 'Spread tomato sauce on the base.', 2, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(133, 3, 2, 'Top with vegetables and mozzarella.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(134, 3, 3, 'Bake in hot oven until cheese melts.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(135, 4, 1, 'Rinse rice; soak briefly.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(136, 4, 2, 'Sauté onion; brown lamb with curry powder.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(137, 4, 3, 'Layer lamb and rice; add yogurt and water, steam until tender.', 25, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(138, 5, 1, 'Hydrate couscous with hot water; fluff.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(139, 5, 2, 'Toss with chickpeas, cucumber, lemon, oil, and seasoning.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(140, 6, 1, 'Arrange plums in a buttered dish.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(141, 6, 2, 'Blend eggs, sugar, flour, milk, and butter.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(142, 6, 3, 'Pour over plums and bake until set.', 30, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(143, 31, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(144, 39, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(145, 47, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(146, 56, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(150, 31, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(151, 39, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(152, 47, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(153, 56, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(157, 31, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(158, 39, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(159, 47, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(160, 56, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(164, 32, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(165, 40, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(166, 48, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(167, 57, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(171, 32, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(172, 40, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(173, 48, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(174, 57, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(178, 32, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(179, 40, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(180, 48, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(181, 57, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:10', NULL),
(185, 1, 1, 'Sauté onion and garlic in olive oil until soft.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(186, 1, 2, 'Brown minced beef.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(187, 1, 3, 'Stir in tomato sauce, oregano; simmer.', 15, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(188, 1, 4, 'Cook spaghetti; combine with sauce and season.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(189, 2, 1, 'Whisk dry ingredients, then add plant milk and syrup.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(190, 2, 2, 'Rest batter briefly.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(191, 2, 3, 'Cook small ladles on a hot pan; flip when bubbles form.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(192, 3, 1, 'Spread tomato sauce on the base.', 2, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(193, 3, 2, 'Top with vegetables and mozzarella.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(194, 3, 3, 'Bake in hot oven until cheese melts.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(195, 4, 1, 'Rinse rice; soak briefly.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(196, 4, 2, 'Sauté onion; brown lamb with curry powder.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(197, 4, 3, 'Layer lamb and rice; add yogurt and water, steam until tender.', 25, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(198, 5, 1, 'Hydrate couscous with hot water; fluff.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(199, 5, 2, 'Toss with chickpeas, cucumber, lemon, oil, and seasoning.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(200, 6, 1, 'Arrange plums in a buttered dish.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(201, 6, 2, 'Blend eggs, sugar, flour, milk, and butter.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(202, 6, 3, 'Pour over plums and bake until set.', 30, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(203, 31, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(204, 39, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(205, 47, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(206, 56, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(207, 65, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(210, 31, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(211, 39, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(212, 47, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(213, 56, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(214, 65, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(217, 31, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(218, 39, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(219, 47, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(220, 56, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(221, 65, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(224, 32, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(225, 40, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(226, 48, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(227, 57, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(228, 66, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(231, 32, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(232, 40, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(233, 48, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(234, 57, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(235, 66, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(238, 32, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(239, 40, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(240, 48, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(241, 57, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(242, 66, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:18:49', NULL),
(245, 1, 1, 'Sauté onion and garlic in olive oil until soft.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(246, 1, 2, 'Brown minced beef.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(247, 1, 3, 'Stir in tomato sauce, oregano; simmer.', 15, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(248, 1, 4, 'Cook spaghetti; combine with sauce and season.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(249, 2, 1, 'Whisk dry ingredients, then add plant milk and syrup.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(250, 2, 2, 'Rest batter briefly.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(251, 2, 3, 'Cook small ladles on a hot pan; flip when bubbles form.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(252, 3, 1, 'Spread tomato sauce on the base.', 2, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(253, 3, 2, 'Top with vegetables and mozzarella.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(254, 3, 3, 'Bake in hot oven until cheese melts.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(255, 4, 1, 'Rinse rice; soak briefly.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(256, 4, 2, 'Sauté onion; brown lamb with curry powder.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(257, 4, 3, 'Layer lamb and rice; add yogurt and water, steam until tender.', 25, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(258, 5, 1, 'Hydrate couscous with hot water; fluff.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(259, 5, 2, 'Toss with chickpeas, cucumber, lemon, oil, and seasoning.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(260, 6, 1, 'Arrange plums in a buttered dish.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(261, 6, 2, 'Blend eggs, sugar, flour, milk, and butter.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(262, 6, 3, 'Pour over plums and bake until set.', 30, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(263, 31, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(264, 39, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(265, 47, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(266, 56, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(267, 65, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(268, 74, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(270, 31, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(271, 39, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(272, 47, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(273, 56, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(274, 65, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(275, 74, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(277, 31, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(278, 39, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(279, 47, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(280, 56, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(281, 65, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(282, 74, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(284, 32, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(285, 40, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(286, 48, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(287, 57, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(288, 66, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(289, 75, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(291, 32, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(292, 40, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(293, 48, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(294, 57, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(295, 66, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(296, 75, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(298, 32, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(299, 40, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(300, 48, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(301, 57, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(302, 66, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(303, 75, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(305, 49, 1, 'Sauté tomatoes in olive oil.', 6, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(306, 58, 1, 'Sauté tomatoes in olive oil.', 6, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(307, 67, 1, 'Sauté tomatoes in olive oil.', 6, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(308, 76, 1, 'Sauté tomatoes in olive oil.', 6, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(312, 49, 2, 'Add stock and simmer briefly.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(313, 58, 2, 'Add stock and simmer briefly.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(314, 67, 2, 'Add stock and simmer briefly.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(315, 76, 2, 'Add stock and simmer briefly.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(319, 49, 3, 'Blend smooth, season and finish with basil.', 4, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(320, 58, 3, 'Blend smooth, season and finish with basil.', 4, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(321, 67, 3, 'Blend smooth, season and finish with basil.', 4, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(322, 76, 3, 'Blend smooth, season and finish with basil.', 4, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(326, 77, 1, 'Grill chicken until cooked through; rest.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(327, 77, 2, 'Toss leaves with tomatoes, olives, feta, oil and balsamic.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(328, 77, 3, 'Slice chicken and serve on top; season to taste.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:33:49', NULL),
(329, 1, 1, 'Sauté onion and garlic in olive oil until soft.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(330, 1, 2, 'Brown minced beef.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(331, 1, 3, 'Stir in tomato sauce, oregano; simmer.', 15, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(332, 1, 4, 'Cook spaghetti; combine with sauce and season.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(333, 2, 1, 'Whisk dry ingredients, then add plant milk and syrup.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(334, 2, 2, 'Rest batter briefly.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(335, 2, 3, 'Cook small ladles on a hot pan; flip when bubbles form.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(336, 3, 1, 'Spread tomato sauce on the base.', 2, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(337, 3, 2, 'Top with vegetables and mozzarella.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(338, 3, 3, 'Bake in hot oven until cheese melts.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(339, 4, 1, 'Rinse rice; soak briefly.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(340, 4, 2, 'Sauté onion; brown lamb with curry powder.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(341, 4, 3, 'Layer lamb and rice; add yogurt and water, steam until tender.', 25, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(342, 5, 1, 'Hydrate couscous with hot water; fluff.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(343, 5, 2, 'Toss with chickpeas, cucumber, lemon, oil, and seasoning.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(344, 6, 1, 'Arrange plums in a buttered dish.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(345, 6, 2, 'Blend eggs, sugar, flour, milk, and butter.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(346, 6, 3, 'Pour over plums and bake until set.', 30, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(347, 31, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(348, 39, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(349, 47, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(350, 56, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(351, 65, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(352, 74, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(353, 84, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(354, 31, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(355, 39, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(356, 47, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(357, 56, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(358, 65, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(359, 74, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(360, 84, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(361, 31, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(362, 39, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(363, 47, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(364, 56, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(365, 65, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(366, 74, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(367, 84, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(368, 32, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(369, 40, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(370, 48, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(371, 57, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(372, 66, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(373, 75, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(374, 85, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(375, 32, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(376, 40, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(377, 48, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(378, 57, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(379, 66, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(380, 75, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(381, 85, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(382, 32, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(383, 40, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(384, 48, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(385, 57, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(386, 66, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(387, 75, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(388, 85, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(389, 49, 1, 'Sauté tomatoes in olive oil.', 6, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(390, 58, 1, 'Sauté tomatoes in olive oil.', 6, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(391, 67, 1, 'Sauté tomatoes in olive oil.', 6, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(392, 76, 1, 'Sauté tomatoes in olive oil.', 6, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(393, 86, 1, 'Sauté tomatoes in olive oil.', 6, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(396, 49, 2, 'Add stock and simmer briefly.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(397, 58, 2, 'Add stock and simmer briefly.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(398, 67, 2, 'Add stock and simmer briefly.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(399, 76, 2, 'Add stock and simmer briefly.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(400, 86, 2, 'Add stock and simmer briefly.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(403, 49, 3, 'Blend smooth, season and finish with basil.', 4, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(404, 58, 3, 'Blend smooth, season and finish with basil.', 4, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(405, 67, 3, 'Blend smooth, season and finish with basil.', 4, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(406, 76, 3, 'Blend smooth, season and finish with basil.', 4, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(407, 86, 3, 'Blend smooth, season and finish with basil.', 4, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:57', NULL),
(410, 77, 1, 'Grill chicken until cooked through; rest.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:58', NULL),
(411, 87, 1, 'Grill chicken until cooked through; rest.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:58', NULL),
(413, 77, 2, 'Toss leaves with tomatoes, olives, feta, oil and balsamic.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:58', NULL),
(414, 87, 2, 'Toss leaves with tomatoes, olives, feta, oil and balsamic.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:58', NULL),
(416, 77, 3, 'Slice chicken and serve on top; season to taste.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:58', NULL),
(417, 87, 3, 'Slice chicken and serve on top; season to taste.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 08:37:58', NULL),
(419, 1, 1, 'Sauté onion and garlic in olive oil until soft.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:02:12', NULL),
(420, 1, 2, 'Brown minced beef.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:02:12', NULL),
(421, 1, 3, 'Stir in tomato sauce, oregano; simmer.', 15, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:02:12', NULL),
(422, 1, 4, 'Cook spaghetti; combine with sauce and season.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:02:12', NULL),
(423, 2, 1, 'Whisk dry ingredients, then add plant milk and syrup.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:02:12', NULL),
(424, 2, 2, 'Rest batter briefly.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:02:12', NULL),
(425, 2, 3, 'Cook small ladles on a hot pan; flip when bubbles form.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:02:12', NULL),
(426, 3, 1, 'Spread tomato sauce on the base.', 2, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:02:12', NULL),
(427, 3, 2, 'Top with vegetables and mozzarella.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:02:12', NULL),
(428, 3, 3, 'Bake in hot oven until cheese melts.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:02:12', NULL),
(429, 4, 1, 'Rinse rice; soak briefly.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:02:12', NULL),
(430, 4, 2, 'Sauté onion; brown lamb with curry powder.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:02:12', NULL),
(431, 4, 3, 'Layer lamb and rice; add yogurt and water, steam until tender.', 25, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:02:12', NULL);
INSERT INTO `recipe_steps` (`id`, `recipe_id`, `step_no`, `instruction`, `minutes`, `step_group`, `is_parallel`, `parallel_parent_step`, `step_type`, `temperature`, `equipment`, `notes`, `created_at`, `updated_at`) VALUES
(432, 1, 1, 'Sauté onion and garlic in olive oil until soft.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:22:59', NULL),
(433, 1, 2, 'Brown minced beef.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:22:59', NULL),
(434, 1, 3, 'Stir in tomato sauce, oregano; simmer.', 15, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:22:59', NULL),
(435, 1, 4, 'Cook spaghetti; combine with sauce and season.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:22:59', NULL),
(436, 1, 1, 'Sauté onion and garlic in olive oil until soft.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:25:17', NULL),
(437, 1, 2, 'Brown minced beef.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:25:17', NULL),
(438, 1, 3, 'Stir in tomato sauce, oregano; simmer.', 15, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:25:17', NULL),
(439, 1, 4, 'Cook spaghetti; combine with sauce and season.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:25:17', NULL),
(440, 2, 1, 'Whisk dry ingredients, then add plant milk and syrup.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:25:17', NULL),
(441, 2, 2, 'Rest batter briefly.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:25:17', NULL),
(442, 2, 3, 'Cook small ladles on a hot pan; flip when bubbles form.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:25:17', NULL),
(443, 3, 1, 'Spread tomato sauce on the base.', 2, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:25:17', NULL),
(444, 3, 2, 'Top with vegetables and mozzarella.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:25:17', NULL),
(445, 3, 3, 'Bake in hot oven until cheese melts.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:25:17', NULL),
(446, 4, 1, 'Rinse rice; soak briefly.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:25:17', NULL),
(447, 4, 2, 'Sauté onion; brown lamb with curry powder.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:25:17', NULL),
(448, 4, 3, 'Layer lamb and rice; add yogurt and water, steam until tender.', 25, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:25:17', NULL),
(449, 1, 1, 'Sauté onion and garlic in olive oil until soft.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:31:56', NULL),
(450, 1, 2, 'Brown minced beef.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:31:56', NULL),
(451, 1, 3, 'Stir in tomato sauce, oregano; simmer.', 15, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:31:56', NULL),
(452, 1, 4, 'Cook spaghetti; combine with sauce and season.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:31:56', NULL),
(453, 2, 1, 'Whisk dry ingredients, then add plant milk and syrup.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:31:56', NULL),
(454, 2, 2, 'Rest batter briefly.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:31:56', NULL),
(455, 2, 3, 'Cook small ladles on a hot pan; flip when bubbles form.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:31:56', NULL),
(456, 3, 1, 'Spread tomato sauce on the base.', 2, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:31:56', NULL),
(457, 3, 2, 'Top with vegetables and mozzarella.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:31:56', NULL),
(458, 3, 3, 'Bake in hot oven until cheese melts.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:31:56', NULL),
(459, 1, 1, 'Sauté onion and garlic in olive oil until soft.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:34:42', NULL),
(460, 1, 2, 'Brown minced beef.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:34:42', NULL),
(461, 1, 3, 'Stir in tomato sauce, oregano; simmer.', 15, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:34:42', NULL),
(462, 1, 4, 'Cook spaghetti; combine with sauce and season.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:34:42', NULL),
(463, 2, 1, 'Whisk dry ingredients, then add plant milk and syrup.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:34:42', NULL),
(464, 2, 2, 'Rest batter briefly.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:34:42', NULL),
(465, 2, 3, 'Cook small ladles on a hot pan; flip when bubbles form.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:34:42', NULL),
(466, 3, 1, 'Spread tomato sauce on the base.', 2, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:34:42', NULL),
(467, 3, 2, 'Top with vegetables and mozzarella.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:34:42', NULL),
(468, 3, 3, 'Bake in hot oven until cheese melts.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:34:42', NULL),
(469, 1, 1, 'Sauté onion and garlic in olive oil until soft.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:43:10', NULL),
(470, 1, 2, 'Brown minced beef.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:43:10', NULL),
(471, 1, 3, 'Stir in tomato sauce, oregano; simmer.', 15, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:43:10', NULL),
(472, 1, 4, 'Cook spaghetti; combine with sauce and season.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:43:10', NULL),
(473, 1, 1, 'Sauté onion and garlic in olive oil until soft.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(474, 1, 2, 'Brown minced beef.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(475, 1, 3, 'Stir in tomato sauce, oregano; simmer.', 15, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(476, 1, 4, 'Cook spaghetti; combine with sauce and season.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(477, 2, 1, 'Whisk dry ingredients, then add plant milk and syrup.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(478, 2, 2, 'Rest batter briefly.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(479, 2, 3, 'Cook small ladles on a hot pan; flip when bubbles form.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(480, 3, 1, 'Spread tomato sauce on the base.', 2, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(481, 3, 2, 'Top with vegetables and mozzarella.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(482, 3, 3, 'Bake in hot oven until cheese melts.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(483, 4, 1, 'Rinse rice; soak briefly.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(484, 4, 2, 'Sauté onion; brown lamb with curry powder.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(485, 4, 3, 'Layer lamb and rice; add yogurt and water, steam until tender.', 25, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(486, 5, 1, 'Hydrate couscous with hot water; fluff.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(487, 5, 2, 'Toss with chickpeas, cucumber, lemon, oil, and seasoning.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(488, 6, 1, 'Arrange plums in a buttered dish.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(489, 6, 2, 'Blend eggs, sugar, flour, milk, and butter.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(490, 6, 3, 'Pour over plums and bake until set.', 30, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(491, 31, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(492, 39, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(493, 47, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(494, 56, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(495, 65, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(496, 74, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(497, 84, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(498, 100, 1, 'Whisk mango puree with coconut cream, sugar, vanilla, lime, and cornflour.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(506, 31, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(507, 39, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(508, 47, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(509, 56, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(510, 65, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(511, 74, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(512, 84, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(513, 100, 2, 'Cook mixture over medium heat until thickened, stirring.', 10, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(521, 31, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(522, 39, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(523, 47, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(524, 56, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(525, 65, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(526, 74, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(527, 84, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(528, 100, 3, 'Pour into baked crust and chill until set.', 60, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(536, 32, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(537, 40, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(538, 48, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(539, 57, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(540, 66, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(541, 75, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(542, 85, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(543, 101, 1, 'Toss mushrooms with oil, paprika, cumin, salt and pepper.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(551, 32, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(552, 40, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(553, 48, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(554, 57, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(555, 66, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(556, 75, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(557, 85, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(558, 101, 2, 'Sear in a hot pan until browned and tender.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(566, 32, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(567, 40, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(568, 48, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(569, 57, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(570, 66, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(571, 75, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(572, 85, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(573, 101, 3, 'Warm flatbreads; fill with mushrooms, lettuce, tomato, and tahini.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(581, 49, 1, 'Sauté tomatoes in olive oil.', 6, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(582, 58, 1, 'Sauté tomatoes in olive oil.', 6, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(583, 67, 1, 'Sauté tomatoes in olive oil.', 6, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(584, 76, 1, 'Sauté tomatoes in olive oil.', 6, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(585, 86, 1, 'Sauté tomatoes in olive oil.', 6, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(586, 102, 1, 'Sauté tomatoes in olive oil.', 6, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(588, 49, 2, 'Add stock and simmer briefly.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(589, 58, 2, 'Add stock and simmer briefly.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(590, 67, 2, 'Add stock and simmer briefly.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(591, 76, 2, 'Add stock and simmer briefly.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(592, 86, 2, 'Add stock and simmer briefly.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(593, 102, 2, 'Add stock and simmer briefly.', 8, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(595, 49, 3, 'Blend smooth, season and finish with basil.', 4, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(596, 58, 3, 'Blend smooth, season and finish with basil.', 4, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(597, 67, 3, 'Blend smooth, season and finish with basil.', 4, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(598, 76, 3, 'Blend smooth, season and finish with basil.', 4, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(599, 86, 3, 'Blend smooth, season and finish with basil.', 4, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(600, 102, 3, 'Blend smooth, season and finish with basil.', 4, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(602, 77, 1, 'Grill chicken until cooked through; rest.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(603, 87, 1, 'Grill chicken until cooked through; rest.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(604, 103, 1, 'Grill chicken until cooked through; rest.', 12, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(605, 77, 2, 'Toss leaves with tomatoes, olives, feta, oil and balsamic.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(606, 87, 2, 'Toss leaves with tomatoes, olives, feta, oil and balsamic.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(607, 103, 2, 'Toss leaves with tomatoes, olives, feta, oil and balsamic.', 5, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(608, 77, 3, 'Slice chicken and serve on top; season to taste.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(609, 87, 3, 'Slice chicken and serve on top; season to taste.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL),
(610, 103, 3, 'Slice chicken and serve on top; season to taste.', 3, 1, 0, NULL, 'cook', NULL, NULL, NULL, '2025-09-28 09:46:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_tags`
--

CREATE TABLE `recipe_tags` (
  `recipe_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_tags`
--

INSERT INTO `recipe_tags` (`recipe_id`, `tag_id`, `created_at`) VALUES
(1, 2, '2025-09-28 08:33:49'),
(1, 3, '2025-09-28 08:33:49'),
(1, 6, '2025-09-28 08:33:49'),
(2, 1, '2025-09-28 08:33:49'),
(2, 2, '2025-09-28 08:33:49'),
(3, 2, '2025-09-28 08:37:58'),
(3, 10, '2025-09-28 08:37:58'),
(4, 4, '2025-09-28 08:37:58'),
(4, 5, '2025-09-28 08:37:58'),
(5, 1, '2025-09-28 08:37:58'),
(5, 3, '2025-09-28 08:37:58'),
(5, 8, '2025-09-28 08:37:58'),
(6, 2, '2025-09-28 08:37:58'),
(6, 6, '2025-09-28 08:37:58'),
(7, 2, '2025-09-28 08:33:49'),
(7, 3, '2025-09-28 08:33:49'),
(7, 6, '2025-09-28 08:33:49'),
(8, 1, '2025-09-28 08:33:49'),
(8, 2, '2025-09-28 08:33:49'),
(9, 2, '2025-09-28 08:37:58'),
(9, 10, '2025-09-28 08:37:58'),
(10, 4, '2025-09-28 08:37:58'),
(10, 5, '2025-09-28 08:37:58'),
(11, 1, '2025-09-28 08:37:58'),
(11, 3, '2025-09-28 08:37:58'),
(11, 8, '2025-09-28 08:37:58'),
(12, 2, '2025-09-28 08:37:58'),
(12, 6, '2025-09-28 08:37:58'),
(13, 2, '2025-09-28 08:33:49'),
(13, 3, '2025-09-28 08:33:49'),
(13, 6, '2025-09-28 08:33:49'),
(14, 1, '2025-09-28 08:33:49'),
(14, 2, '2025-09-28 08:33:49'),
(15, 2, '2025-09-28 08:37:58'),
(15, 10, '2025-09-28 08:37:58'),
(16, 4, '2025-09-28 08:37:58'),
(16, 5, '2025-09-28 08:37:58'),
(17, 1, '2025-09-28 08:37:58'),
(17, 3, '2025-09-28 08:37:58'),
(17, 8, '2025-09-28 08:37:58'),
(18, 2, '2025-09-28 08:37:58'),
(18, 6, '2025-09-28 08:37:58'),
(19, 2, '2025-09-28 08:33:49'),
(19, 3, '2025-09-28 08:33:49'),
(19, 6, '2025-09-28 08:33:49'),
(20, 1, '2025-09-28 08:33:49'),
(20, 2, '2025-09-28 08:33:49'),
(21, 2, '2025-09-28 08:37:58'),
(21, 10, '2025-09-28 08:37:58'),
(22, 4, '2025-09-28 08:37:58'),
(22, 5, '2025-09-28 08:37:58'),
(23, 1, '2025-09-28 08:37:58'),
(23, 3, '2025-09-28 08:37:58'),
(23, 8, '2025-09-28 08:37:58'),
(24, 2, '2025-09-28 08:37:58'),
(24, 6, '2025-09-28 08:37:58'),
(25, 2, '2025-09-28 08:33:49'),
(25, 3, '2025-09-28 08:33:49'),
(25, 6, '2025-09-28 08:33:49'),
(26, 1, '2025-09-28 08:33:49'),
(26, 2, '2025-09-28 08:33:49'),
(27, 2, '2025-09-28 08:37:58'),
(27, 10, '2025-09-28 08:37:58'),
(28, 4, '2025-09-28 08:37:58'),
(28, 5, '2025-09-28 08:37:58'),
(29, 1, '2025-09-28 08:37:58'),
(29, 3, '2025-09-28 08:37:58'),
(29, 8, '2025-09-28 08:37:58'),
(30, 2, '2025-09-28 08:37:58'),
(30, 6, '2025-09-28 08:37:58'),
(31, 2, '2025-09-28 08:37:58'),
(31, 7, '2025-09-28 08:37:58'),
(32, 1, '2025-09-28 08:37:58'),
(32, 6, '2025-09-28 08:37:58'),
(33, 2, '2025-09-28 08:33:49'),
(33, 3, '2025-09-28 08:33:49'),
(33, 6, '2025-09-28 08:33:49'),
(34, 1, '2025-09-28 08:33:49'),
(34, 2, '2025-09-28 08:33:49'),
(35, 2, '2025-09-28 08:37:58'),
(35, 10, '2025-09-28 08:37:58'),
(36, 4, '2025-09-28 08:37:58'),
(36, 5, '2025-09-28 08:37:58'),
(37, 1, '2025-09-28 08:37:58'),
(37, 3, '2025-09-28 08:37:58'),
(37, 8, '2025-09-28 08:37:58'),
(38, 2, '2025-09-28 08:37:58'),
(38, 6, '2025-09-28 08:37:58'),
(39, 2, '2025-09-28 08:37:58'),
(39, 7, '2025-09-28 08:37:58'),
(40, 1, '2025-09-28 08:37:58'),
(40, 6, '2025-09-28 08:37:58'),
(41, 2, '2025-09-28 08:33:49'),
(41, 3, '2025-09-28 08:33:49'),
(41, 6, '2025-09-28 08:33:49'),
(42, 1, '2025-09-28 08:33:49'),
(42, 2, '2025-09-28 08:33:49'),
(43, 2, '2025-09-28 08:37:58'),
(43, 10, '2025-09-28 08:37:58'),
(44, 4, '2025-09-28 08:37:58'),
(44, 5, '2025-09-28 08:37:58'),
(45, 1, '2025-09-28 08:37:58'),
(45, 3, '2025-09-28 08:37:58'),
(45, 8, '2025-09-28 08:37:58'),
(46, 2, '2025-09-28 08:37:58'),
(46, 6, '2025-09-28 08:37:58'),
(47, 2, '2025-09-28 08:37:58'),
(47, 7, '2025-09-28 08:37:58'),
(48, 1, '2025-09-28 08:37:58'),
(48, 6, '2025-09-28 08:37:58'),
(49, 1, '2025-09-28 08:37:58'),
(49, 3, '2025-09-28 08:37:58'),
(49, 5, '2025-09-28 08:37:58'),
(49, 6, '2025-09-28 08:37:58'),
(50, 2, '2025-09-28 08:33:49'),
(50, 3, '2025-09-28 08:33:49'),
(50, 6, '2025-09-28 08:33:49'),
(51, 1, '2025-09-28 08:33:49'),
(51, 2, '2025-09-28 08:33:49'),
(52, 2, '2025-09-28 08:37:58'),
(52, 10, '2025-09-28 08:37:58'),
(53, 4, '2025-09-28 08:37:58'),
(53, 5, '2025-09-28 08:37:58'),
(54, 1, '2025-09-28 08:37:58'),
(54, 3, '2025-09-28 08:37:58'),
(54, 8, '2025-09-28 08:37:58'),
(55, 2, '2025-09-28 08:37:58'),
(55, 6, '2025-09-28 08:37:58'),
(56, 2, '2025-09-28 08:37:58'),
(56, 7, '2025-09-28 08:37:58'),
(57, 1, '2025-09-28 08:37:58'),
(57, 6, '2025-09-28 08:37:58'),
(58, 1, '2025-09-28 08:37:58'),
(58, 3, '2025-09-28 08:37:58'),
(58, 5, '2025-09-28 08:37:58'),
(58, 6, '2025-09-28 08:37:58'),
(59, 2, '2025-09-28 08:33:49'),
(59, 3, '2025-09-28 08:33:49'),
(59, 6, '2025-09-28 08:33:49'),
(60, 1, '2025-09-28 08:33:49'),
(60, 2, '2025-09-28 08:33:49'),
(61, 2, '2025-09-28 08:37:58'),
(61, 10, '2025-09-28 08:37:58'),
(62, 4, '2025-09-28 08:37:58'),
(62, 5, '2025-09-28 08:37:58'),
(63, 1, '2025-09-28 08:37:58'),
(63, 3, '2025-09-28 08:37:58'),
(63, 8, '2025-09-28 08:37:58'),
(64, 2, '2025-09-28 08:37:58'),
(64, 6, '2025-09-28 08:37:58'),
(65, 2, '2025-09-28 08:37:58'),
(65, 7, '2025-09-28 08:37:58'),
(66, 1, '2025-09-28 08:37:58'),
(66, 6, '2025-09-28 08:37:58'),
(67, 1, '2025-09-28 08:37:58'),
(67, 3, '2025-09-28 08:37:58'),
(67, 5, '2025-09-28 08:37:58'),
(67, 6, '2025-09-28 08:37:58'),
(68, 2, '2025-09-28 08:33:49'),
(68, 3, '2025-09-28 08:33:49'),
(68, 6, '2025-09-28 08:33:49'),
(69, 1, '2025-09-28 08:33:49'),
(69, 2, '2025-09-28 08:33:49'),
(70, 2, '2025-09-28 08:37:58'),
(70, 10, '2025-09-28 08:37:58'),
(71, 4, '2025-09-28 08:37:58'),
(71, 5, '2025-09-28 08:37:58'),
(72, 1, '2025-09-28 08:37:58'),
(72, 3, '2025-09-28 08:37:58'),
(72, 8, '2025-09-28 08:37:58'),
(73, 2, '2025-09-28 08:37:58'),
(73, 6, '2025-09-28 08:37:58'),
(74, 2, '2025-09-28 08:37:58'),
(74, 7, '2025-09-28 08:37:58'),
(75, 1, '2025-09-28 08:37:58'),
(75, 6, '2025-09-28 08:37:58'),
(76, 1, '2025-09-28 08:37:58'),
(76, 3, '2025-09-28 08:37:58'),
(76, 5, '2025-09-28 08:37:58'),
(76, 6, '2025-09-28 08:37:58'),
(77, 1, '2025-09-28 08:37:58'),
(77, 8, '2025-09-28 08:37:58'),
(78, 2, '2025-09-28 08:37:58'),
(78, 3, '2025-09-28 08:37:58'),
(78, 6, '2025-09-28 08:37:58'),
(79, 1, '2025-09-28 08:37:58'),
(79, 2, '2025-09-28 08:37:58'),
(80, 2, '2025-09-28 08:37:58'),
(80, 10, '2025-09-28 08:37:58'),
(81, 4, '2025-09-28 08:37:58'),
(81, 5, '2025-09-28 08:37:58'),
(82, 1, '2025-09-28 08:37:58'),
(82, 3, '2025-09-28 08:37:58'),
(82, 8, '2025-09-28 08:37:58'),
(83, 2, '2025-09-28 08:37:58'),
(83, 6, '2025-09-28 08:37:58'),
(84, 2, '2025-09-28 08:37:58'),
(84, 7, '2025-09-28 08:37:58'),
(85, 1, '2025-09-28 08:37:58'),
(85, 6, '2025-09-28 08:37:58'),
(86, 1, '2025-09-28 08:37:58'),
(86, 3, '2025-09-28 08:37:58'),
(86, 5, '2025-09-28 08:37:58'),
(86, 6, '2025-09-28 08:37:58'),
(87, 1, '2025-09-28 08:37:58'),
(87, 8, '2025-09-28 08:37:58'),
(88, 2, '2025-09-28 09:46:08'),
(88, 3, '2025-09-28 09:46:08'),
(88, 6, '2025-09-28 09:46:08'),
(89, 1, '2025-09-28 09:46:08'),
(89, 2, '2025-09-28 09:46:08'),
(90, 2, '2025-09-28 09:46:08'),
(90, 10, '2025-09-28 09:46:08'),
(91, 4, '2025-09-28 09:46:08'),
(91, 5, '2025-09-28 09:46:08'),
(92, 1, '2025-09-28 09:46:08'),
(92, 3, '2025-09-28 09:46:08'),
(92, 8, '2025-09-28 09:46:08'),
(93, 2, '2025-09-28 09:46:08'),
(93, 6, '2025-09-28 09:46:08'),
(94, 2, '2025-09-28 09:46:08'),
(94, 3, '2025-09-28 09:46:08'),
(94, 6, '2025-09-28 09:46:08'),
(95, 1, '2025-09-28 09:46:08'),
(95, 2, '2025-09-28 09:46:08'),
(96, 2, '2025-09-28 09:46:08'),
(96, 10, '2025-09-28 09:46:08'),
(97, 4, '2025-09-28 09:46:08'),
(97, 5, '2025-09-28 09:46:08'),
(98, 1, '2025-09-28 09:46:08'),
(98, 3, '2025-09-28 09:46:08'),
(98, 8, '2025-09-28 09:46:08'),
(99, 2, '2025-09-28 09:46:08'),
(99, 6, '2025-09-28 09:46:08'),
(100, 2, '2025-09-28 09:46:08'),
(100, 7, '2025-09-28 09:46:08'),
(101, 1, '2025-09-28 09:46:08'),
(101, 6, '2025-09-28 09:46:08'),
(102, 1, '2025-09-28 09:46:08'),
(102, 3, '2025-09-28 09:46:08'),
(102, 5, '2025-09-28 09:46:08'),
(102, 6, '2025-09-28 09:46:08'),
(103, 1, '2025-09-28 09:46:08'),
(103, 8, '2025-09-28 09:46:08');

-- --------------------------------------------------------

--
-- Stand-in structure for view `recipe_timing`
-- (See below for the actual view)
--
CREATE TABLE `recipe_timing` (
`recipe_id` int(11)
,`total_minutes` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '30-minute', '2025-09-27 23:03:42', NULL),
(2, 'kid-friendly', '2025-09-27 23:03:42', NULL),
(3, 'low-cost', '2025-09-27 23:03:42', NULL),
(4, 'spicy', '2025-09-27 23:03:42', NULL),
(5, 'one-pan', '2025-09-27 23:03:42', NULL),
(6, 'comfort-food', '2025-09-27 23:03:42', NULL),
(7, 'party-food', '2025-09-27 23:03:42', NULL),
(8, 'meal-prep', '2025-09-27 23:03:42', NULL),
(9, 'romantic', '2025-09-27 23:03:42', NULL),
(10, 'family-style', '2025-09-27 23:03:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password_hash`, `created_at`) VALUES
(1, 'Demo User', 'demo@example.com', '$2y$10$Kp7T8r7j4xQ0Q9d2Z2g8W.zvZ3C2l2Vq1o6a3xM1r6R9y2b1QmJk2', '2025-09-27 22:06:14');

-- --------------------------------------------------------

--
-- Structure for view `recipe_timing`
--
DROP TABLE IF EXISTS `recipe_timing`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `recipe_web_app`.`recipe_timing`  AS SELECT `t`.`recipe_id` AS `recipe_id`, sum(`t`.`group_max_minutes`) AS `total_minutes` FROM (select `recipe_web_app`.`recipe_steps`.`recipe_id` AS `recipe_id`,`recipe_web_app`.`recipe_steps`.`step_group` AS `step_group`,max(`recipe_web_app`.`recipe_steps`.`minutes`) AS `group_max_minutes` from `recipe_web_app`.`recipe_steps` group by `recipe_web_app`.`recipe_steps`.`recipe_id`,`recipe_web_app`.`recipe_steps`.`step_group`) AS `t` GROUP BY `t`.`recipe_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `dietary_attributes`
--
ALTER TABLE `dietary_attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `idx_dietary_attr_order` (`display_order`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`user_id`,`recipe_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `idx_ing_name` (`name`);

--
-- Indexes for table `ingredient_allergens`
--
ALTER TABLE `ingredient_allergens`
  ADD PRIMARY KEY (`ingredient_id`,`dietary_attribute_id`),
  ADD KEY `dietary_attribute_id` (`dietary_attribute_id`);

--
-- Indexes for table `ingredient_categories`
--
ALTER TABLE `ingredient_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `ingredient_category_map`
--
ALTER TABLE `ingredient_category_map`
  ADD PRIMARY KEY (`ingredient_id`,`category_id`),
  ADD KEY `idx_ingcat_map` (`category_id`,`ingredient_id`);

--
-- Indexes for table `ingredient_synonyms`
--
ALTER TABLE `ingredient_synonyms`
  ADD PRIMARY KEY (`ingredient_id`,`synonym`),
  ADD KEY `idx_ing_synonym` (`synonym`);

--
-- Indexes for table `nutrition`
--
ALTER TABLE `nutrition`
  ADD PRIMARY KEY (`recipe_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`user_id`,`recipe_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_recipe_title` (`title`);
ALTER TABLE `recipes` ADD FULLTEXT KEY `ft_recipes_title_summary` (`title`,`summary`);

--
-- Indexes for table `recipe_categories`
--
ALTER TABLE `recipe_categories`
  ADD PRIMARY KEY (`recipe_id`,`category_id`),
  ADD KEY `idx_recipe_categories_cat_recipe` (`category_id`,`recipe_id`);

--
-- Indexes for table `recipe_dietary_attributes`
--
ALTER TABLE `recipe_dietary_attributes`
  ADD PRIMARY KEY (`recipe_id`,`dietary_attribute_id`),
  ADD KEY `verified_by` (`verified_by`),
  ADD KEY `idx_recipe_dietary_attr` (`dietary_attribute_id`,`recipe_id`,`confidence`);

--
-- Indexes for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD PRIMARY KEY (`recipe_id`,`ingredient_id`),
  ADD KEY `idx_ingredient_group` (`recipe_id`,`ingredient_group`,`display_order`),
  ADD KEY `idx_recipe_ingredients_ing_recipe` (`ingredient_id`,`recipe_id`);

--
-- Indexes for table `recipe_steps`
--
ALTER TABLE `recipe_steps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parallel_parent_step` (`parallel_parent_step`),
  ADD KEY `idx_step_recipe` (`recipe_id`),
  ADD KEY `idx_step_group` (`recipe_id`,`step_group`,`step_no`);

--
-- Indexes for table `recipe_tags`
--
ALTER TABLE `recipe_tags`
  ADD PRIMARY KEY (`recipe_id`,`tag_id`),
  ADD KEY `idx_recipe_tags_tag_recipe` (`tag_id`,`recipe_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `dietary_attributes`
--
ALTER TABLE `dietary_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=325;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=750;

--
-- AUTO_INCREMENT for table `ingredient_categories`
--
ALTER TABLE `ingredient_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `recipe_steps`
--
ALTER TABLE `recipe_steps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=611;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `favourites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favourites_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ingredient_allergens`
--
ALTER TABLE `ingredient_allergens`
  ADD CONSTRAINT `ingredient_allergens_ibfk_1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ingredient_allergens_ibfk_2` FOREIGN KEY (`dietary_attribute_id`) REFERENCES `dietary_attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ingredient_categories`
--
ALTER TABLE `ingredient_categories`
  ADD CONSTRAINT `ingredient_categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `ingredient_categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ingredient_category_map`
--
ALTER TABLE `ingredient_category_map`
  ADD CONSTRAINT `ingredient_category_map_ibfk_1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ingredient_category_map_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `ingredient_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ingredient_synonyms`
--
ALTER TABLE `ingredient_synonyms`
  ADD CONSTRAINT `ingredient_synonyms_ibfk_1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `nutrition`
--
ALTER TABLE `nutrition`
  ADD CONSTRAINT `nutrition_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recipe_categories`
--
ALTER TABLE `recipe_categories`
  ADD CONSTRAINT `recipe_categories_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recipe_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recipe_dietary_attributes`
--
ALTER TABLE `recipe_dietary_attributes`
  ADD CONSTRAINT `recipe_dietary_attributes_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recipe_dietary_attributes_ibfk_2` FOREIGN KEY (`dietary_attribute_id`) REFERENCES `dietary_attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recipe_dietary_attributes_ibfk_3` FOREIGN KEY (`verified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD CONSTRAINT `recipe_ingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recipe_ingredients_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recipe_steps`
--
ALTER TABLE `recipe_steps`
  ADD CONSTRAINT `recipe_steps_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recipe_steps_ibfk_2` FOREIGN KEY (`parallel_parent_step`) REFERENCES `recipe_steps` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `recipe_tags`
--
ALTER TABLE `recipe_tags`
  ADD CONSTRAINT `recipe_tags_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recipe_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
