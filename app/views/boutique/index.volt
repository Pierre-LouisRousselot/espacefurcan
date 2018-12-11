<link rel="stylesheet" type="text/css" href="/espacefurcan/public/css/boutique.css">


<div class="row">

	<div class="col-lg-3 centrer">

		<!-- <nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Accueil</a></li>
				<li class="breadcrumb-item"><a href="#">Boutique</a></li>
				<li class="breadcrumb-item active" aria-current="page">Data</li>
			</ol>
		</nav> -->

		<label for="">Categories</label>
		<input type="text" name="pseudo" id="search">

		<div class="dropdown"><br>
			<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<h6>Catégories</h6>
			</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

				

				{% for categorie in categories %}

				<a class="dropdown-item" id="categorieFilter" href="#"><span>{{ categorie.nom_Categorie }}</span></a>


				{% endfor %}
				console.log(categories);
			</div>

			
		</div><br><br>

		<h5>Affiner vos recherches</h5><br>

	</div>
	<div class="col-lg-9">
		<div class="row article textWhite">

			<!-- boucle for pour afficher tous les produits -->
			{% for produit in page.items %}
			<!-- debut de col-lg-4 -->
			<div class="col-lg-4 produit">
				<!-- <div class="card-deck"> -->

					<h3>{{ produit.nom_Produit}}</h3>
					{{ image(produit.image_Produit)}}
					<h5><span>{{ produit.prix_Produit}} € </span></h5>
					<p class="card-text descriLimit">{{ produit.descri_Produit}}</p>
					

					<!-- Button trigger modal --><img class="img-fluid mr-sm-5" id="loupe" src="../image_produit/loupe-50x50.jpg"  alt="oeil" class= "" data-toggle= "modal" data-target= "#exampleModalLong-{{ produit.id_Produit}}" > <button type="button" class="btn btn-success"> Ajouter au panier </button><!-- Modal --> <div class= "modal fade" id= "exampleModalLong-{{ produit.id_Produit}}" tabindex= "-1" role= "dialog" aria-labelledby= "exampleModalLongTitle" aria-hidden= "true" > <div class= "modal-dialog" role= "document" > <div class= "modal-content" > <div class= "modal-header" > <h5 class= "modal-title" id= "exampleModalLongTitle" > {{produit.nom_Produit}} </h5> <button type= "button" class= "close" data-dismiss= "modal" aria-label= "Close" > <span aria-hidden= "true" > &times; </span> </button> </div> <div class= "modal-body" > {{ produit.descri_Produit}} </div> <div class= "modal-footer" > <h3> Prix : {{produit.prix_Produit}} € </h3><button type= "button" class= "btn btn-danger" data-dismiss= "modal" > Fermer </button> <button type= "button" class= "btn btn-primary" > Ajouter au panier </button> </div> </div> </div> </div> 

				</div>
				<!-- 	</div> -->	
				{% endfor %}
			</div>
		</div>

		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item disabled">
					{{ link_to("boutique/index?page=" ~ page.before,' Précédente', "class": "btn btn-success") }}
				</li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item">
					{{ link_to("boutique/index?page=" ~ page.next,' Suivant', "class": "btn btn-success") }}
				</li>
			</ul>
		</nav>

	</div><br><br><!-- fin de la div container -->





