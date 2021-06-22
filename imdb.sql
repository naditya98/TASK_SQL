-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2021 at 02:46 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `Id` int(11) NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`Id`, `Name`) VALUES
(1, 'Manoj Bajpayee'),
(2, 'Tom Hiddleston'),
(3, 'Robert downey jr'),
(4, 'Sharib Hashmi'),
(5, 'Chadwick Boseman');

-- --------------------------------------------------------

--
-- Table structure for table `artist_role`
--

CREATE TABLE `artist_role` (
  `Id` int(11) NOT NULL,
  `Role_id` int(11) NOT NULL,
  `Artist_id` int(11) NOT NULL,
  `Movie_Id` int(11) NOT NULL,
  `Name_in_movie` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artist_role`
--

INSERT INTO `artist_role` (`Id`, `Role_id`, `Artist_id`, `Movie_Id`, `Name_in_movie`) VALUES
(1, 1, 1, 2, 'Srikant Tiwary'),
(2, 4, 4, 2, 'Jk Talpade'),
(3, 1, 2, 3, 'Loki'),
(4, 1, 5, 4, 'Tichala'),
(5, 2, 2, 1, 'Loki');

-- --------------------------------------------------------

--
-- Table structure for table `artist_skills`
--

CREATE TABLE `artist_skills` (
  `Id` int(11) NOT NULL,
  `Artist_id` int(11) NOT NULL,
  `Skills_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artist_skills`
--

INSERT INTO `artist_skills` (`Id`, `Artist_id`, `Skills_id`) VALUES
(1, 1, 1),
(2, 3, 1),
(3, 3, 4),
(4, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `Id` int(11) NOT NULL,
  `Genre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`Id`, `Genre`) VALUES
(1, 'Action'),
(2, 'Adventure'),
(3, 'Sci-fi'),
(4, 'Horror'),
(5, 'Drama');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `Id` int(11) NOT NULL,
  `Type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`Id`, `Type`) VALUES
(1, 'Image'),
(2, 'Video');

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `Id` int(11) NOT NULL,
  `Title` text NOT NULL,
  `Description` text NOT NULL,
  `Rating` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`Id`, `Title`, `Description`, `Rating`) VALUES
(1, 'Iron Man', 'After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.', 7.9),
(2, 'The Family Man', 'A working man from the National Investigation Agency tries to protect the nation from terrorism, but he also needs to keep his family safe from his secret job.', 8.8),
(3, 'Loki', 'The mercurial villain Loki resumes his role as the God of Mischief in a new series that takes place after the events of “Avengers: Endgame.”', 9.1),
(4, 'Black Panther', 'T\'Challa, heir to the hidden but advanced kingdom of Wakanda, must step forward to lead his people into a new future and must confront a challenger from his country\'s past.', 7.3);

-- --------------------------------------------------------

--
-- Table structure for table `movie_genre`
--

CREATE TABLE `movie_genre` (
  `Id` int(11) NOT NULL,
  `Movie_Id` int(11) NOT NULL,
  `genre_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_genre`
--

INSERT INTO `movie_genre` (`Id`, `Movie_Id`, `genre_Id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 4, 1),
(5, 4, 2),
(6, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `movie_media`
--

CREATE TABLE `movie_media` (
  `Id` int(11) NOT NULL,
  `Movie_Id` int(11) NOT NULL,
  `Media_Id` int(11) NOT NULL,
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_media`
--

INSERT INTO `movie_media` (`Id`, `Movie_Id`, `Media_Id`, `url`) VALUES
(1, 1, 1, 'https://m.media-amazon.com/images/M/MV5BMTczNTI2ODUwOF5BMl5BanBnXkFtZTcwMTU0NTIzMw@@._V1_UX182_CR0,0,182,268_AL__QL50.jpg'),
(2, 1, 2, 'https://www.imdb.com/video/vi447873305?playlistId=tt0371746&ref_=tt_ov_vi'),
(3, 2, 1, 'https://m.media-amazon.com/images/M/MV5BMzRjZWVmMzItNTdmYS00OWEzLTgyOGUtNThiNTU2ZThlYjY0XkEyXkFqcGdeQXVyMTIxMDk2NDE4._V1_UY268_CR16,0,182,268_AL__QL50.jpg'),
(4, 2, 2, 'https://www.imdb.com/video/vi272482329?playlistId=tt9544034&ref_=tt_ov_vi'),
(5, 3, 1, 'https://m.media-amazon.com/images/M/MV5BNTkwOTE1ZDYtODQ3Yy00YTYwLTg0YWQtYmVkNmFjNGZlYmRiXkEyXkFqcGdeQXVyNTc4MjczMTM@._V1_UX182_CR0,0,182,268_AL__QL50.jpg'),
(6, 3, 2, 'https://www.imdb.com/video/vi3644833817?playlistId=tt9140554&ref_=tt_ov_vi'),
(7, 4, 1, 'https://m.media-amazon.com/images/M/MV5BMTg1MTY2MjYzNV5BMl5BanBnXkFtZTgwMTc4NTMwNDI@._V1_UX182_CR0,0,182,268_AL__QL50.jpg'),
(8, 4, 2, 'https://www.imdb.com/video/vi2320939289?playlistId=tt1825683&ref_=tt_ov_vi');

-- --------------------------------------------------------

--
-- Table structure for table `movie_review`
--

CREATE TABLE `movie_review` (
  `Id` int(11) NOT NULL,
  `Movie_Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `Review_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_review`
--

INSERT INTO `movie_review` (`Id`, `Movie_Id`, `User_Id`, `Review_Id`) VALUES
(1, 1, 1, 4),
(2, 1, 2, 4),
(3, 2, 1, 3),
(4, 2, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `Id` int(11) NOT NULL,
  `Review` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`Id`, `Review`) VALUES
(1, 'Bad'),
(2, 'Good'),
(3, 'Very Good'),
(4, 'Excellent');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `Id` int(11) NOT NULL,
  `Role` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`Id`, `Role`) VALUES
(1, 'Hero'),
(2, 'Villian'),
(3, 'Heroine'),
(4, 'Side Hero'),
(5, 'Friend of Hero');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `Id` int(11) NOT NULL,
  `Skill` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`Id`, `Skill`) VALUES
(1, 'Actor'),
(2, 'Singer'),
(3, 'Dancer'),
(4, 'Stunt Man');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Id` int(11) NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Id`, `Name`) VALUES
(1, 'Debasish'),
(2, 'Aditya'),
(3, 'Anubhav');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `artist_role`
--
ALTER TABLE `artist_role`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Artist_id` (`Artist_id`),
  ADD KEY `Movie_Id` (`Movie_Id`),
  ADD KEY `Role_id` (`Role_id`);

--
-- Indexes for table `artist_skills`
--
ALTER TABLE `artist_skills`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Artist_id` (`Artist_id`),
  ADD KEY `Skills_id` (`Skills_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `genre_Id` (`genre_Id`),
  ADD KEY `Movie_Id` (`Movie_Id`);

--
-- Indexes for table `movie_media`
--
ALTER TABLE `movie_media`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Media_Id` (`Media_Id`),
  ADD KEY `Movie_Id` (`Movie_Id`);

--
-- Indexes for table `movie_review`
--
ALTER TABLE `movie_review`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Movie_Id` (`Movie_Id`),
  ADD KEY `Review_Id` (`Review_Id`),
  ADD KEY `User_Id` (`User_Id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `artist_role`
--
ALTER TABLE `artist_role`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `artist_skills`
--
ALTER TABLE `artist_skills`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `movie_genre`
--
ALTER TABLE `movie_genre`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `movie_media`
--
ALTER TABLE `movie_media`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `movie_review`
--
ALTER TABLE `movie_review`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artist_role`
--
ALTER TABLE `artist_role`
  ADD CONSTRAINT `artist_role_ibfk_1` FOREIGN KEY (`Artist_id`) REFERENCES `artist` (`Id`),
  ADD CONSTRAINT `artist_role_ibfk_2` FOREIGN KEY (`Movie_Id`) REFERENCES `movie` (`Id`),
  ADD CONSTRAINT `artist_role_ibfk_3` FOREIGN KEY (`Role_id`) REFERENCES `role` (`Id`);

--
-- Constraints for table `artist_skills`
--
ALTER TABLE `artist_skills`
  ADD CONSTRAINT `artist_skills_ibfk_1` FOREIGN KEY (`Artist_id`) REFERENCES `artist` (`Id`),
  ADD CONSTRAINT `artist_skills_ibfk_2` FOREIGN KEY (`Skills_id`) REFERENCES `skills` (`Id`);

--
-- Constraints for table `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD CONSTRAINT `movie_genre_ibfk_1` FOREIGN KEY (`genre_Id`) REFERENCES `genre` (`Id`),
  ADD CONSTRAINT `movie_genre_ibfk_2` FOREIGN KEY (`Movie_Id`) REFERENCES `movie` (`Id`);

--
-- Constraints for table `movie_media`
--
ALTER TABLE `movie_media`
  ADD CONSTRAINT `movie_media_ibfk_1` FOREIGN KEY (`Media_Id`) REFERENCES `media` (`Id`),
  ADD CONSTRAINT `movie_media_ibfk_2` FOREIGN KEY (`Movie_Id`) REFERENCES `movie` (`Id`);

--
-- Constraints for table `movie_review`
--
ALTER TABLE `movie_review`
  ADD CONSTRAINT `movie_review_ibfk_1` FOREIGN KEY (`Movie_Id`) REFERENCES `movie` (`Id`),
  ADD CONSTRAINT `movie_review_ibfk_2` FOREIGN KEY (`Review_Id`) REFERENCES `review` (`Id`),
  ADD CONSTRAINT `movie_review_ibfk_3` FOREIGN KEY (`User_Id`) REFERENCES `user` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
