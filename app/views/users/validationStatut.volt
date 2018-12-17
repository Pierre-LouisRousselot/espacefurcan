{{ content() }}

<h1>Liste des utilisateurs qui attendent la validation de leur statut</h1>
<table id="example" class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Adresse mail</th>
            <th>Téléphone </th>
            <th>Date inscription</th>
            <th>Date dernière connexion </th>
            <th>Fichier statut</th>
            <th>Statut</th>
            <th>Valider</th>
        </tr>
    </thead>
    <tbody>
        {% for users in page.items %}
        <tr>
            <td>{{ users.id_Users }}</td>
            <td>{{ users.nom_Users }}</td>
            <td>{{ users.mail_Users }}</td>
            <td>{{ users.tel_Users }}</td>
            <td>{{ users.dateCreation_Users }}</td>
            <td>{{ users.dateLastCo_Users }}</td>
            <td>   <a target="_blank" href="../public/img-status/{{ users.nom_Users}}/{{users.file_Users}}">{{users.file_Users}}
             </a></td>
            <td>
                {{form( 'role': 'form','method': 'post') }}
                {{ hidden_field("id_Users", "value":users.id_Users) }}
                {{ select("statut", statuts, 'using': ['id_Statut', 'type_Statut']) }}</td>
            <td>{{ submit_button("Sauvegarder", "value":"Sauvegarder", "class": "btn create") }}</form></td>
        </tr>

        {% endfor %}



    </tbody>
</table>
{{ link_to("/users/validationStatut?page=" ~ page.first,'<<', "class": "btn") }}
{{ link_to("/users/validationStatut?page=" ~ page.before,'<', "class": "btn") }}
{% set i = 1 %}
{% for i in 1..page.total_pages %}
{{ link_to("/users/validationStatut?page=" ~ i,i, "class": "btn") }}
{% set i += 1 %}
{% endfor %}
{{ link_to("/users/validationStatut?page=" ~ page.next,'>', "class": "btn") }}
{{ link_to("/users/validationStatut?page=" ~ page.last, '>>', "class": "btn") }}
<p class="help-inline">{{ page.current }}/{{ page.total_pages }}</p>
<p> {{ page.total_items }} users in total.</p>
