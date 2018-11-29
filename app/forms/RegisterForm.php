<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Password;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;

class RegisterForm extends Form
{
    public function initialize($entity = null, $options = null)
    {
        // Name
        $name = new Text('nom');
        $name->setLabel('Votre nom complet');
        $name->setFilters(['striptags', 'string']);
        $name->addValidators([
            new PresenceOf([
                'message' => 'Votre nom est requis'
            ])
        ]);
        $this->add($name);

        // Name
        $name = new Text('prenom');
        $name->setLabel('Prénom');
        $name->setFilters(['alphanum']);
        $name->addValidators([
            new PresenceOf([
                'message' => 'Votre prénom est requis'
            ])
        ]);
        $this->add($name);

        // Email
        $email = new Text('email');
        $email->setLabel('E-Mail');
        $email->setFilters('email');
        $email->addValidators([
            new PresenceOf([
                'message' => 'Adresse mail requise'
            ]),
            new Email([
                'message' => 'Adresse mail invalide'
            ])
        ]);
        $this->add($email);


        // Téléphone
        $telephone = new Text('telephone');
        $telephone->setLabel('Téléphone');
        $telephone->addValidators([
            new PresenceOf([
                'message' => 'Adresse mail requise'
            ]),
        ]);
        $this->add($telephone);

        // Adresse
        $adresse = new Text('adresse');
        $adresse->setLabel('Adresse');
        $adresse->addValidators([
            new PresenceOf([
                'message' => 'Adresse requise'
            ]),
        ]);
        $this->add($adresse);

        // Ville
        $ville = new Text('ville');
        $ville->setLabel('Ville');
        $ville->addValidators([
            new PresenceOf([
                'message' => 'Votre adresse complète est requise'
            ]),
        ]);
        $this->add($ville);

        // Code postal
        $postal = new Text('postal');
        $postal->setLabel('Code postal');
        $postal->addValidators([
            new PresenceOf([
                'message' => 'Votre code postal est requis'
            ]),
        ]);
        $this->add($postal);

        // Password
        $password = new Password('password', ['minlength' => 8]);
        $password->setLabel('Mot de passe');
        $password->addValidators([
            new PresenceOf([
                'message' => 'Un mot de passe est requis'
            ])
        ]);
        $this->add($password);

        // Confirm Password
        $repeatPassword = new Password('repeatPassword', ['minlength' => 8]);
        $repeatPassword->setLabel('Répéter le mot de passe');
        $repeatPassword->addValidators([
            new PresenceOf([
                'message' => 'La confirmation du mot de passe est requise'
            ])
        ]);
        $this->add($repeatPassword);
    }
}
