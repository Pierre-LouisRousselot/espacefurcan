<?php

use Phalcon\Mvc\Model;

class Lecteurusb extends Model
{
    /**
     * @var integer
     */
    public $id_Produit;

    public function getColumn()
    {
      // Keys are the real names in the table and
      // the values their names in the application
      return [
        'id_Produit',
        'type_Lecteur',
        'vitesse_Lecteur'
      ];
    }
}
