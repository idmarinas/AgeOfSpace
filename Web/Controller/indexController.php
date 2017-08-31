<?php

namespace Web\Controller;

use Library\parserLibrary;

class indexController {

    var $data = array();

    public function indexAction() {

        $parser = new parserLibrary;
        $file = file_get_contents("./Ressources/views/pages/index.html");
        return $parser->parse($file, $this->data);
    }

}
