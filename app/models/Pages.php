<?php

use Phalcon\Mvc\Model;

class Pages extends Model
{
    /**
     * @var integer
     */
    public $id_Page;

    /**
     * @var integer
     */
    public $id_CatePage;

    /**
     * @var string
     */
    public $titre_Page;

    /**
     * @var string
     */
    public $contenu_Page;

    /**
     * @var string
     */
    public $images_Page;

    /**
     * @var string
     */
    public $dateUpdate_Page;
}
