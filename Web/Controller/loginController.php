<?php

namespace Web\Controller;

use Library\parserLibrary;
use Web\Module\playerModule;

class loginController {

    var $data = array();

    public function indexAction() {

        $parser = new parserLibrary;
        $player = new playerModule();
        $this->data['login'] = $player->login();
        $file = $parser->logged(file_get_contents("./Ressources/views/pages/login.html"));
        return $parser->parse($file, $this->data);
    }

}
