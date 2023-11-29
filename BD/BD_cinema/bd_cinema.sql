-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Mer 29 Novembre 2023 à 09:51
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `bd_cinema`
--

-- --------------------------------------------------------

--
-- Structure de la table `artiste`
--

CREATE TABLE IF NOT EXISTS `artiste` (
  `idRealisateur` varchar(10) NOT NULL,
  `nom` varchar(10) NOT NULL,
  `prénom` varchar(10) NOT NULL,
  `anneeNaiss` date NOT NULL,
  PRIMARY KEY (`idRealisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `artiste`
--

INSERT INTO `artiste` (`idRealisateur`, `nom`, `prénom`, `anneeNaiss`) VALUES
('jeanpaul', 'armin', 'frave', '2023-11-01'),
('marchepied', 'mah', 'moh', '2023-11-05');

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE IF NOT EXISTS `film` (
  `idFilm` varchar(10) NOT NULL,
  `titre` varchar(10) NOT NULL,
  `année` date NOT NULL,
  `genre` varchar(10) NOT NULL,
  ` resume` varchar(50) NOT NULL,
  `idRealisateur` varchar(10) NOT NULL,
  `codePays` varchar(10) NOT NULL,
  PRIMARY KEY (`idFilm`),
  KEY `idRealisateur` (`idRealisateur`,`codePays`),
  KEY `codePays` (`codePays`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `film`
--

INSERT INTO `film` (`idFilm`, `titre`, `année`, `genre`, ` resume`, `idRealisateur`, `codePays`) VALUES
('goldenappl', 'mostersbre', '2023-11-11', 'action', 'mosters', 'jeanpaul', 'amérique'),
('requin', 'marchepatt', '2023-11-01', 'action', 'il avait trois pattes', 'marchepied', 'france');

-- --------------------------------------------------------

--
-- Structure de la table `internaute`
--

CREATE TABLE IF NOT EXISTS `internaute` (
  `email` varchar(10) NOT NULL,
  `nom` varchar(10) NOT NULL,
  `prenom` varchar(10) NOT NULL,
  `region` varchar(10) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `internaute`
--

INSERT INTO `internaute` (`email`, `nom`, `prenom`, `region`) VALUES
('lol@gmail.', 'jojol', 'ale', 'ile de fra'),
('mdr@gmail.', 'parse', 'lea', 'eure');

-- --------------------------------------------------------

--
-- Structure de la table `notation`
--

CREATE TABLE IF NOT EXISTS `notation` (
  `id_notation` int(11) NOT NULL,
  `email` varchar(10) NOT NULL,
  `idFilm` varchar(10) NOT NULL,
  `note` int(11) NOT NULL,
  PRIMARY KEY (`id_notation`),
  KEY `email` (`email`),
  KEY `idFilm` (`idFilm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `notation`
--

INSERT INTO `notation` (`id_notation`, `email`, `idFilm`, `note`) VALUES
(3, 'lol@gmail.', 'goldenappl', 3),
(5, 'mdr@gmail.', 'requin', 5);

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE IF NOT EXISTS `pays` (
  `code_pays` varchar(10) NOT NULL,
  `nom` varchar(10) NOT NULL,
  `langue` varchar(10) NOT NULL,
  PRIMARY KEY (`code_pays`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `pays`
--

INSERT INTO `pays` (`code_pays`, `nom`, `langue`) VALUES
('amérique', 'amérique', 'anglais'),
('france', 'france', 'français');

-- --------------------------------------------------------

--
-- Structure de la table ` role`
--

CREATE TABLE IF NOT EXISTS ` role` (
  `id_role` varchar(10) NOT NULL,
  `idFilm` varchar(10) NOT NULL,
  ` idRealisateur` varchar(10) NOT NULL,
  `nomRole` varchar(10) NOT NULL,
  PRIMARY KEY (`id_role`),
  KEY `idFilm` (`idFilm`,` idRealisateur`),
  KEY ` idRealisateur` (` idRealisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table ` role`
--

INSERT INTO ` role` (`id_role`, `idFilm`, ` idRealisateur`, `nomRole`) VALUES
('dormir', 'requin', 'marchepied', 'leslep'),
('traviller', 'goldenappl', 'jeanpaul', 'amimir');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `film_ibfk_2` FOREIGN KEY (`codePays`) REFERENCES `pays` (`code_pays`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `film_ibfk_1` FOREIGN KEY (`idRealisateur`) REFERENCES `artiste` (`idRealisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `notation`
--
ALTER TABLE `notation`
  ADD CONSTRAINT `notation_ibfk_2` FOREIGN KEY (`idFilm`) REFERENCES `film` (`idFilm`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notation_ibfk_1` FOREIGN KEY (`email`) REFERENCES `internaute` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table ` role`
--
ALTER TABLE ` role`
  ADD CONSTRAINT `@0020role_ibfk_2` FOREIGN KEY (` idRealisateur`) REFERENCES `artiste` (`idRealisateur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `@0020role_ibfk_1` FOREIGN KEY (`idFilm`) REFERENCES `film` (`idFilm`) ON DELETE CASCADE ON UPDATE CASCADE;
