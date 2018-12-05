
</div>
<div class="container-fluid navBoutique">

	<!-- navigation de la boutique -->

	<nav class="navbar navbar-light search" style="background-color: #e3f2fd;">
		<a href=""class="navbar-brand">Portable</a>
		<a href=""class="navbar-brand">Pc de bureau</a>
		<a href=""class="navbar-brand">Imprimante</a>
		<a href=""class="navbar-brand">Ecran</a>
		<a href=""class="navbar-brand">Tablette</a>
		<a href=""class="navbar-brand">Smartphone</a>
		<a href=""class="navbar-brand">Clavier/Souris</a>
		<a href=""class="navbar-brand">Accessoire</a>
		<form class="form-inline">
			<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
		</form>
	</nav>

	<!-- Fin de navigation de la boutique -->

	
	<div class="text-center" style="color:blue">
		<h2>Nos derniers articles</h2>
	</div><br>
	<div class="row">
		<div class="col-lg-2 centrer">

			<h4>Affiner vos recherches</h4><br>
			<nav class="navbar navbar-light bg-light">
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
						<button type="button" class="btn btn-white" data-toggle="modal" data-target="#exampleModalCenter">
							<h3>{{ produit.nom_Produit}}</h3>
							{{ image(produit.image_path)}}
							<h5><span>{{ produit.prix_Produit}} € </span></h5>
							<p class="card-text">{{ produit.descri_Produit}}</p>
						</button>
						<!-- Button trigger modal -->
				<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
										<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
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



