-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Dim 03 Mai 2015 à 13:30
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `bdprojet`
--

-- --------------------------------------------------------

--
-- Structure de la table `levels`
--

CREATE TABLE IF NOT EXISTS `levels` (
  `id_level` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `level_number` int(11) NOT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `levels`
--

INSERT INTO `levels` (`id_level`, `name`, `level_number`) VALUES
(16, 'Niveau 1', 1);

-- --------------------------------------------------------

--
-- Structure de la table `queries`
--

CREATE TABLE IF NOT EXISTS `queries` (
  `id_query` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(50) DEFAULT NULL,
  `statement` text NOT NULL,
  `query` text NOT NULL,
  `nb_lines_result` int(11) NOT NULL,
  `query_number` int(11) NOT NULL,
  `id_level` int(11) NOT NULL,
  `teacher_login` varchar(50) DEFAULT NULL,
  `last_modif_date` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_query`),
  KEY `id_level` (`id_level`,`teacher_login`),
  KEY `teacher_login` (`teacher_login`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=178 ;

--
-- Contenu de la table `queries`
--

INSERT INTO `queries` (`id_query`, `topic`, `statement`, `query`, `nb_lines_result`, `query_number`, `id_level`, `teacher_login`, `last_modif_date`) VALUES
(143, '', 'Ecrivez une requête SQL qui permette d''afficher tout le contenu de votre table. ', 'SELECT * FROM bd1.albums', 44, 1, 16, 'chooc', '30/04/2015'),
(144, '', 'Donnez, pour chaque album, son isbn, son titre, son scénariste, son dessinateur ainsi que son année d''édition.', 'SELECT isbn, titre, scenariste, dessinateur, annee_edition FROM bd1.albums', 44, 2, 16, 'chooc', '30/04/2015'),
(145, '', 'Quelles sont les albums édités par "Dupuis" ?', 'SELECT * FROM bd1.albums WHERE editeur = ''Dupuis''', 9, 3, 16, 'chooc', '30/04/2015'),
(146, '', 'Quels sont les titres des albums dont le scénariste est "Goscinny"?', 'SELECT DISTINCT titre FROM bd1.albums WHERE scenariste = ‘Goscinny’', 10, 4, 16, 'chooc', '30/04/2015'),
(147, '', 'Quels sont les titres et les éditeurs des albums dont un des auteurs (scénariste, dessinateur ou coloriste) s''appelle "Uderzo"?', 'SELECT DISTINCT titre, editeur FROM bd1.albums WHERE scenariste = ''Uderzo'' OR dessinateur = ''Uderzo'' OR coloriste = ''Uderzo'' ', 8, 5, 16, 'chooc', '30/04/2015'),
(148, '', 'Quelles sont les albums pour lesquels le coloriste n''a pas été spécifié?', 'SELECT * FROM bd1.albums  WHERE coloriste IS NULL ', 31, 6, 16, 'chooc', '30/04/2015'),
(149, '', 'Quels sont les éditeurs qui ont édité des albums en 1978 ?', 'SELECT DISTINCT editeur FROM bd1.albums WHERE annee_edition = 1978', 1, 7, 16, 'chooc', '30/04/2015'),
(150, '', 'Quels sont les couples scénaristes-dessinateurs ayant travaillé ensemble pour l''éditeur "Dargaud"? (Attention: si le nom du dessinateur est le même que celui du scénariste, c''est que la même personne a effectué les deux tâches, et on ne parlera donc pas ', 'SELECT DISTINCT scenariste, dessinateur FROM bd1.albums  WHERE scenariste != dessinateur  AND editeur = ''Dargaud''', 3, 8, 16, 'chooc', '30/04/2015'),
(151, '', 'Quels sont les albums dont le scénariste et le dessinateur sont la même personne, mais qui ont été mis en couleur par quelqu''un d''autre?', 'SELECT * FROM bd1.albums WHERE scenariste = dessinateur AND coloriste != dessinateur', 1, 9, 16, 'chooc', '30/04/2015'),
(152, '', 'Quels sont les albums dont le scénariste, le dessinateur et le coloriste sont la même personne?', 'SELECT * FROM bd1.albums WHERE scenariste = dessinateur AND coloriste = dessinateur ', 9, 10, 16, 'chooc', '30/04/2015'),
(153, '', 'Quels sont les albums qui n''ont qu''un seul auteur? (Cela recouvre les cas de l''exercice précédent, mais il ne faut pas oublier les tuples pour lesquels un ou deux des trois attributs concernés ont la valeur NULL)', 'SELECT * FROM bd1.albums WHERE (scenariste = dessinateur AND (coloriste = dessinateur OR coloriste IS NULL)) OR (coloriste = dessinateur AND scenariste IS NULL) OR (coloriste = scenariste AND dessinateur IS NULL) OR (dessinateur IS NOT NULL AND scenariste IS NULL AND coloriste IS NULL) OR (dessinateur IS NULL AND scenariste IS NOT NULL AND coloriste IS NULL)  OR (dessinateur IS NULL AND scenariste IS NULL AND coloriste IS NOT NULL)', 26, 11, 16, 'chooc', '30/04/2015'),
(154, '', 'Quels sont les scénaristes dont on a édité, après 1990, des œuvres qui coûtent moins de 8€?', 'SELECT DISTINCT scenariste FROM bd1.albums WHERE prix < 8 AND annee_edition > 1990', 2, 12, 16, 'chooc', '30/04/2015'),
(155, '', 'Quels sont les titres édités en dehors de la décennie 1990-1999, par un éditeur autre que "Casterman", et dont le coloriste est ou bien non spécifié ou bien le même que le dessinateur?', 'SELECT DISTINCT titre FROM bd1.albums  WHERE (annee_edition < 1990 OR annee_edition > 1999) AND editeur != ''Casterman''  AND (coloriste IS NULL OR coloriste = dessinateur)', 29, 13, 16, 'chooc', '30/04/2015'),
(156, '', 'Quels sont les titres qui n''ont été édités ni par "Casterman", ni par "Dupuis", et qui ont, comme scénariste, dessinateur et coloriste, trois auteurs distincts?', 'SELECT DISTINCT titre FROM bd1.albums  WHERE (editeur != ''Casterman'' AND editeur != ''Dupuis'')  AND scenariste != dessinateur AND dessinateur != coloriste  AND coloriste != scenariste', 1, 14, 16, 'chooc', '30/04/2015'),
(157, '', 'Quels sont tous les albums qui rentrent dans une des catégories suivantes au moins : albums de la série "Astérix" édités chez "Dargaud",   albums de la série "Tintin" édités chez "Casterman" ou au "Le Lombard" et   albums sans aucun auteur spécifié.', 'SELECT * FROM bd1.albums  WHERE (editeur = ''Dargaud'' AND serie = ''Astérix'') OR((editeur = ''Casterman'' OR editeur = ''Le Lombard'') AND serie = ''Tintin'') OR (scenariste IS NULL AND coloriste IS NULL AND dessinateur IS NULL)', 13, 15, 16, 'chooc', '30/04/2015'),
(158, '', 'Lister les titres des albums qui contiennent le mot "César".', 'SELECT DISTINCT titre FROM bd1.albums  WHERE titre LIKE ''%César%''', 1, 16, 16, 'chooc', '30/04/2015'),
(159, '', 'Lister les auteurs dont le nom commence par le mot "de" (peu importe la casse).', 'SELECT DISTINCT dessinateur, scenariste, coloriste FROM bd1.albums  WHERE lower(dessinateur) LIKE ''de%'' OR lower(scenariste) LIKE ''de%'' OR lower(coloriste) LIKE ''de%''', 2, 17, 16, 'chooc', '30/04/2015'),
(160, 'order by', 'Donnez tous les titres des albums de la série "Astérix" et leur année d’édition, en ordre chronologique.', 'SELECT DISTINCT titre, annee_edition FROM bd1.albums  WHERE serie = ''Astérix''  ORDER BY annee_edition', 8, 18, 16, 'chooc', '30/04/2015'),
(161, 'order by', 'Donnez tous les titres des albums de la série "Astérix", en ordre alphabétique des titres.', 'SELECT DISTINCT titre FROM bd1.albums WHERE serie = ''Astérix'' ORDER BY titre', 8, 19, 16, 'chooc', '30/04/2015'),
(162, 'order by', 'Donnez les albums (isbn, titre, nom d’éditeur et année d''édition) en classant ces données par éditeur, et pour chaque éditeur, par année d''édition.', 'SELECT isbn, titre, editeur, annee_edition FROM bd1.albums  ORDER BY editeur, annee_edition', 44, 20, 16, 'chooc', '30/04/2015'),
(163, 'order by', 'Donnez les titres et les prix des albums édités par "Dupuis", par ordre décroissant de prix."', 'SELECT DISTINCT titre, prix FROM bd1.albums  WHERE editeur = ''Dupuis''  ORDER BY prix DESC', 9, 21, 16, 'chooc', '30/04/2015'),
(164, 'fonctions agrégées', 'Quelle est la plus ancienne année d''édition de la table bd1.albums?', 'SELECT MIN(annee_edition) FROM bd1.albums', 1947, 22, 16, 'chooc', '30/04/2015'),
(165, 'fonctions agrégées', 'Quel est le prix de l’album le plus cher parmi ceux qui ont été dessinés par un autre dessinateur qu''"Uderzo"?', 'SELECT MAX(prix) FROM bd1.albums  WHERE dessinateur != ''Uderzo''', 14, 23, 16, 'chooc', '30/04/2015'),
(166, 'fonctions agrégées', 'Combien y a-t-il d’albums édités chez "Casterman" ?', 'SELECT COUNT(*) FROM bd1.albums  WHERE editeur = ''Casterman''', 7, 24, 16, 'chooc', '30/04/2015'),
(167, 'fonctions agrégées', 'Combien d’années séparent l’album le plus ancien de l’album le plus récent ?', 'SELECT MAX(annee_edition) - MIN(annee_edition) FROM bd1.albums', 59, 25, 16, 'chooc', '30/04/2015'),
(168, 'fonctions agrégées', 'Combien devrai-je payer si j’achète 3 exemplaires de chacun des albums édités par "Blake et Mortimer" et si le libraire m’accorde une réduction de 25% ?', 'SELECT 3*0.75*SUM(prix) FROM bd1.albums  WHERE editeur = ''Blake et Mortimer''', 216, 26, 16, 'chooc', '30/04/2015'),
(169, 'fonctions agrégées', 'Les albums de la série "Tintin" ont-ils tous le même prix ? (le query pourrait par exemple renvoyer la valeur 1 si la réponse est oui)', 'SELECT COUNT(distinct prix) FROM bd1.albums  WHERE serie = ''Tintin''', 1, 27, 16, 'chooc', '30/04/2015'),
(170, 'fonctions agrégées', 'Combien y a-t-il de séries différentes dans la table bd1.albums?', 'SELECT COUNT(distinct serie) FROM bd1.albums ', 10, 28, 16, 'chooc', '30/04/2015'),
(171, 'fonctions agrégées', 'Combien y a-t-il d’albums pour lesquels la série est spécifiée ? Peut-on répondre à cette question par un query sans clause WHERE ? ', 'SELECT COUNT(serie) FROM bd1.albums', 41, 29, 16, 'chooc', '30/04/2015'),
(172, 'fonctions agrégées', 'Combien y a-t-il d’albums pour lesquels la série n’est pas spécifiée ? Peut-on répondre à cette question par un query sans clause WHERE?', 'SELECT COUNT(*) - COUNT(serie) FROM bd1.albums', 3, 30, 16, 'chooc', '30/04/2015'),
(173, 'fonctions agrégées', 'Combien y a-t-il d''albums dont un des auteurs au moins s''appelle "Uderzo", et quelles sont les dates d''édition du plus ancien et du plus récent d''entre eux?', 'SELECT COUNT(*), MIN(annee_edition), MAX(annee_edition)  FROM bd1.albums  WHERE (scenariste = ''Uderzo'' OR dessinateur = ''Uderzo'' OR coloriste = ''Uderzo'')', -3954, 31, 16, 'chooc', '30/04/2015'),
(174, 'fonctions agrégées', 'Quels est le prix moyen des albums édités par "Dupuis" entre 1990 et 1999 (y compris ces deux années extrêmes) ?', 'SELECT AVG(prix) FROM bd1.albums  WHERE editeur = ''Dupuis'' AND (annee_edition >= 1990 AND annee_edition <= 1999)  ', 9, 32, 16, 'chooc', '30/04/2015'),
(175, 'fonctions agrégées', 'Quel est le prix moyen des albums édités par "Dupuis" à l’exception des albums édités entre 1990 et 1999.', 'SELECT AVG(prix) FROM bd1.albums  WHERE editeur = ''Dupuis'' AND (annee_edition < 1990 OR annee_edition > 1999)', 7, 33, 16, 'chooc', '30/04/2015'),
(176, 'fonctions agrégées', 'Si je veux acheter un exemplaire de tous les albums dont le scénariste est "goscinny" et/ou le dessinateur "uderzo", combien devrai-je débourser?', 'SELECT SUM(prix) FROM bd1.albums  WHERE scenariste = ''Goscinny'' OR dessinateur = ''Uderzo''', 75, 34, 16, 'chooc', '30/04/2015'),
(177, 'fonctions agrégées', 'Si je veux acheter un exemplaire de tous les albums dont le scénariste n’est ni "goscinny" ni "uderzo", combien devrai-je débourser?', 'SELECT SUM(prix) FROM bd1.albums  WHERE scenariste != ''Goscinny'' AND scenariste != ''Uderzo''', 209, 35, 16, 'chooc', '30/04/2015');

-- --------------------------------------------------------

--
-- Structure de la table `resolutions`
--

CREATE TABLE IF NOT EXISTS `resolutions` (
  `student_enrollment` int(11) NOT NULL,
  `id_query` int(11) NOT NULL,
  `answer` text NOT NULL,
  PRIMARY KEY (`student_enrollment`,`id_query`),
  KEY `id_query` (`id_query`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `resolutions`
--

INSERT INTO `resolutions` (`student_enrollment`, `id_query`, `answer`) VALUES
(8781, 143, 'SELECT * FROM bd1.albums');

-- --------------------------------------------------------

--
-- Structure de la table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `enrollment` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`enrollment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `students`
--

INSERT INTO `students` (`enrollment`, `name`, `first_name`, `password`) VALUES
(8781, 'DABROWSKI', 'Virginia\r', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3'),
(8798, 'MOURADE', 'Ibrahim\r', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3'),
(9439, 'RACHDI', 'Noureddine\r', ''),
(9465, 'TAVERNIER', 'Cedric\r', ''),
(9747, 'AZABAR', 'Zakariya\r', ''),
(10084, 'DEWIGNE', 'Florent\r', ''),
(10193, 'DOUGHERTY', 'Joseph\r', ''),
(10612, 'HOLLANDERS', 'Robin\r', ''),
(10682, 'TONNEAU', 'Thomas\r', ''),
(11628, 'DALMAU FORCANO', 'Marc\r', ''),
(11762, 'TECHY', 'Martin\r', ''),
(12241, 'EL YAKOUBI', 'Iâtimad\r', ''),
(12306, 'BOCK', 'Benoît\r', ''),
(12330, 'DRIESSEN', 'Christophe\r', ''),
(12341, 'GÉRARD', 'Nicolas-Andrea\r', ''),
(12370, 'ANNICCHIARICO', 'Vincenzo\r', ''),
(12396, 'TRUONG', 'Vinh Kien\r', ''),
(12493, 'SINON', 'Clément\r', ''),
(12494, 'GONEN', 'Gültekin\r', ''),
(12533, 'ERMGODTS', 'Christopher\r', ''),
(12554, 'KARABAG', 'Umid\r', ''),
(12604, 'MAHI', 'Samia\r', ''),
(12730, 'GÉRARD', 'Florian\r', ''),
(12732, 'SOUSA DOS SANTOS', 'Alexandre\r', ''),
(12849, 'ISHIMWE', 'Remy\r', ''),
(12935, 'DESÉNÉPART', 'Valentin\r', ''),
(13179, 'GOBEAUX', 'Thomas\r', ''),
(13528, 'HANSON', 'Pierre-Yves\r', ''),
(13644, 'VERLANT', 'Antoine\r', ''),
(13650, 'OLDENHOVE de GUERTECHIN', 'Simon\r', ''),
(13857, 'DENIS', 'Quentin\r', ''),
(13889, 'ARSZAGI VEL HARSZAGI', 'Kamil\r', ''),
(13919, 'CRUZ LLUMIQUINGA', 'Jefferson\r', ''),
(13949, 'VAN LITHAUT', 'Romain\r', ''),
(13986, 'RENSON', 'Gilles\r', ''),
(14051, 'DJEDIDI', 'Hichem\r', ''),
(14053, 'BUDAK', 'Stéphane\r', ''),
(14129, 'de VILLENFAGNE de VOGELSANCK', 'Gaspard\r', ''),
(14192, 'NYEEM', 'Mohammad\r', ''),
(14243, 'BOGDANOVIC', 'Stefan\r', ''),
(14337, 'BELKADI', 'Nizar\r', ''),
(14407, 'VAN LOO', 'Nelson\r', ''),
(14558, 'ROCHEZ', 'Arnaud\r', ''),
(14973, 'IRANDOUST', 'Marzieh\r', ''),
(15172, 'OSTE', 'Nicolas\r', ''),
(15319, 'GRIMMONPRÉ', 'Romain\r', ''),
(15324, 'MAES', 'Timothy\r', ''),
(15774, 'ASLI', 'Rachid\r', ''),
(15779, 'BELHARCH', 'Hicham\r', ''),
(15781, 'd''OULTREMONT', 'Matthieu\r', ''),
(15782, 'PIERRE', 'Anthony\r', ''),
(15783, 'BAKKALI KARFA', 'Nadir\r', ''),
(15793, 'TASYÜREK', 'Emre\r', ''),
(15794, 'RAMOS NEVES', 'Jonathan\r', ''),
(15795, 'LE CLERCQ', 'Mike\r', ''),
(15806, 'SAMELSON', 'Jonathan\r', ''),
(15810, 'DUVILLIER', 'Romain\r', ''),
(15821, 'YE', 'Sheng Hao\r', ''),
(15822, 'BOUVIN', 'Timothée\r', ''),
(15824, 'TRÉMOUROUX', 'Antoine\r', ''),
(15825, 'BOUGAOU', 'Noé\r', ''),
(15834, 'LEROY', 'Gaël\r', ''),
(15835, 'MOLINGHEN', 'Yannick\r', ''),
(15892, 'CATHERINE', 'Thomas\r', ''),
(15893, 'DE LA CRUZ MALLADA', 'Jimmy\r', ''),
(15902, 'BOTTEMANNE', 'Fany\r', ''),
(15905, 'GOLMAR LUQUE', 'Diego\r', ''),
(15907, 'CHARLIER', 'Anthony\r', ''),
(15918, 'ERKUL', 'Michaël\r', ''),
(15921, 'ERYÖRÜK', 'Muharrem\r', ''),
(15997, 'T''KINDT', 'Saifeddine\r', ''),
(16000, 'COOLS', 'Alexandre\r', ''),
(16096, 'FILLEUR', 'Thibault\r', ''),
(16101, 'PATINELLA', 'Nicolas\r', ''),
(16105, 'PESSERS', 'Ivan\r', ''),
(16186, 'KECH', 'Damien\r', ''),
(16200, 'LESPINOIS', 'Nicolas\r', ''),
(16206, 'YALIM', 'Sevag\r', ''),
(16241, 'DELHAYE', 'Gabriel\r', ''),
(16258, 'FRÉMONT', 'Jonathan\r', ''),
(16268, 'DELWART', 'Valentin\r', ''),
(16273, 'STRAUVEN', 'Mélissa\r', ''),
(16320, 'DOS SANTOS', 'Bastien\r', ''),
(16363, 'NGUYEN', 'Dat Toan\r', ''),
(16372, 'LONCIN', 'Sébastien\r', ''),
(16397, 'MANIET', 'Alexandre\r', ''),
(16399, 'MANIET', 'Antoine\r', ''),
(16406, 'MZOUGHI', 'Meriam\r', ''),
(16414, 'DE CONINCK-GOSSEAU', 'Maxim\r', ''),
(16415, 'BEVERNAGE', 'Rudy\r', ''),
(16419, 'ANTHOONS', 'Nicolas\r', ''),
(16421, 'WAGEMANS', 'Jeremy\r', ''),
(16429, 'MAYNÉ', 'Lonny\r', ''),
(16432, 'DURIEU', 'Emilien\r', ''),
(16440, 'de BURLET', 'Marc\r', ''),
(16441, 'YAKOUB', 'Jacques\r', ''),
(16442, 'CUPI', 'Dylan\r', ''),
(16443, 'SNOECK', 'Tanguy\r', ''),
(16445, 'BLANCKAERT', 'Claire\r', ''),
(16448, 'TIRCHER', 'Kyrill\r', ''),
(16451, 'GARCIA AUGUSTO', 'Marcos\r', ''),
(16456, 'RIGA', 'Sébastien\r', ''),
(16461, 'GÜNDES', 'Vartan\r', ''),
(16462, 'DENUIT', 'Maxime\r', ''),
(16464, 'JANSSENS', 'Thibaut\r', ''),
(16466, 'GAILLET', 'Mike\r', ''),
(16569, 'DECLERCQ', 'Benjamin\r', ''),
(16656, 'PLACE', 'Sébastien\r', ''),
(16824, 'LEBON', 'Sébastien\r', ''),
(16842, 'DE SPIEGELAERE', 'Louis\r', ''),
(17000, 'BLONDEAU', 'Brendan\r', ''),
(17026, 'CHRISTODOULOU de GRAILLET', 'Nicolas\r', ''),
(17118, 'RONSMANS', 'Thomas\r', ''),
(17121, 'MACASPAC', 'Marc-Kevin\r', ''),
(17188, 'NGUYEN', 'Thiên Toàn\r', ''),
(17215, 'DEPRAETE', 'Adeline\r', ''),
(17218, 'ANNIA', 'Imad\r', ''),
(17221, 'LAMBRICHT', 'Antoine\r', ''),
(17291, 'YAHIAOUI', 'Diaa\r', ''),
(17293, 'MURAT', 'Endri\r', ''),
(17297, 'BUYENS', 'Nathan\r', ''),
(17368, 'COSTE-GANDREY', 'Alexandre\r', ''),
(17400, 'MENDES ROSA', 'Christian\r', ''),
(17435, 'JACOB', 'Loury\r', ''),
(17451, 'MASSART', 'Woody\r', ''),
(17457, 'ALP', 'Mustafa\r', ''),
(17480, 'PIERRE', 'Benjamin\r', ''),
(17500, 'TOUMI', 'Yèssine\r', ''),
(17523, 'AMETI', 'Rufat\r', ''),
(17528, 'OVAERT', 'Lionel\r', ''),
(17543, 'ABAJTOUR', 'Ilyas\r', ''),
(17574, 'CHEVALIER', 'Romain\r', ''),
(17575, 'SHEVTCHENKO', 'Philipp\r', ''),
(17581, 'PINTUS', 'Pierre-Nicolas\r', ''),
(17582, 'RODRIGUEZ VAZQUEZ', 'Francisco\r', ''),
(17613, 'BORDIGATO', 'Patrick Junior\r', ''),
(17625, 'GRUMIRO', 'Fabio\r', ''),
(17626, 'DIMOV', 'Theodor\r', ''),
(17640, 'BLJAKAJ', 'Dukagjin\r', ''),
(17655, 'BOUCHER', 'Nicolas\r', ''),
(17662, 'GAILLET', 'Pierre-Paul\r', ''),
(17664, 'MOUNIR', 'Hamza\r', ''),
(17713, 'NGUYEN', 'Phu Cuong\r', ''),
(17736, 'NSENDA THAMBWE', 'Hervé-Claude\r', ''),
(17738, 'VANCAMPENHAULT', 'Anthony\r', ''),
(17765, 'AERTS', 'Mathieu\r', ''),
(17766, 'BAKALEM', 'Abdelhak\r', ''),
(17790, 'PIROZZI', 'Francesco\r', ''),
(17793, 'SENHAJI', 'Taoufiq\r', ''),
(17854, 'LASKOWSKI', 'Maciej\r', ''),
(17871, 'DELLOT', 'Jonathan\r', ''),
(17879, 'GOSSELIN', 'Louis\r', ''),
(17900, 'EZAABOUJI', 'Zineb\r', ''),
(17924, 'YALÇINÖZ', 'Serhat\r', ''),
(17931, 'ZOAO', 'Kevin\r', ''),
(17972, 'VELARDE VELARDE', 'Bryan\r', ''),
(17977, 'SCHWEISTHAL', 'Jean-François\r', ''),
(17996, 'DEGRÈVE', 'Olivier\r', ''),
(17998, 'BERTOLINI', 'Nicolas\r', ''),
(18073, 'CANOOT', 'Olivier\r', ''),
(18074, 'BASHIR', 'Ahmad\r', ''),
(18080, 'LAPORTE', 'Robin\r', ''),
(18085, 'MATON', 'Anthony\r', ''),
(18098, 'HOSSEINI', 'Seyyed\r', ''),
(18109, 'FANNA', 'Maxime\r', ''),
(18134, 'BOONEN', 'Bastien\r', ''),
(18145, 'STEVENS', 'Loïc\r', ''),
(18160, 'COTTON', 'Pierric\r', ''),
(18164, 'DE SUTTER', 'Willi\r', ''),
(18174, 'VAN GREVENSTEIN', 'Fredrik\r', ''),
(18185, 'FASSIAUX', 'Thomas\r', ''),
(18191, 'IMPERIAL', 'Erik\r', ''),
(18197, 'VERWILGHEN', 'Maxime\r', ''),
(18206, 'DRAGOMIR', 'Philippe\r', ''),
(18212, 'ELHASSANI', 'Elias\r', ''),
(18284, 'DOCQUIER', 'Arnaud\r', ''),
(18320, 'VERTONGHEN', 'Renaud\r', ''),
(18367, 'EVRARD', 'Amaury\r', ''),
(18405, 'DESMET', 'Jérémy\r', ''),
(18407, 'SAIFI', 'Ayoub\r', ''),
(18450, 'CIKU', 'Alan\r', ''),
(18551, 'LARBI', 'Youssef\r', ''),
(18574, 'MAFIKIRI KAKULE', 'Hubert\r', ''),
(18643, 'FAIN', 'Damien\r', ''),
(18693, 'ARESTIGUE BARREDA', 'Ronald\r', ''),
(18722, 'WEILHAMMER', 'Sebastian\r', '');

-- --------------------------------------------------------

--
-- Structure de la table `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
  `login` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `teachers`
--

INSERT INTO `teachers` (`login`, `name`, `first_name`, `password`) VALUES
('chooc', 'Choquet', 'Olivier', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3'),
('colje', 'Collinet', 'Jean-Luc\r', ''),
('lecem', 'Leconte', 'Emmeline\r', '');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `queries`
--
ALTER TABLE `queries`
  ADD CONSTRAINT `queries_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `levels` (`id_level`),
  ADD CONSTRAINT `queries_ibfk_2` FOREIGN KEY (`teacher_login`) REFERENCES `teachers` (`login`);

--
-- Contraintes pour la table `resolutions`
--
ALTER TABLE `resolutions`
  ADD CONSTRAINT `resolutions_ibfk_1` FOREIGN KEY (`student_enrollment`) REFERENCES `students` (`enrollment`),
  ADD CONSTRAINT `resolutions_ibfk_2` FOREIGN KEY (`id_query`) REFERENCES `queries` (`id_query`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
