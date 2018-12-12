<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

class RightController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Bienvenue');
        parent::initialize();
    }

    public function indexAction()
    {
        $form = new SearchForm;
        if ($this->request->isPost()) {
            $email = $this->request->getPost('mail_Users', 'email');
            // var_dump($email);die;
            $user = Users::findFirstByMail_Users($email);
            // var_dump($user);die;
        }
        $this->view->user = $user;
        $this->view->form = $form;
    }
}
