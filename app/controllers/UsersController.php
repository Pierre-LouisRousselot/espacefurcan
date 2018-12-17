<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Mvc\Model\Manager;

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
        $users_validation = Users::find("validateStatut_Users = '0'");
        $this->view->users_validation = $users_validation;

        $users = Users::find();
        $this->view->users = $users;
        // $numberPage = 1;
        // if ($this->request->isPost()) {
        //     $query = Criteria::fromInput($this->di, "Users", $this->request->getPost());
        //     $this->persistent->searchParams = $query->getParams();
        // } else {
        //     $numberPage = $this->request->getQuery("page", "int");
        // }
        //
        // $parameters = [];
        //
        // $phql = 'SELECT Users.*, Roles.* FROM Users INNER JOIN Roles ON Roles.id_Role = Users.id_Role';
        //
        // $users = $this->modelsManager->executeQuery($phql);
        // // var_dump($users);die;
        // if (count($users) == 0) {
        //     $this->flash->notice("The search did not find any users");
        //
        //     return $this->dispatcher->forward(
        //         [
        //             "controller" => "users",
        //             "action"     => "index",
        //         ]
        //     );
        // }
        //
        // $paginator = new Paginator([
        //     "data"  => $users,
        //     "limit" => 100,
        //     "page"  => $numberPage
        // ]);
        // // var_dump($paginator);die;
        // $this->view->page = $paginator->getPaginate();
        // $this->view->users = $users;

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
            "limit" => 100,
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
            $this->flash->error("L'utilisateur n'a pas été trouvé");

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

        $this->flash->success("L'utilisateur a été correctement supprimé");

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
        $roles = Roles::find();
        $form = new UsersForm((object)['id_Users' => $id], ['edit' => true]);
        // var_dump($user['0']->users->nom_Users);die;
        if (!$this->request->isPost()) {

            $phql = 'SELECT Users.*, Roles.nom_Role, Statuts.type_Statut
            FROM Users
            INNER JOIN Roles ON Roles.id_Role = Users.id_Role
            INNER JOIN Statuts ON Statuts.id_Statut = Users.id_Statut
            WHERE id_Users=' . $id;
            $users = $this->modelsManager->executeQuery($phql);
            //La requete renvoie un tableau d'user
            $user = $users['0']->users;
            $role_statuts = $users['0'];
            // var_dump($user['0']->nom_Role);die;
            $this->tag->setDefault('nom_Users', $user->nom_Users);
            $this->tag->setDefault('prenom_Users', $user->prenom_Users);
            $this->tag->setDefault('mail_Users', $user->mail_Users);
            $this->tag->setDefault('tel_Users', $user->tel_Users);
            $this->tag->setDefault('adresse_Users', $user->adresse_Users);
            $this->tag->setDefault('ville_Users', $user->ville_Users);
            $this->tag->setDefault('postal_Users', $user->postal_Users);
            $this->tag->setDefault('file_Users', $user->file_Users);
            $this->tag->setDefault('id_Role', $user->id_Role);
            $this->tag->setDefault('id_Statut',  $user->id_Statut);

            // var_dump($this->tag->setDefault('nom_Role', $role_statuts->nom_Role));die;

            if (!$user) {
                $this->flash->error("L'utilisateur n'a pas été trouvé");

                return $this->dispatcher->forward(
                    [
                        "controller" => "users",
                        "action"     => "index",
                    ]
                );
            }
            $this->view->roles = $roles;
            $this->view->role = $role_statuts;
            $this->view->user = $user;
            // var_dump($user);die;


            $this->view->form = $form;
        }
    }

    /**
    * save the profile previously edited
    */
    public function saveAction()
    {
        // var_dump($_POST);die;
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
        $phql = 'SELECT Users.*, Roles.nom_Role, Statuts.type_Statut FROM Users INNER JOIN Roles ON Roles.id_Role = Users.id_Role INNER JOIN Statuts ON Statuts.id_Statut = Users.id_Statut  WHERE id_Users=' . $id;
        $users = $this->modelsManager->executeQuery($phql);
        //La requete renvoie un tableau d'user
        $user = $users['0']->users;
        $role_statuts = $users['0'];
        $this->view->role = $role_statuts;
        $this->view->user = $user;

        if (!$user) {
            $this->flash->error("L'utilisateur n'existe pas");

            return $this->dispatcher->forward(
                [
                    "controller" => "users",
                    "action"     => "index",
                ]
            );
        }

        // $form = new UsersForm;
        $form = new UsersForm((object)['id_Users' => $id], ['edit' => true]);
        $this->view->form = $form;
        $data = $this->request->getPost();
        $file = $this->request->getUploadedFiles();
        // $timestamp = time();
        $image_path = '../public/img-status/' . $user->nom_Users . '/';
        if (!is_dir($image_path)){
            mkdir($image_path);
            if ($this->request->hasFiles()) {
                // var_dump("test");die;
                $files = $this->request->getUploadedFiles();
                foreach ($files as $file) {
                    // Move the file into the application
                    $file->moveTo($image_path . $file->getName());
                    $user->file_Users = $file->getName();
                }
            }
        }else{
            if ($this->request->hasFiles()) {
                $files = $this->request->getUploadedFiles();

                foreach ($files as $file) {
                    $file->moveTo($image_path . $file->getName());
                    $user->file_Users = $file->getName();
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

        $this->flash->success("L'utilisateur a été mis à jour correctement");
        // var_dump($user);die;
        return $this->dispatcher->forward(
            [
                "controller" => "users",
                "action"     => "edit",
                "params"     => [$id]
            ]
        );
    }

    public function displayAction(){
        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "Users", $this->request->getPost());
            $this->persistent->searchParams = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = [];

        $phql = 'SELECT Users.*, Roles.* FROM Users INNER JOIN Roles ON Roles.id_Role = Users.id_Role';

        $users = $this->modelsManager->executeQuery($phql);
        // var_dump($users);die;
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
        // var_dump($paginator);die;
        $this->view->page = $paginator->getPaginate();
        $this->view->users = $users;
    }

    public function validationStatutAction(){
        $statuts = Statuts::find();
        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "Users", $this->request->getPost());
            $this->persistent->searchParams = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = [];

        $users = Users::find("validateStatut_Users = '0'");
        if (count($users) == 0) {
            $this->flash->notice("Le status de tous vos utilisateurs est validé");

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
        // var_dump($paginator);die;
        $this->view->page = $paginator->getPaginate();
        $this->view->users = $users;
        $this->view->statuts = $statuts;
        foreach($users as $user){
            $this->tag->setDefault('statut',  '10');
        }


        if ($this->request->isPost()) {
            $id = $this->request->getPost("id_Users");
            $statut = $this->request->getPost("statut");
            $user = Users::findFirstById_Users($id);
            $user->id_Statut = $statut;
            $user->validateStatut_Users = '1';
            $user->save();

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
            }else{
                $this->flash->success("Le statut de l'utilisateur a bien été mis à jour");
            }


        }
    }

}
