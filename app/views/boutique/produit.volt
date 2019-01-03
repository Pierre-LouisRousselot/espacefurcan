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

</div><br><br>

<!-- Gestion des Avis et des commentaires -->

{% for avisBoucle in avisBoucle %}

<div class="row shadow p-3 mb-5 bg-white rounded">

	<div class="col-lg-3">
		
		<h5> {{ nom_User.nom_Users }} </h5>
		<h5>Posté le {{ avisBoucle.date_Avis }}</h5>
		<p>Note obtenue  {{ avisBoucle.note_Avis }} / 10 </p>
	</div>

	<div class="col-lg-6" style="text-align:center;">
		<p> {{ avisBoucle.commentaire_Avis }}</p>
	</div>
	<!-- test -->
	<!-- fin -->
	<div class="col-lg-3">
		
		<a href="#1" title="Donner 1 étoiles">☆</a>
		<a href="#2" title="Donner 2 étoiles">☆</a>
		<a href="#3" title="Donner 3 étoiles">☆</a>
		<a href="#4" title="Donner 4 étoiles">☆</a>
		<a href="#5" title="Donner 5 étoile">☆</a>
	</div>
</div>
</div>
{% endfor %}

<button id="b1" type="button" class="btn btn-warning">Ajouter un avis</button>
{{ form('boutique/produit/' ~ produit.id_Produit, 'id': 'avisForm', 'method': 'POST') }}
<!--     <label for="exampleFormControlSelect1">Donnez une note </label>
    <select class="form-control" id="exampleFormControlSelect1">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
      <option>5</option>
  </select> -->
  <!-- </div> -->
  <!-- <div class="rating">

  	<button type="button" value="1">☆</button>
  	<button type="button" value="2">☆</button>
  	<button type="button" value="3">☆</button>
  	<button type="button" value="4">☆</button>
  	<button type="button" value="5">☆</button> -->



  	<div class="control-group donneAvis">
  	<div class="rating">

  	<input  type="radio" name="avis" id="avis" value="1">☆</input>
  	<input  type="radio" name="avis" id="avis" value="2">☆</input>
  	<input  type="radio" name="avis" id="avis" value="3">☆</input>
  	<input  type="radio" name="avis" id="avis" value="4">☆</input>
  	<input  type="radio" name="avis" id="avis" value="5">☆</input>

  		
  		<div class="control-group">
  			{{ form.label('commentaire_Avis', ['class': 'control-label']) }}
  			<div class="controls">
  				{{ form.render('commentaire_Avis', ['class': 'form-control']) }}
  				<p class="help-block"></p>
  				<div class="alert alert-warning" id="telephone_alert">
  					Veuillez entrez le commentaire du produit.
  				</div>
  			</div>
  			<!-- <button id="b1" type="button" value="submit" class="btn btn-primary">Envoyer</button> -->
  			{{ submit_button('Envoyer', 'class': 'btn btn-primary', 'id': 'b1') }}
  		</div>
  	</div>

  	<!--  fin de gestion Avis et commentaire -->
  	<br><br><!-- fin de la div container -->






