-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Dim 03 Mai 2015 à 13:29
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `bd3`
--

-- --------------------------------------------------------

--
-- Structure de la table `albums`
--

CREATE TABLE IF NOT EXISTS `albums` (
  `isbn` char(14) NOT NULL,
  `titre` varchar(50) NOT NULL,
  `serie` varchar(20) DEFAULT NULL,
  `num_editeur` int(11) NOT NULL,
  `annee_edition` int(11) DEFAULT NULL,
  `prix` double NOT NULL,
  PRIMARY KEY (`isbn`),
  KEY `fk_edi` (`num_editeur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `albums`
--

INSERT INTO `albums` (`isbn`, `titre`, `serie`, `num_editeur`, `annee_edition`, `prix`) VALUES
('2-152-12345-X', 'Les aventures complètes d''Oumpah-Pah', 'Oumpah Pah', 6, 1979, 12),
('2-203-00103-8', 'Les Cigares du Pharaon', 'Tintin', 7, 1955, 8),
('2-203-00105-4', 'L''Oreille Cassée', 'Tintin', 7, 1979, 8),
('2-203-00107-0', 'Le Sceptre d''Ottokar', 'Tintin', 7, 1947, 8),
('2-203-00109-0', 'Coke en Stock', 'Tintin', 7, 1958, 8),
('2-203-00117-8', 'L''Affaire Tournesol', 'Tintin', 7, 1956, 8),
('2-203-00123-2', 'Tintin et les Picaros', 'Tintin', 7, 1976, 8),
('2-203-12345-6', 'Vol 714 pour Sydney', 'Tintin', 7, 1968, 8),
('2-205-00096-9', 'Astérix le gaulois', 'Astérix', 2, 1975, 6),
('2-205-00230-9', 'Astérix légionnaire', 'Astérix', 2, 1976, 6),
('2-205-00517-0', 'Canyon Apache', 'Lucky Luke', 2, 1975, 8),
('2-205-00585-5', 'Ma Dalton', 'Lucky Luke', 2, 1980, 5),
('2-205-00600-2', 'Les lauriers de César', 'Astérix', 2, 1978, 6),
('2-205-00920-6', 'La guérison des Dalton', 'Lucky Luke', 2, 1978, 5),
('2-205-00921-4', 'Obélix et compagnie', 'Astérix', 6, 1976, 6),
('2-205-01144-8', 'Le Fil qui chante', 'Lucky Luke', 2, 1977, 5),
('2-205-01150-2', 'Astérix chez les Belges', 'Astérix', 2, 1979, 4),
('2-205-03043-4', 'La fiancée de Lucky Luke', 'Lucky Luke', 2, 1985, 5),
('2-258-03431-0', 'Adieu Monde Cruel!', 'Calvin et Hobbes', 9, 1991, 9),
('2-8001-0015-X', 'Le voyageur du mésozoïque', 'Spirou', 4, 1977, 7),
('2-8001-0017-6', 'Z comme Zorglub', 'Spirou', 4, 1977, 7),
('2-8001-0018-4', 'L''ombre du Z', 'Spirou', 4, 1976, 7),
('2-8001-0019-2', 'Spirou et les hommes-bulles', 'Spirou', 4, 1989, 7),
('2-8001-0091-5', 'LE CAS LAGAFFE', 'Gaston', 4, 1977, 6),
('2-8001-0955-6', 'LA SAGA DES GAFFES', 'Gaston', 4, 1982, 6),
('2-8001-2900-x', 'Zeke raconte des histoires', NULL, 4, 1999, 14),
('2-8021-3900-x', 'Spirou et Fantasio à Tokyo', 'Dupuis', 2, 2001, 14),
('2-8031-3900-6', 'Une dernière aventure d''Astérix', 'Astérix', 2, 2006, 14),
('2-8035-0029-9', 'Modeste et Pompon', 'Modeste', 5, 1981, 12),
('2-86497-004-X', 'L''odyssée d''Astérix', 'Astérix', 1, 1981, 6),
('2-86497-020-1', 'Astérix chez Rahazade', 'Astérix', 1, 1987, 6),
('2-87097-002-1', 'Le Secret de l''Espadon tome 1', 'Blake et Mortimer', 3, 1984, 9),
('2-87097-004-8', 'Le Secret de L''Espadon tome 2', 'Blake et Mortimer', 3, 1985, 9),
('2-87097-005-6', 'Le Secret de L''Espadon tome 3', 'Blake et Mortimer', 3, 1986, 9),
('2-87097-008-0', 'Le mystère de la grande pyramide', 'Blake et Mortimer', 3, 1986, 10),
('2-87097-009-9', 'Le mystère de la grande pyramide', 'Blake et Mortimer', 3, 1987, 10),
('2-87097-010-2', 'La marque jaune', 'Blake et Mortimer', 3, 1987, 9),
('2-87097-017-X', 'Les 3 Formules du Professeur Sato', 'Blake et Mortimer', 3, 1990, 12),
('2-87097-043-9', 'L''Affaire Françis Blake', 'Blake et Mortimer', 3, 1996, 14),
('2-87097-052-8', 'La Machination Voronov', 'Blake et Mortimer', 3, 2000, 14),
('2-87097-055-9', 'Joyeux Noël, May', NULL, 4, 1998, 7),
('2-88257-000-4', 'Nitroglycérine', 'Lucky Luke', 2, 1987, 5),
('2-895-000123', 'Idées Noires', NULL, 8, 1981, 10),
('2-908-46271-0', 'FAITES GAFFE A LAGAFFE', 'Gaston', 4, 1996, 6);

-- --------------------------------------------------------

--
-- Structure de la table `auteurs`
--

CREATE TABLE IF NOT EXISTS `auteurs` (
  `num` int(11) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `adresse` varchar(30) DEFAULT NULL,
  `e_mail` varchar(30) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `auteurs`
--

INSERT INTO `auteurs` (`num`, `nom`, `adresse`, `e_mail`) VALUES
(1, 'Uderzo', NULL, 'uderzo@hotmail.com'),
(2, 'Goscinny', NULL, 'gosciny@gmail.com'),
(3, 'Hergé', NULL, 'Tintin@hotmail.be'),
(4, 'Franquin', NULL, 'franquin@yahoo.fr'),
(5, 'Jacobs', NULL, 'jacobs@yahoo.fr'),
(6, 'de Moor', NULL, 'de_moor@yahoo.fr'),
(7, 'Sente', NULL, 'sente@yahoo.fr'),
(8, 'Juilliard', NULL, 'juilliard@gmail.com'),
(9, 'DeMille', NULL, 'de_mille@gmail.fr'),
(10, 'Benoît', NULL, 'benoit@yahoo.fr'),
(11, 'Van Hamme', 'Bruxelles', 'van_hamme@hotmail.com'),
(12, 'Fanny', NULL, 'fanny@gmail.com'),
(13, 'Jidehem', NULL, 'jidehem@gmail.com'),
(14, 'Cosey', NULL, 'cosey@hotmail.com'),
(15, 'Morris', NULL, 'morris@gmail.com'),
(16, 'Guy Vidal', NULL, 'guy.vidal@hotmail.be'),
(17, 'Dupuis', NULL, 'Dupuis@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `editeurs`
--

CREATE TABLE IF NOT EXISTS `editeurs` (
  `num` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `adresse` varchar(30) DEFAULT NULL,
  `pays` char(1) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `editeurs`
--

INSERT INTO `editeurs` (`num`, `nom`, `adresse`, `pays`) VALUES
(1, 'Albert René', NULL, 'f'),
(2, 'Dargaud', NULL, 'f'),
(3, 'Blake et Mortimer', NULL, 'b'),
(4, 'Dupuis', 'Marcinelle', 'b'),
(5, 'Magic Strip', 'Bruxelles', 'b'),
(6, 'Le Lombard', 'Bruxelles', 'b'),
(7, 'Casterman', NULL, 'b'),
(8, 'Fluide Glacial', NULL, 'f'),
(9, 'Watterson', NULL, 'a'),
(10, 'Jacobs', NULL, 'a');

-- --------------------------------------------------------

--
-- Structure de la table `participations`
--

CREATE TABLE IF NOT EXISTS `participations` (
  `isbn` char(14) NOT NULL,
  `num_auteur` int(11) NOT NULL,
  `participe` char(1) NOT NULL,
  PRIMARY KEY (`isbn`,`num_auteur`,`participe`),
  KEY `fk_aut` (`num_auteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `participations`
--

INSERT INTO `participations` (`isbn`, `num_auteur`, `participe`) VALUES
('2-152-12345-X', 1, 'd'),
('2-205-00096-9', 1, 'd'),
('2-205-00230-9', 1, 'd'),
('2-205-00600-2', 1, 'd'),
('2-205-00921-4', 1, 'd'),
('2-205-01150-2', 1, 'c'),
('2-205-01150-2', 1, 'd'),
('2-86497-004-X', 1, 'd'),
('2-86497-004-X', 1, 's'),
('2-86497-020-1', 1, 'd'),
('2-86497-020-1', 1, 's'),
('2-152-12345-X', 2, 's'),
('2-205-00096-9', 2, 's'),
('2-205-00230-9', 2, 's'),
('2-205-00517-0', 2, 's'),
('2-205-00585-5', 2, 's'),
('2-205-00600-2', 2, 's'),
('2-205-00920-6', 2, 's'),
('2-205-00921-4', 2, 's'),
('2-205-01144-8', 2, 's'),
('2-205-01150-2', 2, 's'),
('2-203-00103-8', 3, 'c'),
('2-203-00103-8', 3, 'd'),
('2-203-00103-8', 3, 's'),
('2-203-00105-4', 3, 'c'),
('2-203-00105-4', 3, 'd'),
('2-203-00105-4', 3, 's'),
('2-203-00107-0', 3, 'c'),
('2-203-00107-0', 3, 'd'),
('2-203-00107-0', 3, 's'),
('2-203-00109-0', 3, 'c'),
('2-203-00109-0', 3, 'd'),
('2-203-00109-0', 3, 's'),
('2-203-00117-8', 3, 'c'),
('2-203-00117-8', 3, 'd'),
('2-203-00117-8', 3, 's'),
('2-203-00123-2', 3, 'c'),
('2-203-00123-2', 3, 'd'),
('2-203-00123-2', 3, 's'),
('2-203-12345-6', 3, 'c'),
('2-203-12345-6', 3, 'd'),
('2-203-12345-6', 3, 's'),
('2-8001-0015-X', 4, 'd'),
('2-8001-0017-6', 4, 'd'),
('2-8001-0018-4', 4, 'd'),
('2-8001-0019-2', 4, 'd'),
('2-8001-0019-2', 4, 's'),
('2-8001-0091-5', 4, 'd'),
('2-8001-0955-6', 4, 'd'),
('2-8001-0955-6', 4, 's'),
('2-8035-0029-9', 4, 'd'),
('2-895-000123', 4, 'd'),
('2-908-46271-0', 4, 'd'),
('2-908-46271-0', 4, 's'),
('2-87097-002-1', 5, 'd'),
('2-87097-002-1', 5, 's'),
('2-87097-004-8', 5, 'd'),
('2-87097-004-8', 5, 's'),
('2-87097-005-6', 5, 'd'),
('2-87097-005-6', 5, 's'),
('2-87097-008-0', 5, 'd'),
('2-87097-008-0', 5, 's'),
('2-87097-009-9', 5, 'd'),
('2-87097-009-9', 5, 's'),
('2-87097-010-2', 5, 'd'),
('2-87097-010-2', 5, 's'),
('2-87097-017-X', 5, 's'),
('2-87097-017-X', 6, 'c'),
('2-87097-017-X', 6, 'd'),
('2-87097-052-8', 7, 's'),
('2-87097-052-8', 8, 'd'),
('2-87097-052-8', 9, 'c'),
('2-8021-3900-x', 10, 'd'),
('2-87097-043-9', 10, 's'),
('2-87097-043-9', 11, 'd'),
('2-908-46271-0', 12, 'c'),
('2-8001-0018-4', 13, 's'),
('2-8001-2900-x', 14, 'c'),
('2-8001-2900-x', 14, 'd'),
('2-8001-2900-x', 14, 's'),
('2-87097-055-9', 14, 'c'),
('2-87097-055-9', 14, 'd'),
('2-87097-055-9', 14, 's'),
('2-205-00517-0', 15, 'd'),
('2-205-00585-5', 15, 'd'),
('2-205-00920-6', 15, 'd'),
('2-205-01144-8', 15, 'd'),
('2-205-03043-4', 15, 'd'),
('2-88257-000-4', 15, 'd'),
('2-205-03043-4', 16, 's'),
('2-88257-000-4', 16, 's'),
('2-8031-3900-6', 17, 'd');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`num_editeur`) REFERENCES `editeurs` (`num`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `participations`
--
ALTER TABLE `participations`
  ADD CONSTRAINT `participations_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `albums` (`isbn`) ON UPDATE CASCADE,
  ADD CONSTRAINT `participations_ibfk_2` FOREIGN KEY (`num_auteur`) REFERENCES `auteurs` (`num`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
