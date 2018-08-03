-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 03, 2018 at 08:11 AM
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
  `content` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `image_list` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(50) DEFAULT NULL,
  `date_post` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `id_user`, `id_catelogy`, `location`, `title`, `content`, `image_list`, `price`, `date_post`) VALUES
(1, 2, 9, 5, 'điện thoại chính hãng', 'nội dung rao bán', '', 2000000, '2018-02-26 14:47:54'),
(2, 1, 9, 1, 'điện thoại 11', 'nọi dung ddiej thaoij 2121', '', 3000000, '2018-02-26 14:25:59'),
(3, 2, 10, 1, 'xác ipad air2 màn hư như hình ai lấy về lấy đồ', 'Cần bán gấp xác ipad air2 như hình. máy màn như hình. kiến nứt cảm ứng không được. bán rẻ cho ai về lấy đồ linh tinh camara loa pin main đồ vân vân giá quá bèo.', '', 500000, '2018-03-05 16:58:40'),
(4, 1, 10, 3, 'Nexus 7 đen 16g', 'tình hình máy bể góc dưới và mất nút nguồn . như hình .cảm ứng nứt nhẹ gần nút mủi tên quay về .cảm ứng vẫn ok .pin ko có gì để chê .ko phụ kiện ai cần thì alo .máy giá rẻ rồi nên ai xem giá ok thì hãy liên hệ nhé .', '', 1500000, '2018-03-05 16:43:41'),
(5, 1, 10, 5, 'Apple iPad Pro 10.5 64GB Wifi 4G | Có Trả Góp', 'SHOP CÓ BÁN TRẢ GÓP Tablet : iPad Pro 10.5 64GB 4G ( Phiên bản có sử dụng sim 4G) Máy mới 100% Active rồi chỉ sạc 1-2 lần \r\nCòn BH hãng đến năm 2019 (từ tháng 1 đến tháng 5 tuy may )Giá máy 97% : 13tr990KGiá máy 100%: 14tr690K\r\nVio Store cam kết chỉ bán hàng nguyên bản :  Main Zin , Màn zin ,chưa sửa chữa  Không bán hàng sửa main thay màn kém chất lượng Kèm theo đó là chính sách bảo hành toàn diện như sau : Bao đổi 1 đổi 1 trong 15 ngày sử dụng Bảo hành 6 tháng phần cứng Hỗ trợ phần mềm trọn đời máy\r\nChấp nhận mọi thợ thầy tới kiểm tra máy ', '', 3300000, '2018-04-23 14:24:45'),
(6, 1, 9, 6, 'dien thoai sony z3 compact', 'mays con sieu moi luon', '', 2100000, '2018-04-23 14:52:48'),
(7, 1, 1, 2, 'xe may ne', 'day la xe may', '', 2600000, '2018-07-25 10:31:15'),
(8, 1, 6, 5, 'dong ho gia re', 'day la dong ho gia re ne ba con oi', '', 4000000, '2018-07-25 10:35:41'),
(9, 2, 9, 1, 'iPhone 6S Quốc Tế 32G ', 'F5 STORE- CHUYÊN IPHONE CHÍNH HÃNG BAO RẺ TẠI SÀI GÒN.\r\n✅Thương hiệu uy tín số 1 chợ tốt. Cam kết Không bán hàng dựng hàng nhái hàng kém chất lượng.\r\n♻️ Đ/C: 655/6 Lê Hồng Phong-P10-Q10.\r\nĐường 3 tháng 2 đi vào 100M\r\n⛔️ Giờ làm việc: 9h00-21h00 Tất cả các ngày trong tuần.\r\n——————————————————————\r\n?Hiện chúng tôi đang có chương trình hỗ trợ trả góp với lãi xuất (0%) cho tất cả các dòng sản phẩm của cửa hàng đang bán ra!\r\n? Các bạn chỉ cần trả trước 10% giá trị máy.\r\n? Hiện chúng tôi đang cần bán: \r\n?iPhone 5S QT giá:\r\n• Xám Trắng: 1.800.000₫\r\n• Vàng: 2.000.000₫', '', 1800000, '2018-08-03 07:41:56'),
(10, 2, 9, 1, 'iPhone 5S Quốc Tế 16G đầy đủ phụ kiện, BH 1 năm', 'F5 STORE- CHUYÊN IPHONE CHÍNH HÃNG BAO RẺ TẠI SÀI GÒN.✅Thương hiệu uy tín số 1 chợ tốt. Cam kết Không bán hàng dựng hàng nhái hàng kém chất lượng.Đ/C: 655/6 Lê Hồng Phong-P10-Q10.Đường 3 tháng 2 đi vào 100M⛔️ Giờ làm việc: 9h00-21h00 Tất cả các ngày trong tuần.Hiện chúng tôi đang có chương trình hỗ trợ trả góp với lãi xuất (0%) cho tất cả các dòng sản phẩm của cửa hàng đang bán ra!Các bạn chỉ cần trả trước 10% giá trị máy.? Hiện chúng tôi đang cần bán:?iPhone 5S QT giá:• Xám Trắng: 1.800.000₫• Vàng: 2.000.000₫', '', 1800000, '2018-08-03 07:43:09'),
(11, 1, 9, 2, 'Samsung Galaxy Note 8 64GB | Có Bán Trả Góp', 'SHOP CÓ BÁN TRẢ GÓP\r\n?Điện thoại : Samsung Galaxy Note 8\r\n? Giá : 97% (Ngoại hình có trầy) : 11tr490K\r\n? Giá : 99% (Không trầy xướt) : 11tr890K \r\n? Giá : New Fullbox : 14tr390K\r\nBên minh có bản Mỹ , Hàn , Quốc tế 2 sim\r\nVio Store cam kết chỉ bán hàng nguyên bản : \r\n?? Main Zin , Màn zin ,chưa sửa chữa \r\n?? Máy Zin Áp suất đầy đủ\r\n?? Không bán hàng sửa main thay màn kém chất lượng \r\n⛔️ Kèm theo đó là chính sách bảo hành toàn diện như sau : \r\n?? Bao đổi 1 đổi 1 trong 15 ngày sử dụng \r\n?? Bảo hành 6 tháng phần cứng \r\n?? Hỗ trợ phần mềm trọn đời máy\r\nChấp nhận mọi thợ thầy tới kiểm tra máy \r\n?? Địa chỉ : Số 97 Lê Đức Thọ - Phường 7 - Gò Vấp - TP.HCM (Coop Mark Phan Văn Trị quẹo vô Đường lê Đức Thọ chạy tới Vòng xoay nhỏ , chạy tiếp theo đường Lê Đức Thọ 50M nhìn bên tay TRÁI là thấy Cửa hàng Vio Store - Đối diện Phở 10 Lý Quốc Sư)', '', 11400000, '2018-08-03 07:46:26'),
(12, 1, 9, 3, 'Samsung Galaxy S7 G930U Vàng 32 GB', 'Samsung Galaxy S7 G930U Vàng 32 GB máy sử dụng tốt không lổi lầm gì ok hết, xấu tí home còn lại đẹp ok hết.. test thoải mái rồi mua xài', '', 3000000, '2018-08-03 07:47:44'),
(13, 1, 9, 6, 'Giao lưu iPhone 7plus Quốc te 128G khổng van tay', 'Dư dung cay iPhone 7 plus Quốc te 128G bộ nho khũng tha hồ lưu trữ\r\nMai zin main zin 100% bao anh em thay thợ test moi tay bao bung mái ra cho sem luon\r\nMái Sài full chức năng chỉ khổng sai dc vân tay con lại tất cãi full 100%\r\nCó giao lưu đổi gio cho anh em lên đời\r\nFix cho anh em đam me cong nghe cao.', '', 6900000, '2018-08-03 07:49:20'),
(14, 2, 9, 5, 'iphone 8 plus 64gb gold QT zin keng 99% bh dài', 'cần bán cây 8 plus gold như hình, máy chuẩn quốc tế zinall leng keng 99% nguyên bản còn bh dài, hoàn hảo full mọi chức năng không lỗi lầm, vân tay nhạy pin trâu màn hình đẹp long lanh, icloud sạch, bán tại nhà bao test bao sài bao zin bao thầy thợ. ai cần máy chất xin liên hệ, trả giá linh tinh xin ko tiếp.\r\ncám ơn chotot đã duyệt tin', '', 15300000, '2018-08-03 08:40:20'),
(15, 2, 9, 5, 'Nokia 206 hai sim zin', 'cần bán nokia nghe goi ok máy còn đẹp zin ace rõ to pin trâu Ace mua alo cho mình trực tiếp nha thanks ngã tư an sương q12', '', 300000, '2018-08-03 07:21:20'),
(16, 2, 9, 1, 'Iphone 6s pluss 16gb quốc tế đã sử dụng', 'Lên đời cho dế nên mình cần để lại con iphone 6s plus 16gb rose gold quốc tế fullbox . Máy quốc tế chứ không phải máy lock .Máy xách tay từ mỹ về và xài hơn một năm nay, mình xài rất kĩ nên máy còn đầy đủ phụ kiện hộp, sạc cáp tai nghe zin theo máy , sách hướng dẫn , que chọc sim còn đầy đủ như lúc mới mua, máy còn nguyên zin nguyên bản từ a đến z. vân tay nhạy, camera chụp rất đẹp, pin zin chưa chai , loa nghe to rõ, màn hình zin hiển thị đẹp, không điểm sáng điểm chết, không icloud reset vô tư. mình xài kĩ máy giữ còn rất đẹp , không một vết trầy xước , nguyên zin nguyên bản cầm rất chắc tay.', '', 4600000, '2018-08-03 07:51:20'),
(17, 2, 10, 5, 'Ipad Air 2 16 GB Gold Only Wifi Fullbox New 99%', 'Mình cần bán ipad air 2 bán 16Gb only wifi màu gold. Máy trước mua tại Vĩnh phát, còn nguyên hộp và hoá đơn mua hàng, có team của Vĩnh phát. Lúc đó mình mua hàng New nên các bạn yên tâm. Máy zin all, ko lỗi nhỏ, vân tay 1 chạm,iCloud của mình bao restore, sạc cáp theo máy. Máy đảm bảo mọi người yên tâm. Giá bán 5tr8 (tin còn máy còn) ai mua liên hệ hoặc Zalo. Mình ở gò vấp. Thank mn!!!', '', 5850000, '2018-08-03 07:34:45'),
(18, 1, 10, 3, 'Máy tính bảng windows 10 8 inch của asus chạy mượt', 'Máy tính bảng mình đang xài hay sử dụng để thao tác khi có việc gấp rất tiện vì nhỏ gọn chỉ 8inch cực kỳ mỏng và nhẹ rất tiện lợi bỏ vào các túi mini phù hợp di chuyển\r\n- máy có cpu thể hệ 3 của atom z3745 và có ram 2gb.ổ ssd 32gb khởi động xử lý ứng dụng cực nhanh và hỗ trợ khe cắm thẻ nhớ mở rộng\r\n- kết nối vs các chuột qua cổng otg thuận tiện nên tây tiện\r\n- ai mua máy em xải tặng luôn cái cover zin của nó để chống va đập khi bỏ cốp và túi\r\n- ai có nhu cầu thì alo em không nhận sms\r\nGiá 1.9tr \r\nCảm ơn chợ tốt và a e đã xem', '', 1900000, '2018-08-03 07:04:45'),
(19, 1, 10, 1, 'Apple Ipad Air 2 gold 16gb 3g wifi', 'Cần bạn ipad ari 2 gold 16gb 3G, wifi, máy đẹp 97%, mọi chức năng xài ổn định, phụ kiện sạc cáp, vân tay nhạy, sóng gió 3G vi vu, giá 6tr bớt nhẹ', '', 5700000, '2018-08-03 07:57:01'),
(20, 1, 10, 5, 'Ipad Gen 5 2017 của Mỹ Nguyên Seal 100%', 'Máy Mỹ mới 100% nguyên seal chưa active , bảo hành 1 đổi 1 , hỗ trợ trả góp & trả góp qua thẻ tín dụng .\r\nPhiên bản 32GB Wifi màu Grey', '', 7000000, '2018-08-03 07:57:01'),
(21, 1, 10, 6, 'ipad pro 10.5 256gb 4g gray mới 100% nguyên seal', 'ipad pro 10.5 256gb 4g gray mới 100% nguyên seal chưa active người nhà xách tay về chưa qua sử dụng\r\ngiá 15tr', '', 15000000, '2018-08-03 07:58:38'),
(22, 2, 10, 1, 'Samsung Galaxy Book fullbox', 'bán nhanh galaxy boong chính hãng công ty fullbox may nguyên zin đẹp ken như mới do ích sử dụng ae nhìn là thích liền phụ kiện chưa dùng luôn, cấu hình cao corem thế hệ 7,ram 4g bộ nhớ 128g bán tại nhà bao ae sài yên tâm nha cám ơn', '', 9500000, '2018-07-31 22:21:20'),
(23, 2, 10, 4, 'ipad gen 6 - 128G bảng wifi rose máy zin đẹp 99,99', 'Cần bán nhanh 1 em ipad gen 6 ( đời 2018) bảng wifi - màu hồng máy zin đẹp new 99,99% - full chức năng - full phụ kiện - bao test 1 tuần money back - bảo hành apple đến 06/2019', '', 7990000, '2018-07-10 23:35:17'),
(24, 2, 10, 1, 'Apple Ipad Air 2 xám 64g 4g đẹp ken', 'Cần bán em iPad Air2 này ngoại hình máy đẹp ken có hỗ trợ 4g màu xám mọi chức năng hoạt động tốt HK lỗi lầm gì cả xem máy tại nhà nên anh em cứ yên tâm bao test bao xài thoải mái ai cần thì lh trực tiếp nha cảm ơn chợ tốt đã duyệt tin', '', 7200000, '2018-07-31 22:18:23');

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
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
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
