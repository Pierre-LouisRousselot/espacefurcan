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
                return false;
            }

            $user = new Users();
            $user->nom = $nom;
            $user->password = sha1($password);
            $user->prenom = $prenom;
            $user->email = $email;
            $user->telephone = $telephone;
            $user->adresse = $adresse;
            $user->ville = $ville;
            $user->postal = $postal;
            $user->date_create = new Phalcon\Db\RawValue('now()');
            $user->date_update = new Phalcon\Db\RawValue('now()');
            $user->date_connection = new Phalcon\Db\RawValue('now()');
            $user->idStatut = '1';
            $user->idRole = '1';
            $user->active = 'Y';
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
