<?php

class SchoolController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Bienvenue');
        parent::initialize();
    }

    public function indexAction()
    {
        echo date("d/m/Y");
    }
}
