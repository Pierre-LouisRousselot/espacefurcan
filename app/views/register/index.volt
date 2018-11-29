{{ content() }}
 <div class="page-header">
    <h1>Inscription</h1>
</div>
 {{ form('register', 'id': 'registerForm', 'onbeforesubmit': 'return false') }}
     <fieldset>
         <div class="control-group">
            {{ form.label('nom', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('nom', ['class': 'form-control']) }}
                <p class="help-block">(requis)</p>
                <div class="alert alert-warning" id="nom_alert">
                    <strong>Attention!</strong> Entrez votre nom complet
                </div>
            </div>
        </div>
         <div class="control-group">
            {{ form.label('prenom', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('prenom', ['class': 'form-control']) }}
                <p class="help-block">(requis)</p>
                <div class="alert alert-warning" id="prenom_alert">
                    <strong>Attention!</strong> Entrez votre prénom complet
                </div>
            </div>
        </div>
         <div class="control-group">
            {{ form.label('email', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('email', ['class': 'form-control']) }}
                <p class="help-block">(requis)</p>
                <div class="alert alert-warning" id="email_alert">
                    <strong>Attention!</strong> Entrez votre adresse mail
                </div>
            </div>
        </div>
         <div class="control-group">
            {{ form.label('telephone', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('telephone', ['class': 'form-control']) }}
                <p class="help-block">(requis)</p>
                <div class="alert alert-warning" id="telephone_alert">
                    <strong>Attention!</strong> Entrez votre numéro de téléphone
                </div>
            </div>
        </div>
         <div class="control-group">
            {{ form.label('adresse', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('adresse', ['class': 'form-control']) }}
                <p class="help-block">(requis)</p>
                <div class="alert alert-warning" id="telephone_alert">
                    <strong>Attention!</strong> Entrez votre adresse
                </div>
            </div>
        </div>
         <div class="control-group">
            {{ form.label('ville', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('ville', ['class': 'form-control']) }}
                <p class="help-block">(requis)</p>
                <div class="alert alert-warning" id="telephone_alert">
                    <strong>Attention!</strong> Entrez votre ville
                </div>
            </div>
        </div>
         <div class="control-group">
            {{ form.label('postal', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('postal', ['class': 'form-control']) }}
                <p class="help-block">(requis)</p>
                <div class="alert alert-warning" id="telephone_alert">
                    <strong>Attention!</strong> Entrez votre code postal
                </div>
            </div>
        </div>
         <div class="control-group">
            {{ form.label('password', ['class': 'control-label']) }}
            <div class="controls">
                {{ form.render('password', ['class': 'form-control', 'required' : true]) }}
                <p class="help-block">(minimum 8 caractères)</p>
                <div class="alert alert-warning" id="password_alert">
                    <strong>Attetion!</strong> Entrez une adresse mail valide
                </div>
            </div>
        </div>
         <div class="control-group">
            <label class="control-label" for="repeatPassword">Répéter le mot de passe</label>
            <div class="controls">
                {{ password_field('repeatPassword', 'class': 'form-control', 'required' : true) }}
                <div class="alert" id="repeatPassword_alert">
                    <strong>Attention!</strong> Le mot de passe ne correspond pas
                </div>
            </div>
        </div>
         <div class="form-actions">
            {{ submit_button('Register', 'class': 'btn btn-primary', 'onclick': 'return SignUp.validate();') }}
            <p class="help-block">En vous inscrivant, vous acceptez les termes d'utilisations et de confidentialités.</p>
        </div>
     </fieldset>
</form>
