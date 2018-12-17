{{ content() }}

<h1>Liste des utilisateurs</h1>
<table id="example" class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Adresse mail</th>
            <th>Téléphone </th>
            <th>Date inscription</th>
            <th>Date dernière connexion </th>
            <th>Rôle</th>
            <th>Edition</th>
            <th>Suppression</th>
        </tr>
    </thead>
    <tbody>
        {% for user in page.items %}
        <tr>
            <td>{{ user.users.id_Users }}</td>
            <td>{{ user.users.nom_Users }}</td>
            <td>{{ user.users.mail_Users }}</td>
            <td>{{ user.users.tel_Users }}</td>
            <td>{{ user.users.dateCreation_Users }}</td>
            <td>{{ user.users.dateLastCo_Users }}</td>
            <td>{{ user.roles.nom_Role }}</td>
            <td>{{ link_to("users/edit/" ~ user.users.id_Users,"edit" ,"class": "large material-icons") }}</td>
            <td>{{ link_to("users/delete/" ~ user.users.id_Users,"delete" ,"class": "large material-icons") }}</td>
        </tr>

        {% endfor %}



    </tbody>
</table>
{{ link_to("admin/users/index?page=" ~ page.first,'<<', "class": "btn") }}
{{ link_to("admin/users/index?page=" ~ page.before,'<', "class": "btn") }}
{% set i = 1 %}
{% for i in 1..page.total_pages %}
{{ link_to("admin/users/index?page=" ~ i,i, "class": "btn") }}
{% set i += 1 %}
{% endfor %}
{{ link_to("admin/users/index?page=" ~ page.next,'>', "class": "btn") }}
{{ link_to("admin/users/index?page=" ~ page.last, '>>', "class": "btn") }}
<p class="help-inline">{{ page.current }}/{{ page.total_pages }}</p>
<p> {{ page.total_items }} users in total.</p>
