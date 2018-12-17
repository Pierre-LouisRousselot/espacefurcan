{{ content() }}

<h2>Liste des utilisateurs</h2>
<p>Il y a
    <b>{{users|length}}
    </b>
    utilisateurs inscrits sur votre site
</p>
{{ link_to("users/display","Liste des utilisateurs inscrits sur votre site avec leurs informations") }}
<h2>Liste des utilisateurs dont le statut doit être vérifier</h2>
<p>Il y a
    <b>{{users_validation|length}}
    </b>
    utilisateurs dont le statut n'a pas été validé
    {{ link_to("users/validationStatut","Validez leur statut") }}
</p>
