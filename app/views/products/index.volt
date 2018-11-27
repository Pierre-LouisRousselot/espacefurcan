
  
<h1 style="color:blue;text-align:center;"> Liste des produits </h1><br>

<button type="button" class="btn btn-primary btn-lg">Modifier</button>
<button type="button" class="btn btn-danger btn-lg">Supprimer</button>
<!-- /<a href="./addProduct"><button type="button" class="btn btn-success btn-lg">Ajouter</button></a> -->
{{ link_to("products/addProduct","Ajouter","class": "btn btn-success btn-lg")}}
<br><br>
<table class="table table-sm table-dark">

  <thead>
    
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Nom</th>
      <th scope="col">Prix</th>
      <th scope="col">Description</th>
      <th scope="col">Stock</th>
      <th scope="col">Date d'ajout</th>
      <th scope="col">Catégorie</th>
    </tr>
  </thead>
  {% for produit in produits %}
  <tbody>
    <tr>
      <td>{{ produit.id_Produit }}</td>
      <td> {{ produit.nom_Produit}}</td>
       <td> {{ produit.prix_Produit}}</td>
        <td> {{ produit.descri_Produit}}</td>
         <td> {{ produit.stock_Produit}}</td>
          <td> {{ produit.dateAjout_Produit}}</td>
           <td> {{ produit.id_Categorie}}</td>
    </tr>
     
  </tbody>
  {% endfor %}
</table>


   
   