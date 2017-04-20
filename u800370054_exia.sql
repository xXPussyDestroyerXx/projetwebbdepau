
-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Jeu 20 Avril 2017 à 17:52
-- Version du serveur: 10.1.22-MariaDB
-- Version de PHP: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `u800370054_exia`
--

-- --------------------------------------------------------

--
-- Structure de la table `achat`
--

CREATE TABLE IF NOT EXISTS `achat` (
  `ID_Panier` int(11) NOT NULL,
  `ID_Produit` int(11) NOT NULL,
  PRIMARY KEY (`ID_Panier`,`ID_Produit`),
  KEY `FK_Achat_ID_Produit` (`ID_Produit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `activites`
--

CREATE TABLE IF NOT EXISTS `activites` (
  `Validation` tinyint(1) DEFAULT NULL,
  `Nom` varchar(25) NOT NULL,
  `Date_de_l_activite` date NOT NULL,
  `Referent` varchar(25) DEFAULT NULL,
  `Description` text NOT NULL,
  `ID_Activite` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_de_Compte` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID_Activite`),
  KEY `FK_Activites_Nom_de_Compte` (`Nom_de_Compte`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `activites`
--

INSERT INTO `activites` (`Validation`, `Nom`, `Date_de_l_activite`, `Referent`, `Description`, `ID_Activite`, `Nom_de_Compte`) VALUES
(NULL, 'Rugby', '2017-03-21', 'guy', 'SWAGG', 2, NULL),
(NULL, 'Lan', '2014-01-01', 'guy', 'douche', 3, NULL),
(NULL, 'Football', '2017-04-13', 'Guy', 'Football au terrain de foot', 4, NULL),
(NULL, 'Danse', '2017-04-10', 'GAY', 'Twerk ta mere', 5, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `activites_vote`
--

CREATE TABLE IF NOT EXISTS `activites_vote` (
  `ID_Activites` int(11) NOT NULL,
  `ID_Etudiant` int(11) DEFAULT NULL,
  `ID_Activite` int(11) NOT NULL,
  `ID_Etudiant_Etudiants` int(11) NOT NULL,
  PRIMARY KEY (`ID_Activite`),
  KEY `FK_Activites_Vote_ID_Etudiant_Etudiants` (`ID_Etudiant_Etudiants`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `bde`
--

CREATE TABLE IF NOT EXISTS `bde` (
  `Mot_de_Passe` varchar(250) NOT NULL,
  `Nom_de_Compte` varchar(25) NOT NULL,
  PRIMARY KEY (`Nom_de_Compte`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `bde`
--

INSERT INTO `bde` (`Mot_de_Passe`, `Nom_de_Compte`) VALUES
('2850c642427bff2171188520f6f3d1c88a2773c8', 'bde');

-- --------------------------------------------------------

--
-- Structure de la table `boutique`
--

CREATE TABLE IF NOT EXISTS `boutique` (
  `Nom` varchar(25) NOT NULL,
  `ID_Produit` int(11) NOT NULL AUTO_INCREMENT,
  `Prix` int(11) NOT NULL,
  `Stock` int(11) DEFAULT NULL,
  `Lien` varchar(250) NOT NULL,
  `ID_Photo` int(11) DEFAULT NULL,
  `ID_Photo_Photos` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Produit`),
  KEY `FK_Boutique_ID_Photo_Photos` (`ID_Photo_Photos`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `boutique`
--

INSERT INTO `boutique` (`Nom`, `ID_Produit`, `Prix`, `Stock`, `Lien`, `ID_Photo`, `ID_Photo_Photos`) VALUES
('Mugs', 1, 5, 100, 'http://www.logeekdesign.com/9891-thickbox/mug-la-fee-pachier.jpg', NULL, NULL),
('Slip', 2, 100, 124, 'https://overthehedgeblog.files.wordpress.com/2013/07/borat-mankini-very-nice.jpg', NULL, NULL),
('Guy', 4, 30, 5, 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAeFAAAAJDlhYmI4ZDBlLTI2MDUtNGQwYS05NmE0LWMwNjJiOTBiMDIxZA.jpg', NULL, NULL),
('Gruik', 5, 1, 3, 'http://www.calvados.fr/files/content/mounts/Internet/Calvados-gourmand/specialites/cochon-bayeux-530.jpg?uuid=alfresco%3AInternet%3Aworkspace%3A%2F%2FSpacesStore%2F621fb91c-c99d-4689-8931-7b6e21ab8eb4', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `equipe_cesi`
--

CREATE TABLE IF NOT EXISTS `equipe_cesi` (
  `Mot_de_Passe` varchar(250) NOT NULL,
  `Nom_de_Compte` varchar(25) NOT NULL,
  `Avatar` varchar(250) DEFAULT NULL,
  `ID_Cesi` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID_Cesi`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `equipe_cesi`
--

INSERT INTO `equipe_cesi` (`Mot_de_Passe`, `Nom_de_Compte`, `Avatar`, `ID_Cesi`) VALUES
('e4a2313b2f9f76caff1ae13ea3fe7a3fca88ca42', 'equipecesi', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `etudiants`
--

CREATE TABLE IF NOT EXISTS `etudiants` (
  `Nom` varchar(25) NOT NULL,
  `Prenom` varchar(25) NOT NULL,
  `Promotion` varchar(25) NOT NULL,
  `Mot_de_Passe` varchar(250) NOT NULL,
  `Avatar` varchar(250) DEFAULT NULL,
  `ID_Panier` int(11) DEFAULT NULL,
  `Mail` varchar(250) NOT NULL,
  PRIMARY KEY (`Mail`),
  KEY `FK_Etudiants_ID_Panier` (`ID_Panier`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `etudiants`
--

INSERT INTO `etudiants` (`Nom`, `Prenom`, `Promotion`, `Mot_de_Passe`, `Avatar`, `ID_Panier`, `Mail`) VALUES
('Bouyx', 'Romain', 'A2', '3eddfbf3c48b779222cd8eebb3e137614d5ffee2', NULL, NULL, 'romain.bouyx@viacesi.fr');

-- --------------------------------------------------------

--
-- Structure de la table `gere`
--

CREATE TABLE IF NOT EXISTS `gere` (
  `ID_Produit` int(11) NOT NULL,
  `ID_Cesi` int(11) NOT NULL,
  PRIMARY KEY (`ID_Produit`,`ID_Cesi`),
  KEY `FK_Gere_ID_Cesi` (`ID_Cesi`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `moderation`
--

CREATE TABLE IF NOT EXISTS `moderation` (
  `ID_Photo` int(11) NOT NULL,
  `ID_Cesi` int(11) NOT NULL,
  PRIMARY KEY (`ID_Photo`,`ID_Cesi`),
  KEY `FK_Moderation_ID_Cesi` (`ID_Cesi`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE IF NOT EXISTS `panier` (
  `ID_Etudiant` int(11) NOT NULL,
  `ID_Produit` int(11) DEFAULT NULL,
  `Quantite` int(11) NOT NULL,
  `Prix` int(11) NOT NULL,
  `ID_Panier` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Etudiant_Etudiants` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Panier`),
  KEY `FK_Panier_ID_Etudiant_Etudiants` (`ID_Etudiant_Etudiants`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `photos`
--

CREATE TABLE IF NOT EXISTS `photos` (
  `ID_Photo` int(11) NOT NULL AUTO_INCREMENT,
  `Description` text NOT NULL,
  `Lien` varchar(250) NOT NULL,
  `Activite` varchar(250) DEFAULT NULL,
  `J_aime` int(11) DEFAULT NULL,
  `ID_Activite` int(11) DEFAULT NULL,
  `ID_Produit` int(11) DEFAULT NULL,
  `ID_Etudiant` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Photo`),
  KEY `FK_Photos_ID_Activite` (`ID_Activite`),
  KEY `FK_Photos_ID_Produit` (`ID_Produit`),
  KEY `FK_Photos_ID_Etudiant` (`ID_Etudiant`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Contenu de la table `photos`
--

INSERT INTO `photos` (`ID_Photo`, `Description`, `Lien`, `Activite`, `J_aime`, `ID_Activite`, `ID_Produit`, `ID_Etudiant`) VALUES
(40, 'Football trop bien avec mes copains', '434c1d9fcda3f5bc16299fa93dc4d619.jpg', 'Football', NULL, NULL, NULL, NULL),
(43, 'Logo club rugby', '3129720b5b64527f6429587658e97ae7.png', 'Rugby', NULL, NULL, NULL, NULL),
(45, 'GROSSE LAN POUR ROXER DU PONEY AVEC MES CASUS', '21a3440e1275f367cc1a44ab7592682f.jpg', 'LAN', NULL, NULL, NULL, NULL),
(49, 'L''humour de bon matin j''adore !', '25e3ec16b23757f915751ca7f8d5aa5a.jpg', 'Humour', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `vote`
--

CREATE TABLE IF NOT EXISTS `vote` (
  `foot` int(100) NOT NULL,
  `lan` int(100) NOT NULL,
  `theatre` int(100) NOT NULL,
  PRIMARY KEY (`foot`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vote`
--

INSERT INTO `vote` (`foot`, `lan`, `theatre`) VALUES
(0, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
