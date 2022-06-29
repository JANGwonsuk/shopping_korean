SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `shopping_korea` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `shopping_korea`;

DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(250) NOT NULL,
  `admin_email` text NOT NULL,
  `admin_password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin4am', 'admin4am@naver.com', '0f359740bd1cda994f8b55330c86d845');

-- --------------------------------------------------------

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_cost` decimal(6,2) NOT NULL,
  `order_status` varchar(100) NOT NULL DEFAULT 'on_hold',
  `user_id` int(11) NOT NULL,
  `user_phone` int(11) NOT NULL,
  `user_city` varchar(255) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_price` decimal(6,0) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_id` varchar(250) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `product_category` varchar(100) NOT NULL,
  `product_description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `product_image` varchar(255) CHARACTER SET utf8 NOT NULL,
  `product_image2` varchar(255) CHARACTER SET utf8 NOT NULL,
  `product_image3` varchar(255) CHARACTER SET utf8 NOT NULL,
  `product_image4` varchar(255) CHARACTER SET utf8 NOT NULL,
  `product_price` decimal(6,2) NOT NULL,
  `product_special_offer` int(2) NOT NULL,
  `product_color` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `products` (`product_id`, `product_name`, `product_category`, `product_description`, `product_image`, `product_image2`, `product_image3`, `product_image4`, `product_price`, `product_special_offer`, `product_color`) VALUES
(1, '싸이 흠뻑쇼', 'KOREA', '2022.07.16(SAT) 18:00', 'PSY SUMMER SWAG 2022 - INCHEON1.jpeg', 'PSY SUMMER SWAG 2022 - INCHEON2.jpeg', 'PSY SUMMER SWAG 2022 - INCHEON3.jpeg', 'PSY SUMMER SWAG 2022 - INCHEON4.jpeg', '100.00', 0, '인천아시아드주경기장'),
(2, '워터밤 2022 - 태국', 'ASIA', '2022.07.25(SUN) 14:00', 'WATERBOMB 2022 - THAILAND1.jpeg', 'WATERBOMB 2022 - THAILAND2.jpeg', 'WATERBOMB 2022 - THAILAND3.jpeg', 'WATERBOMB 2022 - THAILAND4.jpeg', '100.00', 0, 'IMPACT Arena Building'),
(3, '신촌 물총 축제 2022 ', 'KOREA', '2022.07.30(SAT) 13:00', '2022 SINCHON WATER GUB FESTIVAL1.jpeg', '2022 SINCHON WATER GUB FESTIVAL2.jpeg', '2022 SINCHON WATER GUB FESTIVAL3.jpeg', '2022 SINCHON WATER GUB FESTIVAL4.jpeg', '30.00', 0, '신촌역'),
(4, '토트넘 VS 팀 K리그', 'KOREA', '2022.07.13(WED) 20:00', 'TOTTENHAM HOTSPUR VS TEAM K-LEAGUE1.jpeg', 'TOTTENHAM HOTSPUR VS TEAM K-LEAGUE2.jpeg', 'TOTTENHAM HOTSPUR VS TEAM K-LEAGUE3.jpeg', 'TOTTENHAM HOTSPUR VS TEAM K-LEAGUE4.jpeg', '120.00', 0, '서울월드컵경기장'),
(5, 'NCT 월드투어 - 호주', 'OCEANIA', '2022.07.16(SAT) 18:00', 'NCT WORLDTOUR - Australia1.jpeg', 'NCT WORLDTOUR - Australia2.jpeg', 'NCT WORLDTOUR - Australia3.jpeg', 'NCT WORLDTOUR - Australia4.jpeg', '200.00', 0, 'Accor Stadium'),
(6, '힙합 플레이야 2022 - 서울', 'KOREA', '2022.09.17(SAT) 15:00', 'HIPHOP PLAYA 20221.jpeg', 'HIPHOP PLAYA 20222.jpeg', 'HIPHOP PLAYA 20223.jpeg', 'HIPHOP PLAYA 20224.jpeg', '50.00', 0, '난지한강공원'),
(7, '레드벨벳 월드투어 - 도쿄', 'ASIA', '2022.07.30(SAT) 18:00', 'RED VElVET CONCERT - TOKYO1.jpeg', 'RED VElVET CONCERT - TOKYO2.jpeg', 'RED VElVET CONCERT - TOKYO3.jpeg', 'RED VElVET CONCERT - TOKYO4.jpeg', '200.00', 0, 'Tokyo Dome'),
(8, '엑소 월드투어 - 오사카', 'ASIA', '2022.09.13(SAT) 18:00', 'EXO WORLDTOUR - OSAKA1.jpeg', 'EXO WORLDTOUR - OSAKA2.jpeg', 'EXO WORLDTOUR - OSAKA3.jpeg', 'EXO WORLDTOUR - OSAKA4.jpeg', '220.00', 0, 'Osaka-jo Hall'),
(9, '트래저 월드투어 - 뉴질랜드', 'OCEANIA', '2022.08.06(SAT) 18:00', 'TREASURE WORLDTOUR - NEW ZEALAND1.jpeg', 'TREASURE WORLDTOUR - NEW ZEALAND2.jpeg', 'TREASURE WORLDTOUR - NEW ZEALAND3.jpeg', 'TREASURE WORLDTOUR - NEW ZEALAND4.jpeg', '110.00', 0, 'Eden Park Reimers Avenue'),
(10, '위너 월드투어 - 호주', 'OCEANIA', '2022.08.14(SUN) 18:00', 'WINNER WORLDTOUR - Australia1.jpeg', 'WINNER WORLDTOUR - Australia2.jpeg', 'WINNER WORLDTOUR - Australia3.jpeg', 'WINNER WORLDTOUR - Australia4.jpeg', '180.00', 0, 'Optus Stadium'),
(11, '지코 월드투어- 호주', 'OCEANIA', '2022.08.21(SUN) 18:00', 'ZICO WORLDTOUR - Australia1.jpeg', 'ZICO WORLDTOUR - Australia2.jpeg', 'ZICO WORLDTOUR - Australia3.jpeg', 'ZICO WORLDTOUR - Australia4.jpeg', '180.00', 0, 'Anz Stadium');
(12, '세븐틴 월드투어 - 태국', 'ASIA', '2022.10.01(SAT) 18:00', '세븐틴 월드투어 - 태국1.jpeg', '세븐틴 월드투어 - 태국2.jpeg', '세븐틴 월드투어 - 태국3.jpeg', '세븐틴 월드투어 - 태국4.jpeg', '200.00', 0, 'Anz Stadium');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`) VALUES
(1, 'WONSUKJANG', 'jjangga700@naver.com', '4297f44b13955235245b2497399d7a93');


ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

ALTER TABLE `order_items`
  ADD PRIMARY KEY (`item_id`);

ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UX_Constraint` (`user_email`);

ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `order_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

