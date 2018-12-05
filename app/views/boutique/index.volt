
</div>
<div class="container-fluid navBoutique">

	<div class="text-center" style="color:blue">
		<h2>Nos derniers articles</h2>
	</div><br>
	<div class="row">
		<div class="col-lg-2 centrer">

			<div class="dropdown">
				<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<h6>Catégories</h6>
				</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<a class="dropdown-item" href="#">Pc de bureau</a>
					<a class="dropdown-item" href="#">Pc portable</a>
					<a class="dropdown-item" href="#">Ecran</a>
					<a class="dropdown-item" href="#">Imprimante</a>
					<a class="dropdown-item" href="#">Tablette</a>
					<a class="dropdown-item" href="#">Smartphone</a>
					<a class="dropdown-item" href="#">Clavier</a>
					<a class="dropdown-item" href="#">Souris</a>
					<a class="dropdown-item" href="#">Accessoires</a>
				</div>
			</div><br>

			<h4>Affiner vos recherches</h4><br>
			<nav class="navbar navbar-light bg-light affinerPrix">
				<form class="form-inline">
					<input class="form-control mr-sm-2" type="search" placeholder="Prix" aria-label="Search">

				</form>
			</nav>
		</div>

		<div class="col-lg-10">
			<div class="row article textWhite">

				<!-- boucle for pour afficher tous les produits -->
				{% for produit in produits %}
				<!-- debut de col-lg-4 -->
				<div class="col-lg-4 produit">
					<!-- <div class="card-deck"> -->

						<button type="button" class="btn btn-white" data-toggle="modal" data-target="#exampleModalCenter-{{produit.id_Produit}}">
							<h3>{{ produit.nom_Produit}}</h3>
							{{ image(produit.image_path)}}
							<h5><span>{{ produit.prix_Produit}} € </span></h5>
							<p class="card-text">{{ produit.descri_Produit}}</p>
						</button>
						<!-- Button trigger modal -->
						<div class="modal fade" id="exampleModalCenter-{{produit.id_Produit}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalCenterTitle">{{ produit.nom_Produit}}</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true"></span>
											
										</button>
									</div>
									<div class="modal-body">
										{{ produit.descri_Produit}}
									</div>
									<div class="modal-footer">
										<h2><span>{{ produit.prix_Produit}} € </span></h2>
										<button type="button" class="btn btn-danger" data-dismiss="modal">Fermer</button>
										<button type="button" class="btn btn-primary">Ajouter au panier</button>
									</div>
								</div>
							</div>
						</div>

					</div>
					<!-- 	</div> -->	
					{% endfor %}
				</div>
			</div>
		</div>
	</div><br><br><!-- fin de la div container -->



