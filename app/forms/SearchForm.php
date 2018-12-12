<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Password;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;

class SearchForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        // prix du produit
        $mail = new Text('mail_Users');
        $mail->setLabel('Mail de l\'utilisateur');
        $mail->setFilters(['mail']);
        $mail->addValidators([
          new PresenceOf([
            'message' => 'Mail de l\'utilisateur'
          ])
        ]);
        $this->add($mail);
    }
}
