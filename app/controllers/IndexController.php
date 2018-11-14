<?php



class IndexController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Bienvenue');
        parent::initialize();
    }

    /**
    * Shows the 5 last article
    */
    public function indexAction()
    {



    }

}
