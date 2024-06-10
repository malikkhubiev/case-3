-- MySQL Workbench SQL Export
-- Version 8.0.23

-- Host: localhost
-- Generation Time: Jun 10, 2024 at 00:00 AM
-- Server version: 8.0.23
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `Tourism` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `Tourism`;

-- --------------------------------------------------------

--
-- Table structure for table `Bookings`
--

DROP TABLE IF EXISTS `Bookings`;
CREATE TABLE IF NOT EXISTS `Bookings` (
  `BookingID` int(11) NOT NULL AUTO_INCREMENT,
  `TourID` int(11) DEFAULT NULL,
  `BookingDate` date NOT NULL,
  `CustomerName` varchar(100) NOT NULL,
  `CustomerEmail` varchar(100) NOT NULL,
  `NumberOfPeople` int(11) NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `TourID` (`TourID`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`TourID`) REFERENCES `Tours` (`TourID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Cities`
--

DROP TABLE IF EXISTS `Cities`;
CREATE TABLE IF NOT EXISTS `Cities` (
  `CityID` int(11) NOT NULL AUTO_INCREMENT,
  `CityName` varchar(100) NOT NULL,
  `CountryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CityID`),
  KEY `CountryID` (`CountryID`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`CountryID`) REFERENCES `Countries` (`CountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Countries`
--

DROP TABLE IF EXISTS `Countries`;
CREATE TABLE IF NOT EXISTS `Countries` (
  `CountryID` int(11) NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(100) NOT NULL,
  PRIMARY KEY (`CountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Services`
--

DROP TABLE IF EXISTS `Services`;
CREATE TABLE IF NOT EXISTS `Services` (
  `ServiceID` int(11) NOT NULL AUTO_INCREMENT,
  `ServiceName` varchar(100) NOT NULL,
  `Description` text,
  PRIMARY KEY (`ServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Tours`
--

DROP TABLE IF EXISTS `Tours`;
CREATE TABLE IF NOT EXISTS `Tours` (
  `TourID` int(11) NOT NULL AUTO_INCREMENT,
  `TourName` varchar(100) NOT NULL,
  `CityID` int(11) DEFAULT NULL,
  `ServiceID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TourID`),
  KEY `CityID` (`CityID`),
  KEY `ServiceID` (`ServiceID`),
  CONSTRAINT `tours_ibfk_1` FOREIGN KEY (`CityID`) REFERENCES `Cities` (`CityID`),
  CONSTRAINT `tours_ibfk_2` FOREIGN KEY (`ServiceID`) REFERENCES `Services` (`ServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Countries`
--

INSERT INTO `Countries` (`CountryID`, `CountryName`) VALUES
(1, 'USA'),
(2, 'France'),
(3, 'Japan');

--
-- Dumping data for table `Cities`
--

INSERT INTO `Cities` (`CityID`, `CityName`, `CountryID`) VALUES
(1, 'New York', 1),
(2, 'Paris', 2),
(3, 'Tokyo', 3);

--
-- Dumping data for table `Services`
--

INSERT INTO `Services` (`ServiceID`, `ServiceName`, `Description`) VALUES
(1, 'Guided Tour', 'A guided tour with a professional guide'),
(2, 'Hotel Stay', 'Accommodation in a 5-star hotel');

--
-- Dumping data for table `Tours`
--

INSERT INTO `Tours` (`TourID`, `TourName`, `CityID`, `ServiceID`) VALUES
(1, 'NYC Tour', 1, 1),
(2, 'Paris City Tour', 2, 1),
(3, 'Tokyo Deluxe', 3, 2);

--
-- Dumping data for table `Bookings`
--

INSERT INTO `Bookings` (`BookingID`, `TourID`, `BookingDate`, `CustomerName`, `CustomerEmail`, `NumberOfPeople`) VALUES
(1, 1, '2024-06-01', 'John Doe', 'john@example.com', 2);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
