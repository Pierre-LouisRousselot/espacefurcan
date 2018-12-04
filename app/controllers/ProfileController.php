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
            $image_path = 'public/img-status';
            if ($this->request->hasFiles()) {
                $files = $this->request->getUploadedFiles();

                foreach ($files as $file) {
                    // Move the file into the application
                    $file->moveTo('../public/img-status/' . $file->getName());
                    var_dump($file);
                }
            }

            // var_dump($this->request->getUploadedFiles());
            // var_dump($file);die;

            $user->nom_Users = $name;
            $user->mail_Users = $email;
            $user->prenom_Users = $prenom;
            $user->tel_Users = $tel;
            $user->adresse_Users = $adresse;
            $user->ville_Users = $ville;
            $user->postal_Users = $postal;

            var_dump($user->password_Users);
            // var_dump(sha1('testtest'));die;

            if ( sha1($password) != $user->password_Users ){
                var_dump('mauvais mot de passe actuel');
                $this->flash->error('Mauvais mot de passe');
                return false;
            }
            if ($repeatPassword != $repeatNewPassword) {
                var_dump($repeatPassword . 'champ nouveau mot de passe');
                var_dump($repeatNewPassword. 'champ répété nouveau mot de passe');
                var_dump('Les mots de passes sont différents');
                $this->flash->error('Les mots de passe sont différents');
                return false;
            }
            if ($repeatPassword == $repeatNewPassword && sha1($password) == $user->password_Users) {
                var_dump('Mot de passe changé');
                $user->password_Users = sha1($repeatPassword);
            }

            if ($user->save() == false) {
                var_dump($name);
                var_dump($user->getMessages());
                foreach ($user->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
                $this->tag->setDefault('password', null);
                $this->tag->setDefault('newPassword', null);
                $this->tag->setDefault('repeatNewPassword', null);
                $this->flash->success('Your profile information was updated successfully');
            }
        }
    }
    public function uploadAction()
    {
        if ($this->request->hasFiles() == true) {
            // $fi = new finfo(FILEINFO_MIME, '/usr/share/misc/file/magic');
            foreach ($this->request->getUploadedFiles() as $file) {
                echo 'Mime = ', $file->file($file->getTempName()), '<br>';
            }
        }
    }

}
