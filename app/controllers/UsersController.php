<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

class UsersController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Manage your users');
        parent::initialize();
    }

    /**
    * [indexAction Show all the users from the database]
    */
    public function indexAction()
    {

        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "Users", $this->request->getPost());
            $this->persistent->searchParams = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = [];

        $users = Users::find($parameters);
        if (count($users) == 0) {
            $this->flash->notice("The search did not find any users");

            return $this->dispatcher->forward(
                [
                    "controller" => "users",
                    "action"     => "index",
                ]
            );
        }

        $paginator = new Paginator([
            "data"  => $users,
            "limit" => 10,
            "page"  => $numberPage
        ]);

        $this->view->page = $paginator->getPaginate();
        $this->view->users = $users;

    }

    /**
    * [searchAction display page with 10 users]
    */
    public function searchAction()
    {

        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "users", $this->request->getPost());
            $this->persistent->searchParams = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = [];

        $users = Users::find($parameters);
        if (count($users) == 0) {
            $this->flash->notice("The search did not find any users");

            return $this->dispatcher->forward(
                [
                    "controller" => "users",
                    "action"     => "index",
                ]
            );
        }

        $paginator = new Paginator([
            "data"  => $users,
            "limit" => 10,
            "page"  => $numberPage
        ]);

        $this->view->page = $paginator->getPaginate();
        $this->view->users = $users;
    }

    /**
    * [deleteAction delete an user with his ID]
    * @param  int $id id_Users
    */
    public function deleteAction($id)
    {
        $users = Users::findFirstById_Users($id);
        if (!$users) {
            $this->flash->error("User was not found");

            return $this->dispatcher->forward(
                [
                    "controller" => "users",
                    "action"     => "index",
                ]
            );
        }

        if (!$users->delete()) {
            foreach ($users->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(
                [
                    "controller" => "users",
                    "action"     => "search",
                ]
            );
        }

        $this->flash->success("User was deleted");

        return $this->dispatcher->forward(
            [
                "controller" => "users",
                "action"     => "index",
            ]
        );
    }

    /**
    * display form to edit user
    * @param  int $id id_Users
    */
    public function editAction($id)
    {

        if (!$this->request->isPost()) {

            $user = Users::findFirstById_Users($id);
            $this->tag->setDefault('nom_Users', $user->nom_Users);
            $this->tag->setDefault('prenom_Users', $user->prenom_Users);
            $this->tag->setDefault('mail_Users', $user->mail_Users);
            $this->tag->setDefault('tel_Users', $user->tel_Users);
            $this->tag->setDefault('adresse_Users', $user->adresse_Users);
            $this->tag->setDefault('ville_Users', $user->ville_Users);
            $this->tag->setDefault('postal_Users', $user->postal_Users);
            $this->tag->setDefault('file_Users', $user->file_Users);
            if (!$user) {
                $this->flash->error("Article was not found");

                return $this->dispatcher->forward(
                    [
                        "controller" => "articles",
                        "action"     => "index",
                    ]
                );
            }
            $this->view->user = $user;
            $form = new UsersForm((object)['id_Users' => $id]);
            $this->view->form = $form;
        }
    }

    /**
    * save the profile previously edited
    */
    public function saveAction()
    {
        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(
                [
                    "controller" => "users",
                    "action"     => "index",
                ]
            );
        }

        $id = $this->request->getPost("id_Users");
        // var_dump($id);die;
        // var_dump($this->request->getPost());die;

        $user = Users::findFirstById_Users($id);
        $this->view->user = $user;

        if (!$user) {
            $this->flash->error("User does not exist");

            return $this->dispatcher->forward(
                [
                    "controller" => "users",
                    "action"     => "index",
                ]
            );
        }

        $form = new UsersForm;
        $this->view->form = $form;
        $data = $this->request->getPost();
        $file = $this->request->getUploadedFiles();
        $image_path = '../public/img-status/' . $user->nom_Users . '/';
        $user->file_Users = $image_path;

        if (!is_dir($image_path)){
            mkdir($image_path);
            if ($this->request->hasFiles()) {
                // var_dump("test");die;
                $files = $this->request->getUploadedFiles();
                foreach ($files as $file) {
                    // Move the file into the application
                    $file->moveTo($image_path . $file->getName());
                }
            }
        }else{
            if ($this->request->hasFiles()) {
                $files = $this->request->getUploadedFiles();

                foreach ($files as $file) {
                    $file->moveTo($image_path . $file->getName());
                }
            }
        }


        if (!$form->isValid($data, $user)) {
            foreach ($form->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(
                [
                    "controller" => "users",
                    "action"     => "edit",
                    "params"     => [$id]
                ]
            );
        }
        if ($user->save() == false) {
            foreach ($user->getMessages() as $message) {


                $this->flash->error($message);
            }

            return $this->dispatcher->forward(
                [
                    "controller" => "users",
                    "action"     => "edit",
                    "params"     => [$id]
                ]
            );
        }

        $form->clear();

        $this->flash->success("User was updated successfully");

        return $this->dispatcher->forward(
            [
                "controller" => "users",
                "action"     => "index",
            ]
        );
    }

}
