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
            'articles' => [
                'caption' => 'Gestion des pages',
                'action' => 'index'
            ],
            'services' => [
                'caption' => 'Services',
                'action' => 'index'
            ],
            'informatique' => [
                'caption' => 'Informatique',
                'action' => 'index'
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
            'profile' => [
                'caption' => 'Mon Profil',
                'action' => 'index',
            ]
        ]
    ];

    private $_tabs = [
        'Invoices' => [
            'controller' => 'invoices',
            'action' => 'index',
            'any' => false
        ],
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
            unset($this->_headerMenu['navbar-left']['articles']);
        }

        $controllerName = $this->view->getControllerName();
        foreach ($this->_headerMenu as $position => $menu) {
            echo '<div class="nav-collapse">';
            echo '<ul class="nav navbar-nav ', $position, '">';
            foreach ($menu as $controller => $option) {
                if ($controllerName == $controller) {
                    echo '<li class="active">';
                } else {
                    echo '<li>';
                }
                echo $this->tag->linkTo($controller . '/' . $option['action'], $option['caption']);
                echo '</li>';
            }

            echo '</ul>';
            echo '</div>';
        }

    }

    public function getUser()
    {
        $auth = $this->session->get('auth');
        if ($auth) {

            echo '<h2> Widget News Admin</h2>';
            echo 'You are logged in as ' . $auth['name'].'.';
            echo ' ';
            echo '<a href="../session/end" >Log out</a>';
            echo "<hr>";
        }
    }

    /**
    * Returns menu tabs
    */
    public function getTabs()
    {
        $controllerName = $this->view->getControllerName();
        $actionName = $this->view->getActionName();
        echo '<ul class="nav nav-tabs">';
        foreach ($this->_tabs as $caption => $option) {
            if ($option['controller'] == $controllerName && ($option['action'] == $actionName || $option['any'])) {
                echo '<li class="active">';
            } else {
                echo '<li>';
            }
            echo $this->tag->linkTo($option['controller'] . '/' . $option['action'], $caption), '</li>';
        }
        echo '</ul>';
    }
}
