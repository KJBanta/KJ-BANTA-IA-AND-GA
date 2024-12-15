-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2024 at 08:42 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `three bear's bakery`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer_info`
--

CREATE TABLE `customer_info` (
  `customer_info_id` int(11) NOT NULL COMMENT 'deeznuts',
  `FirstName` varchar(25) NOT NULL,
  `LastName` varchar(25) NOT NULL,
  `MI` char(1) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Contactnum` varchar(20) NOT NULL,
  `Gender` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_info`
--

INSERT INTO `customer_info` (`customer_info_id`, `FirstName`, `LastName`, `MI`, `Address`, `Contactnum`, `Gender`) VALUES
(1, 'Nicole Mae', 'Leyva', 'R', 'Legazpi City, Albay', '09234567890', 'F'),
(3, 'Piolo', 'Padagdagan', 'B', 'Guinobatan, Albay', '091234567890', 'M'),
(4, 'Maxene Margaret', 'Mostoles', 'S', 'Camalig, Albay', '093456789012', 'F'),
(5, 'Krish Jareed', 'Banta', 'O', 'Daraga, Albay', '094567890123', 'M'),
(6, 'Morgan ', 'Diaz', 'D', 'Sorsogon, Albay', '09678901234', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(55) NOT NULL,
  `item_price` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_name`, `item_price`) VALUES
(1, 'Bear Bread', 80.50),
(2, 'Bread Bear 2', 15.00),
(3, 'Bearbread Long', 60.00),
(4, 'Bear Paws', 35.00),
(5, 'Bear Paws 2', 25.00),
(7, 'Bear Macaroons', 25.00),
(8, 'Bear Macaroons 2', 25.00),
(11, 'Choco Chip', 25.00),
(12, 'Grizzly Burger', 45.00),
(13, 'Grizzly Coffee', 35.00),
(14, 'Honey bear Latte', 35.00),
(15, 'Pola Bear Smoothie', 55.00),
(16, 'Pizza Bear', 75.00),
(17, 'Bear Claws', 20.00);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `date_ordered` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `item_id`, `user_id`, `qty`, `date_ordered`) VALUES
(1, 1, 2, 3, '2024-10-11 07:22:26'),
(2, 4, 3, 1, '2024-10-11 07:22:45'),
(3, 3, 5, 5, '2024-10-11 07:22:57'),
(4, 2, 1, 10, '2024-10-11 07:23:11'),
(5, 5, 4, 2, '2024-10-11 07:23:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(55) NOT NULL,
  `pass_word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `customer_info_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `pass_word`, `date_added`, `customer_info_id`) VALUES
(1, 'nmrl', '1234', '2024-10-11 07:01:03', 1),
(2, 'pbp', '2345', '2024-10-11 07:01:37', 3),
(3, 'mmsm', '3456', '2024-10-11 07:01:55', 4),
(4, 'kjob', '5678', '2024-10-11 07:02:13', 5),
(5, 'mdd', '6789', '2024-10-11 07:02:34', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer_info`
--
ALTER TABLE `customer_info`
  ADD PRIMARY KEY (`customer_info_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_list` (`user_id`),
  ADD KEY `item_list` (`item_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `customer_info_list` (`customer_info_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer_info`
--
ALTER TABLE `customer_info`
  MODIFY `customer_info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'deeznuts', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `item_list` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  ADD CONSTRAINT `user_list` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `customer_info_list` FOREIGN KEY (`customer_info_id`) REFERENCES `customer_info` (`customer_info_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
