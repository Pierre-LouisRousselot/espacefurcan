<link rel="stylesheet" type="text/css" href="/espacefurcan/public/css/boutique.css">
<link rel="stylesheet" type="text/css" href="/espacefurcan/public/css/pagination.css">


<div class="row">

    <div class="col-lg-3 affinerRecherche">

        <!-- <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Accueil</a></li>
        <li class="breadcrumb-item"><a href="#">Boutique</a></li>
        <li class="breadcrumb-item active" aria-current="page">Data</li>
    </ol>
</nav> -->


<div class="buttonRefresh">
    <button type="button" class="btn btn-dark" onclick ="refresh()">Refresh</button>
</div>

<div class="form-group">
    <label for="SelectCat">Catégorie</label>
    <select class="form-control" onchange="filtre()" id="SelectCat">
        <option value="0" selected disabled hidden>Séléctionner une catégorie</option>
        {% for categorie in categories %}

        <option value={{categorie.id_Categorie}}> {{ categorie.nom_Categorie }} </option>

        {% endfor %}
    </select>
</div>
<br><br>

<h5>Affiner vos recherches</h5><br>

<div class="form-group">
    <div class="form-group">
        <label for="SelectMarque">Marque</label>
        <select class="form-control" onchange="filtre()" id="SelectMarque">
            <option value="0" selected disabled hidden>Séléctionner une marque</option>
            {% for marque in marques %}

            <option value={{marque.id_Marque}}> {{ marque.nom_Marque }} </option>

            {% endfor %}
        </select>
    </div>

    <label for="customRange1">Prix</label>
    <input type="range" class="custom-range"  min="0" max="5" id="customRange1">
</div>
</div>
    <div class="data-container col-lg-9" ></div>
    <div class="row_article"></div>


</div><br><br><!-- fin de la div container -->

<script src="../public/js/jquery.min.js"></script>
<script src="http://pagination.js.org/dist/2.1.4/pagination.min.js"></script>
<script src="../public/js/boutique.js"></script>