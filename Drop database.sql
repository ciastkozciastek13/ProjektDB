-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 11 Sty 2019, 19:33
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

--
-- Zrzut danych tabeli `Etat`
--

INSERT INTO `Etat` (`ID_Etat`, `STANOWISKO`) VALUES
(1001, 'Kadry'),
(1102, 'Magazynier'),
(1103, 'Operator Maszyny');

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

--
-- Zrzut danych tabeli `Konta_Pracowników`
--

INSERT INTO `Konta_Pracowników` (`ID_KontaUżytkowników`, `ID_Pracownik`, `Login`, `Hasło`) VALUES
(3, 1000, 'mkowalska', 'mkowalska'),
(4, 1010, 'mzdam', 'mzdam'),
(5, 1020, 'pbazy', 'pbazy'),
(6, 1030, 'tdanych', 'tdanych'),
(7, 1040, 'pwierze', 'pwierze'),
(8, 1050, 'wzalicze', 'wzalicze'),
(9, 1060, 'mstudia', 'mstudia'),
(10, 1070, 'ksesje', 'ksesje'),
(11, 1080, 'anowak', 'anowak');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Magazyn`
--

CREATE TABLE `Magazyn` (
  `ID_Magazynu` int(8) NOT NULL,
  `Nazwa` varchar(32) COLLATE utf32_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Zrzut danych tabeli `Magazyn`
--

INSERT INTO `Magazyn` (`ID_Magazynu`, `Nazwa`) VALUES
(11001, 'Magazyn1'),
(11002, 'Magazyn2'),
(11003, 'Magazyn3');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Maszyna`
--

CREATE TABLE `Maszyna` (
  `ID_Maszyny` int(8) NOT NULL,
  `Nazwa_maszyny` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `Maszyna`
--

INSERT INTO `Maszyna` (`ID_Maszyny`, `Nazwa_maszyny`) VALUES
(10001, 'Maszyna1'),
(10002, 'Maszyna2'),
(10003, 'Maszyna3');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Pracownik`
--

CREATE TABLE `Pracownik` (
  `ID_Pracownik` int(8) NOT NULL,
  `ID_Etat` int(8) NOT NULL,
  `ID_Magazynu` int(8) DEFAULT NULL,
  `ID_Maszyny` int(8) DEFAULT NULL,
  `Imie` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL,
  `Nazwisko` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL,
  `Data Ur` date NOT NULL,
  `Płeć` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL,
  `Konto` varchar(32) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `Pracownik`
--

INSERT INTO `Pracownik` (`ID_Pracownik`, `ID_Etat`, `ID_Magazynu`, `ID_Maszyny`, `Imie`, `Nazwisko`, `Data Ur`, `Płeć`, `Konto`) VALUES
(1000, 1001, NULL, NULL, 'Mariola', 'Kowalska', '1990-09-10', 'Kobieta', 'mkowalska'),
(1010, 1001, NULL, NULL, 'Marysia', 'Zdam', '1985-02-22', 'Kobieta', 'mzdam'),
(1020, 1001, NULL, NULL, 'Paulina', 'Bazy', '1967-06-22', 'Kobieta', 'pbazy'),
(1030, 1103, NULL, 10001, 'Tomasz', 'Danych', '1989-12-12', 'Kobieta', 'tdanych'),
(1040, 1103, NULL, 10002, 'Piotr', 'Wierze', '1994-12-26', 'Mężczyzna', 'pwierze'),
(1050, 1102, 11001, NULL, 'Witold', 'Zalicze', '1971-09-29', 'Mężczyzna', 'wzalicze'),
(1060, 1102, 11002, NULL, 'Mirek', 'Studia', '1981-01-05', 'Mężczyzna', 'mstudia'),
(1070, 1102, 11003, NULL, 'Konrad', 'Sesje', '1992-11-07', 'Mężczyzna', 'ksesje'),
(1080, 1103, NULL, 10003, 'Arek', 'Nowak', '1977-05-30', 'Mężczyzna', 'anowak');

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

--
-- Zrzut danych tabeli `Produkt`
--

INSERT INTO `Produkt` (`ID_Produktu`, `ID_Schematu`, `ID_Magazynu`, `Cena`, `Opis`, `Waga`) VALUES
(1, 771, 11001, 25.5, 'Produkt 1', 20),
(2, 772, 11002, 50, 'Produkt 2', 14),
(17, 773, 11003, 300, 'Produkt 3', 95),
(18, 774, 11002, 165, 'Produkt 4', 100),
(19, 775, 11002, 99.99, 'Produkt 5', 18),
(20, 776, 11003, 47.99, 'Produkt 6', 37),
(21, 777, 11001, 19.75, 'Produkt 7', 15),
(22, 778, 11002, 79.99, 'Produkt 8', 27),
(23, 779, 11001, 124.29, 'Produkt 9', 33);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Półfabrykat`
--

CREATE TABLE `Półfabrykat` (
  `ID_Półfabrykatu` int(8) NOT NULL,
  `Ilość_sztuk` int(8) DEFAULT NULL,
  `Waga w kg` double DEFAULT NULL,
  `Opis` varchar(32) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `Półfabrykat`
--

INSERT INTO `Półfabrykat` (`ID_Półfabrykatu`, `Ilość_sztuk`, `Waga w kg`, `Opis`) VALUES
(661, 1, NULL, 'Półfabrykat pierwszy 1 sztuka'),
(662, NULL, 2, 'Półfabrykat drugi 2 kg'),
(663, 1, NULL, 'Półfabrykat trzeci 1 sztuka'),
(664, NULL, 5, 'Półfabrykat czwarty 5kg'),
(665, 3, NULL, 'Półfabrykat piąty 3 sztuki'),
(666, NULL, 10, 'Półfabrykat szósty 10 kg'),
(667, NULL, 20, 'Półfabrykat siódmy 20 kg'),
(668, NULL, 2.5, 'Półfabrykat ósmy 2.5 kg'),
(669, 2, NULL, 'Półfabrykat dziewiąty 2 sztuki');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Schemat`
--

CREATE TABLE `Schemat` (
  `ID_Schematu` int(8) NOT NULL,
  `ID_Maszyny` int(8) NOT NULL,
  `ID_Półfabrykatu1` int(8) NOT NULL,
  `ID_Pólfabrykatu2` int(11) NOT NULL,
  `ID_Pólfabrykatu3` int(11) NOT NULL,
  `ID_Półfabrykatu4` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `Schemat`
--

INSERT INTO `Schemat` (`ID_Schematu`, `ID_Maszyny`, `ID_Półfabrykatu1`, `ID_Pólfabrykatu2`, `ID_Pólfabrykatu3`, `ID_Półfabrykatu4`) VALUES
(771, 10001, 662, 669, 664, 661),
(772, 10001, 668, 668, 664, 662),
(773, 10002, 667, 664, 662, 663),
(774, 10003, 664, 663, 663, 667),
(775, 10002, 669, 662, 661, 665),
(776, 10002, 661, 665, 669, 666),
(777, 10003, 667, 666, 668, 661),
(778, 10001, 662, 664, 667, 668),
(779, 10003, 661, 667, 664, 669);

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
  ADD KEY `ID_Maszyny` (`ID_Maszyny`),
  ADD KEY `Konto` (`Konto`);

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
  ADD KEY `Sche-Pół` (`ID_Półfabrykatu1`),
  ADD KEY `Sche-Maszyna` (`ID_Maszyny`),
  ADD KEY `ID_Pólfabrykatu2` (`ID_Pólfabrykatu2`),
  ADD KEY `ID_Pólfabrykatu3` (`ID_Pólfabrykatu3`),
  ADD KEY `ID_Półfabrykatu4` (`ID_Półfabrykatu4`);

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
  MODIFY `ID_Etat` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1104;

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
  MODIFY `ID_KontaUżytkowników` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `Magazyn`
--
ALTER TABLE `Magazyn`
  MODIFY `ID_Magazynu` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11004;

--
-- AUTO_INCREMENT dla tabeli `Maszyna`
--
ALTER TABLE `Maszyna`
  MODIFY `ID_Maszyny` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10004;

--
-- AUTO_INCREMENT dla tabeli `Pracownik`
--
ALTER TABLE `Pracownik`
  MODIFY `ID_Pracownik` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1081;

--
-- AUTO_INCREMENT dla tabeli `Produkt`
--
ALTER TABLE `Produkt`
  MODIFY `ID_Produktu` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT dla tabeli `Półfabrykat`
--
ALTER TABLE `Półfabrykat`
  MODIFY `ID_Półfabrykatu` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=670;

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
  ADD CONSTRAINT `Sche-Pół` FOREIGN KEY (`ID_Półfabrykatu1`) REFERENCES `Półfabrykat` (`ID_Półfabrykatu`),
  ADD CONSTRAINT `Schemat_ibfk_1` FOREIGN KEY (`ID_Pólfabrykatu2`) REFERENCES `Półfabrykat` (`ID_Półfabrykatu`),
  ADD CONSTRAINT `Schemat_ibfk_2` FOREIGN KEY (`ID_Pólfabrykatu3`) REFERENCES `Półfabrykat` (`ID_Półfabrykatu`),
  ADD CONSTRAINT `Schemat_ibfk_3` FOREIGN KEY (`ID_Półfabrykatu4`) REFERENCES `Półfabrykat` (`ID_Półfabrykatu`);

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
