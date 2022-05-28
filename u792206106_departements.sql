-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 04 sep. 2021 à 08:55
-- Version du serveur :  10.4.18-MariaDB-cll-lve
-- Version de PHP : 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `u792206106_departements`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `id_admin` int(20) NOT NULL,
  `nom_admin` varchar(50) NOT NULL,
  `prenom_admin` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `Image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`id_admin`, `nom_admin`, `prenom_admin`, `email`, `mdp`, `Image`) VALUES
(1, 'Driss', 'ABBADI', 'elmehdi.elhamine@gmail.com', '$2y$10$2ANXo.j2ea7akGdDJytcL.Khu3HPGy/c2B3hVB.gnQR7NP86lcoVS', 'admin.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `candidats`
--

CREATE TABLE `candidats` (
  `id_candidat` int(11) NOT NULL,
  `poste` int(11) NOT NULL,
  `professeur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `candidats`
--

INSERT INTO `candidats` (`id_candidat`, `poste`, `professeur`) VALUES
(132, 27, 5),
(135, 27, 14),
(143, 35, 1),
(144, 35, 8),
(145, 34, 13),
(146, 34, 9),
(147, 35, 11),
(149, 27, 1),
(179, 50, 5);

-- --------------------------------------------------------

--
-- Structure de la table `cycle`
--

CREATE TABLE `cycle` (
  `id_cycle` int(20) NOT NULL,
  `nom_cycle` varchar(50) NOT NULL,
  `DateCreation` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cycle`
--

INSERT INTO `cycle` (`id_cycle`, `nom_cycle`, `DateCreation`) VALUES
(1, 'Licence', '2021-08-09 13:48:08'),
(2, 'Master', '2021-08-09 13:48:08'),
(3, 'Doctorat', '2021-08-13 11:50:03'),
(4, 'Bachelor', '2021-08-13 11:50:03'),
(5, 'Licence Professionnelle', '2021-08-31 14:36:47'),
(6, 'Master Spécialisé', '2021-08-31 14:36:47');

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE `departement` (
  `id_dprtm` int(20) NOT NULL,
  `nom_dprtm` varchar(50) NOT NULL,
  `chefDepartement` int(20) DEFAULT NULL,
  `DateCreation` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`id_dprtm`, `nom_dprtm`, `chefDepartement`, `DateCreation`) VALUES
(1, 'science économique', NULL, '2021-08-09 13:51:47'),
(2, 'Droit francais', 5, '2021-08-09 13:51:47'),
(3, 'droit arab', NULL, '2021-08-31 14:28:14'),
(4, 'Mathématique - statistique et Informatique', NULL, '2021-08-31 14:28:14');

-- --------------------------------------------------------

--
-- Structure de la table `election`
--

CREATE TABLE `election` (
  `id_election` int(11) NOT NULL,
  `nom_election` varchar(255) NOT NULL,
  `date_election` date NOT NULL,
  `date_debut_insc` date NOT NULL,
  `date_fin_insc` date NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `election`
--

INSERT INTO `election` (`id_election`, `nom_election`, `date_election`, `date_debut_insc`, `date_fin_insc`, `status`) VALUES
(1, 'élections  2023', '2021-09-02', '2021-08-24', '2021-09-15', 'active'),
(2, 'election 2021iiii', '2021-08-29', '2021-08-07', '2021-08-20', 'inactive');

-- --------------------------------------------------------

--
-- Structure de la table `equipe_pedagogique`
--

CREATE TABLE `equipe_pedagogique` (
  `id_equipe` int(20) NOT NULL,
  `intitule_equipe` varchar(50) NOT NULL,
  `coorModule` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `equipe_pedagogique`
--

INSERT INTO `equipe_pedagogique` (`id_equipe`, `intitule_equipe`, `coorModule`) VALUES
(1, 'EQUIPE1', 1),
(5, 'EQUIPE2', 8),
(6, 'EQUIPE3', 9);

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

CREATE TABLE `filiere` (
  `id_filiere` int(20) NOT NULL,
  `intitule_filiere` varchar(50) NOT NULL,
  `Langue` varchar(50) DEFAULT NULL,
  `objectifs` longtext DEFAULT NULL,
  `competences` longtext DEFAULT NULL,
  `debouches` longtext DEFAULT NULL,
  `conditions_acces` longtext DEFAULT NULL,
  `listeDesModules` longtext DEFAULT NULL,
  `moyens_logistiques` longtext DEFAULT NULL,
  `partenariats_cooperation` longtext DEFAULT NULL,
  `pfe` longtext DEFAULT NULL,
  `stage` longtext DEFAULT NULL,
  `coorFiliere` int(20) DEFAULT NULL,
  `id_cycle` int(20) NOT NULL,
  `id_departement` int(20) NOT NULL,
  `volumeHoraireGlobal` int(11) DEFAULT NULL,
  `isAccredited` tinyint(1) NOT NULL DEFAULT 0,
  `isBrouillon` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `filiere`
--

INSERT INTO `filiere` (`id_filiere`, `intitule_filiere`, `Langue`, `objectifs`, `competences`, `debouches`, `conditions_acces`, `listeDesModules`, `moyens_logistiques`, `partenariats_cooperation`, `pfe`, `stage`, `coorFiliere`, `id_cycle`, `id_departement`, `volumeHoraireGlobal`, `isAccredited`, `isBrouillon`) VALUES
(24, 'Licence d\'etude fondamental sciences economiques e', 'Francais', 'blablablablablablabla', 'blablablablabla', 'blablablablablablablabla', 'blablablablablablabla', 'blablablablablablabla', 'blablablablablablablabla', 'blablablablablablabla', 'blablablablablablablbla', 'blablablablablablabla', 8, 1, 1, 1710, 1, 0),
(27, 'Droit en langue francais', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 0, 1, 0),
(31, 'AUDIT ET CONTROLE DE GESTION ET SYSTEME D\'INFORMAT', '', '', '', '', '', '', '', '', '', '', NULL, 2, 1, 0, 1, 0),
(32, 'AUDIT ET CONTROLE DE GESTION ET SYSTEME D\'INFORMAT', '', '', '', '', '', '', '', '', '', '', NULL, 2, 1, 0, 1, 0),
(33, 'AUDIT ET CONTROLE DE GESTION ET SYSTEME D\'INFORMAT', '', '', '', '', '', '', '', '', '', '', NULL, 2, 1, 0, 1, 0),
(34, 'ECONOMIE ET EVALUATION DES POLITIQUES PUBLIQUES (E', '', 'Ce Master a pour objectif principal d’accompagner la demande sociale croissante visant la systématisation, l’ancrage et la\r\npromotion des politiques publiques fondées sur les preuves (Evidence based public policy), d’autant que la constitution de 2011\r\na gravé dans son marbre le principe d’évaluation des politiques publiques et bien d’autres règles de bonne gestion de la chose\r\npublique. Dans cette perspective, il vise à renforcer et professionnaliser le rôle de l’économiste dans les travaux d’évaluation\r\ndes politiques publiques. Sans s’y réduire, il vise notamment à faire acquérir aux étudiants l’expertise, les techniques et outils\r\nmodernes d’évaluation des politiques publiques, en phase avec les meilleures pratiques internationales en la matière.', '', 'Former des cadres capables d’assister les\r\nordonnateurs et les donneurs d’ordre dans le\r\npilotage des projets d’évaluation des projets\r\net politiques publics\r\nformer des cadres capables de participer\r\net/ou de conduire une mission d’évaluation\r\ndes projets et politiques publics', 'DIPLOMES REQUIS : Licence en Sciences Economiques et\r\ndiplômes équivalents ;\r\nPRE-REQUIS PEDAGOGIQUES SPECIFIQUES :\r\nMicroéconomie de base, Macro-économie, statistiques et\r\nprobabilités, Econométrie de base, politiques\r\néconomiques ;\r\nPROCEDURE DE SELECTION EN 3 ETAPES :\r\n1- Présélection sur étude des dossiers / 2- Test écrit / 3-\r\nEntretien.\r\n', '', '', '', 'pfe', 'stage', 13, 2, 1, 0, 1, 0),
(35, 'Actuariat et finance', '', '', '', '', '', '', '', '', '', '', NULL, 2, 1, 0, 1, 0),
(36, 'Droit en langue francais', '', '', '', '', '', '', '', '', '', '', NULL, 2, 1, 0, 0, 0),
(37, '', '', '', '', '', '', '', '', '', '', '', 5, 1, 1, 0, 1, 0),
(38, 'miage', 'francais', 'cette formation permet de bien ', 'Maitrise des méthodes et des technologies de développement informatique \r\nAnalyse, conception et gestion des Systèmes d’Information (SI) \r\nGestion et administration de bases de données \r\nCompétences en gestion de l’entreprise selon une approche informatique \r\nInitiation aux outils d’aide à la décision informatisée \r\nExploration des environnements Big Data \r\nConnaissance en sciences sociales et communications professionnelles ', 'Analyste et Concepteur de systèmes d’information ;\r\nConcepteur des Systèmes d’information Décisionnels ;\r\nChef de Projet junior en développement ;\r\nAdministrateur de systèmes de Bases de Données ;\r\nGestionnaire et développeur de projets informatiques ;\r\nConsultant junior en système d’information ;\r\nConsultant ERP ;\r\nManager d’entreprise dans les domaines informatiques', 'L’inscription en Licence Professionnelle est ouverte aux titulaires d’un Bac +2 (DUT ou DEUG) , diplôme Technicien Spécialisé OFPPT validé, ou équivalent.\r\n\r\nAvec étude de dossier au cas par cas selon la réglementation en vigueur et l\'autorisation du ministère de tutelle.\r\nEtude de dossier par la commission d\'orientation, de ce fait il faut :\r\n\r\nRemplir le dossier de candidature : \r\nRejoindre le dossier de candidature des bulletins 1ère et 2ème Bac (Terminale) et les Relevés des années universitaires disponibles, documents à scanner et envoyer à l’adresse ', 'Développement des applications\r\nGestion de l’entreprise\r\nSystèmes d’informations\r\nAlgorithmique et Statistiques\r\nConception et gestion des bases de données\r\nProgrammation Orientée Objet (Java)\r\nManagement de projet\r\nDroit de l’informatique\r\nCommunication et sciences sociales\r\nStage professionnel', 'test', 'UniversitÃ© de Versailles', 'pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp', 'stage de fin d\'etude', 2, 1, 1, 105, 0, 0),
(39, 'TEST', NULL, 'gujh', 'guk', 'gkujbuj', 'bkujb', NULL, NULL, NULL, 'kbjbj', 'vhjh', 11, 1, 1, NULL, 0, 0),
(40, 'MANAGEMENT DES ENTREPRISES ET GESTION DE PROJETS', NULL, '', '', '', '', NULL, NULL, NULL, '', '', 1, 2, 1, NULL, 0, 0),
(41, 'naknkefrefef', NULL, '', '', '', '', NULL, NULL, NULL, '', '', NULL, 2, 1, NULL, 0, 0),
(42, 'sdgrth', NULL, '', '', '', '', NULL, NULL, NULL, '', '', NULL, 1, 1, NULL, 0, 0),
(43, 'Ffffff', NULL, '', '', '', '', NULL, NULL, NULL, '', '', 1, 2, 1, NULL, 1, 0),
(44, 'jj,', NULL, 'klscnsd', 'ksdsd', 'kdvd', 'fmdfg', NULL, NULL, NULL, 'mfd.f', 'kflmdf', 1, 2, 1, NULL, 0, 0),
(45, 'jk,jh', NULL, 'jmbj', 'k.jj', 'nnlkjh', ',mn,m', NULL, NULL, NULL, 'mnl', 'jnjjn', 1, 1, 1, NULL, 0, 0),
(46, 'hhgjnjnj', NULL, 'jhj', ',.mk', 'jiji', 'kl/lkj', NULL, NULL, NULL, 'jhj;j', 'jjjj', 2, 1, 1, NULL, 1, 0),
(47, 'xasxas', NULL, 'sas', 'asas', 'ascas', 'scascsa', NULL, NULL, NULL, 'sascas', 'acsas', 1, 2, 1, NULL, 0, 0),
(48, 'asdsd', NULL, 'scsdc', 'dcde', 'wewed', 'wedwef', NULL, NULL, NULL, 'hdhd', 'fgfgf', 1, 2, 1, NULL, 0, 1),
(49, 'sdvsd', NULL, 'sdsd', 'ass', 'scascdc', 'sdcsdcsdc', NULL, NULL, NULL, 'ascascs', 'sdcscscs', 1, 1, 1, NULL, 0, 0),
(50, '\'ldfv\'qer', NULL, 'wefefr', 'verferfer', 'ferferger', 'cseferf', NULL, NULL, NULL, 'wefefer', 'wefefer', 1, 2, 1, NULL, 1, 0),
(51, 'xxxxx', NULL, 'aaaaaaaaaaaaaaaaaaa', 'sssssssssssssssss', 'vvvvvvvvvvvvvvv', 'ddddddddddddd', NULL, NULL, NULL, 'ccccccccc', 'cccccccccccc', 1, 2, 1, NULL, 0, 0),
(52, 'aaaa', NULL, 'qqq', 'qqqqqq', 'qqqqqqq', 'qqqqqqqq', NULL, NULL, NULL, 'qqqq', 'qqqqqqq', NULL, 1, 1, NULL, 0, 0),
(53, 'test', NULL, 'ghjSxsx', 'jbzx zx ', 'nm zx', 'nzbmzx', NULL, NULL, NULL, 'nmzx zx', 'nm bzx x', 1, 2, 1, NULL, 0, 0),
(54, 'mfr', NULL, 'ergerge', 'erbf', 'rttret', 'rgdrgreg', NULL, NULL, NULL, 'ererg', 'ewwefwe', 1, 1, 1, NULL, 0, 0),
(55, 'gfkj', NULL, 'nvnjk', 'jknkjnj', 'bkjj', 'bkjk', NULL, NULL, NULL, 'bjbkjbjk', 'jnkjjk', 1, 1, 1, NULL, 0, 0),
(56, 'genie informatique', NULL, 'aaa', 'aaa', 'aaa', 'aaa', NULL, NULL, NULL, 'aaa', 'aaa', NULL, 1, 1, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `liste_modules`
--

CREATE TABLE `liste_modules` (
  `id_filiere` int(20) NOT NULL,
  `id_module` int(20) NOT NULL,
  `prof_cours` int(20) DEFAULT NULL,
  `prof_TD` int(20) DEFAULT NULL,
  `prof_TP` int(20) DEFAULT NULL,
  `semestre` varchar(20) NOT NULL,
  `NatureModule` varchar(30) NOT NULL,
  `volumeHoraire` int(11) NOT NULL,
  `DateCreation` timestamp NOT NULL DEFAULT current_timestamp(),
  `pourcentageCours` int(11) NOT NULL,
  `pourcentageTD` int(11) NOT NULL,
  `pourcentageTP` int(11) NOT NULL,
  `volumeHoraireCours` float NOT NULL,
  `volumeHoraireTD` float NOT NULL,
  `volumeHoraireTP` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `liste_modules`
--

INSERT INTO `liste_modules` (`id_filiere`, `id_module`, `prof_cours`, `prof_TD`, `prof_TP`, `semestre`, `NatureModule`, `volumeHoraire`, `DateCreation`, `pourcentageCours`, `pourcentageTD`, `pourcentageTP`, `volumeHoraireCours`, `volumeHoraireTD`, `volumeHoraireTP`) VALUES
(24, 31, 2, NULL, NULL, 'Semestre 1', '', 0, '2021-08-16 13:54:50', 0, 0, 0, 0, 0, 0),
(24, 40, 8, NULL, NULL, 'Semestre 1', 'Majeur', 50, '2021-08-16 13:54:50', 0, 0, 0, 0, 0, 0),
(24, 50, 1, NULL, NULL, 'Semestre 5', 'Majeur', 24, '2021-08-22 12:02:17', 0, 0, 0, 0, 0, 0),
(27, 31, NULL, NULL, NULL, 'Semestre 1', 'Majeur', 45, '2021-08-16 13:54:50', 0, 0, 0, 0, 0, 0),
(27, 41, NULL, NULL, NULL, 'Semestre 1', 'Majeur', 50, '2021-08-16 13:54:50', 0, 0, 0, 0, 0, 0),
(34, 33, 2, NULL, NULL, 'Semestre 1', '', 0, '2021-08-16 13:54:50', 0, 0, 0, 0, 0, 0),
(35, 31, NULL, NULL, NULL, 'Semestre 1', 'Majeur', 50, '2021-08-18 15:28:42', 0, 0, 0, 0, 0, 0),
(35, 48, 11, NULL, NULL, 'Semestre 1', 'Majeur', 50, '2021-08-18 13:08:37', 0, 0, 0, 0, 0, 0),
(35, 50, 11, NULL, NULL, 'Semestre 1', 'Majeur', 50, '2021-08-18 13:09:08', 0, 0, 0, 0, 0, 0),
(35, 51, NULL, NULL, NULL, 'Semestre 1', 'Majeur', 50, '2021-08-18 13:09:27', 0, 0, 0, 0, 0, 0),
(35, 52, 1, NULL, NULL, 'Semestre 1', 'Complementaire', 45, '2021-08-18 13:09:57', 0, 0, 0, 0, 0, 0),
(35, 53, NULL, NULL, NULL, 'Semestre 1', 'Majeur', 50, '2021-08-18 13:10:27', 0, 0, 0, 0, 0, 0),
(35, 57, NULL, NULL, NULL, 'Semestre 2', 'Majeur', 50, '2021-08-18 15:47:45', 0, 0, 0, 0, 0, 0),
(35, 58, NULL, NULL, NULL, 'Semestre 3', 'Majeur', 50, '2021-08-18 16:12:12', 0, 0, 0, 0, 0, 0),
(36, 31, NULL, NULL, NULL, 'Semestre 1', 'Majeur', 45, '2021-08-19 15:47:12', 0, 0, 0, 0, 0, 0),
(38, 49, NULL, NULL, NULL, 'Semestre 5', 'Majeur', 24, '2021-08-22 11:20:25', 0, 0, 0, 0, 0, 0),
(38, 61, 5, 1, 5, 'Semestre 5', 'supplémentaire', 50, '2021-08-24 17:48:58', 0, 0, 0, 0, 0, 0),
(38, 62, 18, 8, 11, 'Semestre 5', 'majeurs', 50, '2021-08-24 17:48:58', 0, 0, 0, 0, 0, 0),
(38, 63, 5, 5, 5, 'Semestre 5', 'majours', 50, '2021-08-24 17:49:57', 0, 0, 0, 0, 0, 0),
(38, 64, 1, 1, 21, 'Semestre 5', 'supplémentaire', 50, '2021-08-24 17:53:09', 0, 0, 0, 0, 0, 0),
(38, 66, 9, 13, NULL, 'Semestre 6', 'majours', 50, '2021-08-24 17:45:56', 0, 0, 0, 0, 0, 0),
(38, 67, 9, 13, 9, 'Semestre 6', 'supplémentaire', 50, '2021-08-24 17:50:28', 0, 0, 0, 0, 0, 0),
(38, 68, 9, 9, 9, 'Semestre 6', 'majours', 50, '2021-08-24 17:54:15', 0, 0, 0, 0, 0, 0),
(38, 69, NULL, NULL, NULL, 'Semestre 6', 'majours', 50, '2021-08-24 17:53:09', 0, 0, 0, 0, 0, 0),
(41, 31, NULL, NULL, NULL, 'Semestre 1', 'Majeur', 50, '2021-08-29 23:05:36', 0, 0, 0, 0, 0, 0),
(41, 32, NULL, NULL, NULL, 'Semestre 1', 'Majeur', 50, '2021-08-29 23:06:56', 0, 0, 0, 0, 0, 0),
(41, 40, NULL, NULL, NULL, 'Semestre 1', 'Majeur', 50, '2021-08-29 23:07:22', 0, 0, 0, 0, 0, 0),
(41, 42, NULL, NULL, NULL, 'Semestre 1', 'Majeur', 50, '2021-08-29 23:07:40', 0, 0, 0, 0, 0, 0),
(41, 49, NULL, NULL, NULL, 'Semestre 1', 'Majeur', 50, '2021-08-29 23:07:54', 0, 0, 0, 0, 0, 0),
(41, 51, NULL, NULL, NULL, 'Semestre 1', 'Majeur', 50, '2021-08-29 23:08:08', 0, 0, 0, 0, 0, 0),
(41, 54, NULL, NULL, NULL, 'Semestre 1', 'Majeur', 50, '2021-08-29 23:08:29', 0, 0, 0, 0, 0, 0),
(43, 31, NULL, NULL, NULL, 'Semestre 1', 'Majeur', 50, '2021-08-30 18:24:58', 0, 0, 0, 0, 0, 0),
(44, 31, NULL, NULL, NULL, 'Semestre 1', 'Majeur', 50, '2021-09-02 08:44:00', 70, 20, 10, 35, 10, 5),
(44, 73, NULL, NULL, NULL, 'Semestre 1', 'Majeur', 50, '2021-09-02 08:55:11', 70, 20, 7, 35, 10, 0),
(47, 31, NULL, NULL, NULL, 'Semestre 1', 'Majeur', 50, '2021-09-02 10:47:56', 70, 20, 10, 35, 10, 5),
(50, 31, NULL, NULL, NULL, 'Semestre 1', 'Majeur', 50, '2021-09-03 13:23:11', 70, 10, 10, 35, 5, 5),
(53, 31, NULL, NULL, NULL, 'Semestre 1', 'Majeur', 50, '2021-09-03 15:04:23', 70, 20, 10, 35, 10, 5),
(53, 32, NULL, NULL, NULL, 'Semestre 1', 'Complementaire', 45, '2021-09-03 15:05:54', 50, 25, 25, 22.5, 11.25, 11.25),
(53, 40, NULL, NULL, NULL, 'Semestre 1', 'Outils', 45, '2021-09-03 15:07:11', 70, 20, 10, 31.5, 9, 4.5),
(55, 31, NULL, NULL, NULL, 'Semestre 1', 'Complementaire', 50, '2021-09-03 16:50:35', 50, 25, 25, 25, 12.5, 0);

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `msg_id` int(20) NOT NULL,
  `incoming_msg_id` int(20) NOT NULL,
  `outgoing_msg_id` int(20) NOT NULL,
  `msg` varchar(1000) CHARACTER SET utf8mb4 NOT NULL,
  `date_msg` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`msg_id`, `incoming_msg_id`, `outgoing_msg_id`, `msg`, `date_msg`, `status`) VALUES
(9, 1, 8, 'salut', '2021-08-21 22:22:44', 0),
(10, 8, 1, 'slm cv', '2021-08-21 23:11:03', 0),
(11, 1, 8, 'cv hmd ', '2021-08-22 00:03:58', 0),
(12, 1, 8, 'et toi ?', '2021-08-22 00:04:02', 0),
(13, 8, 1, 'aussi hmd', '2021-08-22 00:04:31', 0),
(14, 8, 1, 'bonjour monsieur ahmed ', '2021-08-22 23:42:00', 0),
(15, 12, 11, 'bonsoir', '2021-08-24 19:22:50', 0),
(16, 1, 11, 'hi ahmed', '2021-08-28 22:04:46', 0),
(17, 11, 1, 'hi cv ?', '2021-08-28 23:41:30', 0),
(18, 1, 11, 'cv hmd', '2021-08-29 07:38:12', 0),
(19, 1, 11, 'toi ?', '2021-08-29 07:38:16', 0),
(20, 17, 2, 'nnnn', '2021-08-29 13:30:50', 1),
(21, 16, 11, 'salut', '2021-08-29 14:09:47', 1),
(22, 17, 2, 'lp', '2021-09-02 13:18:00', 1),
(23, 17, 2, 'po', '2021-09-02 13:19:36', 1),
(24, 8, 12, '123', '2021-09-02 13:34:10', 1),
(25, 12, 1, '444444', '2021-09-02 13:36:16', 0),
(26, 1, 12, '456', '2021-09-02 13:37:25', 0),
(27, 13, 2, '456', '2021-09-02 13:39:32', 0),
(28, 2, 13, '654', '2021-09-02 13:41:45', 0),
(29, 21, 2, 'bienvenue', '2021-09-02 14:27:16', 0),
(30, 2, 21, 'merci', '2021-09-02 14:27:37', 0),
(31, 21, 2, 'lll', '2021-09-02 14:28:15', 0),
(32, 21, 1, 'hi', '2021-09-03 11:08:25', 0),
(33, 2, 1, 'hbdhbz', '2021-09-03 11:11:12', 0),
(34, 1, 2, 'hey', '2021-09-03 11:14:26', 0),
(35, 2, 1, 'blablablablablbalbba', '2021-09-03 11:19:38', 0),
(36, 2, 1, 'hyyvhyv', '2021-09-03 11:20:31', 0),
(37, 1, 2, 'bkjbjb', '2021-09-03 11:21:13', 0),
(38, 1, 2, 'asAD', '2021-09-03 11:35:08', 0),
(39, 2, 1, 'bkjbgjkubjku', '2021-09-03 12:25:22', 0),
(40, 1, 2, 'hhhhhhh', '2021-09-03 12:25:46', 0),
(41, 1, 2, 'EDR', '2021-09-03 12:44:15', 0),
(42, 8, 2, 'salam cv', '2021-09-03 12:53:56', 1),
(43, 1, 2, 'nmnnmn', '2021-09-03 12:54:50', 0),
(44, 2, 1, 'blablabla', '2021-09-03 13:18:29', 0),
(45, 1, 2, 'test ', '2021-09-03 15:56:23', 0),
(46, 2, 1, 'test2', '2021-09-03 15:56:56', 0);

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `id_module` int(20) NOT NULL,
  `intitule_module` varchar(50) NOT NULL,
  `PreRequis_pedagogiques` text NOT NULL,
  `Langue` varchar(50) NOT NULL,
  `ModeEnseignement` varchar(30) NOT NULL,
  `ModeEvaluation` varchar(255) NOT NULL,
  `Coefficient` double NOT NULL,
  `Competence` text NOT NULL,
  `Objectifs` text NOT NULL,
  `mobilite` varchar(30) NOT NULL,
  `alternance` varchar(30) NOT NULL,
  `Coord_module` int(20) DEFAULT NULL,
  `coord_etablissement` varchar(50) DEFAULT NULL,
  `equipe_pedagogique` int(20) DEFAULT NULL,
  `id_departement` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id_module`, `intitule_module`, `PreRequis_pedagogiques`, `Langue`, `ModeEnseignement`, `ModeEvaluation`, `Coefficient`, `Competence`, `Objectifs`, `mobilite`, `alternance`, `Coord_module`, `coord_etablissement`, `equipe_pedagogique`, `id_departement`) VALUES
(31, 'INTRODUCTION A L ECONOMIE', 'étudiants ayant un bac scientifique et manifestant un intérêt pour les sciences économiques.', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'blablablablablablabla', 'Ce cours a pour objectif de fournir aux étudiants, de formation de base différente en économie, une boîte à outils pour répondre aux questions économiques. L’introduction à l’économie leur permettra ainsi de s’initier avec les instruments de base du raisonnement économique : l’offre, la demande, le mécanisme des prix, l’équilibre, l’optimum, etc. Ce cours a également pour objectif de familiariser les étudiants avec les principaux auteurs et courants de pensée qui, au cours des deux derniers siècles, ont exercé une influence déterminante sur la formation de la science économique.', '0', '0', 1, 'blablablablabl', 1, 1),
(32, 'MICROECONOMIE (I)', 'blablablablablablabla', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'blablablablablablabla', 'L’objectif de ce module est de donner à l’étudiant les outils d’analyse économique qui lui permettent de comprendre le comportement des acteurs économiques dans un cadre de la concurrence pure et parfaite.', '0', '0', 5, 'blablablablabl', 1, 1),
(33, 'COMPTABILITE GENERALE (I)', 'Eudiants ayant un baccalauréat scientifique et manifestant un intérêt pour les sciences économiques et les sciences de gestion.', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'blablablablabla', 'Faire acquérir aux étudiants les notions de base de la comptabilité se rapportant au bilan, au compte de produits et de charges ; maîtriser le processus d’enregistrement des opérations courantes de l’entreprise depuis la facture jusqu’à l’établissement des états de synthèse (bilan, cpc..).', '0', '0', 9, 'blablablabla', 5, 1),
(40, 'Finance d’Entreprise', 'xvxcvx', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'vzdv', 'Sfasf', 'Non', 'Non', NULL, NULL, NULL, 1),
(41, 'M1', 'M', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'M', 'M', 'Non', 'Non', NULL, NULL, NULL, 1),
(42, 'Modèles de croissance économique', 'blablabl', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'blablabla', 'blablabla', 'Non', 'Non', NULL, NULL, NULL, 1),
(43, 'Modèles de croissance économique', 'blablabl', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'blablabla', 'blablabla', 'Non', 'Non', NULL, NULL, NULL, 1),
(44, 'Modèles de croissance économique', 'blablabl', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'blablabla', 'blablabla', 'Non', 'Non', NULL, NULL, NULL, 1),
(45, 'Modèles de croissance économique', 'blablabl', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'blablabla', 'blablabla', 'Non', 'Non', NULL, NULL, NULL, 1),
(46, 'Modèles de croissance économique', 'blablabl', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'blablabla', 'blablabla', 'Non', 'Non', NULL, NULL, NULL, 1),
(47, 'Modèles de croissance économique', 'blablabl', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'blablabla', 'blablabla', 'Non', 'Non', NULL, NULL, NULL, 1),
(48, 'poo', 'sdvsd', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'sdvsd', 'wfw', 'Non', 'Non', NULL, NULL, NULL, 1),
(49, 'poo', 'cxv', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'xcf', 'saadsfg', 'Non', 'Non', NULL, NULL, NULL, 1),
(50, 'blabla', 'cvb n', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'gnm', 'sdfghj', 'Non', 'Non', NULL, NULL, NULL, 1),
(51, 'sdfcgvbhnfdg', 'vbn f', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'vbn asdf', 'xdcfvbn', 'Non', 'Non', NULL, NULL, NULL, 1),
(52, 'xdcfvbn as', 'cHAkjsmd', 'Francais', 'Presentiel', 'Contrôles continus :', 1, 'cfghjknamsd', 'tuiokl,w vabnm m', 'Non', 'Non', NULL, NULL, NULL, 1),
(53, 'tfyguoi;owas', 'M AA', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'gvbhNQW', 'BHSDNFNJVKASNGM', 'Non', 'Non', NULL, NULL, NULL, 1),
(54, 'DJDVD', 'DNM,DV', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'NXMVDNXD', 'Z DSVNMSDS', 'Non', 'Non', NULL, NULL, NULL, 1),
(55, 'sMEFJRG', 'NMMD', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'KENFMSD', 'MNW', 'Non', 'Non', NULL, NULL, NULL, 1),
(56, 'mmmm', 'erf', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'ferff', 'qsdwef', 'Non', 'Non', NULL, NULL, NULL, 1),
(57, 'qfeqgqnju', 'ehwh', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'gbeyh', 'fgwrth5wn6', 'Non', 'Non', NULL, NULL, NULL, 1),
(58, 'm,dncsmdc', ',smdnc', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'md c,mdc,m', 'dmncsdn', 'Non', 'Non', 9, NULL, 5, 1),
(59, 'm,dncsmdc', ',smdnc', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'md c,mdc,m', 'dmncsdn', 'Non', 'Non', 9, NULL, 5, 1),
(60, 'poo', 'programmation en php', 'français', 'presentiel', 'exam final', 0.5, 'maitrisé l\'orienté objet', 'aaa', '1', '0', 2, 'fsjes ain sebaa', 1, NULL),
(61, 'comptabilité generale ', 'des connaissances en économie', 'français', 'presentiel', 'exam final', 0.5, 'technique comptable', 'aaa', '1', '0', 5, 'fsjes ain sebaa', 1, NULL),
(62, 'recherche operationnelle', 'mathematique', 'francais', 'presentiel', 'exam final', 0.5, 'mathematique', 'aaa', '1', '0', 5, 'fsjes ain sebaa', 1, NULL),
(63, 'Réseau', 'routage adressage IPV4  ', '', 'presentiel', 'exam final', 0.5, 'réseau', 'aaa', '1', '0', 5, 'fsjes ain sebaa', 1, NULL),
(64, 'Management des Projets', 'gestion de projet communication anglais ', 'francais et anglais', 'presentiel', 'exam final', 0.5, 'chef de projets', 'aaa', '1', '0', 5, 'fsjes ain sebaa', 1, NULL),
(65, 'Technique de développement', 'connissance en html css javascript php ', 'français', 'presentiel', 'exam final', 0.5, 'développer des application web', 'aaa', '1', '0', 2, 'fsjes ain sebaa', 1, NULL),
(66, 'Base des données Avancées', 'sql oracle', 'francais', 'presentiel', 'exam final', 0.5, 'systeme d\'information', 'aaa', '1', '0', 5, 'fsjes ain sebaa', 5, NULL),
(67, 'gestion financiere', 'analyse financière comptabilité', 'français', 'presentiel', 'exam final', 0.5, 'analyse financière et budgétaire', 'aaa', '1', '0', 5, 'fsjes ain sebaa', 5, NULL),
(68, 'systeme d\'information', 'conception des systeme d\'information', 'francais', 'presentiel', 'exam final', 0.5, 'modelisation uml', 'aaa', '1', '0', 5, 'fsjes ain sebaa', 5, NULL),
(69, 'pfe/stage', 'pfe', 'français', 'presentiel', 'exam final', 0.5, 'pfe', 'aaa', '1', '0', 5, 'fsjes ain sebaa', 5, NULL),
(70, 'Comptabilité général I', 'comptabilité', 'français', 'presentiel', 'exam final', 0.5, 'comptbilité', 'aaa', '0', '1', 2, 'fsjes ain sebaa', 6, NULL),
(71, 'droit social', 'droit', 'français', 'presentiel', 'exam final', 0.5, 'droit', 'aaa', '0', '0', 11, 'fsjes ain sebaa', 5, NULL),
(72, 'klvl/f', 'nsdcsdc', ',mdsdv', 'Presentiel', 'Examen final de fin de semestre', 1, 'ndv dv', 'mns,vdf', 'Non', 'Non', 9, NULL, 5, 1),
(73, 'sjds', 'mkm', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'nknk', 'jjj', 'Non', 'Non', NULL, NULL, 1, 1),
(74, 'sjds', 'mkm', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'nknk', 'jjj', 'Non', 'Non', NULL, NULL, 1, 1),
(75, 'hsbhcsc', 'dsmsdc', 'jdbcjsd', 'Presentiel', 'Examen final de fin de semestre', 1, 'sndmsd', 'sdnvsd', 'Non', 'Non', NULL, NULL, 5, 1),
(76, 'hsbhcsc', 'dsmsdc', 'jdbcjsd', 'Presentiel', 'Examen final de fin de semestre', 1, 'sndmsd', 'sdnvsd', 'Non', 'Non', NULL, NULL, 5, 1),
(77, 'zjdcksd', 'msacs', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'asncas', 'jscsdc', 'Non', 'Non', NULL, NULL, 6, 1),
(78, 'sdfksdf', ',mas cmas', 'jksdsc', 'Presentiel', 'Examen final de fin de semestre', 45, 'jnjscas', 'as,mcas', 'Non', 'Non', NULL, NULL, 5, 1),
(79, 'wewe', 'wefwef', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 10, 'referger', 'dewed', 'Non', 'Non', NULL, NULL, 5, 1),
(80, 'ddd', 'wefwef', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 45, 'wefwef', 'wefwef', 'Non', 'Non', NULL, NULL, 5, 2),
(81, 'asdasd', 'wfewfewf', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'wfwefwe', 'sdwef', 'Non', 'Non', NULL, NULL, 5, 1),
(82, 'ccdcdc', 'dcasdcvsd', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'sdcsd ', 'dcsdc', 'Non', 'Non', NULL, NULL, 6, 1),
(83, 'REGERG', 'GSRRT', 'Francais', 'Presentiel', 'Examen final de fin de semestre', 1, 'EFRTGR', 'FRTGRT', 'Non', 'Non', NULL, NULL, 5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE `notification` (
  `id_notif` int(20) NOT NULL,
  `message` text NOT NULL,
  `date_notif` date NOT NULL,
  `id_admin` int(20) NOT NULL,
  `id_prof` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `Id` int(11) NOT NULL,
  `Content` varchar(255) NOT NULL,
  `DateCreation` timestamp NOT NULL DEFAULT current_timestamp(),
  `Statut` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `notifications`
--

INSERT INTO `notifications` (`Id`, `Content`, `DateCreation`, `Statut`) VALUES
(1, 'une cérémonie de remise de diplôme va être le 10/07/2021', '2021-08-09 19:58:07', 0),
(3, 'La rentrée universitaire 2021-2022 débutera la mi-septembre ', '2021-08-09 20:01:29', 0);

-- --------------------------------------------------------

--
-- Structure de la table `poste`
--

CREATE TABLE `poste` (
  `id_poste` int(11) NOT NULL,
  `nom_poste` varchar(100) NOT NULL,
  `max_vote` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `id_election` int(11) NOT NULL,
  `condition_poste` longtext DEFAULT NULL,
  `id_departement` int(11) DEFAULT NULL,
  `id_filiere` int(11) DEFAULT NULL,
  `condition_grade` varchar(255) DEFAULT NULL,
  `condition_specialite` varchar(255) DEFAULT NULL,
  `condition_type_prof` varchar(255) DEFAULT NULL,
  `condition_anciennete` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `poste`
--

INSERT INTO `poste` (`id_poste`, `nom_poste`, `max_vote`, `description`, `id_election`, `condition_poste`, `id_departement`, `id_filiere`, `condition_grade`, `condition_specialite`, `condition_type_prof`, `condition_anciennete`) VALUES
(27, 'Chef de departement', 6, 'participer', 1, 'bbbbbbbbbbbb', 2, NULL, '', '', NULL, 0),
(33, 'Coordinateur', 1, 'zzzzzzzzzzzzz', 1, 'aaaaaaaaaaaaaaaa', NULL, 32, 'A', 'droit', 'professeurs de l\'enseignement supérieur', 2),
(34, 'Coordinateur', 1, 'aaaaaaa', 1, 'szzzzzzzzzzz', NULL, 34, 'A', 'mathématique', 'professeurs de l\'enseignement supérieur', 3),
(35, 'Coordinateur', 1, 'eeeeeeeee', 1, 'zzzzzzz', NULL, 24, 'A', 'informatique', 'professeurs de l\'enseignement supérieur', 3),
(36, 'Coordinateur', 1, 'vvcvcvcvcvv', 1, 'jssajkkk,k,', NULL, 35, 'A', 'informatique', 'professeur assistant', 4),
(43, 'Coordinateur', 1, 'aaaa', 1, NULL, NULL, 31, 'B,C,D,', 'economie et gestion', NULL, 2),
(44, 'Coordinateur', 1, 'dddd', 1, NULL, NULL, 27, 'A,B,C,D,', 'droit arabe', 'professeurs de l\'enseignement supérieur,professeur habilité', 2),
(50, 'Chef de departement', 1, 'aaabbbbbb', 1, '', 1, NULL, '', 'economie et gestion', NULL, 2),
(51, 'Coordinateur', 1, 'rien', 1, NULL, NULL, 36, 'A,B,C,', 'economie et gestion', 'professeur de l\'enseignement supérieur,professeur assistant,professeur habilité,', 4),
(52, 'Chef de departement', 8, 'sccscc', 1, NULL, 3, NULL, 'C,', 'informatique ', 'professeur assistant,', 9),
(53, 'Coordinateur', 1, 'aaa', 1, NULL, NULL, 33, 'A,B,', 'droit arabe', 'professeur de l\'enseignement supérieur,professeur assistant,', 2),
(54, 'Chef de departement', 8, 'description', 1, NULL, 4, NULL, 'A,', 'economie et gestion', 'professeur de l\'enseignement supérieur,professeur assistant,professeur non permanent,', 6);

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

CREATE TABLE `professeur` (
  `id_prof` int(20) NOT NULL,
  `Image` varchar(255) NOT NULL,
  `nomPrenom_prof` varchar(50) NOT NULL,
  `CIN_prof` varchar(20) NOT NULL,
  `Age` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `isCoordFiliere` tinyint(1) NOT NULL DEFAULT 0,
  `isChefDepartement` tinyint(1) NOT NULL DEFAULT 0,
  `isCoordModule` tinyint(1) NOT NULL DEFAULT 0,
  `specialite` varchar(50) NOT NULL,
  `grade` varchar(20) NOT NULL,
  `anciennete` int(20) NOT NULL,
  `type_prof` varchar(50) NOT NULL,
  `Etablissement` varchar(50) NOT NULL DEFAULT 'FSJES AIN SEBAA',
  `id_equipe` int(20) DEFAULT NULL,
  `cv_prof` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `tele` int(11) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`id_prof`, `Image`, `nomPrenom_prof`, `CIN_prof`, `Age`, `email`, `mdp`, `isCoordFiliere`, `isChefDepartement`, `isCoordModule`, `specialite`, `grade`, `anciennete`, `type_prof`, `Etablissement`, `id_equipe`, `cv_prof`, `status`, `ville`, `tele`, `isAdmin`) VALUES
(1, 'profile2.jpg', 'Eddaoui Ahmed', 'HH8976', 0, 'ahmededdaoui@gmail.com', '$2y$10$2ANXo.j2ea7akGdDJytcL.Khu3HPGy/c2B3hVB.gnQR7NP86lcoVS', 0, 0, 0, 'informatique', 'A', 8, 'professeurs de l\'enseignement supérieur', 'fsjes ain sebaa', 1, '', 'hors ligne', 'Mohammedia', 0, 0),
(2, 'talha.jpg', 'Gmira Faiq', 'RR4567', 0, 'Gmirafaiq@gmail.com', '$2y$10$2ANXo.j2ea7akGdDJytcL.Khu3HPGy/c2B3hVB.gnQR7NP86lcoVS', 1, 0, 0, 'informatique', 'A', 7, 'professeurs de l\'enseignement supérieur', 'fsjes ain sebaa', 6, '', 'hors ligne', 'Agadir', 0, 0),
(5, 'femme.jpg', 'Sebar Wafae', 'KL67895', 0, 'maryemtajer@gmail.com', '$2y$10$77anbJ0OtbFVjHUHAClNOuN7GRUbfY/GE48ZRzKQl.cCRdXBFy0Yu', 1, 0, 0, 'gestion de projet', 'A', 10, 'professeur habilité', 'fsjes ain sebaa', 1, '', 'hors ligne', 'casablanca', 0, 0),
(8, 'profile.jpg', 'Laguidi Ahmed', 'LL9999', 0, 'nouraconcours123@gmail.com', '$2y$10$jAmmXLzyxWPhCMhDBS6LjOJi3g/f7Vp0Ysl7mREiG8fn7BEAhixTK', 1, 0, 0, 'orienté objets', 'A', 10, 'professeur habilité', 'fsjes ain sebaa', 1, '', 'hors ligne', 'Casablanca', 0, 0),
(9, 'user.png', 'Hassouni Laarbi', 'Ml23456', 0, 'hasssounilaarbi', '$2y$10$2ANXo.j2ea7akGdDJytcL.Khu3HPGy/c2B3hVB.gnQR7NP86lcoVS', 0, 0, 1, 'systeme d\'information', 'A', 3, 'professeur assistant', 'fsjes ain sebba', 5, '', 'hors ligne', 'Marrakech', 0, 0),
(11, 'routeur2.PNG', 'Meftah Ibrahim', 'U67895', 44, 'fatimaelkhattar@gmail.com', '$2y$10$vfnJYP1zCAM8qyt2ZTsbq.elYe1uZDdo217bQlEvRLpBLvIdQ.9NO', 0, 0, 0, 'base de donnees', 'B', 10, 'professeur de l\'enseignement supérieur', 'fsjes ain sebaa', 1, '', 'hors ligne', 'Rabat', 0, 0),
(12, 'conf2_router.PNG', 'Akram Insaf', 'aa67898', 45, 'insafAkram@gamil.com', '$2y$10$aEK.4cc.4.5lPvmuE5cvWeoS95WxYMYYJgr5Uy23xEKZgn3Zf8svG', 0, 0, 0, 'programmtion orienté objets', 'A', 4, 'professeur de l\'enseignement supérieur', 'fsjes ain sebaa', 1, 'TP MPM (1).pdf', 'hors ligne', 'Fes', 0, 0),
(13, 'user.png', 'Safi Amina', 'P87654', 50, 'saiamina@gmail.com', '$2y$10$aEK.4cc.4.5lPvmuE5cvWeoS95WxYMYYJgr5Uy23xEKZgn3Zf8svG', 0, 0, 0, 'gestion economique', 'A', 3, 'professeurs de l\'enseignement supérieur', 'fsjes ain sebaa', 5, '', 'hors ligne', 'Rabat', 0, 0),
(14, 'user10.png', 'Amid Farouq', 'U87654', 60, 'farouqamid@gmail.com', '$2y$10$aEK.4cc.4.5lPvmuE5cvWeoS95WxYMYYJgr5Uy23xEKZgn3Zf8svG', 0, 0, 0, 'économie', 'B', 6, 'professeurs de l\'enseignement supérieur', 'fsjes ain sebaa', 1, '', 'hors ligne', 'Bni Mellal', 0, 0),
(15, 'user6.jpg', 'Fettah Fettah', 'A23456', 51, 'fettah66@gmail.com', '$2y$10$aEK.4cc.4.5lPvmuE5cvWeoS95WxYMYYJgr5Uy23xEKZgn3Zf8svG', 0, 0, 0, 'économie', 'A', 3, 'professeurs de l\'enseignement supérieur', 'fsjes ain sebaa', 5, '', 'hors ligne', 'Agadir', 0, 0),
(16, 'user.png', 'Nacer Kebbaj', 'F543678', 60, 'nacerkebbaj@gmail.com', '$2y$10$aEK.4cc.4.5lPvmuE5cvWeoS95WxYMYYJgr5Uy23xEKZgn3Zf8svG', 0, 0, 0, 'économie', 'B', 4, 'professeurs de l\'enseignement supérieur', 'fsjes ain sebaa', 6, '', 'hors ligne', 'Rabat', 0, 0),
(17, 'femme.jpg', 'RAFIE Hafssa', 'A3456', 38, 'hafssarafie38@gmail.com', '$2y$10$2ANXo.j2ea7akGdDJytcL.Khu3HPGy/c2B3hVB.gnQR7NP86lcoVS', 0, 0, 0, 'Gestion financière', 'A', 6, 'professeurs de l\'enseignement supérieur', 'fsjes ain sebaa', 5, '', 'hors ligne', 'OUARZAZAT', 0, 0),
(18, 'pdp.PNG', 'ndkan', 'dkkslf4', 45, 'scsmndfn@dnc', '$2y$10$T35.BIXdlGx4awkhr3HZ6uHfxAYh5c7aUgEQ5Df7XBjylzOKzeNOe', 0, 0, 0, 'dkfjdf', 'A', 8, 'professeur de l\'enseignement supérieur', 'fsjes ain sebaa', 1, 'cv elhamine elmehdi.pdf', 'hors ligne', NULL, 0, 0),
(21, 'python.jpg', 'ELMEHDI ELHAMINE', 'BH627984', 45, 'elmehdi99elhamine@gmail.com', '$2y$10$HiR4ZBLJg9diDn1eWg4UIeGeiT73xd5a2aIl6tFYXj.BY2ux1qUbi', 0, 0, 0, 'kj', 'A', 7, 'professeur de l\'enseignement supérieur', 'fsjes ain sebaa', 1, 'cv_elhamine_elmehdi.pdf', 'hors ligne', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `reset_psswd_tempe`
--

CREATE TABLE `reset_psswd_tempe` (
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `reset_psswd_tempe`
--

INSERT INTO `reset_psswd_tempe` (`email`, `cle`, `expDate`) VALUES
('elmehdi99elhamine@gmail.com', '687bf769ff27b9433938365104454170a617f66fc1', '2021-09-04'),
('elmehdi99elhamine@gmail.com', '648111acf654ac3c840c5d5358f579e0e48d2bb70f', '2021-09-04');

-- --------------------------------------------------------

--
-- Structure de la table `vote`
--

CREATE TABLE `vote` (
  `id_vote` int(11) NOT NULL,
  `id_voters` int(11) NOT NULL,
  `id_candidat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vote`
--

INSERT INTO `vote` (`id_vote`, `id_voters`, `id_candidat`) VALUES
(3, 15, 132),
(18, 9, 132),
(23, 12, 135),
(35, 2, 145),
(36, 5, 145),
(37, 5, 146),
(38, 9, 144),
(39, 11, 132),
(40, 2, 132),
(41, 2, 147),
(42, 5, 143),
(43, 8, 143);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`id_admin`);

--
-- Index pour la table `candidats`
--
ALTER TABLE `candidats`
  ADD PRIMARY KEY (`id_candidat`,`professeur`,`poste`) USING BTREE,
  ADD KEY `professeur` (`professeur`),
  ADD KEY `poste` (`poste`);

--
-- Index pour la table `cycle`
--
ALTER TABLE `cycle`
  ADD PRIMARY KEY (`id_cycle`);

--
-- Index pour la table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`id_dprtm`),
  ADD KEY `chefDepartement` (`chefDepartement`);

--
-- Index pour la table `election`
--
ALTER TABLE `election`
  ADD PRIMARY KEY (`id_election`);

--
-- Index pour la table `equipe_pedagogique`
--
ALTER TABLE `equipe_pedagogique`
  ADD PRIMARY KEY (`id_equipe`),
  ADD KEY `coorModule` (`coorModule`);

--
-- Index pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD PRIMARY KEY (`id_filiere`),
  ADD KEY `coorFiliere` (`coorFiliere`),
  ADD KEY `id_cycle` (`id_cycle`),
  ADD KEY `id_departement` (`id_departement`);

--
-- Index pour la table `liste_modules`
--
ALTER TABLE `liste_modules`
  ADD PRIMARY KEY (`id_filiere`,`id_module`),
  ADD KEY `id_prof` (`prof_cours`),
  ADD KEY `id_module` (`id_module`),
  ADD KEY `prof_TD` (`prof_TD`,`prof_TP`),
  ADD KEY `prof_TP` (`prof_TP`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`msg_id`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id_module`),
  ADD KEY `Coord_module` (`Coord_module`),
  ADD KEY `equipe_pedagogique` (`equipe_pedagogique`),
  ADD KEY `id_departement` (`id_departement`);

--
-- Index pour la table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id_notif`),
  ADD KEY `id_admin` (`id_admin`,`id_prof`),
  ADD KEY `id_prof` (`id_prof`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `poste`
--
ALTER TABLE `poste`
  ADD PRIMARY KEY (`id_poste`),
  ADD UNIQUE KEY `id_departement` (`id_departement`) USING BTREE,
  ADD UNIQUE KEY `id_filiere` (`id_filiere`) USING BTREE,
  ADD KEY `id_election` (`id_election`);

--
-- Index pour la table `professeur`
--
ALTER TABLE `professeur`
  ADD PRIMARY KEY (`id_prof`),
  ADD KEY `id_equipe` (`id_equipe`) USING BTREE;

--
-- Index pour la table `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`id_vote`),
  ADD KEY `id_candidat` (`id_candidat`),
  ADD KEY `id_voters` (`id_voters`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `administrateur`
--
ALTER TABLE `administrateur`
  MODIFY `id_admin` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `candidats`
--
ALTER TABLE `candidats`
  MODIFY `id_candidat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT pour la table `cycle`
--
ALTER TABLE `cycle`
  MODIFY `id_cycle` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `departement`
--
ALTER TABLE `departement`
  MODIFY `id_dprtm` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `election`
--
ALTER TABLE `election`
  MODIFY `id_election` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `equipe_pedagogique`
--
ALTER TABLE `equipe_pedagogique`
  MODIFY `id_equipe` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `filiere`
--
ALTER TABLE `filiere`
  MODIFY `id_filiere` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `msg_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT pour la table `module`
--
ALTER TABLE `module`
  MODIFY `id_module` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT pour la table `notification`
--
ALTER TABLE `notification`
  MODIFY `id_notif` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `poste`
--
ALTER TABLE `poste`
  MODIFY `id_poste` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT pour la table `professeur`
--
ALTER TABLE `professeur`
  MODIFY `id_prof` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `vote`
--
ALTER TABLE `vote`
  MODIFY `id_vote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `candidats`
--
ALTER TABLE `candidats`
  ADD CONSTRAINT `candidats_ibfk_1` FOREIGN KEY (`professeur`) REFERENCES `professeur` (`id_prof`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidats_ibfk_2` FOREIGN KEY (`poste`) REFERENCES `poste` (`id_poste`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `departement`
--
ALTER TABLE `departement`
  ADD CONSTRAINT `departement_ibfk_1` FOREIGN KEY (`chefDepartement`) REFERENCES `professeur` (`id_prof`);

--
-- Contraintes pour la table `equipe_pedagogique`
--
ALTER TABLE `equipe_pedagogique`
  ADD CONSTRAINT `equipe_pedagogique_ibfk_1` FOREIGN KEY (`coorModule`) REFERENCES `professeur` (`id_prof`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD CONSTRAINT `filiere_ibfk_1` FOREIGN KEY (`id_cycle`) REFERENCES `cycle` (`id_cycle`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `filiere_ibfk_2` FOREIGN KEY (`id_departement`) REFERENCES `departement` (`id_dprtm`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `filiere_ibfk_3` FOREIGN KEY (`coorFiliere`) REFERENCES `professeur` (`id_prof`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `liste_modules`
--
ALTER TABLE `liste_modules`
  ADD CONSTRAINT `liste_modules_ibfk_1` FOREIGN KEY (`prof_cours`) REFERENCES `professeur` (`id_prof`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `liste_modules_ibfk_2` FOREIGN KEY (`id_module`) REFERENCES `module` (`id_module`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `liste_modules_ibfk_3` FOREIGN KEY (`id_filiere`) REFERENCES `filiere` (`id_filiere`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `liste_modules_ibfk_4` FOREIGN KEY (`prof_TD`) REFERENCES `professeur` (`id_prof`),
  ADD CONSTRAINT `liste_modules_ibfk_5` FOREIGN KEY (`prof_TP`) REFERENCES `professeur` (`id_prof`);

--
-- Contraintes pour la table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `module_ibfk_1` FOREIGN KEY (`Coord_module`) REFERENCES `professeur` (`id_prof`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `module_ibfk_2` FOREIGN KEY (`equipe_pedagogique`) REFERENCES `equipe_pedagogique` (`id_equipe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `module_ibfk_3` FOREIGN KEY (`id_departement`) REFERENCES `departement` (`id_dprtm`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`id_prof`) REFERENCES `professeur` (`id_prof`),
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `administrateur` (`id_admin`);

--
-- Contraintes pour la table `poste`
--
ALTER TABLE `poste`
  ADD CONSTRAINT `poste_ibfk_1` FOREIGN KEY (`id_filiere`) REFERENCES `filiere` (`id_filiere`),
  ADD CONSTRAINT `poste_ibfk_2` FOREIGN KEY (`id_departement`) REFERENCES `departement` (`id_dprtm`),
  ADD CONSTRAINT `poste_ibfk_3` FOREIGN KEY (`id_election`) REFERENCES `election` (`id_election`);

--
-- Contraintes pour la table `professeur`
--
ALTER TABLE `professeur`
  ADD CONSTRAINT `professeur_ibfk_1` FOREIGN KEY (`id_equipe`) REFERENCES `equipe_pedagogique` (`id_equipe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `vote_ibfk_1` FOREIGN KEY (`id_candidat`) REFERENCES `candidats` (`id_candidat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vote_ibfk_2` FOREIGN KEY (`id_voters`) REFERENCES `professeur` (`id_prof`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
