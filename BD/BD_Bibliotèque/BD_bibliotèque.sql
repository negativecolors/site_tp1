-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Mer 06 Décembre 2023 à 14:12
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `bd_bibliotèque`
--

-- --------------------------------------------------------

--
-- Structure de la table `adherents`
--

CREATE TABLE IF NOT EXISTS `adherents` (
  `ID_Adherent` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(10) NOT NULL,
  `Prénom` varchar(10) NOT NULL,
  `Date_naissance` date NOT NULL,
  `Date_adhesion` date NOT NULL,
  `adresse` varchar(10) NOT NULL,
  `Num_tel` varchar(10) NOT NULL,
  `Mail` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_Adherent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `adherents`
--

INSERT INTO `adherents` (`ID_Adherent`, `Nom`, `Prénom`, `Date_naissance`, `Date_adhesion`, `adresse`, `Num_tel`, `Mail`) VALUES
(1, 'jean', 'philipe', '2023-12-06', '2023-12-16', '100 rue de', '0664569120', 'jeanphilipe@gmail.co'),
(2, 'marcel', 'pierre', '2023-12-11', '2023-12-29', '18 centena', '0711165230', '18mass@gmail.com'),
(3, 'rhoan', 'marcel', '2023-12-03', '2023-12-26', '124 rue de', '0652224450', 'rhoan33@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE IF NOT EXISTS `auteur` (
  `ID_Auteur` varchar(10) NOT NULL,
  `Nom` varchar(10) NOT NULL,
  `Prénom` varchar(10) NOT NULL,
  `Date_naissance` date NOT NULL,
  PRIMARY KEY (`ID_Auteur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `auteur`
--

INSERT INTO `auteur` (`ID_Auteur`, `Nom`, `Prénom`, `Date_naissance`) VALUES
('1', 'momo', 'rive', '2023-03-06'),
('2', 'cell', 'phantom', '2023-04-10'),
('3', 'ouhvrzn', 'dtrs', '2023-01-01');

-- --------------------------------------------------------

--
-- Structure de la table `emprunts`
--

CREATE TABLE IF NOT EXISTS `emprunts` (
  `Id_Emprunt` int(11) NOT NULL AUTO_INCREMENT,
  `Date_emprunt` date NOT NULL,
  `Durée` int(11) NOT NULL,
  `ID_Adherent` int(11) NOT NULL,
  `Reference` varchar(10) NOT NULL,
  PRIMARY KEY (`Id_Emprunt`),
  KEY `ID_Adherent` (`ID_Adherent`),
  KEY `Reference` (`Reference`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `emprunts`
--

INSERT INTO `emprunts` (`Id_Emprunt`, `Date_emprunt`, `Durée`, `ID_Adherent`, `Reference`) VALUES
(1, '2023-12-14', 5, 1, 'force à to'),
(2, '2023-12-08', 180, 2, 'chevalier '),
(3, '2023-12-17', 50, 3, 'mort de la');

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE IF NOT EXISTS `livre` (
  `Reference_livre` varchar(10) NOT NULL,
  `Nbre_page` int(11) NOT NULL,
  `ID_Auteur` varchar(10) NOT NULL,
  `Date_publication` date NOT NULL,
  `Genre` varchar(10) NOT NULL,
  `Disponibilité` tinyint(1) NOT NULL,
  `Nbre_emprunte` int(11) NOT NULL,
  `Etat` varchar(10) NOT NULL,
  `Nbre_exemplaire` int(11) NOT NULL,
  `Titre_livre` varchar(10) NOT NULL,
  PRIMARY KEY (`Reference_livre`),
  KEY `ID_Auteur` (`ID_Auteur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `livre`
--

INSERT INTO `livre` (`Reference_livre`, `Nbre_page`, `ID_Auteur`, `Date_publication`, `Genre`, `Disponibilité`, `Nbre_emprunte`, `Etat`, `Nbre_exemplaire`, `Titre_livre`) VALUES
('chevalier ', 600, '2', '2023-12-14', 'drame', 0, 9, 'mal', 30, 'Réseau inf'),
('force à to', 500, '3', '2023-12-21', 'tranche de', 1, 0, 'très bien', 7, 'jfekjhfdbe'),
('mort de la', 230, '1', '2023-12-06', 'action com', 0, 16, 'bien', 5, 'edajidz');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `emprunts`
--
ALTER TABLE `emprunts`
  ADD CONSTRAINT `emprunts_ibfk_1` FOREIGN KEY (`ID_Adherent`) REFERENCES `adherents` (`Id_Adherent`),
  ADD CONSTRAINT `emprunts_ibfk_2` FOREIGN KEY (`Reference`) REFERENCES `livre` (`Reference_livre`);

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`ID_Auteur`) REFERENCES `auteur` (`ID_Auteur`);
