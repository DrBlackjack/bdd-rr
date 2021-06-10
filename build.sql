DROP DATABASE IF EXISTS ressources_relationnelles;
CREATE DATABASE ressources_relationnelles;
USE ressources_relationnelles;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ressources_relationnelles`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories_ressources`
--

DROP TABLE IF EXISTS `categories_ressources`;
CREATE TABLE IF NOT EXISTS `categories_ressources` (
  `id_categories` int(11) NOT NULL AUTO_INCREMENT,
  `lib_categories` varchar(50) NOT NULL,
  PRIMARY KEY (`id_categories`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categories_ressources`
--

INSERT INTO `categories_ressources` (`id_categories`, `lib_categories`) VALUES
(1, 'Communication'),
(2, 'Développement personnel'),
(3, 'Intelligence émotionnelle'),
(4, 'Loisirs'),
(5, 'Monde Professionnel'),
(6, 'Parentalité'),
(7, 'Qualité de vie'),
(8, 'Recherche de sens'),
(9, 'Santé physique'),
(10, 'Santé psychique'),
(11, 'Spiritualité'),
(12, 'Vie affective');

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

DROP TABLE IF EXISTS `commentaires`;
CREATE TABLE IF NOT EXISTS `commentaires` (
  `id_commentaire` int(11) NOT NULL AUTO_INCREMENT,
  `id_ressource` int(11) NOT NULL,
  `commentaire` varchar(500) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  PRIMARY KEY (`id_commentaire`),
  KEY `COMMENTAIRES_UTILISATEUR_FK` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `organiser`
--

DROP TABLE IF EXISTS `organiser`;
CREATE TABLE IF NOT EXISTS `organiser` (
  `id_relation_ressource` int(11) NOT NULL,
  `id_ressource` int(11) NOT NULL,
  PRIMARY KEY (`id_relation_ressource`,`id_ressource`),
  KEY `organiser_RESSOURCES0_FK` (`id_ressource`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ressources`
--

DROP TABLE IF EXISTS `ressources`;
CREATE TABLE IF NOT EXISTS `ressources` (
  `id_ressource` int(11) NOT NULL AUTO_INCREMENT,
  `titre_ressource` varchar(100) NOT NULL,
  `description_ressource` varchar(200) NOT NULL,
  `date_creation_ressource` date NOT NULL,
  `chemin_document` varchar(200) NOT NULL,
  `id_type` int(11) NOT NULL,
  `id_categories` int(11) NOT NULL,
  `id_statut` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  PRIMARY KEY (`id_ressource`),
  KEY `RESSOURCES_TYPE_RESSOURCES_FK` (`id_type`),
  KEY `RESSOURCES_CATEGORIES_RESSOURCES0_FK` (`id_categories`),
  KEY `RESSOURCES_STATUT_RESSOURCE1_FK` (`id_statut`),
  KEY `RESSOURCES_UTILISATEUR2_FK` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `statut_ressource`
--

DROP TABLE IF EXISTS `statut_ressource`;
CREATE TABLE IF NOT EXISTS `statut_ressource` (
  `id_statut` int(11) NOT NULL AUTO_INCREMENT,
  `lib_statut` varchar(50) NOT NULL,
  PRIMARY KEY (`id_statut`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `statut_ressource`
--

INSERT INTO `statut_ressource` (`id_statut`, `lib_statut`) VALUES
(1, 'privé'),
(2, 'partagé'),
(3, 'publique');

-- --------------------------------------------------------

--
-- Structure de la table `suivi_ressource`
--

DROP TABLE IF EXISTS `suivi_ressource`;
CREATE TABLE IF NOT EXISTS `suivi_ressource` (
  `id_suivi` int(11) NOT NULL AUTO_INCREMENT,
  `ressource_exploitee` int(11) NOT NULL,
  `ressource_favorie` int(11) NOT NULL,
  `ressource_mise_de_cote` int(11) NOT NULL,
  `id_ressource` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  PRIMARY KEY (`id_suivi`),
  KEY `SUIVI_RESSOURCE_UTILISATEUR_FK` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `type_compte`
--

DROP TABLE IF EXISTS `type_compte`;
CREATE TABLE IF NOT EXISTS `type_compte` (
  `id_type_compte` int(11) NOT NULL AUTO_INCREMENT,
  `type_utilisateur` varchar(50) NOT NULL,
  PRIMARY KEY (`id_type_compte`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_compte`
--

INSERT INTO `type_compte` (`id_type_compte`, `type_utilisateur`) VALUES
(1, 'Modérateur'),
(2, 'Administrateur'),
(3, 'Super-Administrateur'),
(4, 'Citoyen');

-- --------------------------------------------------------

--
-- Structure de la table `type_relation_ressource`
--

DROP TABLE IF EXISTS `type_relation_ressource`;
CREATE TABLE IF NOT EXISTS `type_relation_ressource` (
  `id_relation_ressource` int(11) NOT NULL AUTO_INCREMENT,
  `lib_type_relation` varchar(100) NOT NULL,
  PRIMARY KEY (`id_relation_ressource`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_relation_ressource`
--

INSERT INTO `type_relation_ressource` (`id_relation_ressource`, `lib_type_relation`) VALUES
(1, 'Soi'),
(2, 'Conjoints'),
(3, 'Famille : enfants / parents / fratrie'),
(4, 'Professionnelle : collègues, collaborateurs et managers'),
(5, 'Amis et communautés'),
(6, 'Inconnus');

-- --------------------------------------------------------

--
-- Structure de la table `type_ressources`
--

DROP TABLE IF EXISTS `type_ressources`;
CREATE TABLE IF NOT EXISTS `type_ressources` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `lib_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_ressources`
--

INSERT INTO `type_ressources` (`id_type`, `lib_type`) VALUES
(1, 'Activité / Jeu à réaliser'),
(2, 'Article'),
(3, 'Carte défi'),
(4, 'Cours au format PDF'),
(5, 'Exercice / Atelier'),
(6, 'Fiche de lecture'),
(7, 'Jeu en ligne'),
(8, 'Vidéo');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `mail` varchar(50) NOT NULL,
  `mdp` varchar(100) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `verifie` int(11) NOT NULL,
  `id_type_compte` int(11) NOT NULL,
  PRIMARY KEY (`id_utilisateur`),
  KEY `UTILISATEUR_TYPE_COMPTE_FK` (`id_type_compte`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD CONSTRAINT `COMMENTAIRES_UTILISATEUR_FK` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `organiser`
--
ALTER TABLE `organiser`
  ADD CONSTRAINT `organiser_RESSOURCES0_FK` FOREIGN KEY (`id_ressource`) REFERENCES `ressources` (`id_ressource`),
  ADD CONSTRAINT `organiser_TYPE_RELATION_RESSOURCE_FK` FOREIGN KEY (`id_relation_ressource`) REFERENCES `type_relation_ressource` (`id_relation_ressource`);

--
-- Contraintes pour la table `ressources`
--
ALTER TABLE `ressources`
  ADD CONSTRAINT `RESSOURCES_CATEGORIES_RESSOURCES0_FK` FOREIGN KEY (`id_categories`) REFERENCES `categories_ressources` (`id_categories`),
  ADD CONSTRAINT `RESSOURCES_STATUT_RESSOURCE1_FK` FOREIGN KEY (`id_statut`) REFERENCES `statut_ressource` (`id_statut`),
  ADD CONSTRAINT `RESSOURCES_TYPE_RESSOURCES_FK` FOREIGN KEY (`id_type`) REFERENCES `type_ressources` (`id_type`),
  ADD CONSTRAINT `RESSOURCES_UTILISATEUR2_FK` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `suivi_ressource`
--
ALTER TABLE `suivi_ressource`
  ADD CONSTRAINT `SUIVI_RESSOURCE_UTILISATEUR_FK` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `UTILISATEUR_TYPE_COMPTE_FK` FOREIGN KEY (`id_type_compte`) REFERENCES `type_compte` (`id_type_compte`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
