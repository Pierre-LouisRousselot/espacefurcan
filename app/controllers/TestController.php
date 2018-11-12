<?php

class TestController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Test');
        parent::initialize();
    }

    public function indexAction()
    {
    }
}
