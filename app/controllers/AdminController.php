<?php

use Phalcon\Flash;
use Phalcon\Session;

/**
* PagesController
*
* Manage operations for invoises
*/
class AdminController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Bienvenue dans le back-office');
        parent::initialize();
    }

    public function indexAction()
    {
        $auth = $this->session->get('auth');
        $user = Users::findFirst($auth['id']);

        $this->flash->success('Bienvenue administrateur ' . $user->nom_Users);
    }

    /**
    * shox all users
    *
    */
    public function usersAction()
    {
        //Query the active user
        $users = Users::find();
        $this->view->users = $users;
        echo 'There are ', count($users), "\n";
    }
}
