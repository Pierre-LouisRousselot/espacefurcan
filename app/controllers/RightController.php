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

        $form = new UsersForm(null, ['search']);
        // var_dump($form);die;

        if ($this->request->isPost()) {
            $data = $this->request->getPost();
            $email = $this->request->getPost('mail_Users', 'email');
            // var_dump($email);die;
            $user = Users::findFirstByMail_Users($email);
            if (!$user) {
                $this->flash->error("User does not exist");
            }
            if (!$form->isValid($_POST)) {
                $messages = $form->getMessages();

                foreach ($messages as $message) {
                    echo $message, '<br>';
                }
            }
            $roles = Roles::findFirstById_Role($user->id_Role);
            // var_dump($roles->nom_Role);die;
        }
        $this->view->role = $roles->nom_Role;
        $this->view->user = $user;
        $this->view->form = $form;
    }
}
