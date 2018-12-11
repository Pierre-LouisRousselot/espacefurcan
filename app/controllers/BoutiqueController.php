
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

    // Pagination
 
  

    $numberPage = 1;
       //var_dump($numberPage);die();
    if ($this->request->isPost()) {
      $query = Criteria::fromInput($this->di, "produits", $this->request->getPost());
      $this->persistent->searchParams = $query->getParams();   //var_dump($numberPage);die();
    } else {
      $numberPage = $this->request->getQuery("page", "int");
    }
    //var_dump($numberPage);die();

    $parameters = [];

    $produits = produits::find($parameters);
    //var_dump($produits);die();
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
      "limit" => 10,
      "page"  => $numberPage
    ]);
    //var_dump($paginator);die();

    $this->view->page = $paginator->getPaginate();
    $this->view->boutique = $produits;
    //var_dump($this);die();



  }

}