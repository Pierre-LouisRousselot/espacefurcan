<?php

use Phalcon\Mvc\Model;

class Ordinateurfixe extends Model
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
        'os_OrdinateurFixe',
        'proc_OrdinateurFixe',
        'ram_OrdinateurFixe',
        'memoire_OrdinateurFixe',
        'nbUsb_OrdinateurFixe',
        'cable_OrdinateurFixe'
      ];
    }
}
