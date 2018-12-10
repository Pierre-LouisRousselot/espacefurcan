
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
            {{ element.render(['class': 'controls-new col-sm-9 col-md-10']) }}
        </div>
        {% endif %}
        {% set i += 1 %}
        {% endfor %}
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
    </fieldset>


    {{ submit_button("Save Changes", "class": "btn create") }}

    {{ link_to("users", "Cancel", "class": "btn cancel") }}
{{ link_to("users/delete/" ~ user.id_Users, 'Delete This user') }}
</form>
</div>
{{ assets.outputCss() }}
{{ this.flashSession.output() }}
