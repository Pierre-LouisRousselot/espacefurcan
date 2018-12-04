
</div>
<div class="container-fluid">

	
	<div class="text-center" style="color:blue">
		<h2>Nos derniers articles</h2>
	</div><br>

	<div class="breadcrumb"><img src="img/here.png" alt="Vous êtes ici :" class="here" /> <a href="…" class="first">Accueil</a><span class="sep"> &gt; </span><a href="…">Rubrique</a><span class="sep"> &gt; </span><a href="…">Sous-rubrique</a><span class="sep"> &gt; </span><strong class="on">Page courante</strong></div><br>

	<div class="row">
		<div class="col-lg-2">
			<h4 class="style text-center">Nos catégories</h4>
			<div class="list-group text-center">
				<a href="#" class="list-group-item active" title="Frameworks">
					Voir tous les produits
				</a>
				<a href="#" class="list-group-item" title="Bootstrap">Portable</a>
				<a href="#" class="list-group-item" title="Foundation">Pc de bureau</a>
				<a href="#" class="list-group-item" title="Knacss">Imprimante</a>
				<a href="#" class="list-group-item" title="Bootstrap">Ecran</a>
				<a href="#" class="list-group-item" title="Foundation">Tablette</a>
				<a href="#" class="list-group-item" title="Knacss">Smartphone</a>
				<a href="#" class="list-group-item" title="Knacss">Clavier / souris</a>
				<a href="#" class="list-group-item" title="Knacss">Accésssoires</a>
			</div>
		</div>
		<div class="col-lg-10">
			<div class="row article textWhite">

		<!-- boucle for pour afficher tous les produits -->
				{% for produit in produits %}
				<!-- debut de col-lg-4 -->
				<div class="col-lg-4 produit">
					<div class="card-deck">
						<div class="card">
							
							<div class="card-body">
								<h2 class="card-title" style="color:blue;text-align:center">{{ produit.nom_Produit}}</h2>>
								{{ image(produit.image_path)}}
								<h5>{{ produit.prix_Produit}} € </h5>
								<p class="card-text">{{ produit.descri_Produit}}</p>
							</div>
							<div class="card-footer">
								<button class="btn btn-success "><a href="#">Ajouter au panier</a></button>
								<button class="btn btn-info"><a href="#">Voir le détail</a></button>
							</div>
						</div>	
					</div>
				</div>
				<!-- fin de col-lg-4 -->
				{% endfor %}
		<!-- Fin de boucle for pour afficher tous les produits -->


				


			</div>
		</div>
	</div><br><br><!-- fin de la div container -->



