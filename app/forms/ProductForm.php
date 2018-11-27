<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Password;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;

class ProductForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        // Nom du produit
        $name = new Text('nom');
        $name->setLabel('Nom du produit');
        $name->setFilters(['striptags', 'string']);
        $name->addValidators([
            new PresenceOf([
                'message' => 'Nom du produit'
            ])
        ]);
        $this->add($name);

        // prix du produit
        $prix = new text('prix');
        $prix->setLabel('prix');
        $prix->setFilters(['int']);
        $prix->addValidators([
            new PresenceOf([
                'message' => 'Prix du produit'
            ])
        ]);
        $this->add($prix);

        // Description du produit
        $descri = new Text('description');
        $descri->setLabel('description');
        $descri->setFilters('description');
        $descri->addValidators([
            new PresenceOf([
                'message' => 'description du produit'
            ]),
            new Email([
                'message' => 'description du produit'
            ])
        ]);
        $this->add($descri);


        // produit en Stock
        $stock = new text('stock');
        $stock->setLabel('stock');
        $stock->addValidators([
            new PresenceOf([
                'message' => 'stock'
            ]),
        ]);
        $this->add($stock);

        // Date d'ajout du produit
        $dateAjout = new text('date');
        $dateAjout->setLabel('date');
        $dateAjout->addValidators([
            new PresenceOf([
                'message' => 'La date d ajout'
            ]),
        ]);
        $this->add($dateAjout);

        // Id catégorie du produit
        $categorie = new text('id_Categorie');
        $categorie->setLabel('id_Categorie');
        $categorie->addValidators([
            new PresenceOf([
                'message' => 'categorie'
            ]),
        ]);
        $this->add($categorie);

       }
   }