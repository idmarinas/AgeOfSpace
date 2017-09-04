<?php

namespace Web\Entity;

use Library\sqlLibrary;
use Web\Ressources\config;

class planeteEntity extends sqlLibrary {
    
    public function getFreePlanet(){
        $limit = config::NB_PLANET;
        $sql  = "SELECT * FROM ville WHERE idVille NOT IN (SELECT DISTINCT villes.idVille FROM villes) limit $limit;";
        return $this->query($sql);
    }
    
    public function newVille($NomVilles,$idVille,$idJoueur){
        $sql  = "INSERT INTO `villes` (`idVilles`, `NomVilles`, `idJoueur`, `idVille`) VALUES (NULL, '$NomVilles', '$idJoueur', '$idVille');";
        return $this->query($sql);
    }
}
