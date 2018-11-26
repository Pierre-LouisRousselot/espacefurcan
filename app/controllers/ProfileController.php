<?php

class ProfileController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Bienvenue');
        parent::initialize();
    }

    public function indexAction()
    {
    }

    public function informationsAction(){
        //Get session info
        $auth = $this->session->get('auth');

        //Query the active user
        $user = Users::findFirst($auth['id']);
        if ($user == false) {
            return $this->dispatcher->forward(
                [
                    "controller" => "index",
                    "action"     => "index",
                ]
            );
        }
//pour preremplir les champs
        if (!$this->request->isPost()) {
            $this->tag->setDefault('name', $user->nom_Users);
            $this->tag->setDefault('email', $user->mail_Users);
            $this->tag->setDefault('prenom', $user->prenom_Users);
            $this->tag->setDefault('tel', $user->tel_Users);
            $this->tag->setDefault('adresse', $user->adresse_Users);
            $this->tag->setDefault('ville', $user->ville_Users);
            $this->tag->setDefault('postal', $user->postal_Users);
        } else {

            $name = $this->request->getPost('name', ['string', 'striptags']);
            $email = $this->request->getPost('email', 'email');
            $prenom = $this->request->getPost('prenom', ['string', 'striptags']);
            $tel = $this->request->getPost('tel', ['int', 'string']);
            $adresse = $this->request->getPost('adresse', ['string', 'striptags']);
            $ville = $this->request->getPost('ville', ['string', 'striptags']);
            $postal = $this->request->getPost('postal', ['string', 'striptags']);

            $user->nom_Users = $name;
            $user->mail_Users = $email;
            $user->prenom_Users = $prenom;
            $user->tel_Users = $tel;
            $user->adresse_Users = $adresse;
            $user->ville_Users = $ville;
            $user->postal_Users = $postal;
            if ($user->save() == false) {
                var_dump($name);
                var_dump($user->getMessages());die;
                foreach ($user->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
                $this->flash->success('Your profile information was updated successfully');
            }
        }
    }

    // public function informationsAction()
    // {
    //     //Get session info
    //     $auth = $this->session->get('auth');
    //
    //     //Query the active user
    //     $user = Users::findFirst($auth['id']);
    //     if ($user == false) {
    //         return $this->dispatcher->forward(
    //             [
    //                 "controller" => "index",
    //                 "action"     => "index",
    //             ]
    //         );
    //     }
    //
    //     if (!$this->request->isPost()) {
    //         $this->tag->setDefault('nom', $user->nom_Users);
    //         $this->tag->setDefault('prenom', $user->prenom_Users);
    //         $this->tag->setDefault('email', $user->mail_Users);
    //         $this->tag->setDefault('tel', $user->tel_Users);
    //         $this->tag->setDefault('adresse', $user->adresse_Users);
    //         $this->tag->setDefault('ville', $user->ville_Users);
    //         $this->tag->setDefault('postal', $user->postal_Users);
    //     } else if ($this->request->isPost()) {
    //
    //         $nom = $this->request->getPost('nom', ['string', 'striptags']);
    //         $prenom = $this->request->getPost('prenom', 'striptags');
    //         $email = $this->request->getPost('email', 'email');
    //         $telephone = $this->request->getPost('tel', 'int');
    //         $adresse = $this->request->getPost('adresse');
    //         $ville = $this->request->getPost('ville', 'striptags');
    //         $postal = $this->request->getPost('postal', 'int');
    //         $password = $this->request->getPost('password');
    //         $repeatPassword = $this->request->getPost('repeatPassword');
    //
    //         $repeatNewPassword = $this->request->getPost('repeatNewPassword');
    //
    //         if ( sha1($password) != $user->password_Users ){
    //             $this->flash->error('Mauvais mot de passe');
    //             return false;
    //         }
    //         if ($repeatPassword != $repeatNewPassword) {
    //             $this->flash->error('Les mots de passe sont différents');
    //             return false;
    //         }
    //
    //         $user->nom_Users = $nom;
    //         $user->password_Users = sha1($password);
    //         $user->prenom_Users = $prenom;
    //         $user->mail_Users = $email;
    //         $user->tel_Users = $telephone;
    //         $user->adresse_Users = $adresse;
    //         $user->ville_Users = $ville;
    //         $user->postal_Users = $postal;
    //         if ($user->save() == false) {
    //             foreach ($user->getMessages() as $message) {
    //                 $this->flash->error((string) $message);
    //             }
    //         } else {
    //
    //             $this->flash->success('Vos informations ont été correctement mises à jours');
    //
    //             return $this->dispatcher->forward(
    //                 [
    //                     "controller" => "profile",
    //                     "action"     => "informations",
    //                 ]
    //             );
    //         }
    //     }
    //
    // }

}
