-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Mer 22 Novembre 2023 à 10:49
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `BD_location_voiture`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `ncin` varchar(10) NOT NULL,
  `nom` varchar(10) NOT NULL,
  `prenom` varchar(10) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `date_naissance` date NOT NULL,
  `num_permis` int(11) NOT NULL,
  `civilite` varchar(10) NOT NULL,
  PRIMARY KEY (`ncin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`ncin`, `nom`, `prenom`, `adresse`, `date_naissance`, `num_permis`, `civilite`) VALUES
('fea221', 'mah', 'lea', '18 centenaire', '2001-12-01', 545643214, 'femme'),
('feae64', 'erh', 'abla', '100 rue des villa', '2001-01-20', 132132513, 'homme');

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `num_location` int(11) NOT NULL AUTO_INCREMENT,
  `date_location` date NOT NULL,
  `duree` int(11) NOT NULL,
  `prix_location` float NOT NULL,
  `caution` int(11) NOT NULL,
  `ncin` varchar(10) NOT NULL,
  `immatriculation` varchar(10) NOT NULL,
  PRIMARY KEY (`num_location`),
  KEY `ncin` (`ncin`,`immatriculation`),
  KEY `immatriculation` (`immatriculation`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `locations`
--

INSERT INTO `locations` (`num_location`, `date_location`, `duree`, `prix_location`, `caution`, `ncin`, `immatriculation`) VALUES
(1, '2023-12-02', 18, 150, 120, 'feae64', '125E-54ES-'),
(2, '2022-10-25', 60, 500, 130, 'fea221', '486Z-BIUS-');

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

CREATE TABLE IF NOT EXISTS `voiture` (
  `immatriculation` varchar(10) NOT NULL,
  `model` varchar(50) NOT NULL,
  `prix_d'achat` int(11) NOT NULL,
  `couleur` varchar(10) NOT NULL,
  `nbr_porte` int(11) NOT NULL,
  `kilometrage` int(11) NOT NULL,
  `boite_vitesse` varchar(20) NOT NULL,
  `puissance` int(11) NOT NULL,
  PRIMARY KEY (`immatriculation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `voiture`
--

INSERT INTO `voiture` (`immatriculation`, `model`, `prix_d'achat`, `couleur`, `nbr_porte`, `kilometrage`, `boite_vitesse`, `puissance`) VALUES
('125E-54ES-', 'lol', 12000, 'rouge', 4, 18000, 'manuel', 152),
('486Z-BIUS-', 'mdr', 20000, 'gris', 1, 80000, 'auto', 300);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_2` FOREIGN KEY (`ncin`) REFERENCES `client` (`ncin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`immatriculation`) REFERENCES `voiture` (`immatriculation`) ON DELETE CASCADE ON UPDATE CASCADE;
