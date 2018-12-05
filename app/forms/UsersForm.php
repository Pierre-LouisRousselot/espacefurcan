<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\File;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Identical;

class UsersForm extends Form
{
    public function initialize($entity = null, $options = null)
    {

        $this->add(new Hidden('id_Users'));
        if (!isset($options['edit']))
        {

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
                new PresenceOf([
                    'message' => 'Adresse mail requise'
                ]),
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

            $file = new File(
                "file",
                [
                    "placeholder" => ""
                ]
            );
            $file->setLabel("Ficher validation status");
            $this->add($file);
        }
        else {

            // Name
            $name = new Text('name');
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
                new PresenceOf([
                    'message' => 'Adresse mail requise'
                ]),
                new Email([
                    'message' => 'Adresse mail invalide'
                ])
            ]);
            $this->add($email);


            // Téléphone
            $telephone = new Text('tel');
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
            // Password
            $password = new Password('password', ['minlength' => 8]);
            $password->setLabel('Mot de passe');
            $password->addValidators(array(
                new PresenceOf(
                    [
                        'message' => 'Mot de passe requis'
                        ]
                    ),

                )
            );
            $this->add($password);

            $newPassword = new Password('newPassword', ['notRequired' => true]);
            $newPassword->setLabel('Nouveau mot de passe');
            $newPassword->setAttribute('required', 'false');
            $newPassword->addValidators(array(
                new StringLength(array(
                    'min' => 8,
                    'messageMinimum' => 'Votre mot de passe doit être au de 8 caractères',
                    'allowEmpty' => true,
                )
            ),

        )
    );
    $this->add($newPassword);

    // Confirm Password
    $repeatPassword = new Password('repeatNewPassword',['notRequired' => true]);
    $repeatPassword->setLabel('Répéter le mot de passe');
    $repeatPassword->setAttribute('required', 'false');
    $repeatPassword->addValidator(new Identical(
        [
            'value' =>  $newPassword->getValue(),
            'message' => 'Les nouveaux mots de passes doivent être identiques'
        ]
        )
    );
    $this->add($repeatPassword);
}
}
}
