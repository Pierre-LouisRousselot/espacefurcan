<link rel="stylesheet" type="text/css" href="/espacefurcan/public/css/boutique.css">


<div class="row">
	<div class="col-lg-3 affinerRecherche">

		<div class="dropdown"><br>
			<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				Catégories
			</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

				{% for categorie in categories %}

				{{ link_to('boutique/cat/' ~ categorie.id_Categorie ,categorie.nom_Categorie) }}<br>
				
				{% endfor %}
			</div>
		</div>


		<div class="dropdown"><br>
			<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				marques
			</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

				{% for marque in marques %}

				{{ link_to('boutique/marque/' ~ marque.id_Marque ,marque.nom_Marque) }}<br>
				
				{% endfor %}
			</div>
		</div>

		





	</div>
	<div class="col-lg-9">
		<div class="row article">

			<!-- boucle for pour afficher tous les produits -->
			{% for produit in produits %}
			<!-- debut de col-lg-4 -->
			<div class="col-lg-4 produit">
				<!-- <div class="card-deck"> -->

					<h3>{{ produit.nom_Produit}}</h3>
					{{ image("public/image_Produit/" ~ produit.image_Produit)}}
					<h5><span>{{ produit.prix_Produit}} € </span></h5>
					<p class="card-text descriLimit">{{ produit.descri_Produit}}</p>
					

					<!-- Button trigger modal --><img class="img-fluid mr-sm-5" id="loupe" src="../image_produit/loupe-50x50.jpg"  alt="oeil" class= "" data-toggle= "modal" data-target= "#exampleModalLong-{{ produit.id_Produit}}" > <button type="button" class="btn btn-success"> Ajouter au panier </button><!-- Modal --> <div class= "modal fade" id= "exampleModalLong-{{ produit.id_Produit}}" tabindex= "-1" role= "dialog" aria-labelledby= "exampleModalLongTitle" aria-hidden= "true" > <div class= "modal-dialog" role= "document" > <div class= "modal-content" > <div class= "modal-header" > <h5 class= "modal-title" id= "exampleModalLongTitle" > {{produit.nom_Produit}} </h5> <button type= "button" class= "close" data-dismiss= "modal" aria-label= "Close" > <span aria-hidden= "true" > &times; </span> </button> </div> <div class= "modal-body" > {{ produit.descri_Produit}} </div> <div class= "modal-footer" > <h3> Prix : {{produit.prix_Produit}} € </h3><button type= "button" class= "btn btn-danger" data-dismiss= "modal" > Fermer </button> <button type= "button" class= "btn btn-primary" > Ajouter au panier </button> </div> </div> </div> </div> 

				</div>
				<!-- 	</div> -->	
				{% endfor %}
			</div>
		</div>


	</div><br><br><!-- fin de la div container -->





