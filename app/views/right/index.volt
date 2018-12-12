
{{ form("right/index", 'role': 'form','enctype': "multipart/form-data") }}
<h1>Modifier les droits d'un utilisateur</h1>

{% set i = 0 %}
<div class="form-user">
    <fieldset>

        {% for element in form %}

        <div class="form-group form-{{i}}">
            {{ element.label(['class': 'col-sm-3 col-md-2']) }}
            {{ element.render(['class': 'controls-new col-sm-9 col-md-10']) }}
        </div>
        {% set i += 1 %}
        {% endfor %}

    </fieldset>


{{ submit_button('Chercher', 'class': 'btn btn-primary', 'onclick': 'return SignUp.validate();') }}

</form>
</div>

{% if user is not empty %}
<div class="search-user">
    <p>Utilisateur trouvé :</p>
{{ user.nom_Users }} | {{ user.prenom_Users }} | {{ user.mail_Users }} | {{ user.dateCreation_Users }} | {{ user.id_Role }}

</div>


{% endif %}
{{ assets.outputCss() }}
{{ this.flashSession.output() }}
