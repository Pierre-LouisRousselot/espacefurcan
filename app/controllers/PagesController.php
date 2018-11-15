<?php

use Phalcon\Flash;
use Phalcon\Session;

/**
 * PagesController
 *
 * Manage operations for invoises
 */
class PagesController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Gestion des pages');
        parent::initialize();
    }

    public function indexAction()
    {
        $this->assets->addCss("css/global.css");

        echo "page";

    }

    /**
     * Edit the active user profile
     *
     */
    public function profileAction()
    {
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

        if (!$this->request->isPost()) {
            $this->tag->setDefault('name', $user->name);
            $this->tag->setDefault('email', $user->email);
        } else {

            $name = $this->request->getPost('name', ['string', 'striptags']);
            $email = $this->request->getPost('email', 'email');

            $user->name = $name;
            $user->email = $email;
            if ($user->save() == false) {
                foreach ($user->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
                $this->flash->success('Your profile information was updated successfully');
            }
        }
    }
}
