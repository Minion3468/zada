-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 19 Kwi 2023, 15:18
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cms`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `filename` char(96) NOT NULL,
  `nazwa` text NOT NULL,
  `userId` int(11) NOT NULL,
  `removed` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `post`
--

INSERT INTO `post` (`id`, `timestamp`, `filename`, `nazwa`, `userId`, `removed`) VALUES
(1, '2023-03-01 13:55:56', '05348d810bbdd2c4bfb37feefe5fbb0a4dbffd33b38b518b25841e73eac1af66', '', 1, 0),
(12, '2023-03-15 15:05:18', '5605eb8a99e9841c8767bf1b88d077ac4a4dabb09d139cd8bf9190f156d99d8e', '', 1, 0),
(13, '2023-03-15 15:08:13', 'ee8025ad1c3a32b1aff0dcfcdc3608c13f6589402d338f808b9fec012ec68d02', '', 1, 0),
(14, '2023-03-15 15:10:09', 'img/664e3bcee3dc6f88490f65b189a6687bb2231bafbaf3e43f0313b984bd44d978.webp', '', 1, 0),
(15, '2023-03-15 15:18:48', 'img/583795dc57a9df041fda71bfdc0db38ec791517cb54098fcd3acb785b6af1e07.webp', 'asfdasf', 1, 0),
(16, '2023-03-15 15:38:24', 'img/5ee97845d97547147a6a4d34eeefe4a03bb37191b040a09acbd5bfa270296f1e.webp', 'malenia blade of miquellla', 1, 0),
(17, '2023-03-22 13:51:08', 'img/c4ee657603050b52b9ebd27519ec808fc191aeea01fecfaff5cf07e3ad70ad0c.webp', 'Lokal', 1, 0),
(18, '2023-03-22 13:59:26', 'img/26fe9c9ec0ca9f5f0ee8260b5ba5d935f320bb04b64dc88ecfd71fa8173ac40f.webp', 'afsf', 1, 0),
(19, '2023-03-22 15:10:56', 'img/6f3d6672f7e94b590ec644f8da732656310be2bac73432d6762037059fd03073.webp', 'malenia blade of miquellla', 1, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(1, 'alvarez@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$ZGdlNFRPL1hrVWlocWJYWQ$c+3HsbkI06a+yOhUHVAjyU4cA+pF5cWkAiMH1SuLje0'),
(2, 'alwarez@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$U0FNenZwTlY3SlRDYUZvRg$14nr6m7zVFPk96vg56KG2hOsa90mRVRNcTnyFcMQOE8'),
(3, 'abc@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$R1Vlc1RSRGJUcDBOb1A2bQ$D8wh27Jqw6DS3A1BPT2mSbH9wLrEymWxsajda7VJk4k');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
