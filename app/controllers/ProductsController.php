<?php

class ProductsController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Bienvenue');
        parent::initialize();
    }

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


}
