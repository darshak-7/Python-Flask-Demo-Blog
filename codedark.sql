-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2020 at 05:17 PM
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
-- Database: `codedark`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `msg` varchar(150) NOT NULL,
  `mobno` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `msg`, `mobno`, `date`) VALUES
(6, 'now ', 'now@noe.moe', 'nownwnn', 'nnown', '2020-08-15 11:37:26'),
(7, 'hello', 'hello@gmail.com', 'kjfdfklj', '1234567890', '2020-08-16 11:45:23'),
(8, 'djfaljfdj', 'flajlaq@eajfkjs.lsdjfj', 'jsldkjfljf', 'sdjlkjsdj', '2020-08-16 11:48:53'),
(9, 'djfaljfdj', 'flajlaq@eajfkjs.lsdjfj', 'jsldkjfljf', 'sdjlkjsdj', '2020-08-16 11:49:41'),
(10, 'fsjkfj', 'fslkdjlfdjl@sdjkfl.jflks', 'sjfdls', '1234566789', '2020-08-16 11:50:31'),
(11, 'fsjkfj', 'fslkdjlfdjl@sdjkfl.jflks', 'sjfdls', '1234566789', '2020-08-16 11:54:05'),
(12, 'hskhsdh', 'ksdhhkshfkh@dsfdf.sdfsf', 'kjsdhkfhskhfkjhs', 'jkdsshkdfh', '2020-08-16 12:05:53'),
(13, 'hskhsdh', 'ksdhhkshfkh@dsfdf.sdfsf', 'kjsdhkfhskhfkjhs', 'jkdsshkdfh', '2020-08-16 12:52:27'),
(14, 'hskhsdh', 'ksdhhkshfkh@dsfdf.sdfsf', 'kjsdhkfhskhfkjhs', 'jkdsshkdfh', '2020-08-16 12:52:29'),
(15, 'hskhsdh', 'ksdhhkshfkh@dsfdf.sdfsf', 'kjsdhkfhskhfkjhs', 'jkdsshkdfh', '2020-08-16 12:52:54'),
(16, 'hskhsdh', 'ksdhhkshfkh@dsfdf.sdfsf', 'kjsdhkfhskhfkjhs', 'jkdsshkdfh', '2020-08-16 12:55:48'),
(20, 'Dk', 'dk2gmail.com', 'dealkjsldfjlafjdkalfld;', '1231231233', '2020-08-18 11:48:34'),
(23, 'now', 'now@gmail.com', 'now lets check its proper or not', '1232131312', '2020-08-18 11:49:50'),
(24, 'abc', 'acba@abc.abc', 'abcabcabcabcbabcba', '1122334455', '2020-08-18 12:54:44'),
(25, 'hello', 'kfjj@dshfh.skdjf', 'dsfjlkfjlsfjl', 'fjksjfj', '2020-08-18 12:55:35'),
(26, 'ajsldlajldsjl', 'kfjj@dshfh.skdjf', 'ljfllsdfjslkdfjl', 'ljslfjflas', '2020-08-18 12:56:14'),
(29, 'darshak', 'darshak@gmail.com', 'hello its working', '9090909090', '2020-08-28 11:51:34');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `content` varchar(200) NOT NULL,
  `img_file` varchar(50) DEFAULT ' ',
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'first post edited', 'first-post', 'its my first post to make it live', 'home-bg.jpg', '2020-08-29 21:47:47'),
(2, 'second post ', 'second-post', 'its my second post to make it live', 'img/post-bg.jpg', '2020-08-15 13:31:40'),
(3, 'third post', 'third-post', 'its my third post lets make it live', 'img/post-bg.jpg', '2020-08-15 13:36:39'),
(4, 'fourth post', 'fourth-post', 'its my fourth poost lets make it live', 'img/post-bg.jpg', '2020-08-15 13:36:39'),
(5, 'fifth post ', 'fifth-post', 'its my fifth post lets make it live', 'img/post-bg.jpg', '2020-08-15 13:38:53'),
(6, 'sixth post', 'sixth-post', 'its my sixth post lets make it live', 'img/post-bg.jpg', '2020-08-15 13:38:53'),
(7, 'seventh post', 'seventh-post', 'its my seventh post lets make it live', ' ', '2020-08-15 13:38:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
