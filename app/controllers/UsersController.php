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
    * Shows all the users
    */
    public function indexAction()
    {

        $this->assets->addCss("css/global.css");

        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "Users", $this->request->getPost());
            $this->persistent->searchParams = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = [];
        if ($this->persistent->searchParams) {
            $parameters = $this->persistent->searchParams;
        }
        // var_dump($parameters);die;
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
    * Search articles based on current criteria like the ID
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
        if ($this->persistent->searchParams) {
            $parameters = $this->persistent->searchParams;
        }

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
            "limit" => 100,
            "page"  => $numberPage
        ]);

        $this->view->page = $paginator->getPaginate();
        $this->view->users = $users;
    }


    /**
    * Deletes an article
    *
    * @param string $id
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
    * Edits a article based on its id
    */
    public function editAction($id)
    {

        if (!$this->request->isPost()) {

            $user = Users::findFirstById_Users($id);
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
            // var_dump($this->view->form);die;
        }
    }

    /**
    * Saves current article
    *
    * @param string $id
    */
    // public function saveAction()
    // {
    //
    //
    //     $formResult = $this->request->getPost();
    //     $id =$formResult['id_Users'];
    //     if (!$this->request->isPost()) {
    //         return $this->dispatcher->forward(
    //             [
    //                 "controller" => "users",
    //                 "action"     => "index",
    //             ]
    //         );
    //     }
    //
    //     $user = Users::findFirstById_Users($id);
    //     if (!$user) {
    //         $this->flash->error("User does not exist");
    //
    //         return $this->dispatcher->forward(
    //             [
    //                 "controller" => "users",
    //                 "action"     => "index",
    //             ]
    //         );
    //     }
    //
    //     $form = new UsersForm;
    //
    //     $data = $this->request->getPost();
    //
    //     if (!$form->isValid($data, $user)) {
    //         foreach ($form->getMessages() as $message) {
    //             $this->flash->error($message);
    //         }
    //
    //         return $this->dispatcher->forward(
    //             [
    //                 "controller" => "users",
    //                 "action"     => "index",
    //             ]
    //         );
    //     }
    //     if ($user->save() == false) {
    //         foreach ($user->getMessages() as $message) {
    //             $this->flash->error($message);
    //         }
    //
    //         return $this->dispatcher->forward(
    //             [
    //                 "controller" => "usesr",
    //                 "action"     => "index",
    //             ]
    //         );
    //     }
    //
    //     $form->clear();
    //
    //     $this->flash->success("Article was updated successfully");
    //     var_dump($user);die;
    //     return $this->dispatcher->forward(
    //         [
    //             "controller" => "users",
    //             "action"     => "index",
    //         ]
    //     );
    // }
    /**
    * Saves current product in screen
    *
    * @param string $id
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
