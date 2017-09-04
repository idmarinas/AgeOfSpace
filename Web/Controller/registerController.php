<?php

namespace Web\Controller;

use Library\parserLibrary;
use Web\Module\playerModule;


class registerController {

    var $data = array();

    public function indexAction() {

        $parser = new parserLibrary;
        $player = new playerModule();
        $this->data['register'] = $player->register();
        $file = $parser->logged(file_get_contents("./Ressources/views/pages/register.html"));
        return $parser->parse($file, $this->data);
    }

}
