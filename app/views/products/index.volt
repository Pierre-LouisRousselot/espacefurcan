<link rel="stylesheet" type="text/css" href="/espacefurcan/public/css/bootstrap-table.min.css">
<h2> Gestion des produits</h2>

{{ link_to("products/addProduct","add_box","class": "large material-icons")}}

<table id="table"
        data-toggle="table"
        data-search="true"
        data-show-columns="true"
        data-sortable="true">

  <thead>

    <tr >
      <th scope="col" data-sortable="true">ID</th>
      <th scope="col" data-sortable="true">Nom</th>
      <th scope="col" data-sortable="true">Prix (en €)</th>
      <th scope="col">Description</th>
      <th scope="col" data-sortable="true">Stock</th>
      <th scope="col" data-sortable="true">Date d'ajout</th>
      <th scope="col">Catégorie</th>
      <th scope="col">Image</th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>

    <tbody>
  {% for produit in produits %}

    <tr>
      <td> {{ produit.id_Produit }}</td>
      <td> {{ produit.nom_Produit}}</td>
      <td> {{ produit.prix_Produit}} </td>
      <td> {{ produit.descri_Produit}}</td>
      <td> {{ produit.stock_Produit}}</td>
      <td> {{ produit.dateAjout_Produit}}</td>
      <td> {{ produit.id_Categorie}}</td>
      <td> {{ image("image_produit/" ~ produit.image_Produit,'style':'height:50px')}}</td>

      <td>{{ link_to("products/edit/" ~ produit.id_Produit,"edit" ,"class": "large material-icons") }}</td>
      <td>{{ link_to("products/delete/" ~ produit.id_Produit,"delete" ,"class": "large material-icons") }}</td>

 </tr>


  {% endfor %}
    </tbody>
</table><br><br>



<script src="/espacefurcan/public/js/jquery.min.js"></script>
<script src="/espacefurcan/public/js/bootstrap.min.js"></script>
<script src="/espacefurcan/public/js/bootstrap-table.min.js"></script>
<script src="/espacefurcan/public/js/bootstrap-table-fr-FR.js"></script>
