<?php

namespace Web\Entity;

use Library\sqlLibrary;

class accountEntity extends sqlLibrary {
    public function newAccount($Pseudo,$MotDePasse,$Email,&$idPlayer){
        $sql = "INSERT INTO joueur (idJoueur,Pseudo,Mdp,Email) VALUES (NULL,'$Pseudo','$MotDePasse','$Email');";
        return $this->query($sql,$idPlayer);
    }
    
    public function getAccount($pseudo){
        $sql = "select * from joueur where Pseudo = '$pseudo'";
        return $this->query($sql);
    }
}
