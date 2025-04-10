-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 10, 2025 at 11:33 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: jokes
--

-- --------------------------------------------------------

--
-- Table structure for table categories
--

CREATE TABLE categories (
  id int UNSIGNED NOT NULL,
  category varchar(200) NOT NULL,
  image_url varchar(300) NOT NULL,
  created_at timestamp NOT NULL,
  updated_at timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table categories
--

INSERT INTO categories (id, category, image_url, created_at, updated_at) VALUES
(1, 'Dad', 'dad.png', '2025-04-02 16:18:07', '2025-04-02 16:18:07'),
(2, 'AI', 'ai.png', '2025-04-02 16:18:07', '2025-04-02 16:18:07');

-- --------------------------------------------------------

--
-- Table structure for table jokes
--

CREATE TABLE jokes (
  id int UNSIGNED NOT NULL,
  category_id int UNSIGNED NOT NULL,
  joke varchar(4000) NOT NULL,
  created_at timestamp NOT NULL,
  updated_at timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table jokes
--

INSERT INTO jokes (id, category_id, joke, created_at, updated_at) VALUES
(1, 1, 'Why don’t skeletons fight each other? They don’t have the guts.', '2025-04-07 15:48:12', '2025-04-07 15:48:12'),
(2, 2, 'Why did the AI break up with the computer? It found a new model.', '2025-04-07 15:48:18', '2025-04-07 15:48:18'),
(13, 2, 'qewqew', '2025-04-07 15:28:28', '2025-04-07 15:28:28'),
(12, 1, 'qweqeqe', '2025-04-07 15:28:25', '2025-04-07 15:28:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table categories
--
ALTER TABLE categories
  ADD PRIMARY KEY (id);

--
-- Indexes for table jokes
--
ALTER TABLE jokes
  ADD PRIMARY KEY (id);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table categories
--
ALTER TABLE categories
  MODIFY id int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table jokes
--
ALTER TABLE jokes
  MODIFY id int UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
