<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;

class ProductForm extends Form
{
    public function initialize($entity = null, $options = null)
    {

        $this->add(new Hidden('id_Produit'));
        // Nom du produit
        $name = new Text('nom_Produit');
        $name->setLabel('Nom du produit');
        $name->setFilters(['striptags', 'string']);
        // $name->addValidators([
        //     new PresenceOf([
        //         'message' => 'Nom du produit'
        //     ])
        // ]);
        $this->add($name);
        //var_dump($name);

        // prix du produit
        $prix = new text('prix_Produit');
        $prix->setLabel('prix du produit');
        $prix->setFilters(['int']);
        $prix->addValidators([
            new PresenceOf([
                'message' => 'Prix du produit'
            ])
        ]);
        $this->add($prix);

        // Description du produit
        $descri = new Text('descri_Produit');
        $descri->setLabel('description du produit');
        $descri->setFilters('string');
        $descri->addValidators([
            new PresenceOf([
                'message' => 'description du produit'
            ]),
        ]);
        $this->add($descri);


        // produit en Stock
        $stock = new text('stock_Produit');
        $stock->setLabel('nombre de produit en stock');
        $stock->addValidators([
            new PresenceOf([
                'message' => 'stock'
            ]),
        ]);
        $this->add($stock);

        // Date d'ajout du produit
        // $dateAjout = new text('date');
        // $dateAjout->setLabel('date');
        // $dateAjout->addValidators([
        //     new PresenceOf([
        //         'message' => 'La date d ajout'
        //     ]),
        // ]);
        // $this->add($dateAjout);
        if ($options['edit']) {
            $this->add(new text('dateAjout_Produit'));
       } else {
           $this->add(new Text('dateAjout_Produit'));
       }

        // Id catégorie du produit
        $categorie = new text('id_Categorie');
        $categorie->setLabel('Catégorie');
        $categorie->addValidators([
            new PresenceOf([
                'message' => 'categorie'
            ]),
        ]);
        $this->add($categorie);

       }
   }