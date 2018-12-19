<?php
use Phalcon\Mvc\Url;

class PagesController extends ControllerBase
{
  public function initialize()
  {
    $this->tag->setTitle('Gestion des pages');
    parent::initialize();
  }

  /**
  * Permet d'ajouter la fonction de Dropdown et de lancer le formulaire
  */
  public function indexAction()
  {
    //$this->assets->addJs('//cloud.tinymce.com/stable/tinymce.min.js', false);
    $this->addDrop();

    $form = new PageForm;

    $this->view->form = $form;


  }

  /**
  * Permet d'afficher les pages statiques
  * @param  int  $id [id de la page à afficher]
  * @return [string]     [contenu de la page]
  */
  public function displayPageAction($id)
  {

    $content = Pages::find([
      "conditions" => "id_Page = ". $id
    ]);

    //Permet de formater les chemins d'images pour les afficher
    $newContent = str_replace('<img src="', '<img src="../', $content[0]->contenu_Page);

    $this->view->page = $newContent;
  }

  /**
  * Permet d'afficher la page à modifier dans le CMS
  * @param  int $id id de la page à charger dans le CMS
  * @return JSON     [Json contenant les info de la page]
  */
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

  /**
  * Récupere les données du Dropdown
  */
  private function addDrop(){
    $drop ='';
    $catpage = CatePages::find();
    foreach($catpage as $idService => $detailService){
      if($detailService->id_CatePage != 3){
        $drop .='<h5 class="dropdown-header">'.$detailService->nom_CatePage.'</h5>';
        $page = Pages::find([
          "conditions" => "id_CatePage =" .$detailService->id_CatePage
        ]);
        foreach ($page as $idPage => $value) {
          $drop .='<a class="dropdown-item" onclick="loadPage('.$value->id_Page.')" href="#">'.$value->titre_Page.'</a>';
        }
      } else {
        $drop .='<div class="dropdown-divider"></div>';
        $page = Pages::find([
          "conditions" => "id_CatePage =" .$detailService->id_CatePage
        ]);
        $value = $page[0];
        $drop .='<a class="dropdown-item" onclick="loadPage('.$value->id_Page.')" href="#">'.$value->titre_Page.'</a>';
      }
    }
    $this->view->drop = $drop;
  }

  /**
  * Permet de sauvegarder le contenu d'une page statique dans la bdd
  */
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

  /**
  * Permet d'ajouter une page statique dans la bdd
  */
  public function addPageAction()
  {
    if( isset($_POST['content']) && isset($_POST['title'])&& isset($_POST['idCate']) ){

      $newpage = new Pages();
      $newpage->titre_Page = $_POST['title'];
      $newpage->contenu_Page = $_POST['content'];
      $newpage->dateUpdate_Page = new Phalcon\Db\RawValue('now()');
      $newpage->id_CatePage = $_POST['idCate'];


      if($newpage->create() == false){
        foreach ($newpage->getMessages() as $message) {
          $this->flash->error((string) $message);
        }
      }
    }
  }

  /**
  * Permet de supprimer une page statique de la bdd
  */
  public function delPageAction()
  {
    if( isset($_GET['id'])){

      $content = Pages::find([
        "conditions" => "id_Page = ". $_GET['id']
      ]);
      if($content->delete() == false){
        foreach ($content->getMessages() as $message) {
          $this->flash->error((string) $message);
        }
      }
    }
  }

  /**
  * Permet d'inclure des photos dans le CMS
  * @return [JSON] [Retourne le chemin de l'image sauvegardée]
  */
  public function postAcceptorAction()
  {
    /*******************************************************
    * Only these origins will be allowed to upload images *
    ******************************************************/
    $accepted_origins = array("http://localhost", "http://192.168.1.1", "http://espacefurcan.be");

    /*********************************************
    * Change this line to set the upload folder *
    *********************************************/

    $url = new Url();
    $url->setBaseUri('');
    $imageFolder = $url->getStatic('../public/images-page/');

    reset ($_FILES);
    $temp = current($_FILES);

    if (is_uploaded_file($temp['tmp_name'])){
      if (isset($_SERVER['HTTP_ORIGIN'])) {
        // same-origin requests won't set an origin. If the origin is set, it must be valid.
        if (in_array($_SERVER['HTTP_ORIGIN'], $accepted_origins)) {
          header('Access-Control-Allow-Origin: ' . $_SERVER['HTTP_ORIGIN']);
        } else {
          header("HTTP/1.1 403 Origin Denied");
          return;
        }
      }

      /*
      If your script needs to receive cookies, set images_upload_credentials : true in
      the configuration and enable the following two headers.
      */
      // header('Access-Control-Allow-Credentials: true');
      // header('P3P: CP="There is no P3P policy."');

      // Sanitize input
      if (preg_match("/([^\w\s\d\-_~,;:\[\]\(\).])|([\.]{2,})/", $temp['name'])) {
        header("HTTP/1.1 400 Invalid file name.");
        return;
      }

      // Verify extension
      if (!in_array(strtolower(pathinfo($temp['name'], PATHINFO_EXTENSION)), array("gif", "jpg", "png"))) {
        header("HTTP/1.1 400 Invalid extension.");
        return;
      }

      // Accept upload if there was no origin, or if it is an accepted origin
      $filetowrite = $imageFolder . $temp['name'];
      $finalcheck = move_uploaded_file($temp['tmp_name'], $filetowrite);

      // Respond to the successful upload with JSON.
      // Use a location key to specify the path to the saved image resource.
      // { location : '/your/uploaded/image/file'}

      echo json_encode(array('location' => $filetowrite));
      die;
    } else {
      // Notify editor that the upload failed
      header("HTTP/1.1 500 Server Error");
    }
  }

}
