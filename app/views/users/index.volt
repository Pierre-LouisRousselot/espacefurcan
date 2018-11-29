{{ content() }}

<h1>All Users</h1>
<table id="example" class="table table-bordered table-striped"  data-page-length='10'>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Adresse mail</th>
            <th>Téléphone </th>
            <th>Date inscription</th>
            <th>Date dernière connexion </th>
            <th>Edition</th>
            <th>Suppression</th>
        </tr>
    </thead>
    <tbody>
        {% for user in page.items %}
        <tr>
            <td>{{ user.id_Users }}</td>
            <td>{{ user.nom_Users }}</td>
            <td>{{ user.mail_Users }}</td>
            <td>{{ user.tel_Users }}</td>
            <td>{{ user.dateCreation_Users }}</td>
            <td>{{ user.dateLastCo_Users }}</td>
            <td>{{ link_to("users/edit/" ~ user.id_Users, '@') }}</td>
            <td>{{ link_to("users/delete/" ~ user.id_Users, 'X') }}</td>
        </tr>
        {% endfor %}
    </tbody>
</table>
{{ link_to("users/search", '<i class="icon-fast-backward"></i> First', "class": "btn") }}
{{ link_to("users/search?page=" ~ page.before,' Previous', "class": "btn") }}
{{ link_to("users/search?page=" ~ page.next,' Next', "class": "btn") }}
{{ link_to("users/search?page=" ~ page.last, 'Last', "class": "btn") }}
<span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
<p> {{ page.items|length }} users in total.</p>
{# {{ content() }}

{{ elements.getUser() }}

<h1>All Users</h1>
<table id="example" class="table table-bordered table-striped">
<thead>
<tr>
<th>ID utilisateur</th>
<th>Nom utilisateur</th>
<th>Mail utilisateurs</th>
<th>Date inscription</th>
<th>Date dernière connexion</th>
<th>Actions</th>
</tr>
</thead>
<tbody>
{% for user in page.items %}
<tr>
<td>{{ user.id_Users }}</td>
<td>{{ user.nom_Users }}</tr>
<td>{{ user.mail_Users }}</td>
<td>{{ user.dateCreation_Users }}</tr>
<td>{{ user.dateLastCo_Users }}</td>
<td>    {{ link_to("users/edit/" ~ user.id_Users, 'Edit This user / ') }}
{{ link_to("users/delete/" ~ user.id_Users, 'Delete This user') }}</td>

{% endfor %}
</tbody>
</table>
{{ link_to("users/search", '<i class="icon-fast-backward"></i> First', "class": "btn") }}
{{ link_to("users/search?page=" ~ page.before,' Previous', "class": "btn") }}
{{ link_to("users/search?page=" ~ page.next,' Next', "class": "btn") }}
{{ link_to("users/search?page=" ~ page.last, 'Last', "class": "btn") }}
<span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
<p> {{ page.items|length }} users in total.</p> #}
