<?php

use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{

    protected function initialize()
    {
        $this->tag->prependTitle('Espace Furcan | ');
        $this->view->setTemplateAfter('main');
    }
}
