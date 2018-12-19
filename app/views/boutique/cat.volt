
<div class="row">
	<div class="col-lg-3">
		
		<div class="dropdown"><br>
			<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<h6>Catégories</h6>
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

			<fieldset>
				<legend>Mémore RAM</legend>
				<div class="form-group">
					<div class="custom-control custom-radio">
						<input type="radio" id="customRadio1" name="customRadio" class="custom-control-input" checked="">
						<label class="custom-control-label" for="customRadio1">4 RAM</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="customRadio2" name="customRadio" class="custom-control-input">
						<label class="custom-control-label" for="customRadio2">8 RAm</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="customRadio3" name="customRadio" class="custom-control-input">
						<label class="custom-control-label" for="customRadio3">8 RAM</label><br>
					</div>
				</div>


				<legend>Disque dur</legend>
				<div class="form-group">
					<div class="custom-control custom-radio">
						<input type="radio" id="customRadio1" name="customRadio" class="custom-control-input" checked="">
						<label class="custom-control-label" for="customRadio1">250 GB</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="customRadio2" name="customRadio" class="custom-control-input">
						<label class="custom-control-label" for="customRadio2">500GB</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="customRadio3" name="customRadio" class="custom-control-input">
						<label class="custom-control-label" for="customRadio3">1 TERA</label>
					</div>
				</div>
			</fieldset>
		</div>


	</div>
	<div class="col-lg-9">
		<div class="row article textWhite">
			{% for produit in produits %}
			<!-- debut de col-lg-4 -->
			<div class="col-lg-4 produit">
				{{ produit.nom_Produit}}
				{{ image( produit.image_Produit)}}
				<h5><span>{{ produit.prix_Produit}} € </span></h5>
				<p class="card-text descriLimit">{{ produit.descri_Produit}}</p>


				<!-- Button trigger modal -->
				<img class="img-fluid mr-sm-5" id="loupe" src="../image_produit/loupe-50x50.jpg"  alt="oeil" class= "" data-toggle= "modal" data-target= "#exampleModalLong-{{ produit.id_Produit}}" >
				<button type="button" class="btn btn-success"> Ajouter au panier </button>
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


</div>

<!-- Pagination -->



<!-- Fin de pagination -->


	</div><br><br><!-- fin de la div container -->