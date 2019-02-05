<?php

use Phalcon\Mvc\Model;

class Tablette extends Model
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
        'tailleEcran_Tablette',
        'os_Tablette',
        'proc_Tablette',
        'sd_Tablette',
        'photo_Tablette',
        'ram_Tablette',
        'rom_Tablette',
        'batterie_Tablette',
        'couleur_Tablette'
      ];
    }
}
