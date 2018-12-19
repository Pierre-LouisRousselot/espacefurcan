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
				'Super-Admin',
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

			$controllersRessources = [
				'index',
				'users',
				'admin',
				'products',
				'school',
				'pages',
				'profile',
				'errors',
				'session',
				'boutique',
				'register',
			];


			$superAdmin = [
				['index'],
				['index','delete', 'edit','save','search','deleteFile','display','validationStatut'],
				['index','users','products','school','right'],
				['index','delete', 'edit','save','search', 'deleteImageProduct','addProduct'],
				['index'],
				['displayPage','index', 'loadTiny', 'savePage', 'addPage', 'delPage', 'postAcceptor'],
				['index','informations','deleteFile','editFile'],
				['show401', 'show404', 'show500'],
				['index', 'register', 'start', 'end'],
				['index','showArticle'],
				['index','edit'],
			];
			$admin = [
				['index'],
				['index','delete', 'edit','save','search','deleteFile','display','validationStatut'],
				['index','users','products','school'],
				['index','delete', 'edit','save','search', 'deleteImageProduct','addProduct'],
				['index'],
				['displayPage','index', 'loadTiny', 'savePage', 'addPage', 'delPage', 'postAcceptor'],
				['index','informations','deleteFile','editFile'],
				['show401', 'show404', 'show500'],
				['index', 'register', 'start', 'end'],
				['index','showArticle'],
				['index','edit'],
			];
			$user = [
				['index'],
				[''],
				[''],
				[''],
				[''],
				['displayPage'],
				['index','informations','deleteFile','editFile'],
				['show401', 'show404', 'show500'],
				['index', 'register', 'start', 'end'],
				['index','showArticle'],
				['index'],
			];

			$guest = [
				['index'],
				[''],
				[''],
				[''],
				[''],
				['displayPage'],
				['index','informations','deleteFile','editFile'],
				['show401', 'show404', 'show500'],
				['index', 'register', 'start', 'end'],
				['index','showArticle'],
				['index'],
			];
			//Tableau de ressources pour les super admins
			$superAdminRessources = array_combine($controllersRessources,$superAdmin);

			//Tableau de ressources pour les admins
			$adminRessources = array_combine($controllersRessources,$admin);

			//Tableau de ressources pour les utilisateurs
			$userRessources = array_combine($controllersRessources,$user);

			//Tableau de ressources pour les invités
			$guestRessources = array_combine($controllersRessources,$guest);

			//Ajoute les ressources super administrateurs a l'acl
			foreach ($superAdminRessources as $resource => $actions) {
				$acl->addResource(new Resource($resource), $actions);
			}

			//Ajoute les ressources administrateurs a l'acl
			foreach ($adminRessources as $resource => $actions) {
				$acl->addResource(new Resource($resource), $actions);
			}

			//Ajoute les ressources utilisateurs a l'acl
			foreach ($userRessources as $resource => $actions) {
				$acl->addResource(new Resource($resource), $actions);
			}

			//Ajoute les ressources visiteur a l'acl
			foreach ($guestRessources as $resource => $actions) {
				$acl->addResource(new Resource($resource), $actions);
			}

			//Associe le niveau de rôle à son tableau de ressources
			foreach ($superAdminRessources as $resource => $actions) {
				foreach ($actions as $action){
					$acl->allow('Super-Admin', $resource, $action);
				}
			}

			//Associe le niveau de rôle à son tableau de ressources
			foreach ($adminRessources as $resource => $actions) {
				foreach ($actions as $action){
					$acl->allow('Admin', $resource, $action);
				}
			}

			foreach ($userRessources as $resource => $actions) {
				foreach ($actions as $action){
					$acl->allow('Users', $resource, $action);
				}
			}

			foreach ($guestRessources as $resource => $actions) {
				foreach ($actions as $action){
					$acl->allow('Guests', $resource, $action);
				}
			}

			//The acl is stored in session, APC would be useful here too
			$this->persistent->acl = $acl;
			// }

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
			// var_dump($auth['role']);die;

			if ($auth['role'] == "1" || !$auth){
				$role = 'Guests';
			}elseif ($auth['role'] == "2"){
				$role = 'Users';
			}elseif ($auth['role'] == "3"){
				$role = 'Admin';
			}elseif ($auth['role'] == "4"){
				$role = 'Super-Admin';
			}
			$controller = $dispatcher->getControllerName();
			$action = $dispatcher->getActionName();

			$acl = $this->getAcl();

			if (!$acl->isResource($controller)) {
				$dispatcher->forward([
					'controller' => 'errors',
					'action'     => 'show404'
				]);

				return false;
			}

			// var_dump($action);die;
			$allowed = $acl->isAllowed($role, $controller, $action);
			// var_dump($allowed);die;
			if (!$allowed) {
				// var_dump("tesy");die;
				$dispatcher->forward([
					'controller' => 'errors',
					'action'     => 'show401'
				]);
				// $this->session->destroy();
				return false;
			}
		}
	}
