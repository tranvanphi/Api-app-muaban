-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 02, 2018 at 11:24 AM
-- Server version: 5.6.34-log
-- PHP Version: 7.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `muaban`
--

-- --------------------------------------------------------

--
-- Table structure for table `catelogy`
--

CREATE TABLE `catelogy` (
  `id` int(100) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_group` int(100) NOT NULL,
  `sort_order` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `catelogy`
--

INSERT INTO `catelogy` (`id`, `name`, `id_group`, `sort_order`) VALUES
(1, 'xe máy', 2, 1),
(2, 'ô tô', 2, 2),
(3, 'chó', 5, 3),
(4, 'chim', 5, 4),
(5, 'quần áo', 4, 5),
(6, 'đồng hồ', 4, 6),
(7, 'tủ lạnh, máy lạnh', 3, 7),
(8, 'đồ gia dụng gia đình', 3, 8),
(9, 'Điện thoại', 1, 9),
(10, 'máy tính bảng', 1, 10),
(11, 'đất', 6, 11),
(12, 'nhà ở', 6, 12);

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `id` int(100) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_province` int(100) NOT NULL,
  `sort_order` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`id`, `name`, `id_province`, `sort_order`) VALUES
(1, 'quận 1', 1, 1),
(2, 'quận 2', 1, 2),
(3, 'thủ dầu một', 2, 3),
(4, 'bến cát', 2, 4),
(5, 'Biên hòa', 3, 5),
(6, 'trảng bom', 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `group_catelogy`
--

CREATE TABLE `group_catelogy` (
  `id` int(100) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_lage` tinyint(4) NOT NULL DEFAULT '0',
  `sort_order` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group_catelogy`
--

INSERT INTO `group_catelogy` (`id`, `name`, `alias_name`, `image_lage`, `sort_order`) VALUES
(1, 'đồ điện tử', 'mobile', 0, 1),
(2, 'xe cộ', 'car', 1, 2),
(3, 'nội thất, ngoại thất', 'produce', 0, 3),
(4, 'thời trang', 'fashion', 0, 4),
(5, 'thú cưng', 'pet', 0, 5),
(6, 'nhà, phòng trọ', 'home', 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(100) NOT NULL,
  `id_user` int(100) NOT NULL,
  `id_catelogy` int(100) NOT NULL,
  `location` int(100) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_list` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(50) DEFAULT NULL,
  `date_post` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `id_user`, `id_catelogy`, `location`, `title`, `content`, `image_list`, `price`, `date_post`) VALUES
(1, 2, 9, 5, 'điện thoại chính hãng', 'nội dung rao bán', '', 200, '2018-02-26 14:47:54'),
(2, 1, 9, 1, 'điện thoại 11', 'nọi dung ddiej thaoij 2121', '', 300, '2018-02-26 14:25:59'),
(3, 2, 10, 1, 'may tinh bang sieu re', 'minh ban may tinh bang voi gia 0 dong', '', 50, '2018-03-05 16:58:40'),
(4, 1, 10, 3, 'may tinh bang sai roi', 'noi dung may tinh bang sai roi ne', '', 150, '2018-03-05 16:43:41'),
(5, 1, 10, 5, 'may tinh bang sieuuuuuuuuuuuuu re daay ba con oi', 'gia sieu re ne', '', 330, '2018-04-23 14:24:45'),
(6, 1, 9, 6, 'dien thoai sony z3 compact', 'mays con sieu moi luon', '', 210, '2018-04-23 14:52:48'),
(7, 1, 1, 2, 'xe may ne', 'day la xe may', '', 260, '2018-07-25 10:31:15'),
(8, 1, 6, 5, 'dong ho gia re', 'day la dong ho gia re ne ba con oi', '', 40, '2018-07-25 10:35:41');

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `id` int(100) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`id`, `name`, `sort_order`) VALUES
(1, 'Hồ chí minh', 1),
(2, 'Bình Dương', 2),
(3, 'đồng nai', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(100) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(20) NOT NULL,
  `date_join` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sort_order` int(100) NOT NULL DEFAULT '1',
  `type` tinyint(2) DEFAULT '0' COMMENT '0: as personal 1:as compacny'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `username`, `password`, `phone`, `date_join`, `sort_order`, `type`) VALUES
(1, 'tran van phi', 'phi0946191773@gmail.com', 'tranvanphi', 'e10adc3949ba59abbe56e057f20f883e', 946191773, '2018-02-24 14:17:32', 1, 0),
(2, 'nguyen van a1', 'nguyenvana@gmail.com', 'nguyenvana', 'e10adc3949ba59abbe56e057f20f883e', 946191774, '2018-02-26 14:17:16', 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catelogy`
--
ALTER TABLE `catelogy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_group` (`id_group`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_province` (`id_province`);

--
-- Indexes for table `group_catelogy`
--
ALTER TABLE `group_catelogy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_catelogy` (`id_catelogy`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `location` (`location`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catelogy`
--
ALTER TABLE `catelogy`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `group_catelogy`
--
ALTER TABLE `group_catelogy`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `catelogy`
--
ALTER TABLE `catelogy`
  ADD CONSTRAINT `catelogy_ibfk_1` FOREIGN KEY (`id_group`) REFERENCES `group_catelogy` (`id`);

--
-- Constraints for table `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `district_ibfk_1` FOREIGN KEY (`id_province`) REFERENCES `province` (`id`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`id_catelogy`) REFERENCES `catelogy` (`id`),
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `post_ibfk_3` FOREIGN KEY (`location`) REFERENCES `district` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
