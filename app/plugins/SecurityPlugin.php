<?php

use Phalcon\Acl;
use Phalcon\Acl\Role;
use Phalcon\Acl\Resource;
use Phalcon\Events\Event;
use Phalcon\Mvc\User\Plugin;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Acl\Adapter\Memory as AclList;
use Phalcon\Di\Injectable;
use Phalcon\Mvc\Controller;

/**
* SecurityPlugin
*
* This is the security plugin which controls that users only have access to the modules they're assigned to
*/
class SecurityPlugin extends Plugin
{
	/**
	* Returns an existing or new access control list
	*
	* @returns AclList
	*/
	public function getAcl()
	{
		// if (!isset($this->persistent->acl)) { ATTENTION A REMETTRE LORSQUE LE PLUGIN SERA FINALISE

			$acl = new AclList();

			$acl->setDefaultAction(Acl::DENY);

			// Register roles
			$roles = [
				'superadmin'  => new Role(
					'Super admin',
					'Gérant du site et des administrateurs.'
				),
				'admin'  => new Role(
					'Admin',
					'Administrateur du site.'
				),
				'users'  => new Role(
					'Users',
					'Personnes enregistrées.'
				),
				'guests' => new Role(
					'Guests',
					'Tout personne non enregistrée est considérée comme un visiteur.'
					)
				];

				foreach ($roles as $role) {
					$acl->addRole($role);
				}

				//Ressources pour administrateurs
				$privateResources = [
					'admin'        => ['index','users','products','school'],
					'users'		   => ['index','delete', 'edit','save','search'],
					'products'     => ['index','delete', 'edit','save','search'],
					'school'	   => ['index'],
					'services'     => ['index'],
					'pages'        => ['index', 'loadTiny', 'savePage', 'addPage', 'delPage'],
					'informatique' => ['index'],
				];
				foreach ($privateResources as $resource => $actions) {
					$acl->addResource(new Resource($resource), $actions);
				}

				//Public area resources
				$publicResources = [
					'index'        => ['index'],
					'services'     => ['index'],
					'informatique' => ['index'],
					'products'     => ['index','addProduct'],
					'pages'        => ['displayPage'],
					'profile'      => ['index','informations'],
					'register'     => ['index'],
					'errors'       => ['show401', 'show404', 'show500'],
					'session'      => ['index', 'register', 'start', 'end']
				];

				foreach ($publicResources as $resource => $actions) {
					$acl->addResource(new Resource($resource), $actions);
				}

				//Grant access to public areas to both users and guests
				foreach ($roles as $role) {
					foreach ($publicResources as $resource => $actions) {
						foreach ($actions as $action){
							$acl->allow($role->getName(), $resource, $action);
						}
					}
				}

				//Grant access to private area to role Users
				foreach ($privateResources as $resource => $actions) {
					foreach ($actions as $action){
						$acl->allow('Users', $resource, $action);
					}
				}

				//The acl is stored in session, APC would be useful here too
				$this->persistent->acl = $acl;
			// }
		// var_dump($this->persistent->acl);die;
			return $this->persistent->acl;
		}

		/**
		* This action is executed before execute any action in the application
		*
		* @param Event $event
		* @param Dispatcher $dispatcher
		* @return bool
		*/
		public function beforeExecuteRoute(Event $event, Dispatcher $dispatcher)
		{
			$auth = $this->session->get('auth');
			if (!$auth){
				$role = 'Guests';
			} else {
				$role = 'Users';
			}

			$controller = $dispatcher->getControllerName();
			$action = $dispatcher->getActionName();

			$acl = $this->getAcl();
			//var_dump($acl);die();
			if (!$acl->isResource($controller)) {
				$dispatcher->forward([
					'controller' => 'errors',
					'action'     => 'show404'
				]);

				return false;
			}

			$allowed = $acl->isAllowed($role, $controller, $action);
			if (!$allowed) {
				$dispatcher->forward([
					'controller' => 'errors',
					'action'     => 'show401'
				]);
				// $this->session->destroy();
				return false;
			}
		}
	}
