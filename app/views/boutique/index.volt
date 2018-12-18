<link rel="stylesheet" type="text/css" href="/espacefurcan/public/css/boutique.css">
<link rel="stylesheet" type="text/css" href="/espacefurcan/public/css/pagination.css">


<div class="row">

	<div class="col-lg-3 affinerRecherche">

		<!-- <nav aria-label="breadcrumb">
		<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">Accueil</a></li>
		<li class="breadcrumb-item"><a href="#">Boutique</a></li>
		<li class="breadcrumb-item active" aria-current="page">Data</li>
	</ol>
</nav> -->



<div class="dropdown"><br>
	<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		<h6>Catégories</h6>
	</button>
	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

		{% for categorie in categories %}

		<a class="dropdown-item" id="categorieFilter"  onclick="filtre({{categorie.id_Categorie}})"><span>{{ categorie.nom_Categorie }}</span></a>

		{# {{ link_to('boutique/cat/' ~ categorie.id_Categorie ,categorie.nom_Categorie) }}<br> #}

		{% endfor %}
	</div>


</div><br><br>


<h5>Affiner vos recherches</h5><br>

<div class="form-group">
	<div class="form-group">
		<label for="exampleSelect1">Marque</label>
		<select class="form-control" id="exampleSelect1">
			{% for produit in produits %}

			<option> {{ link_to('boutique/cat/'  ~  produit.nom_Produit,produit.nom_Produit) }} </option>

			{% endfor %}
		</select>
	</div>

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

</div>
<div class="col lg-9">
	<div class="data-container">

	</div>
	<div class="row_article">
	</div>
</div>


</div><br><br><!-- fin de la div container -->

<script src="../public/js/jquery.min.js"></script>
<script src="http://pagination.js.org/dist/2.1.4/pagination.min.js"></script>
<script src="../public/js/boutique.js"></script>
