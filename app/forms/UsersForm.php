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

        // if ($options['edit']) {$this->add(new Hidden('id_Users'));
        // } else {
        //     $this->add(new Text('id_Users'));
        // }
        $this->add(new Hidden('id_Users'));
        // Name
        $name = new Text('nom_Users');
        $name->setLabel('Votre nom complet');
        $name->setFilters(['striptags', 'string']);

        $this->add($name);

        // Name
        $name = new Text('prenom_Users');
        $name->setLabel('Prénom');
        $name->setFilters(['alphanum']);

        $this->add($name);

        // Email
        $email = new Text('mail_Users');
        $email->setLabel('E-Mail');
        $email->setFilters('email');
        $email->addValidators([
            new Email([
                'message' => 'Adresse mail invalide'
            ])
        ]);
        $this->add($email);


        // Téléphone
        $telephone = new Text('tel_Users');
        $telephone->setLabel('Téléphone');
        $this->add($telephone);

        // Adresse
        $adresse = new Text('adresse_Users');
        $adresse->setLabel('Adresse');
        $this->add($adresse);

        // Ville
        $ville = new Text('ville_Users');
        $ville->setLabel('Ville');
        $this->add($ville);

        // Code postal
        $postal = new Text('postal_Users');
        $postal->setLabel('Code postal');
        $this->add($postal);

    }
}
