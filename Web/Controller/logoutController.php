<?php

namespace Web\Controller;

use Web\Module\playerModule;

class logoutController {

    var $data = array();

    public function indexAction() {

       
        $player = new playerModule();
        $player->logout();
        
    }

}
