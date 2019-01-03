<?php

use Phalcon\Mvc\Model;

class Ordinateurport extends Model
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
      'os_OrdinateurPort',
      'proc_OrdinateurPort',
      'ram_OrdinateurPort',
      'memoire_OrdinateurPort',
      'tailleEcran_OrdinateurPort',
      'nbUsb_OrdinateurPort',
      'cable_OrdinateurPort'
    ];
  }
}
