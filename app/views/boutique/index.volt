<link rel="stylesheet" type="text/css" href="/espacefurcan/public/css/boutique.css">
<link rel="stylesheet" type="text/css" href="/espacefurcan/public/css/pagination.css">


<div class="row">
	<div class="col-lg-3 affinerRecherche">

<<<<<<< HEAD
		<div class="dropdown"><br>
			<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				Catégories
			</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
=======
		<!-- <nav aria-label="breadcrumb">
		<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">Accueil</a></li>
		<li class="breadcrumb-item"><a href="#">Boutique</a></li>
		<li class="breadcrumb-item active" aria-current="page">Data</li>
	</ol>
</nav> -->


<div class="buttonRefresh">
	<button type="button" class="btn btn-dark" onclick ="refresh()">Refresh</button>
</div>

<div class="form-group">
	<label for="SelectCat">Catégorie</label>
	<select class="form-control" onchange="filtre()" id="SelectCat">
		<option value="0" selected disabled hidden>Séléctionner une catégorie</option>
		{% for categorie in categories %}
>>>>>>> a38e1e871284285ca12a9adbae9ffc61133b9ef5

		<option value={{categorie.id_Categorie}}> {{ categorie.nom_Categorie }} </option>

<<<<<<< HEAD
				{{ link_to('boutique/cat/' ~ categorie.id_Categorie ,categorie.nom_Categorie) }}<br>
				
				{% endfor %}
			</div>
		</div><br><br>

		<div class="dropdown"><br>
			<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				marques
			</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

				{% for marque in marques %}

				{{ link_to('boutique/marque/' ~ marque.id_Marque ,marque.nom_Marque) }}<br>
				
				{% endfor %}
			</div>
		</div><br><br>
=======
		{% endfor %}
	</select>
</div>
<br><br>

<h5>Affiner vos recherches</h5><br>

<div class="form-group">
	<div class="form-group">
		<label for="SelectMarque">Marque</label>
		<select class="form-control" onchange="filtre()" id="SelectMarque">
			<option value="0" selected disabled hidden>Séléctionner une marque</option>
			{% for marque in marques %}
>>>>>>> a38e1e871284285ca12a9adbae9ffc61133b9ef5

			<option value={{marque.id_Marque}}> {{ marque.nom_Marque }} </option>

<<<<<<< HEAD
		<h5>Affiner vos recherches</h5><br>

		<div class="form-group">
			<label for="exampleSelect1">Prix</label>
			<select class="form-control" id="exampleSelect1">
				<option>Entre 0 et 99 € </option>
				<option>Entre 100 et 199 € </option>
				<option>Entre 200 et 299 € </option>
				<option>Entre 300 et 399 € </option>
				<option>Entre 400 et 499 € </option>
			</select>
		</div>

		<label for="customRange1">Prix</label>
		<input type="range" class="custom-range"  min="0" max="5" id="customRange1">


		
		


	</div>
	<div class="col-lg-9">
		<div class="row article">
			{% for produit in produits %}
			<!-- debut de col-lg-4 -->


			<div class="col-lg-4 produit">
				{{ link_to('boutique/produit/'  ~ produit.id_Produit,produit.nom_Produit) }}
				
				{{ image("image_Produit/" ~  produit.image_Produit)}}

<h5>
	<span>{{ produit.prix_Produit}} € </span>
</h5>
<div class="rating"><!--
   --><a href="#5" title="Donner 5 étoiles">☆</a><!--
   --><a href="#4" title="Donner 4 étoiles">☆</a><!--
   --><a href="#3" title="Donner 3 étoiles">☆</a><!--
   --><a href="#2" title="Donner 2 étoiles">☆</a><!--
--><a href="#1" title="Donner 1 étoile">☆</a>
</div>

<p class="card-text descriLimit">{{ produit.descri_Produit}}</p>


<!-- Button trigger modal -->
<img class="img-fluid mr-sm-5" id="loupe" src="../image_produit/loupe-50x50.jpg"  alt="oeil" class= "" data-toggle= "modal" data-target= "#exampleModalLong-{{ produit.id_Produit}}" >
<button type="button" class="btn btn-success"> Ajouter au panier </button>
</a>

<!-- Modal --> 
<div class= "modal fade" id= "exampleModalLong-{{ produit.id_Produit}}" tabindex= "-1" role= "dialog" aria-labelledby= "exampleModalLongTitle" aria-hidden= "true" > 
	<div class= "modal-dialog" role= "document" > 
		<div class= "modal-content" > 
			<div class= "modal-header" > 
				<h5 class= "modal-title" id= "exampleModalLongTitle" > {{produit.nom_Produit}} </h5> 
				<button type= "button" class= "close" data-dismiss= "modal" aria-label= "Close" > 
					<span aria-hidden= "true" > &times; </span> 
				</button> 
			</div> 
			<div class= "modal-body" > {{ produit.descri_Produit}} 
			</div> 
			<div class= "modal-footer" > 
				<h3> Prix : {{produit.prix_Produit}} € </h3>
				<button type= "button" class= "btn btn-danger" data-dismiss= "modal" > Fermer 
				</button> 
				<button type= "button" class= "btn btn-primary" > Ajouter au panier 
				</button> 
			</div> 
		</div>
	</div> 
</div> 

</div>

{% endfor %}

</div>
</div>


</div><br><br><!-- fin de la div container -->





<script src="../public/js/jquery.min.js"></script>
<script src="../public/js/boutique.js"></script>
=======
			{% endfor %}
		</select>
	</div>
>>>>>>> a38e1e871284285ca12a9adbae9ffc61133b9ef5

	<label for="customRange1">Prix</label>
	<input type="range" class="custom-range"  min="0" max="5" id="customRange1">
</div>
</div>
	<div class="data-container col-lg-9" ></div>
	<div class="row_article"></div>


</div><br><br><!-- fin de la div container -->

<script src="../public/js/jquery.min.js"></script>
<script src="http://pagination.js.org/dist/2.1.4/pagination.min.js"></script>
<script src="../public/js/boutique.js"></script>
