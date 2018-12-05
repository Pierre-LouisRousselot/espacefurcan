<?php

use Phalcon\Mvc\User\Component;

/**
* Elements
*
* Helps to build UI elements for the application
*/
class Elements extends Component
{
    private $_headerMenu = [
        'navbar-left' => [
            'index' => [
                'caption' => 'Accueil',
                'action' => 'index'
            ],
            'pages' => [
                'caption' => 'Gestion des pages',
                'action' => 'index'
            ],
            'services' => [
                'caption' => 'Services',
                'action' => 'index',
                'drop' => 1
            ],
            'informatique' => [
                'caption' => 'Informatique',
                'action' => 'index',
                'drop' => 2
            ],
            'formations' => [
                'caption' => 'Formations',
                'action' => 'index'
            ],
            'boutique' => [
                'caption' => 'Boutique',
                'action' => 'index'
            ],
            'about' => [
                'caption' => 'A propos',
                'action' => 'index'
            ],
            'contact' => [
                'caption' => 'Nous contacter',
                'action' => 'index'
            ],
        ],
        'navbar-right' => [
            'session' => [
                'caption' => 'Se connecter / S\'inscrire',
                'action' => 'index'
            ],
            'admin' => [
                'caption' => 'Administration',
                'action' => 'index'
            ],
            'profile' => [
                'caption' => 'Mon Profil',
                'action' => 'index',
            ]
        ]
    ];

    private $_tabs = [
        'Produits' => [
            'controller' => 'products',
            'action' => 'index',
            'any' => true
        ],
        'Caractéristiques' => [
            'controller' => 'caracteristiques',
            'action' => 'index',
            'any' => true
        ],
        'Utilisateurs' => [
            'controller' => 'users',
            'action' => 'index',
            'any' => true
        ],
    ];

    public function getDrop(){
        return $this->_drop;
    }

    public function setDrop($drop){
        $this->_drop = $drop;
    }

    /**
    * Builds header menu with left and right items
    *
    * @return string
    */
    public function getMenu()
    {

        $auth = $this->session->get('auth');
        if ($auth) {
            $this->_headerMenu['navbar-right']['session'] = [
                'caption' => 'Se déconnecter',
                'action' => 'end'
            ];

        } else {
            unset($this->_headerMenu['navbar-right']['profile']);
            unset($this->_headerMenu['navbar-right']['admin']);
            unset($this->_headerMenu['navbar-left']['pages']);
        }

        $controllerName = $this->view->getControllerName();
        foreach ($this->_headerMenu as $position => $menu) {
            echo '<div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">';
            echo '<ul class="navbar-nav pull-right', $position, '">';
            foreach ($menu as $controller => $option) {
                if (isset($option['drop'])){
                    echo '<li class="nav-item dropdown">';
                    echo '<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'.$option['caption'].' </a>';


                    $drop = Pages::find([
                        "conditions" => "id_CatePage =" .$option['drop']
                    ]);

                    echo '<div class="dropdown-menu" aria-labelledby="navbarDropdown">';
                    foreach ($drop as $key => $value) {
                        echo '<a class="dropdown-item" href="#">';
                        echo $this->tag->linkTo(['pages/displayPage/'. $value->id_Page, $value->titre_Page, "class" => "dropdown-item"]);
                        echo '</a>';

                    }echo '</div>';
                }else{
                    if ($controllerName == $controller) {
                        echo '<li class="nav-item active onglet">';
                    } else {
                        echo '<li class="nav-item onglet">';
                    }
                }
                if (!isset($option['drop'])){
                    echo $this->tag->linkTo([$controller . '/' . $option['action'], $option['caption'], "class" => "nav-link"]);
                }
                echo '</li>';
            }

            echo '</ul>';
        }
    }


}
