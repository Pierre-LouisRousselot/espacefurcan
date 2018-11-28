<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;

class UsersForm extends Form
{
    public function initialize($entity = null, $options = null)
    {

        if (!isset($options['edit'])) {
            $element = new Text("id_Users");
            $this->add($element->setLabel("Id"));
        } else {
            $this->add(new Hidden("id_Users"));
        }
        // Name
        $name = new Text('nom');
        $name->setLabel('Votre nom complet');
        $name->setFilters(['striptags', 'string']);

        $this->add($name);

        // Name
        $name = new Text('prenom');
        $name->setLabel('Prénom');
        $name->setFilters(['alphanum']);

        $this->add($name);

        // Email
        $email = new Text('email');
        $email->setLabel('E-Mail');
        $email->setFilters('email');
        $email->addValidators([
            new Email([
                'message' => 'Adresse mail invalide'
            ])
        ]);
        $this->add($email);


        // Téléphone
        $telephone = new Text('telephone');
        $telephone->setLabel('Téléphone');
        $this->add($telephone);

        // Adresse
        $adresse = new Text('adresse');
        $adresse->setLabel('Adresse');
        $this->add($adresse);

        // Ville
        $ville = new Text('ville');
        $ville->setLabel('Ville');
        $this->add($ville);

        // Code postal
        $postal = new Text('postal');
        $postal->setLabel('Code postal');
        $this->add($postal);

    }
}
