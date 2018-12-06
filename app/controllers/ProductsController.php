<?php

// use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Flash;
use Phalcon\Forms\Element\File;


class ProductsController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Bienvenue');
        parent::initialize();
    }


    public function indexAction() {

      $produits = Produits::find();
      $this->view->produits = $produits;
 }
  

  public function AddProductAction(){


      $form = new ProductForm;
      $imageFolder = 'public/image_produit/';



      if ($this->request->isPost()) {
        $name = $this->request->getPost('nom_Produit', ['string','striptags']);
        $prix = $this->request->getPost('prix_Produit', ['float']);
        $description = $this->request->getPost('descri_Produit', ['string', 'striptags']);
        $stock = $this->request->getPost('stock_Produit', ['int', 'striptags']);
        $dateAjout = $this->request->getPost('dateAjout_Produit', ['date', 'striptags']);
        $id_Categorie = $this->request->getPost('id_Categorie', ['int', 'striptags']);


        $produits = new Produits();
        if ($this->request->hasFiles()) {
           $files = $this->request->getUploadedFiles();
               //var_dump('test');die();

           foreach ($files as $file) {
                   // Move the file into the application
               $file->moveTo('../public/image_produit/' . $file->getName());
               $produits->image_path = 'public/image_produit/' . $file->getName();
           }
       }
       $produits->nom_Produit = $name;
       $produits->prix_Produit = $prix;
       $produits->descri_Produit = $description;
       $produits->stock_Produit = $stock;
       $produits->dateAjout_Produit = $dateAjout;
       $produits->id_Categorie = $id_Categorie;
            //$produits->image_path = $imageFolder . $image_produit;
            //var_dump($image_produit->image_path);die;
       $produits->dateAjout_Produit = new Phalcon\Db\RawValue('now()');
       if ($produits->save() == false) {
                //var_dump($produits->getMessages());die;
        foreach ($produits->getMessages() as $message) {
            $this->flash->error((string) $message);
        }
    } else {
        $this->flash->success('Votre produit a été rajouter avec succès');
        $form->clear();
    }
}


$this->view->form = $form;

}

    /**
    * Deletes an article
    *
    * @param string $id
    */
    public function deleteAction($id)
    {
        $produits = Produits::findFirstById_Produit($id);
        if (!$produits) {
            $this->flash->error("La suppression de l'article est impossible");

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

        $this->flash->success("Votre produit a été supprimer avec succès");

        return $this->dispatcher->forward(
            [
                "controller" => "products",
                "action"     => "index",
            ]
        );
    }

    public function editAction($id)
    {

        if (!$this->request->isPost()) {

            $produit = Produits::findFirstById_Produit($id);
            if (!$produit) {
                //var_dump($produit);die();
                $this->flash->error("Ce produit n'existe pas");

                return $this->dispatcher->forward(
                    [
                        "controller" => "products",
                        "action"     => "index",
                    ]
                );
            }
            $this->view->produit = $produit;
            //var_dump($produit);die();
            $form = new ProductForm((object)
                ['id_Produit' => $id]);
            //var_dump($form);die();
            $this->view->form = new ProductForm($produit,['edit' => true]);
         // var_dump($this->view->form);die;
        }
    }

    /**
    * Saves current article
    *
    * @param string $id
    */
    public function saveAction()
    {

        //var_dump($this->request->getPost());die;
        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(
                [
                    "controller" => "products",
                    "action"     => "index",
                ]
            );
        }

        $id = $this->request->getPost("id_Produit");
        //var_dump($id);die;
        $produit = Produits::findFirstById_Produit($id);
        if (!$produit) {
            $this->flash->error("Ce produit n'existe pas");

            return $this->dispatcher->forward(
                [
                    "controller" => "products",
                    "action"     => "index",

                ]
            );
        }

        $form = new ProductForm;
        $this->view->form = $form;

        $data = $this->request->getPost();
        if ($this->request->hasFiles()) {
           $files = $this->request->getUploadedFiles();
               //var_dump('test');die();

           foreach ($files as $file) {
                   // Move the file into the application
               $file->moveTo('../public/image_produit/' . $file->getName());
               $produit->image_path = 'public/image_produit/' . $file->getName();
           }
       }
        //var_dump($produit->save());

       if (!$form->isValid($data, $produit)) {
        foreach ($form->getMessages() as $message) {
            $this->flash->error($message);
        }

    }

    if ($produit->save() == false) {
        foreach ($produit->getMessages() as $message) {
            $this->flash->error($message);
        }

    }

    $form->clear();

    $this->flash->success("Le produit a été modifié avec succès");

    return $this->dispatcher->forward(
        [
            "controller" => "products",
            "action"     => "index",
        ]
    );
}

    //  public function uploadAction()
    // {


    //     Check if the user has uploaded files
    //     if ($this->request->hasFiles() == true) {
    //         $image_produit = 'image_produit/';
    //         var_dump($image_produit);die();

    //         // Print the real file names and sizes
    //         foreach ($this->request->getUploadedFiles() as $file) {
    //             // $Photo = new Photo();
    //             // $Photo->name = $file->getName();
    //             // $Photo->size = $file->getSize();
    //             // $Photo->save();

    //             //Move the file into the application
    //             $file->moveTo('../public/image_produit/' . $file->getName());
    //             //$file->moveTo($image_produit . './public/image_produit/');
    //         }
    //     }
    // }





}
