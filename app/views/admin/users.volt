<h1>Tous les utilisateurs</h1>
<table class="table table-bordered table-striped">
    <thead>
        <tr>
            <td>Id</td>
            <td>Nom</td>
            <td>Prénom</td>
            <td>Mail</td>
            <td>Téléphone</td>
            <td>Adresse</td>
            <td>Ville</td>
            <td>Code postal</td>
            <td>Date d'inscription</td>
            <td>Date de mise à jour</td>
            <td>Date de dernière connexion</td>
        </tr>
    </thead>
    <tbody>
        {% for user in users %}
        <tr>
            <td>
                {{ user.id_Users }}
            </td>
            <td>
                {{ user.nom_Users }}
            {# <a class="edit-article" href="./edit/{{article.id}}">&nbsp;edit</a>
            <a class="edit-article" href="./delete/{{article.id}}">delete&nbsp;/</a> #}
            </td>
            <td>
                {{ user.prenom_Users }}
            </td>
            <td>
                {{ user.mail_Users }}
            </td>
            <td>
                {{ user.tel_Users }}
            </td>
            <td>
                {{ user.adresse_Users }}
            </td>
            <td>
                {{ user.ville_Users }}
            </td>
            <td>
                {{ user.postal_Users }}
            </td>
            <td>
                {{ user.dateCreation_Users }}
            </td>
            <td>
                {{ user.dateUpdate_Users }}
            </td>
            <td>
                {{ user.dateLastCo_Users }}
            </td>
        </tr>

    {% endfor %}
</tbody>
</table>
