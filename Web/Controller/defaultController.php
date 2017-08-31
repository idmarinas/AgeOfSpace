<?php

namespace Web\Controller;

use Library\parserLibrary;

class defaultController {

    var $data = array();

    public function indexAction() {
        $this->data["information"] = "Bonjour a tous";
        $parser = new parserLibrary;
        $file = file_get_contents("./Ressources/views/default.html");
        return $parser->parse($file, $this->data);
    }

}
