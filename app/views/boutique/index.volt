
</div>

<div class="row">
  <div class="col-lg-3 centrer">

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
    </div><br><br>

    <h5>Affiner vos recherches</h5><br>

    <!-- test affiner recherche -->

    <div class="filter-sidebar sidebar">
      <div class="row card-body py-2 mb-3 bg-dark twhite">
        <h5><i class="fa fa-car"></i>Affiner vos résultats</h5>
      </div>
      <div class="form-group">
        <select class="form-control" id="conditionsselect1">
          <option>Prix</option>
          <option>New</option>
          <option>Used</option>
        </select>
      </div>
      <div class="form-group">
        <select class="form-control" id="conditionsselect2">
          <option>Marque</option>
          <option>Compact</option>
          <option>Convertible</option>
          <option>Coupe</option>
          <option>Off-road</option>
          <option>Sedan</option>
        </select>
      </div>
      <div class="form-group">
        <select class="form-control" id="make1">
          <option>Annéé</option>
          <option>Ford</option>
          <option>Hyundai</option>
          <option>Kia</option>
          <option>Honda</option>
          <option>Skoda</option>
        </select>
      </div>
      <div class="form-group">
        <select class="form-control" id="make1">
          <option>Taille disque dur</option>
          <option>Accord</option>
          <option>Camry</option>
          <option>Civic</option>
          <option>Rapid</option>
          <option>Octavia</option>
        </select>
      </div>
      <div class="form-group">
        <select class="form-control" id="mileage1">
          <option>Mémoire RAM</option>
          <option>< 5000</option>
          <option>5000-10000</option>
          <option>10000-15000</option>
          <option>15000-20000</option>
          <option>20000-25000</option>
          <option>> 25000</option>
        </select>
      </div>
      <div class="form-group">
        <select class="form-control" id="year1">
          <option>Année</option>
          <option>2000</option>
          <option>2001</option>
          <option>2002</option>
          <option>2003</option>
          <option>2004</option>
          <option>2005</option>
          <option>2006</option>
          <option>2007</option>
          <option>2008</option>
          <option>2009</option>
          <option>2010</option>
        </select>
      </div>
      <div class="form-group">
        <select class="form-control" id="make1">
          <option>Transmission</option>
          <option>Automatic</option>
          <option>Manaul</option>
          <option>Semi-Automatic</option>
        </select>
      </div>
      <hr>
      <button type="btn" class="btn btn-primary">Rechercher</button>

    </div>
  </div>

  <div class="col-lg-9">
    <div class="row article textWhite">

      <!-- boucle for pour afficher tous les produits -->
      {% for produit in produits %}
      <!-- debut de col-lg-4 -->
      <div class="col-lg-4 produit">
        <!-- <div class="card-deck"> -->

        <h3>{{ produit.nom_Produit}}</h3>
        {{ image(produit.image_Produit)}}
        <h5><span>{{ produit.prix_Produit}} € </span></h5>
        <p class="card-text descriLimit">{{ produit.descri_Produit}}</p>

        <!-- Button trigger modal --><button type="button" alt="oeil" data-toggle= "modal" data-target= "#exampleModalLong-{{ produit.id_Produit}}" class="large material-icons" > loupe </button> <button type="button" class="large material-icons">add_shopping_cart </button>
        <!-- Modal -->
        <div class= "modal fade" id= "exampleModalLong-{{ produit.id_Produit}}" tabindex= "-1" role= "dialog" aria-labelledby= "exampleModalLongTitle" aria-hidden= "true" >
          <div class= "modal-dialog" role= "document" >
            <div class= "modal-content" >
              <div class= "modal-header" >
                <h5 class= "modal-title" id= "exampleModalLongTitle" > {{produit.nom_Produit}}
                </h5>
                <button type= "button" class= "close" data-dismiss= "modal" aria-label= "Close" >
                  <span aria-hidden= "true" > &times; </span>
                </button>
              </div>
              <div class= "modal-body" > {{ produit.descri_Produit}}
              </div>
              <div class= "modal-footer" >
                <h3> Prix : {{produit.prix_Produit}} € </h3>
                <button type= "button" class= "btn btn-danger" data-dismiss= "modal" > Fermer </button>
                <button type= "button" class= "btn btn-primary" > Ajouter au panier </button>
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
