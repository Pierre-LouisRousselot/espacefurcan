<link rel="stylesheet" type="text/css" href="/espacefurcan/public/css/boutique.css">







<div class="row article textWhite">
	<div class="col-lg-4 produit imageProduit">
		{{ image("image_produit/" ~  produit.image_Produit)}}
	</div>
	<div class="col-lg-4">
		<h2>{{ produit.nom_Produit}}</h2>
		<p class="card-text descriLimit">{{ produit.descri_Produit}}</p>
		
		<h3 style="color:red">Caractéristique du produit</h3>
		{% for index, detailProduit in detailProduit %}
		{% if index === 'id_Produit' %}
		{% continue %}
		{% endif %}
		<ul class="list-group">
			<li class="list-group-item"><h5 style="color:blue">{{ index}} : <span style="color:green;">{{ detailProduit }}</span></h5></li>
		</ul>
		{% endfor %}



	</div>
	<div class="col-lg-4 produitDroite">

		<h1 style="color:green;font-size:4rem;margin:50px;">{{ produit.prix_Produit}} € </h1><br>
		<div>
			<button type="button" class="btn btn-success btn-lg">Ajouter au panier </button>
			<button type="button" class="btn btn-danger btn-lg">Supprimer du panier</button>
		</div>
		{{ image("image_produit/visa.png")}}
		{{ image("image_produit/Vpay.png")}}
		{{ image("image_produit/MasterCard.png")}}
		{{ image("image_produit/Maestro.png")}}

	</div>

</div>




</div>

<!-- Gestion des Avis et des commentaires -->


<div class="row shadow p-3 mb-5 bg-white rounded">
	<div class="col-lg-3">
		<h5> {{ nom_User.nom_Users }} </h5>
		<h5>Posté le {{ avis.date_Avis }}</h5>
		<p>Note obtenue  {{ avis.note_Avis }} / 10 </p>
		
	</div>
	<div class="col-lg-6" style="text-align:center;">
		<p> {{ avis.commentaire_Avis }}</p>
	</div>
	<div class="col-lg-3">
	<div class="rating"><!--
   --><a href="#5" title="Donner 5 étoiles">☆</a><!--
   --><a href="#4" title="Donner 4 étoiles">☆</a><!--
   --><a href="#3" title="Donner 3 étoiles">☆</a><!--
   --><a href="#2" title="Donner 2 étoiles">☆</a><!--
--><a href="#1" title="Donner 1 étoile">☆</a>
</div>
</div>

</div>

<!--  fin de gestion Avis et commentaire -->







<br><br><!-- fin de la div container -->






