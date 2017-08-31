<?php

$timestart = microtime(true);

$host = "127.0.0.1";
$dbname = "ageofspace";
$username = "root";
$password = "";


$nbPlanete = 100;
$nbVille = 50;


echo "<ul>";
echo "<li>Connexion à  la base de données</li>";
flush();
ob_flush();

try {
    $PDO = new PDO('mysql:host=' . $host . ';'
            . 'dbname=' . $dbname, $username, $password);
} catch (PDOException $e) {
    die('Erreur : ' . $e->getMessage());
}


echo "<li>Insertion des planètes</li>";
flush();
ob_flush();




    for ($s = 1; $s <= $nbPlanete; $s++) {
        for ($p = 1; $p <= $nbVille; $p++) {
			echo "<li>Insertion des planètes</li>";
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
