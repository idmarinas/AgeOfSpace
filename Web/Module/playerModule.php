<?php

namespace Web\Module;

use Library\securityLibrary;
use Web\Entity\accountEntity;
use Library\generalLibrary;
use Web\Module\villeModule;

class playerModule {

    public function register() {
        $account = new accountEntity();
        $security = new securityLibrary();
        $general = new generalLibrary();
        $ville = new villeModule();
        
        $array = array("error" => array("pseudo" => "", "password" => "", "confirm" => "", "email" => ""),"post"=>array("pseudo" => "", "email" => ""));

        if (isset($_POST['register'])) {
            $pseudo = $_POST['pseudo'];
            $password = $_POST['password'];
            $confirm = $_POST['confirm'];
            $email = $_POST['email'];

            if (!empty($pseudo)) {
                if ($security->checkUsername($pseudo)) {
                    if (strlen($pseudo) > 8 && strlen($pseudo) < 20) {
                        if (count($account->getAccount($pseudo)) > 0) {
                            $array['error']['pseudo'] = "Pseudo invalide (deja utiliser)";
                        }else{
                            $array['post']['pseudo'] = $pseudo;
                        }
                    } else {
                        $array['error']['pseudo'] = "Pseudo trop cour ou trop long";
                    }
                } else {
                    $array['error']['pseudo'] = "Pseudo invalide (caractere interdit)";
                }
            } else {
                $array['error']['pseudo'] = "Pseudo vide";
            }

            if (!empty($password)) {
                if ($security->checkPassword($password)) {
                    if (strlen($password) < 8 && strlen($password) > 60) {
                        $array['error']['password'] = "password trop cour ou trop long";
                    }
                } else {
                    $array['error']['password'] = "password invalide (caractere interdit)";
                }
            } else {
                $array['error']['password'] = "Password vide";
            }

            if ($password != $confirm) {
                $array['error']['confirm'] = "Les mot de passe ne correspondent pas";
            }

            if (!empty($email)) {
                if (!($security->checkEmail($email))) {
                    $array['error']['email'] = "Email invalide";
                }else{
                     $array['post']['email'] = $email;
                }
            } else {
                $array['error']['email'] = "Email vide";
            }

            if ($general->countArray($array['error']) == 0) {
                $password = $security->encrypt($pseudo, $password);
                $account->newAccount($pseudo, $password, $email,$idPlayer);
                $ville->mainVille($idPlayer);
                header('Location: index.php?pages=login');
                exit;
            }
        }

        return $array;
    }

    public function login() {
        $account = new accountEntity();
        $security = new securityLibrary();

        $array = array("error" => "","post"=> "");
        if (isset($_POST['login'])) {
            $pseudo = $_POST['pseudo'];
            $password = $_POST['password'];
            
            $getAccount = $account->getAccount($pseudo);
            if(count($getAccount)>0){
                $password = $security->encrypt($pseudo,$password);
                if($password == $getAccount['0']['Mdp']){
                    $_SESSION['login']=$pseudo;
                    header('location: index.php?pages=overview');
                    exit;
                }
            }
            $array['error'] = "Utilisateur ou mot de passe incorrect";
            $array['post'] = $pseudo;
        }
        return $array;
    }

    public function logout() {
        session_destroy();
        unset($_SESSION['login']);
        session_start();
        header('location: index.php');
    }
}
