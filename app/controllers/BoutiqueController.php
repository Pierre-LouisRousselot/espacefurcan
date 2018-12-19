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

       $marques = Marques::find();
       $this->view->marques = $marques;

       $categories = Categories::find();
       $this->view->categories = $categories;

   }
}