{{ content() }}

<div class="page-header">
    <h1 style="color:blue;">Ajouter un produit</h1>
</div>

<div class="infoGlobal">

  <div class="infoNom">
    <label for="nomProduit">Nom du produit</label>
    <input type="text" name="nomProduit" value="">
  </div>
  <div class="infoDescri">
    <label for="descriProduit">Description du produit</label>
    <input type="textarea" name="descriProduit" value="">
  </div>
  <div class="infoPrix">
    <label for="prixProduit">Prix du produit</label>
    <input type="text" name="prixProduit" value="">
  </div>
  <div class="infoStock">
    <label for="stockProduit">Stock actuel du produit</label>
    <input type="text" name="stockProduit" value="">
  </div>
  <div class="form-group">
  	<label for="SelectCat">Catégorie</label>
  	<select class="form-control" onchange="selectProduct()" id="SelectCat">
  		<option value="0" selected disabled hidden>Séléctionner une catégorie</option>
  		{% for categorie in categories %}

  		<option value={{categorie.id_Categorie}}> {{ categorie.nom_Categorie }} </option>

  		{% endfor %}
  	</select>
  </div>
  <div class="infoSupp" id="addInfo">

  </div>

</div>

{{ form('products/addProduct', 'id': 'productForm', 'onbeforesubmit': 'return false',  'enctype': "multipart/form-data") }}

    <fieldset>

        <div class="control-group">
            {{ form.label('nom_Produit', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('nom_Produit', ['class': 'form-control']) }}
                <p class="help-block"></p>
                <div class="alert alert-warning" id="prenom_alert">
                    Veuillez entrez le nom du produit
                </div>
            </div>
        </div>

        <div class="control-group">
            {{ form.label('prix_Produit', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('prix_Produit', ['class': 'form-control']) }}
                <p class="help-block">(requis)</p>
                <div class="alert alert-warning" id="email_alert">
                     Veuillez entrez le prix du produit.
                </div>
            </div>
        </div>

        <div class="control-group">
            {{ form.label('descri_Produit', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('descri_Produit', ['class': 'form-control']) }}
                <p class="help-block">(requis)</p>
                <div class="alert alert-warning" id="telephone_alert">
                   Veuillez entrez la description du produit.
                </div>
            </div>
        </div>

        <div class="control-group">
            {{ form.label('stock_Produit', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('stock_Produit', ['class': 'form-control']) }}
                <p class="help-block">(requis)</p>
                <div class="alert alert-warning" id="telephone_alert">
                     veuillez entrez le nombre de produit en stock.
                </div>
            </div>
        </div>

        <div class="control-group">
            {{ form.label('id_Categorie', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('id_Categorie', ['class': 'form-control']) }}
                <p class="help-block">(requis)</p>
                <div class="alert alert-warning" id="telephone_alert">
                    Veuillez entrez la catégorie du produit
                </div>
            </div>
        </div>

        <div class="clearfix">
           {# <label for="email">Fichier</label> #}
           {# <div class="input"> #}
               {{ file_field("file", "size": "30", "class": "span6") }}
               <div class="alert" id="email_alert" style="color:red" >
                   <strong>Attention </strong> Veuillez entrez un format de fichier pdf jpg jpeg svp
               </div>
           {# </div> #}
       </div>


        <div class="form-actions">
            {{ submit_button('Ajouter', 'class': 'btn btn-primary') }}
            <p class="help-block">En vous inscrivant, vous acceptez les termes d'utilisations et de confidentialités.</p>
        </div>

    </fieldset>
</form>
<script src="/espacefurcan/public/js/produit.js"></script>
