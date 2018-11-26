<?php

use Phalcon\Flash;
use Phalcon\Session;

/**
* PagesController
*
* Manage operations for invoises
*/
class AdminController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Bienvenue dans le back-office');
        parent::initialize();
    }

    public function indexAction()
    {
        $auth = $this->session->get('auth');
        $user = Users::findFirst($auth['id']);

        $this->flash->success('Bienvenue administrateur ' . $user->nom_Users);
    }

    public function showProductAction(){

         $produits = Produits::find();
         
         // foreach ($produits as $produit) {
         //     // var_dump($produit->id_Produit);
            $this->view->produits = $produits;
 
        if (!$this->request->isPost()) {
            $this->tag->setDefault('id', $produits->id_Produit);
            $this->tag->setDefault('name', $produits->nom_Produit);
            $this->tag->setDefault('prix', $produits->prix_Produit);
            $this->tag->setDefault('description', $produits->descri_Produit);
            $this->tag->setDefault('stock', $produits->stock_Produit);
            $this->tag->setDefault('date ajout', $produits->dateAjout_Produit);
            $this->tag->setDefault('id catégorie', $produits->id_Categorie);
        } else {

            $id = $this->request->getPost('id', ['int', 'striptags']);
            $name = $this->request->getPost('name', ['string','striptags']);
            $prix = $this->request->getPost('prix', ['float', 'floatval']);
            $description = $this->request->getPost('description', ['string', 'striptags']);
            $stock = $this->request->getPost('stock', ['int', 'striptags']);
            $dateAjout = $this->request->getPost('dateAjout_Produit', ['date', 'striptags']);
            $id_Categorieµ = $this->request->getPost('id_Categorie', ['int', 'striptags']);

            $produits->id_Produit = $id;
            $produits->name = $name;
            $produits->prix = $prix;
            $produits->description = $description;
            $produits->stock = $stock;
            $produits->dateAjout = $dateAjout;
            $produits->id_Categorie = $id_Categorie;
            if ($produits->save() == false) {
                var_dump($name);
                var_dump($produits->getMessages());die;
                foreach ($produits->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
                $this->flash->success('Your profile information was updated successfully');
            }
        }
    }

    /**
    * shox all users
    *
    */
    public function usersAction()
    {
        //Query the active user
        $users = Users::find();
        $this->view->users = $users;
        echo 'There are ', count($users), "\n";
    }
}
