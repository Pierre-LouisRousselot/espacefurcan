{{ content() }}
{{ elements.getUser() }}

<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("users/index", "&larr; Go Back") }}
    </li>
</ul>

{% for user in page.items %}
{% if loop.first %}
<table class="table table-bordered table-striped" align="center">
    <thead>
        <tr>
            <th>Publication Date</th>
            <th>User</th>
        </tr>
    </thead>
    {% endif %}
    <tbody>
        <tr>
            <td>{{ user.id_Users }}</td>
            <td>{{ user.nom_Users }}<a class="edit-user" href="./edit/{{user.id_Users}}">&nbsp;edit</a>
                <a class="edit-user" href="./delete/{{user.id_Users}}">delete&nbsp;/</a></td>
            </tr>
        </tbody>
        {% if loop.last %}
    </table>
    {{ link_to("users/search", '<i class="icon-fast-backward"></i> First', "class": "btn") }}
    {{ link_to("users/search?page=" ~ page.before, 'Previous', "class": "btn") }}
    {{ link_to("users/search?page=" ~ page.next, 'Next', "class": "btn") }}
    {{ link_to("users/search?page=" ~ page.last, ' Last', "class": "btn") }}
    <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
    <p> {{ page.items|length }} users in total.</p>
    {% endif %}
    {% else %}
    No users are recorded
    {% endfor %}
