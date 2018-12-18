
<?php

use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Paginator\Factory;


class BoutiqueController extends ControllerBase
{
	public function initialize()
	{
		$this->tag->setTitle('Bienvenue');
		parent::initialize();
	}

  public function catAction($id){

      $content = Produits::find([

          "conditions" => "id_Categorie = " . $id
      ]);

//      var_dump($content); die;
      $this->view->produits = $content;

       $categories = Categories::find();
    $this->view->categories = $categories;


      //return json_encode($catContent);


  }

  public function marqueAction($marque){

    $marque = Produits::find([

        "conditions" => "nom_Produit = " . $marque
    ]);

    $this->view->marques = $marque;
  }

public function showArticleAction(){
	$produits = Produits::find();
	return json_encode($produits); die;
}

  public function indexAction()
  {

    $produits = Produits::find();
    $this->view->produits = $produits;

    $categories = Categories::find();
    $this->view->categories = $categories;

  }
}
