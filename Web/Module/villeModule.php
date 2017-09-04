<?php

namespace Web\Module;

use Web\Module\playerModule;
use Web\Entity\planeteEntity;
use Web\Ressources\config;

class villeModule {
    public function mainVille($idPlayer){
        $planete = new planeteEntity();
        
        $freeVille = $planete->getFreePlanet();
        
        $id = rand(0,count($freeVille) -1);
        
        $idVille = $freeVille[$id]['idVille'];
        $planete->newVille("Premmiere Ville", $idVille, $idPlayer);
    }
}
