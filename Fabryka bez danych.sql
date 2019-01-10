-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 10 Sty 2019, 22:21
-- Wersja serwera: 5.7.24-0ubuntu0.18.04.1
-- Wersja PHP: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `Fabryka`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Etat`
--

CREATE TABLE `Etat` (
  `ID_Etat` int(8) NOT NULL,
  `STANOWISKO` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Klient`
--

CREATE TABLE `Klient` (
  `ID_Klienta` int(8) NOT NULL,
  `Imie` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL,
  `Nazwisko` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL,
  `Firma` varchar(32) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `Ulica` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL,
  `Kod` varchar(6) COLLATE utf8mb4_polish_ci NOT NULL,
  `Miasto` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci COMMENT='Dane Klientów ';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Konta_Klientów`
--

CREATE TABLE `Konta_Klientów` (
  `ID_KontaKlientów` int(8) NOT NULL,
  `ID_Klienta` int(8) NOT NULL,
  `Login` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL,
  `Hasło` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Konta_Pracowników`
--

CREATE TABLE `Konta_Pracowników` (
  `ID_KontaUżytkowników` int(8) NOT NULL,
  `ID_Pracownik` int(8) NOT NULL,
  `Login` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL,
  `Hasło` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Magazyn`
--

CREATE TABLE `Magazyn` (
  `ID_Magazynu` int(8) NOT NULL,
  `Nazwa` varchar(32) COLLATE utf32_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Maszyna`
--

CREATE TABLE `Maszyna` (
  `ID_Maszyny` int(8) NOT NULL,
  `Nazwa_maszyny` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Pracownik`
--

CREATE TABLE `Pracownik` (
  `ID_Pracownik` int(8) NOT NULL,
  `ID_Etat` int(8) NOT NULL,
  `ID_Magazynu` int(8) NOT NULL,
  `ID_Maszyny` int(8) NOT NULL,
  `Imie` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL,
  `Nazwisko` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL,
  `Data Ur` date NOT NULL,
  `Płeć` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL,
  `Konto` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Produkt`
--

CREATE TABLE `Produkt` (
  `ID_Produktu` int(8) NOT NULL,
  `ID_Schematu` int(8) NOT NULL,
  `ID_Magazynu` int(8) NOT NULL,
  `Cena` double NOT NULL,
  `Opis` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL,
  `Waga` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Półfabrykat`
--

CREATE TABLE `Półfabrykat` (
  `ID_Półfabrykatu` int(8) NOT NULL,
  `Ilość_sztuk` int(8) NOT NULL,
  `Waga w kg` double NOT NULL,
  `Opis` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Schemat`
--

CREATE TABLE `Schemat` (
  `ID_Schematu` int(8) NOT NULL,
  `ID_Maszyny` int(8) NOT NULL,
  `ID_Półfabrykatu` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Zamówienie`
--

CREATE TABLE `Zamówienie` (
  `ID_Zamówienia` int(8) NOT NULL,
  `ID_Klienta` int(8) NOT NULL,
  `ID_Produktu` int(8) NOT NULL,
  `Opis` varchar(32) COLLATE utf8mb4_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `Etat`
--
ALTER TABLE `Etat`
  ADD PRIMARY KEY (`ID_Etat`);
ALTER TABLE `Etat` ADD FULLTEXT KEY `STANOWISKO` (`STANOWISKO`);

--
-- Indeksy dla tabeli `Klient`
--
ALTER TABLE `Klient`
  ADD PRIMARY KEY (`ID_Klienta`);

--
-- Indeksy dla tabeli `Konta_Klientów`
--
ALTER TABLE `Konta_Klientów`
  ADD PRIMARY KEY (`ID_KontaKlientów`),
  ADD KEY `KK-Klient` (`ID_Klienta`);

--
-- Indeksy dla tabeli `Konta_Pracowników`
--
ALTER TABLE `Konta_Pracowników`
  ADD PRIMARY KEY (`ID_KontaUżytkowników`),
  ADD KEY `KP-Prac` (`ID_Pracownik`);

--
-- Indeksy dla tabeli `Magazyn`
--
ALTER TABLE `Magazyn`
  ADD PRIMARY KEY (`ID_Magazynu`);

--
-- Indeksy dla tabeli `Maszyna`
--
ALTER TABLE `Maszyna`
  ADD PRIMARY KEY (`ID_Maszyny`);

--
-- Indeksy dla tabeli `Pracownik`
--
ALTER TABLE `Pracownik`
  ADD PRIMARY KEY (`ID_Pracownik`),
  ADD KEY `ID_Etat` (`ID_Etat`),
  ADD KEY `ID_Magazynu` (`ID_Magazynu`),
  ADD KEY `ID_Maszyny` (`ID_Maszyny`);

--
-- Indeksy dla tabeli `Produkt`
--
ALTER TABLE `Produkt`
  ADD PRIMARY KEY (`ID_Produktu`),
  ADD KEY `Pro-Schem` (`ID_Schematu`),
  ADD KEY `Pro-Mag` (`ID_Magazynu`);

--
-- Indeksy dla tabeli `Półfabrykat`
--
ALTER TABLE `Półfabrykat`
  ADD PRIMARY KEY (`ID_Półfabrykatu`);

--
-- Indeksy dla tabeli `Schemat`
--
ALTER TABLE `Schemat`
  ADD PRIMARY KEY (`ID_Schematu`),
  ADD KEY `Sche-Pół` (`ID_Półfabrykatu`),
  ADD KEY `Sche-Maszyna` (`ID_Maszyny`);

--
-- Indeksy dla tabeli `Zamówienie`
--
ALTER TABLE `Zamówienie`
  ADD PRIMARY KEY (`ID_Zamówienia`),
  ADD KEY `Zam-klient` (`ID_Klienta`),
  ADD KEY `Zam-produkt` (`ID_Produktu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `Etat`
--
ALTER TABLE `Etat`
  MODIFY `ID_Etat` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `Klient`
--
ALTER TABLE `Klient`
  MODIFY `ID_Klienta` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `Konta_Klientów`
--
ALTER TABLE `Konta_Klientów`
  MODIFY `ID_KontaKlientów` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `Konta_Pracowników`
--
ALTER TABLE `Konta_Pracowników`
  MODIFY `ID_KontaUżytkowników` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `Magazyn`
--
ALTER TABLE `Magazyn`
  MODIFY `ID_Magazynu` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `Maszyna`
--
ALTER TABLE `Maszyna`
  MODIFY `ID_Maszyny` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `Pracownik`
--
ALTER TABLE `Pracownik`
  MODIFY `ID_Pracownik` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `Produkt`
--
ALTER TABLE `Produkt`
  MODIFY `ID_Produktu` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `Półfabrykat`
--
ALTER TABLE `Półfabrykat`
  MODIFY `ID_Półfabrykatu` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `Zamówienie`
--
ALTER TABLE `Zamówienie`
  MODIFY `ID_Zamówienia` int(8) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `Konta_Klientów`
--
ALTER TABLE `Konta_Klientów`
  ADD CONSTRAINT `KK-Klient` FOREIGN KEY (`ID_Klienta`) REFERENCES `Klient` (`ID_Klienta`);

--
-- Ograniczenia dla tabeli `Konta_Pracowników`
--
ALTER TABLE `Konta_Pracowników`
  ADD CONSTRAINT `KP-Prac` FOREIGN KEY (`ID_Pracownik`) REFERENCES `Pracownik` (`ID_Pracownik`);

--
-- Ograniczenia dla tabeli `Pracownik`
--
ALTER TABLE `Pracownik`
  ADD CONSTRAINT `Pracownik_ibfk_1` FOREIGN KEY (`ID_Etat`) REFERENCES `Etat` (`ID_Etat`),
  ADD CONSTRAINT `Pracownik_ibfk_2` FOREIGN KEY (`ID_Magazynu`) REFERENCES `Magazyn` (`ID_Magazynu`),
  ADD CONSTRAINT `Pracownik_ibfk_3` FOREIGN KEY (`ID_Maszyny`) REFERENCES `Maszyna` (`ID_Maszyny`);

--
-- Ograniczenia dla tabeli `Produkt`
--
ALTER TABLE `Produkt`
  ADD CONSTRAINT `Pro-Mag` FOREIGN KEY (`ID_Magazynu`) REFERENCES `Magazyn` (`ID_Magazynu`),
  ADD CONSTRAINT `Pro-Schem` FOREIGN KEY (`ID_Schematu`) REFERENCES `Schemat` (`ID_Schematu`);

--
-- Ograniczenia dla tabeli `Schemat`
--
ALTER TABLE `Schemat`
  ADD CONSTRAINT `Sche-Maszyna` FOREIGN KEY (`ID_Maszyny`) REFERENCES `Maszyna` (`ID_Maszyny`),
  ADD CONSTRAINT `Sche-Pół` FOREIGN KEY (`ID_Półfabrykatu`) REFERENCES `Półfabrykat` (`ID_Półfabrykatu`);

--
-- Ograniczenia dla tabeli `Zamówienie`
--
ALTER TABLE `Zamówienie`
  ADD CONSTRAINT `Zam-klient` FOREIGN KEY (`ID_Klienta`) REFERENCES `Klient` (`ID_Klienta`),
  ADD CONSTRAINT `Zam-produkt` FOREIGN KEY (`ID_Produktu`) REFERENCES `Produkt` (`ID_Produktu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
