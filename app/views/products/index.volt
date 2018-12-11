

<h1 style="color:blue;text-align:center;"> Liste des produits </h1><br>

{{ link_to("products/addProduct","Ajouter","class": "btn btn-success btn-lg")}}

<table id="example" class="table table-sm table-dark">

  <thead>

    <tr style="font-size:20px;color:blue;">
      <th scope="col">ID</th>
      <th scope="col">Nom</th>
      <th scope="col">Prix</th>
      <th scope="col">Description</th>
      <th scope="col">Stock</th>
      <th scope="col">Date d'ajout</th>
      <th scope="col">Catégorie</th>
      <th scope="col">Image</th>
      <th scope="col">Supprimer</th>
      <th scope="col">Modifier</th>
    </tr>
  </thead>
    <tbody>
  {% for produit in produits %}

    <tr>
      <td> {{ produit.id_Produit }}</td>
      <td> {{ produit.nom_Produit}}</td>
      <td> {{ produit.prix_Produit}} € </td>
      <td> {{ produit.descri_Produit}}</td>
      <td> {{ produit.stock_Produit}}</td>
      <td> {{ produit.dateAjout_Produit}}</td>
      <td> {{ produit.id_Categorie}}</td>
      <td> {{ image(produit.image_Produit,'style':'height:50px')}}</td>
      <td>{{ link_to("products/delete/" ~ produit.id_Produit, image('images/delete-wood-50x50.png','style':'height:30px')) }}</td>
      <td>{{ link_to("products/edit/" ~ produit.id_Produit,'Modifier','class':'btn btn-warning btn-lg') }}</td>
 </tr>


  {% endfor %}
    </tbody>
</table>
