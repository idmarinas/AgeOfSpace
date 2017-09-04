<?php

namespace Web\Controller;

use Library\parserLibrary;


class overviewController {

    var $data = array();

    public function indexAction() {

        $parser = new parserLibrary;
        
        $file = $parser->logged(file_get_contents("./Ressources/views/pages/overview.html"));
        return $parser->parse($file, $this->data);
    }

}
