-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2024 at 09:45 AM
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
-- Database: `csd_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE `faculties` (
  `faculty_id` int(30) NOT NULL,
  `names` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `contact_no` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`faculty_id`, `names`, `password`, `contact_no`, `email`, `address`) VALUES
(1, 'Jerry Agsunod', 'jerryag', '09875635281', 'jerryagsunod@gmail.com', 'Polangui, Albay'),
(2, 'Mary Antoniette Arino', 'arino1234', '09251894432', 'antoniettearino@gmail.com', 'Polangui, Albay');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `sched_id` int(30) NOT NULL,
  `faculty_id` int(30) NOT NULL,
  `title` varchar(200) NOT NULL,
  `schedule_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1= class, 2= meeting,3=others',
  `description` text NOT NULL,
  `location` text NOT NULL,
  `is_repeating` tinyint(1) NOT NULL DEFAULT 1,
  `repeating_data` text NOT NULL,
  `schedule_date` date NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`sched_id`, `faculty_id`, `title`, `schedule_type`, `description`, `location`, `is_repeating`, `repeating_data`, `schedule_date`, `time_from`, `time_to`, `date_created`) VALUES
(3, 2, 'Class 101 (M & Th)', 1, 'Sample Only', 'Online', 1, '{\"dow\":\"1,4\",\"start\":\"2020-10-01\",\"end\":\"2020-11-30\"}', '0000-00-00', '09:00:00', '12:00:00', '2020-10-20 15:51:01'),
(4, 0, 'wala', 1, 'hieahghaejg', 'csd', 1, '{\"dow\":\"1\",\"start\":\"2024-03-01\",\"end\":\"2024-04-30\"}', '0000-00-00', '12:00:00', '16:00:00', '2024-03-26 12:01:04'),
(5, 3, 'organizational development in it', 1, 'alam nyo na yan', 'ECB 202', 1, '{\"dow\":\"4\",\"start\":\"2024-04-01\",\"end\":\"2024-05-31\"}', '0000-00-00', '10:00:00', '11:30:00', '2024-03-26 12:13:41'),
(6, 3, 'ORGANIZATIONAL DEVELOPMENT IN IT', 1, 'WELCOME TO HELL', 'ECB 202', 1, '{\"dow\":\"5\",\"start\":\"2024-04-01\",\"end\":\"2024-05-31\"}', '0000-00-00', '13:00:00', '16:00:00', '2024-03-26 12:16:44'),
(7, 3, 'OD IN IT', 1, 'BSIDAGICDA', 'ECB 2022', 0, '', '2024-11-04', '10:00:00', '11:30:00', '2024-03-26 12:21:52'),
(8, 3, 'OD IN IT', 1, 'WALA WALA WALA', 'ECB 202', 0, '', '2024-04-11', '07:00:00', '09:00:00', '2024-03-26 12:25:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(30) NOT NULL,
  `names` text NOT NULL,
  `password` text NOT NULL,
  `user_type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1=Admin, 2=Faculty, 3 = Student',
  `email` varchar(55) NOT NULL,
  `user_status` char(1) NOT NULL DEFAULT 'a' COMMENT 'a - active\r\ni - inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `names`, `password`, `user_type`, `email`, `user_status`) VALUES
(1, 'Administrator', 'adminadmin', 1, 'admin@gmail.com', 'a'),
(2, 'Student1', 'Student1', 3, 'student1@gmail.com', 'a'),
(3, 'professor1', 'prof1', 2, 'prof1@gmail.com', 'a');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`sched_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `faculty_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `sched_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
