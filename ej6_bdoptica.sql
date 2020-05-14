-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 11, 2020 alle 17:34
-- Versione del server: 10.4.11-MariaDB
-- Versione PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bdoptica`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `street_adress` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `data_registro` date NOT NULL,
  `racommended_by` varchar(50) DEFAULT NULL,
  `glassed_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `employee`
--

INSERT INTO `employee` (`id`, `first_name`, `last_name`) VALUES
(1, 'Fergus', 'Michie'),
(2, 'Francene', 'Lundy'),
(3, 'Ciro', 'Guillond'),
(4, 'Raynard', 'Swyndley'),
(5, 'Margit', 'Longbone');

-- --------------------------------------------------------

--
-- Struttura della tabella `glasses`
--

CREATE TABLE `glasses` (
  `id` int(11) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `graduation_r` varchar(5) NOT NULL,
  `graduation_l` varchar(5) NOT NULL,
  `frame_type` varchar(50) NOT NULL,
  `frame_color` varchar(50) NOT NULL,
  `glass_color_r` varchar(50) NOT NULL,
  `glass_color_l` varchar(50) NOT NULL,
  `price` decimal(19,2) NOT NULL,
  `providers_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `glasses`
--

INSERT INTO `glasses` (`id`, `brand`, `graduation_r`, `graduation_l`, `frame_type`, `frame_color`, `glass_color_r`, `glass_color_l`, `price`, `providers_id`) VALUES
(1, 'Ray-Ban', '0.0', '0.5', 'Metal', 'Oro', 'Green', 'Green', '145.00', 1),
(2, 'Gucci', '0.2', '0.2', 'Paste', 'Black', 'Gray', 'Gray', '250.00', 2),
(3, 'Calvin Klein', '0.0', '0.0', 'Metal', 'Silver', 'White', 'White', '86.00', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `providers`
--

CREATE TABLE `providers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `street_name` varchar(50) NOT NULL,
  `street_number` varchar(50) NOT NULL,
  `floor` int(11) NOT NULL,
  `door` varchar(20) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `nif` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `providers`
--

INSERT INTO `providers` (`id`, `name`, `street_name`, `street_number`, `floor`, `door`, `city`, `postal_code`, `country`, `phone_number`, `fax`, `nif`) VALUES
(1, 'Darill Goodwill', 'Erie', '175', 7, '2O', 'Lleida', '25193', 'Spain', '9463354534', '(740) 4149352', '469466512-X'),
(2, 'Rickey Denton', 'Gina', '41', 59, '0x', 'Vigo', '36205', 'Spain', '4546904864', '(918) 3312585', '052064343-B');

-- --------------------------------------------------------

--
-- Struttura della tabella `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `glassed_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `glasses`
--
ALTER TABLE `glasses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `providers_id` (`providers_id`);

--
-- Indici per le tabelle `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_id` (`customers_id`,`employee_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `glassed_id` (`glassed_id`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `glasses`
--
ALTER TABLE `glasses`
  ADD CONSTRAINT `glasses_ibfk_1` FOREIGN KEY (`providers_id`) REFERENCES `providers` (`id`);

--
-- Limiti per la tabella `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`glassed_id`) REFERENCES `glasses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
