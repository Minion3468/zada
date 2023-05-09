-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Maj 09, 2023 at 09:54 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms_ss`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `disliked`
--

CREATE TABLE `disliked` (
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `disliked`
--

INSERT INTO `disliked` (`user_id`, `post_id`) VALUES
(6, 5),
(6, 5),
(0, 5),
(7, 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `liked`
--

CREATE TABLE `liked` (
  `user_id` int(255) NOT NULL,
  `post_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `liked`
--

INSERT INTO `liked` (`user_id`, `post_id`) VALUES
(6, 5),
(0, 5),
(7, 6),
(7, 7),
(7, 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `post`
--

CREATE TABLE `post` (
  `ID` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `filename` varchar(1024) NOT NULL,
  `title` text NOT NULL,
  `likes` int(255) NOT NULL,
  `removed` tinyint(1) NOT NULL DEFAULT 0,
  `userID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`ID`, `timestamp`, `filename`, `title`, `likes`, `removed`, `userID`) VALUES
(5, '2023-05-08 19:25:40', 'img/4b193be35047ca2f369d0a5408e8f4a5e6ba72886b4ba2588c3df9a640102909.webp', 'qtas', 2, 1, 6),
(6, '2023-05-08 19:37:49', 'img/7b591eb212976a6449c8db3d6a7b3315198113506363c3474d8cae9160718bf6.webp', 'asdsa', 1, 1, 7),
(7, '2023-05-08 19:38:03', 'img/b9c4e1b593ef57aeadb1940ffdaace1b430344ded54b6da57400ffc1c8d5a9f2.webp', '2 Żaby w Teamie', 1, 0, 7),
(8, '2023-05-09 20:57:40', 'img/8d6308293385ff2a0e591206217c464ffd8c9c789939aabccddd8dbc9acbe5a2.webp', 'Live Lalo reaction', 0, 1, 7),
(9, '2023-05-09 20:59:12', 'img/0eed88f031962265f8ac3761bc0c6f01e166d51dc49ff4cf6cd36bb1cc3c4f69.webp', 'Live Lalo reaction', 0, 1, 7);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `email`, `password`) VALUES
(6, 'chuj@123', '$argon2i$v=19$m=65536,t=4,p=1$OFV3bGVXTFY0MC5DY1dFOA$dj0fOAh061Q0czMr+ZXrHngmbvoASTW1UVenaORh5K4'),
(7, 'a@a.a', '$argon2i$v=19$m=65536,t=4,p=1$b0x2b0FwTXpxYUVUeWRERA$aeq2a4o299RMMh0udVqu7lhN+jjo36dMkh0mJEgjzuk');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
