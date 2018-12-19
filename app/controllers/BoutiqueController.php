
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

 public function indexAction()
 {

  $produits = Produits::find();
  $this->view->produits = $produits;


  $categories = Categories::find();
  $this->view->categories = $categories;

  $marques = Marques::find();
  $this->view->marques = $marques;


// Pagination //
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

public function catAction($id){

  $content = Produits::find([

    "conditions" => "id_Categorie = " . $id
  ]);

  $marques = Marques::find();



  $this->view->marques = $marques;

  $categories = Categories::find();
  $this->view->categories = $categories;


  $this->view->produits = $content;
  $this->view->categories = $categories;

}

public function marqueAction($marque){


  $produits = Produits::find([

    "conditions" => "id_Marque = " . $marque
  ]);

  $marques = Marques::find();

 //var_dump($marques);die();

  $this->view->marques = $marques;

  $this->view->produits = $produits;
  
  $categories = Categories::find();
  $this->view->categories = $categories;


}

public function produitAction($id){

  $produit = Produits::findFirst([

   "conditions" => "id_Produit = " . $id
 ]);

  $this->view->produit = $produit;

   $categories = Categories::findFirst([

    "conditions" => "id_Categorie = " . $produit->id_Categorie

  ]);
  $this->view->categories = $categories;


  $nom = $categories->tag_Categorie;


    $detailProduit = $nom::findFirst([

      "conditions" => "id_Produit = "  . $id 


    ]);
    $tab = $detailProduit->toArray();

    
    $this->view->detailProduit = $tab;
 

}

}
