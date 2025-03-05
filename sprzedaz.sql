-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2025 at 02:14 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sprzedaz`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id` int(11) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `miasto` varchar(50) DEFAULT NULL,
  `data_rejestracji` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`id`, `imie`, `nazwisko`, `email`, `telefon`, `miasto`, `data_rejestracji`) VALUES
(1, 'Jan', 'Kowalski', 'jan.kowalski@example.com', '123456789', 'Warszawa', '2025-03-05'),
(2, 'Anna', 'Nowak', 'anna.nowak@example.com', '987654321', 'Kraków', '2025-03-05'),
(3, 'Piotr', 'Zieliński', 'piotr.zielinski@example.com', '555666777', 'Gdańsk', '2025-03-05');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty`
--

CREATE TABLE `produkty` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(100) NOT NULL,
  `kategoria` varchar(50) DEFAULT NULL,
  `cena` decimal(10,2) NOT NULL,
  `stan_magazynowy` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produkty`
--

INSERT INTO `produkty` (`id`, `nazwa`, `kategoria`, `cena`, `stan_magazynowy`) VALUES
(1, 'Laptop Lenovo', 'Elektronika', 3500.00, 10),
(2, 'Smartfon Samsung', 'Elektronika', 2500.00, 15),
(3, 'Monitor LG 24\"', 'Akcesoria', 800.00, 8),
(4, 'Klawiatura mechaniczna', 'Akcesoria', 250.00, 20),
(5, 'Mysz gamingowa', 'Akcesoria', 150.00, 30);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id` int(11) NOT NULL,
  `klient_id` int(11) DEFAULT NULL,
  `data_zamowienia` datetime DEFAULT current_timestamp(),
  `status` enum('Nowe','W realizacji','Wysłane','Dostarczone','Anulowane') DEFAULT 'Nowe'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zamowienia`
--

INSERT INTO `zamowienia` (`id`, `klient_id`, `data_zamowienia`, `status`) VALUES
(1, 1, '2025-03-05 01:01:50', 'Wysłane'),
(2, 2, '2025-03-05 01:01:50', 'W realizacji'),
(3, 3, '2025-03-05 01:01:50', 'Nowe');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia_szczegoly`
--

CREATE TABLE `zamowienia_szczegoly` (
  `id` int(11) NOT NULL,
  `zamowienie_id` int(11) DEFAULT NULL,
  `produkt_id` int(11) DEFAULT NULL,
  `ilosc` int(11) NOT NULL,
  `cena_jednostkowa` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `zamowienia_szczegoly`
--

INSERT INTO `zamowienia_szczegoly` (`id`, `zamowienie_id`, `produkt_id`, `ilosc`, `cena_jednostkowa`) VALUES
(1, 1, 1, 1, 3500.00),
(2, 1, 3, 2, 800.00),
(3, 2, 2, 1, 2500.00),
(4, 3, 4, 1, 250.00),
(5, 3, 5, 2, 150.00);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeksy dla tabeli `produkty`
--
ALTER TABLE `produkty`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `klient_id` (`klient_id`);

--
-- Indeksy dla tabeli `zamowienia_szczegoly`
--
ALTER TABLE `zamowienia_szczegoly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zamowienie_id` (`zamowienie_id`),
  ADD KEY `produkt_id` (`produkt_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `produkty`
--
ALTER TABLE `produkty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `zamowienia_szczegoly`
--
ALTER TABLE `zamowienia_szczegoly`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `zamowienia_ibfk_1` FOREIGN KEY (`klient_id`) REFERENCES `klienci` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `zamowienia_szczegoly`
--
ALTER TABLE `zamowienia_szczegoly`
  ADD CONSTRAINT `zamowienia_szczegoly_ibfk_1` FOREIGN KEY (`zamowienie_id`) REFERENCES `zamowienia` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `zamowienia_szczegoly_ibfk_2` FOREIGN KEY (`produkt_id`) REFERENCES `produkty` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
