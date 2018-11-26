
  
<!-- <table border="2" cellpadding="15" cellspacing="2" width="100%">
   
 {% for produit in produits %}
     <tr>
     <th>Numéro du produit :</th>
     <td>{{ produit.id_Produit }}</td> 

     <th>Nom du produit :</th>
     <td>  {{ produit.nom_Produit}} </td>

    <th>Prix du produit : </th>
    <td> {{ produit.prix_Produit}} </td>


    <th>Description du produit : </th>
    <td> {{ produit.descri_Produit}} </td>

    <th>Nombre de produit en stock : </th>
    <td> {{ produit.stock_Produit}} </td>

    <th>Date d'ajout du produit : </th>
    <td> {{ produit.dateAjout_Produit}} </td>

    <th>Catégorie : </th>
    <td> {{ produit.id_Categorie}} </td>
    </tr>
{% endfor %}

</table> -->

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


   
   <!-- <tr>
      <th>Numéro du produit</th>
       <th>Nom du produit</th>
        <th>Prix du produit</th>
         <th>Description du produit</th>
          <th>Nombre de produit en stock</th>
      <th>Date de l'ajout du produit</th>
      <th>Description</th>
   </tr>
   <tr>
      <td> {{ produit.id_Produit }} </td>
      <td>Stuntman</td>
      <td>Cascadeur</td>
   </tr>
   
</table> -->