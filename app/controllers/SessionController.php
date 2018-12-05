<?php

/**
* SessionController
*
* Allows to authenticate users
*/
class SessionController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Inscription / Connexion');
        parent::initialize();
    }

    public function indexAction()
    {
        if (!$this->request->isPost()) {
            $this->tag->setDefault('email', 'pierrelouis.rousselot1test@orange.fr');
            $this->tag->setDefault('password', 'testtest');
        }

    }

    /**
    * Register an authenticated user into session data
    *
    * @param Users $user
    */
    private function _registerSession(Users $user)
    {
        $this->session->set('auth', [
            'id' => $user->id_Users,
            'name' => $user->nom_Users,
            'role' => $user->id_Role,
            'statut' => $user->id_Statut
        ]);
    }

    /**
    * This action authenticate and logs an user into the application
    *
    */
    public function startAction()
    {
        if ($this->request->isPost()) {

            $email = $this->request->getPost('email');
            $password = $this->request->getPost('password');

            $user = Users::findFirst([
                "(mail_Users = :email: OR nom_Users = :email:) AND password_Users = :password:",
                'bind' => ['email' => $email, 'password' => sha1($password)]
            ]);

            if ($user != false) {

                $user->dateLastCo_Users = new stdClass();
                $user->dateLastCo_Users = new Phalcon\Db\RawValue('now()');
                $user->save();
                $this->_registerSession($user);
                $this->flash->success('Bienvenue ' . $user->nom_Users);

                return $this->dispatcher->forward(
                    [
                        "controller" => "index",
                        "action"     => "index",
                    ]
                );
            }else{

                $this->flash->error('Mauvais identifiant / mot de passe');
            }

        }

        return $this->dispatcher->forward(
            [
                "controller" => "session",
                "action"     => "index",
            ]
        );
    }

    /**
    * Finishes the active session redirecting to the index
    *
    * @return unknown
    */
    public function endAction()
    {
        $this->session->remove('auth');
        $this->flash->success('Au revoir!');

        return $this->dispatcher->forward(
            [
                "controller" => "index",
                "action"     => "index",
            ]
        );
    }
}
