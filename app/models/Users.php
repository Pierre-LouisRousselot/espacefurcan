<?php

use Phalcon\Mvc\Model;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Regex;
use Phalcon\Validation\Validator\Email as EmailValidator;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Uniqueness as UniquenessValidator;

class Users extends Model
{

    public function validation()
    {
        $validator = new Validation();

        $validator->add(
            'mail_Users',
            new EmailValidator([
                    'message' => 'Email invalide'
                ]));

        $validator->add(
            'mail_Users',
            new UniquenessValidator([
                    'message' => 'Désolé, l\'adresse mail que vous avez saisie est déjà enregistrée.'
                ]));


        $validator->add(
            'tel_Users',
            new StringLength([
                    'messageMinimum' => 'The telephone is too short',
                    'min'            => 2,
                ]));

        return $this->validate($validator);
    }
}
