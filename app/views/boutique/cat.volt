
<div class="row">
	<div class="col-lg-3">

	</div>
	<div class="col-lg-9">
		<div class="row article textWhite">
			{% for produit in produits %}
			<!-- debut de col-lg-4 -->
			<div class="col-lg-4 produit">
				{{ produit.nom_Produit}}
				{{ image(produit.image_Produit)}}
				<h5><span>{{ produit.prix_Produit}} € </span></h5>
				<p class="card-text descriLimit">{{ produit.descri_Produit}}</p>


				<!-- Button trigger modal --><img class="img-fluid mr-sm-5" id="loupe" src="../image_produit/loupe-50x50.jpg"  alt="oeil" class= "" data-toggle= "modal" data-target= "#exampleModalLong-{{ produit.id_Produit}}" > <button type="button" class="btn btn-success"> Ajouter au panier </button><!-- Modal --> <div class= "modal fade" id= "exampleModalLong-{{ produit.id_Produit}}" tabindex= "-1" role= "dialog" aria-labelledby= "exampleModalLongTitle" aria-hidden= "true" > <div class= "modal-dialog" role= "document" > <div class= "modal-content" > <div class= "modal-header" > <h5 class= "modal-title" id= "exampleModalLongTitle" > {{produit.nom_Produit}} </h5> <button type= "button" class= "close" data-dismiss= "modal" aria-label= "Close" > <span aria-hidden= "true" > &times; </span> </button> </div> <div class= "modal-body" > {{ produit.descri_Produit}} </div> <div class= "modal-footer" > <h3> Prix : {{produit.prix_Produit}} € </h3><button type= "button" class= "btn btn-danger" data-dismiss= "modal" > Fermer </button> <button type= "button" class= "btn btn-primary" > Ajouter au panier </button> </div> </div> </div> </div> 

			</div>
	
			{% endfor %}

		</div>
	</div>
</div>

<!-- Pagination -->



<!-- Fin de pagination -->


	</div><br><br><!-- fin de la div container -->