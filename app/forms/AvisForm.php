<?php
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;



class AvisForm extends Form
{
	public function initialize($entity = null, $options = null){


		$this->add(new Hidden('id_Produit'));

		//la note 
		// $avis = new Text('note_Avis');
		// $avis->setLabel('Note');
		// $avis->setFilters(['int']);
		// $avis->addValidators([
		// 	new PresenceOf([
		// 		'message' => 'Note'
		// 	])
			
		// ]);
		// $this->add($avis);

		// Le commentaire

		$commentaire = new Text('commentaire_Avis');
		$commentaire->setLabel('Commentaire');
		$commentaire->setFilters('string');
		$commentaire->addValidators([
			new PresenceOf([
				'message' => 'commentaire'
			]),
		]);
		$this->add($commentaire);


	}
}