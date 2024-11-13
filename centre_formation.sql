-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 13 nov. 2024 à 11:56
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `centre_formation`
--

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `NumCNIEtu` varchar(255) NOT NULL,
  `nomEtu` varchar(255) NOT NULL,
  `prenomEtu` varchar(255) NOT NULL,
  `dateNaiss` date NOT NULL,
  `adresseEtu` varchar(255) NOT NULL,
  `villeEtu` varchar(255) NOT NULL,
  `niveauEtu` int NOT NULL,
  PRIMARY KEY (`NumCNIEtu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

DROP TABLE IF EXISTS `formation`;
CREATE TABLE IF NOT EXISTS `formation` (
  `codeForm` varchar(255) NOT NULL,
  `titreForm` varchar(255) NOT NULL,
  `dureeForm` varchar(255) NOT NULL,
  `prixForm` float NOT NULL,
  PRIMARY KEY (`codeForm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `NumCNIEtu` varchar(255) NOT NULL,
  `codeSess` varchar(255) NOT NULL,
  `TypeCours` varchar(255) NOT NULL,
  KEY `NumCNIEtu` (`NumCNIEtu`),
  KEY `codeSess` (`codeSess`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `CodeSess` varchar(255) NOT NULL,
  `nomSess` varchar(255) NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  `codeForm` varchar(255) NOT NULL,
  PRIMARY KEY (`CodeSess`),
  KEY `codeForm` (`codeForm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
CREATE TABLE IF NOT EXISTS `specialite` (
  `codeSpec` varchar(255) NOT NULL,
  `nomSpec` varchar(255) NOT NULL,
  `descSpec` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`codeSpec`),
  KEY `codeSpec` (`codeSpec`),
  KEY `codeSpec_2` (`codeSpec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `specialite_formation`
--

DROP TABLE IF EXISTS `specialite_formation`;
CREATE TABLE IF NOT EXISTS `specialite_formation` (
  `codeSpec` varchar(255) NOT NULL,
  `codeForm` varchar(255) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `codeForm` (`codeForm`),
  KEY `codeSpec` (`codeSpec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`NumCNIEtu`) REFERENCES `etudiant` (`NumCNIEtu`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `inscription_ibfk_2` FOREIGN KEY (`codeSess`) REFERENCES `session` (`CodeSess`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`codeForm`) REFERENCES `formation` (`codeForm`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `specialite_formation`
--
ALTER TABLE `specialite_formation`
  ADD CONSTRAINT `specialite_formation_ibfk_1` FOREIGN KEY (`codeForm`) REFERENCES `formation` (`codeForm`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `specialite_formation_ibfk_2` FOREIGN KEY (`codeSpec`) REFERENCES `specialite` (`codeSpec`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
