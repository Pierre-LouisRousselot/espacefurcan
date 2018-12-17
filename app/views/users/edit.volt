
{{ form("users/save", 'role': 'form','enctype': "multipart/form-data") }}
<h1>Edit this user</h1>

{% set i = 0 %}
<div class="form-user">
    <fieldset>
        {% for element in form %}
        {% if is_a(element, 'Phalcon\Forms\Element\Hidden') %}
        {{ element }}



        {% else %}
        <div class="form-group form-{{i}}">
            {{ element.label(['class': 'col-sm-3 col-md-2']) }}
            {{ element.render(['class': 'controls-new col-sm-9 col-md-6']) }}

        </div>
        {% endif %}
        {% set i += 1 %}
        {% endfor %}

    </fieldset>

    <p>Le niveau de rôle actuel de l'utilisateur est <b>{{ role.nom_Role}}</b></p>
    <p>Le statut actuel de l'utilisateur est <b>{{ role.type_Statut}}</b></p>

    {% if user.file_Users is not empty %}


    <p><b>Voici le fichie en cours de validation : </b>
        {{ link_to("/public/img-status/" ~ user.nom_Users ~ "/" ~ user.file_Users, user.file_Users, "class": "btn cancel") }}
    </p>

     {% else %}

    <div class="control-group row">
        <h5>Aucun fichier en cours de validation pour cet utilisateur</h5>
    </div>
    {% endif %}

    {{ submit_button("Sauvegarder les changements", "class": "btn create") }}

    {{ link_to("users", "Retour", "class": "btn cancel") }}
    {{ link_to("users/delete/" ~ user.id_Users, 'Supprimer utilisateur', "class": "btn cancel") }}
</form>

</div>
