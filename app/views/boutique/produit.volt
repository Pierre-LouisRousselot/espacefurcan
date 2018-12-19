<link rel="stylesheet" type="text/css" href="/espacefurcan/public/css/boutique.css">





<div class="jumbotron jumbotron-fluid">
	<div class="container">
		<h1 class="display-5">Description du produit</h1>
	</div>
</div>

<div class="row article textWhite">
	<div class="col-lg-4 produit imageProduit">
		{{ image("image_Produit/" ~  produit.image_Produit)}}
	</div>
	<div class="col-lg-4">
		<h2>{{ produit.nom_Produit}}</h2>
		<p class="card-text descriLimit">{{ produit.descri_Produit}}</p>
		
		<h3 style="color:red">Caractéristique du produit</h3>
		{% for index, detailProduit in detailProduit %}
		{% if index === 'id_Produit' %}
		{% continue %}
		{% endif %}
		<h3 style="color:blue">{{ index}}</h3><br>
		<h5 style="color:green">{{ detailProduit }}</h5><br>

		{% endfor %}



	</div>
	<div class="col-lg-4 produitDroite">
		
		<h1 style="color:green;font-size:4rem;margin:50px;">{{ produit.prix_Produit}} € </h1><br>
		<div>
			<button type="button" class="btn btn-success btn-lg">Ajouter au panier </button>
			<button type="button" class="btn btn-danger btn-lg">Supprimer du panier</button>
		</div>
		<img src="./public/image_produit/visa.png/" alt="visa">
		<img src="./public/image_produit/Vpay.png/" alt="Vpay">
		<img src="./public/image_produit/MasterCard.png/" alt="mastercard">
		<img src="./public/image_produit/Maestro.png/" alt="maestro">
		
	</div>

</div>
<div class="row">
	
	<div class="col-lg-2">
		<h1>Avis</h1>
	</div>
	<div class="col-lg-2">
		<h2>nom</h2>
	</div>
	<div class="col-lg-2">
		<h3>date</h3>
	</div>
	<div class="col-lg-2">
		<h4>Note</h4>
	</div>
	<div class="col-lg-4">
		<textarea name="" id="" cols="30" rows="10">commentaire</textarea>
	</div>
</div>




<br><br><!-- fin de la div container -->






