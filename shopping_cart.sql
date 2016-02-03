-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 03, 2016 at 04:21 am
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shopping_cart`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
`cityID` int(3) NOT NULL,
  `cityName` varchar(20) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`cityID`, `cityName`) VALUES
(1, 'Auckland'),
(2, 'Christchurch'),
(3, 'Wellington'),
(4, 'Dunedin');

-- --------------------------------------------------------

--
-- Table structure for table `ordered_products`
--

CREATE TABLE IF NOT EXISTS `ordered_products` (
`id` mediumint(8) unsigned NOT NULL,
  `product` smallint(5) unsigned NOT NULL,
  `order` mediumint(8) unsigned NOT NULL,
  `quantity` tinyint(4) NOT NULL,
  `priceAtPurchase` decimal(4,2) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `ordered_products`
--

INSERT INTO `ordered_products` (`id`, `product`, `order`, `quantity`, `priceAtPurchase`) VALUES
(1, 1, 2, 40, '3.80'),
(2, 4, 2, 5, '2.90'),
(3, 5, 2, 10, '10.00'),
(4, 1, 3, 40, '3.80'),
(5, 4, 3, 25, '2.90'),
(6, 5, 3, 10, '10.00'),
(7, 1, 4, 2, '3.80'),
(8, 3, 4, 8, '11.00'),
(9, 1, 5, 22, '3.80'),
(10, 1, 6, 5, '3.80'),
(11, 3, 6, 6, '11.00'),
(12, 1, 7, 5, '3.80'),
(13, 3, 8, 10, '11.00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
`id` mediumint(8) unsigned NOT NULL,
  `name` varchar(60) NOT NULL,
  `suburb` int(3) NOT NULL,
  `street` varchar(60) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `state` enum('refunded','declined','approved','expired','timeout','pedding') NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `suburb`, `street`, `phone`, `email`, `state`) VALUES
(1, 'Ac', 1, '5 street', '1234567', 'testinguse.aw@gmail.com', ''),
(2, 'Ac', 33, '5 street', '123456789', 'ac@mail.com', ''),
(3, 'AW', 33, '5 Jackson St', '123456789', '', 'approved'),
(4, 'Aw', 3, '1 high street', '', '', ''),
(5, 'aw', 3, '11 st', '', '', ''),
(6, 'Banana', 33, '1 street', '', '', ''),
(7, 'WE', 18, '1 street', '', '', 'timeout'),
(8, 'AE', 56, '10 high street', '', '', 'declined');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
`id` smallint(5) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `price` decimal(4,2) NOT NULL,
  `stock` tinyint(4) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock`) VALUES
(1, 'Mandarin', 'Orange and sweet ', '3.80', 50),
(2, 'Banana', 'Import from China.', '3.00', 50),
(3, 'Cherry', 'A grade quality form South Island. ', '11.00', 100),
(4, 'Pear', 'Sweet and juicy.', '2.90', 50),
(5, 'Cat food', 'It''s on sale!', '10.00', 100),
(6, 'Dog food', 'It''s on sale!', '20.00', 100);

-- --------------------------------------------------------

--
-- Table structure for table `suburbs`
--

CREATE TABLE IF NOT EXISTS `suburbs` (
`suburbID` int(3) NOT NULL,
  `cityID` int(3) NOT NULL,
  `suburbName` varchar(20) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `suburbs`
--

INSERT INTO `suburbs` (`suburbID`, `cityID`, `suburbName`) VALUES
(1, 1, 'Avondale'),
(2, 1, 'CBD'),
(3, 1, 'Epsom'),
(4, 1, 'Grey Lynn'),
(5, 1, 'Hillsborough'),
(6, 1, 'Kohimarama'),
(7, 1, 'Mt Albert'),
(8, 1, 'Mt Eden'),
(9, 1, 'Mt Roskill'),
(10, 1, 'Mt Wellington'),
(11, 1, 'Newmarket'),
(12, 1, 'Onehunga'),
(13, 1, 'Otahuhu'),
(14, 1, 'Parnell'),
(15, 1, 'Ponsonby'),
(16, 1, 'Three Kings'),
(17, 1, 'Waterview'),
(18, 2, 'Avonhead'),
(19, 2, 'Bishopsdale'),
(20, 2, 'Burnside'),
(21, 2, 'Cashmere'),
(22, 2, 'CBD'),
(23, 2, 'Fendalton'),
(24, 2, 'Halswell'),
(25, 2, 'Linwood'),
(26, 2, 'Merivale'),
(27, 2, 'New Brighton'),
(28, 2, 'Papanui'),
(29, 2, 'Riccarton'),
(30, 2, 'St Albans'),
(31, 2, 'Woolston'),
(32, 2, 'Yaldhurst'),
(33, 3, 'Aro Valley'),
(34, 3, 'Brooklyn'),
(35, 3, 'Churton Park'),
(36, 3, 'Hataitai'),
(37, 3, 'Island Bay'),
(38, 3, 'Johnsonville'),
(39, 3, 'Karori'),
(40, 3, 'Kelburn'),
(41, 3, 'Kilbirnie'),
(42, 3, 'Miramar'),
(43, 3, 'Mt Cook'),
(44, 3, 'Mt Victoria'),
(45, 3, 'Newtown'),
(46, 3, 'Northland'),
(47, 3, 'Oriental Bay'),
(48, 3, 'Roseneath'),
(49, 3, 'Seatoun'),
(50, 3, 'Te Aro'),
(51, 3, 'Thorndon'),
(52, 4, 'Abbotsford'),
(53, 4, 'Brighton'),
(54, 4, 'Caversham'),
(55, 4, 'CBD'),
(56, 4, 'Fairfield'),
(57, 4, 'Green Island'),
(58, 4, 'Highcliff'),
(59, 4, 'Kenmure'),
(60, 4, 'Kew'),
(61, 4, 'Maori Hill'),
(62, 4, 'Mornington'),
(63, 4, 'Opoho'),
(64, 4, 'Otakou'),
(65, 4, 'Portobello'),
(66, 4, 'St Kilda');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
 ADD PRIMARY KEY (`cityID`);

--
-- Indexes for table `ordered_products`
--
ALTER TABLE `ordered_products`
 ADD PRIMARY KEY (`id`), ADD KEY `product` (`product`), ADD KEY `order` (`order`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`id`), ADD KEY `suburb` (`suburb`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suburbs`
--
ALTER TABLE `suburbs`
 ADD PRIMARY KEY (`suburbID`), ADD KEY `cityID` (`cityID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
MODIFY `cityID` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ordered_products`
--
ALTER TABLE `ordered_products`
MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `suburbs`
--
ALTER TABLE `suburbs`
MODIFY `suburbID` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=67;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ordered_products`
--
ALTER TABLE `ordered_products`
ADD CONSTRAINT `ordered_products_ibfk_1` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `ordered_products_ibfk_2` FOREIGN KEY (`order`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`suburb`) REFERENCES `suburbs` (`suburbID`) ON UPDATE CASCADE;

--
-- Constraints for table `suburbs`
--
ALTER TABLE `suburbs`
ADD CONSTRAINT `suburbs_ibfk_1` FOREIGN KEY (`cityID`) REFERENCES `cities` (`cityID`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
