<?php

use Phalcon\Mvc\Model;

class Haurparleur extends Model
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
        'cable_HP',
        'puissance_HP',
        'alimentation_HP',
        'resis_HP',
        'debit_HP'
      ];
    }
}
