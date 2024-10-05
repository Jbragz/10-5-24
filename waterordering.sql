-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2024 at 02:43 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `waterordering`
--

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE `memberships` (
  `membership_id` int(11) NOT NULL,
  `membership_type` varchar(50) NOT NULL COMMENT 'e.g., Basic, Premium, Gold',
  `price` decimal(10,2) NOT NULL,
  `duration_in_days` int(11) NOT NULL COMMENT 'Subscription duration in days'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `availability_status` char(1) NOT NULL DEFAULT 'A' COMMENT 'A - Available, O - Out of Stock'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE `stations` (
  `station_id` int(11) NOT NULL,
  `station_name` varchar(100) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `subscription_status` char(1) NOT NULL DEFAULT 'A' COMMENT 'A - Active, E - Expired',
  `membership_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `subscription_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `membership_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(55) NOT NULL,
  `email` varchar(55) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `phone_number` varchar(55) NOT NULL,
  `address` varchar(255) NOT NULL,
  `user_type` char(1) NOT NULL DEFAULT 'C' COMMENT 'C - Customer, A - Admin, O - Owner',
  `status` char(1) NOT NULL DEFAULT 'A' COMMENT 'A - Active, I - Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `email`, `password`, `image`, `phone_number`, `address`, `user_type`, `status`) VALUES
(1, '', 'jems@refilling.com', '123456', 'default.jpg', '', '', 'C', 'A'),
(2, 'JUSTEN REFILLING STATION', 'just10@station.com', '789789', 'default.jpg', '', '', 'O', 'A'),
(3, 'lee REFILLING STATION', 'leendon@station.com', '123123', 'default.jpg', '', '', '', 'A'),
(4, 'wantones station', 'wanton@water.com', '456456', 'default.jpg', '', '', 'u', 'A'),
(5, 'eyaaaaaj REFILLING STATION', 'eyaj@234.gmail.com', '678678', 'default.jpg', '', '', 'O', 'A'),
(6, 'PAZ WATER STATION', 'paz25@gmail.com.ph', '259259', 'default.jpg', '', '', 'O', 'A'),
(7, 'Shaine Station', 'shaineyy@station.com', '123456', 'default.jpg', '', '', 'O', 'A'),
(8, 'SHAINE WATER STATION', 'shainewater@gmail.com', '098098', 'default.jpg', '', '', 'O', 'A'),
(9, 'CY STATION', 'cy2008@water.station.com', '234234', 'default.jpg', '', '', 'O', 'A'),
(10, 'nes water', 'nestea@water.com', '135135', 'default.jpg', '', '', 'O', 'A'),
(11, 'Chips Water Stations', 'chips@water.station.com.ph', '467467', 'default.jpg', '', '', 'O', 'A'),
(12, 'Walton Loneza', 'lonezawalton@gmail.com.ph', '231231', 'default.jpg', '', '', 'C', 'A'),
(13, 'RHEA NASAYAO', 'nasayao@bu.com.ph', 'nasayao', 'default.jpg', '', '', 'C', 'A'),
(14, 'WILLY SMITH', 'WIL@415.GMAIL.COM', 'WILWIL', 'default.jpg', '', '', 'C', 'A'),
(15, 'SEVEN HEAVEN WATER STATION', 'sevenheaven@water.station.com', '$2y$10$SNFprDG6c5WtM5cUO44rzua4KE0HZZ6v4g7ZuEGwklMpLMUH', 'default.jpg', '', '', 'O', 'A'),
(16, 'Eya M. Smith', 'smitheya@gmail.com.ph', 'eyasmith', 'default.jpg', '', '', 'C', 'A'),
(17, 'Althea Lobos', 'althealobos79@gmail.com', 'thea1911', 'default.jpg', '09613559041', 'Mayao, Oas, Albay', 'A', 'A'),
(18, 'Jem Casurog', 'jemCas@gmail.com', 'jemaaa', 'default.jpg', '093684726452', 'Cavasi, Ligao, City', 'A', 'A'),
(19, 'Justine Bragais', 'justineA@gmail.com', 'jastennn', 'default.jpg', '092846193720', 'Ligao, City', 'A', 'A'),
(20, 'Water Station', 'jarren@water.station.com', 'jarren123', 'default.jpg', '', '', 'O', 'A'),
(21, 'ADMIN', 'admin1@gmail.com', 'admin1', 'default.jpg', '094638261847', 'LIGAO, CITY', 'A', 'A'),
(22, 'Duduy Water Station', 'Duduy@gmail.com', 'duduylang', 'default.jpg', '', '', 'O', 'A');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `memberships`
--
ALTER TABLE `memberships`
  ADD PRIMARY KEY (`membership_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `station_id` (`station_id`);

--
-- Indexes for table `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`station_id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`subscription_id`),
  ADD KEY `owner_id` (`owner_id`),
  ADD KEY `membership_id` (`membership_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `memberships`
--
ALTER TABLE `memberships`
  MODIFY `membership_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stations`
--
ALTER TABLE `stations`
  MODIFY `station_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `subscription_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `stations` (`station_id`);

--
-- Constraints for table `stations`
--
ALTER TABLE `stations`
  ADD CONSTRAINT `stations_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `subscriptions_ibfk_2` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`membership_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
