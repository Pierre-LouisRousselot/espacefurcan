
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



  public function indexAction()
  {

    $produits = Produits::find();
    $this->view->produits = $produits;


    $categories = Categories::find();
    $this->view->categories = $categories;

    // test de categorie



    // fin de test de categorie

    // Pagination

    $numberPage = 1;
  
    if ($this->request->isPost()) {
      $query = Criteria::fromInput($this->di, "produits", $this->request->getPost());
      $this->persistent->searchParams = $query->getParams();
    } else {
      $numberPage = $this->request->getQuery("page", "int");
     
    }
   

    $parameters = [];

    $produits = produits::find($parameters);
   
    if (count($produits) == 0) {
      $this->flash->notice("La recherche est vide");

      return $this->dispatcher->forward(
        [
          "controller" => "Boutique",
          "action"     => "index",
        ]
      );
    }

    $paginator = new Paginator([
      "data"  => $produits,
      "limit" => 9,
      "page"  => $numberPage
    ]);
 

    $this->view->page = $paginator->getPaginate();
    $this->view->produit = $produits;




  }
}

 