
{{ content() }}

<div class="page-header">
    <h1 style="color:blue;">Modifier un produit</h1>
</div>
{{ form('products/save', 'id': 'productForm', 'onbeforesubmit': 'return false','enctype': "multipart/form-data") }}

<fieldset>

    <input type="hidden" id="id_Produit" name="id_Produit" value="{{produit.id_Produit}}">

    <div class="control-group">
        {{ form.label('nom_Produit', ['class': 'control-label']) }}
        <div class="controls">
            {{ form.render('nom_Produit', ['class': 'form-control']) }}
            <p class="help-block"></p>
            <div hidden class="alert alert-warning" id="nom_alert">
                Veuillez entrez le nom du produit
            </div>
        </div>
    </div>

    <div class="control-group">
        {{ form.label('prix_Produit', ['class': 'control-label']) }}
        <div class="controls">
            {{ form.render('prix_Produit', ['class': 'form-control']) }}
            <p class="help-block">(requis)</p>
            <div hidden class="alert alert-warning" id="prix_alert">
                Veuillez entrez le prix du produit.
            </div>
        </div>
    </div>

    <div class="control-group">
        {{ form.label('descri_Produit', ['class': 'control-label']) }}
        <div class="controls">
            {{ form.render('descri_Produit', ['class': 'form-control']) }}
            <p class="help-block">(requis)</p>
            <div hidden class="alert alert-warning" id="description_alert">
                Veuillez entrez la description du produit.
            </div>
        </div>
    </div>

    <div class="control-group">
        {{ form.label('stock_Produit', ['class': 'control-label']) }}
        <div class="controls">
            {{ form.render('stock_Produit', ['class': 'form-control']) }}
            <p class="help-block">(requis)</p>
            <div hidden class="alert alert-warning" id="stock_alert">
                veuillez entrez le nombre de produit en stock.
            </div>
        </div>
    </div>

    <div class="control-group">
        {{ form.label('id_Categorie', ['class': 'control-label']) }}
        <div class="controls">
            {{ form.render('id_Categorie', ['class': 'form-control']) }}
            <p class="help-block">(requis)</p>
            <div hidden class="alert alert-warning" id="categorie_alert">
                Veuillez entrez la catégorie du produit
            </div>
        </div>
    </div>

    <!--  image du produit -->

    {# <div class="clearfix">

        {{ file_field("file", "size": "30", "class": "span6") }}

    </div> #}
    <div hidden class="alert alert-warning" id="categorie_alert">
        Veuillez entrez l'image du produit
    </div>
    <br>
    {% if produit.image_Produit is not empty %}
    
        {{ image("public/image_produit/" ~ produit.image_Produit, 'style': "height: 100px")}}
        {{ link_to('products/deleteImageProduct/' ~ produit.id_Produit, '<i class="material-icons delete-file">remove_circle</i>') }}

    </p>

    {% else %}
    <div class="control-group row">
        <label for="input01" class="control-label label-file">Ajouter image produit </label>
        <label for="input01" class="control-label"><i class="material-icons add-file">add_circle</i></label>

        {{ file_field("file", "size": "30", "class": "jfilestyle", "id":"input01") }}
    </div>
    {% endif %}



    <div class="form-actions">
        {{ submit_button('Modifier', 'class': 'btn btn-primary') }}
        <p hidden class="help-block">En vous inscrivant, vous acceptez les termes d'utilisations et de confidentialités.</p>
    </div>

</fieldset>
</form>
