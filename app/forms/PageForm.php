<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Hidden;

class PageForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        //Ip caché
        //$id = new Hidden('id');
        //$this->add($id);

        // Contenu de la page
        $page = new TextArea('Page');
        $this->add($page);

    }
}
