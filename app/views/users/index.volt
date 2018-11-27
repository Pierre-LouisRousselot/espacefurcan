{{ content() }}

{{ elements.getUser() }}


<h1>All Users</h1>
<table class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>Publication Date</th>
            <th>User</th>
        </tr>
    </thead>
    <tbody>
        {% for user in page.items %}
        <tbody>
            <tr>
                <td>{{ user.id_Users }}</td>
                <td>{{ user.nom_Users }}<a class="edit-user" href="./edit/{{user.id_Users}}">&nbsp;edit</a>
                    <a class="edit-user" href="./delete/{{user.id_Users}}">delete&nbsp;/</a></td>
                </tr>
            </tbody>

    {% endfor %}
</tbody>
</table>
{{ link_to("users/search", '<i class="icon-fast-backward"></i> First', "class": "btn") }}
{{ link_to("users/search?page=" ~ page.before,' Previous', "class": "btn") }}
{{ link_to("users/search?page=" ~ page.next,' Next', "class": "btn") }}
{{ link_to("users/search?page=" ~ page.last, 'Last', "class": "btn") }}
<span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
<p> {{ page.items|length }} users in total.</p>
