<?php

class InformatiqueController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Bienvenue');
        parent::initialize();
    }

    public function indexAction()
    {
        $menu = "test";

        $this->view->menu = $menu;
    }
}
