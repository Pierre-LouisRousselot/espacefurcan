<?php

class PagesController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Gestion des pages');
        parent::initialize();
    }

    public function indexAction()
    {
        //$this->assets->addJs('//cloud.tinymce.com/stable/tinymce.min.js', false);

        $form = new PageForm;

        if ($this->request->isPost()){


            $id = 2;
            $titre = "Service";
            $content = $this->request->getPost('Page');

            $newpage = new Pages();
            $newpage->id_Page = $id;
            $newpage->titre_Page = $titre;
            $newpage->contenu_Page = $content;
            $newpage->images_Page = "df";
            $newpage->dateUpdate_Page = new Phalcon\Db\RawValue('now()');
            $newpage->id_CatePage = 2;


            if($newpage->save() == false){
                foreach ($newpage->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            }
        }
        $this->view->form = $form;

        $nomPage = "Service";
        $catepage = CatePages::find([
            "conditions" => "nom_CatePage = '".$nomPage."'"
        ]);

        $page = Pages::find([
            "conditions" => "id_CatePage =" .$catepage[0]->id_CatePage
        ]);


        $contentpage = $page[0]->contenu_Page;
        //$this->view->page = $contentpage;

        $this->tag->setDefault('Page', $contentpage);

    }
}
