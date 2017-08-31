<?php

$timestart = microtime(true);

$host = "127.0.0.1";
$dbname = "ageofspace";
$username = "root";
$password = "";


$nbPlanete = 10;
$nbVille = 20;

$ressource = array("Bois", "Pierre", "Or");
$caracteristique = array("Attaque", "Defence", "Point de vie", "Vitesse", "Capaciter");
$ArmeeType = array("Attaquer", "Transporter", "Coloniser", "Stationner", "Espionner");
$batimentType = array("Ressources", "Installations");
$batiment = array(
    array("nom" => "Scierie", "type" => 1),
    array("nom" => "Cariere", "type" => 1),
    array("nom" => "Exploitation Or", "type" => 1),
    array("nom" => "Entrepot", "type" => 2),
    array("nom" => "Caserne", "type" => 2),
    array("nom" => "Laboratoire de recherche", "type" => 2)
);
$prixbatiment = array(
    4 => array(1 => 1000),
    5 => array(1 => 1000, 2 => 500,3 => 200),
    6 => array(1 => 1000, 2 => 1000, 3 => 1000),
   
);
$uniteType = array("Attaque", "Defence");
$unite = array(
    array("nom" => "Epeiste", "type" => 1, "niveau" => 1),
    array("nom" => "Archer", "type" => 2, "niveau" => 3)

);
$prixunite = array(
    1 => array(1 => 100, 2 => 300, 3 => 300),
    2 => array(1 => 300, 2 => 100, 3 => 300)
);
$prerequisunite = array(
    1 => array(1 => 1),
    2 => array(2 => 1)
    
);
$caracteristiques = array(
    1 => array(1 => 10, 2 => 2, 3 => 50, 4 => 1000, 5 => 50),
    2 => array(1 => 2, 2 => 12, 3 => 40, 4 => 800, 5 => 40)
   
);
$recherche = array(
    array("nom" => "Guerrier nÃ©", "niveau" => 1),
    array("nom" => "Tireur d un autre temp", "niveau" => 1)
    
);
$prixrecherche = array(
    1 => array(1 => 100, 3 => 200),
    2 => array(2 => 100, 3 => 200)
    
);
$prerequisrecherche = array(
    
    #3 => array(2 => 5, 1 => 4)
    
);


echo "<ul>";
echo "<li>Connexion Ã  la base de donnÃ©es</li>";
flush();
ob_flush();

try {
    $PDO = new PDO('mysql:host=' . $host . ';'
            . 'dbname=' . $dbname, $username, $password);
} catch (PDOException $e) {
    die('Erreur : ' . $e->getMessage());
}

echo "<li>Création de la structure</li>";
flush();
ob_flush();


$sql = $PDO->prepare("DROP TABLE IF EXISTS Joueur ; CREATE TABLE Joueur (idJoueur int AUTO_INCREMENT NOT NULL, Pseudo CHAR(64), Mdp CHAR(128), Email CHAR(128), PRIMARY KEY (idJoueur) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS Ville ; CREATE TABLE Ville (idVille int AUTO_INCREMENT NOT NULL, PositionVille INT, PositionPlanete INT, PRIMARY KEY (idVille) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS Villes ; CREATE TABLE Villes (idVilles int AUTO_INCREMENT NOT NULL, NomVilles CHAR(64), idJoueur INT, idVille INT, PRIMARY KEY (idVilles) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS Batiment ; CREATE TABLE Batiment (idBatiment int AUTO_INCREMENT NOT NULL, NomBatiment CHAR(64), idBatimentType INT, PRIMARY KEY (idBatiment) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS BatimentType ; CREATE TABLE BatimentType (idBatimentType int AUTO_INCREMENT NOT NULL, NomBatimentType CHAR(64), PRIMARY KEY (idBatimentType) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS Recherche ; CREATE TABLE Recherche (idRecherche int AUTO_INCREMENT NOT NULL, NomRecherche CHAR(64), PRIMARY KEY (idRecherche) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS Unite ; CREATE TABLE Unite (idUnite int AUTO_INCREMENT NOT NULL, NomUnite CHAR(64), idUniteType INT, PRIMARY KEY (idUnite) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS Caracteristique ; CREATE TABLE Caracteristique (idCaracteristique int AUTO_INCREMENT NOT NULL, NomCaracteristique CHAR(64), PRIMARY KEY (idCaracteristique) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS UniteType ; CREATE TABLE UniteType (idUniteType int AUTO_INCREMENT NOT NULL, NomUniteType CHAR(64), PRIMARY KEY (idUniteType) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS Ressource ; CREATE TABLE Ressource (idRessource int AUTO_INCREMENT NOT NULL, NomRessource CHAR(64), PRIMARY KEY (idRessource) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS Armee ; CREATE TABLE Armee (idArmee int AUTO_INCREMENT NOT NULL, TempMarche INT, idVilles INT, idVille INT, idArmeeType INT, PRIMARY KEY (idArmee) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS ArmeeType ; CREATE TABLE ArmeeType (idArmeeType int AUTO_INCREMENT NOT NULL, NomArmeeType CHAR(64), PRIMARY KEY (idArmeeType) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS Construction ; CREATE TABLE Construction (idVilles int AUTO_INCREMENT NOT NULL, idBatiment INT NOT NULL, idConstruction INT, TempsConstruction INT, PRIMARY KEY (idVilles,  idBatiment) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS Batiments ; CREATE TABLE Batiments (idVilles int AUTO_INCREMENT NOT NULL, idBatiment INT NOT NULL, NiveauBatiments INT, PRIMARY KEY (idVilles,  idBatiment) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS Recherches ; CREATE TABLE Recherches (idJoueur int AUTO_INCREMENT NOT NULL, idRecherche INT NOT NULL, TempsRecherche INT, NiveauRecherche INT, PRIMARY KEY (idJoueur,  idRecherche) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS Caracteristiques ; CREATE TABLE Caracteristiques (idUnite int AUTO_INCREMENT NOT NULL, idCaracteristique INT NOT NULL, NombresCaracteristique INT, PRIMARY KEY (idUnite,  idCaracteristique) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS Unites ; CREATE TABLE Unites (idVilles int AUTO_INCREMENT NOT NULL, idUnite INT NOT NULL, NombreUnites INT, PRIMARY KEY (idVilles,  idUnite) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS Caserne ; CREATE TABLE Caserne (idVilles int AUTO_INCREMENT NOT NULL, idUnite INT NOT NULL, idCaserne INT, TempCaserne INT, PRIMARY KEY (idVilles,  idUnite) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS PrixBatiment ; CREATE TABLE PrixBatiment (idRessource int AUTO_INCREMENT NOT NULL, idBatiment INT NOT NULL, PrixBatiment INT, PRIMARY KEY (idRessource,  idBatiment) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS PrixUnite ; CREATE TABLE PrixUnite (idRessource int AUTO_INCREMENT NOT NULL, idUnite INT NOT NULL, PrixUnite INT, PRIMARY KEY (idRessource,  idUnite) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS PrixRecherche ; CREATE TABLE PrixRecherche (idRessource int AUTO_INCREMENT NOT NULL, idRecherche INT NOT NULL, PrixRecherche INT, PRIMARY KEY (idRessource,  idRecherche) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS Montant ; CREATE TABLE Montant (idRessource int AUTO_INCREMENT NOT NULL, idVilles INT NOT NULL, Montant INT, PRIMARY KEY (idRessource,  idVilles) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS Mouvement ; CREATE TABLE Mouvement (idArmee int AUTO_INCREMENT NOT NULL, idUnite INT NOT NULL, NombreMouvement INT, PRIMARY KEY (idArmee,  idUnite) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS PrerequisUnite ; CREATE TABLE PrerequisUnite (idRecherche int AUTO_INCREMENT NOT NULL, idUnite INT NOT NULL, PRIMARY KEY (idRecherche,  idUnite) ) ENGINE=InnoDB;  DROP TABLE IF EXISTS PrerequisRecherche ; CREATE TABLE PrerequisRecherche (idRecherche int AUTO_INCREMENT NOT NULL, idRecherche_PrerequisRecherche INT, PRIMARY KEY (idRecherche) ) ENGINE=InnoDB;  ALTER TABLE Villes ADD CONSTRAINT FK_Villes_idJoueur FOREIGN KEY (idJoueur) REFERENCES Joueur (idJoueur); ALTER TABLE Villes ADD CONSTRAINT FK_Villes_idVille FOREIGN KEY (idVille) REFERENCES Ville (idVille); ALTER TABLE Batiment ADD CONSTRAINT FK_Batiment_idBatimentType FOREIGN KEY (idBatimentType) REFERENCES BatimentType (idBatimentType); ALTER TABLE Unite ADD CONSTRAINT FK_Unite_idUniteType FOREIGN KEY (idUniteType) REFERENCES UniteType (idUniteType); ALTER TABLE Armee ADD CONSTRAINT FK_Armee_idVilles FOREIGN KEY (idVilles) REFERENCES Villes (idVilles); ALTER TABLE Armee ADD CONSTRAINT FK_Armee_idVille FOREIGN KEY (idVille) REFERENCES Ville (idVille); ALTER TABLE Armee ADD CONSTRAINT FK_Armee_idArmeeType FOREIGN KEY (idArmeeType) REFERENCES ArmeeType (idArmeeType); ALTER TABLE Construction ADD CONSTRAINT FK_Construction_idVilles FOREIGN KEY (idVilles) REFERENCES Villes (idVilles); ALTER TABLE Construction ADD CONSTRAINT FK_Construction_idBatiment FOREIGN KEY (idBatiment) REFERENCES Batiment (idBatiment); ALTER TABLE Batiments ADD CONSTRAINT FK_Batiments_idVilles FOREIGN KEY (idVilles) REFERENCES Villes (idVilles); ALTER TABLE Batiments ADD CONSTRAINT FK_Batiments_idBatiment FOREIGN KEY (idBatiment) REFERENCES Batiment (idBatiment); ALTER TABLE Recherches ADD CONSTRAINT FK_Recherches_idJoueur FOREIGN KEY (idJoueur) REFERENCES Joueur (idJoueur); ALTER TABLE Recherches ADD CONSTRAINT FK_Recherches_idRecherche FOREIGN KEY (idRecherche) REFERENCES Recherche (idRecherche); ALTER TABLE Caracteristiques ADD CONSTRAINT FK_Caracteristiques_idUnite FOREIGN KEY (idUnite) REFERENCES Unite (idUnite); ALTER TABLE Caracteristiques ADD CONSTRAINT FK_Caracteristiques_idCaracteristique FOREIGN KEY (idCaracteristique) REFERENCES Caracteristique (idCaracteristique); ALTER TABLE Unites ADD CONSTRAINT FK_Unites_idVilles FOREIGN KEY (idVilles) REFERENCES Villes (idVilles); ALTER TABLE Unites ADD CONSTRAINT FK_Unites_idUnite FOREIGN KEY (idUnite) REFERENCES Unite (idUnite); ALTER TABLE Caserne ADD CONSTRAINT FK_Caserne_idVilles FOREIGN KEY (idVilles) REFERENCES Villes (idVilles); ALTER TABLE Caserne ADD CONSTRAINT FK_Caserne_idUnite FOREIGN KEY (idUnite) REFERENCES Unite (idUnite); ALTER TABLE PrixBatiment ADD CONSTRAINT FK_PrixBatiment_idRessource FOREIGN KEY (idRessource) REFERENCES Ressource (idRessource); ALTER TABLE PrixBatiment ADD CONSTRAINT FK_PrixBatiment_idBatiment FOREIGN KEY (idBatiment) REFERENCES Batiment (idBatiment); ALTER TABLE PrixUnite ADD CONSTRAINT FK_PrixUnite_idRessource FOREIGN KEY (idRessource) REFERENCES Ressource (idRessource); ALTER TABLE PrixUnite ADD CONSTRAINT FK_PrixUnite_idUnite FOREIGN KEY (idUnite) REFERENCES Unite (idUnite); ALTER TABLE PrixRecherche ADD CONSTRAINT FK_PrixRecherche_idRessource FOREIGN KEY (idRessource) REFERENCES Ressource (idRessource); ALTER TABLE PrixRecherche ADD CONSTRAINT FK_PrixRecherche_idRecherche FOREIGN KEY (idRecherche) REFERENCES Recherche (idRecherche); ALTER TABLE Montant ADD CONSTRAINT FK_Montant_idRessource FOREIGN KEY (idRessource) REFERENCES Ressource (idRessource); ALTER TABLE Montant ADD CONSTRAINT FK_Montant_idVilles FOREIGN KEY (idVilles) REFERENCES Villes (idVilles); ALTER TABLE Mouvement ADD CONSTRAINT FK_Mouvement_idArmee FOREIGN KEY (idArmee) REFERENCES Armee (idArmee); ALTER TABLE Mouvement ADD CONSTRAINT FK_Mouvement_idUnite FOREIGN KEY (idUnite) REFERENCES Unite (idUnite); ALTER TABLE PrerequisUnite ADD CONSTRAINT FK_PrerequisUnite_idRecherche FOREIGN KEY (idRecherche) REFERENCES Recherche (idRecherche); ALTER TABLE PrerequisUnite ADD CONSTRAINT FK_PrerequisUnite_idUnite FOREIGN KEY (idUnite) REFERENCES Unite (idUnite); ALTER TABLE PrerequisRecherche ADD CONSTRAINT FK_PrerequisRecherche_idRecherche FOREIGN KEY (idRecherche) REFERENCES Recherche (idRecherche); ");
$sql->execute();

$sql = $PDO->prepare("SET foreign_key_checks = 0; ALTER TABLE `prerequisrecherche` DROP PRIMARY KEY, ADD PRIMARY KEY(`idRecherche`,`idRecherche_PrerequisRecherche`); ALTER TABLE `prerequisrecherche` ADD `PrerequisRecherche` INT NOT NULL AFTER `idRecherche_PrerequisRecherche`;");
$sql->execute();


echo "<li>Insertion des ressources</li>";
flush();
ob_flush();

for ($i = 0; $i < count($ressource); $i++) {
    $sql = $PDO->prepare('INSERT INTO ressource (`idRessource`, `NomRessource`) VALUES (NULL, "' . $ressource[$i] . '");');
    $sql->execute();
}

echo "<li>Insertion des caractéristiques</li>";
flush();
ob_flush();

for ($i = 0; $i < count($caracteristique); $i++) {
    $sql = $PDO->prepare('INSERT INTO caracteristique (`idCaracteristique`, `NomCaracteristique`) VALUES (NULL, "' . $caracteristique[$i] . '");');
    $sql->execute();
}

echo "<li>Insertion des flottes type</li>";
flush();
ob_flush();

for ($i = 0; $i < count($ArmeeType); $i++) {
    $sql = $PDO->prepare('INSERT INTO ArmeeType (`idArmeeType`, `NomArmeeType`) VALUES (NULL, "' . $ArmeeType[$i] . '");');
    $sql->execute();
}

echo "<li>Insertion des bâtiments type</li>";
flush();
ob_flush();

for ($i = 0; $i < count($batimentType); $i++) {
    $sql = $PDO->prepare("INSERT INTO batimenttype (`idBatimentType`, `NomBatimentType`) VALUES (NULL, '" . $batimentType[$i] . "');");
    $sql->execute();
}

echo "<li>Insertion des bâtiments</li>";
flush();
ob_flush();

for ($i = 0; $i < count($batiment); $i++) {
    $sql = $PDO->prepare("INSERT INTO batiment (`idBatiment`, `NomBatiment` , `idBatimentType`) VALUES (NULL, '" . $batiment[$i]["nom"] . "', " . $batiment[$i]["type"] . ");");
    $sql->execute();
}

echo "<li>Insertion des prix bâtiments</li>";
flush();
ob_flush();

foreach ($prixbatiment as $key1 => $value1) {
    foreach ($value1 as $key2 => $value2) {
        $sql = $PDO->prepare("INSERT INTO `prixbatiment` (`idBatiment`, `idRessource`, `PrixBatiment`) VALUES ('$key1', '$key2', '$value2');");
        $sql->execute();
    }
}

echo "<li>Insertion des unités type</li>";
flush();
ob_flush();

for ($i = 0; $i < count($uniteType); $i++) {
    $sql = $PDO->prepare("INSERT INTO unitetype (`idUniteType`, `NomUniteType`) VALUES (NULL, '" . $uniteType[$i] . "');");
    $sql->execute();
}

echo "<li>Insertion des unités</li>";
flush();
ob_flush();

for ($i = 0; $i < count($unite); $i++) {
    $sql = $PDO->prepare("INSERT INTO unite (`idUnite`, `NomUnite`, `ChantierSpatial` , `idUniteType`) VALUES (NULL, '" . $unite[$i]["nom"] . "', '" . $unite[$i]["niveau"] . "' , " . $unite[$i]["type"] . ");");
    $sql->execute();
}

echo "<li>Insertion des caractéristiques</li>";
flush();
ob_flush();

foreach ($caracteristiques as $key1 => $value1) {
    foreach ($value1 as $key2 => $value2) {
        $sql = $PDO->prepare("INSERT INTO `caracteristiques` (`idUnite`, `idCaracteristique`, `NombreCaracteristiques`) VALUES ('$key1', '$key2', '$value2');");
        $sql->execute();
    }
}

echo "<li>Insertion des prix unités</li>";
flush();
ob_flush();

foreach ($prixunite as $key1 => $value1) {
    foreach ($value1 as $key2 => $value2) {
        $sql = $PDO->prepare("INSERT INTO `prixunite` (`idUnite`, `idRessource`, `PrixUnite`) VALUES ('$key1', '$key2', '$value2');");
        $sql->execute();
    }
}

echo "<li>Insertion des prérequis unités</li>";
flush();
ob_flush();

foreach ($prerequisunite as $key1 => $value1) {
    foreach ($value1 as $key2 => $value2) {
        $sql = $PDO->prepare("INSERT INTO `prerequisunite` (`idUnite`, `idRecherche`, `PrerequisUnite`) VALUES ('$key1', '$key2', '$value2');");
        $sql->execute();
    }
}

echo "<li>Insertion des recherches</li>";
flush();
ob_flush();

for ($i = 0; $i < count($recherche); $i++) {
    $sql = $PDO->prepare('INSERT INTO recherche (`idRecherche`, `NomRecherche`, `Laboratoire`) VALUES (NULL, "' . $recherche[$i]["nom"] . '", "' . $recherche[$i]["niveau"] . '");');
    $sql->execute();
}

echo "<li>Insertion des prix recherches</li>";
flush();
ob_flush();

foreach ($prixrecherche as $key1 => $value1) {
    foreach ($value1 as $key2 => $value2) {
        $sql = $PDO->prepare("INSERT INTO `prixrecherche` (`idRecherche`, `idRessource`, `PrixRecherche`) VALUES ('$key1', '$key2', '$value2');");
        $sql->execute();
    }
}

echo "<li>Insertion des prérequis recherches</li>";
flush();
ob_flush();

foreach ($prerequisrecherche as $key1 => $value1) {
    foreach ($value1 as $key2 => $value2) {
        $sql = $PDO->prepare("INSERT INTO `prerequisrecherche` (`idRecherche`, `idRecherche_PrerequisRecherche`, `PrerequisRecherche`) VALUES ('$key1', '$key2', '$value2');");
        $sql->execute();
    }
}

echo "<li>Insertion des planètes</li>";
flush();
ob_flush();



for ($s = 1; $s <= $nbPlanete; $s++) {
    for ($p = 1; $p <= $nbVille; $p++) {
		$sql = $PDO->prepare("INSERT INTO `ville` (`idVille`, `PositionVille`, `PositionPlanete`) VALUES (NULL, '".$s."', '".$p."');");
        $sql->execute();
     }
}


echo "<li>Terminé</li>";
echo "</ul>";
flush();
ob_flush();

$timeend = microtime(true);
$time = $timeend - $timestart;

$page_load_time = number_format($time, 3);
echo "Debut du script: " . date("H:i:s", $timestart);
echo "<br>Fin du script: " . date("H:i:s", $timeend);
echo "<br>Script execute en " . $page_load_time . " sec";
