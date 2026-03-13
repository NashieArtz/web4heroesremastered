-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jan 28, 2026 at 12:41 PM
-- Server version: 10.6.12-MariaDB-1:10.6.12+maria~ubu2004
-- PHP Version: 8.1.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `w4hr`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
                           `id` int(11) NOT NULL,
                           `number` varchar(10) DEFAULT NULL,
                           `complement` varchar(45) DEFAULT NULL,
                           `street` varchar(255) DEFAULT NULL,
                           `postal_code` varchar(45) DEFAULT NULL,
                           `users_id` int(11) DEFAULT NULL,
                           `country_id` int(11) DEFAULT NULL,
                           `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
                          `id` int(11) NOT NULL,
                          `name` varchar(100) NOT NULL,
                          `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `country_id`) VALUES
                                                      (1, 'Rouen', 1),
                                                      (2, 'Paris', 1),
                                                      (3, 'Lyon', 1),
                                                      (4, 'Marseille', 1),
                                                      (5, 'Le Havre', 1),
                                                      (6, 'Bruxelles', 2),
                                                      (7, 'Liège', 2),
                                                      (8, 'Anvers', 2),
                                                      (9, 'Genève', 3),
                                                      (10, 'Zurich', 3),
                                                      (11, 'Lausanne', 3),
                                                      (12, 'Montréal', 4),
                                                      (13, 'Québec', 4),
                                                      (14, 'Toronto', 4),
                                                      (15, 'New York', 5),
                                                      (16, 'Gotham City', 5),
                                                      (17, 'Metropolis', 5);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
                             `id` int(11) NOT NULL,
                             `name` varchar(100) NOT NULL,
                             `iso_code` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `iso_code`) VALUES
                                                       (1, 'France', NULL),
                                                       (2, 'Belgique', NULL),
                                                       (3, 'Suisse', NULL),
                                                       (4, 'Canada', NULL),
                                                       (5, 'États-Unis', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hero_profile`
--

CREATE TABLE `hero_profile` (
                                `id` int(11) NOT NULL,
                                `alias` varchar(55) NOT NULL,
                                `description` longtext DEFAULT NULL,
                                `photo_path` varchar(255) DEFAULT NULL,
                                `is_active` tinyint(4) DEFAULT 1,
                                `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hero_profile`
--

INSERT INTO `hero_profile` (`id`, `alias`, `description`, `photo_path`, `is_active`, `users_id`) VALUES
                                                                                                     (1, 'Superman', 'L\'Homme d\'Acier, protecteur de Metropolis.', 'uploads/heroes/superman.png', 1, 1),
                                                                                                     (2, 'Batman', 'Le Chevalier Noir, gardien de Gotham.', 'uploads/heroes/batman.png', 1, 2),
                                                                                                     (5, 'Iron Man', 'Génie, milliardaire, playboy, philanthrope.', 'uploads/heroes/ironman.png', 1, 5),
                                                                                                     (6, 'Black Widow', 'Espionne experte et ancienne du SHIELD.', 'uploads/heroes/blackwidow.png', 1, 6),
                                                                                                     (7, 'Captain America', 'Le premier Avenger, symbole de liberté.', 'uploads/heroes/captainamerica.png', 1, 7),
                                                                                                     (8, 'Scarlet Witch', 'Maîtresse de la magie du chaos.', 'uploads/heroes/scarletwitch.png', 1, 8),
                                                                                                     (9, 'The Flash', 'L\'homme le plus rapide du monde.', 'uploads/heroes/flash.png', 1, 9),
                                                                                                     (10, 'Aquaman', 'Roi d\'Atlantis et des sept mers.', 'uploads/heroes/aquaman.png', 1, 10),
                                                                                                     (11, 'Wonder Woman', 'Princesse Amazone d\'Inisheer.', 'uploads/heroes/wonderwoman.png', 1, 11),
                                                                                                     (12, 'Spider-Man', 'Votre sympathique voisin l\'araignée.', 'uploads/heroes/spiderman.png', 1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `hero_profile_has_speciality`
--

CREATE TABLE `hero_profile_has_speciality` (
                                               `hero_profile_id` int(11) NOT NULL,
                                               `speciality_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incidents`
--

CREATE TABLE `incidents` (
                             `id` int(11) NOT NULL,
                             `title` varchar(100) DEFAULT NULL,
                             `description` longtext DEFAULT NULL,
                             `date` datetime NOT NULL DEFAULT current_timestamp(),
                             `priority` enum('Low','Mid','High') DEFAULT NULL,
                             `type` enum('Attack','Robbery','Disaster','Kidnapping','Vandalism','HostageTaking','Invasion','Medical','Other') NOT NULL DEFAULT 'Other',
                             `users_id` int(11) DEFAULT NULL,
                             `villain_profile_id` int(11) DEFAULT NULL,
                             `status` enum('open','resolved') NOT NULL DEFAULT 'open',
                             `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `intervention`
--

CREATE TABLE `intervention` (
                                `id` int(11) NOT NULL,
                                `incidents_id` int(11) NOT NULL,
                                `hero_profile_id` int(11) DEFAULT NULL,
                                `status` enum('pending','success','failed') DEFAULT 'pending',
                                `date_open` datetime DEFAULT current_timestamp(),
                                `date_close` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
                          `id` int(11) NOT NULL,
                          `title` varchar(100) DEFAULT NULL,
                          `description` text DEFAULT NULL,
                          `imdb_path` varchar(255) DEFAULT NULL,
                          `poster_path` varchar(255) DEFAULT NULL,
                          `category` enum('Action','Adventure','Animation','Comedy','Crime','Documentary','Drama','Family','Fantasy','History','Horror','Music','Mystery','Romance','Sci-Fi','Thriller','War','Western') DEFAULT 'Action'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movies_has_hero_profile`
--

CREATE TABLE `movies_has_hero_profile` (
                                           `movies_id` int(11) NOT NULL,
                                           `hero_profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscribers`
--

CREATE TABLE `newsletter_subscribers` (
                                          `id` int(11) NOT NULL,
                                          `subscribed_at` datetime DEFAULT current_timestamp(),
                                          `email` varchar(100) NOT NULL,
                                          `users_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `speciality`
--

CREATE TABLE `speciality` (
                              `id` int(11) NOT NULL,
                              `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `speciality_has_villain_profile`
--

CREATE TABLE `speciality_has_villain_profile` (
                                                  `speciality_id` int(11) NOT NULL,
                                                  `villain_profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
                         `id` int(11) NOT NULL,
                         `email` varchar(100) NOT NULL,
                         `pwd` varchar(255) NOT NULL,
                         `username` varchar(30) DEFAULT NULL,
                         `lastname` varchar(100) DEFAULT NULL,
                         `firstname` varchar(100) DEFAULT NULL,
                         `gender` enum('Male','Female','Other') DEFAULT 'Other',
                         `birthdate` date DEFAULT NULL,
                         `phone` varchar(20) DEFAULT NULL,
                         `token` binary(32) DEFAULT NULL,
                         `expiry_token` datetime DEFAULT NULL,
                         `role` enum('admin','user','hero') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `pwd`, `username`, `lastname`, `firstname`, `gender`, `birthdate`, `phone`, `token`, `expiry_token`, `role`) VALUES
                                                                                                                                                     (1, 'clark.kent@dailyplanet.com', '$2y$10$fFF9y423QhyCNzgf.Ysoe.ubR/guHDo3hLwHI.aZEjuGZ1yy2CN7m', NULL, 'Kent', 'Clark', 'Male', '1978-06-18', '555-0101', NULL, NULL, 'user'),
                                                                                                                                                     (2, 'bruce.wayne@waynecorp.com', '$2y$10$fFF9y423QhyCNzgf.Ysoe.ubR/guHDo3hLwHI.aZEjuGZ1yy2CN7m', NULL, 'Wayne', 'Bruce', 'Male', '1972-02-19', '555-0102', NULL, NULL, 'hero'),
                                                                                                                                                     (3, 'test.test@test.com', '$2y$10$F8C6pAUD.wDO5FWgZxcOPOrxBCs6XBvY5.91pJ1Ojjjkp4blMasGa', NULL, 'test', 'test', 'Other', '0001-01-01', '0101010101', NULL, NULL, 'user'),
                                                                                                                                                     (4, 'admin@admin.com', '$2y$10$fp.PG1cAN07u5Gl6DKC6V.RftN5Adi1Ets3ou3/oVgydCQteLcUXy', 'admin', NULL, NULL, 'Other', NULL, NULL, NULL, NULL, 'admin'),
                                                                                                                                                     (5, 'tony.stark@starkintl.com', '$2y$10$fFF9y423QhyCNzgf.Ysoe.ubR/guHDo3hLwHI.aZEjuGZ1yy2CN7m', NULL, 'Stark', 'Tony', 'Male', '1970-05-29', '555-0105', NULL, NULL, 'hero'),
                                                                                                                                                     (6, 'natasha.romanoff@shield.gov', '$2y$10$fFF9y423QhyCNzgf.Ysoe.ubR/guHDo3hLwHI.aZEjuGZ1yy2CN7m', NULL, 'Romanoff', 'Natasha', 'Female', '1984-11-22', '555-0106', NULL, NULL, 'hero'),
                                                                                                                                                     (7, 'steve.rogers@army.mil', '$2y$10$fFF9y423QhyCNzgf.Ysoe.ubR/guHDo3hLwHI.aZEjuGZ1yy2CN7m', NULL, 'Rogers', 'Steve', 'Male', '1918-07-04', '555-0107', NULL, NULL, 'hero'),
                                                                                                                                                     (8, 'wanda.maximoff@avengers.org', '$2y$10$fFF9y423QhyCNzgf.Ysoe.ubR/guHDo3hLwHI.aZEjuGZ1yy2CN7m', NULL, 'Maximoff', 'Wanda', 'Female', '1989-02-10', '555-0108', NULL, NULL, 'hero'),
                                                                                                                                                     (9, 'barry.allen@ccpd.gov', '$2y$10$fFF9y423QhyCNzgf.Ysoe.ubR/guHDo3hLwHI.aZEjuGZ1yy2CN7m', NULL, 'Allen', 'Barry', 'Male', '1992-03-14', '555-0109', NULL, NULL, 'user'),
                                                                                                                                                     (10, 'arthur.curry@atlantis.com', '$2y$10$fFF9y423QhyCNzgf.Ysoe.ubR/guHDo3hLwHI.aZEjuGZ1yy2CN7m', NULL, 'Curry', 'Arthur', 'Male', '1986-01-29', '555-0110', NULL, NULL, 'user'),
                                                                                                                                                     (11, 'diana.prince@themyscira.gov', '$2y$10$fFF9y423QhyCNzgf.Ysoe.ubR/guHDo3hLwHI.aZEjuGZ1yy2CN7m', NULL, 'Prince', 'Diana', 'Female', '1918-03-22', '555-0103', NULL, NULL, 'user'),
                                                                                                                                                     (12, 'peter.parker@dailybugle.com', '$2y$10$fFF9y423QhyCNzgf.Ysoe.ubR/guHDo3hLwHI.aZEjuGZ1yy2CN7m', NULL, 'Parker', 'Peter', 'Male', '2001-08-10', '555-0104', NULL, NULL, 'hero'),
                                                                                                                                                     (13, 'test2@test2.com', '$2y$10$OmQwtan0tnXpvaXgBSip5O.HhVwJFbaVyWqrytkd89NnaC4V0A2/q', NULL, 'test2', 'test2', 'Other', '0002-02-02', '02020202', NULL, NULL, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `villain_profile`
--

CREATE TABLE `villain_profile` (
                                   `id` int(11) NOT NULL,
                                   `alias` varchar(55) NOT NULL,
                                   `name` varchar(45) DEFAULT NULL,
                                   `description` longtext DEFAULT NULL,
                                   `photo_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `villain_profile`
--

INSERT INTO `villain_profile` (`id`, `alias`, `name`, `description`, `photo_path`) VALUES
                                                                                       (1, 'The Joker', 'Jack Napier', 'Génie du crime obsédé par le chaos et ennemi juré de Batman.', 'uploads/villains/joker.png'),
                                                                                       (2, 'Lex Luthor', 'Alexander Luthor', 'Milliardaire mégalomane doté d\'une intelligence supérieure.', 'uploads/villains/luthor.png'),
                                                                                       (3, 'Magneto', 'Erik Lehnsherr', 'Maître du magnétisme pensant que les mutants doivent régner.', 'uploads/villains/magneto.png'),
                                                                                       (4, 'Herobrine', 'Unknown', 'Entité mystérieuse aux yeux blancs capable de corrompre le monde.', 'uploads/villains/herobrine.png'),
                                                                                       (5, 'The Wither', 'Nether King', 'Créature à trois têtes semant la désolation sur son passage.', 'uploads/villains/wither.png'),
                                                                                       (6, 'Le Voleur de Groseilles', 'Jean Valjean', 'Un petit malin qui terrorise les marchés de Normandie.', 'uploads/villains/groseille.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
    ADD PRIMARY KEY (`id`),
    ADD KEY `fk_adresse_users1_idx` (`users_id`),
    ADD KEY `fk_address_country` (`country_id`),
    ADD KEY `fk_address_city` (`city_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
    ADD PRIMARY KEY (`id`),
    ADD KEY `fk_city_country` (`country_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hero_profile`
--
ALTER TABLE `hero_profile`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `alias_UNIQUE` (`alias`),
    ADD UNIQUE KEY `users_id_UNIQUE` (`users_id`);

--
-- Indexes for table `hero_profile_has_speciality`
--
ALTER TABLE `hero_profile_has_speciality`
    ADD PRIMARY KEY (`hero_profile_id`,`speciality_id`),
    ADD KEY `fk_speciality` (`speciality_id`);

--
-- Indexes for table `incidents`
--
ALTER TABLE `incidents`
    ADD PRIMARY KEY (`id`),
    ADD KEY `fk_incidents_users_idx` (`users_id`),
    ADD KEY `fk_incidents_villain_profile1_idx` (`villain_profile_id`),
    ADD KEY `fk_incidents_address_id` (`address_id`);

--
-- Indexes for table `intervention`
--
ALTER TABLE `intervention`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `incidents_id_UNIQUE` (`incidents_id`),
    ADD KEY `fk_intervention_hero_profile1_idx` (`hero_profile_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies_has_hero_profile`
--
ALTER TABLE `movies_has_hero_profile`
    ADD PRIMARY KEY (`movies_id`,`hero_profile_id`),
    ADD KEY `fk_hero` (`hero_profile_id`);

--
-- Indexes for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
    ADD PRIMARY KEY (`id`),
    ADD KEY `fk_newsletter_subscribers_users1_idx` (`users_id`);

--
-- Indexes for table `speciality`
--
ALTER TABLE `speciality`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `speciality_has_villain_profile`
--
ALTER TABLE `speciality_has_villain_profile`
    ADD PRIMARY KEY (`speciality_id`,`villain_profile_id`),
    ADD KEY `fk_villain` (`villain_profile_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Indexes for table `villain_profile`
--
ALTER TABLE `villain_profile`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `alias_UNIQUE` (`alias`),
    ADD UNIQUE KEY `photo_path_UNIQUE` (`photo_path`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hero_profile`
--
ALTER TABLE `hero_profile`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `incidents`
--
ALTER TABLE `incidents`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `intervention`
--
ALTER TABLE `intervention`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `speciality`
--
ALTER TABLE `speciality`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `villain_profile`
--
ALTER TABLE `villain_profile`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
    ADD CONSTRAINT `fk_address_city` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
    ADD CONSTRAINT `fk_address_country` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
    ADD CONSTRAINT `fk_adresse_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
    ADD CONSTRAINT `fk_city_country` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hero_profile`
--
ALTER TABLE `hero_profile`
    ADD CONSTRAINT `fk_hero_profile_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `hero_profile_has_speciality`
--
ALTER TABLE `hero_profile_has_speciality`
    ADD CONSTRAINT `fk_hero_spec_hero` FOREIGN KEY (`hero_profile_id`) REFERENCES `hero_profile` (`id`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_hero_spec_spec` FOREIGN KEY (`speciality_id`) REFERENCES `speciality` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `incidents`
--
ALTER TABLE `incidents`
    ADD CONSTRAINT `fk_incidents_address_id` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
    ADD CONSTRAINT `fk_incidents_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_incidents_villain_profile1` FOREIGN KEY (`villain_profile_id`) REFERENCES `villain_profile` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `intervention`
--
ALTER TABLE `intervention`
    ADD CONSTRAINT `fk_intervention_hero_profile1` FOREIGN KEY (`hero_profile_id`) REFERENCES `hero_profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_intervention_incidents1` FOREIGN KEY (`incidents_id`) REFERENCES `incidents` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `movies_has_hero_profile`
--
ALTER TABLE `movies_has_hero_profile`
    ADD CONSTRAINT `fk_movies_hero_hero` FOREIGN KEY (`hero_profile_id`) REFERENCES `hero_profile` (`id`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_movies_hero_movie` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
    ADD CONSTRAINT `fk_newsletter_subscribers_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `speciality_has_villain_profile`
--
ALTER TABLE `speciality_has_villain_profile`
    ADD CONSTRAINT `fk_villain_spec_spec` FOREIGN KEY (`speciality_id`) REFERENCES `speciality` (`id`) ON DELETE CASCADE,
    ADD CONSTRAINT `fk_villain_spec_villain` FOREIGN KEY (`villain_profile_id`) REFERENCES `villain_profile` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
