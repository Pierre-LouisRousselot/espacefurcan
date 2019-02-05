<?php

use Phalcon\Mvc\Model;

class Gsm extends Model
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
        'type_Tel',
        'tailleEcran_Tel',
        'os_Tel',
        'typeSim_Tel',
        'proc_Tel',
        'sd_Tel',
        'photo_Tel',
        'ram_Tel',
        'rom_Tel',
        'batterie_Tel',
        'couleur_Tel'
      ];
    }
}
