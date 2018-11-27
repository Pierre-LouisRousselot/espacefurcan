<?php

use Phalcon\Paginator\Adapter\Model as Paginator;


class ProductsController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Bienvenue');
        parent::initialize();
    }

    // public function paginationAction()
    // {
        
    //     $this->assets->addCss("css/global.css");

    //     $numberPage = 1;
    //     if ($this->request->isPost()) {
    //         $query = Criteria::fromInput($this->di,
    //         	"produits", $this->request->getPost());
    //         $this->persistent->searchParams = $query->getParams();
    //     } else {
    //         $numberPage = $this->request->getQuery("page", "int");
    //     }

    //     $parameters = [];
    //     if ($this->persistent->searchParams) {
    //         $parameters = $this->persistent->searchParams;
    //     }

    //     $produits = Products::find($parameters);
    //     if (count($produits) == 0) {
    //         $this->flash->notice("The search did not find any users");

    //         return $this->dispatcher->forward(
    //             [
    //                 "controller" => "produits",
    //                 "action"     => "index",
    //             ]
    //         );
    //     }

    //     $paginator = new Paginator([
    //         "data"  => $produits,
    //         "limit" => 10,
    //         "page"  => $numberPage
    //     ]);

    //     $this->view->page = $paginator->getPaginate();
    //     $this->view->produits = $produits;

    // }

    public function indexAction()
    {
    	 $produits = Produits::find();
         
         // foreach ($produits as $produit) {
         //     // var_dump($produit->id_Produit);
            $this->view->produits = $produits;
 
       
    }
    public function AddProductAction(){


    	 $form = new ProductForm;


    		
		if ($this->request->isPost()) {
            $name = $this->request->getPost('nom', ['string','striptags']);
            $prix = $this->request->getPost('prix', ['float']);
            $description = $this->request->getPost('description', ['string', 'striptags']);
            $stock = $this->request->getPost('stock', ['int', 'striptags']);
            $dateAjout = $this->request->getPost('dateAjout_Produit', ['date', 'striptags']);
            $id_Categorie = $this->request->getPost('id_Categorie', ['int', 'striptags']);
	
            $produits = new Produits();
            $produits->nom_Produit = $name;
            $produits->prix_Produit = $prix;
            $produits->descri_Produit = $description;
            $produits->stock_Produit = $stock;
            $produits->dateAjout_Produit = $dateAjout;
            $produits->id_Categorie = $id_Categorie;
            $produits->dateAjout_Produit = new Phalcon\Db\RawValue('now()');
            if ($produits->save() == false) {
                var_dump($produits->getMessages());die;
                foreach ($produits->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
                $this->flash->success('Votre produit a été rajouter avec succès');
            }
        }
        

          $this->view->form = $form;
    }

     public function deleteAction($id)
    {
var_dump($test);die();
        $produits = Produits::findFirstById($id);
        //var_dump($produits);die();
        if (!$produits) {
            $this->flash->error("User was not found");

            return $this->dispatcher->forward(
                [
                    "controller" => "products",
                    "action"     => "index",
                ]
            );
        }

        if (!$produits->delete()) {
            foreach ($produits->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(
                [
                    "controller" => "products",
                    "action"     => "search",
                ]
            );
        }

        $this->flash->success("Le produit a été supprimer");

        return $this->dispatcher->forward(
            [
                "controller" => "products",
                "action"     => "index",
            ]
        );
    }

}