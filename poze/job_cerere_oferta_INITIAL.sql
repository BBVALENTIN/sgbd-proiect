-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2025 at 09:34 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `job_cerere_oferta`
--

-- --------------------------------------------------------

--
-- Table structure for table `aplicanti`
--

CREATE TABLE `aplicanti` (
  `id_aplicant` int(11) NOT NULL,
  `nume` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefon` varchar(50) DEFAULT NULL,
  `oras` varchar(255) DEFAULT NULL,
  `cv_link` varchar(255) DEFAULT NULL,
  `CNP` varchar(13) DEFAULT NULL,
  `prenume` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aplicanti`
--

INSERT INTO `aplicanti` (`id_aplicant`, `nume`, `email`, `telefon`, `oras`, `cv_link`, `CNP`, `prenume`) VALUES
(1, 'Ion', 'ion.popescu@mail.com', '0756789012', 'București', NULL, '5040809297249', 'Popescu'),
(2, 'Ionescu', 'maria.ionescu@mail.com', '0767890123', 'Cluj-Napoca', NULL, '5010101123456', 'Ion'),
(3, 'George', 'george.vasile@mail.com', '0745678901', 'Timișoara', NULL, '2670918785632', 'Mihai');

-- --------------------------------------------------------

--
-- Table structure for table `aplicanti_categorii`
--

CREATE TABLE `aplicanti_categorii` (
  `id_aplicant` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categorii`
--

CREATE TABLE `categorii` (
  `id_categorie` int(11) NOT NULL,
  `nume` varchar(255) NOT NULL,
  `descriere` text DEFAULT NULL,
  `locuri_valabile` int(11) DEFAULT NULL,
  `modern` enum('Nou','Relativ-nou','Vechi') DEFAULT NULL,
  `privilegiat` enum('da','nu') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categorii`
--

INSERT INTO `categorii` (`id_categorie`, `nume`, `descriere`, `locuri_valabile`, `modern`, `privilegiat`) VALUES
(1, 'IT', 'Joburi din domeniul tehnologiei și programării', 13, 'Nou', 'da'),
(2, 'Marketing', 'Joburi din domeniul marketingului și promovării', 3, 'Relativ-nou', 'nu'),
(3, 'Vânzări', 'Joburi din domeniul vânzărilor și relațiilor cu clienții', 67, 'Vechi', 'nu'),
(4, 'Resurse Umane', 'Joburi din domeniul resurselor umane și recrutării', 90, 'Vechi', 'da');

-- --------------------------------------------------------

--
-- Table structure for table `companii`
--

CREATE TABLE `companii` (
  `id_companie` int(11) NOT NULL,
  `nume` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefon` varchar(50) DEFAULT NULL,
  `locatie` varchar(255) DEFAULT NULL,
  `vechime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `companii`
--

INSERT INTO `companii` (`id_companie`, `nume`, `email`, `telefon`, `locatie`, `vechime`) VALUES
(1, 'TechSolutions', 'contact@techsolutions.com', '0723456789', 'București', 5),
(2, 'InnoGroup', 'info@innogroup.ro', '0734123456', 'Cluj-Napoca', 2),
(3, 'GlobalSoft', 'support@globalsoft.com', '0745123456', 'Timișoara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `competente`
--

CREATE TABLE `competente` (
  `id_competenta` int(11) NOT NULL,
  `nivel_competenta` varchar(255) NOT NULL,
  `ani_experienta` int(11) DEFAULT NULL,
  `nivel_studii` enum('facultate','liceu') DEFAULT NULL,
  `nume_competenta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `competente`
--

INSERT INTO `competente` (`id_competenta`, `nivel_competenta`, `ani_experienta`, `nivel_studii`, `nume_competenta`) VALUES
(1, 'PHP Development', 3, 'facultate', 'PHP'),
(2, 'Marketing Digital', 1, 'liceu', 'Vânzări - Digitale'),
(3, 'Vânzări B2B', 9, 'facultate', 'Vânzări'),
(4, 'Recrutare Personal', 2, 'liceu', 'HR'),
(5, 'Avansat', 5, 'facultate', 'PHP'),
(6, 'Intermediar', 3, 'liceu', 'SQL'),
(7, 'Începător', 1, 'facultate', 'JavaScript');

-- --------------------------------------------------------

--
-- Table structure for table `competente_aplicanti`
--

CREATE TABLE `competente_aplicanti` (
  `id_aplicant` int(11) NOT NULL,
  `id_competenta` int(11) NOT NULL,
  `certificare` enum('da','nu') DEFAULT 'nu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `competente_aplicanti`
--

INSERT INTO `competente_aplicanti` (`id_aplicant`, `id_competenta`, `certificare`) VALUES
(1, 1, 'da'),
(2, 2, 'nu'),
(3, 3, 'nu');

-- --------------------------------------------------------

--
-- Table structure for table `competente_cerute`
--

CREATE TABLE `competente_cerute` (
  `id_job` int(11) NOT NULL,
  `id_competenta` int(11) NOT NULL,
  `tip_job` enum('full-time','part-time','internship') DEFAULT 'full-time',
  `prioritate` enum('important','opțional') DEFAULT 'opțional'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `competente_cerute`
--

INSERT INTO `competente_cerute` (`id_job`, `id_competenta`, `tip_job`, `prioritate`) VALUES
(1, 1, 'part-time', 'important'),
(2, 2, 'full-time', 'opțional'),
(3, 3, 'full-time', 'opțional');

-- --------------------------------------------------------

--
-- Table structure for table `contracte`
--

CREATE TABLE `contracte` (
  `id_contract` int(11) NOT NULL,
  `id_job` int(11) DEFAULT NULL,
  `salariu` decimal(10,2) DEFAULT NULL,
  `data_inceput` date DEFAULT NULL,
  `data_sfarsit` date DEFAULT NULL,
  `tip_salariu` enum('fix','fluctuant') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contracte`
--

INSERT INTO `contracte` (`id_contract`, `id_job`, `salariu`, `data_inceput`, `data_sfarsit`, `tip_salariu`) VALUES
(1, 1, '3000.00', '2025-02-01', '2025-12-31', 'fix'),
(2, 2, '3500.00', '2025-03-01', '2025-11-30', 'fluctuant'),
(3, 3, '4000.00', '2025-01-15', '2025-12-31', 'fix');

-- --------------------------------------------------------

--
-- Table structure for table `joburi`
--

CREATE TABLE `joburi` (
  `id_job` int(11) NOT NULL,
  `titlu` varchar(255) NOT NULL,
  `descriere` text DEFAULT NULL,
  `id_companie` int(11) DEFAULT NULL,
  `status` enum('activ','inactiv') DEFAULT 'activ',
  `departament` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `joburi`
--

INSERT INTO `joburi` (`id_job`, `titlu`, `descriere`, `id_companie`, `status`, `departament`) VALUES
(1, 'Programator PHP', 'Căutăm un programator PHP cu experiență.', 1, 'activ', 'IT'),
(2, 'Specialist Marketing Digital', 'Căutăm un specialist în marketing digital pentru promovare online.', 2, 'inactiv', 'Marketing'),
(3, 'Manager Vânzări', 'Căutăm un manager pentru echipa de vânzări.', 3, 'activ', 'Vănzări');

-- --------------------------------------------------------

--
-- Table structure for table `joburi_categorii`
--

CREATE TABLE `joburi_categorii` (
  `id_job` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aplicanti`
--
ALTER TABLE `aplicanti`
  ADD PRIMARY KEY (`id_aplicant`);

--
-- Indexes for table `aplicanti_categorii`
--
ALTER TABLE `aplicanti_categorii`
  ADD PRIMARY KEY (`id_aplicant`,`id_categorie`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Indexes for table `categorii`
--
ALTER TABLE `categorii`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Indexes for table `companii`
--
ALTER TABLE `companii`
  ADD PRIMARY KEY (`id_companie`);

--
-- Indexes for table `competente`
--
ALTER TABLE `competente`
  ADD PRIMARY KEY (`id_competenta`);

--
-- Indexes for table `competente_aplicanti`
--
ALTER TABLE `competente_aplicanti`
  ADD PRIMARY KEY (`id_aplicant`,`id_competenta`),
  ADD KEY `fk_competente_aplicanti` (`id_competenta`);

--
-- Indexes for table `competente_cerute`
--
ALTER TABLE `competente_cerute`
  ADD PRIMARY KEY (`id_job`,`id_competenta`),
  ADD KEY `fk_competente_cerute` (`id_competenta`);

--
-- Indexes for table `contracte`
--
ALTER TABLE `contracte`
  ADD PRIMARY KEY (`id_contract`),
  ADD KEY `id_job` (`id_job`);

--
-- Indexes for table `joburi`
--
ALTER TABLE `joburi`
  ADD PRIMARY KEY (`id_job`),
  ADD KEY `fk_joburi_companii` (`id_companie`);

--
-- Indexes for table `joburi_categorii`
--
ALTER TABLE `joburi_categorii`
  ADD PRIMARY KEY (`id_job`,`id_categorie`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aplicanti`
--
ALTER TABLE `aplicanti`
  MODIFY `id_aplicant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categorii`
--
ALTER TABLE `categorii`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `companii`
--
ALTER TABLE `companii`
  MODIFY `id_companie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `competente`
--
ALTER TABLE `competente`
  MODIFY `id_competenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contracte`
--
ALTER TABLE `contracte`
  MODIFY `id_contract` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `joburi`
--
ALTER TABLE `joburi`
  MODIFY `id_job` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aplicanti_categorii`
--
ALTER TABLE `aplicanti_categorii`
  ADD CONSTRAINT `aplicanti_categorii_ibfk_1` FOREIGN KEY (`id_aplicant`) REFERENCES `aplicanti` (`id_aplicant`) ON DELETE CASCADE,
  ADD CONSTRAINT `aplicanti_categorii_ibfk_2` FOREIGN KEY (`id_categorie`) REFERENCES `categorii` (`id_categorie`) ON DELETE CASCADE;

--
-- Constraints for table `competente_aplicanti`
--
ALTER TABLE `competente_aplicanti`
  ADD CONSTRAINT `competente_aplicanti_ibfk_1` FOREIGN KEY (`id_aplicant`) REFERENCES `aplicanti` (`id_aplicant`) ON DELETE CASCADE,
  ADD CONSTRAINT `competente_aplicanti_ibfk_2` FOREIGN KEY (`id_competenta`) REFERENCES `competente` (`id_competenta`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_competente_aplicanti` FOREIGN KEY (`id_competenta`) REFERENCES `competente` (`id_competenta`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_competente_aplicanti_aplicanti` FOREIGN KEY (`id_aplicant`) REFERENCES `aplicanti` (`id_aplicant`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_competente_aplicanti_competente` FOREIGN KEY (`id_competenta`) REFERENCES `competente` (`id_competenta`) ON DELETE CASCADE;

--
-- Constraints for table `competente_cerute`
--
ALTER TABLE `competente_cerute`
  ADD CONSTRAINT `competente_cerute_ibfk_1` FOREIGN KEY (`id_job`) REFERENCES `joburi` (`id_job`) ON DELETE CASCADE,
  ADD CONSTRAINT `competente_cerute_ibfk_2` FOREIGN KEY (`id_competenta`) REFERENCES `competente` (`id_competenta`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_competente_cerute` FOREIGN KEY (`id_competenta`) REFERENCES `competente` (`id_competenta`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_competente_cerute_competente` FOREIGN KEY (`id_competenta`) REFERENCES `competente` (`id_competenta`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_competente_cerute_joburi` FOREIGN KEY (`id_job`) REFERENCES `joburi` (`id_job`) ON DELETE CASCADE;

--
-- Constraints for table `contracte`
--
ALTER TABLE `contracte`
  ADD CONSTRAINT `contracte_ibfk_1` FOREIGN KEY (`id_job`) REFERENCES `joburi` (`id_job`) ON DELETE CASCADE;

--
-- Constraints for table `joburi`
--
ALTER TABLE `joburi`
  ADD CONSTRAINT `fk_joburi_companii` FOREIGN KEY (`id_companie`) REFERENCES `companii` (`id_companie`) ON DELETE CASCADE,
  ADD CONSTRAINT `joburi_ibfk_1` FOREIGN KEY (`id_companie`) REFERENCES `companii` (`id_companie`) ON DELETE CASCADE;

--
-- Constraints for table `joburi_categorii`
--
ALTER TABLE `joburi_categorii`
  ADD CONSTRAINT `joburi_categorii_ibfk_1` FOREIGN KEY (`id_job`) REFERENCES `joburi` (`id_job`) ON DELETE CASCADE,
  ADD CONSTRAINT `joburi_categorii_ibfk_2` FOREIGN KEY (`id_categorie`) REFERENCES `categorii` (`id_categorie`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
