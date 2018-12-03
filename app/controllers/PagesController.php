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
        $this->addDrop();

        $form = new PageForm;

        $this->view->form = $form;


    }

    public function displayPageAction($id)
    {

        $content = Pages::find([
            "conditions" => "id_Page = ". $id
        ]);

        $this->view->page = $content[0]->contenu_Page;
    }

    public function loadTinyAction($id)
    {
        $content = Pages::find([
            "conditions" => "id_Page = ". $id
        ]);
        $pageContent = [
            "titre" => $content[0]->titre_Page,
            "content" => $content[0]->contenu_Page,
            "cate" => $content[0]->id_CatePage
        ];
        //var_dump($pageContent);die;
        return json_encode($pageContent);
    }

    private function addDrop(){
        $drop ='';
        $catpage = CatePages::find();
        foreach($catpage as $idService => $detailService){
            $drop .='<li class="dropdown-header">'.$detailService->nom_CatePage.'</li>';
            $page = Pages::find([
                "conditions" => "id_CatePage =" .$detailService->id_CatePage
            ]);
            //var_dump($page);
            foreach ($page as $idPage => $value) {
                $drop .='<li><a onclick="loadPage('.$value->id_Page.')" href="#">'.$value->titre_Page.'</a></li>';
            }
        }
        $this->view->drop = $drop;
    }

    public function savePageAction()
    {

        if( isset($_POST['id']) && isset($_POST['content']) && isset($_POST['title'])&& isset($_POST['idCate']) ){

            $newpage = new Pages();
            $newpage->id_Page = $_POST['id'];
            $newpage->titre_Page = $_POST['title'];
            $newpage->contenu_Page = $_POST['content'];
            $newpage->dateUpdate_Page = new Phalcon\Db\RawValue('now()');
            $newpage->id_CatePage = $_POST['idCate'];


            if($newpage->save() == false){
                foreach ($newpage->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            }
        }

    }

}
