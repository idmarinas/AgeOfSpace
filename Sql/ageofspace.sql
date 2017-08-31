-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 31 Août 2017 à 19:23
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ageofspace`
--

-- --------------------------------------------------------

--
-- Structure de la table `armee`
--

CREATE TABLE `armee` (
  `idArmee` int(11) NOT NULL,
  `TempMarche` int(11) DEFAULT NULL,
  `idVilles` int(11) DEFAULT NULL,
  `idVille` int(11) DEFAULT NULL,
  `idArmeeType` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `armeetype`
--

CREATE TABLE `armeetype` (
  `idArmeeType` int(11) NOT NULL,
  `NomArmeeType` char(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `armeetype`
--

INSERT INTO `armeetype` (`idArmeeType`, `NomArmeeType`) VALUES
(1, 'Attaquer'),
(2, 'Transporter'),
(3, 'Coloniser'),
(4, 'Stationner'),
(5, 'Espionner');

-- --------------------------------------------------------

--
-- Structure de la table `batiment`
--

CREATE TABLE `batiment` (
  `idBatiment` int(11) NOT NULL,
  `NomBatiment` char(64) DEFAULT NULL,
  `idBatimentType` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `batiment`
--

INSERT INTO `batiment` (`idBatiment`, `NomBatiment`, `idBatimentType`) VALUES
(1, 'Scierie', 1),
(2, 'Cariere', 1),
(3, 'Exploitation Or', 1),
(4, 'Entrepot', 2),
(5, 'Caserne', 2),
(6, 'Laboratoire de recherche', 2);

-- --------------------------------------------------------

--
-- Structure de la table `batiments`
--

CREATE TABLE `batiments` (
  `idVilles` int(11) NOT NULL,
  `idBatiment` int(11) NOT NULL,
  `NiveauBatiments` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `batimenttype`
--

CREATE TABLE `batimenttype` (
  `idBatimentType` int(11) NOT NULL,
  `NomBatimentType` char(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `batimenttype`
--

INSERT INTO `batimenttype` (`idBatimentType`, `NomBatimentType`) VALUES
(1, 'Ressources'),
(2, 'Installations');

-- --------------------------------------------------------

--
-- Structure de la table `caracteristique`
--

CREATE TABLE `caracteristique` (
  `idCaracteristique` int(11) NOT NULL,
  `NomCaracteristique` char(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `caracteristique`
--

INSERT INTO `caracteristique` (`idCaracteristique`, `NomCaracteristique`) VALUES
(1, 'Attaque'),
(2, 'Defence'),
(3, 'Point de vie'),
(4, 'Vitesse'),
(5, 'Capaciter');

-- --------------------------------------------------------

--
-- Structure de la table `caracteristiques`
--

CREATE TABLE `caracteristiques` (
  `idUnite` int(11) NOT NULL,
  `idCaracteristique` int(11) NOT NULL,
  `NombresCaracteristique` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `caserne`
--

CREATE TABLE `caserne` (
  `idVilles` int(11) NOT NULL,
  `idUnite` int(11) NOT NULL,
  `idCaserne` int(11) DEFAULT NULL,
  `TempCaserne` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `construction`
--

CREATE TABLE `construction` (
  `idVilles` int(11) NOT NULL,
  `idBatiment` int(11) NOT NULL,
  `idConstruction` int(11) DEFAULT NULL,
  `TempsConstruction` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

CREATE TABLE `joueur` (
  `idJoueur` int(11) NOT NULL,
  `Pseudo` char(64) DEFAULT NULL,
  `Mdp` char(128) DEFAULT NULL,
  `Email` char(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `montant`
--

CREATE TABLE `montant` (
  `idRessource` int(11) NOT NULL,
  `idVilles` int(11) NOT NULL,
  `Montant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `mouvement`
--

CREATE TABLE `mouvement` (
  `idArmee` int(11) NOT NULL,
  `idUnite` int(11) NOT NULL,
  `NombreMouvement` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `prerequisrecherche`
--

CREATE TABLE `prerequisrecherche` (
  `idRecherche` int(11) NOT NULL,
  `idRecherche_PrerequisRecherche` int(11) NOT NULL,
  `PrerequisRecherche` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `prerequisunite`
--

CREATE TABLE `prerequisunite` (
  `idRecherche` int(11) NOT NULL,
  `idUnite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `prixbatiment`
--

CREATE TABLE `prixbatiment` (
  `idRessource` int(11) NOT NULL,
  `idBatiment` int(11) NOT NULL,
  `PrixBatiment` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `prixbatiment`
--

INSERT INTO `prixbatiment` (`idRessource`, `idBatiment`, `PrixBatiment`) VALUES
(1, 4, 1000),
(1, 5, 1000),
(1, 6, 1000),
(2, 5, 500),
(2, 6, 1000),
(3, 5, 200),
(3, 6, 1000);

-- --------------------------------------------------------

--
-- Structure de la table `prixrecherche`
--

CREATE TABLE `prixrecherche` (
  `idRessource` int(11) NOT NULL,
  `idRecherche` int(11) NOT NULL,
  `PrixRecherche` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `prixrecherche`
--

INSERT INTO `prixrecherche` (`idRessource`, `idRecherche`, `PrixRecherche`) VALUES
(1, 1, 100),
(2, 2, 100),
(3, 1, 200),
(3, 2, 200);

-- --------------------------------------------------------

--
-- Structure de la table `prixunite`
--

CREATE TABLE `prixunite` (
  `idRessource` int(11) NOT NULL,
  `idUnite` int(11) NOT NULL,
  `PrixUnite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `prixunite`
--

INSERT INTO `prixunite` (`idRessource`, `idUnite`, `PrixUnite`) VALUES
(1, 1, 100),
(1, 2, 300),
(2, 1, 300),
(2, 2, 100),
(3, 1, 300),
(3, 2, 300);

-- --------------------------------------------------------

--
-- Structure de la table `recherche`
--

CREATE TABLE `recherche` (
  `idRecherche` int(11) NOT NULL,
  `NomRecherche` char(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `recherches`
--

CREATE TABLE `recherches` (
  `idJoueur` int(11) NOT NULL,
  `idRecherche` int(11) NOT NULL,
  `TempsRecherche` int(11) DEFAULT NULL,
  `NiveauRecherche` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ressource`
--

CREATE TABLE `ressource` (
  `idRessource` int(11) NOT NULL,
  `NomRessource` char(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ressource`
--

INSERT INTO `ressource` (`idRessource`, `NomRessource`) VALUES
(1, 'Bois'),
(2, 'Pierre'),
(3, 'Or');

-- --------------------------------------------------------

--
-- Structure de la table `unite`
--

CREATE TABLE `unite` (
  `idUnite` int(11) NOT NULL,
  `NomUnite` char(64) DEFAULT NULL,
  `idUniteType` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `unites`
--

CREATE TABLE `unites` (
  `idVilles` int(11) NOT NULL,
  `idUnite` int(11) NOT NULL,
  `NombreUnites` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `unitetype`
--

CREATE TABLE `unitetype` (
  `idUniteType` int(11) NOT NULL,
  `NomUniteType` char(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `unitetype`
--

INSERT INTO `unitetype` (`idUniteType`, `NomUniteType`) VALUES
(1, 'Attaque'),
(2, 'Defence');

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `idVille` int(11) NOT NULL,
  `PositionVille` int(11) DEFAULT NULL,
  `PositionPlanete` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ville`
--

INSERT INTO `ville` (`idVille`, `PositionVille`, `PositionPlanete`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 2, 1),
(22, 2, 2),
(23, 2, 3),
(24, 2, 4),
(25, 2, 5),
(26, 2, 6),
(27, 2, 7),
(28, 2, 8),
(29, 2, 9),
(30, 2, 10),
(31, 2, 11),
(32, 2, 12),
(33, 2, 13),
(34, 2, 14),
(35, 2, 15),
(36, 2, 16),
(37, 2, 17),
(38, 2, 18),
(39, 2, 19),
(40, 2, 20),
(41, 3, 1),
(42, 3, 2),
(43, 3, 3),
(44, 3, 4),
(45, 3, 5),
(46, 3, 6),
(47, 3, 7),
(48, 3, 8),
(49, 3, 9),
(50, 3, 10),
(51, 3, 11),
(52, 3, 12),
(53, 3, 13),
(54, 3, 14),
(55, 3, 15),
(56, 3, 16),
(57, 3, 17),
(58, 3, 18),
(59, 3, 19),
(60, 3, 20),
(61, 4, 1),
(62, 4, 2),
(63, 4, 3),
(64, 4, 4),
(65, 4, 5),
(66, 4, 6),
(67, 4, 7),
(68, 4, 8),
(69, 4, 9),
(70, 4, 10),
(71, 4, 11),
(72, 4, 12),
(73, 4, 13),
(74, 4, 14),
(75, 4, 15),
(76, 4, 16),
(77, 4, 17),
(78, 4, 18),
(79, 4, 19),
(80, 4, 20),
(81, 5, 1),
(82, 5, 2),
(83, 5, 3),
(84, 5, 4),
(85, 5, 5),
(86, 5, 6),
(87, 5, 7),
(88, 5, 8),
(89, 5, 9),
(90, 5, 10),
(91, 5, 11),
(92, 5, 12),
(93, 5, 13),
(94, 5, 14),
(95, 5, 15),
(96, 5, 16),
(97, 5, 17),
(98, 5, 18),
(99, 5, 19),
(100, 5, 20),
(101, 6, 1),
(102, 6, 2),
(103, 6, 3),
(104, 6, 4),
(105, 6, 5),
(106, 6, 6),
(107, 6, 7),
(108, 6, 8),
(109, 6, 9),
(110, 6, 10),
(111, 6, 11),
(112, 6, 12),
(113, 6, 13),
(114, 6, 14),
(115, 6, 15),
(116, 6, 16),
(117, 6, 17),
(118, 6, 18),
(119, 6, 19),
(120, 6, 20),
(121, 7, 1),
(122, 7, 2),
(123, 7, 3),
(124, 7, 4),
(125, 7, 5),
(126, 7, 6),
(127, 7, 7),
(128, 7, 8),
(129, 7, 9),
(130, 7, 10),
(131, 7, 11),
(132, 7, 12),
(133, 7, 13),
(134, 7, 14),
(135, 7, 15),
(136, 7, 16),
(137, 7, 17),
(138, 7, 18),
(139, 7, 19),
(140, 7, 20),
(141, 8, 1),
(142, 8, 2),
(143, 8, 3),
(144, 8, 4),
(145, 8, 5),
(146, 8, 6),
(147, 8, 7),
(148, 8, 8),
(149, 8, 9),
(150, 8, 10),
(151, 8, 11),
(152, 8, 12),
(153, 8, 13),
(154, 8, 14),
(155, 8, 15),
(156, 8, 16),
(157, 8, 17),
(158, 8, 18),
(159, 8, 19),
(160, 8, 20),
(161, 9, 1),
(162, 9, 2),
(163, 9, 3),
(164, 9, 4),
(165, 9, 5),
(166, 9, 6),
(167, 9, 7),
(168, 9, 8),
(169, 9, 9),
(170, 9, 10),
(171, 9, 11),
(172, 9, 12),
(173, 9, 13),
(174, 9, 14),
(175, 9, 15),
(176, 9, 16),
(177, 9, 17),
(178, 9, 18),
(179, 9, 19),
(180, 9, 20),
(181, 10, 1),
(182, 10, 2),
(183, 10, 3),
(184, 10, 4),
(185, 10, 5),
(186, 10, 6),
(187, 10, 7),
(188, 10, 8),
(189, 10, 9),
(190, 10, 10),
(191, 10, 11),
(192, 10, 12),
(193, 10, 13),
(194, 10, 14),
(195, 10, 15),
(196, 10, 16),
(197, 10, 17),
(198, 10, 18),
(199, 10, 19),
(200, 10, 20);

-- --------------------------------------------------------

--
-- Structure de la table `villes`
--

CREATE TABLE `villes` (
  `idVilles` int(11) NOT NULL,
  `NomVilles` char(64) DEFAULT NULL,
  `idJoueur` int(11) DEFAULT NULL,
  `idVille` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `armee`
--
ALTER TABLE `armee`
  ADD PRIMARY KEY (`idArmee`),
  ADD KEY `FK_Armee_idVilles` (`idVilles`),
  ADD KEY `FK_Armee_idVille` (`idVille`),
  ADD KEY `FK_Armee_idArmeeType` (`idArmeeType`);

--
-- Index pour la table `armeetype`
--
ALTER TABLE `armeetype`
  ADD PRIMARY KEY (`idArmeeType`);

--
-- Index pour la table `batiment`
--
ALTER TABLE `batiment`
  ADD PRIMARY KEY (`idBatiment`),
  ADD KEY `FK_Batiment_idBatimentType` (`idBatimentType`);

--
-- Index pour la table `batiments`
--
ALTER TABLE `batiments`
  ADD PRIMARY KEY (`idVilles`,`idBatiment`),
  ADD KEY `FK_Batiments_idBatiment` (`idBatiment`);

--
-- Index pour la table `batimenttype`
--
ALTER TABLE `batimenttype`
  ADD PRIMARY KEY (`idBatimentType`);

--
-- Index pour la table `caracteristique`
--
ALTER TABLE `caracteristique`
  ADD PRIMARY KEY (`idCaracteristique`);

--
-- Index pour la table `caracteristiques`
--
ALTER TABLE `caracteristiques`
  ADD PRIMARY KEY (`idUnite`,`idCaracteristique`),
  ADD KEY `FK_Caracteristiques_idCaracteristique` (`idCaracteristique`);

--
-- Index pour la table `caserne`
--
ALTER TABLE `caserne`
  ADD PRIMARY KEY (`idVilles`,`idUnite`),
  ADD KEY `FK_Caserne_idUnite` (`idUnite`);

--
-- Index pour la table `construction`
--
ALTER TABLE `construction`
  ADD PRIMARY KEY (`idVilles`,`idBatiment`),
  ADD KEY `FK_Construction_idBatiment` (`idBatiment`);

--
-- Index pour la table `joueur`
--
ALTER TABLE `joueur`
  ADD PRIMARY KEY (`idJoueur`);

--
-- Index pour la table `montant`
--
ALTER TABLE `montant`
  ADD PRIMARY KEY (`idRessource`,`idVilles`),
  ADD KEY `FK_Montant_idVilles` (`idVilles`);

--
-- Index pour la table `mouvement`
--
ALTER TABLE `mouvement`
  ADD PRIMARY KEY (`idArmee`,`idUnite`),
  ADD KEY `FK_Mouvement_idUnite` (`idUnite`);

--
-- Index pour la table `prerequisrecherche`
--
ALTER TABLE `prerequisrecherche`
  ADD PRIMARY KEY (`idRecherche`,`idRecherche_PrerequisRecherche`);

--
-- Index pour la table `prerequisunite`
--
ALTER TABLE `prerequisunite`
  ADD PRIMARY KEY (`idRecherche`,`idUnite`),
  ADD KEY `FK_PrerequisUnite_idUnite` (`idUnite`);

--
-- Index pour la table `prixbatiment`
--
ALTER TABLE `prixbatiment`
  ADD PRIMARY KEY (`idRessource`,`idBatiment`),
  ADD KEY `FK_PrixBatiment_idBatiment` (`idBatiment`);

--
-- Index pour la table `prixrecherche`
--
ALTER TABLE `prixrecherche`
  ADD PRIMARY KEY (`idRessource`,`idRecherche`),
  ADD KEY `FK_PrixRecherche_idRecherche` (`idRecherche`);

--
-- Index pour la table `prixunite`
--
ALTER TABLE `prixunite`
  ADD PRIMARY KEY (`idRessource`,`idUnite`),
  ADD KEY `FK_PrixUnite_idUnite` (`idUnite`);

--
-- Index pour la table `recherche`
--
ALTER TABLE `recherche`
  ADD PRIMARY KEY (`idRecherche`);

--
-- Index pour la table `recherches`
--
ALTER TABLE `recherches`
  ADD PRIMARY KEY (`idJoueur`,`idRecherche`),
  ADD KEY `FK_Recherches_idRecherche` (`idRecherche`);

--
-- Index pour la table `ressource`
--
ALTER TABLE `ressource`
  ADD PRIMARY KEY (`idRessource`);

--
-- Index pour la table `unite`
--
ALTER TABLE `unite`
  ADD PRIMARY KEY (`idUnite`),
  ADD KEY `FK_Unite_idUniteType` (`idUniteType`);

--
-- Index pour la table `unites`
--
ALTER TABLE `unites`
  ADD PRIMARY KEY (`idVilles`,`idUnite`),
  ADD KEY `FK_Unites_idUnite` (`idUnite`);

--
-- Index pour la table `unitetype`
--
ALTER TABLE `unitetype`
  ADD PRIMARY KEY (`idUniteType`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`idVille`);

--
-- Index pour la table `villes`
--
ALTER TABLE `villes`
  ADD PRIMARY KEY (`idVilles`),
  ADD KEY `FK_Villes_idJoueur` (`idJoueur`),
  ADD KEY `FK_Villes_idVille` (`idVille`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `armee`
--
ALTER TABLE `armee`
  MODIFY `idArmee` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `armeetype`
--
ALTER TABLE `armeetype`
  MODIFY `idArmeeType` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `batiment`
--
ALTER TABLE `batiment`
  MODIFY `idBatiment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `batiments`
--
ALTER TABLE `batiments`
  MODIFY `idVilles` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `batimenttype`
--
ALTER TABLE `batimenttype`
  MODIFY `idBatimentType` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `caracteristique`
--
ALTER TABLE `caracteristique`
  MODIFY `idCaracteristique` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `caracteristiques`
--
ALTER TABLE `caracteristiques`
  MODIFY `idUnite` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `caserne`
--
ALTER TABLE `caserne`
  MODIFY `idVilles` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `construction`
--
ALTER TABLE `construction`
  MODIFY `idVilles` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `joueur`
--
ALTER TABLE `joueur`
  MODIFY `idJoueur` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `montant`
--
ALTER TABLE `montant`
  MODIFY `idRessource` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `mouvement`
--
ALTER TABLE `mouvement`
  MODIFY `idArmee` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `prerequisrecherche`
--
ALTER TABLE `prerequisrecherche`
  MODIFY `idRecherche` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `prerequisunite`
--
ALTER TABLE `prerequisunite`
  MODIFY `idRecherche` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `prixbatiment`
--
ALTER TABLE `prixbatiment`
  MODIFY `idRessource` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `prixrecherche`
--
ALTER TABLE `prixrecherche`
  MODIFY `idRessource` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `prixunite`
--
ALTER TABLE `prixunite`
  MODIFY `idRessource` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `recherche`
--
ALTER TABLE `recherche`
  MODIFY `idRecherche` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `recherches`
--
ALTER TABLE `recherches`
  MODIFY `idJoueur` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `ressource`
--
ALTER TABLE `ressource`
  MODIFY `idRessource` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `unite`
--
ALTER TABLE `unite`
  MODIFY `idUnite` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `unites`
--
ALTER TABLE `unites`
  MODIFY `idVilles` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `unitetype`
--
ALTER TABLE `unitetype`
  MODIFY `idUniteType` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `ville`
--
ALTER TABLE `ville`
  MODIFY `idVille` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;
--
-- AUTO_INCREMENT pour la table `villes`
--
ALTER TABLE `villes`
  MODIFY `idVilles` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `armee`
--
ALTER TABLE `armee`
  ADD CONSTRAINT `FK_Armee_idArmeeType` FOREIGN KEY (`idArmeeType`) REFERENCES `armeetype` (`idArmeeType`),
  ADD CONSTRAINT `FK_Armee_idVille` FOREIGN KEY (`idVille`) REFERENCES `ville` (`idVille`),
  ADD CONSTRAINT `FK_Armee_idVilles` FOREIGN KEY (`idVilles`) REFERENCES `villes` (`idVilles`);

--
-- Contraintes pour la table `batiment`
--
ALTER TABLE `batiment`
  ADD CONSTRAINT `FK_Batiment_idBatimentType` FOREIGN KEY (`idBatimentType`) REFERENCES `batimenttype` (`idBatimentType`);

--
-- Contraintes pour la table `batiments`
--
ALTER TABLE `batiments`
  ADD CONSTRAINT `FK_Batiments_idBatiment` FOREIGN KEY (`idBatiment`) REFERENCES `batiment` (`idBatiment`),
  ADD CONSTRAINT `FK_Batiments_idVilles` FOREIGN KEY (`idVilles`) REFERENCES `villes` (`idVilles`);

--
-- Contraintes pour la table `caracteristiques`
--
ALTER TABLE `caracteristiques`
  ADD CONSTRAINT `FK_Caracteristiques_idCaracteristique` FOREIGN KEY (`idCaracteristique`) REFERENCES `caracteristique` (`idCaracteristique`),
  ADD CONSTRAINT `FK_Caracteristiques_idUnite` FOREIGN KEY (`idUnite`) REFERENCES `unite` (`idUnite`);

--
-- Contraintes pour la table `caserne`
--
ALTER TABLE `caserne`
  ADD CONSTRAINT `FK_Caserne_idUnite` FOREIGN KEY (`idUnite`) REFERENCES `unite` (`idUnite`),
  ADD CONSTRAINT `FK_Caserne_idVilles` FOREIGN KEY (`idVilles`) REFERENCES `villes` (`idVilles`);

--
-- Contraintes pour la table `construction`
--
ALTER TABLE `construction`
  ADD CONSTRAINT `FK_Construction_idBatiment` FOREIGN KEY (`idBatiment`) REFERENCES `batiment` (`idBatiment`),
  ADD CONSTRAINT `FK_Construction_idVilles` FOREIGN KEY (`idVilles`) REFERENCES `villes` (`idVilles`);

--
-- Contraintes pour la table `montant`
--
ALTER TABLE `montant`
  ADD CONSTRAINT `FK_Montant_idRessource` FOREIGN KEY (`idRessource`) REFERENCES `ressource` (`idRessource`),
  ADD CONSTRAINT `FK_Montant_idVilles` FOREIGN KEY (`idVilles`) REFERENCES `villes` (`idVilles`);

--
-- Contraintes pour la table `mouvement`
--
ALTER TABLE `mouvement`
  ADD CONSTRAINT `FK_Mouvement_idArmee` FOREIGN KEY (`idArmee`) REFERENCES `armee` (`idArmee`),
  ADD CONSTRAINT `FK_Mouvement_idUnite` FOREIGN KEY (`idUnite`) REFERENCES `unite` (`idUnite`);

--
-- Contraintes pour la table `prerequisrecherche`
--
ALTER TABLE `prerequisrecherche`
  ADD CONSTRAINT `FK_PrerequisRecherche_idRecherche` FOREIGN KEY (`idRecherche`) REFERENCES `recherche` (`idRecherche`);

--
-- Contraintes pour la table `prerequisunite`
--
ALTER TABLE `prerequisunite`
  ADD CONSTRAINT `FK_PrerequisUnite_idRecherche` FOREIGN KEY (`idRecherche`) REFERENCES `recherche` (`idRecherche`),
  ADD CONSTRAINT `FK_PrerequisUnite_idUnite` FOREIGN KEY (`idUnite`) REFERENCES `unite` (`idUnite`);

--
-- Contraintes pour la table `prixbatiment`
--
ALTER TABLE `prixbatiment`
  ADD CONSTRAINT `FK_PrixBatiment_idBatiment` FOREIGN KEY (`idBatiment`) REFERENCES `batiment` (`idBatiment`),
  ADD CONSTRAINT `FK_PrixBatiment_idRessource` FOREIGN KEY (`idRessource`) REFERENCES `ressource` (`idRessource`);

--
-- Contraintes pour la table `prixrecherche`
--
ALTER TABLE `prixrecherche`
  ADD CONSTRAINT `FK_PrixRecherche_idRecherche` FOREIGN KEY (`idRecherche`) REFERENCES `recherche` (`idRecherche`),
  ADD CONSTRAINT `FK_PrixRecherche_idRessource` FOREIGN KEY (`idRessource`) REFERENCES `ressource` (`idRessource`);

--
-- Contraintes pour la table `prixunite`
--
ALTER TABLE `prixunite`
  ADD CONSTRAINT `FK_PrixUnite_idRessource` FOREIGN KEY (`idRessource`) REFERENCES `ressource` (`idRessource`),
  ADD CONSTRAINT `FK_PrixUnite_idUnite` FOREIGN KEY (`idUnite`) REFERENCES `unite` (`idUnite`);

--
-- Contraintes pour la table `recherches`
--
ALTER TABLE `recherches`
  ADD CONSTRAINT `FK_Recherches_idJoueur` FOREIGN KEY (`idJoueur`) REFERENCES `joueur` (`idJoueur`),
  ADD CONSTRAINT `FK_Recherches_idRecherche` FOREIGN KEY (`idRecherche`) REFERENCES `recherche` (`idRecherche`);

--
-- Contraintes pour la table `unite`
--
ALTER TABLE `unite`
  ADD CONSTRAINT `FK_Unite_idUniteType` FOREIGN KEY (`idUniteType`) REFERENCES `unitetype` (`idUniteType`);

--
-- Contraintes pour la table `unites`
--
ALTER TABLE `unites`
  ADD CONSTRAINT `FK_Unites_idUnite` FOREIGN KEY (`idUnite`) REFERENCES `unite` (`idUnite`),
  ADD CONSTRAINT `FK_Unites_idVilles` FOREIGN KEY (`idVilles`) REFERENCES `villes` (`idVilles`);

--
-- Contraintes pour la table `villes`
--
ALTER TABLE `villes`
  ADD CONSTRAINT `FK_Villes_idJoueur` FOREIGN KEY (`idJoueur`) REFERENCES `joueur` (`idJoueur`),
  ADD CONSTRAINT `FK_Villes_idVille` FOREIGN KEY (`idVille`) REFERENCES `ville` (`idVille`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
