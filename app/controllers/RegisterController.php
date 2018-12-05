<?php

/**
 * SessionController
 *
 * Allows to register new users
 */
class RegisterController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Inscription');
        parent::initialize();
    }

    /**
     * Action to register a new user
     */
    public function indexAction()
    {
        $form = new RegisterForm;

        if ($this->request->isPost()) {

            $nom = $this->request->getPost('nom', ['string', 'striptags']);
            $prenom = $this->request->getPost('prenom', 'striptags');
            $email = $this->request->getPost('email', 'email');
            $telephone = $this->request->getPost('telephone', 'int');
            $adresse = $this->request->getPost('adresse');
            $ville = $this->request->getPost('ville', 'striptags');
            $postal = $this->request->getPost('postal', 'int');
            $password = $this->request->getPost('password');
            $repeatPassword = $this->request->getPost('repeatPassword');

            if ($password != $repeatPassword) {
                $this->flash->error('Les mots de passe sont différents');

            }

            $user = new Users();
            $user->nom_Users = $nom;
            $user->password_Users = sha1($password);
            $user->prenom_Users = $prenom;
            $user->mail_Users = $email;
            $user->tel_Users = $telephone;
            $user->adresse_Users = $adresse;
            $user->ville_Users = $ville;
            $user->postal_Users = $postal;
            $user->dateCreation_Users = new Phalcon\Db\RawValue('now()');
            $user->dateUpdate_Users = new Phalcon\Db\RawValue('now()');
            $user->dateLastCo_Users = new Phalcon\Db\RawValue('now()');
            $user->file_Users = ' ';
            $user->id_Statut = '1';
            $user->id_Role = '1';
            if ($user->save() == false) {
                foreach ($user->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
                $this->tag->setDefault('email', '');
                $this->tag->setDefault('password', '');
                $this->flash->success('Merci pour l\'inscription');

                return $this->dispatcher->forward(
                    [
                        "controller" => "session",
                        "action"     => "index",
                    ]
                );
            }
        }

        $this->view->form = $form;
    }
}
