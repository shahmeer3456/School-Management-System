1-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2024 at 12:20 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `ClassID` int(11) NOT NULL,
  `ClassName` varchar(50) NOT NULL,
  `Capacity` int(11) NOT NULL,
  `TeacherID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`ClassID`, `ClassName`, `Capacity`, `TeacherID`) VALUES
(1, 'Reception Year', 40, 1064),
(2, 'Year One', 30, 346),
(3, 'Year Two', 35, 626),
(4, 'Year Three', 22, 1116),
(5, 'Year Four', 45, 1245),
(6, 'Year Five', 40, 299),
(7, 'Year Six', 33, 182);

-- --------------------------------------------------------

--
-- Table structure for table `parentsguardians`
--

CREATE TABLE `parentsguardians` (
  `ParentID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parentsguardians`
--

INSERT INTO `parentsguardians` (`ParentID`, `Name`, `Address`, `Email`, `Phone`) VALUES
(1, 'Saad', 'Liberty Market Lahore', 'f201064@cfd.nu.edu.pk', '03245266710'),
(2, 'Benny', 'UK ', 'benny1@gmail.com', '03243166140'),
(3, 'Brad', 'Netherlands', 'brad@gmail.com', '91562871923');

-- --------------------------------------------------------

--
-- Table structure for table `pupilparents`
--

CREATE TABLE `pupilparents` (
  `PupilID` int(11) NOT NULL,
  `ParentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pupils`
--

CREATE TABLE `pupils` (
  `PupilID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `MedicalInfo` text DEFAULT NULL,
  `ClassID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pupils`
--

INSERT INTO `pupils` (`PupilID`, `Name`, `Address`, `MedicalInfo`, `ClassID`) VALUES
(2, 'Mahad Ashraf', 'Ghulam Muhammadabad Fsd ', 'None', 5),
(4, 'John', 'NYC ', 'Blood Group A+', 5),
(5, 'Sammy', 'Westindies', 'None', 3),
(6, 'Fatima', 'Lahore', 'None', 1);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `TeacherID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `AnnualSalary` float NOT NULL,
  `BackgroundCheck` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`TeacherID`, `Name`, `Address`, `Phone`, `AnnualSalary`, `BackgroundCheck`) VALUES
(1, 'Ahmed shaikh', 'Light House', '03163918419', 1000000, 0),
(2, 'Yousaf', 'Block A Johar Town', '0324567198', 9000000, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`ClassID`);

--
-- Indexes for table `parentsguardians`
--
ALTER TABLE `parentsguardians`
  ADD PRIMARY KEY (`ParentID`);

--
-- Indexes for table `pupilparents`
--
ALTER TABLE `pupilparents`
  ADD PRIMARY KEY (`PupilID`,`ParentID`),
  ADD KEY `ParentID` (`ParentID`);

--
-- Indexes for table `pupils`
--
ALTER TABLE `pupils`
  ADD PRIMARY KEY (`PupilID`),
  ADD KEY `ClassID` (`ClassID`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`TeacherID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `ClassID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `parentsguardians`
--
ALTER TABLE `parentsguardians`
  MODIFY `ParentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pupils`
--
ALTER TABLE `pupils`
  MODIFY `PupilID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `TeacherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pupilparents`
--
ALTER TABLE `pupilparents`
  ADD CONSTRAINT `pupilparents_ibfk_1` FOREIGN KEY (`PupilID`) REFERENCES `pupils` (`PupilID`),
  ADD CONSTRAINT `pupilparents_ibfk_2` FOREIGN KEY (`ParentID`) REFERENCES `parentsguardians` (`ParentID`);

--
-- Constraints for table `pupils`
--
ALTER TABLE `pupils`
  ADD CONSTRAINT `pupils_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ClassID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
