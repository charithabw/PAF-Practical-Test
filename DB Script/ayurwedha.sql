-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 03:44 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ayurwedha`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointmentmanagement`
--

CREATE TABLE `appointmentmanagement` (
  `appointment_id` int(11) NOT NULL,
  `Appointment_type` int(11) NOT NULL,
  `Appointment_date` varchar(100) NOT NULL,
  `Appointment_time` varchar(100) NOT NULL,
  `Appointment_fees` varchar(100) NOT NULL,
  `Patient_id` int(11) NOT NULL,
  `Hospital_id` int(11) NOT NULL,
  `Doctor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointmentmanagement`
--

INSERT INTO `appointmentmanagement` (`appointment_id`, `Appointment_type`, `Appointment_date`, `Appointment_time`, `Appointment_fees`, `Patient_id`, `Hospital_id`, `Doctor_id`) VALUES
(1, 1, '2020-04-12', '12:30:00', '7500', 1, 1, 1),
(2, 2, '2020-04-13', '15:20:00', '7000', 1, 2, 2),
(3, 3, '2020-04-14', '09:45:00', '6500', 1, 3, 3),
(4, 4, '2020-04-15', '10:25:00', '7500', 1, 4, 4),
(6, 1, '2020-04-18', '10:15:00', '7500', 2, 1, 1),
(7, 2, '2020-04-19', '18:15:00', '7000', 2, 2, 2),
(8, 3, '2020-04-20', '08:55:00', '6500', 2, 3, 3),
(9, 4, '2020-04-20', '01:10:00', '7500', 2, 4, 4),
(10, 2, '2020-04-23', '12:35:00', '7000', 3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `creditcards`
--

CREATE TABLE `creditcards` (
  `Card_id` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Patient_id` int(11) NOT NULL,
  `Bank` varchar(100) NOT NULL,
  `Card_number` varchar(100) NOT NULL,
  `CVV` varchar(100) NOT NULL,
  `Exp_year` varchar(100) NOT NULL,
  `Exp_month` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `creditcards`
--

INSERT INTO `creditcards` (`Card_id`, `Username`, `Patient_id`, `Bank`, `Card_number`, `CVV`, `Exp_year`, `Exp_month`) VALUES
(1, 'MR DINUKA', 1, 'BOC BANK', '123456789067', '123', '2025', 'JANUARY'),
(2, 'MR DINUKA', 1, 'COMMERCIAL BANK', '234567890149', '234', '2031', 'MARCH'),
(3, 'MS THILINI', 2, 'BOC BANK', '345678901234', '345', '2024', 'MAY'),
(4, 'MR YASINITH', 3, 'PEOPLES BANK', '456756786789', '490', '2028', 'DECEMBER'),
(5, 'MR YASINITH', 3, 'BOC BANK', '456756787893', '132', '2024', 'FEBRUARY'),
(6, 'MR CHARITHA', 4, 'SELAN BANK', '123423453456', '157', '2029', 'SEPTEMBER'),
(7, 'MS DINITHI', 5, 'COMMERCIAL BANK', '456734562345', '263', '2024', 'JULY');

-- --------------------------------------------------------

--
-- Table structure for table `doctormanagement`
--

CREATE TABLE `doctormanagement` (
  `Doctor_id` int(11) NOT NULL,
  `Doctor_name` varchar(100) NOT NULL,
  `Specialization` int(11) NOT NULL,
  `Hospital_id` int(11) NOT NULL,
  `NIC` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctormanagement`
--

INSERT INTO `doctormanagement` (`Doctor_id`, `Doctor_name`, `Specialization`, `Hospital_id`, `NIC`, `Email`, `Phone`, `Password`) VALUES
(1, 'MR. DESHAN HETTIARACHCHI', 1, 1, '751111111V', 'deshan.n@gmail.com', '0711111111', 'deshan123'),
(2, 'MR NARADA JAYAWARDHANA', 2, 2, '761111111V', 'narada.a@gmail.com', '0711111112', 'narada123'),
(3, 'MR KELUM DISANAYAKE', 3, 3, '861111111V', 'kelum.a@gmail.com', '0711122222', 'kelum123'),
(4, 'MR BJANAKA BABEYWARDHANA', 4, 4, '764589489V', 'janaka.ninewells@gmail.com', '0775656560', 'janaka1234'),
(7, 'MR saman', 9, 4, '761111112V', 'bandaraBW.a@gmail.com', '0711111112', '12345'),
(8, 'charitha bandara', 2, 3, '981750047V', 'charithabw98@gmail.com', '0717723869', 'abcd');

-- --------------------------------------------------------

--
-- Table structure for table `hospitalmanagement`
--

CREATE TABLE `hospitalmanagement` (
  `Hospital_id` int(11) NOT NULL,
  `Hospital_name` varchar(100) NOT NULL,
  `Hospital_location` varchar(100) NOT NULL,
  `Register_no` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospitalmanagement`
--

INSERT INTO `hospitalmanagement` (`Hospital_id`, `Hospital_name`, `Hospital_location`, `Register_no`, `Email`, `Phone`) VALUES
(1, 'NAVALOKA', 'COLOMBO 02', 'HSP01', 'hsp01.navaloka@gmail.com', '0112333333'),
(2, 'LANKA HOSPITAL', 'COLOMBO 05', 'HSP02', 'hsp02.lanka@gmail.com', '0112222233'),
(3, 'ASIRI', 'COLOMBO 01', 'HSP03', 'hsp03.asiri@gmail.com', '0112444444'),
(4, 'NINEWELLS', 'COLOMBO 11', 'HSP04', 'hsp04.ninewells@gmail.com', '0112555555'),
(5, 'DURDANS', 'COLOMBO 03', 'HSP05', 'hsp05.durdans@gmail.com', '0112666666'),
(6, 'APEKSHA', 'MAHARAGAMA', 'HSP06', 'apeksha.m@gmail.com', '0112850070'),
(7, 'GOLDEN KEY', 'BORELLA', 'HMS07', 'goldenkey@gmail.com', '0115279065');

-- --------------------------------------------------------

--
-- Table structure for table `patientmanagement`
--

CREATE TABLE `patientmanagement` (
  `Patient_id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Birthday` date NOT NULL,
  `Nic` varchar(100) NOT NULL,
  `Phone` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `patientmanagement`
--

INSERT INTO `patientmanagement` (`Patient_id`, `Name`, `Gender`, `Birthday`, `Nic`, `Phone`, `username`, `password`) VALUES
(1, 'DINUKA HETTIARACHCHI', 'MALE', '1998-05-25', '981460928V', '0717686411', 'dinukaindeewara@gmail.com', 'dinuka123'),
(2, 'THILINI DUREKSHA', 'FEMALE', '1997-04-08', '971537820V', '0713489629', 'thilini@yahoo.com', 'thilini123'),
(3, 'LAHIRU YASINITH', 'MALE', '1997-09-19', '975629249V', '0768696390', 'lahiri97@gmail.com', 'yasi97'),
(4, 'CHARITHA WEERASOORIYA', 'MALE', '1998-04-15', '985900354V', '0767899300', 'charithabw@gmail.com', 'charitha123'),
(5, 'DINITHI ANUPAMA', 'FEMALE', '1997-08-14', '972390821v', '0715689251', 'dinithianu@gmail.com', 'anu123');

-- --------------------------------------------------------

--
-- Table structure for table `paymentmanagement`
--

CREATE TABLE `paymentmanagement` (
  `payment_id` int(11) NOT NULL,
  `Patient_id` int(11) NOT NULL,
  `Hospital_id` int(11) NOT NULL,
  `Doctor_id` int(11) NOT NULL,
  `Appointment_id` int(11) NOT NULL,
  `Fees` int(100) NOT NULL,
  `Payment_Date` varchar(100) NOT NULL,
  `Payment_Time` varchar(100) NOT NULL,
  `Card_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paymentmanagement`
--

INSERT INTO `paymentmanagement` (`payment_id`, `Patient_id`, `Hospital_id`, `Doctor_id`, `Appointment_id`, `Fees`, `Payment_Date`, `Payment_Time`, `Card_id`) VALUES
(1, 1, 1, 1, 1, 7500, '2020-04-13', '09:00:00', 1),
(2, 1, 2, 2, 2, 7000, '2020-04-14', '13:30:00', 2),
(3, 1, 3, 3, 3, 6500, '2020-04-15', '13:30:00', 1),
(4, 1, 4, 4, 4, 7500, '2020-04-16', '13:30:00', 2),
(6, 2, 1, 1, 6, 7500, '2020-04-19', '08:35:00', 3),
(7, 2, 2, 2, 7, 7000, '2020-04-20', '10:45:00', 3),
(8, 2, 3, 3, 8, 6500, '2020-04-21', '15:25:00', 3),
(9, 2, 4, 4, 9, 7500, '2020-04-21', '18:25:00', 3),
(10, 3, 2, 2, 10, 7000, '2020-04-24', '10:10:00', 5);

-- --------------------------------------------------------

--
-- Table structure for table `specialization`
--

CREATE TABLE `specialization` (
  `s_id` int(11) NOT NULL,
  `specialization` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specialization`
--

INSERT INTO `specialization` (`s_id`, `specialization`) VALUES
(1, 'ALLERGY & IMMUNOLOGY'),
(2, 'ANESTHESIOLOGY'),
(3, 'DERMATOLOGY'),
(4, 'DIAGNOSTIC RADIOLOGY'),
(5, 'EMERGENCY MEDICINE'),
(6, 'FAMILY MEDICINE'),
(7, 'INTERNAL MEDICINE'),
(8, 'MEDICAL GENETICS'),
(9, 'NEUROLOGY'),
(10, 'NUCLEAR MEDICINE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointmentmanagement`
--
ALTER TABLE `appointmentmanagement`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `Hospital_id_FK` (`Hospital_id`),
  ADD KEY `Patient_id_FK` (`Patient_id`),
  ADD KEY `Doctor_id_FK` (`Doctor_id`),
  ADD KEY `specialization_FK` (`Appointment_type`);

--
-- Indexes for table `creditcards`
--
ALTER TABLE `creditcards`
  ADD PRIMARY KEY (`Card_id`),
  ADD KEY `C_Patientid_FK` (`Patient_id`);

--
-- Indexes for table `doctormanagement`
--
ALTER TABLE `doctormanagement`
  ADD PRIMARY KEY (`Doctor_id`),
  ADD KEY `D_Hospital_id_FK` (`Hospital_id`),
  ADD KEY `D_specialization_FK` (`Specialization`);

--
-- Indexes for table `hospitalmanagement`
--
ALTER TABLE `hospitalmanagement`
  ADD PRIMARY KEY (`Hospital_id`);

--
-- Indexes for table `patientmanagement`
--
ALTER TABLE `patientmanagement`
  ADD PRIMARY KEY (`Patient_id`);

--
-- Indexes for table `paymentmanagement`
--
ALTER TABLE `paymentmanagement`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `P_Patientid_FK` (`Patient_id`),
  ADD KEY `P_Hospitalid_FK` (`Hospital_id`),
  ADD KEY `P_Doctorid_FK` (`Doctor_id`),
  ADD KEY `P_Appointment_FK` (`Appointment_id`),
  ADD KEY `P_Cardid_FK` (`Card_id`);

--
-- Indexes for table `specialization`
--
ALTER TABLE `specialization`
  ADD PRIMARY KEY (`s_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `creditcards`
--
ALTER TABLE `creditcards`
  MODIFY `Card_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `doctormanagement`
--
ALTER TABLE `doctormanagement`
  MODIFY `Doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `paymentmanagement`
--
ALTER TABLE `paymentmanagement`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `specialization`
--
ALTER TABLE `specialization`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointmentmanagement`
--
ALTER TABLE `appointmentmanagement`
  ADD CONSTRAINT `Doctor_id_FK` FOREIGN KEY (`Doctor_id`) REFERENCES `doctormanagement` (`Doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Hospital_id_FK` FOREIGN KEY (`Hospital_id`) REFERENCES `hospitalmanagement` (`Hospital_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Patient_id_FK` FOREIGN KEY (`Patient_id`) REFERENCES `patientmanagement` (`Patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `specialization_FK` FOREIGN KEY (`Appointment_type`) REFERENCES `specialization` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `creditcards`
--
ALTER TABLE `creditcards`
  ADD CONSTRAINT `C_Patientid_FK` FOREIGN KEY (`Patient_id`) REFERENCES `patientmanagement` (`Patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctormanagement`
--
ALTER TABLE `doctormanagement`
  ADD CONSTRAINT `D_Hospital_id_FK` FOREIGN KEY (`Hospital_id`) REFERENCES `hospitalmanagement` (`Hospital_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `D_specialization_FK` FOREIGN KEY (`Specialization`) REFERENCES `specialization` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paymentmanagement`
--
ALTER TABLE `paymentmanagement`
  ADD CONSTRAINT `P_Appointment_FK` FOREIGN KEY (`Appointment_id`) REFERENCES `appointmentmanagement` (`appointment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `P_Cardid_FK` FOREIGN KEY (`Card_id`) REFERENCES `creditcards` (`Card_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `P_Doctorid_FK` FOREIGN KEY (`Doctor_id`) REFERENCES `doctormanagement` (`Doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `P_Hospitalid_FK` FOREIGN KEY (`Hospital_id`) REFERENCES `hospitalmanagement` (`Hospital_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `P_Patientid_FK` FOREIGN KEY (`Patient_id`) REFERENCES `patientmanagement` (`Patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
