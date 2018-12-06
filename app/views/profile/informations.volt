
{{ content() }}

<div class="profile left">
    {{ form('profile/informations', 'id': 'profileForm', 'onbeforesubmit': 'return false','enctype': "multipart/form-data") }}
    <div class="control-group">
        <label class="control-label" for="name">Votre nom:</label>
        <div class="input input-informations">
            {{ text_field("name", "size": "30", "class": "span6 form-control") }}
            <div class="alert" id="name_alert">
                <strong>Warning!</strong> Please enter your full name
            </div>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="prenom">Votre prénom</label>
        <div class="input input-informations">
            {{ text_field("prenom", "size": "30", "class": "span6 form-control") }}
            <div class="alert" id="name_alert">
                <strong>Warning!</strong> Please enter your full name
            </div>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="tel">Votre prénom</label>
        <div class="input input-informations">
            {{ text_field("tel", "size": "30", "class": "span6 form-control") }}
            <div class="alert" id="name_alert">
                <strong>Warning!</strong> Please enter your full name
            </div>
        </div>
    </div>
    <div class="control-label" class="control-group">
        <label class="control-label" for="email">Email Address:</label>
        <div class="input input-informations">
            {{ text_field("email", "size": "30", "class": "span6 form-control") }}
            <div class="alert" id="email_alert">
                <strong>Warning!</strong> Please enter your email
            </div>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="adresse">Email Address:</label>
        <div class="input input-informations">
            {{ text_field("adresse", "size": "30", "class": "span6 form-control") }}
            <div class="alert" id="email_alert">
                <strong>Warning!</strong> Please enter your email
            </div>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="ville">Email Address:</label>
        <div class="input input-informations">
            {{ text_field("ville", "size": "30", "class": "span6 form-control") }}
            <div class="alert" id="email_alert">
                <strong>Warning!</strong> Please enter your email
            </div>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="postal">Email Address:</label>
        <div class="input input-informations">
            {{ text_field("postal", "size": "30", "class": "span6 form-control") }}
            <div class="alert" id="email_alert">
                <strong>Warning!</strong> Please enter your email
            </div>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="password">Mot de passe actuel</label>
        <div class="input input-informations">
            {{ password_field("password", "size": "30", "class": "span6 form-control") }}
            <div class="alert" id="email_alert">
                <strong>Warning!</strong> Please enter your email
            </div>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="newPassword">Nouveau mot de passe </label>
        <div class="input input-informations">
            {{ password_field("newPassword", "size": "30", "class": "span6 form-control") }}
            <div class="alert" id="email_alert">
                <strong>Warning!</strong> Please enter your email
            </div>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="repeatNewPassword">Répéter le nouveau mot de passe</label>
        <div class="input input-informations">
            {{ password_field("repeatNewPassword", "size": "30", "class": "span6 form-control") }}
            <div class="alert" id="email_alert">
                <strong>Warning!</strong> Please enter your email
            </div>
        </div>
    </div>


    {% if user.file_Users is not empty %}

    <p><b>Vous avez actuellement votre status en cours de validation</b></p>
    <p><b>Voici l'attestation que vous avez précédemment déposé : </b>
    <a target="_blank" href="../public/img-status/{{ user.nom_Users}}/{{user.file_Users}}">{{user.file_Users}}
     </a>

 {{ link_to('profile/deleteFile/' ~ user.file_Users, '<i class="material-icons delete-file">remove_circle</i>') }}
</p>

    {% else %}
    <div class="control-group row">
            <label for="input01" class="control-label label-file">Ajouter fichier pour validation de votre status </label>
            <label for="input01" class="control-label"><i class="material-icons add-file">add_circle</i></label>

        {{ file_field("file", "size": "30", "class": "jfilestyle", "id":"input01") }}
    </div>
    {% endif %}
    <div class="clearfix">
        <input type="button" value="Update" class="btn btn-primary btn-large btn-info" onclick="Profile.validate()">
        &nbsp;
        {{ link_to('profile/index', 'Cancel') }}
    </div>
</form>
</div>
