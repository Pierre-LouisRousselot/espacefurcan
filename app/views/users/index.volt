{{ content() }}

{{ elements.getUser() }}


<h1>All Users</h1>
<table class="table table-bordered table-striped">
    <thead>
        <tr>
            <td>Publication Date</td>
            <td>User</td>
        </tr>
    </thead>
    <tbody>
        {% for user in page.items %}
        <tr>
            <td >
                {{ user.id_Users }}
            </td>
            <td>
                {{ user.nom_Users }}
            <a class="edit-user" href="./edit/{{user.id_Users}}">&nbsp;edit</a>
            <a class="edit-user" href="./delete/{{user.id_Users}}">delete&nbsp;/</a>
            </td>
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

{{ link_to("users/new", "Add a New User") }}
{{ assets.outputCss() }}
{{ this.flashSession.output() }}
