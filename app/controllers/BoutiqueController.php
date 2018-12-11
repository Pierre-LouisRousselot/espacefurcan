
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
    if ($this->request->isPost()) {
      $query = Criteria::fromInput($this->di, "Boutique", $this->request->getPost());
      $this->persistent->searchParams = $query->getParams();
    } else {
      $numberPage = $this->request->getQuery("page", "int");
    }

    $parameters = [];

    $boutique = produits::find($parameters);
    if (count($boutique) == 0) {
      $this->flash->notice("La recherche est vide");

      return $this->dispatcher->forward(
        [
          "controller" => "Boutique",
          "action"     => "index",
        ]
      );
    }

    $paginator = new Paginator([
      "data"  => $boutique,
      "limit" => 5,
      "page"  => $numberPage
    ]);

    $this->view->page = $paginator->getPaginate();
    $this->view->boutique = $boutique;


  }

}