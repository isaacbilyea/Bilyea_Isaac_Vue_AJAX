-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 11, 2025 at 06:12 AM
-- Server version: 8.0.35
-- PHP Version: 8.3.9

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
(12, 1, 'qweqeqe', '2025-04-07 15:28:25', '2025-04-07 15:28:25'),
(14, 2, 'lol', '2025-04-10 18:41:07', '2025-04-10 18:41:07'),
(16, 2, 'How do you organize a space party? You planet!', '2025-04-10 20:28:06', '2025-04-10 20:28:06'),
(17, 1, 'My dad must think I\'m bright. Because he always calls me his son.', '2025-04-10 20:32:06', '2025-04-10 20:32:06'),
(18, 1, 'Why do melons have weddings? They cantelope. ', '2025-04-10 20:40:36', '2025-04-10 20:40:36'),
(19, 1, 'I got a new pen that can write under water. It can write other words too.', '2025-04-10 20:41:21', '2025-04-10 20:41:21'),
(20, 2, 'Why don\'t scientists trust atoms? Because they make up everything!', '2025-04-10 20:41:33', '2025-04-10 20:41:33'),
(21, 1, 'I was going to try an all almond diet, but that\'s just nuts.', '2025-04-10 20:43:30', '2025-04-10 20:43:30'),
(22, 1, 'Today at the bank, an old lady asked me to check her balance... So I pushed her over.', '2025-04-10 20:44:39', '2025-04-10 20:44:39'),
(23, 2, 'What do you call a belt made of watches? A waist of time.', '2025-04-10 20:45:10', '2025-04-10 20:45:10'),
(24, 1, 'If your house is cold, just stand in the corner. It’s always 90 degrees there.', '2025-04-10 20:45:40', '2025-04-10 20:45:40'),
(25, 2, 'When two vegans get in an argument, is it still called beef?', '2025-04-10 20:50:31', '2025-04-10 20:50:31'),
(26, 2, 'I wasn\'t originally going to get a brain transplant, but then I changed my mind.', '2025-04-10 20:54:17', '2025-04-10 20:54:17'),
(27, 1, 'How do you make 7 even? Take away the S.', '2025-04-10 21:39:05', '2025-04-10 21:39:05'),
(28, 1, 'I asked my dog what\'s two minus two. He said nothing.', '2025-04-10 21:43:30', '2025-04-10 21:43:30'),
(29, 2, 'I know a lot of jokes about retired people, but none of them work.', '2025-04-10 21:43:42', '2025-04-10 21:43:42'),
(30, 2, 'The person who invented knock-knock jokes should get a no-bell prize.', '2025-04-10 21:44:10', '2025-04-10 21:44:10'),
(31, 1, 'I talk to myself because sometimes I just need expert advice.', '2025-04-10 21:45:29', '2025-04-10 21:45:29'),
(32, 1, 'What is red and bad for your teeth? A brick.', '2025-04-10 21:47:50', '2025-04-10 21:47:50'),
(33, 2, 'What did the buffalo say to his son when he left for college? Bison.', '2025-04-10 21:48:43', '2025-04-10 21:48:43'),
(34, 2, 'My neighbor has been mad at his wife for sunbathing topless. Personally, I\'m on the fence.', '2025-04-10 21:50:27', '2025-04-10 21:50:27'),
(35, 2, 'The wedding was so beautiful, even the cake was in tiers.', '2025-04-10 21:51:26', '2025-04-10 21:51:26'),
(36, 1, 'What’d the wall say to the other wall? Meet you at the corner.', '2025-04-10 21:53:42', '2025-04-10 21:53:42'),
(37, 1, 'Why was the broom late? It overswept!', '2025-04-10 21:56:25', '2025-04-10 21:56:25');

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
