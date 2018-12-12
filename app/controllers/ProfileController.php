<?php
use Phalcon\Http\Request\File;

class ProfileController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Bienvenue');
        parent::initialize();
    }

    public function indexAction()
    {
    }

    public function informationsAction(){
        //Get session info
        $auth = $this->session->get('auth');

        //Query the active user
        $user = Users::findFirst($auth['id']);
        // var_dump($user);die;
        $form = new UsersForm((object)
        ['id_Users' => $auth['id']],
        ['profile' => true]);
        // var_dump($form);die;

        $this->view->form = $form;
        // var_dump($form);die();
        if ($user == false) {
            return $this->dispatcher->forward(
                [
                    "controller" => "index",
                    "action"     => "index",
                ]
            );
        }
        //pour preremplir les champs
        if (!$this->request->isPost()) {
            $this->tag->setDefault('name', $user->nom_Users);
            $this->tag->setDefault('email', $user->mail_Users);
            $this->tag->setDefault('prenom', $user->prenom_Users);
            $this->tag->setDefault('tel', $user->tel_Users);
            $this->tag->setDefault('adresse', $user->adresse_Users);
            $this->tag->setDefault('ville', $user->ville_Users);
            $this->tag->setDefault('postal', $user->postal_Users);
        } else {

            $name = $this->request->getPost('name', ['string', 'striptags']);
            $email = $this->request->getPost('email', 'email');
            $prenom = $this->request->getPost('prenom', ['string', 'striptags']);
            $tel = $this->request->getPost('tel', ['int', 'string']);
            $adresse = $this->request->getPost('adresse', ['string', 'striptags']);
            $ville = $this->request->getPost('ville', ['string', 'striptags']);
            $postal = $this->request->getPost('postal', ['string', 'striptags']);
            $password = $this->request->getPost('password', ['string', 'striptags']);
            $repeatPassword = $this->request->getPost('newPassword', ['string', 'striptags']);
            $repeatNewPassword = $this->request->getPost('repeatNewPassword', ['string', 'striptags']);
            $image_path = '../public/img-status/' . $user->nom_Users . '/';
            $files = $this->request->getUploadedFiles();

            if ($password != NULL){

                if (file_exists($image_path) == false ){
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
                }else {
                    if ($this->request->hasFiles()) {
                        $files = $this->request->getUploadedFiles();

                        foreach ($files as $file) {
                            $file->moveTo($image_path . $file->getName());
                            $user->file_Users = $file->getName();
                        }
                    }
                }
            }
            // var_dump($user->file_Users);die;


            // if($user->file_Users == ''){
            //     $user->file_Users = " ";
            // }else{
            //
            // }

            $user->nom_Users = $name;
            $user->mail_Users = $email;
            $user->prenom_Users = $prenom;
            $user->tel_Users = $tel;
            $user->adresse_Users = $adresse;
            $user->ville_Users = $ville;
            $user->postal_Users = $postal;


            $data = $this->request->getPost();
            if (!$form->isValid($data, $user)) {
                var_dump($email);
                foreach ($form->getMessages() as $message) {
                    $this->flash->error($message);
                }

            }else if($user->save() == false ){
                var_dump($name);
                var_dump($user->getMessages());
                foreach ($user->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }

            } else if($user->save() == true ) {
                $this->tag->setDefault('password', null);
                $this->tag->setDefault('newPassword', null);
                $this->tag->setDefault('repeatNewPassword', null);
                $this->flash->success('Your profile information was updated successfully');
            }






        }

        $this->view->form = $form;
        $this->view->user = $user;
    }

    public function deleteFileAction($file){
        //Get session info
        $auth = $this->session->get('auth');

        //Query the active user
        $user = Users::findFirst($auth['id']);
        $image_path = '../public/img-status/' . $user->nom_Users . '/';
        $user->file_Users = NULL;
        $user->update();
        unlink($image_path . $file);

        return $this->dispatcher->forward(
            [
                "controller" => "profile",
                "action"     => "informations",
            ]
        );
    }



}
