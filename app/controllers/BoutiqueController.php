<?php

use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Paginator\Factory;
use Phalcon\Forms\Form;




class BoutiqueController extends ControllerBase
{
 public function initialize()
 {
   $this->tag->setTitle('Bienvenue');
   parent::initialize();
 }


 public function produitAction($id){

// fonction qui rajoute la note et l'avis dans la bd
  $form = new AvisForm;

  if ($this->request->ispost()){
    $note = $this->request->getPost('avis',['int','striptags']);
    $commentaire = $this->request->getPost('commentaire_Avis',['string','striptags']);
    //var_dump($_POST);die();

  }  
  $this->view->form = $form;
  $produit = Produits::findFirst([

   "conditions" => "id_Produit = " . $id
 ]);

  $avis = new Avis();
  $auth = $this->session->get('auth');

        //Query the active user
  $user = Users::findFirst($auth['id']);
  $avis->id_Users = $user->id_Users;
  $avis->id_Produit = $produit->id_Produit;
  $avis->commentaire_Avis = $commentaire;
  $avis->note_Avis = $note;
  $avis->date_Avis = date("Y-m-d H:i:s");
  //var_dump($avis->save());die();
  
  if ($avis->save() == false) {
    foreach ($avis->getMessages() as $message) {
      $this->flash->error((string) $message);
    }
  } else {
      $form->clear();
    $this->flash->success('Merci pour l\'avis');
  }
  $this->view->avis = $avis;
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
  $avis = Avis::findFirst([ 'conditions' => "id_Produit = " . $id ]);
   //var_dump($avis);die();
  $avisBoucle = Avis::find([ 'conditions' => "id_Produit = " . $id ]);
   //var_dump($avisBoucle);die();


  $phql = 'SELECT Users.nom_Users FROM Users
  INNER JOIN Avis ON Avis.id_Users = Users.id_Users
  WHERE Users.id_Users=' . $avis->id_Users;

  $users = $this->modelsManager->executeQuery($phql);
            //La requete renvoie un tableau d'user

  $user = $users[0];
  $this->view->nom_User = $user;
  $this->view->avis = $avis;
  $this->view->avisBoucle = $avisBoucle;
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