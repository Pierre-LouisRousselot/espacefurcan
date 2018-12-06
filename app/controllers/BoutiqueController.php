<?php

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

         // foreach ($produits as $produit) {
         //     // var_dump($produit->id_Produit);
      $this->view->produits = $produits;


  }

}