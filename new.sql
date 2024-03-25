-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2024 at 08:33 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new`
--

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `classID` int(11) NOT NULL,
  `className` varchar(255) NOT NULL,
  `yearGrade` varchar(50) NOT NULL,
  `yearForm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`classID`, `className`, `yearGrade`, `yearForm`) VALUES
(1, 'a1', 'Lower', 1),
(2, 'a2', 'Lower', 1),
(3, 'a3', 'Lower', 3),
(4, 'a4', 'Lower', 3),
(5, 'a5', 'Lower', 3);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentID` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `classID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentID`, `firstName`, `lastName`, `gender`, `classID`) VALUES
(5, 'billa', 'b', 'Male', 1),
(6, 'raju', 'r', 'Male', 2),
(8, 'sri', 's', 'Female', 4),
(11, 'emi', 'e', 'Female', 3),
(12, 'ani', 'a', 'Female', 5);

-- --------------------------------------------------------

--
-- Table structure for table `student_score`
--

CREATE TABLE `student_score` (
  `id` int(11) NOT NULL,
  `studentID` int(11) DEFAULT NULL,
  `subjectID` int(11) DEFAULT NULL,
  `subject_score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_subject`
--

CREATE TABLE `student_subject` (
  `id` int(11) NOT NULL,
  `studentID` int(11) DEFAULT NULL,
  `subjectID` int(11) DEFAULT NULL,
  `subject_score` int(11) DEFAULT NULL,
  `subject_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_subject`
--

INSERT INTO `student_subject` (`id`, `studentID`, `subjectID`, `subject_score`, `subject_type`) VALUES
(9, 7, 1, 55, NULL),
(10, 7, 2, 56, NULL),
(11, 7, 3, 41, NULL),
(12, 7, 4, 57, NULL),
(13, 7, 5, 70, NULL),
(19, 6, 1, 58, NULL),
(20, 6, 2, 45, NULL),
(21, 6, 3, 32, NULL),
(22, 6, 4, 49, NULL),
(23, 6, 5, 76, NULL),
(29, 9, 1, 46, NULL),
(30, 9, 2, 81, NULL),
(31, 9, 3, 53, NULL),
(32, 9, 4, 63, NULL),
(33, 9, 5, 75, NULL),
(34, 10, 1, 51, NULL),
(35, 10, 2, 75, NULL),
(36, 10, 3, 47, NULL),
(37, 10, 4, 56, NULL),
(38, 10, 5, 82, NULL),
(39, 11, 1, 50, NULL),
(40, 11, 2, 76, NULL),
(41, 11, 3, 48, NULL),
(42, 11, 4, 57, NULL),
(43, 11, 5, 83, NULL),
(53, 12, 2, 60, NULL),
(54, 12, 3, 65, NULL),
(55, 12, 4, 46, NULL),
(56, 12, 5, 60, NULL),
(61, 5, 2, 31, NULL),
(62, 5, 3, 61, NULL),
(63, 5, 4, 97, NULL),
(64, 5, 5, 46, NULL),
(65, 8, 2, 85, NULL),
(66, 8, 3, 71, NULL),
(67, 8, 4, 59, NULL),
(68, 8, 5, 46, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `subjectID` varchar(50) NOT NULL,
  `subjectName` varchar(200) NOT NULL,
  `subjectType` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `subjectID`, `subjectName`, `subjectType`) VALUES
(11, '1', 'english', 'Selective'),
(13, '3', 'physics', 'Core'),
(14, '4', 'chemistry', 'Core'),
(15, '5', 'biology', 'Core'),
(16, '6', 'mech', 'Selective'),
(17, '2', 'maths', 'Core');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Password` varchar(256) NOT NULL,
  `Role` varchar(30) NOT NULL,
  `reset_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `Username`, `Password`, `Role`, `reset_token`) VALUES
(2, 'teacher@gmail.com', '$2y$10$//10EbzDbCDu/JE6Mv81i.DtsIkchGNrhDybWnkimdA1WUCGoPvZ6', 'Teacher', NULL),
(4, 'akilanj1999@gmail.com', '$2y$10$F5ZhvOaJA569pOqF1Luzju7kZugEWHnte76vELsZNO.HCAZ2n6Yb2', 'Admin', '6b1277b6d79521b5d6d9c17af9f611e3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`classID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentID`),
  ADD KEY `student_ibfk_1` (`classID`);

--
-- Indexes for table `student_score`
--
ALTER TABLE `student_score`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_student_score_student` (`studentID`),
  ADD KEY `fk_student_score_subject` (`subjectID`);

--
-- Indexes for table `student_subject`
--
ALTER TABLE `student_subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_student_subject_student` (`studentID`),
  ADD KEY `fk_student_subject_subject` (`subjectID`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `classID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `student_score`
--
ALTER TABLE `student_score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_subject`
--
ALTER TABLE `student_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`classID`) REFERENCES `class` (`classID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_score`
--
ALTER TABLE `student_score`
  ADD CONSTRAINT `fk_student_score_student` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_student_score_subject` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
