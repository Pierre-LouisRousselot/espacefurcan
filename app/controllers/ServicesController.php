<?php

class ServicesController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Bienvenue');
        parent::initialize();
    }

    public function indexAction()
    {

        $nomPage = "Service";
        $catepage = CatePages::find([
            "conditions" => "nom_CatePage = '".$nomPage."'"
        ]);

        $page = Pages::find([
            "conditions" => "id_CatePage =" .$catepage[0]->id_CatePage
        ]);

        //die;
        //var_dump($page[0]->contenu_Page);

        $this->view->page = $page[0]->contenu_Page;
    }
}
