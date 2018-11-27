
{{ content() }}

<div class="page-header">
    <h1>Ajouter un produit</h1>
</div>

{{ form('register', 'id': 'registerForm', 'onbeforesubmit': 'return false') }}

    <fieldset>

        <div class="control-group">
            {{ form.label('nom', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('nom', ['class': 'form-control']) }}
                <p class="help-block">(requis)</p>
                <div class="alert alert-warning" id="nom_alert">
                    Entrez le nom du produit
                </div>
            </div>
        </div>

        <div class="control-group">
            {{ form.label('prix', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('prix', ['class': 'form-control']) }}
                <p class="help-block">(requis)</p>
                <div class="alert alert-warning" id="prenom_alert">
                    Entrez le prix du produit.
                </div>
            </div>
        </div>

        <div class="control-group">
            {{ form.label('description', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('description', ['class': 'form-control']) }}
                <p class="help-block">(requis)</p>
                <div class="alert alert-warning" id="email_alert">
                 Entrez la description du produit.
                </div>
            </div>
        </div>

        <div class="control-group">
            {{ form.label('stock', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('stock', ['class': 'form-control']) }}
                <p class="help-block">(requis)</p>
                <div class="alert alert-warning" id="telephone_alert">
                   Entrez le nombre de produit en stock.
                </div>
            </div>
        </div>

        <div class="control-group">
            {{ form.label('date', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('date', ['class': 'form-control']) }}
                <p class="help-block"</p>
                <div class="alert alert-warning" id="telephone_alert">
                </div>
            </div>
        </div>

        <div class="control-group">
            {{ form.label('categorie', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('categorie', ['class': 'form-control']) }}
                <p class="help-block"></p>
                <div class="alert alert-warning" id="telephone_alert">
                   Entrez la catégorie du produit.
                </div>
            </div>
        </div>

        

        <div class="form-actions">
            {{ submit_button('Ajouter', 'class': 'btn btn-primary', 'onclick': 'return SignUp.validate();') }}
            <p class="help-block">En vous inscrivant, vous acceptez les termes d'utilisations et de confidentialités.</p>
        </div>

    </fieldset>
</form>
